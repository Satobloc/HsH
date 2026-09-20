#!/usr/bin/env python3
"""Search permitted archive/project content and emit provenance-rich topical indexes.

This is a read-only discovery/indexing tool. It never changes source files and does
not assign theory authority. Topic/status labels are retrieval aids requiring review.

Supported inputs:
- ChatGPT-style raw conversation JSON (message-level records)
- generic JSON (scalar text leaves)
- TXT / MD / CSV / TSV / YAML / YML / PY / JS / HTML / XML
- PDF when pypdf is installed (optional; never OCRs)

Outputs:
- machine-readable JSON hits + topic graph
- human-readable Markdown topical/provenance index

Examples:
  python tools/search_archive_content.py . --query "star-shaped derivation"
  python tools/search_archive_content.py . --topics topics.json --out indexes/topical
  python tools/search_archive_content.py DEVELOPMENT_FULL_CONVOS WORKSPACES \
      --query "dimensional anchor" --query "constants network"
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from collections import Counter, defaultdict
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterable

TEXT_EXTS = {".txt",".md",".csv",".tsv",".yaml",".yml",".py",".js",".html",".htm",".xml",".tex",".rst"}
DEFAULT_EXCLUDES = {
    ".git","node_modules","__pycache__",".venv","venv","QUARANTINE","PRIOR_ART"
}
STATUS_PATTERNS = [
    ("correction", re.compile(r"\b(correction|correct(?:ed|ion)?|actually|rather|not quite|that's not|that is not)\b", re.I)),
    ("failed-branch", re.compile(r"\b(fail(?:ed|ure)?|dead end|doesn't work|does not work|reject(?:ed|ion)?|wrong)\b", re.I)),
    ("supersession-signal", re.compile(r"\b(supersed(?:e|ed|ing)|replace(?:d|ment)?|revert|no longer|instead)\b", re.I)),
    ("unresolved", re.compile(r"\b(unresolved|open question|not sure|unknown|pending|needs? (?:checking|review)|tbd)\b", re.I)),
    ("derivation", re.compile(r"\b(derive|derived|derivation|therefore|implies?|follows? from)\b", re.I)),
    ("proposal", re.compile(r"\b(propose|proposal|hypothesis|maybe|perhaps|could be|let's try|we should try)\b", re.I)),
]
WORD_RE = re.compile(r"[\w()+'’.-]+", re.UNICODE)

@dataclass
class Topic:
    name: str
    aliases: list[str]

@dataclass
class Record:
    path: str
    kind: str
    text: str
    title: str = ""
    conversation_id: str = ""
    message_id: str = ""
    speaker: str = ""
    role: str = ""
    timestamp: str = ""
    locator: str = ""
    viewer_url: str = ""

@dataclass
class Hit:
    topic: str
    matched_aliases: list[str]
    path: str
    kind: str
    title: str
    conversation_id: str
    message_id: str
    speaker: str
    role: str
    timestamp: str
    locator: str
    excerpt: str
    status_signals: list[str]
    related_topics: list[str]
    viewer_url: str
    source_sha256: str
    why_hit_matters: str

def norm(s: Any) -> str:
    return re.sub(r"\s+", " ", str(s or "")).strip()

def iso_time(value: Any) -> str:
    if value in (None, ""): return ""
    try:
        x=float(value)
        return datetime.fromtimestamp(x, timezone.utc).isoformat()
    except Exception:
        return norm(value)

def content_text(content: Any) -> str:
    if isinstance(content, str): return content
    if not isinstance(content, dict): return ""
    parts=content.get("parts")
    if isinstance(parts, list):
        out=[]
        for p in parts:
            if isinstance(p, str): out.append(p)
            elif isinstance(p, dict):
                for k in ("text","content","result","output"):
                    if isinstance(p.get(k), str): out.append(p[k])
        if out: return "\n".join(out)
    for k in ("text","result","output"):
        if isinstance(content.get(k), str): return content[k]
    return ""

def iter_conversation_messages(data: Any, path: Path) -> Iterable[Record]:
    if not isinstance(data, dict) or not isinstance(data.get("mapping"), dict):
        return
    title=norm(data.get("title") or path.stem)
    cid=norm(data.get("conversation_id") or data.get("id"))
    rows=[]
    for node_id,node in data["mapping"].items():
        if not isinstance(node, dict): continue
        msg=node.get("message")
        if not isinstance(msg, dict): continue
        text=content_text(msg.get("content"))
        if not norm(text): continue
        author=msg.get("author") if isinstance(msg.get("author"),dict) else {}
        role=norm(author.get("role"))
        speaker=norm(author.get("name") or role)
        mid=norm(msg.get("id") or node_id)
        ts=iso_time(msg.get("create_time"))
        rows.append((msg.get("create_time") or 0, mid, Record(
            path=str(path), kind="conversation-message", text=text, title=title,
            conversation_id=cid, message_id=mid, speaker=speaker, role=role,
            timestamp=ts, locator=f"message:{mid}"
        )))
    rows.sort(key=lambda x:(x[0] if isinstance(x[0],(int,float)) else 0,x[1]))
    for _,_,r in rows: yield r

def iter_json_scalars(obj: Any, path: Path, pointer: str="$") -> Iterable[Record]:
    if isinstance(obj, dict):
        for k,v in obj.items():
            yield from iter_json_scalars(v,path,f"{pointer}.{k}")
    elif isinstance(obj, list):
        for i,v in enumerate(obj):
            yield from iter_json_scalars(v,path,f"{pointer}[{i}]")
    elif isinstance(obj, str) and norm(obj):
        yield Record(path=str(path),kind="json-scalar",text=obj,title=path.stem,locator=pointer)

def iter_records(path: Path) -> Iterable[Record]:
    ext=path.suffix.lower()
    if ext==".json":
        try:
            data=json.loads(path.read_text(encoding="utf-8-sig"))
        except Exception:
            return
        conv=list(iter_conversation_messages(data,path) or [])
        if conv:
            yield from conv
        else:
            yield from iter_json_scalars(data,path)
        return
    if ext in TEXT_EXTS:
        try: text=path.read_text(encoding="utf-8-sig",errors="replace")
        except Exception: return
        for n,line in enumerate(text.splitlines(),1):
            if norm(line):
                yield Record(path=str(path),kind="text-line",text=line,title=path.stem,locator=f"line:{n}")
        return
    if ext==".pdf":
        try:
            from pypdf import PdfReader
            reader=PdfReader(str(path))
            for i,page in enumerate(reader.pages,1):
                text=page.extract_text() or ""
                if norm(text):
                    yield Record(path=str(path),kind="pdf-page",text=text,title=path.stem,locator=f"page:{i}")
        except Exception:
            return

def load_viewer_map(root: Path) -> dict[str,dict[str,Any]]:
    p=root/"CONVERSATION_VIEWER"/"data"/"conversations.json"
    if not p.exists(): return {}
    try:
        rows=json.loads(p.read_text(encoding="utf-8")).get("conversations",[])
    except Exception:
        return {}
    out={}
    for c in rows:
        for key in ("path","source_path"):
            val=c.get(key)
            if val: out[str(val).replace("\\","/")]=c
    return out

def viewer_link(c: dict[str,Any], message_id: str) -> str:
    cid=c.get("id")
    if not cid: return ""
    base=f"CONVERSATION_VIEWER/index.html?c={cid}"
    if message_id: base+=f"&message={message_id}"
    return base

def topic_regex(alias: str) -> re.Pattern[str]:
    # Phrase-friendly, punctuation-tolerant boundaries without substring bugs.
    bits=[re.escape(x) for x in WORD_RE.findall(alias.casefold())]
    if not bits:
        bits=[re.escape(alias.casefold())]
    body=r"\W+".join(bits)
    return re.compile(rf"(?<!\w){body}(?!\w)",re.I)

def load_topics(args: argparse.Namespace) -> list[Topic]:
    topics=[]
    if args.topics:
        data=json.loads(args.topics.read_text(encoding="utf-8"))
        rows=data.get("topics",data) if isinstance(data,dict) else data
        for row in rows:
            if isinstance(row,str): topics.append(Topic(row,[row]))
            elif isinstance(row,dict):
                name=norm(row.get("topic") or row.get("name"))
                aliases=[norm(x) for x in row.get("aliases",[]) if norm(x)]
                if name: topics.append(Topic(name,list(dict.fromkeys([name]+aliases))))
    for q in args.query or []:
        topics.append(Topic(q,[q]))
    dedup={}
    for t in topics: dedup[t.name.casefold()]=t
    return list(dedup.values())

def excerpt(text: str, patterns: list[re.Pattern[str]], width: int) -> str:
    flat=norm(text)
    pos=min((m.start() for p in patterns if (m:=p.search(flat))),default=0)
    lo=max(0,pos-width//2); hi=min(len(flat),lo+width)
    s=flat[lo:hi]
    return ("…" if lo else "")+s+("…" if hi<len(flat) else "")

def status_signals(text: str) -> list[str]:
    return [name for name,pat in STATUS_PATTERNS if pat.search(text)]

def source_sha(path: Path, cache: dict[str,str]) -> str:
    k=str(path)
    if k not in cache:
        try: cache[k]=hashlib.sha256(path.read_bytes()).hexdigest()
        except Exception: cache[k]=""
    return cache[k]

def permitted_files(roots: list[Path], excludes: set[str], max_bytes: int) -> Iterable[Path]:
    seen=set()
    for root in roots:
        if root.is_file():
            candidates=[root]
        else:
            candidates=root.rglob("*")
        for p in candidates:
            if not p.is_file(): continue
            try: rel=p.resolve()
            except Exception: rel=p
            if rel in seen: continue
            seen.add(rel)
            if any(part in excludes for part in p.parts): continue
            if p.suffix.lower() not in TEXT_EXTS|{".json",".pdf"}: continue
            try:
                if p.stat().st_size>max_bytes: continue
            except OSError: continue
            yield p

def main() -> int:
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("roots",nargs="+",type=Path)
    ap.add_argument("--query",action="append",help="Topic/query; repeatable")
    ap.add_argument("--topics",type=Path,help='JSON: [{"topic":"x","aliases":["y"]}]')
    ap.add_argument("--out",type=Path,default=Path("indexes/topical/search"))
    ap.add_argument("--exclude",action="append",default=[])
    ap.add_argument("--max-bytes",type=int,default=25_000_000)
    ap.add_argument("--excerpt-chars",type=int,default=360)
    ap.add_argument("--viewer-root",type=Path,default=Path("."))
    args=ap.parse_args()
    topics=load_topics(args)
    if not topics: ap.error("provide --query and/or --topics")
    excludes=DEFAULT_EXCLUDES|set(args.exclude)
    compiled={t.name:[topic_regex(a) for a in t.aliases] for t in topics}
    viewer=load_viewer_map(args.viewer_root)
    sha_cache={}
    hits=[]
    topic_counts=Counter()
    edge_counts=Counter()
    scanned_files=0
    scanned_records=0
    for path in permitted_files(args.roots,excludes,args.max_bytes):
        scanned_files+=1
        try: rel=path.relative_to(args.viewer_root).as_posix()
        except Exception: rel=path.as_posix()
        vc=viewer.get(rel) or viewer.get(path.as_posix())
        for rec in iter_records(path):
            scanned_records+=1
            present=[]
            aliases_by_topic={}
            for t in topics:
                found=[a for a,p in zip(t.aliases,compiled[t.name]) if p.search(rec.text)]
                if found:
                    present.append(t.name); aliases_by_topic[t.name]=found
            if not present: continue
            for i,a in enumerate(sorted(set(present))):
                for b in sorted(set(present))[i+1:]: edge_counts[(a,b)]+=1
            for name in present:
                pats=compiled[name]
                rel_topics=sorted(x for x in present if x!=name)
                signals=status_signals(rec.text)
                topic_counts[name]+=1
                url=viewer_link(vc or {},rec.message_id)
                hits.append(Hit(
                    topic=name,matched_aliases=aliases_by_topic[name],path=rel,kind=rec.kind,
                    title=rec.title,conversation_id=rec.conversation_id,message_id=rec.message_id,
                    speaker=rec.speaker,role=rec.role,timestamp=rec.timestamp,locator=rec.locator,
                    excerpt=excerpt(rec.text,pats,args.excerpt_chars),status_signals=signals,
                    related_topics=rel_topics,viewer_url=url,source_sha256=source_sha(path,sha_cache),
                    why_hit_matters=("co-occurs with "+", ".join(rel_topics) if rel_topics else
                                     ("contains "+", ".join(signals)+" signal(s)" if signals else "direct topic match"))
                ))
    hits.sort(key=lambda h:(h.topic.casefold(),h.timestamp or "9999",h.path,h.locator))
    args.out.mkdir(parents=True,exist_ok=True)
    generated=datetime.now(timezone.utc).isoformat()
    payload={
        "schema_version":1,"generated_at_utc":generated,
        "tool":"tools/search_archive_content.py",
        "roots":[str(x) for x in args.roots],
        "excluded_path_names":sorted(excludes),
        "topics":[asdict(t) for t in topics],
        "coverage":{"files_scanned":scanned_files,"records_scanned":scanned_records,"hits":len(hits)},
        "status_note":"status_signals are lexical retrieval aids, not authoritative disposition",
        "hits":[asdict(h) for h in hits],
        "concept_graph":{"edges":[{"source":a,"target":b,"cooccurrence_records":n}
                                  for (a,b),n in edge_counts.most_common()]}
    }
    (args.out/"TOPICAL_INDEX.json").write_text(json.dumps(payload,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    lines=["# Topical / Provenance Index","",f"Generated: {generated}",
           f"Coverage: {scanned_files:,} files; {scanned_records:,} records; {len(hits):,} topic hits.",
           "","Status labels below are lexical retrieval signals, not theory authority or final supersession judgments.",""]
    by_topic=defaultdict(list)
    for h in hits: by_topic[h.topic].append(h)
    for t in topics:
        rows=by_topic.get(t.name,[])
        lines += [f"## {t.name}","",f"Aliases: {', '.join(t.aliases)}  ",f"Hits: {len(rows)}",""]
        for h in rows:
            when=f" — {h.timestamp}" if h.timestamp else ""
            who=f" — {h.speaker or h.role}" if (h.speaker or h.role) else ""
            lines.append(f"- **{h.title or Path(h.path).name}**{when}{who}")
            lines.append(f"  - Source: `{h.path}` · `{h.locator}`"+(f" · CID `{h.conversation_id}`" if h.conversation_id else ""))
            if h.message_id: lines.append(f"  - Message: `{h.message_id}`")
            if h.viewer_url: lines.append(f"  - Viewer: `{h.viewer_url}`")
            if h.status_signals: lines.append(f"  - Status signals: {', '.join(h.status_signals)}")
            if h.related_topics: lines.append(f"  - Related indexed topics: {', '.join(h.related_topics)}")
            lines.append(f"  - Why this hit matters: {h.why_hit_matters}")
            lines.append(f"  - Excerpt: “{h.excerpt}”")
        lines.append("")
    lines += ["## Lightweight concept graph",""]
    if edge_counts:
        for (a,b),n in edge_counts.most_common():
            lines.append(f"- `{a}` ↔ `{b}` — {n} co-occurring record(s)")
    else:
        lines.append("_No topic co-occurrences in this run._")
    lines += ["","## Chronology / supersession use","",
              "Within each topic, timestamped conversation hits are ordered chronologically. "
              "Correction/supersession labels are candidate signals only. Human or provenance-aware review "
              "should link first appearance → elaboration → later use → correction/supersession explicitly "
              "rather than treating lexical detection as disposition.",""]
    (args.out/"TOPICAL_INDEX.md").write_text("\n".join(lines),encoding="utf-8")
    print(json.dumps({"files_scanned":scanned_files,"records_scanned":scanned_records,
                      "hits":len(hits),"topics":dict(topic_counts),
                      "json":str(args.out/"TOPICAL_INDEX.json"),
                      "markdown":str(args.out/"TOPICAL_INDEX.md")},ensure_ascii=False))
    return 0

if __name__=="__main__":
    raise SystemExit(main())

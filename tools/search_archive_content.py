#!/usr/bin/env python3
"""Mercer_Searcher_1.0 — transparent multi-format archive search with Boolean/NEAR queries.

Read-only. Default exclusions include QUARANTINE and PRIOR_ART. Search results and
lexical status signals are discovery aids, never source-authority/currentness judgments.

Query examples:
  '"star shaped" NEAR/12 derivation'
  '(helix OR helical) AND author:user AND date:2026-06-01..2026-07-31'
  'title:"Geometry in Physics" AND NOT author:assistant'
Operators: AND, OR, NOT, parentheses, quoted phrases, NEAR or NEAR/n.
Fields: body, math, name, path, ext, type/kind, has, author/speaker, role, title, conversation/cid, date, status.\nInventory fields name/path/ext support shell-style * and ? wildcards.
"""
from __future__ import annotations
import argparse,csv,fnmatch,hashlib,json,re,shlex
from collections import Counter,defaultdict
from dataclasses import asdict,dataclass
from datetime import datetime,timezone
from pathlib import Path
from typing import Any,Iterable

TEXT_EXTS={".txt",".md",".csv",".tsv",".yaml",".yml",".py",".js",".html",".htm",".xml",".tex",".rst"}
DEFAULT_EXCLUDES={".git","node_modules","__pycache__",".venv","venv","QUARANTINE","PRIOR_ART"}
TOOL_NAME="Mercer_Searcher_1.1-dev"
TOOL_VERSION="1.1-dev"
WORD_RE=re.compile(r"\w+(?:['’.-]\w+)*",re.UNICODE)
STATUS_PATTERNS=[
 ("correction",re.compile(r"\b(correction|correct(?:ed|ion)?|actually|rather|not quite|that's not|that is not)\b",re.I)),
 ("failed-branch",re.compile(r"\b(fail(?:ed|ure)?|dead end|doesn't work|does not work|reject(?:ed|ion)?|wrong)\b",re.I)),
 ("supersession-signal",re.compile(r"\b(supersed(?:e|ed|ing)|replace(?:d|ment)?|revert|no longer|instead)\b",re.I)),
 ("unresolved",re.compile(r"\b(unresolved|open question|not sure|unknown|pending|needs? (?:checking|review)|tbd)\b",re.I)),
 ("derivation",re.compile(r"\b(derive|derived|derivation|therefore|implies?|follows? from)\b",re.I)),
 ("proposal",re.compile(r"\b(propose|proposal|hypothesis|maybe|perhaps|could be|let's try|we should try)\b",re.I))]
TOKENIZER=re.compile(r'[A-Za-z_][\w-]*:"(?:\\.|[^"\\])*"|"(?:\\.|[^"\\])*"|\(|\)|\b(?:AND|OR|NOT)\b|\bNEAR(?:/\d+)?\b|[^\s()]+',re.I)
PRECEDENCE={"OR":1,"AND":2,"NEAR":3,"NOT":4}

@dataclass
class Record:
 path:str;kind:str;text:str;title:str="";conversation_id:str="";message_id:str=""
 speaker:str="";role:str="";timestamp:str="";locator:str="";viewer_url:str=""
@dataclass
class Eval:
 ok:bool; positions:list[int]; terms:list[str]; trace:list[str]; near:list[dict[str,Any]]
@dataclass
class Hit:
 query:str;path:str;kind:str;title:str;conversation_id:str;message_id:str;speaker:str;role:str
 timestamp:str;locator:str;excerpt:str;status_signals:list[str];viewer_url:str;source_sha256:str
 matched_terms:list[str];near_matches:list[dict[str,Any]];match_trace:list[str];topic_hits:list[str]

def norm(x:Any)->str:return re.sub(r"\s+"," ",str(x or "")).strip()
def iso_time(x:Any)->str:
 if x in (None,""):return ""
 try:return datetime.fromtimestamp(float(x),timezone.utc).isoformat()
 except:return norm(x)
def content_text(c:Any)->str:
 if isinstance(c,str):return c
 if not isinstance(c,dict):return ""
 out=[]
 for p in c.get("parts",[]) if isinstance(c.get("parts"),list) else []:
  if isinstance(p,str):out.append(p)
  elif isinstance(p,dict):
   out.extend(str(p[k]) for k in ("text","content","result","output") if isinstance(p.get(k),str))
 if out:return "\n".join(out)
 return next((c[k] for k in ("text","result","output") if isinstance(c.get(k),str)),"")
def iter_conversation(data:Any,path:Path)->Iterable[Record]:
 if not isinstance(data,dict) or not isinstance(data.get("mapping"),dict):return
 title=norm(data.get("title") or path.stem);cid=norm(data.get("conversation_id") or data.get("id"));rows=[]
 for nid,node in data["mapping"].items():
  msg=node.get("message") if isinstance(node,dict) else None
  if not isinstance(msg,dict):continue
  text=content_text(msg.get("content"))
  if not norm(text):continue
  au=msg.get("author") if isinstance(msg.get("author"),dict) else {}
  role=norm(au.get("role"));speaker=norm(au.get("name") or role);mid=norm(msg.get("id") or nid)
  rows.append((msg.get("create_time") or 0,mid,Record(str(path),"conversation-message",text,title,cid,mid,speaker,role,iso_time(msg.get("create_time")),f"message:{mid}")))
 rows.sort(key=lambda x:(x[0] if isinstance(x[0],(int,float)) else 0,x[1]))
 for _,_,r in rows:yield r
def iter_json(obj:Any,path:Path,pointer:str="$")->Iterable[Record]:
 if isinstance(obj,dict):
  for k,v in obj.items():yield from iter_json(v,path,f"{pointer}.{k}")
 elif isinstance(obj,list):
  for i,v in enumerate(obj):yield from iter_json(v,path,f"{pointer}[{i}]")
 elif isinstance(obj,str) and norm(obj):yield Record(str(path),"json-scalar",obj,path.stem,locator=pointer)
def iter_records(path:Path)->Iterable[Record]:
 ext=path.suffix.lower()
 if ext==".json":
  try:data=json.loads(path.read_text(encoding="utf-8-sig"))
  except:return
  conv=list(iter_conversation(data,path) or [])
  yield from (conv if conv else iter_json(data,path));return
 if ext in TEXT_EXTS:
  try:lines=path.read_text(encoding="utf-8-sig",errors="replace").splitlines()
  except:return
  for n,line in enumerate(lines,1):
   if norm(line):yield Record(str(path),"text-line",line,path.stem,locator=f"line:{n}")
 elif ext==".pdf":
  try:
   from pypdf import PdfReader
   for n,page in enumerate(PdfReader(str(path)).pages,1):
    text=page.extract_text() or ""
    if norm(text):yield Record(str(path),"pdf-page",text,path.stem,locator=f"page:{n}")
  except:return

def load_viewer(root:Path)->dict[str,dict[str,Any]]:
 p=root/"CONVERSATION_VIEWER"/"data"/"conversations.json"
 if not p.exists():return {}
 try:rows=json.loads(p.read_text(encoding="utf-8")).get("conversations",[])
 except:return {}
 out={}
 for c in rows:
  for k in ("path","source_path"):
   if c.get(k):out[str(c[k]).replace("\\","/")]=c
 return out
def viewer_link(c:dict[str,Any],mid:str)->str:
 if not c.get("id"):return ""
 s=f"CONVERSATION_VIEWER/index.html?c={c['id']}"
 return s+(f"&message={mid}" if mid else "")
def words(text:str)->list[str]:return [m.group(0).casefold() for m in WORD_RE.finditer(text)]
def phrase_positions(text:str,phrase:str)->list[int]:
 needle=words(phrase);hay=words(text)
 if not needle:return []
 n=len(needle);return [i for i in range(len(hay)-n+1) if hay[i:i+n]==needle]
def status(text:str)->list[str]:return [n for n,p in STATUS_PATTERNS if p.search(text)]
def math_norm(text:str)->str:
 s=str(text or "").casefold()
 repl={"π":"pi","θ":"theta","ϕ":"phi","φ":"phi","τ":"tau","δ":"delta","×":"*","·":"*","⋅":"*","÷":"/","−":"-","–":"-","≈":"~"}
 for x,y in repl.items():s=s.replace(x,y)
 cmds={"\\pi":"pi","\\theta":"theta","\\phi":"phi","\\varphi":"phi","\\tau":"tau","\\delta":"delta",
       "\\cdot":"*","\\times":"*","\\div":"/","\\approx":"~","\\left":"","\\right":""}
 for x,y in cmds.items():s=s.replace(x,y)
 frac=re.compile(r"\\frac\s*\{([^{}]+)\}\s*\{([^{}]+)\}")
 for _ in range(8):
  ns=frac.sub(r"(\1)/(\2)",s)
  if ns==s:break
  s=ns
 s=s.replace("{","(").replace("}",")")
 s=re.sub(r"\s+","",s)
 s=re.sub(r"\(([-+]?\d+(?:\.\d+)?)\)",r"\1",s)
 s=re.sub(r"(?<=\d)(?=[a-z(])","*",s)
 return s
def unquote(s:str)->str:
 s=s.strip()
 if len(s)>=2 and s[0]==s[-1]=='"':
  try:return json.loads(s)
  except json.JSONDecodeError:return s[1:-1]
 return s
def tokenize(q:str)->list[str]:
 raw=TOKENIZER.findall(q);out=[];prev=None
 for tok in raw:
  typ=("LP" if tok=="(" else "RP" if tok==")" else "OP" if re.fullmatch(r"AND|OR|NOT|NEAR(?:/\d+)?",tok,re.I) else "TERM")
  if prev in ("TERM","RP") and typ in ("TERM","LP") or prev in ("TERM","RP") and tok.upper()=="NOT":
   out.append("AND")
  out.append(tok);prev=typ
 return out
def rpn(q:str)->list[str]:
 out=[];ops=[]
 for tok in tokenize(q):
  up=tok.upper()
  if tok=="(":ops.append(tok)
  elif tok==")":
   while ops and ops[-1]!="(":out.append(ops.pop())
   if not ops:raise ValueError("unmatched )")
   ops.pop()
  elif up in ("AND","OR","NOT") or up.startswith("NEAR"):
   op="NEAR" if up.startswith("NEAR") else up
   while ops and ops[-1]!="(" and PRECEDENCE.get(("NEAR" if ops[-1].upper().startswith("NEAR") else ops[-1].upper()),0)>=PRECEDENCE[op]:
    out.append(ops.pop())
   ops.append(tok)
  else:out.append(tok)
 while ops:
  if ops[-1]=="(":raise ValueError("unmatched (")
  out.append(ops.pop())
 return out
def field_eval(rec:Record,term:str)->Eval|None:
 if ":" not in term:return None
 field,val=term.split(":",1);field=field.casefold();val=unquote(val).casefold()
 p=Path(rec.path);ext=p.suffix.casefold().lstrip(".");name=p.name.casefold()
 if field=="body":
  pos=phrase_positions(rec.text,val);ok=bool(pos)
  return Eval(ok,pos,[term] if ok else [],[f"FIELD body:{val!r} => {len(pos)} occurrence(s)"],[])
 if field=="math":
  target=math_norm(rec.text);needle=math_norm(val);ok=bool(needle) and needle in target
  return Eval(ok,[],[term] if ok else [],[f"FIELD math:{needle!r} => {ok}"],[])
 if field in ("name","path","ext"):
  target={"name":name,"path":rec.path.casefold(),"ext":ext}[field]
  ok=fnmatch.fnmatchcase(target,val) if any(ch in val for ch in "*?[") else val in target
  return Eval(ok,[],[term] if ok else [],[f"FIELD {field}:{val!r} => {ok}"],[])
 if field in ("type","kind"):
  ok=val in rec.kind.casefold()
  return Eval(ok,[],[term] if ok else [],[f"FIELD {field}:{val!r} => {ok}"],[])
 if field=="has":
  flags={"conversation-source":rec.kind=="conversation-message","pdf-source":rec.kind=="pdf-page",
         "text-source":rec.kind in ("text-line","json-scalar","conversation-message"),
         "message-id":bool(rec.message_id),"conversation-id":bool(rec.conversation_id),"viewer":bool(rec.viewer_url)}
  ok=flags.get(val,False)
  return Eval(ok,[],[term] if ok else [],[f"FIELD has:{val} => {ok}"],[])
 fmap={"author":rec.speaker or rec.role,"speaker":rec.speaker,"role":rec.role,"title":rec.title,
       "conversation":rec.conversation_id,"cid":rec.conversation_id,"date":rec.timestamp[:10],"status":" ".join(status(rec.text))}
 if field not in fmap:return None
 target=(fmap[field] or "").casefold()
 if field=="date" and ".." in val:
  lo,hi=val.split("..",1);ok=(not lo or target>=lo) and (not hi or target<=hi)
 else:ok=val in target
 return Eval(ok,[],[term] if ok else [],[f"FIELD {field}:{val!r} => {ok}"],[])
def term_eval(rec:Record,term:str)->Eval:
 fe=field_eval(rec,term)
 if fe is not None:return fe
 val=unquote(term);pos=phrase_positions(rec.text,val);ok=bool(pos)
 return Eval(ok,pos,[val] if ok else [],[f"TERM {val!r} => {len(pos)} occurrence(s)"],[])
def evaluate(rec:Record,query:str,default_near:int)->Eval:
 st=[]
 for tok in rpn(query):
  up=tok.upper()
  if up=="NOT":
   a=st.pop();st.append(Eval(not a.ok,[],[],a.trace+[f"NOT => {not a.ok}"],a.near));continue
  if up in ("AND","OR") or up.startswith("NEAR"):
   b=st.pop();a=st.pop()
   if up=="AND":st.append(Eval(a.ok and b.ok,a.positions+b.positions,a.terms+b.terms,a.trace+b.trace+[f"AND => {a.ok and b.ok}"],a.near+b.near))
   elif up=="OR":st.append(Eval(a.ok or b.ok,a.positions+b.positions,a.terms+b.terms,a.trace+b.trace+[f"OR => {a.ok or b.ok}"],a.near+b.near))
   else:
    win=int(up.split("/",1)[1]) if "/" in up else default_near
    pairs=[(x,y,abs(x-y)) for x in a.positions for y in b.positions]
    best=min(pairs,key=lambda z:z[2]) if pairs else None
    ok=a.ok and b.ok and best is not None and best[2]<=win
    detail={"window":win,"left_position":best[0],"right_position":best[1],"distance_tokens":best[2]} if best else {"window":win,"distance_tokens":None}
    st.append(Eval(ok,a.positions+b.positions,a.terms+b.terms,a.trace+b.trace+[f"{up} => {ok}; distance={detail['distance_tokens']}"],a.near+b.near+[detail]))
   continue
  st.append(term_eval(rec,tok))
 if len(st)!=1:raise ValueError("invalid query expression")
 return st[0]
def permitted(roots:list[Path],ex:set[str],max_bytes:int)->Iterable[Path]:
 seen=set()
 for root in roots:
  cand=[root] if root.is_file() else root.rglob("*")
  for p in cand:
   if not p.is_file():continue
   try:key=p.resolve()
   except:key=p
   if key in seen:continue
   seen.add(key)
   if any(x in ex for x in p.parts) or p.suffix.lower() not in TEXT_EXTS|{".json",".pdf"}:continue
   try:
    if p.stat().st_size>max_bytes:continue
   except:continue
   yield p
def sha(path:Path,cache:dict[str,str])->str:
 k=str(path)
 if k not in cache:
  try:cache[k]=hashlib.sha256(path.read_bytes()).hexdigest()
  except:cache[k]=""
 return cache[k]
def make_excerpt(text:str,positions:list[int],chars:int)->str:
 flat=norm(text);tokens=list(WORD_RE.finditer(flat));pos=min(positions) if positions else 0
 c=tokens[pos].start() if tokens and pos<len(tokens) else 0;lo=max(0,c-chars//2);hi=min(len(flat),lo+chars)
 return ("…" if lo else "")+flat[lo:hi]+("…" if hi<len(flat) else "")
def sort_hits(hits:list[Hit],key:str,desc:bool)->None:
 def k(h:Hit):
  if key=="date":return (h.timestamp or "9999",h.speaker.casefold(),h.path,h.locator)
  if key=="author":return ((h.speaker or h.role).casefold(),h.timestamp or "9999",h.path,h.locator)
  if key=="title":return (h.title.casefold(),h.timestamp or "9999",h.locator)
  if key=="path":return (h.path.casefold(),h.locator)
  return (h.timestamp or "9999",h.path,h.locator)
 hits.sort(key=k,reverse=desc)

def main()->int:
 ap=argparse.ArgumentParser(description=__doc__)
 ap.add_argument("roots",nargs="+",type=Path);ap.add_argument("--expr",help="Boolean/NEAR expression")
 ap.add_argument("--query",action="append",default=[],help="simple term/phrase; repeated values OR together")
 ap.add_argument("--near",type=int,default=10,help="default NEAR token window")
 ap.add_argument("--author",action="append",default=[]);ap.add_argument("--role",action="append",default=[])
 ap.add_argument("--date-from");ap.add_argument("--date-to");ap.add_argument("--sort",choices=["date","author","title","path"],default="date")
 ap.add_argument("--descending",action="store_true");ap.add_argument("--group-by",choices=["none","author","conversation","date","title"],default="none")
 ap.add_argument("--topic-config",type=Path,help="JSON topics/aliases used for enrichment and concept graph")
 ap.add_argument("--out",type=Path,default=Path("indexes/topical/search"));ap.add_argument("--exclude",action="append",default=[])
 ap.add_argument("--max-bytes",type=int,default=25_000_000);ap.add_argument("--excerpt-chars",type=int,default=500)
 ap.add_argument("--viewer-root",type=Path,default=Path("."));ap.add_argument("--limit",type=int,default=0)
 ap.add_argument("--result-mode",choices=["records","files"],default="records",help="records returns matching records; files collapses matching records to one representative hit per source path")
 args=ap.parse_args()
 if args.expr:query=args.expr
 elif args.query:query=" OR ".join(f'"{q}"' if " " in q and not q.startswith('"') else q for q in args.query)
 else:ap.error("provide --expr or --query")
 # Parse before scanning so malformed expressions fail fast.
 rpn(query)
 topic_rows=[]
 if args.topic_config:
  raw=json.loads(args.topic_config.read_text(encoding="utf-8"));topic_rows=raw.get("topics",raw) if isinstance(raw,dict) else raw
 topics=[]
 for row in topic_rows:
  if isinstance(row,str):topics.append((row,[row]))
  elif isinstance(row,dict):
   name=norm(row.get("topic") or row.get("name"));aliases=[name]+[norm(x) for x in row.get("aliases",[]) if norm(x)]
   if name:topics.append((name,list(dict.fromkeys(aliases))))
 viewer=load_viewer(args.viewer_root);cache={};hits=[];files=records=0;edges=Counter();topic_counts=Counter()
 authors={x.casefold() for x in args.author};roles={x.casefold() for x in args.role}
 for path in permitted(args.roots,DEFAULT_EXCLUDES|set(args.exclude),args.max_bytes):
  files+=1
  try:rel=path.relative_to(args.viewer_root).as_posix()
  except:rel=path.as_posix()
  vc=viewer.get(rel) or viewer.get(path.as_posix())
  for rec in iter_records(path):
   records+=1
   who=(rec.speaker or rec.role).casefold()
   if authors and who not in authors:continue
   if roles and rec.role.casefold() not in roles:continue
   d=rec.timestamp[:10]
   if args.date_from and (not d or d<args.date_from):continue
   if args.date_to and (not d or d>args.date_to):continue
   ev=evaluate(rec,query,args.near)
   if not ev.ok:continue
   present=[]
   for name,aliases in topics:
    if any(phrase_positions(rec.text,a) for a in aliases):present.append(name);topic_counts[name]+=1
   for i,a in enumerate(sorted(set(present))):
    for b in sorted(set(present))[i+1:]:edges[(a,b)]+=1
   hits.append(Hit(query,rel,rec.kind,rec.title,rec.conversation_id,rec.message_id,rec.speaker,rec.role,rec.timestamp,rec.locator,
    make_excerpt(rec.text,ev.positions,args.excerpt_chars),status(rec.text),viewer_link(vc or {},rec.message_id),sha(path,cache),
    list(dict.fromkeys(ev.terms)),ev.near,ev.trace,present))
 sort_hits(hits,args.sort,args.descending)
 raw_match_records=len(hits)
 if args.result_mode=="files":
  collapsed=[];seen_paths=set()
  for h in hits:
   if h.path in seen_paths:continue
   seen_paths.add(h.path);collapsed.append(h)
  hits=collapsed
 result_total=len(hits)
 facets={
  "authors":Counter((h.speaker or h.role or "(unknown)") for h in hits),
  "roles":Counter((h.role or "(unknown)") for h in hits),
  "kinds":Counter((h.kind or "(unknown)") for h in hits),
  "extensions":Counter((Path(h.path).suffix.casefold().lstrip(".") or "(none)") for h in hits),
  "years":Counter((h.timestamp[:4] if len(h.timestamp)>=4 else "(undated)") for h in hits)}
 facet_json={k:[{"value":v,"count":n} for v,n in sorted(cnt.items(),key=lambda x:(-x[1],x[0].casefold()))] for k,cnt in facets.items()}
 if args.limit>0:hits=hits[:args.limit]
 args.out.mkdir(parents=True,exist_ok=True);generated=datetime.now(timezone.utc).isoformat()
 manifest={"schema_version":2,"generated_at_utc":generated,"tool_name":TOOL_NAME,"tool_version":TOOL_VERSION,"tool_path":"tools/search_archive_content.py","query":query,
  "query_rpn":rpn(query),"default_near_window_tokens":args.near,"filters":{"authors":args.author,"roles":args.role,"date_from":args.date_from,"date_to":args.date_to},
  "response_schema":"mersearch.response.v1","result_mode":args.result_mode,"sort":{"key":args.sort,"descending":args.descending,"group_by":args.group_by},"roots":[str(x) for x in args.roots],
  "excluded_path_names":sorted(DEFAULT_EXCLUDES|set(args.exclude)),"coverage":{"files_scanned":files,"records_scanned":records,"matching_records_before_file_collapse":raw_match_records,"total_results_before_limit":result_total,"returned_hits":len(hits)},"facets":facet_json,
  "epistemic_note":"status signals and topic co-occurrences are retrieval aids, not authority/currentness/supersession judgments",
  "hits":[asdict(h) for h in hits],"concept_graph":{"edges":[{"source":a,"target":b,"cooccurrence_records":n} for (a,b),n in edges.most_common()]}}
 (args.out/"SEARCH_RESULTS.json").write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
 with (args.out/"SEARCH_RESULTS.jsonl").open("w",encoding="utf-8") as fh:
  for h in hits:fh.write(json.dumps(asdict(h),ensure_ascii=False)+"\n")
 fields=list(Hit.__dataclass_fields__)
 with (args.out/"SEARCH_RESULTS.csv").open("w",encoding="utf-8",newline="") as fh:
  w=csv.DictWriter(fh,fieldnames=fields);w.writeheader()
  for h in hits:
   d=asdict(h)
   for k,v in list(d.items()):
    if isinstance(v,(list,dict)):d[k]=json.dumps(v,ensure_ascii=False)
   w.writerow(d)
 lines=[f"# {TOOL_NAME} Results","",f"Generated: {generated}",f"Query: `{query}`",
  f"Coverage: {files:,} files / {records:,} records / {result_total:,} result(s) before limit / {len(hits):,} returned.",
  f"Sort: {args.sort} {'descending' if args.descending else 'ascending'}; group: {args.group_by}.","",
  "Status labels are lexical retrieval signals only; they do not establish supersession or authority.",""]
 last=None
 for h in hits:
  group={"author":h.speaker or h.role,"conversation":h.title or h.conversation_id,"date":h.timestamp[:10],"title":h.title}.get(args.group_by)
  if args.group_by!="none" and group!=last:lines+=["",f"## {group or '(unknown)'}",""];last=group
  lines.append(f"- **{h.title or Path(h.path).name}** — {h.timestamp or 'undated'} — {h.speaker or h.role or 'unknown speaker'}")
  lines.append(f"  - Source: `{h.path}` · `{h.locator}`"+(f" · CID `{h.conversation_id}`" if h.conversation_id else ""))
  if h.message_id:lines.append(f"  - Message: `{h.message_id}`")
  if h.viewer_url:lines.append(f"  - Viewer: `{h.viewer_url}`")
  lines.append(f"  - Matched: {', '.join(h.matched_terms) or '(field/Boolean match)'}")
  for n in h.near_matches:lines.append(f"  - NEAR: distance={n.get('distance_tokens')} tokens; window={n.get('window')}")
  if h.status_signals:lines.append(f"  - Status signals: {', '.join(h.status_signals)}")
  if h.topic_hits:lines.append(f"  - Topics: {', '.join(h.topic_hits)}")
  lines.append(f"  - Excerpt: “{h.excerpt}”")
 lines+=["","## Concept graph",""]
 lines += [f"- `{a}` ↔ `{b}` — {n} co-occurring hit record(s)" for (a,b),n in edges.most_common()] or ["_No configured topic co-occurrences._"]
 (args.out/"SEARCH_RESULTS.md").write_text("\n".join(lines)+"\n",encoding="utf-8")
 print(json.dumps({"tool":TOOL_NAME,"version":TOOL_VERSION,"files_scanned":files,"records_scanned":records,"total_results_before_limit":result_total,"returned_hits":len(hits),"result_mode":args.result_mode,"sort":args.sort,
  "outputs":[str(args.out/x) for x in ("SEARCH_RESULTS.json","SEARCH_RESULTS.jsonl","SEARCH_RESULTS.csv","SEARCH_RESULTS.md")]},ensure_ascii=False))
 return 0
if __name__=="__main__":raise SystemExit(main())

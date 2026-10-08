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
from urllib.parse import quote
from collections import Counter,defaultdict
from dataclasses import asdict,dataclass,field
from datetime import datetime,timezone
from pathlib import Path
from typing import Any,Iterable
import sys
sys.path.insert(0,str(Path(__file__).resolve().parent))
from mersearch_chronology import Chronology, VERSIONS, eras, message_date

TEXT_EXTS={".txt",".md",".csv",".tsv",".yaml",".yml",".py",".js",".html",".htm",".xml",".tex",".rst"}
DEFAULT_EXCLUDES={".git","node_modules","__pycache__",".venv","venv","QUARANTINE","PRIOR_ART"}
TOOL_NAME="Mercer_Searcher_1.2-chronology-dev"
TOOL_VERSION="1.2-chronology-dev"
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
 chronology:dict[str,Any]=field(default_factory=dict);repository:str=""
 capture_timestamp:str=""
@dataclass
class Eval:
 ok:bool; positions:list[int]; terms:list[str]; trace:list[str]; near:list[dict[str,Any]]
@dataclass
class Hit:
 query:str;path:str;kind:str;title:str;conversation_id:str;message_id:str;speaker:str;role:str
 timestamp:str;locator:str;excerpt:str;status_signals:list[str];viewer_url:str;source_sha256:str
 matched_terms:list[str];near_matches:list[dict[str,Any]];match_trace:list[str];topic_hits:list[str]
 chronology:dict[str,Any]=field(default_factory=dict);repository:str="";source_url:str=""
 passage_chronology:dict[str,Any]=field(default_factory=dict)
 identical_file_sources:list[dict[str,str]]=field(default_factory=list)

def norm(x:Any)->str:return re.sub(r"\s+"," ",str(x or "")).strip()
def iso_time(x:Any)->str:
 if x in (None,""):return ""
 try:
  v=float(x)
  if abs(v)>1e11:v/=1000  # millisecond Unix epoch
  return datetime.fromtimestamp(v,timezone.utc).isoformat()
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
def iter_notebooklm(data:Any,path:Path)->Iterable[Record]:
 """NotebookLM transcripts are secondary exports; captured_at is NOT message date."""
 if not isinstance(data,dict) or not isinstance(data.get("messages"),list):return
 meta=data.get("metadata") if isinstance(data.get("metadata"),dict) else {}
 title=norm(meta.get("notebook_title") or path.stem)
 capture=norm(meta.get("captured_at"))
 for i,msg in enumerate(data["messages"]):
  if not isinstance(msg,dict):continue
  body=msg.get("text") or content_text(msg.get("content"))
  if not isinstance(body,str) or not norm(body):continue
  role=norm(msg.get("role"));mid=norm(msg.get("id") or msg.get("key") or i)
  timestamp=msg.get("created_at") or msg.get("create_time") or ""
  if isinstance(timestamp,(int,float)):timestamp=iso_time(timestamp)
  yield Record(str(path),"notebooklm-message",body,title,norm(meta.get("notebook_id")),mid,
               role,role,norm(timestamp),f"messages[{i}]",capture_timestamp=capture)

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
  if not conv:conv=list(iter_notebooklm(data,path) or [])
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
 if field in ("era","version","archive_date","origin","date_confidence","document_type","retrospective","date_mentioned","repo","repository"):
  meta=rec.chronology or {}
  if field=="era":
   direct=message_date(rec.timestamp) if rec.kind in ("conversation-message","notebooklm-message") else ""
   target=" ".join(eras(direct,direct) if direct else meta.get("era_labels",[]))
  elif field=="version":target=" ".join(v["name"] for v in meta.get("version_evidence",[]));val=val.replace(" ","-")
  elif field=="archive_date":target=meta.get("archive_date","")
  elif field=="origin":
   direct=message_date(rec.timestamp) if rec.kind in ("conversation-message","notebooklm-message") else ""
   target=direct or meta.get("estimated_origin_start","")
  elif field=="date_mentioned":target=" ".join(meta.get("dates_mentioned",[]))
  elif field=="date_confidence":target=meta.get("date_confidence","")
  elif field=="document_type":target=meta.get("document_type","")
  elif field=="retrospective":target=str(meta.get("retrospective_possible",False)).lower()
  else:target=rec.repository
  target=target.casefold()
  if field in ("repo","repository"):
   ok=val==target  # exact: HsH must not also match HSH_RESOURCES
  elif field in ("archive_date","origin") and ".." in val:
   lo,hi=val.split("..",1)
   ok=bool(target) and (not lo or target>=lo) and (not hi or target<=hi)
  else:ok=bool(target) and val in target
  return Eval(ok,[],[term] if ok else [],[f"CHRONOLOGY FIELD {field}:{val!r} => {ok}"],[])
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
         "text-source":rec.kind in ("text-line","json-scalar","conversation-message","notebooklm-message"),
         "message-id":bool(rec.message_id),"conversation-id":bool(rec.conversation_id),"viewer":bool(rec.viewer_url)}
  ok=flags.get(val,False)
  return Eval(ok,[],[term] if ok else [],[f"FIELD has:{val} => {ok}"],[])
 fmap={"author":rec.speaker or rec.role,"speaker":rec.speaker,"role":rec.role,"title":rec.title,
       "conversation":rec.conversation_id,"cid":rec.conversation_id,"date":rec.timestamp[:10],"status":" ".join(status(rec.text))}
 if field not in fmap:return None
 target=(fmap[field] or "").casefold()
 if field=="date" and ".." in val:
  lo,hi=val.split("..",1);ok=bool(target) and (not lo or target>=lo) and (not hi or target<=hi)
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
def permitted(roots:list[Path],ex:set[str],max_bytes:int,scan_stats:Counter|None=None)->Iterable[Path]:
 """Inventory exclusions are counted, not silently treated as full coverage."""
 stats=scan_stats if scan_stats is not None else Counter()
 seen=set()
 for root in roots:
  cand=[root] if root.is_file() else root.rglob("*")
  for p in cand:
   if not p.is_file():continue
   try:key=p.resolve()
   except OSError:key=p
   if key in seen:stats["duplicate_paths"]+=1;continue
   seen.add(key)
   if any(x in ex for x in p.parts):stats["excluded_by_policy"]+=1;continue
   if p.suffix.lower() not in TEXT_EXTS|{".json",".pdf"}:stats["unsupported_extension"]+=1;continue
   try:
    if max_bytes and p.stat().st_size>max_bytes:
     stats["oversized_files_skipped"]+=1
     continue
   except OSError:
    stats["inaccessible_files_skipped"]+=1
    continue
   stats["eligible_files"]+=1
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
  if key=="origin":return (h.passage_chronology.get("estimated_origin_start") or h.chronology.get("estimated_origin_start") or "9999",h.path,h.locator)
  if key=="author":return ((h.speaker or h.role).casefold(),h.timestamp or "9999",h.path,h.locator)
  if key=="title":return (h.title.casefold(),h.timestamp or "9999",h.locator)
  if key=="path":return (h.path.casefold(),h.locator)
  return (h.timestamp or "9999",h.path,h.locator)
 hits.sort(key=k,reverse=desc)

ARCHIVE_ALIASES={
 "Satobloc/SAT_THEORY_ARCHIVE_2023-25":("SAT_THEORY_ARCHIVE_2023-25","archive"),
 "Satobloc/HsH":("HsH","hsh-main","hsh"),
 "Satobloc/HSH_RESOURCES":("HSH_RESOURCES","resources")
}
CHRONO_FIELDS=re.compile(r"\b(?:era|version|archive_date|origin|date_confidence|document_type|retrospective|date_mentioned):",re.I)
EXAMPLES=[
 'python tools/search_archive_content.py --capabilities',
 'python tools/search_archive_content.py --expr \'"0.24" OR "optical phase"\' --result-mode files',
 'python tools/search_archive_content.py --expr \'("refractive index" NEAR/12 "phase shift")\'',
 'python tools/search_archive_content.py --expr \'era:early-2025 AND "phase shift"\' --sort origin',
 'python tools/search_archive_content.py --expr \'version:sat-mark-v AND "phase shift"\'',
 'python tools/search_archive_content.py --expr \'math:"B=3/(4*pi)"\'',
 'python tools/search_archive_content.py --archives-root /work --coverage',
]
def discover_archives(base:Path)->tuple[list[Path],list[str]]:
 base=base.resolve()  # Path('.').parent is still '.', not its actual parent
 found=[];missing=[]
 for repo,names in ARCHIVE_ALIASES.items():
  hit=next((p for folder in (base,base.parent) for name in names
            if (p:=folder/name).is_dir()),None)
  if hit:found.append(hit)
  else:missing.append(repo)
 return found,missing

def repo_for(path:Path,roots:list[Path])->str:
 for root in sorted(roots,key=lambda p:len(p.parts),reverse=True):
  try:path.relative_to(root)
  except ValueError:continue
  for repo,names in ARCHIVE_ALIASES.items():
   if root.name in names:return repo
  return root.name
 return "(unknown)"

def describe_capabilities()->dict[str,Any]:
 return {"tool":TOOL_NAME,"version":TOOL_VERSION,
   "help":"python tools/search_archive_content.py --help",
   "tool_surfaces":{
     "cli":"tools/search_archive_content.py (this interface; all archives when discovered)",
     "chronology":"tools/mersearch_chronology.py (integrated evidence enrichment)",
     "request_bridge":"WORKSPACES/COMMON/MERSEARCH_REQUEST.json + .github/workflows/mersearch-request-bridge.yml (connector-only workers; stable semantics until engine promotion)",
     "viewer":"CONVERSATION_VIEWER/ (navigation; do not assume identical search semantics)",
     "legacy_test":"WORKSPACES/MERCER/test_mercer_searcher_1_0.py",
     "chronology_test":"WORKSPACES/MERCER/test_mersearch_chronology_20261007.py",
     "release_registry":"WORKSPACES/COMMON/MERSEARCH_RELEASES.md"
   },
   "examples":EXAMPLES,
   "archives_default":list(ARCHIVE_ALIASES),
   "archives_policy":"All discoverable archives searched by default; missing ones always reported.",
   "query_operators":["AND","OR","NOT","NEAR/n","()",'"phrase"',"implicit AND"],
   "fields":["body","math","name","path","ext","kind","has","author","speaker",
     "role","title","conversation","cid","date","status","era","version",
     "archive_date","origin","date_confidence","document_type",
     "retrospective","date_mentioned","repo"],
   "formats":["SEARCH_RESULTS.json","SEARCH_RESULTS.jsonl","SEARCH_RESULTS.csv","SEARCH_RESULTS.md"],
   "result_modes":["records","files"],"optional_collapse":"--collapse-identical-files (file mode only, byte SHA-256 identity)",
   "sorts":["date","origin","author","title","path"],
   "cautions":["math normalization is not algebraic equivalence",
     "chronology/version estimates are not hard dates",
     "PRIOR_ART and QUARANTINE excluded by default",
     "large files beyond --max-bytes skipped with explicit count; use --max-bytes 0 to disable limit",
     "structured timestamps apply to messages, not quoted excerpts",
     "no semantic/vector or CAS retrieval in this development version"]}

def main()->int:
 ap=argparse.ArgumentParser(description=__doc__,epilog="Start with --capabilities or --examples. By default Mersearch looks for ALL THREE archives and warns if any are absent.")
 ap.add_argument("roots",nargs="*",type=Path,help="optional explicit corpus roots; absent means ALL discovered archives");ap.add_argument("--expr",help="Boolean/NEAR expression")
 ap.add_argument("--archives-root",type=Path,default=Path("."),help="parent directory containing the three SAT/HsH archive checkouts")
 ap.add_argument("--capabilities",action="store_true",help="print machine-readable commands, fields, modes, defaults and examples")
 ap.add_argument("--examples",action="store_true",help="show working query examples")
 ap.add_argument("--coverage",action="store_true",help="show available and missing default archives without running a search")
 ap.add_argument("--query",action="append",default=[],help="simple term/phrase; repeated values OR together")
 ap.add_argument("--near",type=int,default=10,help="default NEAR token window")
 ap.add_argument("--author",action="append",default=[]);ap.add_argument("--role",action="append",default=[])
 ap.add_argument("--date-from");ap.add_argument("--date-to");ap.add_argument("--sort",choices=["date","origin","author","title","path"],default="date")
 ap.add_argument("--descending",action="store_true");ap.add_argument("--group-by",choices=["none","author","conversation","date","title"],default="none")
 ap.add_argument("--topic-config",type=Path,help="JSON topics/aliases used for enrichment and concept graph")
 ap.add_argument("--out",type=Path,default=Path("indexes/topical/search"));ap.add_argument("--exclude",action="append",default=[])
 ap.add_argument("--max-bytes",type=int,default=25_000_000);ap.add_argument("--excerpt-chars",type=int,default=500)
 ap.add_argument("--viewer-root",type=Path,default=Path("."));ap.add_argument("--limit",type=int,default=0)
 ap.add_argument("--offset",type=int,default=0,help="0-based offset after deterministic sorting")
 ap.add_argument("--collapse-identical-files",action="store_true",help="group byte-identical files in file mode; retain all source locations in each representative")
 ap.add_argument("--result-mode",choices=["records","files"],default="records",help="records returns matching records; files collapses matching records to one representative hit per source path")
 args=ap.parse_args()
 if args.capabilities:
  print(json.dumps(describe_capabilities(),ensure_ascii=False,indent=2));return 0
 if args.examples:
  print("\n".join(EXAMPLES));return 0
 discovered,missing=discover_archives(args.archives_root)
 if args.coverage:
  print(json.dumps({"archives_requested":list(ARCHIVE_ALIASES),
    "archives_discovered":[repo_for(p,discovered) for p in discovered],
    "missing_archives":missing,"coverage_status":"complete" if not missing else "partial"},
    ensure_ascii=False,indent=2));return 0
 if not args.roots:
  args.roots=discovered
  if not args.roots:ap.error("No archive checkout found. Clone the three repositories beside HsH or provide explicit roots.")
 if args.offset<0 or args.limit<0:ap.error("--offset and --limit must be nonnegative")
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
 viewer=load_viewer(args.viewer_root);cache={};hits=[];files=records=0;edges=Counter();topic_counts=Counter();scan_stats=Counter()
 authors={x.casefold() for x in args.author};roles={x.casefold() for x in args.role}
 for path in permitted(args.roots,DEFAULT_EXCLUDES|set(args.exclude),args.max_bytes,scan_stats):
  files+=1
  try:rel=path.relative_to(args.viewer_root).as_posix()
  except:rel=path.as_posix()
  vc=viewer.get(rel) or viewer.get(path.as_posix())
  repository=repo_for(path,args.roots)
  record_start=records
  chrono=Chronology(rel)
  requires_chrono=bool(CHRONO_FIELDS.search(query))
  if requires_chrono:
   for prior in iter_records(path):
    chrono.observe(prior.text,prior.locator,prior.kind,prior.timestamp,prior.capture_timestamp)
  known_chrono=chrono.result() if requires_chrono else {}
  hit_start=len(hits)
  for rec in iter_records(path):
   rec.chronology=known_chrono
   rec.repository=repository
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
   passage=Chronology(rel)
   passage.observe(rec.text,rec.locator,rec.kind,rec.timestamp,rec.capture_timestamp)
   hits[-1].passage_chronology=passage.result()
  if records==record_start:scan_stats["files_without_readable_records"]+=1
  if len(hits)>hit_start:
   if not requires_chrono:
    for original in iter_records(path):
     chrono.observe(original.text,original.locator,original.kind,original.timestamp,original.capture_timestamp)
   meta=chrono.result()
   root=next((rt for rt in sorted(args.roots,key=lambda p:len(p.parts),reverse=True) if path==rt or rt in path.parents),None)
   source_path=path.relative_to(root).as_posix() if root and root.is_dir() else path.name
   url=f"https://github.com/{repository}/blob/main/{quote(source_path,safe='/')}" if repository.startswith("Satobloc/") else ""
   for h in hits[hit_start:]:
    h.chronology=meta;h.repository=repository;h.source_url=url
 sort_hits(hits,args.sort,args.descending)
 # Byte-identical sources may be collapsed on request, but each location remains
 # visible in identical_file_sources. Similar titles or converted formats are
 # NOT assumed to be the same work.
 mirrors=defaultdict(dict)
 for h in hits:
  if h.source_sha256:
   mirrors[h.source_sha256][h.repository+"|"+h.path]=dict(repository=h.repository,path=h.path,source_url=h.source_url)
 for h in hits:
  if h.source_sha256 and len(mirrors[h.source_sha256])>1:
   h.identical_file_sources=sorted(mirrors[h.source_sha256].values(),key=lambda v:(v["repository"],v["path"]))
 raw_match_records=len(hits)
 if args.result_mode=="files":
  collapsed=[];seen_paths=set()
  for h in hits:
   if h.path in seen_paths:continue
   seen_paths.add(h.path);collapsed.append(h)
  hits=collapsed
 if args.collapse_identical_files:
  if args.result_mode!="files":ap.error("--collapse-identical-files requires --result-mode files")
  uniques=[];seen_sha=set()
  for h in hits:
   if h.source_sha256 and h.source_sha256 in seen_sha:continue
   if h.source_sha256:seen_sha.add(h.source_sha256)
   uniques.append(h)
  hits=uniques
 result_total=len(hits)
 facets={
  "authors":Counter((h.speaker or h.role or "(unknown)") for h in hits),
  "roles":Counter((h.role or "(unknown)") for h in hits),
  "kinds":Counter((h.kind or "(unknown)") for h in hits),
  "extensions":Counter((Path(h.path).suffix.casefold().lstrip(".") or "(none)") for h in hits),
  "years":Counter((h.timestamp[:4] if len(h.timestamp)>=4 else "(undated)") for h in hits)}
 facet_json={k:[{"value":v,"count":n} for v,n in sorted(cnt.items(),key=lambda x:(-x[1],x[0].casefold()))] for k,cnt in facets.items()}
 if args.limit>0:hits=hits[args.offset:args.offset+args.limit]
 elif args.offset:hits=hits[args.offset:]
 args.out.mkdir(parents=True,exist_ok=True);generated=datetime.now(timezone.utc).isoformat()
 coverage_repos=sorted({repo_for(root, args.roots) for root in args.roots})
 missing_repos=[name for name in ARCHIVE_ALIASES if name not in coverage_repos]
 coverage_status="complete" if not missing_repos else "partial"
 # Checkout presence and searchable-content coverage are different claims.
 # A present checkout can contain skipped, oversized or unparsed sources.
 content_gap_keys=("excluded_by_policy","unsupported_extension","oversized_files_skipped","inaccessible_files_skipped","files_without_readable_records")
 content_gaps={k:int(scan_stats.get(k,0)) for k in content_gap_keys if scan_stats.get(k,0)}
 content_coverage_status="unverified" if not missing_repos and not content_gaps else "partial"
 content_coverage_warning=("Searchable content is not verified complete; inspect inventory_limitations and per-source extraction outcomes. "
  "Repository presence does not establish full-text coverage.")
 manifest={"schema_version":3,"capabilities":describe_capabilities(),
  "archives_requested":list(ARCHIVE_ALIASES),
  "archives_searched":coverage_repos,
  "missing_archives":missing_repos,
  "coverage_status":coverage_status,
  "coverage_status_scope":"repository_checkout_presence_only",
  "content_coverage_status":content_coverage_status,
  "content_coverage_warning":content_coverage_warning,
  "content_coverage_gaps":content_gaps,
  "inventory_limitations":dict(scan_stats),
  "indexed_source_completeness":"not guaranteed: excluded extensions/large files and format extraction failures are possible",
  "coverage_warning":"PARTIAL CORPUS: search did not cover every configured archive" if missing_repos else "",
  "pagination":{"offset":args.offset,"limit":args.limit,"total_hits":result_total,"returned_hits":len(hits)},
  "generated_at_utc":generated,"tool_name":TOOL_NAME,"tool_version":TOOL_VERSION,"tool_path":"tools/search_archive_content.py","query":query,
  "query_rpn":rpn(query),"default_near_window_tokens":args.near,"filters":{"authors":args.author,"roles":args.role,"date_from":args.date_from,"date_to":args.date_to},
  "response_schema":"mersearch.response.v1","result_mode":args.result_mode,"collapse_identical_files":args.collapse_identical_files,"sort":{"key":args.sort,"descending":args.descending,"group_by":args.group_by},"roots":[str(x) for x in args.roots],
  "excluded_path_names":sorted(DEFAULT_EXCLUDES|set(args.exclude)),"coverage":{"files_scanned":files,"records_scanned":records,"matching_records_before_file_collapse":raw_match_records,"total_results_before_limit":result_total,"returned_hits":len(hits),"inventory_limitations":dict(scan_stats)},"facets":facet_json,
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
  f"Coverage: {coverage_status.upper()}: {files:,} files / {records:,} records / {result_total:,} result(s) before limit / {len(hits):,} returned.",
 f"Archives: searched={', '.join(coverage_repos)}; missing={', '.join(missing_repos) or 'none'}.",
 f"Unindexed (policy/extension/size/access): {sum(scan_stats[x] for x in ('excluded_by_policy','unsupported_extension','oversized_files_skipped','inaccessible_files_skipped')):,} files. Root coverage does not imply complete indexing.",
  f"Sort: {args.sort} {'descending' if args.descending else 'ascending'}; group: {args.group_by}.","",
  "Status labels are lexical retrieval signals only; they do not establish supersession or authority.",""]
 last=None
 for h in hits:
  group={"author":h.speaker or h.role,"conversation":h.title or h.conversation_id,"date":h.timestamp[:10],"title":h.title}.get(args.group_by)
  if args.group_by!="none" and group!=last:lines+=["",f"## {group or '(unknown)'}",""];last=group
  lines.append(f"- **{h.title or Path(h.path).name}** — {h.timestamp or 'undated'} — {h.speaker or h.role or 'unknown speaker'}")
  lines.append(f"  - Source: `{h.path}` · `{h.locator}`"+(f" · CID `{h.conversation_id}`" if h.conversation_id else ""))
  if h.message_id:lines.append(f"  - Message: `{h.message_id}`")
  if h.source_url:lines.append(f"  - Source link: {h.source_url}")
  if h.chronology:
   c=h.chronology
   lines.append(f"  - Chronology: origin={c.get('estimated_origin_start') or 'unknown'}..{c.get('estimated_origin_end') or 'unknown'} ({c.get('date_confidence')}); archived={c.get('archive_date') or 'unknown'}; versions={c.get('earliest_version_mentioned') or 'unknown'}..{c.get('latest_version_mentioned') or 'unknown'}")
  if h.viewer_url:lines.append(f"  - Viewer: `{h.viewer_url}`")
  lines.append(f"  - Matched: {', '.join(h.matched_terms) or '(field/Boolean match)'}")
  for n in h.near_matches:lines.append(f"  - NEAR: distance={n.get('distance_tokens')} tokens; window={n.get('window')}")
  if h.status_signals:lines.append(f"  - Status signals: {', '.join(h.status_signals)}")
  if h.topic_hits:lines.append(f"  - Topics: {', '.join(h.topic_hits)}")
  lines.append(f"  - Excerpt: “{h.excerpt}”")
 lines+=["","## Concept graph",""]
 lines += [f"- `{a}` ↔ `{b}` — {n} co-occurring hit record(s)" for (a,b),n in edges.most_common()] or ["_No configured topic co-occurrences._"]
 (args.out/"SEARCH_RESULTS.md").write_text("\n".join(lines)+"\n",encoding="utf-8")
 print(json.dumps({"tool":TOOL_NAME,"version":TOOL_VERSION,"files_scanned":files,"records_scanned":records,"total_results_before_limit":result_total,"returned_hits":len(hits),"result_mode":args.result_mode,"sort":args.sort,"coverage_status":coverage_status,"coverage_status_scope":"repository_checkout_presence_only","content_coverage_status":content_coverage_status,"content_coverage_gaps":content_gaps,"missing_archives":missing_repos,
  "outputs":[str(args.out/x) for x in ("SEARCH_RESULTS.json","SEARCH_RESULTS.jsonl","SEARCH_RESULTS.csv","SEARCH_RESULTS.md")]},ensure_ascii=False))
 return 0
if __name__=="__main__":raise SystemExit(main())

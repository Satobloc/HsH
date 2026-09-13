#!/usr/bin/env python3
"""Apply manually accepted priority vocabulary to raw ChatGPT conversation exports.

This is an additive machine-tag layer. It never removes existing tags and never
promotes assistant text into Nathan's voice. In this archive, role=user is Nathan.
"""
from __future__ import annotations
import argparse, json, re
from pathlib import Path
from typing import Any

SKIP={".git","__pycache__","node_modules",".venv"}

def norm(s:str)->str:
    return re.sub(r"\s+"," ",s.lower().replace("–","-").replace("—","-").replace("‑","-")).strip()

def extract_text(msg:dict[str,Any])->str:
    parts=(msg.get("content") or {}).get("parts") or []; out=[]
    for p in parts:
        if isinstance(p,str): out.append(p)
        elif isinstance(p,dict) and isinstance(p.get("text"),str): out.append(p["text"])
    return "\n".join(out)

def conversations(obj:Any):
    if isinstance(obj,dict) and isinstance(obj.get("mapping"),dict): return [obj]
    if isinstance(obj,list): return [x for x in obj if isinstance(x,dict) and isinstance(x.get("mapping"),dict)]
    return []

def json_files(roots:list[Path]):
    seen=set()
    for root in roots:
        for p in root.rglob("*.json") if root.is_dir() else [root]:
            if not p.is_file() or any(x in SKIP for x in p.parts): continue
            if p in seen: continue
            seen.add(p); yield p

def boundary_hit(text:str,term:str)->bool:
    t=norm(text); q=norm(term)
    if not q: return False
    # phrase/symbol forms: substring with alphanumeric boundaries where possible
    left=r"(?<![A-Za-z0-9])" if q[0].isalnum() else ""
    right=r"(?![A-Za-z0-9])" if q[-1].isalnum() else ""
    return bool(re.search(left+re.escape(q)+right,t,re.I))

def main():
    ap=argparse.ArgumentParser(); ap.add_argument("roots",nargs="+",type=Path); ap.add_argument("--vocabulary",type=Path,required=True); ap.add_argument("--out",type=Path,required=True); ap.add_argument("--summary",type=Path,required=True); args=ap.parse_args()
    vocab=json.loads(args.vocabulary.read_text(encoding="utf-8")); accepted=vocab.get("accepted",[])
    terms=[]
    for e in accepted:
        label=e.get("term"); tag=e.get("tag")
        if label and tag: terms.append((label,tag))
    records=[]; files=0; convs=0; messages=0; nathan=0
    for p in json_files(args.roots):
        files+=1
        try: obj=json.loads(p.read_text(encoding="utf-8"))
        except Exception: continue
        for conv in conversations(obj):
            convs+=1; title=conv.get("title") or p.stem; cid=conv.get("id") or conv.get("conversation_id")
            for node_id,node in (conv.get("mapping") or {}).items():
                msg=(node or {}).get("message")
                if not isinstance(msg,dict): continue
                text=extract_text(msg)
                if not text: continue
                messages+=1; role=(msg.get("author") or {}).get("role")
                if role=="user": nathan+=1
                hits=[{"term":term,"tag":tag} for term,tag in terms if boundary_hit(text,term)]
                if not hits: continue
                records.append({"source_path":p.as_posix(),"conversation_title":title,"conversation_id":cid,"message_id":msg.get("id") or node_id,"create_time":msg.get("create_time"),"role":role,"nathan_authored":role=="user","priority_term_tags":[x["tag"] for x in hits],"matched_terms":[x["term"] for x in hits],"AUTO_TAG_ONLY":True,"ADDITIVE_ONLY":True})
    args.out.parent.mkdir(parents=True,exist_ok=True)
    with args.out.open("w",encoding="utf-8") as f:
        for r in records: f.write(json.dumps(r,ensure_ascii=False)+"\n")
    args.summary.parent.mkdir(parents=True,exist_ok=True)
    counts={tag:0 for _,tag in terms}
    for r in records:
        for tag in r["priority_term_tags"]: counts[tag]=counts.get(tag,0)+1
    with args.summary.open("w",encoding="utf-8") as f:
        f.write("# Priority Vocabulary Tagging Summary\n\n")
        f.write("Additive machine tags only. `role=user` is Nathan; assistant/other-LLM hits remain context and are never promoted into Nathan's voice.\n\n")
        f.write(f"- accepted vocabulary terms: {len(terms)}\n- JSON files scanned: {files}\n- conversations recognized: {convs}\n- messages scanned: {messages}\n- Nathan/user messages scanned: {nathan}\n- messages with priority-term hits: {len(records)}\n\n## Tag counts\n\n")
        for tag,n in sorted(counts.items(),key=lambda x:(-x[1],x[0])): f.write(f"- `{tag}`: {n}\n")

if __name__=="__main__": main()

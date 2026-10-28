#!/usr/bin/env python3
"""Bulk equation discovery adapter to existing Mersearch and formalization pipeline.

No model evaluation, symbolic execution of untrusted input, or automatic Lean claim.
"""
from __future__ import annotations
import argparse, hashlib, importlib.util, json, sys
from collections import Counter
from datetime import datetime, timezone
from pathlib import Path
from mersearch_math_structural import extract_math

ALLOWED={".txt",".md",".markdown",".tex",".json",".jsonl",".rst",".html",".pdf"}
EXCLUDED={".git","PRIOR_ART","QUARANTINE",".lake","node_modules","venv",".venv","__pycache__"}
VERSION="math-hopper/0.1.0"

def core():
    path=Path(__file__).with_name("search_archive_content.py")
    spec=importlib.util.spec_from_file_location("hopper_mersearch_core",path)
    module=importlib.util.module_from_spec(spec)
    sys.modules[spec.name]=module
    spec.loader.exec_module(module)
    return module

def get_records(path, engine):
    if path.suffix.lower() in {".json",".jsonl"}:
        for rec in engine.iter_records(path):
            yield rec.text,rec.locator,rec.message_id,rec.conversation_id,rec.speaker,rec.role
    elif path.suffix.lower()==".pdf":
        try:
            from pypdf import PdfReader
            for page,record in enumerate(PdfReader(str(path)).pages,1):
                body=record.extract_text() or ""
                if body.strip():
                    yield body,"page:"+str(page),"","","",""
        except (ImportError,OSError,ValueError):
            return
    else:
        yield path.read_text(encoding="utf-8-sig",errors="replace"),"whole-file","","","",""

def scan(roots,out,max_bytes,limit,excludes):
    roots=[Path(r).resolve() for r in roots]
    out=Path(out).resolve()
    for root in roots:
        if root==out or (root.is_dir() and root in out.parents):
            raise ValueError("Output must be outside scanned source roots")
        if not root.exists():
            raise FileNotFoundError(root)
    engine=core()
    skipped=EXCLUDED | set(excludes)
    seen=set()
    files=0
    modes=Counter()
    notation_keys=set()
    source_bodies=set()  # exact bytes, distinct from path occurrences
    candidate_count=0
    out.mkdir(parents=True,exist_ok=True)
    pending=out/"CANDIDATES.jsonl.tmp"
    writer=pending.open("w",encoding="utf-8")
    for root in roots:
        for file in ([root] if root.is_file() else sorted(root.rglob("*"))):
            if not file.is_file() or any(part in skipped for part in file.parts) or file.suffix.lower() not in ALLOWED:
                continue
            if file.resolve() in seen or file.stat().st_size>max_bytes:
                continue
            seen.add(file.resolve())
            if limit and files>=limit:
                break
            files+=1
            repo=root.name if root.is_dir() else root.parent.name
            relative=file.relative_to(root).as_posix() if root.is_dir() else file.name
            source_sha=hashlib.sha256(file.read_bytes()).hexdigest()
            source_bodies.add(source_sha)
            for text,locator,message_id,conversation_id,speaker,role in get_records(file,engine):
                occupied=set()
                for start,end,raw in extract_math(text):
                    if (start,end,raw) in occupied:
                        continue
                    occupied.add((start,end,raw))
                    notation=engine.math_norm(raw)
                    fp=hashlib.sha256(notation.encode()).hexdigest()[:20]
                    identity=json.dumps([repo,relative,source_sha,locator,message_id,start,end,raw],ensure_ascii=False)
                    cid="MH-"+hashlib.sha256(identity.encode()).hexdigest()[:20]
                    level="delimited" if raw!=text[start:end] else "line-candidate"
                    modes[level]+=1
                    record={
                        "candidate_id":cid,"notation_key":fp,
                        "repo":repo,"path":relative,"sha256":source_sha,
                        "locator":locator,"message_id":message_id,
                        "conversation_id":conversation_id,"speaker":speaker,"role":role,
                        "line":text.count("\n",0,start)+1,"start":start,"end":end,
                        "mode":level,"raw":raw,
                        "extraction":"FOUND","format":"NOT_VALIDATED",
                        "math":"NOT_RUN","lean":"NOT_RUN","empirical":"NOT_RUN",
                        "next":"SOURCE_CONTEXT_SYMBOLS_ASSUMPTIONS_AND_UNITS"
                    }
                    writer.write(json.dumps(record,ensure_ascii=False,sort_keys=True)+"\n")
                    candidate_count+=1
                    notation_keys.add(fp)
        if limit and files>=limit:
            break
    writer.close()
    pending.replace(out/"CANDIDATES.jsonl")
    summary={
        "tool":VERSION,"streaming":True,"date_utc":datetime.now(timezone.utc).isoformat(),
        "roots":[str(p) for p in roots],"files_inspected":files,
        "candidates":candidate_count,
        "unique_source_bodies":len(source_bodies),
        "unique_notation_keys":len(notation_keys),
        "modes":dict(modes),"math_pass":None,"math_fail":None,
        "lean_status":"NOT_RUN","excluded":sorted(skipped),
        "warning":"Archive ingestion only: equation validity cannot be inferred from extracted notation."
    }
    (out/"MANIFEST.json").write_text(json.dumps(summary,indent=2,ensure_ascii=False)+"\n",encoding="utf-8")
    (out/"REPORT.md").write_text(
        "# Archive Math Hopper\n\n"
        +f"- Files: {files}\n- Unique source bodies: {len(source_bodies)}\n- Candidate occurrences: {candidate_count}\n
        +f"- Distinct notation keys: {summary['unique_notation_keys']}\n"
        +"- Mathematical/Lean proof: NOT RUN.\n\n"
        +"Curate source context, domains, symbols, units and assumptions, then transfer an appropriate claim into formalization/equations.json. This extraction score is NOT a truth score.\n",
        encoding="utf-8")
    print(json.dumps(summary,ensure_ascii=False))
    return 0

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument("roots",type=Path,nargs="+")
    p.add_argument("--out",required=True,type=Path)
    p.add_argument("--max-bytes",default=25_000_000,type=int)
    p.add_argument("--limit-files",default=0,type=int)
    p.add_argument("--exclude",action="append",default=[])
    x=p.parse_args()
    return scan(x.roots,x.out,x.max_bytes,x.limit_files,x.exclude)

if __name__=="__main__":
    raise SystemExit(main())

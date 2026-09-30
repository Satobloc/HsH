#!/usr/bin/env python3
"""Non-mutating exact freshness check for bibliography-relevant source PDFs.

Classification intentionally matches tools/index_papers.py:
- enumerate all filesystem entries, then lowercase suffix;
- source/machinery classification is based on top-level path component;
- symlink/file behavior follows Path.is_file(), as the indexer does.
"""
from __future__ import annotations
import argparse, hashlib, json
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

NON_SOURCE_TOP={"tools","tests","indexes","derived"}
NON_SOURCE_ROOT={"README.md",".gitignore","requirements-tools.txt"}
SKIP_PARTS={".git","__pycache__",".pytest_cache"}

def sha256(path: Path)->str:
    h=hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda:f.read(1024*1024),b""):
            h.update(chunk)
    return h.hexdigest()

def is_source_pdf_rel(rel: str)->bool:
    p=Path(rel)
    if p.suffix.lower() != ".pdf":
        return False
    top=rel.split("/",1)[0]
    return top not in NON_SOURCE_TOP and rel not in NON_SOURCE_ROOT

def source_pdf_paths(root:Path):
    out=[]
    # Do NOT use rglob("*.pdf"): Linux glob matching is case-sensitive while
    # index_papers.py enumerates "*" and lowercases Path.suffix.
    for p in root.rglob("*"):
        if not p.is_file() or any(part in SKIP_PARTS for part in p.parts):
            continue
        rel=p.relative_to(root).as_posix()
        if is_source_pdf_rel(rel):
            out.append(rel)
    return sorted(out,key=str.casefold)

def check(root:Path,state:dict,workers=8):
    indexed={r["path"]:r for r in state.get("items",[]) if r.get("kind")=="paper-pdf"}
    actual=source_pdf_paths(root)
    actual_set=set(actual); indexed_set=set(indexed)
    added=sorted(actual_set-indexed_set)
    missing=sorted(indexed_set-actual_set)
    size_mismatch=[]
    candidates=[]
    for rel in sorted(actual_set & indexed_set):
        p=root/rel; expected=indexed[rel]
        if expected.get("bytes") is not None and p.stat().st_size != expected["bytes"]:
            size_mismatch.append(rel)
        else:
            candidates.append(rel)
    def one(rel):
        return rel,sha256(root/rel)
    hash_mismatch=[]
    with ThreadPoolExecutor(max_workers=max(1,workers)) as ex:
        for rel,digest in ex.map(one,candidates):
            row=indexed[rel]
            if str(row.get("hash_kind") or "").lower()!="sha256" or row.get("content_id")!=digest:
                hash_mismatch.append(rel)
    return {
        "added":added,
        "missing":missing,
        "size_mismatch":size_mismatch,
        "hash_mismatch":sorted(hash_mismatch),
    }

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("--root",type=Path,default=Path("."))
    ap.add_argument("--workers",type=int,default=8)
    a=ap.parse_args()
    root=a.root.resolve()
    state=json.loads((root/"indexes/index-state.json").read_text())
    r=check(root,state,a.workers)
    counts={k:len(v) for k,v in r.items()}
    print(json.dumps(counts,sort_keys=True))
    if any(r.values()):
        for k,v in r.items():
            if v:
                print(f"ERROR {k} count={len(v)} sample={v[:10]}")
        print("Committed structural index is stale relative to checked-out bibliography-relevant PDFs; wait for/repair extraction-index maintenance.")
        raise SystemExit(3)
    print("bibliography_pdf_inventory=fresh")
if __name__=="__main__":
    main()

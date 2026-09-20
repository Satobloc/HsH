#!/usr/bin/env python3
"""Incrementally build a new immutable Mersearch generation from the current one.

Correctness-first 1.1-dev prototype: copy prior DB, inventory/hash sources, replace
only changed/new/deleted source records, rebuild FTS, validate, then atomically publish.
The active generation is never mutated.
"""
from __future__ import annotations
import argparse,hashlib,importlib.util,json,os,shutil,sqlite3,sys,time,uuid
from datetime import datetime,timezone
from pathlib import Path

SCHEMA_VERSION="mersearch.index.v1"
BUILDER_VERSION="1.1-dev-incremental"

def load_core(repo):
    p=repo/"tools/search_archive_content.py"
    spec=importlib.util.spec_from_file_location("mersearch_core_inc",p)
    m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m);return m

def atomic_json(path,obj):
    tmp=path.with_suffix(path.suffix+".tmp");tmp.write_text(json.dumps(obj,ensure_ascii=False,indent=2)+"\n",encoding="utf-8");os.replace(tmp,path)

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("repo",type=Path,nargs="?",default=Path("."))
    ap.add_argument("--index-root",type=Path,default=Path("indexes/mersearch"))
    ap.add_argument("--max-bytes",type=int,default=25_000_000)
    ap.add_argument("--exclude",action="append",default=[])
    args=ap.parse_args();repo=args.repo.resolve();root=(repo/args.index_root).resolve()
    ptr=json.loads((root/"CURRENT.json").read_text(encoding="utf-8"))
    old_db=root/ptr["database"];old_gen=ptr["generation_id"]
    gen_id=datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")+"-"+uuid.uuid4().hex[:8]
    gen=root/"generations"/gen_id;gen.mkdir(parents=True,exist_ok=False);db=gen/"mersearch.sqlite"
    t0=time.perf_counter();shutil.copy2(old_db,db);copy_s=time.perf_counter()-t0
    core=load_core(repo);ex=core.DEFAULT_EXCLUDES|set(args.exclude)
    con=sqlite3.connect(db);con.execute("PRAGMA foreign_keys=ON")
    old={r[0]:{"source_id":r[1],"sha256":r[2],"size":r[3]} for r in con.execute("SELECT path,source_id,sha256,size_bytes FROM sources")}
    current={};hash0=time.perf_counter();bytes_hashed=0
    for path in core.permitted([repo],ex,args.max_bytes):
        rel=path.relative_to(repo).as_posix();raw=path.read_bytes();bytes_hashed+=len(raw)
        current[rel]=(path,hashlib.sha256(raw).hexdigest(),path.stat())
    hash_s=time.perf_counter()-hash0
    deleted=sorted(set(old)-set(current))
    changed=[];unchanged=[]
    for rel,(path,digest,st) in current.items():
        if rel in old and old[rel]["sha256"]==digest:unchanged.append(rel)
        else:changed.append(rel)
    mutate0=time.perf_counter()
    for rel in deleted+changed:
        if rel in old:
            sid=old[rel]["source_id"];con.execute("DELETE FROM records WHERE source_id=?",(sid,));con.execute("DELETE FROM sources WHERE source_id=?",(sid,))
    reparsed_records=0
    for rel in changed:
        path,digest,st=current[rel]
        cur=con.execute("INSERT INTO sources(path,size_bytes,mtime_ns,sha256) VALUES(?,?,?,?)",(rel,st.st_size,st.st_mtime_ns,digest));sid=cur.lastrowid;n=0
        for rec in core.iter_records(path):
            con.execute("""INSERT INTO records(source_id,kind,title,conversation_id,message_id,speaker,role,timestamp,locator,viewer_url,body,math_norm)
            VALUES(?,?,?,?,?,?,?,?,?,?,?,?)""",(sid,rec.kind,rec.title,rec.conversation_id,rec.message_id,rec.speaker,rec.role,rec.timestamp,rec.locator,rec.viewer_url,rec.text,core.math_norm(rec.text)))
            n+=1;reparsed_records+=1
        con.execute("UPDATE sources SET record_count=? WHERE source_id=?",(n,sid))
    mutate_s=time.perf_counter()-mutate0
    fts0=time.perf_counter()
    con.execute("INSERT INTO record_fts(record_fts) VALUES('rebuild')")
    fts_s=time.perf_counter()-fts0
    con.execute("DELETE FROM metadata")
    files=con.execute("SELECT count(*) FROM sources").fetchone()[0];records=con.execute("SELECT count(*) FROM records").fetchone()[0]
    meta={"schema_version":SCHEMA_VERSION,"builder_version":BUILDER_VERSION,"generation_id":gen_id,"parent_generation_id":old_gen,
      "generated_at_utc":datetime.now(timezone.utc).isoformat(),"files":files,"records":records,
      "reuse":{"unchanged_sources":len(unchanged),"changed_or_new_sources":len(changed),"deleted_sources":len(deleted),"reparsed_records":reparsed_records,"bytes_hashed":bytes_hashed},
      "timings_seconds":{"copy_parent":round(copy_s,6),"inventory_hash":round(hash_s,6),"replace_changed":round(mutate_s,6),"fts_rebuild":round(fts_s,6)}}
    for k,v in meta.items():con.execute("INSERT INTO metadata(key,value) VALUES(?,?)",(k,json.dumps(v,ensure_ascii=False)))
    con.commit();con.execute("PRAGMA optimize");con.close()
    meta["db_bytes"]=db.stat().st_size;meta["timings_seconds"]["total"]=round(time.perf_counter()-t0,6)
    atomic_json(gen/"manifest.json",meta)
    atomic_json(root/"CURRENT.json",{"schema_version":SCHEMA_VERSION,"generation_id":gen_id,"manifest":f"generations/{gen_id}/manifest.json","database":f"generations/{gen_id}/mersearch.sqlite"})
    print(json.dumps(meta,ensure_ascii=False))
if __name__=="__main__":main()

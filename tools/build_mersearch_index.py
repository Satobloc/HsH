#!/usr/bin/env python3
"""Build an immutable Mersearch 1.1-dev SQLite/FTS generation.

Development tool. Does not modify source files or the stable 1.0 release.
The builder imports the existing Core record extractors so indexed records retain
the same source/provenance interpretation while query acceleration is developed.

When the current generation was built with compatible settings, the builder clones
that immutable database and reparses only added/changed sources. Source hashes,
not mtimes, decide reuse. Publication remains an atomic pointer-file switch.
"""
from __future__ import annotations
import argparse, hashlib, importlib.util, json, os, shutil, sqlite3, sys, time, uuid
from datetime import datetime, timezone
from pathlib import Path

SCHEMA_VERSION="mersearch.index.v1"
BUILDER_VERSION="1.1-dev"

def load_core(repo:Path):
    p=repo/"tools/search_archive_content.py"
    spec=importlib.util.spec_from_file_location("mersearch_core_dev",p)
    mod=importlib.util.module_from_spec(spec);sys.modules[spec.name]=mod
    spec.loader.exec_module(mod)
    return mod

def atomic_json(path:Path,obj):
    tmp=path.with_suffix(path.suffix+".tmp")
    tmp.write_text(json.dumps(obj,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    os.replace(tmp,path)

def sha256_file(path:Path)->str:
    h=hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda:f.read(1024*1024),b""):
            h.update(chunk)
    return h.hexdigest()

def compatible_current(root:Path,max_bytes:int,ex:set[str]):
    """Return (db_path, generation_id) only for a settings-compatible green generation."""
    try:
        ptr=json.loads((root/"CURRENT.json").read_text(encoding="utf-8"))
        manifest=json.loads((root/ptr["manifest"]).read_text(encoding="utf-8"))
        db=root/ptr["database"]
    except (OSError,KeyError,ValueError,TypeError):
        return None
    if not db.is_file(): return None
    if manifest.get("schema_version")!=SCHEMA_VERSION: return None
    if manifest.get("builder_version")!=BUILDER_VERSION: return None
    # Older prototype manifests deliberately fail this gate once, establishing a
    # settings-stamped baseline before any incremental reuse is trusted.
    if manifest.get("max_bytes")!=max_bytes: return None
    if manifest.get("excluded_path_names")!=sorted(ex): return None
    return db,ptr.get("generation_id")

def create_schema(con:sqlite3.Connection):
    con.executescript("""
    PRAGMA journal_mode=DELETE;
    PRAGMA synchronous=FULL;
    CREATE TABLE metadata(key TEXT PRIMARY KEY,value TEXT NOT NULL);
    CREATE TABLE sources(
      source_id INTEGER PRIMARY KEY,path TEXT UNIQUE NOT NULL,size_bytes INTEGER,
      mtime_ns INTEGER,sha256 TEXT,record_count INTEGER NOT NULL DEFAULT 0);
    CREATE TABLE records(
      record_id INTEGER PRIMARY KEY,source_id INTEGER NOT NULL,kind TEXT,title TEXT,
      conversation_id TEXT,message_id TEXT,speaker TEXT,role TEXT,timestamp TEXT,
      locator TEXT,viewer_url TEXT,body TEXT NOT NULL,math_norm TEXT NOT NULL,
      FOREIGN KEY(source_id) REFERENCES sources(source_id));
    CREATE INDEX idx_records_date ON records(timestamp);
    CREATE INDEX idx_records_speaker ON records(speaker);
    CREATE INDEX idx_records_role ON records(role);
    CREATE INDEX idx_records_cid ON records(conversation_id);
    CREATE VIRTUAL TABLE record_fts USING fts5(body,title,speaker,role,conversation_id,content='records',content_rowid='record_id');
    """)

def add_source(con,core,path:Path,repo:Path,digest:str):
    rel=path.relative_to(repo).as_posix();st=path.stat()
    cur=con.execute("INSERT INTO sources(path,size_bytes,mtime_ns,sha256) VALUES(?,?,?,?)",(rel,st.st_size,st.st_mtime_ns,digest))
    sid=cur.lastrowid;n=0
    for rec in core.iter_records(path):
        cur=con.execute("""INSERT INTO records(source_id,kind,title,conversation_id,message_id,speaker,role,timestamp,locator,viewer_url,body,math_norm)
        VALUES(?,?,?,?,?,?,?,?,?,?,?,?)""",(sid,rec.kind,rec.title,rec.conversation_id,rec.message_id,rec.speaker,rec.role,rec.timestamp,rec.locator,rec.viewer_url,rec.text,core.math_norm(rec.text)))
        rid=cur.lastrowid
        con.execute("INSERT INTO record_fts(rowid,body,title,speaker,role,conversation_id) VALUES(?,?,?,?,?,?)",(rid,rec.text,rec.title,rec.speaker,rec.role,rec.conversation_id))
        n+=1
    con.execute("UPDATE sources SET record_count=? WHERE source_id=?",(n,sid))
    return n

def drop_source(con:sqlite3.Connection,sid:int):
    # External-content FTS rows must be removed before their content rows.
    rows=[r[0] for r in con.execute("SELECT record_id FROM records WHERE source_id=?",(sid,))]
    con.executemany("DELETE FROM record_fts WHERE rowid=?",((rid,) for rid in rows))
    con.execute("DELETE FROM records WHERE source_id=?",(sid,))
    con.execute("DELETE FROM sources WHERE source_id=?",(sid,))

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("repo",type=Path,nargs="?",default=Path("."))
    ap.add_argument("--index-root",type=Path,default=Path("indexes/mersearch"))
    ap.add_argument("--max-bytes",type=int,default=25_000_000)
    ap.add_argument("--exclude",action="append",default=[])
    ap.add_argument("--fail-before-publish",action="store_true",help=argparse.SUPPRESS)
    args=ap.parse_args()
    repo=args.repo.resolve();root=(repo/args.index_root).resolve()
    gen_id=datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")+"-"+uuid.uuid4().hex[:8]
    gen=root/"generations"/gen_id;gen.mkdir(parents=True,exist_ok=False)
    db=gen/"mersearch.sqlite";t0=time.perf_counter();core=load_core(repo)
    ex=core.DEFAULT_EXCLUDES|set(args.exclude)
    prior=compatible_current(root,args.max_bytes,ex)
    reused_from=None
    if prior:
        shutil.copy2(prior[0],db);reused_from=prior[1]
        con=sqlite3.connect(db)
        # Metadata describes this generation, not the cloned parent.
        con.execute("DELETE FROM metadata")
    else:
        con=sqlite3.connect(db);create_schema(con)

    scan0=time.perf_counter()
    paths=list(core.permitted([repo],ex,args.max_bytes))
    scanned={}
    source_bytes=bytes_hashed=0
    for path in paths:
        st=path.stat();digest=sha256_file(path)
        rel=path.relative_to(repo).as_posix()
        scanned[rel]=(path,st,digest);source_bytes+=st.st_size;bytes_hashed+=st.st_size

    old={row[1]:(row[0],row[2]) for row in con.execute("SELECT source_id,path,sha256 FROM sources")}
    removed=changed=added=reused=parsed_records=0
    # Remove sources absent from the new permitted set or whose bytes changed.
    for rel,(sid,digest) in list(old.items()):
        item=scanned.get(rel)
        if item is None:
            drop_source(con,sid);removed+=1
        elif item[2]!=digest:
            drop_source(con,sid);changed+=1
        else:
            path,st,_=item
            con.execute("UPDATE sources SET size_bytes=?,mtime_ns=? WHERE source_id=?",(st.st_size,st.st_mtime_ns,sid))
            reused+=1
    # Add new and changed sources. Changed paths were removed above.
    for rel,(path,st,digest) in scanned.items():
        if rel not in old or old[rel][1]!=digest:
            parsed_records+=add_source(con,core,path,repo,digest)
            if rel not in old: added+=1

    files=len(scanned)
    records=con.execute("SELECT COUNT(*) FROM records").fetchone()[0]
    scan_s=time.perf_counter()-scan0
    meta={"schema_version":SCHEMA_VERSION,"builder_version":BUILDER_VERSION,"generation_id":gen_id,
      "generated_at_utc":datetime.now(timezone.utc).isoformat(),"repo":str(repo),"max_bytes":args.max_bytes,
      "excluded_path_names":sorted(ex),"files":files,"records":records,"source_bytes":source_bytes,
      "incremental":{"reused_from_generation":reused_from,"reused_sources":reused,"added_sources":added,
                     "changed_sources":changed,"removed_sources":removed,"parsed_records":parsed_records,
                     "bytes_hashed":bytes_hashed},
      "timings_seconds":{"scan_hash_update":round(scan_s,6)}}
    for k,v in meta.items():con.execute("INSERT INTO metadata(key,value) VALUES(?,?)",(k,json.dumps(v,ensure_ascii=False)))
    con.commit();con.execute("PRAGMA optimize");con.close()
    meta["db_bytes"]=db.stat().st_size;meta["timings_seconds"]["total"]=round(time.perf_counter()-t0,6)
    atomic_json(gen/"manifest.json",meta)
    if args.fail_before_publish:
        raise RuntimeError("intentional pre-publication failure for retention testing")
    root.mkdir(parents=True,exist_ok=True)
    atomic_json(root/"CURRENT.json",{"schema_version":SCHEMA_VERSION,"generation_id":gen_id,"manifest":f"generations/{gen_id}/manifest.json","database":f"generations/{gen_id}/mersearch.sqlite"})
    print(json.dumps(meta,ensure_ascii=False))
if __name__=="__main__":main()

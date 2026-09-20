#!/usr/bin/env python3
"""Read-only probe for a Mersearch immutable SQLite generation."""
from __future__ import annotations
import argparse,json,sqlite3,time
from pathlib import Path

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("index_root",type=Path,nargs="?",default=Path("indexes/mersearch"))
    ap.add_argument("--match",required=True,help="SQLite FTS5 MATCH expression")
    ap.add_argument("--limit",type=int,default=25)
    ap.add_argument("--speaker");ap.add_argument("--role")
    args=ap.parse_args();t0=time.perf_counter()
    ptr=json.loads((args.index_root/"CURRENT.json").read_text(encoding="utf-8"))
    db=args.index_root/ptr["database"]
    con=sqlite3.connect(f"file:{db.resolve()}?mode=ro",uri=True);con.row_factory=sqlite3.Row
    where=["record_fts MATCH ?"];vals=[args.match]
    if args.speaker:where.append("r.speaker=?");vals.append(args.speaker)
    if args.role:where.append("r.role=?");vals.append(args.role)
    sql=f"""SELECT r.record_id,s.path,r.kind,r.title,r.conversation_id,r.message_id,r.speaker,r.role,r.timestamp,r.locator,
    snippet(record_fts,0,'[',']',' … ',24) AS excerpt
    FROM record_fts JOIN records r ON r.record_id=record_fts.rowid JOIN sources s ON s.source_id=r.source_id
    WHERE {' AND '.join(where)} ORDER BY r.timestamp,r.record_id LIMIT ?"""
    vals.append(args.limit)
    hits=[dict(x) for x in con.execute(sql,vals)]
    total_sql=f"""SELECT count(*) FROM record_fts JOIN records r ON r.record_id=record_fts.rowid
    WHERE {' AND '.join(where)}"""
    total=con.execute(total_sql,vals[:-1]).fetchone()[0];con.close()
    print(json.dumps({"schema_version":"mersearch.probe.v1","generation_id":ptr["generation_id"],"match":args.match,
      "total_results":total,"returned_hits":len(hits),"elapsed_ms":round((time.perf_counter()-t0)*1000,3),"hits":hits},ensure_ascii=False))
if __name__=="__main__":main()

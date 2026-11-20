#!/usr/bin/env python3
"""Mysearch durable priority queue and event ledger.

SQLite is suitable for local/CI tests. Production must use a persistent volume
or managed transactional database, not ephemeral GitHub Actions runner storage.
Canonical timestamps are UTC; Nathan-facing timestamps use America/New_York.
"""
from __future__ import annotations
import argparse, json, sqlite3, uuid
from datetime import datetime, timezone, timedelta
from pathlib import Path
from zoneinfo import ZoneInfo

ET = ZoneInfo("America/New_York")
PRIORITY = {"nathan_direct": 0, "mysearch_expedited": 1, "mersearch_batch": 2}

def now():
    return datetime.now(timezone.utc).isoformat(timespec="milliseconds").replace("+00:00", "Z")

def et(value):
    if not value: return None
    return datetime.fromisoformat(value.replace("Z", "+00:00")).astimezone(ET).isoformat(timespec="seconds")

def connect(path):
    p = Path(path); p.parent.mkdir(parents=True, exist_ok=True)
    c = sqlite3.connect(p, timeout=30, isolation_level=None)
    c.row_factory = sqlite3.Row
    c.execute("PRAGMA journal_mode=WAL")
    c.execute("PRAGMA synchronous=FULL")
    c.execute("PRAGMA foreign_keys=ON")
    c.executescript("""
    CREATE TABLE IF NOT EXISTS requests(
      request_id TEXT PRIMARY KEY, requester TEXT NOT NULL, lane TEXT NOT NULL,
      priority INTEGER NOT NULL, state TEXT NOT NULL, query TEXT NOT NULL,
      payload_json TEXT NOT NULL, created_at_utc TEXT NOT NULL,
      updated_at_utc TEXT NOT NULL, worker_id TEXT, lease_until_utc TEXT,
      checkpoint_json TEXT, attempt INTEGER NOT NULL DEFAULT 0,
      result_path TEXT, error TEXT
    );
    CREATE INDEX IF NOT EXISTS q_order ON requests(state,priority,created_at_utc);
    CREATE TABLE IF NOT EXISTS events(
      event_id INTEGER PRIMARY KEY AUTOINCREMENT, request_id TEXT NOT NULL,
      event TEXT NOT NULL, from_state TEXT, to_state TEXT,
      event_at_utc TEXT NOT NULL, worker_id TEXT, detail_json TEXT,
      FOREIGN KEY(request_id) REFERENCES requests(request_id)
    );
    CREATE INDEX IF NOT EXISTS events_req ON events(request_id,event_id);
    CREATE TABLE IF NOT EXISTS service_control(
      key TEXT PRIMARY KEY,value TEXT NOT NULL,updated_at_utc TEXT NOT NULL
    );
    """)
    return c

def add_event(c, rid, name, old, new, worker=None, detail=None):
    c.execute("""INSERT INTO events(request_id,event,from_state,to_state,event_at_utc,worker_id,detail_json)
      VALUES(?,?,?,?,?,?,?)""", (rid,name,old,new,now(),worker,json.dumps(detail or {},ensure_ascii=False)))

def submit(c, requester, lane, query, payload=None, request_id=None):
    rid=request_id or str(uuid.uuid4()); p=PRIORITY[lane]; t=now()
    c.execute("BEGIN IMMEDIATE")
    try:
        c.execute("""INSERT INTO requests(request_id,requester,lane,priority,state,query,payload_json,created_at_utc,updated_at_utc)
          VALUES(?,?,?,?,?,?,?,?,?)""",(rid,requester,lane,p,"QUEUED",query,json.dumps(payload or {},ensure_ascii=False),t,t))
        add_event(c,rid,"SUBMITTED",None,"QUEUED",detail={"lane":lane,"priority":p})
        if lane=="nathan_direct":
            c.execute("""INSERT INTO service_control(key,value,updated_at_utc) VALUES('preempt_requested',?,?)
              ON CONFLICT(key) DO UPDATE SET value=excluded.value,updated_at_utc=excluded.updated_at_utc""",(rid,t))
            active=c.execute("""SELECT request_id,state FROM requests WHERE lane IN ('mysearch','mysearch_expedited')
              AND state IN ('CLAIMED','RUNNING') ORDER BY created_at_utc LIMIT 1""").fetchone()
            if active: add_event(c,active["request_id"],"PREEMPT_REQUESTED",active["state"],active["state"],detail={"by":rid,"cooperative":True})
        c.execute("COMMIT")
    except:
        c.execute("ROLLBACK"); raise
    return receipt(c,rid)

def receipt(c,rid):
    r=c.execute("SELECT * FROM requests WHERE request_id=?",(rid,)).fetchone()
    if not r: raise KeyError(rid)
    queued=c.execute("""SELECT request_id,lane,state,created_at_utc,updated_at_utc,priority FROM requests
      WHERE state='QUEUED' ORDER BY priority,created_at_utc,request_id""").fetchall() if r["state"]=="QUEUED" else []
    predecessors=[]
    for x in queued:
        if x["request_id"]==rid: break
        # Only work scheduled before this request is reported as ahead.
        if x["priority"]<=r["priority"]: predecessors.append(x)
    pos=len(predecessors)+1 if r["state"]=="QUEUED" else None
    rows=[dict(position=i+1,request_id=x["request_id"],lane=x["lane"],state=x["state"],
      submitted_at_utc=x["created_at_utc"],submitted_at_et=et(x["created_at_utc"]),
      last_event_at_utc=x["updated_at_utc"],last_event_at_et=et(x["updated_at_utc"])) for i,x in enumerate(predecessors)]
    last=c.execute("SELECT event_at_utc FROM events WHERE request_id=? ORDER BY event_id DESC LIMIT 1",(rid,)).fetchone()
    observed=now()
    return {"request_id":rid,"lane":r["lane"],"state":r["state"],"priority":r["priority"],
      "position":pos,"ahead":len(rows),"requests_ahead":rows,
      "submitted_at_utc":r["created_at_utc"],"submitted_at_et":et(r["created_at_utc"]),
      "last_event_at_utc":last[0] if last else r["updated_at_utc"],
      "last_event_at_et":et(last[0] if last else r["updated_at_utc"]),
      "observed_at_utc":observed,"observed_at_et":et(observed),"display_timezone":"America/New_York"}

def claim(c,worker,lease_seconds=120):
    c.execute("BEGIN IMMEDIATE")
    try:
        r=c.execute("SELECT * FROM requests WHERE state='QUEUED' ORDER BY priority,created_at_utc,request_id LIMIT 1").fetchone()
        if not r: c.execute("COMMIT"); return None
        t=now(); lease=(datetime.now(timezone.utc)+timedelta(seconds=lease_seconds)).isoformat(timespec="milliseconds").replace("+00:00","Z")
        c.execute("""UPDATE requests SET state='CLAIMED',worker_id=?,lease_until_utc=?,updated_at_utc=?,attempt=attempt+1
          WHERE request_id=? AND state='QUEUED'""",(worker,lease,t,r["request_id"]))
        add_event(c,r["request_id"],"CLAIMED","QUEUED","CLAIMED",worker,{"lease_until_utc":lease})
        c.execute("COMMIT")
    except:
        c.execute("ROLLBACK"); raise
    return receipt(c,r["request_id"])

def transition(c,rid,state,worker=None,detail=None):
    c.execute("BEGIN IMMEDIATE")
    try:
        r=c.execute("SELECT state FROM requests WHERE request_id=?",(rid,)).fetchone()
        if not r: raise KeyError(rid)
        t=now(); c.execute("UPDATE requests SET state=?,updated_at_utc=? WHERE request_id=?",(state,t,rid))
        add_event(c,rid,state,r["state"],state,worker,detail); c.execute("COMMIT")
    except:
        c.execute("ROLLBACK"); raise
    return receipt(c,rid)

def should_yield(c,rid):
    x=c.execute("SELECT value FROM service_control WHERE key='preempt_requested'").fetchone()
    return bool(x and x[0] and x[0]!=rid)

def yield_checkpoint(c,rid,worker,checkpoint):
    c.execute("BEGIN IMMEDIATE")
    try:
        r=c.execute("SELECT state FROM requests WHERE request_id=?",(rid,)).fetchone()
        if not r: raise KeyError(rid)
        t=now(); c.execute("""UPDATE requests SET state='QUEUED',worker_id=NULL,lease_until_utc=NULL,
          checkpoint_json=?,updated_at_utc=? WHERE request_id=?""",(json.dumps(checkpoint),t,rid))
        add_event(c,rid,"YIELDED_FOR_PRIORITY",r["state"],"QUEUED",worker,{"checkpoint":checkpoint,"handoff_class":"mersearch_expedited"})
        c.execute("UPDATE requests SET lane='mysearch_expedited',priority=1 WHERE request_id=?",(rid,))
        c.execute("COMMIT")
    except:
        c.execute("ROLLBACK"); raise
    return receipt(c,rid)

def main():
    ap=argparse.ArgumentParser(); ap.add_argument("--db",default="var/mysearch/queue.sqlite")
    sp=ap.add_subparsers(dest="cmd",required=True)
    s=sp.add_parser("submit"); s.add_argument("--requester",required=True); s.add_argument("--lane",choices=PRIORITY,required=True); s.add_argument("--query",required=True); s.add_argument("--payload",default="{}"); s.add_argument("--id")
    st=sp.add_parser("status"); st.add_argument("request_id")
    cl=sp.add_parser("claim"); cl.add_argument("--worker",required=True); cl.add_argument("--lease",type=int,default=120)
    ev=sp.add_parser("event"); ev.add_argument("request_id"); ev.add_argument("--state",required=True); ev.add_argument("--worker")
    pr=sp.add_parser("preempt"); pr.add_argument("request_id")
    hist=sp.add_parser("history"); hist.add_argument("request_id")
    a=ap.parse_args(); c=connect(a.db)
    if a.cmd=="submit": out=submit(c,a.requester,a.lane,a.query,json.loads(a.payload),a.id)
    elif a.cmd=="status": out=receipt(c,a.request_id)
    elif a.cmd=="claim": out=claim(c,a.worker,a.lease)
    elif a.cmd=="event": out=transition(c,a.request_id,a.state,a.worker)
    elif a.cmd=="preempt": out={"yield_requested":should_yield(c,a.request_id)}
    else:
        out=[dict(x) for x in c.execute("SELECT event,from_state,to_state,event_at_utc,worker_id,detail_json FROM events WHERE request_id=? ORDER BY event_id",(a.request_id,))]
        for x in out: x["event_at_et"]=et(x["event_at_utc"])
    print(json.dumps(out,ensure_ascii=False,indent=2))
if __name__=="__main__": main()

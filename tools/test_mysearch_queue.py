#!/usr/bin/env python3
"""Mysearch queue priority, event history, preemption and timezone tests."""
import importlib.util,tempfile
from pathlib import Path
spec=importlib.util.spec_from_file_location("mq",Path(__file__).with_name("mysearch_queue.py"))
m=importlib.util.module_from_spec(spec); spec.loader.exec_module(m)
with tempfile.TemporaryDirectory() as d:
 c=m.connect(Path(d)/"q.sqlite")
 m.submit(c,"worker-a","mersearch_batch","one",request_id="batch")
 m.submit(c,"worker-b","mysearch_expedited","two",request_id="exp")
 n=m.submit(c,"Nathan","nathan_direct","three",request_id="direct")
 assert n["position"]==1 and n["ahead"]==0 and n["requests_ahead"]==[]
 assert m.should_yield(c,"batch")
 assert m.receipt(c,"exp")["requests_ahead"] == [{"position":1,"request_id":"direct","lane":"nathan_direct","state":"QUEUED","submitted_at_utc":n["submitted_at_utc"],"submitted_at_et":n["submitted_at_et"],"last_event_at_utc":n["last_event_at_utc"],"last_event_at_et":n["last_event_at_et"]}]
 got=m.claim(c,"test-worker"); assert got["request_id"]=="direct"
 m.transition(c,"direct","RUNNING","test-worker")
 m.yield_checkpoint(c,"exp","test-worker",{"cursor":"phase-2"})
 assert m.receipt(c,"exp")["state"]=="QUEUED"
 assert m.et("2026-11-20T18:00:00Z").endswith("-05:00")
 assert c.execute("SELECT count(*) FROM events").fetchone()[0]>=6
print("PASS Mysearch priority, event history, queue receipt and Eastern conversion")

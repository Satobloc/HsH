#!/usr/bin/env python3
"""Mysearch absolute-priority interruption, handoff, receipt and timezone tests."""
import importlib.util,tempfile
from pathlib import Path
spec=importlib.util.spec_from_file_location("mq",Path(__file__).with_name("mysearch_queue.py"))
m=importlib.util.module_from_spec(spec); spec.loader.exec_module(m)

with tempfile.TemporaryDirectory() as d:
    c=m.connect(Path(d)/"q.sqlite")

    # Worker use requires explicit acknowledgement of interruption risk.
    try:
        m.submit(c,"worker-no-consent","mysearch_expedited","rejected",request_id="no-consent")
        raise AssertionError("worker submission without risk consent was accepted")
    except PermissionError:
        pass

    # A worker who accepts the risk gets the Mysearch slot.
    m.submit(c,"worker-a","mysearch_expedited","active search",request_id="active",risk_acknowledged=True)
    active=m.claim(c,"worker-a")
    assert active["request_id"]=="active"
    m.transition(c,"active","RUNNING","worker-a")
    m.transition(c,"active","PACKAGING","worker-a")

    # Another worker is waiting in the Mysearch queue.
    m.submit(c,"worker-b","mysearch_expedited","queued search",request_id="queued",risk_acknowledged=True)

    # Nathan's direct request interrupts the active worker and moves queued
    # worker jobs to the durable expedited Mersearch handoff outbox.
    try:
        m.submit(c,"spoofed-worker","nathan_direct","spoofed",request_id="spoofed")
        raise AssertionError("unauthenticated Nathan priority was accepted")
    except PermissionError:
        pass
    direct=m.submit(c,"Nathan","nathan_direct","urgent direct search",request_id="direct",authorized_nathan=True)
    assert direct["position"]==1 and direct["ahead"]==0
    state=c.execute("SELECT state FROM requests WHERE request_id='active'").fetchone()[0]
    assert state=="INTERRUPT_REQUESTED"
    state=c.execute("SELECT state FROM requests WHERE request_id='queued'").fetchone()[0]
    assert state=="HANDOFF_PENDING"
    assert c.execute("SELECT target_class FROM handoff_outbox WHERE request_id='queued'").fetchone()[0]=="mersearch_expedited"
    accepted=m.acknowledge_handoff(c,"queued",{"mersearch_request_id":"mer-queued"})
    assert accepted["state"]=="HANDOFF_ACCEPTED"
    event_count=c.execute("SELECT count(*) FROM events WHERE request_id='queued'").fetchone()[0]
    m.acknowledge_handoff(c,"queued",{"mersearch_request_id":"mer-queued"})
    assert c.execute("SELECT count(*) FROM events WHERE request_id='queued'").fetchone()[0]==event_count

    # Supervisor termination is recorded without requiring a checkpoint.
    interrupts=m.interrupt_list(c)
    assert interrupts and interrupts[0]["request_id"]=="active"
    assert m.claim(c,"must-wait-for-termination") is None
    m.transition(c,"active","INTERRUPTED","worker-a",{"return_code":-9,"partial_output":"discarded"})
    assert c.execute("SELECT target_class FROM handoff_outbox WHERE request_id='active'").fetchone()[0]=="mersearch_expedited"

    # Nathan's request claims before any queued lower-priority work.
    got=m.claim(c,"nathan-worker")
    assert got["request_id"]=="direct"

    # Workers submitting while Nathan is queued/running are routed to Mersearch.
    m.submit(c,"worker-c","mysearch_expedited","later search",request_id="later",risk_acknowledged=True)
    assert m.receipt(c,"later")["state"]=="HANDOFF_PENDING"

    # Every event has UTC and Eastern representations; ET changes with DST rules.
    assert m.et("2026-11-20T18:00:00Z").endswith("-05:00")
    assert m.et("2026-07-20T18:00:00Z").endswith("-04:00")
    history=c.execute("SELECT event FROM events WHERE request_id='active' ORDER BY event_id").fetchall()
    names=[x[0] for x in history]
    assert "FORCE_INTERRUPT_REQUESTED" in names and "INTERRUPTED" in names and "HANDOFF_PENDING" in names
    assert c.execute("SELECT count(*) FROM handoff_outbox").fetchone()[0]==3
    assert len(m.handoff_outbox(c))==2
print("PASS Mysearch absolute priority, immediate interrupt state, durable handoff outbox and ET/EDT")

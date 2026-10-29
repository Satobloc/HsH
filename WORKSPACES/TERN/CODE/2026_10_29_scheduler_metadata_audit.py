#!/usr/bin/env python3
"""Audit real Oct 29 2026 five-lease scheduler records; not physical data.
Provenance: individually retrieved ChatGPT automation peek records.
The next_run_time=None field does not establish a failed future dispatch.
"""
from datetime import datetime

OBS = [
    (":00", "2026-10-29T07:00:00Z", "2026-10-29T06:57:00.234500Z", "2026-10-29T07:03:48.247834Z", True, "completed", None),
    (":12", "2026-10-29T06:12:00Z", "2026-10-29T06:14:59.794045Z", "2026-10-29T06:23:03.946908Z", True, "completed", None),
    (":24", "2026-10-29T06:24:00Z", "2026-10-29T06:21:44.000971Z", "2026-10-29T06:27:49.789709Z", True, "completed", None),
    (":36", "2026-10-29T06:36:00Z", "2026-10-29T06:35:02.847935Z", "2026-10-29T06:51:58.849488Z", True, "completed", None),
    (":48", "2026-10-29T06:48:00Z", "2026-10-29T06:43:30.133099Z", "2026-10-29T06:52:04.715529Z", True, "completed", None),
]

def parse(value):
    return datetime.fromisoformat(value.replace("Z", "+00:00"))

rows = []
for phase, scheduled, started, ended, enabled, status, next_run in OBS:
    t0, t1, t2 = map(parse, (scheduled, started, ended))
    offset_us = int((t1 - t0).total_seconds() * 1_000_000)
    runtime_us = int((t2 - t1).total_seconds() * 1_000_000)
    assert runtime_us > 0
    rows.append((phase, offset_us, runtime_us, enabled, status, next_run))
    print(f"{phase} start_offset_us={offset_us} runtime_us={runtime_us} status={status} next={next_run}")

assert len(rows) == 5
assert all(row[3] is True for row in rows)
assert all(row[4] == "completed" for row in rows)
assert all(row[5] is None for row in rows)
assert sum(row[1] < 0 for row in rows) == 4
assert sum(row[1] > 0 for row in rows) == 1
assert sum(row[2] > 900_000_000 for row in rows) == 1
print("SEVEN SOURCE-ANCHORED ADMINISTRATIVE ASSERTIONS PASSED")

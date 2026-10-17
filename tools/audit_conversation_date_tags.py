#!/usr/bin/env python3
"""Verify filename date tags against original structured conversation timestamps.

Only standalone JSON documents that parse as conversation exports are
considered eligible. Plaintext files and arbitrary JSON are not assigned
fabricated dates. Reports exceptional sources instead of silently skipping them.
"""
from __future__ import annotations

import argparse
import json
from datetime import datetime, timezone
from pathlib import Path
from zoneinfo import ZoneInfo

try:
    from . import date_conversation_exports as dates
except ImportError:
    import date_conversation_exports as dates

ROOTS=("DEVELOPMENT_FULL_CONVOS", "LIVE CONVOS")

def audit(root:Path)->dict:
    records=dates.build_records(root,ZoneInfo(dates.DEFAULT_TIMEZONE))
    counts={"dated_and_correct":0,"needs_renaming":0,
            "unresolved_collisions":0,"undatable_conversations":0,
            "skipped_not_conversations_or_bad_json":0}
    issues=[]
    for record in records:
        source=Path(record.old_path)
        if record.status=="unchanged" and dates.PREFIX_RE.match(source.name):
            counts["dated_and_correct"]+=1
        elif record.status in ("planned","renamed"):
            counts["needs_renaming"]+=1
            issues.append({"path":record.old_path,"status":record.status,
                           "expected":record.new_path,"warnings":record.warnings})
        elif record.status=="collision":
            counts["unresolved_collisions"]+=1
            issues.append({"path":record.old_path,"status":"collision",
                           "expected":record.new_path,"warnings":record.warnings})
        elif record.status=="skipped":
            try:
                data=dates.load_conversation(source)
                timestamps,n=dates.message_timestamps(data)
                is_conversation=isinstance(data.get("mapping"),dict) and n>0
            except (OSError,UnicodeError,ValueError,json.JSONDecodeError):
                is_conversation=False
            if is_conversation:
                counts["undatable_conversations"]+=1
                issues.append({"path":record.old_path,"status":"undatable",
                               "warnings":record.warnings})
            else:
                counts["skipped_not_conversations_or_bad_json"]+=1
        else:
            issues.append({"path":record.old_path,"status":record.status,
                           "warnings":record.warnings})
    return {"root":str(root),"counts":counts,"exceptions":issues}

def main()->int:
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument("--output",type=Path,default=Path("indexes/manifests/date-tag-audit.json"))
    p.add_argument("--strict",action="store_true",help="fail if any datable conversation is untagged, colliding, or impossible to date")
    args=p.parse_args()
    checked=[audit(Path(name)) for name in ROOTS if Path(name).is_dir()]
    outcome={
      "schema_version":1,
      "generated_at_utc":datetime.now(timezone.utc).isoformat(),
      "date_basis":"original message timestamps; original conversation timestamps only as explicit fallback",
      "roots":checked,
      "overall_counts":{k:sum(entry["counts"][k] for entry in checked)
                       for k in ("dated_and_correct","needs_renaming",
                                 "unresolved_collisions","undatable_conversations",
                                 "skipped_not_conversations_or_bad_json")},
    }
    outcome["fully_tagged"]=all(
        outcome["overall_counts"][key]==0
        for key in ("needs_renaming","unresolved_collisions","undatable_conversations"))
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(outcome,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print(json.dumps({"fully_tagged":outcome["fully_tagged"],
                      "counts":outcome["overall_counts"],"output":str(args.output)},
                     ensure_ascii=False))
    return 1 if args.strict and not outcome["fully_tagged"] else 0

if __name__=="__main__":
    raise SystemExit(main())

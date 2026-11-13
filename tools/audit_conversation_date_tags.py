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

ROOTS=("DEVELOPMENT_FULL_CONVOS", "LIVE CONVOS", ".")

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
    all_datable_tagged = (
        counts["needs_renaming"] == 0
        and counts["unresolved_collisions"] == 0
    )
    all_conversations_have_dates = counts["undatable_conversations"] == 0
    return {
        "root":str(root),
        "counts":counts,
        "exceptions":issues,
        "all_datable_tagged":all_datable_tagged,
        "all_conversations_have_dates":all_conversations_have_dates,
        "fully_tagged":all_datable_tagged and all_conversations_have_dates,
    }

def main()->int:
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument("--output",type=Path,default=Path("indexes/manifests/date-tag-audit.json"))
    p.add_argument(
        "--strict",
        action="store_true",
        help=(
            "fail if a datable conversation needs a date prefix or has an "
            "unresolved filename collision; legitimate undatable exceptions "
            "remain reported but do not block the strict gate"
        ),
    )
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
    outcome["all_datable_tagged"] = (
        outcome["overall_counts"]["needs_renaming"] == 0
        and outcome["overall_counts"]["unresolved_collisions"] == 0
    )
    outcome["all_conversations_have_dates"] = (
        outcome["overall_counts"]["undatable_conversations"] == 0
    )
    # Preserve the legacy completeness meaning: every recognized conversation
    # has a date AND every datable conversation has the correct filename prefix.
    outcome["fully_tagged"] = (
        outcome["all_datable_tagged"]
        and outcome["all_conversations_have_dates"]
    )
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(outcome,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print(json.dumps({
        "all_datable_tagged":outcome["all_datable_tagged"],
        "all_conversations_have_dates":outcome["all_conversations_have_dates"],
        "fully_tagged":outcome["fully_tagged"],
        "counts":outcome["overall_counts"],
        "output":str(args.output),
    }, ensure_ascii=False))
    return 1 if args.strict and not outcome["all_datable_tagged"] else 0

if __name__=="__main__":
    raise SystemExit(main())

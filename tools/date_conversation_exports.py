#!/usr/bin/env python3
"""Prefix ChatGPT conversation-export filenames with their date range.

Default filename form:
    YY.MM.DD•YY.MM.DD•Original filename.json

Dates are rendered in America/New_York (EST/EDT as appropriate). The program is
a dry run unless --apply is supplied, and every run writes a JSON audit manifest.

A collision is isolated to the affected source by default: unrelated safe
renames still proceed. Use --atomic to retain the older all-or-nothing behavior.
"""
from __future__ import annotations
import argparse, json, re, sys
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterable
from zoneinfo import ZoneInfo, ZoneInfoNotFoundError

DEFAULT_ROOT=Path("DEVELOPMENT_FULL_CONVOS"); DEFAULT_TIMEZONE="America/New_York"
PREFIX_RE=re.compile(r"^\d{2}\.\d{2}\.\d{2}•\d{2}\.\d{2}\.\d{2}•")
ALLOWED_SUFFIXES={".json",".txt"}; HUMAN_ROLES={"user","assistant"}

@dataclass
class RenameRecord:
    old_path:str; new_path:str|None; start_local:str|None; end_local:str|None
    timestamp_source:str|None; message_count:int; status:str; warnings:list[str]

def numeric_timestamp(value:Any)->float|None:
    if isinstance(value,(int,float)) and value>0:return float(value)
    if isinstance(value,str):
        try: parsed=float(value)
        except ValueError:return None
        return parsed if parsed>0 else None
    return None

def active_node_ids(data:dict[str,Any],mapping:dict[str,Any])->set[str]:
    current=data.get("current_node")
    if not isinstance(current,str) or current not in mapping:return set(mapping)
    selected=set(); node_id=current
    while node_id and node_id in mapping and node_id not in selected:
        selected.add(node_id); parent=mapping[node_id].get("parent")
        node_id=parent if isinstance(parent,str) else None
    return selected

def message_timestamps(data:dict[str,Any])->tuple[list[float],int]:
    mapping=data.get("mapping")
    if not isinstance(mapping,dict):return [],0
    timestamps=[]; count=0
    for node_id in active_node_ids(data,mapping):
        node=mapping.get(node_id)
        if not isinstance(node,dict):continue
        message=node.get("message")
        if not isinstance(message,dict):continue
        author=message.get("author"); role=author.get("role") if isinstance(author,dict) else None
        if role not in HUMAN_ROLES:continue
        count+=1; stamp=numeric_timestamp(message.get("create_time"))
        if stamp is None:stamp=numeric_timestamp(message.get("update_time"))
        if stamp is not None:timestamps.append(stamp)
    return timestamps,count

def date_range(data:dict[str,Any])->tuple[float,float,str,int,list[str]]:
    warnings=[]; timestamps,count=message_timestamps(data)
    if timestamps:
        if len(timestamps)<count:warnings.append(f"{count-len(timestamps)} user/assistant messages lacked timestamps")
        return min(timestamps),max(timestamps),"message.create_time",count,warnings
    fallback=[numeric_timestamp(data.get("create_time")),numeric_timestamp(data.get("update_time"))]
    fallback=[s for s in fallback if s is not None]
    if fallback:
        warnings.append("No usable message timestamps; used top-level conversation times")
        return min(fallback),max(fallback),"conversation.create_time/update_time",count,warnings
    raise ValueError("no usable conversation or message timestamps")

def load_conversation(path:Path)->dict[str,Any]:
    with path.open("r",encoding="utf-8-sig") as h:data=json.load(h)
    if isinstance(data,list) and len(data)==1 and isinstance(data[0],dict):data=data[0]
    if not isinstance(data,dict):raise ValueError("expected one conversation object")
    return data

def candidates(root:Path)->Iterable[Path]:
    for path in sorted(root.rglob("*")):
        if path.is_file() and path.suffix.lower() in ALLOWED_SUFFIXES:yield path

def local_datetime(stamp:float,tz:ZoneInfo)->datetime:
    return datetime.fromtimestamp(stamp,tz=timezone.utc).astimezone(tz)

def clean_original_name(name:str)->str:return PREFIX_RE.sub("",name,count=1)

def build_records(root:Path,tz:ZoneInfo)->list[RenameRecord]:
    records=[]; proposed_targets={}
    for path in candidates(root):
        warnings=[]
        try:
            data=load_conversation(path); start,end,source,count,warnings=date_range(data)
            start_dt=local_datetime(start,tz); end_dt=local_datetime(end,tz)
            prefix=f"{start_dt:%y.%m.%d}•{end_dt:%y.%m.%d}•"; target=path.with_name(prefix+clean_original_name(path.name))
            status="unchanged" if target==path else "planned"
            if target!=path and target.exists():
                status="collision"; warnings.append("Target path already exists")
            elif target in proposed_targets and proposed_targets[target]!=path:
                status="collision"; warnings.append(f"Another source proposes the same target: {proposed_targets[target]}")
            else:proposed_targets[target]=path
            records.append(RenameRecord(str(path),str(target),start_dt.isoformat(),end_dt.isoformat(),source,count,status,warnings))
        except (OSError,UnicodeError,json.JSONDecodeError,ValueError) as exc:
            records.append(RenameRecord(str(path),None,None,None,None,0,"skipped",[str(exc)]))
    return records

def write_manifest(path:Path,root:Path,timezone_name:str,apply:bool,records:list[RenameRecord])->None:
    summary={}
    for r in records:summary[r.status]=summary.get(r.status,0)+1
    payload={"generated_at_utc":datetime.now(timezone.utc).isoformat(),"root":str(root),"timezone":timezone_name,
             "mode":"apply" if apply else "dry-run","filename_format":"YY.MM.DD•YY.MM.DD•OriginalName.ext",
             "summary":summary,"records":[asdict(r) for r in records]}
    path.parent.mkdir(parents=True,exist_ok=True); path.write_text(json.dumps(payload,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")

def parse_args()->argparse.Namespace:
    p=argparse.ArgumentParser(description=__doc__); p.add_argument("root",nargs="?",type=Path,default=DEFAULT_ROOT)
    p.add_argument("--timezone",default=DEFAULT_TIMEZONE); p.add_argument("--manifest",type=Path,default=Path("conversation-rename-manifest.json"))
    p.add_argument("--apply",action="store_true",help="perform safe planned renames")
    p.add_argument("--atomic",action="store_true",help="with --apply, block all renames if any collision exists (legacy behavior)")
    return p.parse_args()

def main()->int:
    args=parse_args()
    if not args.root.is_dir():print(f"error: directory not found: {args.root}",file=sys.stderr);return 2
    try:tz=ZoneInfo(args.timezone)
    except ZoneInfoNotFoundError:print(f"error: unknown timezone: {args.timezone}",file=sys.stderr);return 2
    records=build_records(args.root,tz); blockers=[r for r in records if r.status=="collision"]
    if args.apply and args.atomic and blockers:
        for r in records:
            if r.status=="planned":r.status="blocked";r.warnings.append("Atomic mode: no files renamed because at least one collision exists")
    elif args.apply:
        for r in records:
            if r.status=="planned" and r.new_path is not None:
                Path(r.old_path).rename(r.new_path);r.status="renamed"
    write_manifest(args.manifest,args.root,args.timezone,args.apply,records)
    counts={}
    for r in records:counts[r.status]=counts.get(r.status,0)+1
    print("; ".join(f"{k}={counts[k]}" for k in sorted(counts)));print(f"manifest={args.manifest}")
    # Collisions are reported in the manifest but no longer fail a non-atomic run:
    # one duplicate must not strand unrelated new uploads.
    return 1 if (blockers and args.atomic) else 0

if __name__=="__main__":raise SystemExit(main())

#!/usr/bin/env python3
"""Research-only HsH conversation-location audit (NOT the public Viewer).

Find likely raw conversation exports outside organized SAT_CONVOS folders,
including HsH repository root. Compare exact source paths with the existing
public Viewer catalog, without reading private/quarantined records or silently
publishing new conversations.

Only filename/byte metadata is claimed: conversation structure, message
authorship, export identity and actual date remain UNVERIFIED until inspected.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import Counter
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import quote

SKIP_DIRS={".git","PRIOR_ART","QUARANTINE",".mersearch","node_modules"}
SKIP_TOP={"CONVERSATION_VIEWER","PUBLIC_SITE","WORKSPACES","indexes","tools",
          ".github","generated","LIBRARY","SAT_VISUALS","PLAYGROUNDS"}
RAW_EXPORT=re.compile(r"(?i)(?:raw(?:\s*[-—_.]\s*|\b)|convo(?:s|versation)?(?:\s|[-_.]|$))")
SUFFIXES={".json",".txt",".text",".md",".markdown",".log",".backup",""}
MAX_HASH_BYTES=32_000_000

def kind(rel:Path)->str|None:
    parts=rel.parts
    if not parts or any(x.casefold() in {e.casefold() for e in SKIP_DIRS} for x in parts):
        return None
    if len(parts)==1:
        if RAW_EXPORT.search(rel.name) and rel.suffix.lower() in SUFFIXES:
            return "ROOT_OUTSIDE_ORGANIZING_FOLDERS"
        return None
    if parts[0]=="DEVELOPMENT_FULL_CONVOS" and len(parts)==2:
        if RAW_EXPORT.search(rel.name) and rel.suffix.lower() in SUFFIXES:
            return "LOOSE_DEVELOPMENT_CONVERSATION"
        return None
    if parts[0]=="LIVE CONVOS" and len(parts)==2:
        if RAW_EXPORT.search(rel.name) and rel.suffix.lower() in SUFFIXES:
            return "LOOSE_LIVE_CONVERSATION"
        return None
    if parts[0] not in SKIP_TOP | {"DEVELOPMENT_FULL_CONVOS","LIVE CONVOS"}:
        if RAW_EXPORT.search(rel.name) and rel.suffix.lower() in SUFFIXES:
            return "OTHER_UNFILED_CONVERSATION_CANDIDATE"
    return None

def audit(root:Path, catalog_path:Path)->dict:
    root=root.resolve()
    catalog=json.loads(catalog_path.read_text(encoding="utf-8"))
    indexed={v.get("path","") for v in catalog.get("conversations",[]) if isinstance(v,dict)}
    stats=Counter();items=[]
    for path in sorted(root.rglob("*")):
        if path.is_symlink() or not path.is_file():
            continue
        try:rel=path.relative_to(root)
        except ValueError:continue
        classification=kind(rel)
        if classification is None:continue
        size=path.stat().st_size
        stats["candidates"]+=1
        stats[classification]+=1
        if size<=MAX_HASH_BYTES:
            digest=hashlib.sha256(path.read_bytes()).hexdigest()
            identity="sha256"
        else:
            digest=None
            identity="SIZE_TOO_LARGE_FOR_AUDIT_HASH"
            stats["unhashed_oversized"]+=1
        source=rel.as_posix()
        in_viewer=source in indexed
        if not in_viewer:stats["not_in_viewer"]+=1
        items.append({
            "source":source,"classification":classification,"size_bytes":size,
            "content_hash":digest,"content_hash_kind":identity,
            "viewer_catalog_includes_source":in_viewer,
            "research_ingestion_status":"LOCATION_ONLY_NOT_CONTENT_READ",
            "message_provenance_verified":False,
            "direct_url":"https://github.com/Satobloc/HsH/blob/main/"+quote(source,safe="/"),
            "publication_action":"NONE; NEVER AUTO_ADD_TO_PUBLIC_VIEWER"
        })
    return {
        "schema":"mercer.hsh-out-of-folder-conversation-audit.v1",
        "generated_at_utc":datetime.now(timezone.utc).isoformat(),
        "repository":"Satobloc/HsH",
        "source_scope":"candidate filenames outside regular conversation organizing folders only",
        "viewer_catalog_path":catalog_path.relative_to(root).as_posix(),
        "viewer_total":len(catalog.get("conversations",[])),
        "statistics":dict(stats),"items":items,
        "critical_limitations":[
            "These are candidate paths, not yet confirmed fully parsed conversations.",
            "Only catalog membership is compared; absence in Viewer does not imply unreadable by Mersearch.",
            "This tool NEVER exposes a source via the public Viewer.",
            "Files elsewhere in SAT_CONVOS_N, LONG_CONVOS, 30SEP26_DUMP need the normal folder-level index.",
            "Private HSH_RESOURCES and historical SAT repositories are intentionally NOT scanned."
        ]
    }

def main()->int:
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument("--root",type=Path,default=Path(__file__).resolve().parents[1])
    p.add_argument("--catalog",default="CONVERSATION_VIEWER/data/conversations.json")
    p.add_argument("--output",type=Path,default=None)
    args=p.parse_args()
    root=args.root.resolve()
    result=audit(root,root/args.catalog)
    output=args.output
    if output is not None:
        if not output.is_absolute():output=root/output
        output.parent.mkdir(parents=True,exist_ok=True)
        output.write_text(json.dumps(result,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print(json.dumps({"repository":result["repository"],"viewer_total":result["viewer_total"],
                      "counts":result["statistics"],
                      "not_in_viewer":[x["source"] for x in result["items"] if not x["viewer_catalog_includes_source"]],
                      "output":str(output) if output else None},ensure_ascii=False,indent=2))
    return 0

if __name__=="__main__":
    raise SystemExit(main())

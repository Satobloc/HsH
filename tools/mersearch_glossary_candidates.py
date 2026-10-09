#!/usr/bin/env python3
"""Mersearch M5a: provenance-safe glossary / SAT-standard translation candidates.

Only known, explicitly listed sources are examined. Indexing a historical
mapping NEVER asserts the mapping is true, current, user-authored or a
standard-science equivalence. This does not expand ordinary queries yet.
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

VERSION="m5a-source-inventory-2026-10-09"
ARCHIVE_NAMES={
    "Satobloc/SAT_THEORY_ARCHIVE_2023-25":"SAT_THEORY_ARCHIVE_2023-25",
    "Satobloc/HsH":"HsH",
    "Satobloc/HSH_RESOURCES":"HSH_RESOURCES"
}
SOURCES=[
    ("Satobloc/SAT_THEORY_ARCHIVE_2023-25","Early SAT/GLOSSARY (LIVE).txt","latex-glossary"),
    ("Satobloc/SAT_THEORY_ARCHIVE_2023-25","2026/Early SAT/GLOSSARY (LIVE).txt","latex-glossary"),
    ("Satobloc/SAT_THEORY_ARCHIVE_2023-25","SAT 4D Theory Work/SAT4D_Glossary_Sync.tex","latex-glossary"),
    ("Satobloc/SAT_THEORY_ARCHIVE_2023-25","2023-24 FRAMEWORK DEVELOPMENT/SATv  TO STANDARD MAP.txt","standard-crosswalk"),
    ("Satobloc/SAT_THEORY_ARCHIVE_2023-25","10-31-2025 SAT FULL THEORY/10-20-25 definitions.txt","unparsed-compilation"),
]
ITEM_RE=re.compile(r"\\item\s*\[(.*?)\]",re.S)
HEADING_RE=re.compile(r"^\s*(?:\d+\.\s*)?(.{2,110}?)\s*→\s*(.{2,150}?)\s*$")
END_DESCRIPTION=re.compile(r"\\end\s*\{description\}")
PRIVATE_NAMES={"PRIOR_ART","QUARANTINE"}
MAX_BYTES=1024*1024


def checksum(data:bytes)->str:return hashlib.sha256(data).hexdigest()
def short_id(value:str)->str:return hashlib.sha256(value.encode("utf-8")).hexdigest()[:24]


def parse_glossary(text:str)->list[dict]:
    matches=list(ITEM_RE.finditer(text))
    entries=[]
    for i,m in enumerate(matches):
        raw=m.group(1).strip()
        if not raw:continue
        begin=m.end()
        end=matches[i+1].start() if i+1<len(matches) else len(text)
        after=END_DESCRIPTION.search(text,begin,end)
        if after:end=min(end,after.start())
        definition=text[begin:end].strip()[:2500]
        if not definition:continue
        line=text.count("\n",0,m.start())+1
        entries.append({
            "entry_kind":"GLOSSARY_DEFINITION_CANDIDATE",
            "term_original":raw,
            "definition_original":definition,
            "relation_type":"SOURCE_DEFINES_TERM",
            "line_start":line,
            "line_end":text.count("\n",0,end)+1,
            "extraction_basis":"literal-latex-description-item",
        })
    return entries


def parse_standard_crosswalk(text:str)->list[dict]:
    result=[]
    lines=text.splitlines()
    for index,line in enumerate(lines):
        m=HEADING_RE.match(line)
        if not m:continue
        standard,sat=m.groups()
        if standard.strip().lower().startswith(("implications","key point","summary")):continue
        # Historical map headings are evidence of PROPOSED correspondences,
        # not an established identity or proof of physical equivalence.
        result.append({
            "entry_kind":"HISTORICAL_CROSSWALK_CANDIDATE",
            "standard_original":standard.strip(),
            "sat_original":sat.strip(),
            "relation_type":"PROPOSED_INTERPRETIVE_TRANSLATION",
            "reverse_relation_type":"PROPOSED_STANDARD_ANALOGUE",
            "line_start":index+1,"line_end":index+1,
            "extraction_basis":"literal-arrow-heading",
        })
    return result


def build(archives_home:Path)->dict:
    home=archives_home.resolve()
    indexed=[];sources=[];stats=Counter()
    found_repos=[]
    for repo,dirname in ARCHIVE_NAMES.items():
        root=home/dirname
        if root.is_dir() and not root.is_symlink():
            found_repos.append(repo)
    for repo,rel,family in SOURCES:
        root=home/ARCHIVE_NAMES[repo]
        path=root/rel
        status="not-available"
        if repo not in found_repos or any(p in PRIVATE_NAMES for p in Path(rel).parts):
            stats["source_missing_or_restricted"]+=1
        elif path.is_symlink() or any(parent.is_symlink() for parent in path.parents if parent!=root and root in parent.parents):
            status="symlink-refused";stats["source_symlink_refused"]+=1
        elif not path.is_file():
            stats["source_missing_or_restricted"]+=1
        elif path.stat().st_size>MAX_BYTES:
            status="over-size-limit";stats["source_oversized"]+=1
        else:
            raw=path.read_bytes()
            sha=checksum(raw)
            text=raw.decode("utf-8-sig",errors="replace")
            status="scanned"
            if family=="latex-glossary":
                entries=parse_glossary(text)
            elif family=="standard-crosswalk":
                entries=parse_standard_crosswalk(text)
            else:
                entries=[];status="preserved-not-auto-parsed"
                stats["source_compilation_preserved_unparsed"]+=1
            for entry in entries:
                entry.update({
                    "entry_id":"term:"+short_id(repo+"\0"+rel+"\0"+sha+"\0"+
                                               str(entry["line_start"])+"\0"+
                                               entry.get("term_original",entry.get("standard_original",""))),
                    "source_id":"src:"+short_id(repo+"\0"+rel+"\0"+sha),
                    "repository":repo,"path":rel,"source_sha256":sha,
                    "source_url":f"https://github.com/{repo}/blob/main/"+
                        quote(rel,safe="/"),
                    "source_family":family,
                    "content_authorship_status":"unresolved",
                    "historical_currentness":"unverified",
                    "original_creation_date":None,
                    "date_confidence":"undetermined",
                    "mapping_epistemic_class":"historical-source-claim-not-standard-physics-proof",
                })
            indexed.extend(entries)
            stats["entries_extracted"]+=len(entries)
            stats["sources_scanned"]+=1
        sources.append({"repository":repo,"path":rel,"source_family":family,"status":status,
                        "entries_extracted":len(entries) if status=="scanned" else 0})
    return {
      "schema_version":"mersearch.glossary-candidates.v1",
      "tool_version":VERSION,
      "source_scope":"explicit-historical-source-allowlist-not-complete-corpus",
      "archives_requested":list(ARCHIVE_NAMES),
      "archives_present":found_repos,
      "missing_archives":[r for r in ARCHIVE_NAMES if r not in found_repos],
      "publication_status":"INTERNAL_REVIEW_CANDIDATES_NOT_PUBLIC_INDEX",
      "authority_note":"Definitions and maps retain archival claims. Nothing is promoted to current SAT/HsH, accepted physics, Nathan-authored, or mathematical equivalence.",
      "statistics":dict(stats),
      "sources":sources,
      "entries":indexed,
    }


def main()->int:
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--archives-home",type=Path,default=Path("."),
                    help="Parent directory containing archive checkouts")
    ap.add_argument("--out",type=Path,required=True)
    args=ap.parse_args()
    data=build(args.archives_home)
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(data,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print(json.dumps({"out":str(args.out),"entries":len(data["entries"]),
                      "repositories":data["archives_present"],
                      "scope":data["source_scope"],"statistics":data["statistics"]}))
    return 0


if __name__=="__main__":
    raise SystemExit(main())

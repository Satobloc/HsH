# Tern Rook Workshop | 2026-10-26 11:00 UTC
**Quantum:** Four-lane Mersearch fail-closed publication preflight and publisher digest QA.
**Ring:** h=371, seq=1855, index=12 Tern Rook, next Morrow. Assignment only, no historical-thread delivery.
**Status:** EXECUTED_LOCAL_QA; PROTOTYPE_NOT_DEPLOYED; NO_SCHEDULER_CHANGE.

## Source audit
Read current HsH BEDROCK (563 lines), Steering Charter, Three Paper Campaign, New Instance Start, Revival Rotation v3, Tern continuity, Mersearch worker guide, and issue publisher intake. Read all 91 lines of primary SAT-O Phase VIII gauge buildout (blob beda29495fa4949906a6a6b0f408c3a0dd117e58); its synthetic 300-link numerical claims have no executable seed/output in that file, not an empirical verification.

Morrow's issue #582 already identified optics GH001: Mersearch generated ~352.48 MB JSON and ~59.64 MB Markdown; GitHub rejected a 352.48 MB blob (>100 MB) on five attempts in Action job 121375960469. Credit remains Morrow's.

**Independent new scope check:** all FOUR HsH bridge workflows unconditionally copy full SEARCH_RESULTS.json and SEARCH_RESULTS.md to public indexes/mersearch_requests/ and have a five-try push loop, with NO pre-push blob-size gate. Blobs: main 8f3ccfc783af89e35b814a5dc86c2a37b5e85e51; lane 2 ba221c12382704908346ec5eb35cfce1b93e5dca7; lane 3 aa5c9c2fbb33407b4f1bb4dd35b8c69b3e12ab48; lane 4 f62e7c65f10ab11cfaa4b55b8b807a10ad3a0db4. Compact receipt generator blob 5917e095dea050c1d8c747fb3c35f9d3cb929b75 suppresses detailed resources/ hits in its *receipt*, but raw full-result copies bypass that redaction. No private excerpts reproduced.

## Executed local improvement
Created a fail-closed Python pre-push prototype. It inspects actual output-file sizes without reading private hits, denies >95 MiB files, denies incomplete outputs, and denies ALL unattended public raw publication pending source-class review. Four executable software QA fixtures passed: small public raw denied; complete small internal staging accepted; oversized internal file denied; missing receipt denied. py_compile passed. This prototype was NOT committed to the HsH workflows. A reviewed bounded public navigation output plus authorized route for full private results is still needed.

```python
#!/usr/bin/env python3
"""Fail-closed pre-push Mersearch gate. Prototype; not deployed."""
import argparse
import json
from pathlib import Path

SOFT_LIMIT = 95 * 1024 * 1024
REQUIRED = ("SEARCH_RESULTS.json", "SEARCH_RESULTS.md",
            "SEARCH_RECEIPT.json", "SEARCH_RECEIPT.md", "RUN_MANIFEST.json")

def audit(out_dir, public_destination):
    files = {}
    missing = []
    for name in REQUIRED:
        path = Path(out_dir) / name
        if path.is_file():
            files[name] = path.stat().st_size
        else:
            missing.append(name)
    oversized = [name for name, size in files.items() if size > SOFT_LIMIT]
    reasons = []
    if missing:
        reasons.append("MISSING_REQUIRED_OUTPUTS")
    if oversized:
        reasons.append("GITHUB_BLOB_SOFT_LIMIT_EXCEEDED")
    if public_destination:
        reasons.append("PUBLIC_RAW_CONTENT_NOT_REVIEWED")
    return {"allowed": not reasons, "reasons": reasons,
            "missing": missing, "oversized": oversized,
            "file_bytes": files, "soft_limit_bytes": SOFT_LIMIT}

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--out-dir", required=True)
    parser.add_argument("--public-destination", action="store_true")
    args = parser.parse_args()
    result = audit(args.out_dir, args.public_destination)
    print(json.dumps(result, indent=2, sort_keys=True))
    raise SystemExit(0 if result["allowed"] else 2)
```

## Independent transport verification
Fetched public published artifacts from issues #579, #580, #581, #582 and independently SHA-256-hashed exact UTF-8 content with a separately tested SHA-256 implementation. All 4/4 digests matched their issue submissions. This validates transport only, not paper or physics claims.

P1 Nov 9 remains Orson-led actual LLM cognition/methods with independent review and rendered artifact; P2 Nov 30 requires real measured physics; P3 Dec 14 requires full historical math crosswalk. No manuscript or physical-theory promotion.

## Handoff
Morrow should review the four-lane prototype and source-class/publication policy, not rerun the same GH001 diagnosis. Status: locally executed, **not deployed**. No cross-thread delivery claimed. No recurrence, destructive write, protected signet or source leak.

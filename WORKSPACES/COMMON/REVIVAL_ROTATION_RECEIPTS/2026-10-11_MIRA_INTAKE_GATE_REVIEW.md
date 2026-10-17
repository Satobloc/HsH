# Mira continuity audit | Proposed PDF eligibility preflight (NOT ACTIVE)
2026-10-11 | follow-up to REVROT3-19-20261011:12:s2 | CURRENT ASSISTANT RECONSTRUCTION, not original Mira action

## Decision
**Do not trigger HSH_RESOURCES bulk PDF extraction yet.** Review-only local prototype built and 9/9 unit tests passed; the active `tools/extract_papers.py` and `.github/workflows/extract-papers.yml` were **not** changed and no workflows were run.

Review artifacts produced in the current conversation container:
- `mira_intake_preflight.py`: no PDF reads; path-level metadata safety preflight; default hold for every unreviewed PDF.
- `test_mira_intake_preflight.py`: nine unit tests passed.
These sandbox/container paths are not assumed to exist in GitHub.

## Source inspection
- `Satobloc/HSH_RESOURCES/tools/extract_papers.py`: complete, v1.2.0 (blob SHA 18f316628fbeca06e523f1f16268f53f4815d3d5). Currently prunes `PRIOR_ART` directory but does not prevent restricted-author PDF elsewhere.
- `Satobloc/HSH_RESOURCES/.github/workflows/extract-papers.yml`: complete (blob SHA 4fbae103a2ff308f7564c81a3b5d723525796407), bounded default 100 per dispatch and triggers on PDF or extraction-tool changes.
- `Satobloc/HSH_RESOURCES/derived/manifests/extraction.jsonl`: complete, 1182 entries (blob SHA b8b6933beb05c11d314e7b8b7a45aaa4e0b8df2f).
- `Satobloc/HSH_RESOURCES/30SEP_PAPER_DUMP/`: immediate directory metadata listed: 389 PDFs, 116 matched manifest, 273 missing records, 245 distinct Git PDF blob hashes among pending, 22 duplicate blob groups (28 extra paths); 29.82% path coverage. Not equivalent to unique bibliographic items.
- `Satobloc/HSH_RESOURCES/WORKSPACES/MIRA/INBOX.md`: complete; September 30 assignment and source-identity methodology.
- Endogenous precedent: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt` entire 10,663-character file and `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/STAT.txt` substantive September 30 project instruction read. Exact source paths recorded as such; not claims of exterior scientific verification.
- October 9 policy: Hypothesis H proper and directly Schreiber-authored sources remain excluded. Source metadata and filenames are insufficient to determine authorship.

## Prototype design and test results
The review-only preflight takes three explicit JSON inputs: a directory inventory `[{path, blob_sha}]`, the existing JSONL extraction manifest, and a per-path source-owner-approved list `[{path,blob_sha,approved,reviewer,citation,author_checked,restriction_checked}]`. It does not open PDFs, call the extractor or alter the manifest.

A pending path is eligible for a **controlled later extraction** only if the approved manifest matches the exact path and Git blob version and has affirmative authorship/restriction review plus named reviewer and original citation. Every other unprocessed path is held. Restricted-name matches and traversal/unsupported paths veto admission; these heuristics are additional denials, **not** proof of source safety. Per-path duplication of approvals is denied. An already-recorded manifest entry is tracked separately rather than retroactively declared safe. The gate cannot validate whether the attestations are truthful.

Local Python `unittest` cases PASSED (9/9): full explicit approval; no approval; changed blob ID; unverified author; restricted-name candidate (two cases); traversal; duplicate approvals; already-present manifest row.

## Required improvements before integration
1. Owner-approved bibliographic identity/author check from trusted metadata independent of PDF extraction; a filename alone is unreliable. Explicitly reject or isolate ambiguous cases.
2. Handle **symlinks and physical path containment** safely when checking out actual files; metadata inventory does not prove resolved path. Avoid process-wide fail-open.
3. Treat Git blob SHA as a *version identity*, not SHA256 of bytes. Use the extractor's SHA256 only after admission; preserve both and cite original work identity.
4. Preflight should execute as a job **before** any PDF opening, with controlled allowlist passed to extractor; gate must be fail-closed on malformed or missing approval records, and new batches must not trigger an unrestricted implicit fallback.
5. Review current `needs_ocr` / `error` records separately, and rerun a dry-run first. Verify multi-pass completion and indexes against full tree/manifests, not GitHub's capped derived-text directory view.
6. Resolve governance/Resources ownership before activating the workflow. Existing scheduled revival slots are unrelated and unchanged.

## Provenance / nonclaims
This is a **current-assistant bounded continuation of Mira's recorded intake concerns**, not an original Mira check-in. Original Mira ChatGPT conversation remains uncontacted. No restricted-paper content was read. No Quarantine, Project Desk or scheduler changes occurred. The review tool and tests are offered as attachments in the conversation, not deployed production code.

## Next cursor
Have the source owner review approvals for a **small, unambiguously eligible batch**; then implement the checked gate on a branch/controlled job, expand tests for symlink and malformed-JSON fail-closed behavior, and only then approve the bounded extraction/index pass. Do not equate GitHub receipt writing with recipient-thread message delivery.

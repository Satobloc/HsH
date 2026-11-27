# Optional repository context — Morrow h1146:s2 → Kestrel h1146:s3

**Handoff ID:** `MORROW-KESTREL-20261127T1824Z-DELI-SNAPSHOT-P0-WH02-001`  
**Sender routing label:** Morrow, h1146:s2, ring index 13  
**Recipient routing label:** Kestrel, h1146:s3, ring index 14  
**Next run key:** `REVROT3-19-20261011:1146:s3`  
**Classification:** OPTIONAL CONTEXT ONLY / REPOSITORY ONLY / NO ASSIGNMENT.

This packet is a source-navigation aid, not a request to take over Morrow's archive work, Calder's WH-02 branch, or Tern's PWH/P0 authority.

## 1. DeliData source-custody update

- Existing report: [issue #2696](https://github.com/Satobloc/HsH/issues/2696).
- New append-only source-snapshot Addendum 03: [comment #7225722002](https://github.com/Satobloc/HsH/issues/2696#issuecomment-7225722002).
- Addendum SHA-256: `9a0ed150ca6f6fe9845bcbd767747d9686ce4b991e39116357487f795b966c87`; exact comment readback PASS.
- Morrow Source Identity Gate Layer 22 amendment 03: blob `ffc6f313e18cb4257084e0907e03f3617e38b7a6`; commit `5c699a55189b294fed0824d0ebe2bc62d4378247`; exact suffix readback PASS.

Pinned public source lineage:
- Current Hugging Face `main`: `dfccbf5d5206330d074a0d31e1a564b68bf6a4eb` (README-only commit).
- Data-upload parent: `743e2eb60d7b5a581d82beed94a91ad0306354cb` (commit title “Upload 500 files”; rendered diff capped at 50 files).
- [Current main commit](https://huggingface.co/datasets/gkaradzhov/DeliData/commit/dfccbf5d5206330d074a0d31e1a564b68bf6a4eb); [data-upload commit](https://huggingface.co/datasets/gkaradzhov/DeliData/commit/743e2eb60d7b5a581d82beed94a91ad0306354cb).

This pins the repository snapshot; it does **not** verify the full TSV row-kind census, the number of `message_id=-1` sentinels per `group_id`, or the ConvoKit dictionary conversion. No raw TSV or participant-level text was downloaded or analyzed. The installed `hf` CLI is available but runtime DNS failed; no local HsH/Mersearch checkout or DuckDB/datasets/pyarrow Python packages are present. All four Mersearch request lanes remain occupied; no lane was overwritten.

**Return cursor:** at the pinned data-upload commit, obtain an approved source retrieval route, count row kinds per file, test sentinel/group relationships, then separately reproduce ConvoKit conversion. Keep 17,610 HF row metadata, 17,111 ConvoKit 5.0.0 utterances, and 14,003 paper annotation figures as distinct reported populations until source-level reconciliation.

## 2. Archive-ingestion / P0 state

Latest discovery [#46045533093](https://github.com/Satobloc/HsH/actions/runs/46045533093) succeeded at HsH source cut `74087ca5912791c7a2426166268d4b120def91da` and generated commit `4442ce1d`: 18,242 documents, 48 docket entries, 417 square visuals, 6 extraction errors. Current main at preflight was `e47d055117eb310c2924d5b5246c1b4eaf0b1edb`, after a later publisher artifact; discovery is therefore stale by that artifact.

Latest navigation [#46045533059](https://github.com/Satobloc/HsH/actions/runs/46045533059) failed:
- root date pass renamed 75, skipped 439;
- strict audit: 1,040 dated/correct, 0 needs rename, 0 collisions, 2 undatable, 883 skipped non-conversation/bad JSON;
- strict gate exited 1; downstream Viewer/chronology/index/autotagging/tests/commit/deploy skipped; the 75 runner-local renames were not persisted.

WH-02 remains Calder-owned. Legacy PR #1710 is OPEN/DRAFT and 7 ahead / 13,171 behind. Replacement PRs #2487 and #2488 are OPEN/DRAFT, each 6 ahead / 1,593 behind, with no exact-head CI runs found. Issue #1702 remains open. No branch or issue was changed or closed.

Tern retains PWH and P0 authority. The PWH queue/task graph and worker-local INBOX/checkpoint surfaces remain under the P0 interlock. The separate generic workspace-reader route defect remains; presentation safety FAIL, Paper A/B live-route acceptance NOT_OBSERVED, deployment NOT_VERIFIED, release/standdown NOT_AUTHORIZED.

## 3. Boundaries

- Morrow's historical direct instruction explicitly stops theory integration. This packet is archival/source-custody context only.
- Lane 24 remains Cycle 08/08 COMPLETE / BACKSEAT / HOLD. No Cycle 09 or physical calculation.
- No worker-local Kestrel INBOX/checkpoint write was made.
- No authenticated current Kestrel ChatGPT thread was established. No direct-thread delivery, recipient read, consumption, acknowledgment, assignment, review request, response obligation, or ownership transfer is claimed.
- Timing classification is pending final :36 task readback; do not infer prestart delivery from the nominal slot alone.


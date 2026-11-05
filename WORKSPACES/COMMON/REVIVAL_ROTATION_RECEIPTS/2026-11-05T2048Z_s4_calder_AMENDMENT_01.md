# Amendment 01 — publication checksum and source-provenance readback

**Parent receipt:** `2026-11-05T2048Z_s4_calder.md` (blob `addf0d14ebbbcdf9a28079e412bee8014ec2d964`).  
**Run key:** `REVROT3-19-20261011:620:s4` (nominal 2026-11-05T20:48:00Z).  
**Amendment check:** 2026-11-05T21:46Z.  
**Purpose:** add independent verification obtained during a retry of the same nominal run. This is not a new rotation receipt or a new research submission.

## 1. Successful publication #1399 — independently rechecked

- Issue: #1399, submission `calder-mind-topology-prior-reciprocity-20261105t2048z-s4-001`.
- Publisher comment: #6670034545, `PUBLISHED`.
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/calder-mind-topology-prior-reciprocity-20261105t2048z-s4-001.md`.
- Publication commit: `645c391604715df08ae7f3693c4b26f9a06746a7`.
- Artifact blob: `124eb8762ef131a7b117cd5a77f5c7def30df21a`.
- Declared and independently recomputed SHA-256: `35275ce8b060bbf20068928c00547564e98ae231dc820d79082a66838b3a88b2`.
- Exact UTF-8 content comparison between the issue payload and fetched artifact: PASS; both are 6,233 characters.
- The SHA-256 implementation used for the independent check passed the standard `abc` test vector.

Status remains `PUBLISHED_VERIFIED`. No duplicate issue or artifact was created.

## 2. Failed publication #1398 — exact checksum diagnosis

Issue #1398 exists as an open public HSH-PUBLISH-V1 submission wrapper, but its publisher comment #6669630871 states `REJECTED: SHA-256 mismatch`. The expected artifact path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/calder-reviewmind-d0-stratum-20261105t2048z-s4-001.md` returns 404.

- Submission: `calder-reviewmind-d0-stratum-20261105t2048z-s4-001`.
- Declared digest: `25830c2d5e794cad496d9ca7c999f881f5a708168f735a8acc1d153c0e68d1e5`.
- Independently recomputed SHA-256 over the exact current issue-body `content` field (8,180 UTF-8 bytes): `02de8f75695d7eeac2870de46e917b5da657ac2b32ff07ce9bb0c6137a3da121`.
- The declared and recomputed digests do not match.

Classification: `PUBLISHER_REJECTED_SHA256_MISMATCH / PUBLIC_ISSUE_BODY_ONLY / NO_PUBLISHED_ARTIFACT`. The correct digest is diagnostic information only. No issue edit, retry, direct artifact write, duplicate issue, or publisher bypass was attempted.

## 3. Mersearch and historical Calder attribution

All four live Mersearch request lanes were inspected and remain occupied in `requested` state; no new request was submitted or overwritten:

- Lane 1: `calder-angle-geometry-source-fidelity-20261102-1337`.
- Lane 2: `archive-harvest-20261025-optics-01`.
- Lane 3: `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`.
- Lane 4: `kestrel-finite-core-geometry-source-fidelity-20261102-2200`.

The earlier completed three-repository request `calder-empirical-charter-original-source-20261101-0248` has a manifest and compact receipts: 16,202 files / 20,861,799 records scanned; 138 hits across 81 distinct paths; roots `archive/`, `hsh-main/`, and `resources/`. This is bounded navigation evidence, not an exhaustive hit inventory or authorship proof. Its top lexical hits include the separate `CALDER [Construction Story Retelling]` identity.

The 2026-09-12 empirical/statistical Calder entry in `WORKSPACES/COMMON/CHECKINS.md` (blob `886069e71d4aec7a3f8d199d6d889b930a05c17e`, lines 55–107) is a worker self-report describing angle-clustering, null-design, independent-unit and contamination discipline. A separate Calder entry beginning at line 211 describes Foundational Covariance / Global Architecture and carries a duplicate-name flag. The empirical Calder's exact original conversation ID and direct user-authored specialist charter remain unrecovered. `REV-005` remains assistant reconstruction. The current user-supplied Review-MIND lane charter governs this run; no historical instance participation is claimed.

## 4. Run, branch and scheduler status

- The :48 automation remains enabled under its original task ID `6aa6c3bc02b48191b8a91a30d2a155e0`, with the exact stored hourly America/New_York DTSTART and :48 phase unchanged.
- Automation readback showed run `05bafbbd-89e4-832f-adbe-f5c35dbc9440` still `IN_PROGRESS`, scheduled for 20:48Z and restarted at 21:41:08Z. Its `latest_result` has the same run ID but was created at 21:36:08Z, before this retry started; it is the earlier attempt's cached result, not proof that this retry completed. `chat_ref=null`.
- HsH main was `d9d2df516e8887af314f35c7df5e380dd54a3006` at 21:45:25Z. The task-branch graph still records 14:03:21Z and is stale relative to main; Tern owns reconciliation, so it was not edited.
- The existing Calder-to-Hale packet is late optional repository context only. No ChatGPT-thread delivery, consumption or acknowledgment is claimed.

No scheduler, task ID, schedule, phase, enabled state, task count, branch, theory surface, or Orson P1 ownership was changed. No new Lean code, Lean run, human/model experiment, physical calculation, or paper-gate advancement is claimed. The #1399 three-level A0/A1/A2 design remains a proposal; its contrasts are estimand definitions, not proof of causal identification.

**Return cursors:** Jacoby, *Practical Talks by an Astronomer*, line 1181; FIE rereview due 2026-11-10 (last full review 2026-10-27).

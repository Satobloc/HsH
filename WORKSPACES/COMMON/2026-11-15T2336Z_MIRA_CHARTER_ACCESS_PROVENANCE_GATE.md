# Mira h863:s3 — Versioned specialist-charter access provenance gate

**Date:** 2026-11-15  
**Run key:** `REVROT3-19-20261011:863:s3`  
**Ring label:** Mira (index 5)  
**Next ring label:** Aldus (index 6)  
**Disposition:** OPERATIONAL-ONLY REVIEW / CHARTER ACCESS BLOCKED / PR SELF-TEST VERIFIED / FULL REPOSITORY AUDIT NOT GREEN

## 1. Deterministic selection and authority boundary

\[
h=863,\qquad seq=5(863)+3=4318,\qquad 4318\bmod19=5.
\]

The fixed ring therefore selects Mira, followed by Aldus. This is a deterministic ring label, not authentication of a current Mira ChatGPT instance or thread.

The live Steering Charter and Code Grurple roster preserve Mira's quarantine boundary: only cleared operational answers may cross. The actual historical specialist charter and Mira-specific private workspace/inbox were not opened. No private HSH_RESOURCES payload was accessed.

The only historical role evidence used was the cleared shared excerpt `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/STAT.txt`, Git blob `531f41f33b75fdc76db4045b80d4439290b67906`. It is a **CLEARED_SHARED_ROLE_WITNESS**, not a standalone signed specialist charter and not evidence that the restricted charter was read.

Current policy-source Git blobs:

- Steering Charter 2026-10-26: `be44c424674764c602b5f618dfce528c0f97b0ef`.
- Code Grurple roster: `cc96c0bfafc95c54e7960899c7306031e5abce17`.
- Cleared shared role witness: `531f41f33b75fdc76db4045b80d4439290b67906`.

## 2. Substantive architecture improvement

Extended the existing read-only REVROT3 auditor in draft PR #1533 with an opt-in, versioned charter-provenance layer. The prior gate checked payload routing, private-material access, inbox writes and missed-check-in/invitation counting, but could not distinguish a signed specialist charter from a cleared shared role witness or assistant summary, nor record whether the actual charter was authorized and read.

Schema v2 adds the following fields for the selected identity, with `recipient_`-prefixed counterparts for handoff recipients:

- `eligibility_schema_version: 2`.
- `role_source_class`: `SIGNED_SPECIALIST_CHARTER`, `CLEARED_SHARED_ROLE_WITNESS`, `ASSISTANT_SUMMARY`, or `UNRESOLVED`.
- `charter_access_status`: `AUTHORIZED`, `BLOCKED_BY_QUARANTINE`, or `NOT_PRESENT`.
- `charter_read_performed`: strict `true` or `false`.
- `role_source_locator` and `role_source_blob_sha`.
- `authorization_policy_blob_shas`: one or more semicolon-separated Git blob SHA-1 values.

Consistency rules now distinguish source type from access state:

1. `QUARANTINE_HOLD`, `NO_ACCESS`, and `MANUAL_REENTRY_REQUIRED` cannot claim the historical specialist charter was read.
2. `BLOCKED_BY_QUARANTINE` and `NOT_PRESENT` cannot be paired with `charter_read_performed: true`.
3. `SIGNED_SPECIALIST_CHARTER` requires `AUTHORIZED` plus an actual read.
4. `CLEARED_SHARED_ROLE_WITNESS`, `ASSISTANT_SUMMARY`, and `UNRESOLVED` cannot be presented as the signed charter having been read.
5. A non-unresolved source must have a locator and 40-character Git blob SHA; policy references must also be valid Git blob SHA values.
6. `UNRESOLVED` cannot claim a source locator or source blob.
7. Legacy non-CLEAR records without schema v2 remain readable but receive an explicit charter-provenance warning. They are not silently upgraded or rejected.

This is an additive consistency gate. It does **not** inspect payload semantics, enforce GitHub permissions, prove that a source was actually read, authenticate a ChatGPT thread, or establish source authorship/authority. It is not a security boundary.

## 3. Implementation and verification

Existing draft PR #1533 was extended in place; no new branch or tool was created.

- PR: https://github.com/Satobloc/HsH/pull/1533
- Base PR #1173 remains OPEN / DRAFT / UNMERGED; #1533 remains OPEN / DRAFT / UNMERGED.
- Branch head: `2fa337d5d429052580132316f71b9773edceead3`.
- Auditor blob: `e807c42dac0cd168ea6b593e8ce5bd8b8a17ca7e`.
- Added nine regression assertions; total self-test count is 49.

**Exact branch-head run:** https://github.com/Satobloc/HsH/actions/runs/43776822114

- Checkout: exact branch head `2fa337d5d429052580132316f71b9773edceead3`.
- Python compilation: PASS.
- Auditor self-test: PASS, 49 checks.
- Read-only full repository audit: FAIL.

**PR merge-reference run:** https://github.com/Satobloc/HsH/actions/runs/43776827738

- Checkout: synthetic merge `b3c0bea`, merging PR head `2fa337d5` into base `d413129`.
- Python compilation: PASS.
- Auditor self-test: PASS, 49 checks.
- Read-only full repository audit: FAIL.

The PR base snapshot contained 489 receipts, 324 handoffs and 39 out-of-band items. The full audit returned 660 historical errors and 1,024 warnings. The reported errors concern older timestamp, ring-identity, duplicate-receipt, run-key and handoff-consistency problems in records dated before this change. This is not a green full-repository audit; those historical records were not altered. No claim is made that the full audit passed.

Earlier intermediate CI runs exposed two test-fixture defects (legacy-warning expectation and failure to restore a fixture after a negative test). Both were corrected. The final exact-head and merge-reference self-tests pass at 49 checks.

The PR description and existing PR conversation were updated with the schema, exact-head/merge-reference distinction and audit limitation. The original published report issue #1534 remains the canonical prior artifact; no duplicate issue or publisher submission was created.

## 4. Tooling and archive reconnaissance

- Mersearch release and worker-start guidance were read. All four request lanes remained `requested`/occupied; no callable Mersearch action or local Mersearch runtime was available. No lane was overwritten, released or retriggered. GitHub search was used only as a bounded fallback for public HsH documentation and PR evidence; no Mersearch result is claimed.
- Local `mersearch`, `gh`, `lean`, `lake`, and `elan` executables were absent; no local repository checkout was present.
- Existing Math Hopper code, PR #991, Whirligig Kernel 0, and the connected SciSpace capability were checked. Whirligig Kernel 0 remains sandbox-only; PR #991 remains draft/unmerged. SciSpace was not needed for this operational audit.
- HsH, SAT archive and HSH_RESOURCES repository front doors were checked. All three reported zero forks. HSH_RESOURCES metadata reports public visibility while its root README describes a private reference boundary; only the root README was read, and no payload was opened.
- No new tool, dependency, fork, subscription, paid service or expenditure.

## 5. Project and scientific boundaries

- P0 Code Grurple: ACTIVE.
- P1 Orson-owned cognition: OVERDUE / NOT READY.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE next review: November 24; the November 10 review is still within the 14-day interval.
- November 30 P2 major-paper and December 14 P3 full-theory gates remain separate. No paper gate advanced.

No physical calculation, measured-data fit, new prediction, independent measurement, Lean theorem, SAT-O/Blockwave equation change, P2 system selection or BEDROCK theory promotion occurred. This work is an operational provenance-schema improvement, not a physical result.

The latest unrelated-reading quantum was already completed in h862 (`The Book of Tea`, lines 1651–1690, next cursor 1691). It was not repeated. No new physical break is claimed.

## 6. Handoff and scheduler integrity

Aldus is the next ring label. A pre-start, repository-only optional packet was created with operational context about PR #1533. It imposes no task, deadline, response obligation or ownership transfer. `WORKSPACES/ALDUS/INBOX.md` was not present, so no inbox write was made. No direct ChatGPT-thread delivery, consumption, acknowledgment or comprehension is claimed.

The existing :36 relay remains enabled with its saved identity, schedule, prompt and phase unchanged. The current execution had no terminal completion recorded at final observation and no verified run-level thread binding. The task's cached latest result belonged to the preceding Sable h862:s3 slot and was not attributed to this Mira slot. No task, ID, schedule, cadence, phase or enabled-state change; no sixth task.

**Final pin:** `H863:S3 / MIRA-RING-LABEL / ALDUS-NEXT / OPERATIONAL-ONLY / CHARTER-BLOCKED-NOT-READ / CLEARED-ROLE-WITNESS-ONLY / ELIGIBILITY-SCHEMA-V2 / PR1533-HEAD-2FA337D / SELFTEST-49-PASS / FULL-AUDIT-FAIL-660-HISTORICAL-ERRORS-1024-WARNINGS / MERSEARCH-LANES-OCCUPIED / NO-PRIVATE-PAYLOAD / NO-NEW-ISSUE / AUTOMATION-UNCHANGED / NO-SIXTH-TASK`.
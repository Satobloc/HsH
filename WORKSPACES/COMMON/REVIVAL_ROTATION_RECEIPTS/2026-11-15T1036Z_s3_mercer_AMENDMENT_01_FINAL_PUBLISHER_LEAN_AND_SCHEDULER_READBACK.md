# Mercer h850:s3 Amendment 01 | Final publisher, Lean and scheduler readback

**Canonical run key:** `REVROT3-19-20261011:850:s3`  
**Nominal slot:** 2026-11-15T10:36:00Z  
**Purpose:** complete the existing receipt's pending publication/CI verification and preserve a later exact-ID scheduler observation. This is an amendment to the existing run, not a second run, receipt, submission, PR, or handoff.

## 1. Publisher final readback

- Existing canonical issue: [#1786](https://github.com/Satobloc/HsH/issues/1786).
- Publisher comment: [#6893256520](https://github.com/Satobloc/HsH/issues/1786#issuecomment-6893256520), reporting PUBLISHED and readback verified.
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-h850-s3-discovery-projection-gate-20261115t1036z-001.md`.
- Publisher commit: `fc60dcdc651681b0b8081c61f505445671d75f47`.
- Artifact Git blob: `9410d5a89ca816150b88b9871be842ac48f77714`.
- Artifact and issue-envelope content were independently fetched and compared byte-for-byte: **exact equality, 3,966 UTF-8 bytes**.
- Publisher-reported SHA-256, also present in the issue envelope: `dbe677ea71bc0fa827ee4942c679687c86f652158b6f674a30fa7328f87f0bc1`. The exact content equality was independently checked here; the SHA-256 value is publisher-reported, not separately recomputed in this amendment.

Final publication state: **PUBLISHED_VERIFIED**. No retry, duplicate issue, second submission, or direct artifact write.

## 2. Lean final readback

Existing [PR #1471](https://github.com/Satobloc/HsH/pull/1471) remains OPEN / DRAFT / UNMERGED at head `b8f76827c7766b9838b734915b7eff863d1dc747`, base branch `infra/lean4-verification-20261023`. Comparison with current main `91287ae1dbf6c53ea83664173d7db9bf172f361f` is DIVERGED: 65 commits ahead and 18,702 behind. It is not merge-ready and is not a production change.

Actions run [#43705989028](https://github.com/Satobloc/HsH/actions/runs/43705989028), job `132787055891`, completed with conclusion **FAILURE**. The full `lake build` reached 8,945/8,947 targets but failed in the separate pre-existing `HsHVerification.MovingPlaneTraceGeometry` module. Seven noncomputable-definition errors were reported at lines 72, 76, 80, 84, 96, 100 and 197, involving `Real.instDivInvMonoid`, `sliceParameter`, `sliceX` and `sliceY`.

The new `HsHVerification.CodeGrurpleObservationGate` target itself **built successfully at 8,927/8,947**. Its `CodeGrurpleDiscoveryProjection` theorem-specific `#print axioms` outputs were emitted, including:
- metadata visibility requires inventory;
- docket membership requires explicit eligibility;
- excerpt and reader-target visibility require current presentation;
- the observed Paper A/B states violate the projection gate;
- docket exclusion does not imply reader denial;
- source change closes raw excerpt/reader target, invalidates the old snapshot and marks presentation pending;
- a fresh snapshot alone does not enable pending presentation.

The new namespace contains no `sorry` or `admit`. The inspected theorem outputs use `propext`, `Classical.choice` and `Quot.sound` as applicable; the docket-exclusion counterexample reports no axioms. Tests, lint, nanoda, leanchecker and the separate global axiom audit were not run. This is a successful target-module compilation inside a failed full-root build, not a green full-library build or exact-head-only certification.

No unrelated `MovingPlaneTraceGeometry` repair was attempted. No Tern-owned PR, base branch or production code was modified.

## 3. Later exact-ID scheduler observation

The existing :36 task remains enabled with its exact stored schedule:
`DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`. Task ID remains `6a9f52b69ec08191b0a2ba24a074f781`; prompt and phase are unchanged.

The same current run ID `46a22ec5-ce84-8327-91d4-f7f538378f78`, scheduled for 10:36:00Z, was observed again with:
- earlier recorded start: `2026-11-15T10:31:30.110819Z`;
- latest exact-ID start: `2026-11-15T10:59:15.408880Z`;
- start-field delta: **27m45.298061s**;
- latest recorded status: IN_PROGRESS;
- completion: null;
- run-level `chat_ref`: null.

Task-level `last_run_time` remains stale at `10:03:00.693772Z`; `latest_result` remains the prior h846:s3 Meridian run `45c6cafb-6d18-8321-8e5c-dc36ad73b47a`, not this current run. Tern's INBOX received an evidence-only note with the changed start field. No retry, restart, concurrency, process cause, worker identity, or thread delivery is inferred. Tern retains scheduler and Observation 028 authority.

## 4. P0 delta and limits

Current main advanced seven commits after the h850 receipt. The only changed paths were `PUBLIC_SITE/generated/discovery.json` and Tern's receipt/current-work/inbox/Observation 028 records. No protected Paper A/B source or presentation-control path changed in that delta.

The 10:40:30Z discovery snapshot remains the latest snapshot fully parsed in this run lineage and was SOURCE_CONSISTENT_AT_PUBLICATION. Later automatic discovery refresh commits at approximately 10:54Z, 10:56Z and 10:57Z exist, but their embedded source identity and Paper A/B records were not parsed in this reconciliation. Therefore no claim is made about the newest snapshot's embedded source or current reader serialization. No live route was probed; both routes remain PRESENTATION_PENDING / NOT_OBSERVED in the last fully inspected evidence. Issue #1747 remains the sole canonical P0 incident and ACTIVE.

## 5. Scope and nonclaims

No site, manuscript, PDF, renderer, feed or deployment change; no route probe; no physical calculation, fit, prediction, independent measurement, P2 selection, paper-gate advancement, SAT-O/Blockwave equation change, or BEDROCK theory promotion. No new task, ID, schedule, prompt, phase, cadence, PR, public issue, Mersearch request, or successor handoff. No signet or conversation rename.

**Disposition:** existing h850:s3 work is now PUBLISHED_VERIFIED; Lean target module built, full root build failed in an unrelated module; latest same-ID scheduler start mutation recorded for Tern; no duplicate run artifacts created.

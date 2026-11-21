# h986:s3 | Nominal-Slot Binding Correction

**Status:** WORKSPACE VERIFIED / LEAN EXACT-HEAD BUILD PENDING / PUBLISHER SUBMISSION PENDING

This is a correction and verification continuation of the existing scheduler evidence, not a duplicate of the earlier run/artifact report. It preserves the original artifact and corrects its nominal-slot attribution additively.

## 1. Nominal timebase

The ring index is derived from the nominal scheduled UTC hour, not the delayed execution start. For the fixed ring, h is the integer UTC hour since 2026-10-11T00:00:00Z, derived from scheduled_for, and seq=5h+s. The :36 phase is s=3. The actual started_at is evidence about execution latency, not the identity of the nominal slot.

## 2. Correction to the preceding :36 occurrence

The prior scheduler record was:

- Run ID: fb41deb1-e1d0-8323-8292-ab8b15845cf5
- scheduled_for: 2026-11-21T01:36:00Z
- started_at: 2026-11-21T02:00:19.747108Z
- completed_at: 2026-11-21T02:23:53.577751Z

The scheduled time is h=985 after the 2026-10-11T00:00Z anchor:

- seq=5(985)+3=4928
- 4928 mod 19 = 7
- Correct deterministic ring label: Calder, index 7
- Successor: Hale, index 8

The prior report and issue #2243 labelled this 01:36Z occurrence h986:s3 / Tern Rook. That attribution is incorrect. The earlier report's technical observations and published bytes remain preserved, but its run-key and ring-label metadata are superseded by this correction.

This correction does not authenticate a Calder instance or thread. The earlier work remains assistant-level reconstruction; no historical Calder participation, delivery, or acknowledgment is claimed.

## 3. Current :36 occurrence

The current scheduler record is distinct:

- Run ID: fb043b72-0d98-832e-a12e-6dafccad27eb
- scheduled_for: 2026-11-21T02:36:00Z
- started_at: 2026-11-21T02:40:12.349174Z
- Status at last readback: IN_PROGRESS
- completed_at: null
- chat_ref: null

This occurrence is h=986:

- seq=5(986)+3=4933
- 4933 mod 19 = 12
- Correct deterministic ring label: Tern Rook, index 12
- Successor: Morrow, index 13

The current run is not the preceding fb41... result. A ring label is not authentication of a ChatGPT instance or thread. No direct-thread delivery or cross-thread participation is claimed.

## 4. Formal correction in existing Lean PR #1570

The existing branch tern/h743-scheduler-event-cross-section-20261110 was extended. No new branch or PR was created.

- Corrected commit: efdcf0533bf79bd4323de375e4c64358dc4a4922
- Module blob: 7d378eb4a932303613cc57d0e3aea36e5b0b0175
- File: FORMAL_VERIFICATION/HsHVerification/TernH743SchedulerSnapshotEvidence.lean

The new function is deliberately typed only by nominal hour and phase:

    workerAtNominalSlot(h, slot) = ringAt((5*h + slot) mod 19)

The corrected module now proves:

- h985_s3_sequence: 5 * 985 + 3 = 4928
- h985_s3_index: (5 * 985 + 3) mod 19 = 7
- h985_s3_worker: Calder
- h985_s3_successor: Hale
- h986_s3_sequence: 5 * 986 + 3 = 4933
- h986_s3_index: (5 * 986 + 3) mod 19 = 12
- h986_s3_worker: Tern Rook
- h986_s3_successor: Morrow

The scheduler observation previously named h986S3ThreadRefs is now correctly named h985S3ThreadRefs. Its scheduled_for value is 01:36Z; its delayed started_at value is 02:00:19.747108Z. The cached result is from the prior 00:36Z slot. The current-run reference is absent. The old names were corrected in the new commit without rewriting branch history.

### Exact-head verification

New PR-triggered run:

- Actions run #44857490138
- Job: 136702988214
- Exact PR-head checkout assertion: PASS
- Lake dependency-manifest generation: PASS
- Lean compilation: IN_PROGRESS at last readback

No successful build of corrected commit efdcf053... is claimed yet. The next cursor is to verify this exact-head run and inspect theorem-specific axiom output.

The immediately preceding exact-head run #44855320597 successfully compiled the earlier head 9e506331... (8,944 jobs, Lean 4.34.0 / Lake 5.0.0). That run verified the earlier formalized statement, which had the wrong nominal-hour association; it does not verify this correction.

PR #1570 remains OPEN / DRAFT / UNMERGED. An earlier branch commit briefly contained a raw conversation reference. The current source uses an opaque token, but the earlier commit remains in history. No force-push or history rewrite was performed. Authorized maintainer disposition remains required before any merge.

## 5. Architecture improvement

The reusable rule is now explicit in the formal interface:

**Selection is a function of (nominal UTC hour, slot phase), not (execution start time, slot phase).**

This separates:

1. NominalSlotKey: scheduled UTC hour and phase.
2. ExecutionObservation: run ID, actual start, completion and status.
3. CachedResultObservation: the scheduled slot and completion of the cached result.
4. ThreadReferenceObservation: task-level, current-run and cached-result references, each with distinct provenance.

A late start can alter latency measurements but cannot silently shift the deterministic ring assignment. The correction also demonstrates why last_run and latest_result must be compared by both run ID and scheduled_for.

This is a formalization of finite arithmetic over transcribed scheduler observations. It does not authenticate the scheduler payload, explain backend retry/restart behavior, authenticate a worker, or establish cross-thread delivery.

## 6. Publication and prior artifact

The prior issue #2243 is PUBLISHED_VERIFIED. Its workspace report and canonical artifact remain byte-identical at Git blob 5be8ba26d7ccb6e072b344167e28532aac093e2e, 12,540 characters. This correction does not edit or retry #2243. A distinct correction artifact is being submitted through the existing publisher.

## 7. Project and safety boundaries

- Mersearch was not run. No callable Mersearch action was available, and all four canonical request lanes remain requested; none was overwritten, retriggered or released. The two historical Tern role messages were read from the exact Library raw export because they were already identified source witnesses, not as a substitute for a new three-repository Mersearch search.
- HsH, SAT archive and HSH_RESOURCES front doors and their distinct evidence boundaries were checked. No private HSH_RESOURCES payload was accessed.
- No new tooling, dependency, fork, subscription or expenditure. Existing PR #1570 and its existing Lean CI were reused.
- No physical system, measured dataset, physical calculation, fit, H(s)H prediction, falsification threshold or independent measurement was created.
- No SAT-O or Blockwave equation was changed. No BEDROCK promotion or paper-gate advancement.
- P0 remains ACTIVE; P1 Orson cognition remains OVERDUE / NOT READY / Orson-owned; P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE.
- November 9 minor-paper gate remains MISSED; November 30 major-paper gate remains HOLD; December 14 full-theory gate remains INCOMPLETE.
- FIE next review remains November 24. The unrelated-reading cursor remains h958, lines 2001-2040, next 2041; no duplicate break was performed.

## 8. Automation preservation

The existing :36 task remains enabled with ID 6a9f52b69ec08191b0a2ba24a074f781, exact saved schedule DTSTART;TZID=America/New_York:20261001T143600 with RRULE:FREQ=HOURLY, and the existing Lane Charter 36 prompt/phase unchanged.

The inventory still contains four enabled Workshop Relay tasks (:00, :24, :36, :48); :12 remains disabled. No task, ID, schedule, prompt, phase, cadence or enabled-state mutation. No sixth task, signet, or conversation rename.

## 9. Next cursor

1. Verify Actions run #44857490138 at exact head efdcf053...
2. Read theorem-specific axiom output and record skipped global checks.
3. Append the numbered correction to the existing h986 receipt, preserving the original report and issue #2243.
4. Route optional repository-only context to Morrow if the :48 execution has not yet started; do not claim direct-thread delivery, consumption or acknowledgment.
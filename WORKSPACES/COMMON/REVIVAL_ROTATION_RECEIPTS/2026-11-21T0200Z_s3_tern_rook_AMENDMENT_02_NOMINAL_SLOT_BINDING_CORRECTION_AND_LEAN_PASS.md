# Receipt Amendment 02: Nominal-slot binding correction and exact-head Lean verification

**Parent receipt:** 2026-11-21T0200Z_s3_tern_rook.md  
**Scope:** additive correction of the nominal scheduled slot, deterministic ring label, and exact-head formal verification. The original report, issue #2243, publisher artifact, and Receipt Amendment 01 remain unchanged.

## 1. Corrected nominal-slot attribution

The parent receipt and report #2243 describe the scheduler occurrence scheduled for 2026-11-21T01:36:00Z, but label it h986:s3 / Tern Rook. The scheduled timestamp is the controlling nominal timebase.

Prior run:
- Run ID: fb41deb1-e1d0-8323-8292-ab8b15845cf5
- scheduled_for: 2026-11-21T01:36:00Z
- started_at: 2026-11-21T02:00:19.747108Z
- completed_at: 2026-11-21T02:23:53.577751Z

Therefore h=985, seq=5(985)+3=4928, and 4928 mod 19=7. The correct deterministic ring label is Calder (index 7), with Hale (index 8) next. The prior h986/Tern attribution is superseded. This is a ring-label correction only; no authenticated Calder instance, thread, delivery, consumption, or acknowledgment is established. The prior work remains assistant-level reconstruction.

The distinct current :36 occurrence is scheduled for 2026-11-21T02:36:00Z:
- Run ID: fb043b72-0d98-832e-a12e-6dafccad27eb
- started_at: 2026-11-21T02:40:12.349174Z
- status at last readback: IN_PROGRESS
- completed_at: null
- chat_ref: null

This is h=986, seq=4933, index 12: Tern Rook, next Morrow. The current run is not the prior fb41... result. No current Tern thread or worker identity is authenticated.

## 2. Formal correction and actual Lean run

Existing PR #1570 was extended on its existing branch, without creating a new branch or PR.

- Branch: tern/h743-scheduler-event-cross-section-20261110
- Corrected commit: efdcf0533bf79bd4323de375e4c64358dc4a4922
- Module blob: 7d378eb4a932303613cc57d0e3aea36e5b0b0175
- File: FORMAL_VERIFICATION/HsHVerification/TernH743SchedulerSnapshotEvidence.lean

The formal interface now defines workerAtNominalSlot(h, slot) as ringAt((5*h+slot) mod 19). It takes nominal hour and slot phase, not started_at.

Verified results:
- h985:s3: sequence 4928, index 7, Calder, next Hale.
- h986:s3: sequence 4933, index 12, Tern Rook, next Morrow.
- The scheduler snapshot previously named h986S3ThreadRefs is now h985S3ThreadRefs, matching its 01:36Z scheduled_for field.

Exact-head Actions run:
- Run #44857490138: SUCCESS.
- Job 136702988214: SUCCESS.
- The checkout step explicitly used ref efdcf0533bf79bd4323de375e4c64358dc4a4922 and the exact PR-head checkout assertion passed.
- GITHUB_SHA reported by the PR event was merge-reference commit c1899f7f929eaf4943f438a82230ac1a23a0a457; this is distinct from the explicit checkout ref.
- Full Lean library build: SUCCESS, 8,944 jobs.
- Lean 4.34.0; Lake 5.0.0.

The theorem-specific axiom output reports:
- h985/h986 sequence and index theorems: no axioms.
- h985/h986 worker and successor theorems: propext.
- h985 task configuration, task/result reference alias, current-run reference absence, prior-slot separation, start-offset arithmetic, and task-metadata ordering: no axioms.
- h985 reference-scope classifier: propext.

Tests, lint, leanchecker, nanoda, and global axiom audit were skipped. This verifies the formalized arithmetic and classifier over the transcribed scheduler observations, not scheduler-backend truth, physical premises, worker identity, or cross-thread delivery.

PR #1570 remains OPEN / DRAFT / UNMERGED. An earlier commit in branch history briefly contained a raw conversation reference. The current file uses an opaque token; no force-push or history rewrite was performed. Authorized maintainer disposition remains required before merge.

## 3. Publisher correction

- Original issue #2243 remains PUBLISHED_VERIFIED as a byte-identical artifact, but its nominal-slot and ring-label metadata are incorrect and are superseded by this amendment.
- Corrective report: WORKSPACES/TERN/2026-11-21T0240Z_H986_S3_NOMINAL_SLOT_BINDING_CORRECTION.md
- Corrective report Git blob: 50d52673f0233d421fecd7e310f529823dd2e70a
- Corrective report size: 8,027 UTF-8 bytes
- Corrective report SHA-256: e4cb0b8dcbdfa8e0f3701cbc5b2a18a134c017e904937222c5f265fd695e20e7
- Exact workspace readback: MATCH
- Publisher intake issue #2246, submission ID tern-h986-s3-nominal-slot-binding-correction-20261121t0240z-001, was created with the exact four-key hsh-publish-v1 envelope. No publisher confirmation or canonical artifact was present at this amendment's creation.
- Status: SUBMITTED_NOT_VERIFIED. No retry, issue edit, duplicate submission, or publisher bypass.

## 4. Project and automation boundaries

No physical system, measured dataset, physical calculation, fit, H(s)H prediction, falsification threshold, or independent measurement was created. No SAT-O or Blockwave equation was changed. No BEDROCK promotion or paper-gate advancement.

P0 remains ACTIVE; P1 Orson cognition remains OVERDUE / NOT READY / Orson-owned; P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE. November 9 minor-paper gate remains MISSED; November 30 major-paper gate remains HOLD; December 14 full-theory gate remains INCOMPLETE. FIE next review remains November 24.

The existing :36 task remains enabled with ID 6a9f52b69ec08191b0a2ba24a074f781 and exact original hourly schedule/prompt/phase. Four Workshop Relay tasks remain enabled (:00, :24, :36, :48); :12 remains disabled. No task, ID, schedule, cadence, prompt, phase, or enabled-state mutation; no sixth task, signet, or conversation rename.

## 5. Next cursor

Verify publisher issue #2246 and exact canonical artifact readback. Recheck current :36 run state without borrowing cached-result references. Keep PR #1570 draft/unmerged pending authorized maintainer disposition. Morrow remains the next deterministic label for h986:s4; any repository handoff is optional context only, with no direct-thread delivery, consumption, acknowledgment, assignment, or ownership-transfer claim.

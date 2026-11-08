# Receipt Amendment 02: companion-report reconciliation and UTF-8 checksum correction

Applies to: WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-08T1800Z_s0_enheduanna.md

## Same-run-key work-product reconciliation

Two distinct, non-duplicate source-fidelity reports were published under the same deterministic h690:s0 run key during overlapping scheduler observations:

1. Issue #1495, local radiality/time-normal historical branch. Its distinct contribution is the 9 October 2026 Nathan Direct radiality/mass-retarded time-sheet branch, the assistant PG shift-versus-lapse mismatch, and the 21 October supersession.
   - Submission: enheduanna-local-radiality-time-normal-20261108t1800z-s0-001.
   - Artifact blob SHA-1: 786168fa954759447f7fc5aa58311819738be729.
   - UTF-8 SHA-256: b51264cd43fc12d3a4a894ce8cdf973646077c70782a761b3bdda95f514d501d.
   - Publisher run #42512368291, SUCCESS; commit 39d319d1d0da79b40763d47f749cff14ff5766f9.
2. Issue #1496, moving-slice kinematics and geometry fidelity. Its distinct contribution is the 2024 moving-plane/helix intersection correction, two-point steady-rate geometry, and the 2026 one-core/hollow-coil clarification.
   - Submission: enheduanna-moving-slice-kinematics-fidelity-20261108t1800z-s0-001.
   - Artifact blob SHA-1: 0ee94afdeced0c97bf6f64493c9f54bf66566be1.
   - UTF-8 SHA-256: a60e5d2e9208646899388f934925727521f6aa9858e52f5cfbda0fb7f9074000.
   - Publisher commit 8467cf4a754ca663c2d65e6318d1b1eb1cf2b65a; publisher comment #6725737902.
   - Independent readback: artifact exactly equals issue payload; UTF-8 SHA-256 recomputed and matches.

The reports are complementary, not duplicate content. #1495's O1/Blockwave custody, carrier-dimension, and Lean-gate sections are shared provenance/type controls; #1496 is the primary moving-slice source record. No third issue or duplicate receipt was created.

## Checksum correction for #1495 source-context comment

The canonical receipt recorded comment #6725688336 with a non-UTF-8 SHA calculation. That value was incorrect. Exact GitHub readback is confirmed; correct UTF-8 SHA-256 of the comment body is:

52c875cc8a1c3ba4e8a477a2ab2ba9b4b1da767856bc2f3a9b3d96ff14ce0f38

The #1495 published artifact SHA-256 itself is unchanged and verified. The correction is to the receipt's comment-hash bookkeeping only.

## Scheduler observation

The same scheduler run ID e330bab6-9248-8331-8d6b-877397083b42, scheduled_for 2026-11-08T18:00:00Z, was observed first as FAILED (started 18:30:48.761346Z, completed 18:55:51.685593Z, chat_ref null), then as IN_PROGRESS (started 19:00:54.505049Z, completed_at null, chat_ref null). The cached latest_result remains older h685 run 96537544-1e90-8322-a44c-760f33d54331, created 13:42:17.672294Z. No attempt-history ID or snapshot-observed timestamp is exposed. Preserve both observations; do not infer retry, restart, duplicate execution, worker liveness, or backend cause.

The task remains enabled with the exact original hourly America/New_York schedule and :00 phase. No task, ID, cadence, phase, or enabled-state change was made. No cross-thread delivery/authentication is claimed.
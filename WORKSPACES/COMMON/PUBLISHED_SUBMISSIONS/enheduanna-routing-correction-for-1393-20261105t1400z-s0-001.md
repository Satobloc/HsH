# Routing metadata correction for #1393

**Correction scope:** deterministic run metadata and handoff routing only. The source-fidelity research content in #1393 remains available and is not repeated here.

## Correct nominal selection

The automation runtime for this turn began at 2026-11-05 09:32 America/New_York. The existing :00 hourly occurrence for this turn is 09:00 local = 2026-11-05T14:00:00Z.

h = 614. seq = 5h + 0 = 3070. 3070 mod 19 = 11.

- Worker: Enheduanna, ring index 11.
- Next ring label: Tern Rook, index 12.
- The immediate s1 / :12 phase is disabled and remains disabled.
- Tern's next enabled :00 appearance is h618:s0, 2026-11-05T18:00:00Z.

## What this corrects

Issues #1392 and #1393 were created with h615 / Mercer / Ravel metadata after later wall-clock time was consulted during a long run. That later wall-clock hour is not the nominal scheduled hour for this automation turn. The h615/Mercer/Ravel header and the associated Ravel h619 handoff are therefore incorrect routing metadata for this turn.

The findings in #1393 remain the source-fidelity content: the April 2026 Core Pack recursion, dλ/dH versus dH/dλ discrepancy, Nathan Direct 4D Nth-order worldline constraints, tentative Particle Zoo candidate, w=ct versus oscillatory w(s), one-constant constraint, and missing worldline/worldtube/intersection maps. This correction does not validate or promote any physical equation.

The #1392 and #1393 artifacts are preserved. #1393 remains the readable research-content artifact; this issue is the authoritative correction to its run attribution and handoff destination. No artifact is overwritten.

## Selected worker source boundary

Enheduanna's current workspace says no standalone Nathan-authored specialist charter was recovered. The only located direct instruction is in conversation 6aa8a2bf-8280-83e9-9d57-1e0af853b7f1, raw blob 386516f7c2d5b9ab2cd4f0050869ae00c133274d, message 11399ca2-5bd6-4203-9e19-e8e044fbc736, 2026-09-23T02:04:49.417Z. It says to “always consider all archives.” This is a broad archive-revival instruction, not a specialist charter. The explicit LANE CHARTER 00 governs this work. The Mercer charter read during the earlier routing attempt was not the selected worker's charter and is not claimed as such.

Tern's operative remit is Comptroller/scheduler allocation and workflow-state review, documented in WORKSPACES/TERN/CONTINUITY.md and WORKSPACES/COMMON/SCHEDULER_AUTHORITY_MUST_READ.md. No standalone Tern README or separate role-charter file was found. The corrected optional handoff to Tern is scheduler/source-state context only, not an assignment to perform geometry work.

## Misrouted repository records

The following records are preserved, not deleted, but must not be treated as the valid handoff chain for this h614 turn:

- Mercer receipt: WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-05T1626Z_s0_mercer.md.
- Mercer trial-checkpoint h615 entry.
- Mercer-to-Ravel handoff: WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-05T1626Z_from_s0_to_s0_ravel_h619_addendum_01.md.
- Ravel inbox pointer: MERCER-20261105T1626Z-RAVEL-004.

Append-only corrections will mark these as misattributed. No Ravel thread delivery, consumption, or acknowledgment is claimed.

## Scheduler telemetry caution

A later Automations.peek showed a separate :00 run with scheduled_for=2026-11-05T16:00:00Z, started at 16:24Z, chat_ref=null, and a stale latest-result payload. That later run is not used to select this turn. Keep nominal scheduled hour, actual start time, latest-result payload, deterministic worker label, repository handoff, and thread delivery as separate evidence fields. Root cause of the out-of-order/overlapping run observation is unknown. No conclusion about worker nonresponse follows.

## Controls and disposition

- Existing :00 task ID and exact hourly America/New_York :00 schedule remain unchanged.
- No prompt, phase, cadence, enabled-state, task ID, branch ownership, or task count change.
- No sixth task. The :12 task remains disabled.
- No physical calculation, CODATA scoring, Lean promotion, Factory Floor admission, BEDROCK promotion, paper edit, or theory promotion.
- No signet, chat rename, authenticated identity claim, or cross-thread delivery claim.

**Disposition:** append-only routing correction. Correct run key is REVROT3-19-20261011:614:s0, Enheduanna to Tern Rook. Correct next enabled Tern :00 occurrence is h618:s0.

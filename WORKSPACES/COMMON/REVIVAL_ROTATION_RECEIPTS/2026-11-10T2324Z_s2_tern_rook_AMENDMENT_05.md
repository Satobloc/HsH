# Tern h743:s2 | Receipt Amendment 05 | Lean ring-lookup CI failure and correction

**Observation:** 2026-11-10T23:45Z.  
**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-10T2324Z_s2_tern_rook.md`.  
**Disposition:** FIRST_MERGE_REF_BUILD_FAILED / SOURCE_FIX_COMMITTED / NEW_HEAD_AWAITING_ACTIONS / NO_SUCCESS_CLAIM.

## First CI result

Actions run #42925403904 / job #130210603328 failed during `lake build` on the initial corrected ring-label module. The job did execute Lean 4.34.0 / Lake 5.0.0 and built the wider library, but the target module failed:

- `relayRing.get? i` was rejected because `List.get?` was not available as a field in this environment.
- Five finite ring-label theorems using kernel `decide` failed to reduce String equality decisions.
- The log's `#print axioms` for the failed `h743_s2_worker` showed `sorryAx`; this is a failed proof state, not a verified theorem. It must not be counted as proof.

## Correction

The module was corrected to use the standard indexed optional-access notation `relayRing[i]?` and `native_decide` for the five finite String-lookup theorems. The arithmetic theorems remain kernel-`decide` proofs.

- Corrected module blob: `aad6d1f0d62048ee9efddc520ed9766bbe5fd7bc`.
- Corrected branch head: `5a5a1816b2fe9ef17ca6aa2bdad9be71c1bc5878`.
- PR #1570 remains OPEN / DRAFT.
- No new Actions run/check-run had appeared at the 23:45Z readback.

The workflow uses default pull-request merge-ref checkout, not explicit PR-head checkout or identity assertion. If the next run succeeds, classify it as MERGE_REF_BUILD, not exact-head-only. Exact-head verification remains outstanding.

No successful compilation is claimed. No task ID, schedule, phase, cadence, enabled state, automation count, ownership, or theory status changed.

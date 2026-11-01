# Amendment 03 — canceled superseded run and fifth verification attempt

**Parent report:** `2026-11-01T1036Z_GW250114_CALIBRATION_AND_FALSIFICATION_GATE.md`  
**Date:** 2026-11-01.

The fourth attempt, Actions #41299157755, was **CANCELLED** when the existing PR branch advanced. It had reached the Lean compilation step but did not produce a completed build result. It is not classified as a proof failure or success.

The current existing PR #1166 branch head is now:

`e26a8409a9969e0c6062f756a10104c77972a137`

The filter proof was reordered so the first denominator side goal is discharged from `hminus`, then the second from `hplus`, before the main norm identity is simplified. This ordering follows the goal order observed in the prior failed logs.

The fifth verification attempt is:
- Actions #41299311281
- Run number 812
- Status at final inspection: QUEUED
- Lean compilation: NOT STARTED
- Successful build: NOT VERIFIED.

The branch still contains the two-channel first-echo composition and conditional injectivity theorem. Neither has a successful compilation result yet. No exact-head standalone build has been run.

No successful Lean proof is claimed. The third run #41298868634 remains the latest completed build and failed. The fourth run #41299157755 was canceled before completion. The fifth run must be inspected to completion before any theorem is described as verified.

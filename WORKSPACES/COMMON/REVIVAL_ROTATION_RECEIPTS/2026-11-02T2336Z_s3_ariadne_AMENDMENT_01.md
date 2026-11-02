# Ariadne :36 receipt amendment 01 — exact-head Lean result and publisher retry

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-02T2336Z_s3_ariadne.md`  
**Run key:** `REVROT3-19-20261011:551:s3`

## Exact-head Lean result

The exact current PR #790 head `426f1977a44c03139d4ac2fe9ca28d67ac37d634` passed Actions run #41548459935, job #125629748121.

- Exact-head guard: PASS.
- Lean: 4.34.0.
- Lake: 5.0.0.
- Formal library: 8,949 jobs, SUCCESS.
- `AriadneArtifactTypeGate`: built successfully.
- Twelve `#eval` cases executed, matching the intended artifact/claim classifications.
- Printed theorem axioms include `propext`; some lineage declarations also use `Classical.choice` and `Quot.sound`.
- Tests, lint, nanoda, separate axiom-audit and reservoir checks were skipped.

This verifies compilation/execution of the formalized eligibility model on the exact head. It does not authenticate source bytes, authorship, chronology, extraction, or physical claims.

## Publisher retry result

Issue #1288's current body is now corrected in place and declares SHA-256 `63a4a40917b7b953e0fef8c719cde635923c3f0d410bab74a762731892d0b04a`, matching its current content bytes.

The original publisher run #41548876221 rejected the initial payload because of one extra terminal LF. Rerunning its job replayed the immutable original event snapshot and rejected the same stale payload again. The current publisher reads `GITHUB_EVENT_PATH` and validates `event["issue"]` directly; it does not re-fetch the current issue. The edited issue is not reprocessed by main's `issues.opened`-only trigger.

No published artifact exists at the expected path. Status remains `SUBMITTED_NOT_VERIFIED / PUBLISHER_REJECTED_STALE_EVENT_SNAPSHOT`. No duplicate issue or direct write bypass was used.

A technical comment was added to draft PR #1251 (comment `6591618794`) documenting this reproduction and the separate requirement to preserve/authenticate `event.sender`. PR #1251 remains draft/unmerged.

## Continuing controls

No theory promotion, physical calculation, SAT-O/Blockwave correction, manuscript/site modification, or paper-gate advance. Existing automation remains unchanged; no sixth task.
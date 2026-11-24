# Amendment 02: Next-Cursor Source Correction

Parent receipt: [2026-11-19T1800Z_s0_loom.md](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-19T1800Z_s0_loom.md)

This amendment corrects only the next-source locator in the h954 report. The published h954 artifact, its SHA-256, and its publisher-readback verification remain unchanged.

## Source verification

Authoritative export:
- Path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`
- Conversation ID: `252d05c0-22ed-4ea2-a474-7966ab13145a`
- Git blob: `2cea1924266418e19b825b95ae51e6b7cbace7e1`
- Current ancestry: 138 user-role messages.

The h954 next-cursor line cited `f4b1e2bd-8d2a-48a3-9f50-49f3c8cbf39c` at `2024-03-22T18:16:26.720Z` as user ordinal 31. That UUID does not occur in the recovered export.

Correct source positions:
- User ordinal 31: `aaa22f76-6b4d-4ea5-8705-ae4e2edf2c54`, `2024-03-22T18:13:27.607Z`.
- User ordinal 32: `aaa23d32-77ce-45e6-804c-411562bd579e`, `2024-03-22T18:16:26.720Z`.

## Supersession and repetition control

The full 138-user-message ancestry was already reviewed in the [h745 source-fidelity report, issue #1573](https://github.com/Satobloc/HsH/issues/1573). Do not repeat that conversation as a new source pass. The next Lane 00 pass should use a separate adjacent primary source.

A public correction was appended to [h954 issue #2118, comment #7021241554](https://github.com/Satobloc/HsH/issues/2118#issuecomment-7021241554) and read back.

This amendment does not change any task, worker identity, schedule, phase, theory status, or publication artifact.

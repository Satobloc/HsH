# Receipt Amendment 03 — Duplicate invocation reconciliation

- Applies to the existing Ravel h835:s3 receipt; run key `REVROT3-19-20261011:835:s3`.
- Late duplicate automation invocation: run ID `2a5a030f-7d5a-4ed1-8c39-b5c2e8d5d18b`; scheduled 19:36Z; recorded start 20:01:43Z (25m43s late).
- Existing canonical report and receipt were reused. No second report, receipt, issue, publisher submission, research run, calculation, or handoff was created.
- Existing issue #1750 remains `REJECTED_SHA256_MISMATCH / NO_ARTIFACT / NO_READBACK` under Amendment 02. Declared SHA-256 `04a7a7f179c939e847e115bb22ae3a3c9a55e448b579b5fa18296bace0f63140`; independently recomputed SHA-256 of the exact 6,556-byte decoded content field `20c63d03d7ac0832d40490b4f65af1fa95c2d47f60d4188a00529d49eb3d0bf4`. No retry or duplicate issue.
- An unverified candidate module was briefly added to existing PR #1133 during this duplicate invocation, then deleted; its aggregator import was removed. Final branch head `17dd47829bad180d1fa3f6fb885ff447a5e76f88`; module absent; aggregator blob restored to `9185d1d411d1ddd02451daf2e6887bfd539e1797`. No Lean build or proof is claimed.
- PR #1133 remains OPEN / DRAFT / UNMERGED; stacked parent unchanged; comparison 65 ahead / 11 behind.
- The 19:24Z Mercer P0 packet is not the missing 19:30Z NIST packet; Amendment 01 remains controlling. No NIST packet consumption claim.
- Orson P1 remains protected; no handoff or assignment.
- Automation configuration unchanged; no sixth task, schedule, phase, or ID mutation.

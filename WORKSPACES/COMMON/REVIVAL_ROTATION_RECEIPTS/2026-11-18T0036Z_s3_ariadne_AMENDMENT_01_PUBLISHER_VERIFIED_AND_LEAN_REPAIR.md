# Amendment 01 — Ariadne h912:s3 publication and Lean repair

**Canonical receipt:** [2026-11-18T0036Z_s3_ariadne.md](2026-11-18T0036Z_s3_ariadne.md)  
**Amendment status:** PUBLISHED_VERIFIED / LEAN_CI_PENDING.

## Publication readback
- Intake issue: [#1939](https://github.com/Satobloc/HsH/issues/1939).
- Publisher comment: #6965596622 — PUBLISHED.
- Publisher commit: fa54dafb66b01d09ed49b7cfcf4154686d57c803.
- Canonical artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-h912-s3-topology-split-gate-20261118t0036z-001.md.
- SHA-256: 9588ce0733f6ca5a2e4357b6294d3bbc9e3e0b4fddbadd624ecbf829c804588a.
- Report and published artifact Git blob SHA-1 are both b2e8137afc28930310b4519754846a6561eab6c5; both are 8,987 Unicode code points / 9,018 UTF-8 bytes. Independent fetch comparison: exact content match PASS.
- No retry, duplicate issue, manual artifact write, or publisher bypass.

## Lean source correction
- First exact-head run #44210550536 failed in AriadneConnectednessSplitGate.lean because IsConnected.image requires the function argument before the ContinuousOn proof; the module had supplied only the proof.
- Corrected source calls hS.image f hf and hS.image e e.continuous.
- Corrected head: 2245747b6aaed67fbab770be98407e6559d43514.
- Exact-head run #44211466248 observed IN_PROGRESS at dependency-manifest generation. No successful compile or axiom report is claimed until a terminal run is read back.
- The first failure is a real source/type error, not a counterexample to the topological result. The repair is a new source commit; no unchanged retry.

## Existing issue and handoff readback
- Candidate issue #1339 comment #6965604411: exact readback PASS.
- P2 docket #565 comment #6965604904: exact readback PASS.
- PR #1938 comment #6965605399: exact readback PASS.
- Optional packet: WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-18T0036Z_from_s3_to_s4_alberr_POSTSTART_OPTIONAL_TOPOLOGY_SPLIT_GATE.md; blob a1e194cf2bc8a1a974003aff456af10a474f46cf.
- Alberr INBOX pointer appended; commit a2021803234e715e30bd4b254a99f40c8494ecec. Packet was post-start, repository-only. No delivery/consumption/acknowledgment or participation claim.

No physical calculation, fit, prediction, independent measurement, P2 selection, BEDROCK promotion, or automation/task change.

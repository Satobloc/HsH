# h1134:s3 Enheduanna — Amendment 03: corrected Lean head verified

This amendment supersedes the pending Lean status in Amendments 01 and 02. It does not replace the original receipt, alter the published snapshot, or create a duplicate report.

## Corrected exact-head Lean result

PR [#2663](https://github.com/Satobloc/HsH/pull/2663) remains OPEN / DRAFT / UNMERGED at head `cb867fbc583fd27257b944b280d79efaafd8c8a7`.

Exact-head Actions run [#45953622873](https://github.com/Satobloc/HsH/actions/runs/45953622873), job `140354938729`, completed SUCCESS.

- The explicit assertion logged expected PR head and actual checkout both as `cb867fbc583fd27257b944b280d79efaafd8c8a7`.
- The environment step printed synthetic merge `GITHUB_SHA=fbe22512f9819919f3a71677bce849ada206940c`. This event SHA is distinct from the asserted checked-out PR-head source.
- Lean 4.34.0 / Lake 5.0.0.
- Full library build: 8,948 jobs.
- Target module `HsHVerification.GaussianCoreReadoutAlias` built at 8946/8948.
- Two rational `#eval` witnesses returned `true`, `true`.
- Theorem-specific `#print axioms` for `common_shift_alias` and `positive_two_instrument_alias` list `propext`, `Classical.choice`, `Quot.sound`.
- No `sorryAx` or `admit` appeared in the inspected target-module output.
- Tests, lint, global axiom audit, leanchecker and nanoda were skipped.

The first exact-head attempt #45953113816 failed because an extra tactic followed a `simp` that had already closed the goal. Corrective commit `cb867fbc...` removed that tactic and unused assumptions. The failed attempt remains in the audit history; it is not represented as a successful build.

**Formal limit:** Lean verifies the encoded two-instrument variance-map statements. It does not prove the Gaussian convolution premise, that any physical core or instrument has a Gaussian kernel, that H(s)H has a measurable finite thickness, or that the proposed source-to-instrument map is physically correct.

## Publication — unchanged and verified

Issue [#2664](https://github.com/Satobloc/HsH/issues/2664) and its canonical artifact remain `PUBLISHED_VERIFIED`.

- Confirmation: [#7211817197](https://github.com/Satobloc/HsH/issues/2664#issuecomment-7211817197).
- Additive Lean status correction: [#7211849611](https://github.com/Satobloc/HsH/issues/2664#issuecomment-7211849611).
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-h1134-s3-gaussian-core-readout-alias-20261127t0636z-001.md`.
- Publisher commit: `d3668cc4d74da399ca2c4aab5f41eb17b1974d6f`.
- SHA-256: `e0a8deb481c7b2e6382ec2cbc3859ec515234b4838cbb9f05f1091980cf6bcd2`.
- Exact issue-envelope/artifact readback: 5,307 characters, match; artifact blob `bb1a0b1f154ab266ee27d5b0f5362397c3eb6df8`.

The two earlier publisher rejections and the corrected in-place retry remain visible. No duplicate issue or direct artifact write occurred.

## Physical and governance limits

No measured system or dataset was selected or acquired. No physical calculation, fit, prediction, uncertainty propagation, numeric falsification threshold, or independent measurement. No SAT-O/Blockwave equation changes, BEDROCK theory promotion, or paper-gate advancement.

P1 remains overdue/frozen/Orson-owned; P2 remains HOLD for November 30; P3 remains incomplete for December 14. P0 presentation safety remains FAIL; deployment/release unauthorized. Tern retains PWH/scheduler coordination. No queue, graph, worker inbox or worker checkpoint write.

Existing :36 task remains enabled with its original ID, hourly :36 Eastern schedule and Worldtube phase. No sixth task or scheduler mutation. No authenticated Enheduanna or Tern thread, direct delivery, consumption, acknowledgment or ownership transfer is claimed.

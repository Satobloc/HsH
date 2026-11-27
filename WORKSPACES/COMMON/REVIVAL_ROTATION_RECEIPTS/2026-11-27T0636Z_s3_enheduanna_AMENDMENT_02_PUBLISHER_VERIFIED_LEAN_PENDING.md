# h1134:s3 Enheduanna — Amendment 02: publication verified, corrected Lean run pending

This amendment supersedes only the publisher status in Amendment 01 and records the latest formal-verification state. The original receipt and Amendment 01 remain intact.

## Publication — verified

Existing issue [#2664](https://github.com/Satobloc/HsH/issues/2664) is now `PUBLISHED_VERIFIED`.

- Initial issue-opened payload was rejected for missing `sha256`.
- First corrected four-key payload was rejected because the declared digest included a trailing newline.
- The same issue body was corrected in place; no duplicate issue was created.
- Publisher confirmation: [comment #7211817197](https://github.com/Satobloc/HsH/issues/2664#issuecomment-7211817197).
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-h1134-s3-gaussian-core-readout-alias-20261127t0636z-001.md`.
- Publisher commit: `d3668cc4d74da399ca2c4aab5f41eb17b1974d6f`.
- SHA-256: `e0a8deb481c7b2e6382ec2cbc3859ec515234b4838cbb9f05f1091980cf6bcd2`.
- Independent readback: issue-envelope content and canonical artifact are exactly equal, 5,307 characters; artifact blob `bb1a0b1f154ab266ee27d5b0f5362397c3eb6df8`.

The two earlier rejection comments remain visible as history; the final publisher comment and exact readback establish the successful third attempt.

## Lean — corrected head still pending

- Initial exact-head run [#45953113816](https://github.com/Satobloc/HsH/actions/runs/45953113816) failed at the redundant tactic after `simp` had closed the goal. Both rational `#eval` witnesses executed `true`, `true`; theorem-specific axiom output listed `propext`, `Classical.choice`, `Quot.sound`. No successful module build is claimed for that attempt.
- Corrective commit: `cb867fbc583fd27257b944b280d79efaafd8c8a7`.
- Corrected module blob: `89c30b3d961619f8cccdd7d7c45c2d596d4789fc`.
- Updated exact-head run [#45953622873](https://github.com/Satobloc/HsH/actions/runs/45953622873) passed setup, checkout, exact-head assertion and Lake manifest generation. At this amendment's final readback, `Install Lean and compile formal library` remained IN_PROGRESS; no corrected-head build, `#eval` or axiom-audit result is yet claimed.

PR [#2663](https://github.com/Satobloc/HsH/pull/2663) remains OPEN / DRAFT / UNMERGED. No merge, independent review, physical claim or BEDROCK promotion.

## Other controls

No measured system, dataset, calibration, fit, prediction, uncertainty propagation, numeric falsification threshold or independent measurement. No SAT-O or Blockwave equation change. P1 remains overdue/frozen/Orson-owned; P2 HOLD; P3 incomplete; P0 presentation safety FAIL with release unauthorized. No PWH queue, graph, worker inbox or checkpoint write.

The existing :36 task remains enabled with its original ID, hourly :36 Eastern schedule and Worldtube phase. No sixth task or scheduler mutation. No authenticated Enheduanna or Tern thread, direct delivery, consumption, acknowledgment or ownership transfer is claimed.

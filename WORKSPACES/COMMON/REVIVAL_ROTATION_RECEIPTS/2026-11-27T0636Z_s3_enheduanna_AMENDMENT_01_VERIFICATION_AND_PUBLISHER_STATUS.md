# h1134:s3 Enheduanna — Amendment 01: verification and publisher status

This amendment supersedes the provisional verification and publisher fields in the original h1134:s3 receipt. It does not replace the original receipt or create a duplicate report.

## Lean verification correction

Initial exact-head run [#45953113816](https://github.com/Satobloc/HsH/actions/runs/45953113816) completed FAILURE on original head `4637b468a2d0deef7fc3762e4773e69f1d87ca6b`.

- Exact PR-head checkout assertion passed.
- Lake manifest generation passed.
- Full build failed at `GaussianCoreReadoutAlias.lean:34:2` with `No goals to be solved`: the preceding `simp` had already closed the theorem goal and an extra tactic was erroneous.
- Both rational `#eval` witnesses executed and returned `true`, `true`.
- Both theorem-specific `#print axioms` commands emitted `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx` appeared in the inspected target output.
- The module did not build successfully as a file. The axiom and evaluation output does not convert the failed build into a successful verification.

Corrective commit: `cb867fbc583fd27257b944b280d79efaafd8c8a7`. It removes the redundant tactic and unused positivity assumptions. New module blob: `89c30b3d961619f8cccdd7d7c45c2d596d4789fc`. The root aggregator is unchanged.

Updated exact-head run [#45953622873](https://github.com/Satobloc/HsH/actions/runs/45953622873) has passed setup, checkout and exact-head assertion. Lake manifest generation was still in progress at this amendment; the Lean build, updated `#eval` outputs and theorem-specific axiom reports are not yet verified. Current PR #2663 remains OPEN / DRAFT / UNMERGED.

## Publisher correction

Existing issue [#2664](https://github.com/Satobloc/HsH/issues/2664) was used once; no duplicate issue or direct artifact write was made.

- Initial issue-opened event was rejected: `unexpected payload keys` because the first envelope omitted the required `sha256` field.
- First in-place correction used the exact four-key schema but a digest that included a trailing newline not present in the issue content. The edited-event publisher rejected it: `SHA-256 mismatch`.
- The issue body was then corrected in place to SHA-256 `e0a8deb481c7b2e6382ec2cbc3859ec515234b4838cbb9f05f1091980cf6bcd2`, computed over the exact 5,309 UTF-8-byte content without a trailing newline.
- At this amendment's readback, no subsequent publisher confirmation comment or canonical artifact was present. Status remains `CORRECTED_IN_PLACE / REPROCESSING_UNCONFIRMED / NOT_PUBLISHED_VERIFIED`.

The live workflow file `.github/workflows/issue-publisher.yml` currently listens to `issues: [opened, edited]`; the validator requires exactly `schema`, `submission_id`, `content`, `sha256`. No bypass, direct write, duplicate issue or further edit was attempted.

## Current disposition

- PR #2663: corrected head submitted; exact-head build pending.
- Issue #2664: corrected payload; publisher result pending.
- Original receipt: remains canonical; this amendment supplies the corrected status.
- No physical system, dataset, calibration, fit, prediction or independent measurement.
- P0 remains FAIL / no release. P1 frozen. P2 HOLD. P3 incomplete.
- No PWH queue, graph, worker inbox or worker checkpoint write.
- Existing :36 task remains enabled with original ID, hourly :36 Eastern schedule and Worldtube phase. No task mutation or sixth task.
- No authenticated Enheduanna or Tern thread, delivery, consumption, acknowledgment or ownership transfer is claimed.

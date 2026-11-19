# Kestrel h956:s3 Amendment 02 — exact-head Lean verification

**Status:** `LEAN_EXACT_HEAD_PASS` for the formalized mathematical statements only.

The corrected PR #2126 head is `d364994731889a46434d67b3b2a6717066f029fb` on branch `research/kestrel-logtime-sampling-20261119t2036z`, targeting the existing `infra/lean4-verification-20261023` project branch. The PR remains DRAFT / OPEN / UNMERGED.

- Exact-head GitHub Actions run: [#44612550693](https://github.com/Satobloc/HsH/actions/runs/44612550693).
- Job #135872666923: SUCCESS.
- Exact PR-head checkout assertion: PASS.
- Full Lake build: 8,948 jobs; module `HsHVerification.KestrelLogTimeSampling` built at 8,926/8,948.
- Lean 4.34.0; Lake 5.0.0.
- Source arithmetic `#eval`: `1 s / 2.5 ms = 400`; `1050 s / 60 = 35/2` minutes.
- Theorems compiled: source-step offset, constant log-clock increment, source-specific log-clock step, inverse maps, generic physical-time reparameterization chain rule, and positive log-clock increment.
- Theorem-specific `#print axioms` outputs for `source_logClock_step`, `physicalTime_logClock`, `hasDerivAt_physicalTimeReparam`, and `logClock_step_pos` list `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` appears in those theorem-specific outputs.

The initial exact-head run #44611776425 failed because the real logarithm/exponential definitions were not in a `noncomputable section`; the corrected head marks them noncomputable and adds inverse-map and chain-rule proofs. This is a corrected, successful exact-head build, not a claim that the first attempt passed.

**Limits:** tests, lint, global axiom audit, leanchecker and nanoda were skipped by the existing workflow; the generated Lake dependency manifest is not committed. No independent source-translation audit was performed. Lean verifies only the formalized coordinate identities and generic chain-rule statement. It does not validate PIV timestamps, prove the turbulent-energy PDE, establish an H(s)H time-surface, or supply a physical prediction. No raw data were acquired and P2 remains HOLD / candidate-only.

No Factory Floor intake: this is not a physical geometry submission and has no precise object plot or independent hostile geometry review. No merge, theory promotion, or task change.

# Near-fiber stability gate for a chain-aware readout

**Status: PROPOSED FORMALIZATION / LEAN_COMPILE_PENDING.** This is a conditional metric-space result and a candidate Lean extension. It is not yet a compiled proof, physical prediction, or empirical finding.

## Conditional bound

Let `p : X₀ → Y` be an upstream projection and `g : Y → Xₙ` a decoder shared by all admissible inputs. For an admissible pair `x,y`, suppose:

- the projected inputs are near: `d_Y(p(x), p(y)) ≤ ρ`;
- the decoder is pairwise stable on this pair: `d_Xₙ(g(p(x)), g(p(y))) ≤ K d_Y(p(x), p(y))`, with `K ≥ 0`;
- each exact chain output is approximated through the same projection/decoder with finite-chain error at most `Eₙ`;
- observed endpoint outputs `oₓ,oᵧ` have deterministic output-space radii `ηₓ,ηᵧ` around the corresponding exact outputs.

Then the candidate result is

\[
d(o_x,o_y) \leq \eta_x+\eta_y+2E_n+K\rho.
\]

Consequently, if a held-out observed separation exceeds that right-hand side, no decoder satisfying all four contracts can fit both endpoints.

The extension matters because empirical pairs need not lie on an exactly identical projection fiber. The extra `Kρ` term makes the cost of imperfect matching explicit. It also exposes hidden flexibility: if `K` is not independently bounded and frozen from calibration, the threshold can be inflated and the test is not falsifiable.

## What this does and does not establish

- It composes the existing finite-chain error budget with a near-fiber stability allowance and asymmetric endpoint radii.
- It is a conditional no-go for a specified projection/decoder/chain contract, not a falsification of SAT/H(s)H as a whole.
- It does not define a physical projection, detector map, worldtube thickness, twist, contact surface, or SAT-specific prediction.
- `ηₓ,ηᵧ` are deterministic metric radii, not standard deviations. Statistical application requires an explicit confidence/covariance model.
- `ρ` and `K` must be independently sourced; `K` must be fixed on calibration data before holdout evaluation. `Eₙ`, `η`, and `Kρ` must be dimensionally compatible in the final output metric.
- No measured system, dataset, units, uncertainties, fit, or prediction was supplied or invented in this run. No physical calculation was performed.

## Relation to existing formal work

This is an additive extension to the chain-aware fiber work in [HsH PR #2323](https://github.com/Satobloc/HsH/pull/2323), building on the finite-chain error budget already used there. It is structurally related to the baseline-only robust predictor bound in [HsH PR #1189](https://github.com/Satobloc/HsH/pull/1189), whose tolerance has the form `Kε + 2δ`; the present candidate adds the chain allowance `2Eₙ` and asymmetric endpoint radii `ηₓ+ηᵧ`.

Candidate source location: [`KestrelChainAwareFiberBound.lean`](https://github.com/Satobloc/HsH/blob/5f17c857d5d0160bb987d3ee8bd08a3f6133641c/FORMAL_VERIFICATION/HsHVerification/KestrelChainAwareFiberBound.lean), branch commit `5f17c857d5d0160bb987d3ee8bd08a3f6133641c`, file blob `fb80cf34cf17f41ce1d4cd56b1e925df983c99d8`. The source-level scan found no `sorry` or `admit` tokens; that scan is not a compile.

## Verification status

The prior successful Lean 4/Mathlib run [#44993559061](https://github.com/Satobloc/HsH/actions/runs/44993559061) was a **merge-reference build** on the previous branch head `faca7c5009617174142edf63193a49651a6abb8c`; it did not include this extension. The new commit produced only a separate `conversation-json-content-ci` run [#45090303070](https://github.com/Satobloc/HsH/actions/runs/45090303070) (conclusion `failure`, no Lean job); no Lean run appeared for the new commit. The Lean workflow file is present on the stacked base branch but absent from default `main`, and the connected runtime exposes no workflow-dispatch action. No local Lean/Lake toolchain or networked checkout was available. Therefore this candidate is **NOT LEAN-COMPILED / NOT VERIFIED**. No proof claim is made.

## Source fidelity

The original files were read without editing or normalizing their equations:

- `SATOBLOC/SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; observed source commit `b543eb3fbf16e50500ceadad83dc9a7dc0759e5b`, dated `2025-10-27T00:40:28Z`.
- `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; observed source commit `6e4415f62616b19ae5cb677984c85d1985834d9d`, dated `2026-10-08T02:42:49Z`.

No SAT-O or Blockwave equation was used to derive this generic metric lemma, and no correction was made. Any future correction must remain a separately identified version, never an overwrite of the original source.

## Archive and tooling status

Mersearch was not run: all four canonical request lanes remain `requested`, and no lane was overwritten or retriggered. GitHub code search/direct source retrieval is a bounded fallback, not a Mersearch result. The existing Math Hopper workflow is extraction-only and explicitly records `lean_status=NOT_RUN`; it is not a proof substitute. No new tooling, fork, workflow, or paid service was created or used.

## Next admissible step

Obtain an authorized Lean 4/Mathlib run against commit `5f17c857d5d0160bb987d3ee8bd08a3f6133641c`, then independent review of the formal statement and its translation. Only after a real system, source-defined maps, units, uncertainties, calibration/holdout split, and a standard comparator are selected can the conditional inequality become an empirical discriminator.

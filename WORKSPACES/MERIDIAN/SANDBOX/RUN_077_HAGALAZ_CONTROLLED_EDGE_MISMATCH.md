# Run 077 — Hagalaz controlled edge-mismatch benchmark

**Status:** SANDBOX / CLAIMED numerical benchmark  
**Branch/task:** Meridian solver/formalization continuation after Run 076  
**Date:** 2026-09-21  
**Quarantine:** untouched; no PRIOR_ART/nLab/private quarantine ingress.

## Bounded operation

Followed Run 076's blinded-triangle cursor for the Hagalaz similarity-transform composition candidate. Used three randomly generated absolute 4D frames `(c_i,s_i,R_i)` only to generate pairwise relative edges

`H_ji=(t_ji,sigma_ji,Q_ji)` with

`t_ji = R_j^T(c_i-c_j)/s_j`, `sigma_ji=s_i/s_j`, `Q_ji=R_j^T R_i`,

then scored only the composed edge loop. Composition convention retained from Run 076:

`(t2,s2,Q2) o (t1,s1,Q1) = (t2+s2 Q2 t1, s2 s1, Q2 Q1)`.

Baseline compatible triangle residuals were translation `7.05e-16`, absolute log-scale `0`, and rotation Frobenius-to-identity `1.15e-15`.

A controlled mismatch was then injected into the `1->2` edge only: target-coordinate translation perturbation of norm epsilon plus an SO(4) rotation of angle epsilon in one coordinate plane. For each epsilon, 200 random translation directions were sampled; all other pairwise data were unchanged. Median loop residuals:

| epsilon | translation residual | abs(log scale) | rotation Frobenius residual |
|---:|---:|---:|---:|
| 1e-6 | 1.617e-6 | 0 | 1.414e-6 |
| 1e-4 | 1.583e-4 | 0 | 1.414e-4 |
| 1e-2 | 1.630e-2 | 0 | 1.414e-2 |
| 1e-1 | 1.612e-1 | 0 | 1.414e-1 |

## Result

For this controlled construction the Hagalaz loop residual responds monotonically and approximately linearly to edge mismatch across five decades. The rotation score follows the expected `2*sqrt(2)*sin(epsilon/2)` behavior for a single-plane rotation, giving `~sqrt(2)*epsilon` at small epsilon. Translation response is also linear in epsilon but its coefficient depends on surrounding scale/rotation transport and perturbation direction; it should not be treated as a universal calibration constant.

This establishes a clean sensitivity control for the candidate edge-composition architecture. It does **not** establish that this is Nathan's intended Hagalaz operator, does not establish physical meaning, and does not yet compare against Three-Spheres gate/closure metrics or Whirligig readout.

## Important metric correction / next requirement

`||Q_loop-I||_F` is conjugacy invariant for orthogonal gauge changes and is therefore suitable as a simple rotation-loop score. The raw translation norm of a Sim(4)-like residual is not generally invariant under arbitrary similarity-frame gauge changes. Before comparing Hagalaz translation residuals across representations, either fix a material/director gauge or construct an appropriate dimensionless/gauge-controlled translation score. This is now a concrete constraint on the next cross-solver benchmark.

## Sources / provenance

Direct dependency: `WORKSPACES/MERIDIAN/TRIAL_CHECKPOINT.md`, Run 076 typed composition and frontier. No external literature was used in this bounded benchmark. Exact September-11 Hagalaz source remains unrecovered, so the operator retains reconstructed/candidate status.

## Capability / feed disposition

No Nathan Words feed item was needed: this operation tested the already-recorded Run 076 candidate convention and did not resolve terminology drift or intended-object meaning. Feed disposition: **NOT RELEVANT for this bounded control**.

## Durable boundary / next cursor

Next highest-value mathematical step is **not** more epsilon sweeps. Build the Three-Spheres side of the comparison with a representation-compatible closure/gate residual, then compare its response to the same controlled mismatch. Keep translation gauge handling explicit. Separately, recovery of the original September-11 Hagalaz definition remains a source-priority branch; do not silently promote this candidate composition while that source gap remains.
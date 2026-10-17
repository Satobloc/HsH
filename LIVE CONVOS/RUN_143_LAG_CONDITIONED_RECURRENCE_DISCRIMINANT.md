# Meridian Run 143 — lag-conditioned recurrence discriminant

**Status:** SANDBOX / analytic discriminator + bounded numerical benchmark  
**Date:** 2026-09-26  
**Dependencies:** Meridian Runs 072–073; live `TRIAL_CHECKPOINT.md`.  
**Quarantine:** PRIOR_ART, nLab, and quarantined comparison sources were not opened or used.

## Bounded operation

Follow the live Meridian cursor exactly: retain the order-4 palindromic two-rate recurrence, replace adjacent samples by stride-\(L\) samples, and ask whether lag itself is the conditioning variable.

Let
\[
\tau=L\,dt,\qquad
x=\cos(\omega\tau),\qquad
y=\cos(\nu\tau).
\]

The exact recurrence remains
\[
c_{n+4L}-s_1c_{n+3L}+s_2c_{n+2L}-s_1c_{n+L}+c_n=0,
\]
with
\[
s_1=2(x+y),\qquad s_2=2+4xy.
\]

The cosine roots are recovered from
\[
q^2-\frac{s_1}{2}q+\frac{s_2-2}{4}=0.
\]

## Exact lag discriminant

The quadratic discriminant is
\[
\Delta_q
=
\left(\frac{s_1}{2}\right)^2-(s_2-2)
=
(x-y)^2.
\]

Using the cosine-difference identity,
\[
\boxed{
\Delta_q(\tau)
=
4\sin^2\!\left(\frac{(\omega+\nu)\tau}{2}\right)
 \sin^2\!\left(\frac{(\omega-\nu)\tau}{2}\right).
}
\]

Therefore lag does not merely alter a numerical estimator: it changes the exact algebraic separation of the two recoverable cosine modes.

For small \(\tau\),
\[
\sin\!\left(\frac{(\omega+\nu)\tau}{2}\right)
\sim\frac{(\omega+\nu)\tau}{2},
\qquad
\sin\!\left(\frac{(\omega-\nu)\tau}{2}\right)
\sim\frac{(\omega-\nu)\tau}{2},
\]
so
\[
\boxed{
\Delta_q(\tau)
\sim
\frac{(\omega^2-\nu^2)^2}{4}\tau^4.
}
\]

Thus the adjacent-sample decoder is driven toward a fourth-order discriminant collapse as \(dt\to0\). Increasing stride initially improves exact cosine-root separation as \(L^4\), before finite-window loss and trigonometric alias/collision structure intervene.

## Exact blind-lag warning

The same formula identifies bad lags:
\[
\Delta_q(\tau)=0
\]
whenever either
\[
(\omega-\nu)\tau=2\pi k
\]
or
\[
(\omega+\nu)\tau=2\pi k,
\qquad k\in\mathbb Z.
\]

Hence “use the largest lag” is not a theorem. A useful lag must jointly:
1. keep enough windows for estimation;
2. avoid cosine collisions/aliases;
3. enlarge \(\Delta_q\) relative to the coordinate-noise floor.

## Bounded numerical check

Primitive data were kept identical to Runs 072–073:
- \(a=1.2,\ b=0.65\);
- \(\omega=1.1,\ \nu=1.0\) (easy gap \(0.1\));
- 161 samples on \([-2,2]\), \(dt=0.025\);
- iid coordinate Gaussian noise \(\sigma=10^{-4}\);
- stacked four-coordinate five-point block-Hankel TLS;
- palindromic projection;
- 200 deterministic-seed trials per stride.

Representative results:

| stride \(L\) | valid / 200 | median relative gap error | 95% relative gap error |
|---:|---:|---:|---:|
| 1 | 152 | 364.19 | 839.94 |
| 4 | 138 | 2.303 | 6.124 |
| 8 | 195 | 0.206 | 0.647 |
| 12 | 200 | 0.0681 | 0.190 |
| 16 | 200 | 0.0280 | 0.0830 |
| 20 | 200 | 0.0165 | 0.0473 |
| 24 | 200 | 0.00856 | 0.0247 |
| 30 | 200 | 0.00795 | 0.0219 |

This is a bounded benchmark, not a general estimator theorem. It does show that the Run-073 failure was strongly lag-conditioned: the identical TLS architecture changes from catastrophic at \(L=1\) to sub-1% median gap error around \(L=24\)–30 for the easy gap.

## Publication-facing theorem candidate

**Lag-conditioned recurrence discriminator.**  
For a two-rate constant double rotation sampled at lag \(\tau\), the exact palindromic recurrence resolves the two cosine modes through the discriminant
\[
\Delta_q(\tau)
=
4\sin^2\!\left(\frac{(\omega+\nu)\tau}{2}\right)
 \sin^2\!\left(\frac{(\omega-\nu)\tau}{2}\right).
\]
Near zero lag this collapses as \(\tau^4\). Consequently adjacent-sample recurrence acquisition can be intrinsically ill-conditioned even though the recurrence identity is exact; decimation can restore algebraic separation, subject to finite-window and alias/collision constraints.

This is a representation/estimation statement for the declared constant double-rotation model. It does not establish physical dynamics, empirical realization, equivalence among SAT/H(s)H solvers, or a canonical ᚼ operator.

## Control / provenance disposition

Freshly read this run:
- direct War Room declaration;
- live Meridian `TRIAL_CHECKPOINT.md`;
- Runs 072 and 073;
- Tool-Library `workflow_switchboard_demo.py`.

The live checkpoint, not remembered later work, controls this operation and explicitly names lag/decimation as the next cursor. Fresh GitHub searches for literal ROT5, headline-pressure/active-edge, current-orientation, and switchboard-development labels returned zero/incomplete results on the queried default branches; they are not represented as freshly read and no remembered copies were substituted.

No quarantined source was opened.

## Durable next cursor

The easy-gap gate is now passed for this estimator at moderate stride. Next bounded operation: hold the stride rule fixed or select it from the analytic discriminant without looking at recovery error, then test the smaller gaps \(0.03,0.01,0.003\). Do not tune \(L\) separately on each gap's output.

# Hale s1 | Noisy reference-label calibration

GEN/DERIVED synthetic calculation, 2026-10-16 03:12 UTC; source-grounded reconstruction, not historical Hale participation.

Reference-label error c and emission error e produce disagreement D=e+c-2ec. Noisy-label Fisher information for (e,c) is rank one: m/[D(1-D)] times outer((1-2c),(1-2e)). Independent reference audits add b/[c(1-c)] along c. Schur complement for e: [m(1-2c)^2/[D(1-D)]] [b/[c(1-c)]] / [m(1-2e)^2/[D(1-D)] + b/[c(1-c)]]. Without audits the calibration alone cannot separate e from c.

Inherited HMM fixture p=0.7914541417127793, e=0.03143198557693108, alpha=0.99, c=0.1. Exact finite-string Fisher enumeration and exhaustive integer allocation at B=n+m+b=16 give optimum n=10 track observations, m=3 noisy-label comparisons, b=3 reference audits; smallest joint Fisher eigenvalue 5.897781863390. Best without audits: 0.000004553814. Gold known-c optimum: 9.412852657147. All programmed tests passed, including score normalization, rank-one identity, Schur complement and finite-difference step halving. Full executable code, execution log and Class P figures appear in the archived scheduled conversation. No empirical/physical claim; Fisher curvature is not finite-sample coverage.

# Aldus | Joint-feature exposure baseline gate | 2026-10-12
run_key: REVROT3-19-20261012:22:s4
participation_class: SOURCE_GROUNDED_RELAY_RECONSTRUCTION
status: SYNTHETIC_EXACT_MATH / NOT_EMPIRICAL / NOT_PHYSICAL_CLAIM

## Source basis
- WORKSPACES/COMMON/ALDUS_CHECKIN_2026-09-12.md (blob 5d56ad3116ed6a4891154f80648fb1daa5a49ca5): Aldus's two-firsts public chronology, feature-specific T0 and Bayesian comparison; lexical matches alone insufficient.
- WORKSPACES/SABLE/WAKE_PACKETS/REV-002-ALDUS-REENTRY.md (blob 199efa4f3071bb28d749ce325cdf3ea2247c0613): independent contradiction/provenance method.
- WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-12T0400Z_s0_calder_angle_null.md (blob de0d10ef69405058fff3429a8ceea2c32b4f2541): source-family clustering and pseudoreplication.

## Exact null sensitivity
For two predefined features A and B, q=P(A and B) obeys
max(0,pA+pB-1) <= q <= min(pA,pB).
Independence q=pA*pB is an additional assumption, not implied by marginals.

Synthetic example: pA=pB=0.10, n=100 independent source families, k=8 joint hits.
Then 0 <= q <= 0.10, with exact one-sided binomial tail
P(X>=8|q)=sum_{j=8}^{100} C(100,j)q^j(1-q)^(100-j).
q=0.01 (independence): 0.00000822020473856651
q=0.03: 0.01062380885617835
q=0.05: 0.12796047862037843
q=0.08: 0.5528902487955418
q=0.10: 0.7939491381959921
The q threshold for 5% tail is 0.04042887062402879.
All numbers were produced by standard-library Python exact binomial enumeration and tested for endpoint and monotonicity properties.

Therefore a bundle can appear exceptionally rare under assumed independence but ordinary under admissible feature dependence. No actual paper data or SAT feature rates were used; these are sensitivity calculations only.

## Aldus/Hale gate
1. Freeze feature definitions, structural-versus-lexical criteria and feature-specific public T0 from dated primary records.
2. Count independent source families, not mirrored versions/rows; use a pre-T0 cohort.
3. Estimate or bound pre-T0 joint bundle prevalence q directly. Do not multiply marginal rates without evidence.
4. When q is unidentified, report JOINT_NULL_UNIDENTIFIED and sensitivity bounds, not a convergence Bayes factor.
5. Check temporal/domain/exposure confounding, document negative controls and keep public/external chronology distinct from internal invention chronology.

Next cursor: one actual Aldus/Hale feature pair with verified public T0 and independent pre-T0 source-family joint counts. No external prior-art material was opened; no physical theory promotion.

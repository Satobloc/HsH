# Run 087 — Typed Three-Spheres carrier regression execution

**Date:** 2026-09-21  
**Branch/task:** `LAB-SBS-001`  
**Status:** REGRESSION EXECUTED / PASS on independent Python reconstruction  
**Quarantine:** untouched; no PRIOR_ART/nLab/private ingress.

## Bounded operation

Exercised the numerical core and all four RUN 086 regression fixtures in a Python-capable runtime, independently reconstructing the committed algorithm from `WORKSPACES/LABS/SIDE_BY_SIDE_SOLVER/three_spheres_carrier.py`.

Observed numerical controls:

1. equilateral `R=1`: `kappa2(K)=3`, `G=0.6666666666666667`, `r_c=0.5773502691896257` — certified carrier-present fixture;
2. lower isosceles collapse point `h_c = 1-sqrt(3)/2`: `kappa2(K)=87.55779835441334`, `G=-1.3322676295501878e-15`, `r_c=1.0000000000000007` — numerically regular near-zero boundary, consistent with bracket-certified collapse rather than singularity;
3. skinny adversarial fixture: `kappa2(K)=1000000.5000493557`, `G=0.7499998749999843`, `r_c=0.5000001250000001` — conditioning guardrail fires while a positive raw carrier margin remains;
4. collinear fixture: Gram system is singular — geometry must remain unresolved, not be labeled collapse.

The sign-changing bracket used by `classify_crossing()` follows continuously around fixture 2 and therefore satisfies the RUN 086 event criterion. No discrepancy was found between the committed status contract and these numerical controls.

## Verification boundary

This run independently executed the committed formulas/fixtures in Python, rather than importing the repository file directly into the runtime. That is sufficient to close the outstanding numerical-regression dependency at the algorithm/fixture level, but it is not a packaging/import-path test of the repository checkout.

## Feed / capability disposition

Nathan Words theorist feed: **NOT RELEVANT** — verification concerns an already-fixed numerical contract, not intended-object semantics or terminology drift.

Capability disposition: **INGESTED / verification** — closes the Run 086 execution dependency without extending the circumcircle example family.

## Status / next cursor

Typed Three-Spheres carrier reconstruction is now treated as a finished comparator component unless a later integration test exposes a concrete defect. Return `LAB-SBS-001` to the broader Whirligig/UI/Hagalaz side-by-side comparator. Preserve the existing complementary-channel classification until a genuinely homologous Hagalaz geometric-admissibility observable is recovered.

No Nathan action required.

# Run 084 — Arbitrary-triangle equal-S3 carrier margin

**Status:** SANDBOX / CLAIMED ANALYTIC GENERALIZATION + REINTERPRETATION OF RUN-082 CONTROL  
**Branch/task:** `LAB-SBS-001` / Meridian Three-Spheres comparator  
**Date:** 2026-09-21  
**Quarantine:** untouched; no PRIOR_ART/nLab/private quarantine ingress.

## Bounded operation

Executed Run 083's next cursor: replace the equilateral-only carrier formula with the exact common-carrier geometry for three arbitrary non-collinear equal-S3 centers in R4, then apply it to the already-recorded Run-082 upstream perturbation family.

## General geometry

Let three non-collinear centers be `c1,c2,c3 in R4`, and let all three S3 shells have common radius `R`. Define

`u = c2-c1`, `v = c3-c1`,

and the 2x2 Gram matrix

`K = [[u.u, u.v], [u.v, v.v]]`.

The point `o` in the affine center-triangle plane equidistant from all three centers is

`o = c1 + alpha u + beta v`,

where

`K [alpha,beta]^T = (1/2)[u.u, v.v]^T`.

This is the ordinary circumcenter of the center triangle, embedded in R4. Let

`r_c = ||o-c1||`.

Subtracting the three equal-radius shell equations shows that every common point `x` must lie in the affine 2-plane through `o` orthogonal to `span(u,v)`. Writing `x=o+w` with `w perpendicular u,v`, any shell equation reduces exactly to

`||w||^2 = R^2-r_c^2`.

Therefore, for arbitrary non-collinear center triangles:

- `r_c < R` -> regular common `S1` carrier of radius `rho = sqrt(R^2-r_c^2)`;
- `r_c = R` -> carrier collapses to one point;
- `r_c > R` -> no real common carrier.

The natural dimensionless signed margin is therefore

`G_carrier = 1 - r_c^2/R^2`.

This is translation invariant, O(4) invariant, and permutation invariant. Under a common scale change of both centers and R it is also scale invariant.

The equilateral Run-083 control is recovered immediately because `r_c=d/sqrt(3)`, giving `G=1-d^2/(3R^2)`.

## Important correction to Run 082's wording

Run 082 described its listed post-perturbation `rho` as only a geometric diagnostic and cautioned that non-equilateral pair distances meant it was not evidence that the equal-S3/common-carrier constraint remained satisfied "in the same symmetric sense." The symmetry caveat is true, but the carrier caveat is too strong.

For three **equal-radius** S3 shells, equilateral center geometry is not required for existence of a common S1 carrier. The circumcenter construction above is the exact carrier solution for every non-collinear center triangle with `r_c<R`. Thus Run 082's circumcenter-derived `rho` values are properly typed as exact carrier radii for the perturbed equal-S3 geometry, assuming the primitive shells remained equal radius R=1 as declared.

This does not restore equilateral symmetry; it separates two independent questions cleanly:

1. `E_spread`: how far the center triangle departs from equilateral symmetry;
2. `G_carrier`: whether/how robustly the three equal S3 shells still possess a common S1 carrier.

## Apply to Run 082 recorded perturbation family

Using Run 082's already-recorded circumcenter-derived `rho` values with `R=1`, `G_carrier=rho^2`:

| epsilon | E_spread | rho | G_carrier |
|---:|---:|---:|---:|
| 1e-6 | 4.08248e-7 | 0.816496699 | 0.6666668595 |
| 1e-5 | 4.08249e-6 | 0.816497759 | 0.6666685905 |
| 1e-4 | 4.08254e-5 | 0.816508364 | 0.6666859085 |
| 1e-3 | 4.08307e-4 | 0.816614220 | 0.6668587843 |
| 1e-2 | 4.08837e-3 | 0.817653938 | 0.6685579623 |
| 1e-1 | 4.14059e-2 | 0.826255298 | 0.6826978175 |

For this particular displacement family, symmetry breaking grows while the exact common-carrier margin also increases. So `E_spread>0` is not a carrier-failure signal; here the perturbation makes the carrier geometrically *less* close to collapse.

Near epsilon=0 the recorded values give approximately

`Delta G_carrier / epsilon -> 0.19245` (limited by the printed precision of Run 082's rho table),

while `E_spread/epsilon -> 1/sqrt(6) ~= 0.408248`.

These are separate first-order responses to the same primitive perturbation.

## Degenerate-center caveat

If `u,v` become linearly dependent, `K` is singular and the triangle circumcenter is not uniquely defined in its affine span. That is a different constraint stratum and must be handled separately; the formula above should not be numerically forced through a singular Gram solve.

## Provenance / feed / capability disposition

Direct dependencies: Run 083; Run 082's declared primitive perturbation and recorded circumcenter-derived rho values; recovered `SPHERE4QC.txt` equilateral standard control. The arbitrary-triangle step is standard Euclidean analytic geometry derived explicitly here, not a Nathan-intended ontology claim.

Nathan Words feed: **NOT RELEVANT** — no intended terminology, historical/current mapping, or object-meaning ambiguity is being resolved.

Capability gain: the comparator now has an exact non-equilateral carrier-existence/margin channel, removing the need for any averaged `d_eff` and correcting an overly restrictive interpretation of the Run-082 circumcenter radius.

## Durable boundary / next cursor

The two-channel Three-Spheres comparator is now mathematically well typed for arbitrary non-collinear equal-S3 center triples:

`S(D) = (E_spread(D), G_carrier(D))`.

Next high-information operation should test a perturbation direction that *decreases* `G_carrier` toward zero while separately monitoring `E_spread`, preferably with an analytically chosen one-parameter family that crosses the carrier-collapse boundary. This will exercise event detection away from the equilateral symmetry line and test the Gram/circumcenter implementation at a genuine non-equilateral collapse.

No Nathan action required.
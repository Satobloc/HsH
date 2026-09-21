# Mercer QA — Run 083 arbitrary-triangle carrier margin

**Date:** 2026-09-21  
**Branch/task:** `LAB-SBS-001` / Three-Spheres comparator  
**Operation:** independent analytic generalization of Meridian Run 083's equilateral carrier channel  
**Exposure:** cleared HsH only; no PRIOR_ART/private-quarantine ingress.

## Scope

Meridian Run 083 correctly warns not to replace a non-equilateral three-center configuration by an averaged `d_eff`. This pass derives the exact equal-radius common-carrier margin for arbitrary non-collinear three-center primitive data in Euclidean R^4.

This is geometry/control work only. No physical interpretation is assigned.

## Setup

Let three equal S^3 shells of radius `R` have centers `c1,c2,c3 in R^4`. Assume the centers are non-collinear and let their affine span be the 2-plane `P`.

A point `x` common to all three shells obeys

`|x-c1|^2 = |x-c2|^2 = |x-c3|^2 = R^2`.

Subtracting the first equation from the other two removes the quadratic term and gives two independent affine linear constraints. Their solution set is a 2-dimensional affine plane `N` orthogonal to the two-dimensional center-difference span.

Let `q` be the circumcenter of the center triangle in `P`, and let `r_c = |q-ci|` be its circumradius. Then `N = q + P^perp`.

Write `x=q+y`, with `y in P^perp`. Orthogonality gives

`|x-ci|^2 = |q-ci|^2 + |y|^2 = r_c^2 + |y|^2`.

Therefore the exact common intersection is controlled by

`|y|^2 = R^2 - r_c^2`.

Hence:

- `r_c < R`: regular common carrier is an S^1 of radius `rho = sqrt(R^2-r_c^2)`;
- `r_c = R`: carrier collapses to the single point `q`;
- `r_c > R`: no real common carrier.

The exact dimensionless signed carrier margin is therefore

`G_carrier = 1 - r_c^2/R^2`.

This is the non-equilateral generalization requested by Run 083. It uses the actual primitive center triangle and introduces no averaged effective separation.

## Pair-distance form

Let

`a=|c2-c3|`, `b=|c3-c1|`, `c=|c1-c2|`,

and let `A` be the area of the center triangle. For a nondegenerate triangle,

`r_c = abc/(4A)`.

Thus

`G_carrier = 1 - a^2 b^2 c^2/(16 A^2 R^2)`.

Using Heron's identity,

`16 A^2 = 2(a^2b^2+b^2c^2+c^2a^2) - (a^4+b^4+c^4)`,

so the carrier margin can be computed directly from the same three pair distances used by the spread channel, without reconstructing coordinates:

`G_carrier = 1 - a^2 b^2 c^2 / { R^2 [2(a^2b^2+b^2c^2+c^2a^2) - (a^4+b^4+c^4)] }`.

This formula is valid only when the center triangle is nondegenerate (`A>0`). Near collinearity the circumradius representation becomes ill-conditioned and the geometry should be handled explicitly rather than numerically trusted through the denominator.

## Equilateral recovery check

For `a=b=c=d`,

`16A^2 = 3d^4`, hence `r_c^2=d^2/3` and

`G_carrier = 1-d^2/(3R^2)`,

exactly recovering Run 083's symmetric channel and collapse point `d=sqrt(3)R`.

## Relation to the spread channel

`E_spread = std(a,b,c)/R` and `G_carrier` can be evaluated on the same primitive pair-distance triple, but they answer different questions:

- `E_spread` measures departure from equilateral side lengths;
- `G_carrier` measures existence/margin of the actual common S^1 carrier.

Neither determines the other. In particular, `E_spread=0` permits both healthy and collapsed equilateral carriers depending on scale, while nonzero spread does not by itself imply carrier loss.

For downstream optimization/event logic, preserve the sign semantics: `E_spread >= 0` is a defect magnitude with ideal value zero; `G_carrier > 0` is a viability margin, zero is collapse, and negative is no-real-carrier.

## QA status

**CLAIMED ANALYTIC CONTROL / INDEPENDENT DERIVATION.** The derivation is elementary Euclidean geometry and recovers Meridian's equilateral formula as a special case. This pass does not independently audit the historical provenance of `SPHERE4QC.txt`, nor does it promote any physical/model interpretation.

## Durable boundary / next cursor

The arbitrary-triangle formula requested by Run 083 is now available without `d_eff`. The next high-information operation is to apply `E_spread` and this exact `G_carrier` to the *same Run 082 perturbation family* and inspect their joint response, with a collinearity/area guard. That is a numerical/comparator pass, not another analytic residual-design pass.

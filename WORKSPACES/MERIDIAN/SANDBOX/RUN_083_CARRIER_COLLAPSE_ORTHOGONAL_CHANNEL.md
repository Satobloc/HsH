# Run 083 — Orthogonal carrier-collapse channel

**Status:** SANDBOX / CLAIMED ANALYTIC CONTROL  
**Branch/task:** `LAB-SBS-001` / Meridian Three-Spheres comparator  
**Date:** 2026-09-21  
**Quarantine:** untouched; no PRIOR_ART/private quarantine ingress.

## Bounded operation

Followed Run 082's explicit cursor to add a genuinely independent Three-Spheres carrier/closure channel rather than densifying the pair-distance-spread curve.

The recovered `SPHERE4QC.txt` standard input gives, for three equal S^3 shells of radius R whose centers form an equilateral triangle of side d in R^4,

- `rho(d) = sqrt(R^2 - d^2/3)` for the common S^1 carrier radius;
- `sigma_common = 2 sqrt(3) rho` for the collapsing Jacobian singular-value channel;
- `d_c = sqrt(3) R`;
- regular S^1 carrier for `d < d_c`, rank loss at `d=d_c`, and no real common carrier above criticality.

This is a standard Euclidean geometry / singular-value control, not a physical assignment.

## Key result: Run 082 had a deliberate but important blind direction

Run 082 used

`E_spread = std(d12,d23,d31)/R`

as an admissibility channel. That channel detects symmetry-breaking center perturbations, but it is identically zero for the fully symmetric continuation

`d12 = d23 = d31 = d`.

Therefore `E_spread=0` does **not** imply a healthy common carrier. Along symmetric expansion the system can move continuously from a regular S^1 carrier to exact carrier collapse while `E_spread` remains zero throughout.

The independent carrier channel is

`E_carrier = rho/R = sqrt(1 - d^2/(3R^2))`

or equivalently the dimensionless singular-value channel

`E_sigma = sigma_common/(2 sqrt(3) R) = rho/R`.

Thus the two Three-Spheres channels are orthogonal in a useful sense:

- pair-spread channel: detects departure from equilateral center geometry;
- carrier/singular-value channel: detects loss of the common S^1 carrier even under perfect equilateral symmetry.

Neither substitutes for the other.

## Critical scaling

Let `delta = d_c - d > 0`, with `d_c = sqrt(3)R`. Then

`rho^2 = R^2 - d^2/3`

and, inserting `d = sqrt(3)R - delta`,

`rho^2 = (2R/sqrt(3)) delta - delta^2/3`.

Hence near collapse,

`rho ~ sqrt((2R/sqrt(3)) delta)`

and

`sigma_common = 2 sqrt(3) rho ~ sqrt(8 sqrt(3) R delta)`.

So the carrier-radius / smallest-singular-value response has a square-root critical law, while its derivative with respect to d diverges as the collapse is approached. This is a qualitatively different response class from the linear small-epsilon symmetry-breaking spread measured in Run 082.

A numerically better-conditioned event variable near criticality is the squared channel

`G = (rho/R)^2 = 1 - d^2/(3R^2)`,

for which `G=0` marks collapse and `G<0` marks the no-real-carrier regime without taking a square root. Near criticality,

`G ~ 2 delta/(sqrt(3)R)`.

## Comparator consequence

The minimum Three-Spheres admissibility vector for the next shared-data benchmark should therefore contain at least

`S(D) = ( E_spread(D), G_carrier(D) )`

with the components kept semantically separate. A scalar norm may be reported only secondarily, because `E_spread` is a defect magnitude whose healthy value is zero, whereas `G_carrier` is a margin whose regular-domain value is positive and collapse value is zero.

For optimization/event detection it is cleaner to use a signed carrier margin

`M_carrier = 1 - d_eff^2/(3R^2)`

only when an equilateral/symmetric effective separation `d_eff` is well-defined. For non-equilateral primitive data, do not silently average pair distances into `d_eff`; compute the common-carrier geometry from the actual three centers (circumcenter-to-shell margin) or mark the symmetric formula inapplicable.

## Provenance / feed / capability disposition

Primary recovered control: `SPHERE4QC.txt`, equations `STD-GEO-S3X3-R4-0001` and `STD-GEO-S3X3-R4-COLLAPSE-0003`. The file explicitly types the ambient space as R^4, the shells as three equal S^3, the regular common carrier as S^1, and records the analytic collapse at `d=sqrt(3)R`.

Run 082 supplied the pair-distance-spread channel and explicitly requested an independent carrier/gate/closure channel next.

No Nathan Words packet was needed: this operation does not resolve intended terminology or historical-to-current object meaning; it uses the already recovered standard geometry control. Feed disposition: **NOT RELEVANT**.

Capability gain: the comparator now has an orthogonal channel that detects a failure mode invisible to Run 082's symmetry-breaking residual, plus an analytically controlled critical exponent and a well-conditioned squared event variable.

## Durable boundary / next cursor

Do **not** add another arbitrary residual. Next high-information operation: generalize the carrier-margin calculation from the equilateral formula to arbitrary three equal-S^3 centers in R^4 using the actual circumcenter of the center triangle, then apply the exact same upstream perturbation family from Run 082. This will place `E_spread` and carrier existence/margin on the same non-equilateral primitive dataset without introducing an averaged `d_eff`.

No Nathan action required.
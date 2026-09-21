# Run 085 — Typed carrier / numerical-status machine

**Status:** SANDBOX / CLAIMED NUMERICAL-CONTROL FORMALIZATION  
**Branch/task:** `LAB-SBS-001` / Meridian Three-Spheres comparator  
**Date:** 2026-09-21  
**Quarantine:** untouched; no PRIOR_ART/nLab/private quarantine ingress.

## Bounded operation

Implement the next safety layer implied by Run 084's degenerate-center caveat: separate **geometric carrier state** from **numerical solvability of the circumcenter reconstruction**, and adversarially test the distinction on a path that approaches collinearity.

This run deliberately does not infer SAT/H(s)H ontology. It is a solver-control result for the equal-radius three-S3 geometry already defined in Runs 083–084.

## Primitive reconstruction

For non-collinear centers `c1,c2,c3` with common shell radius `R`, set

`u = c2-c1`, `v = c3-c1`,

`K = [[u.u, u.v], [u.v, v.v]]`,

and solve

`K [alpha,beta]^T = (1/2)[u.u, v.v]^T`.

Then

`o = c1 + alpha u + beta v`,

`r_c = ||o-c1||`,

`G = 1 - (r_c/R)^2`.

Run 084 established the geometric interpretation when the center triangle is non-collinear:

- `G > 0`: real common S1 carrier;
- `G = 0`: point-collapse boundary;
- `G < 0`: no real common carrier.

The new point here is that this geometric classification is only reportable when the reconstruction itself is numerically certified.

## Two-axis typed state

Do not collapse geometry and numerics into one scalar status. Return a pair:

`STATE = (GEOMETRY, NUMERICS)`.

### GEOMETRY

Only assign when `NUMERICS=CERTIFIED`:

- `CARRIER_PRESENT` if `G > tau_G`;
- `CARRIER_COLLAPSE` only for a bracketed sign-changing `G=0` event with certified solves on the bracket/refinement path;
- `NO_REAL_CARRIER` if `G < -tau_G`;
- `GEOMETRIC_BOUNDARY_UNRESOLVED` if `|G| <= tau_G` without a certified bracket/event history.

### NUMERICS

Track at minimum:

- rank / smallest singular value of `K`;
- `kappa2(K)` (or the equivalent circumcenter linear system);
- solve residual/backward error;
- finite-value checks.

Classify:

- `CERTIFIED`: full rank and requested error budget is met;
- `DEGRADED`: full rank but conditioning/error amplification is high enough to threaten the requested `G` tolerance;
- `SINGULAR`: rank deficient / collinear center stratum;
- `FAILED`: non-finite or solver failure.

A fixed condition-number cutoff may be used as an engineering guardrail, but it is **not** a geometric threshold and must be reported as policy, not mathematics.

## Required precedence rule

If numerical certification is lost before a geometric event can be bracketed, return

`(GEOMETRY=UNRESOLVED, NUMERICS=DEGRADED|SINGULAR|FAILED)`.

Never reinterpret numerical failure as `CARRIER_COLLAPSE`.

Conversely, a certified `G=0` crossing remains a geometric collapse even if a separate center-degeneracy event occurs later on the same continuation path.

## Adversarial control A — carrier collapse before collinearity

Use `R=1` and the isosceles family

`A=(-1/2,0)`, `B=(1/2,0)`, `C=(0,h)`, `h>0`,

and decrease `h` from the equilateral value `sqrt(3)/2` toward zero.

The exact circumradius is

`r_c(h) = (h^2+1/4)/(2h)`.

The lower carrier-collapse event is

`h_c = 1 - sqrt(3)/2 = 0.1339745962155614`.

A direct floating-point reconstruction at this event gives, for the equivalent doubled circumcenter system `M=2[(B-A)^T;(C-A)^T]`:

- `G ~= 6.66e-16`;
- `r_c ~= 0.9999999999999997`;
- `kappa2(M) ~= 9.35723`;
- `det(M) ~= 0.535898`.

Thus the carrier collapses while the circumcenter solve is still comfortably regular. Collinearity occurs only later at `h=0`, where the reconstruction becomes singular. This is a clean counterexample to any rule equating carrier collapse with center-triangle degeneracy.

## Adversarial control B — conditioning guardrail can fire while a carrier exists

A numerical guardrail can also fire in a geometry that still has a real carrier. Let

`A=(-a/2,0)`, `B=(a/2,0)`, `C=(0,h)`, `R=1`,

with `a=0.001`, `h=1`.

Direct reconstruction gives approximately

- `G = 0.749999875`;
- `r_c = 0.500000125`;
- `kappa2(M) = 1000.00025`.

So an illustrative engineering policy `kappa_max=500` would correctly mark the reconstruction `DEGRADED/UNRESOLVED` even though the exact geometry has a generous carrier margin. That is not a contradiction: the numerical flag describes trust in the chosen reconstruction, not existence of the mathematical carrier.

For this same `a=0.001` family, the lower exact carrier-collapse height is

`h_c = 1 - sqrt(1-a^2/4) ~= 1.25000008e-7`,

where the linear system is extremely ill-conditioned (`kappa2(M) ~= 1.0e4`). A finite-precision implementation therefore needs certification logic; it must not claim a collapse merely because the solve becomes difficult near that event.

## Minimal status-machine pseudocode

```text
input centers c1,c2,c3, radius R, tolerance policy P
build K and rhs
compute singular values / rank diagnostics
if singular: return (UNRESOLVED, SINGULAR)
solve for circumcenter
compute backward error and condition-aware G uncertainty
if nonfinite/failed: return (UNRESOLVED, FAILED)
if uncertainty exceeds requested event tolerance:
    return (UNRESOLVED, DEGRADED)
compute G
if certified sign-changing bracket crosses zero:
    return (CARRIER_COLLAPSE, CERTIFIED)
if G > tau_G: return (CARRIER_PRESENT, CERTIFIED)
if G < -tau_G: return (NO_REAL_CARRIER, CERTIFIED)
return (GEOMETRIC_BOUNDARY_UNRESOLVED, CERTIFIED)
```

## What changed

Run 084 supplied an exact arbitrary-triangle carrier margin but only warned not to force the Gram solve through a singular center triangle. This run turns that caveat into an explicit typed interface and establishes both directions needed to prevent category errors:

1. a real carrier-collapse event can occur with a well-conditioned circumcenter solve;
2. a numerical conditioning guardrail can fire while the underlying geometry still has a real carrier.

Therefore `G`, rank/conditioning, and numerical error certification must remain distinct observables.

## Provenance / feed / capability disposition

Direct dependency: `RUN_084_ARBITRARY_TRIANGLE_CARRIER_MARGIN.md`. Numerical values above were independently recomputed from the primitive coordinates in this run. No external literature, PRIOR_ART, nLab, private quarantine, or physical-data comparison was used.

Nathan Words feed: **NOT RELEVANT** — no intended-object meaning, historical/current mapping, or terminology correction is at issue; this is numerical typing of an inherited geometric object.

Capability gain: the Three-Spheres carrier comparator now has an explicit failure-safe API contract rather than an untyped scalar event function.

## Durable boundary / next cursor

The carrier-margin branch has reached a useful implementation boundary. Next high-information operation should not add more one-parameter circumcircle examples. Either:

1. implement this typed status contract in the actual non-quarantined Three-Spheres solver/control code and regression-test it against the standard equilateral collapse plus the two adversarial controls above; or
2. if routing favors cross-training, return to the broader Whirligig/UI/Hagalaz comparator and use this typed carrier channel as one component rather than continuing local geometry elaboration.

No Nathan action required.
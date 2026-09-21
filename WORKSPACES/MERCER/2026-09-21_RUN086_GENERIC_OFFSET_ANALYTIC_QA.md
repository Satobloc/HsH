# Run 086 generic-offset carrier crossings — analytic QA

**Worker:** Mercer  
**Date:** 2026-09-21  
**Branch:** current three-sphere / common-carrier solver line  
**Bounded operation:** independently check the generic-offset continuation fixture reported for `A=(-1/2,0)`, `B=(1/2,0)`, `C=(0.17,h)`, `R=1`, and turn its two numerical crossings into a closed-form regression benchmark.  
**Status:** COMPLETE / durable boundary  
**Exposure:** no PRIOR_ART/private ingress; ordinary live-sandbox geometry only.

## Result

For the fixed base

- `A=(-1/2,0)`
- `B=(+1/2,0)`

any circumcenter of triangle `ABC` lies on the perpendicular bisector `x=0`. At carrier collapse the circumradius equals the shell radius `R=1`; because `A` and `B` are one unit apart, the two unit-radius circumcenters through the base endpoints are exactly

`O_± = (0, ±sqrt(3)/2)`.

The third center `C=(x,h)` is on the same unit circle precisely when

`x^2 + (h ∓ sqrt(3)/2)^2 = 1`.

Hence the positive-h carrier-collapse heights are obtained directly from

`h = ±sqrt(3)/2 ± sqrt(1-x^2)`.

For the Run-086 stress offset `x=0.17`, the two positive roots relevant to the continuation path are

`h_low = -sqrt(3)/2 + sqrt(1-0.17^2)`

`       = 0.1194186585549719`

and

`h_high = +sqrt(3)/2 + sqrt(1-0.17^2)`

`        = 1.851469466123843`.

An independent primitive-coordinate circumcenter calculation reproduces both crossings. At the lower crossing:

- `G_carrier = 0` to floating precision;
- `det(K) = 0.014260816011068935 > 0`;
- `cond(K) ≈ 148.1136603211577`.

At the upper crossing:

- `G_carrier ≈ 5.8e-15` (floating zero);
- `det(K) = 3.427939183988909 > 0`;
- `cond(K) ≈ 4.726581836130518`.

Thus both event locations are carrier-collapse events while the center triangle remains nonsingular. The same fixed-`x` path can therefore cross the carrier-existence boundary twice without crossing the center-singularity stratum.

## QA significance

This supplies an analytic oracle for the generic-offset numerical stress fixture. A continuation/event detector should not assume that a one-parameter path has only one `G_carrier=0` event, and it should not identify poor center conditioning with carrier loss. The lower root is especially useful because it combines a genuine carrier event with materially worse—but still finite—conditioning than the upper root.

The closed form also gives a compact family-level regression test: for any fixed `|x|<1` on this base geometry, candidate event heights can be generated from `±sqrt(3)/2 ± sqrt(1-x^2)` and then withheld from the numerical detector until after event localization.

## Scope

This is a geometry/solver QA result only. It does not establish a physical interpretation, empirical result, or theory validation.

## Next cursor

Use this analytic family as an after-the-fact oracle while testing a detector that receives only primitive center coordinates. Sweep several nonzero `x` values, require recovery of every positive event on the chosen continuation interval, and record `G_carrier`, `det(K)`, and `cond(K)` separately. A useful failure test is any implementation that returns only the first crossing or suppresses the lower crossing merely because conditioning is poorer there.

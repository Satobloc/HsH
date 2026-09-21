# Run 086 follow-up — generic offset carrier-event stress QA

**Worker bias:** Mercer archive / QA, cross-training into solver verification  
**Bounded operation:** stress the primitive-coordinate common-carrier detector away from the perpendicular-bisector family  
**Status:** COMPLETE / durable boundary  
**Quarantine:** no PRIOR_ART/private ingress

## Inherited cursor

Run 086 closed the one-dimensional symmetric/perpendicular-bisector continuation test and explicitly recommended the next solver bite: move the third center in two coordinates, reconstruct the circumcenter from primitive coordinates, and keep triangle conditioning separate from carrier margin so numerical geometry failure is not mistaken for carrier loss.

This pass does exactly that and nothing broader.

## Fixture

Equal shell radius `R=1` with center triangle

- `A=(-1/2,0)`
- `B=(+1/2,0)`
- `C=(0.17,h)`

The nonzero `x=0.17` displacement removes the perpendicular-bisector symmetry used by the preceding fixture. The continuation variable is `h`.

At every sample, solve the primitive circumcenter equations

`2 (p_i-p_0) · o = |p_i|^2-|p_0|^2`, `i=1,2`,

then compute

- `r_c = |o-p_0|`
- `G_carrier = 1-r_c^2`
- center Gram matrix `K=[p_1-p_0, p_2-p_0]^T[p_1-p_0, p_2-p_0]`
- `det(K)` and `cond(K)` as separate geometry-conditioning diagnostics.

No effective distance is used.

## Numerical result

This generic-offset family contains **two** carrier-existence crossings, not one.

| h | G_carrier | r_c | det(K) | cond(K) |
|---:|---:|---:|---:|---:|
| 0.100000 | -0.36408025 | 1.16793846 | 0.01000000 | 210.8342 |
| **0.119418658555** | **~0** | **1.00000000** | **0.0142608160** | **148.1137** |
| 0.200000 | +0.54501744 | 0.67452395 | 0.04000000 | 53.4019 |
| 0.900000 | +0.64296197 | 0.59752659 | 0.81000000 | 4.0528 |
| 1.800000 | +0.04677799 | 0.97633089 | 3.24000000 | 4.5668 |
| **1.851469466124** | **~0** | **1.00000000** | **3.4279391840** | **4.7266** |
| 2.000000 | -0.14250533 | 1.06888041 | 4.00000000 | 5.2315 |

The lower crossing is the more useful stress case. It occurs while the center triangle is substantially ill-conditioned (`cond(K)≈148`) but still nonsingular (`det(K)≈1.426e-2`). The upper crossing occurs in a well-conditioned regime (`cond(K)≈4.73`). In both cases carrier loss is therefore distinct from center-triangle singularity.

For comparison, driving the same family closer to collinearity gives:

| h | G_carrier | det(K) | cond(K) |
|---:|---:|---:|---:|
| 0.050 | -4.028596 | 0.0025 | 840.62 |
| 0.020 | -29.692806 | 0.0004 | 5249.18 |
| 0.010 | -121.352500 | 0.0001 | 20994.01 |

Thus `G_carrier<0` by itself must not be interpreted as numerical circumcenter failure. The conditioning channel can deteriorate by orders of magnitude while remaining a separately typed diagnostic.

## QA interpretation

1. The primitive-coordinate event function survives a genuine two-coordinate center displacement.
2. A generic offset exposes two existence-boundary crossings along one simple continuation family, so a solver should not assume monotonicity or a unique carrier event.
3. The lower event is a useful regression fixture because it tests event bracketing under appreciable—but not singular—center conditioning.
4. `G_carrier`, `det(K)`, and `cond(K)` should remain separate outputs. A conditioning threshold may guard numerical trust, but it must not replace the geometric carrier margin.
5. This is a numerical/geometric control result only; it does not establish a physical SAT/H(s)H claim.

## Durable handoff / next cursor

Use the offset family `C=(0.17,h)` as a regression fixture in the live detector. Require it to find both sign changes when scanning a sufficiently broad `h` interval and to report conditioning independently at each event. After that, the next meaningful stress test is a path in which more than one center moves, preferably with an explicit conditioning cutoff study to determine when the circumcenter solve loses numerical reliability before exact collinearity.

**Exposure:** no new external/prior-art exposure.  
**Public-site feeder:** not nominated; this is internal solver QA rather than a public-facing result.

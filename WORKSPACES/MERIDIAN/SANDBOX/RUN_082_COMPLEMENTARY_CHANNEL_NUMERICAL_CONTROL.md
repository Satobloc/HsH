# Run 082 — Complementary-channel primitive perturbation numerical control

**Status:** SANDBOX / CLAIMED NUMERICAL CONTROL  
**Branch/task:** `LAB-SBS-001` / Meridian Three-Spheres comparator  
**Date:** 2026-09-21  
**Quarantine:** untouched; no PRIOR_ART/nLab/private quarantine ingress.

## Bounded operation

Executed the Run-081 cursor on the narrowest analytically transparent shared primitive dataset: three equal unit S3 centers forming an equilateral triangle of side d=1 in an R4 material gauge, with centroid at the origin. The undeformed common carrier radius is therefore rho=sqrt(1-d^2/3)=sqrt(2/3)=0.8164965809.

Injected the upstream primitive displacement `c_2 -> c_2 + epsilon e_x` for epsilon = 1e-6,...,1e-1, regenerated all pairwise center data, and evaluated a Three-Spheres admissibility channel from the spread of the three pairwise center separations. In parallel, the candidate Hagalaz relative edges are understood to be regenerated from the same compatible absolute frames; by the Run-080/081 contract their loop-consistency residual remains at algebraic/numerical zero because no derived edge is independently corrupted.

This is deliberately a complementary-channel control, not an equivalent-residual comparison.

## Three-Spheres response

Dimensionless pair-distance-spread residual `E_S = std(d_12,d_23,d_31)/R`:

| epsilon | E_S | reconstructed carrier rho |
|---:|---:|---:|
| 1e-6 | 4.08248e-7 | 0.816496699 |
| 1e-5 | 4.08249e-6 | 0.816497759 |
| 1e-4 | 4.08254e-5 | 0.816508364 |
| 1e-3 | 4.08307e-4 | 0.816614220 |
| 1e-2 | 4.08837e-3 | 0.817653938 |
| 1e-1 | 4.14059e-2 | 0.826255298 |

For small epsilon the admissibility residual is linear, `E_S/epsilon -> 0.408248... = 1/sqrt(6)` for this chosen displacement direction and gauge. This coefficient is geometry-specific; the useful result is the clean first-order response and the separation from representation consistency.

## Interpretation

The control realizes the Run-080 prediction concretely:

`shared D_epsilon -> { H_consistency(D_epsilon) ~ 0, S_admissibility(D_epsilon) > 0 }`.

There is no contradiction. Regenerated pairwise relative transforms can remain mutually compatible while the primitive centers cease to satisfy the equal-separation Three-Spheres geometry. The two channels test different propositions.

The listed `rho` is the radius obtained from the circumcenter of the perturbed three-center plane and the unit-S3 radius. Once pair distances split, it is not evidence that the original equal-S3/common-carrier constraint remains satisfied in the same symmetric sense; it is retained only as a geometric diagnostic.

## Provenance / feed / capability disposition

Direct dependencies: Runs 080 and 081 plus the recovered Three-Spheres equal-S3/common-carrier formula recorded in the Meridian checkpoint. No Nathan Words packet was required because this run changes no intended object meaning or terminology. Feed disposition: **NOT RELEVANT**.

Capability gain: first actual upstream same-data numerical response curve under the corrected comparator contract. It demonstrates why representation-consistency and geometric-admissibility channels must remain separately typed.

## Durable boundary / next cursor

Do not spend another run merely densifying this curve. Next high-information operation should either (a) add a genuinely independent carrier/gate/closure admissibility channel from the recovered SPHERES2/3/4 implementation and test whether it has the same first-order sensitivity structure, or (b) cross-train to the heavy-toolkit comparator programme if current routing gives that higher priority. A source-grounded Hagalaz admissibility operator, if recovered later, may be added as a third channel without rewriting this control.

No Nathan action required.
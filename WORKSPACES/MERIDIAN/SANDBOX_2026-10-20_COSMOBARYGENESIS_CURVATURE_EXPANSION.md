# Meridian | Cosmobarygenesis curvature-expansion split | 2026-10-20

**Status:** SANDBOXED mathematical calculation; *user-designated cosmobarygenesis default expectation remains a working hypothesis*, not proven physics. Source: Nathan Direct in the Meridian successor conversation, 2026-10-20. BEDROCK ND-2026-10-20-01 applies. In this turn the three-repo Mersearch bridge was occupied by another worker; no Mersearch run was executed. Follow-up GitHub code searches for "cosmobarygenesis" found no indexed hits, not an absence proof.

## Exact constructive separation

Take the native Euclidean ambient R4 with metric (++++) and a trajectory label tau (not a fifth spacetime dimension nor necessarily physical proper time). Define the 4x4 antisymmetric two-plane generator

```text
J=[[0,-1,0,0],[1,0,0,0],[0,0,0,-1],[0,0,1,0]],
J^2=-I, trace(J)=0.
```

For V(X)=omega*J*X, the ambient expansion divergence is exactly zero, while the convective acceleration is a=(V.grad)V=-omega^2*X. Trajectories have fixed radius R, speed abs(omega)*R, and normal acceleration magnitude v^2/R. This **proves that nonzero kinematic curvature/normal acceleration does not require expansion**. The ambient R4 Riemann curvature is still zero. On the fixed S3 the equal-rate trajectories are great-circle geodesics with **zero intrinsic S3 tangential acceleration**; their normal ambient acceleration is not automatically gravitation.

Unequal-rate dual rotation:
```text
V=(-omega1*x2,omega1*x1,-omega2*x4,omega2*x3).
div V=0
a=(-omega1^2*x1,-omega1^2*x2,-omega2^2*x3,-omega2^2*x4).
x.a=-omega1^2*rho1^2-omega2^2*rho2^2, rho1^2=x1^2+x2^2, rho2^2=x3^2+x4^2.
|a_tangent_to_S3|=abs(omega1^2-omega2^2)*rho1*rho2/R.
```
The tangential acceleration is strictly nonzero for both rho1,rho2>0 and abs(omega1)!=abs(omega2), even though **expansion remains zero**. Rational rotation-rate ratios yield closed two-frequency toroidal windings in the S3 readout; these are kinematic trajectories, not established physically permissible SAT causal worldlines.

For independent uniform radial expansion H(tau) and isoclinic rotation omega(tau),
```text
V=(H*I+omega*J)*X
Theta_ambient4=div V=4H
Theta_surface3=3H (uniform S3 volume expansion)
a=[(Hdot+H^2-omega^2)*I+(omegadot+2H*omega)*J]*X.
```
Thus expansion and curvature-driven normal acceleration coexist, but neither logically requires the other. In particular, radial kinematic acceleration is inward whenever omega^2>Hdot+H^2. An induced SAT Lorentzian metric and proper acceleration must still be derived before calling the effect gravity. The S3 scalar curvature is 6/R^2 while ambient flat R4 curvature is zero.

A dimensionally valid comparison on Hubble scale is R_H=c/H0, epsilon_H(L)=L/R_H. The quantity c^2/R_H=c*H0 is **only** a candidate acceleration *scale* for a trajectory moving at c through curvature radius R_H; not a gravity law, correction coefficient or observational fit. At H0=70 km/s/Mpc (illustrative convention) cH0=6.80092832313e-10 m/s^2.

## Cosmobarygenesis falsification/closure gate

Nathan's default qualitative picture: the full global cosmic worldtube is internally twisting, stretching and self-recirculating; instantaneous 3D simultaneity surfaces display smaller gravity dents, heavier concentrated wells and possible black-hole throats; filaments encode persistent matter histories; extreme inward regimes may produce outward luminous energy and further particle histories. **None** of that causal/physical identification follows from the R4 kinematic identities alone.

For a regular smooth flow V, the trajectory map Phi_tau is a diffeomorphism (where defined). Images of material sets preserve connectivity and connected-component counts. Thus a genuinely new material component **cannot** arise solely from invertible twisting/stretching. The number of 3D slice intersections can change through a perfectly regular 4D geometry; this does not establish matter birth. If N(tau+T)=N(tau) on a fully periodic accounting cycle, then net count change is zero. Actual net baryogenesis further requires a baryon-number accounting law and a nonzero physical source term, not merely a new visible filament.

Further closure gates: physically admissible radial SAT temporal mapping, horizon criterion from induced/effective metric, valid local-to-global recirculation and causal orientation, energy/entropy transport, finite-core branching rule, baryon-number origin, and the small nonzero simultaneity/Hubble-radius metric-curvature correction. Do not restore a fundamental two-shell lambda or a Nambu-Goto force because of an attractive analogy.

## Reproducibility / checks

Executed SymPy identities and a NumPy finite-difference fixture in the current conversation, under `meridian_cosmobarygenesis_flow_check.py`: for H=0.01, omega=0.3, radius R=10, ambient theta4=0.04, S3 theta3=0.03, radial coefficient -0.0899, azimuthal coefficient 0.006, finite-difference acceleration residual 8.19e-9. All final assertions passed. One initial check compared equivalent symbolic expressions without simplifying; this was corrected. Scientific source classification remains TENTATIVE: mathematical existence theorem, **not** cosmobarygenesis proof.

**Next:** finite-core, SAT-foliated minimal triplet (linear; expanding no twist; expanding with unequal-rate twist), induced metric invariants and independent particle/baryon accounting. No automatic BEDROCK promotion of calculated physical claims.

Meridian (assistant-authored research).

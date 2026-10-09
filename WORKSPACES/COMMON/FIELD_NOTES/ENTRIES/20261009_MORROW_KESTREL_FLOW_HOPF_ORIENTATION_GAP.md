# Morrow/Kestrel — Flow-derived Hopf charge: orientation gap
**2026-10-09 · SANDBOXED · independent geometry, no physical claim.**

## Provenance actually read
- SAT archive: `2023 SPACETIME CHAT.txt` (62,536-character composite), March 28 2024 DIMENSIONAL GRAVITY section: Nathan's straight line / helix / moving-plane intersections. Later retrospective material in the composite is not dated 2024.
- SAT archive: `[[SAT26 TOOLBOX]]/THE SPHERES.txt`, opening 17,500 of 907,195 characters: Nathan's sphere-deformation/rotational intersection and handedness-transfer proposal. This is a later compilation, not proof of 2023–25 composition.
- HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md` (complete): one-sided support and contact threshold.
- HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md` (complete): local scalar contact inverse.
- Front-door/onboarding, reference desk, War Room declaration and HSH_RESOURCES index/toolkit/BOOt routing reviewed. PRIOR_ART not opened. Mersearch stable 1.0 guidance read; no corpus-wide search or Mersearch execution claimed.

## New LOCAL:MORROW-20261009 construction
Let `A_lambda=diag(lambda,1,1)` be a signed dimensionless spatial deformation, `v=A_lambda x`, `s=|v|²`. Define a *candidate* normalized four-dimensional flow texture:
`U_lambda(x)=((1-s),2v_1,2v_2,2v_3)/(1+s)` in `S³`.
A derived Hopf director is `n(x)=U i U^{-1}` (quaternion convention). It is not a new independent dynamical field, but the HsH identification of `U` is **unproved**.

Exact degree density:
`d_lambda(x)=4 det(A_lambda)/[pi² (1+|A_lambda x|²)³]`.
For `lambda != 0`, `U` compactifies `R³` to `S³`, and its degree is `D=sgn(lambda)`; with standard Hopf orientation, `Hopf(n)=D`.

The Euclidean **pullback** metric (not the HsH Lorentzian metric) is
`m_ij=4 (A_lambda^T A_lambda)_ij/(1+|A_lambda x|²)²`.
Thus `m(+lambda)=m(-lambda)` pointwise, while their global degrees are opposite. Local scalar contact data of the Run110/136 kind cannot by themselves identify this orientation; that statement applies to metric-only observables in this model, not arbitrary physical contact experiments.

For a finite ball of radius `R`, exact transverse integration yields:
`D_lambda(R)=(2 lambda/pi) int_{-R}^R [1/(1+lambda² x²)² - 1/(1+R²+(lambda²-1)x²)²] dx`.
At `R=10`, `D_1(R)=0.9983324741`, `D_0.1(R)=0.8149913147`, `D_0.03(R)=0.3589731693`; global degrees are all +1. This is **finite-window charge loss without global charge loss**. At `lambda=0`, compactification fails and degree is undefined, rather than zero.

## Reproducibility and attack
Python/SciPy solver checked 32 points: max unit-norm error 2.22e-16, pullback metric error 4.44e-16, Jacobian error 2.22e-16; isotropic finite-ball formula matched to 2.22e-16. Full solver, JSON, three code-rendered plots and derivation are attached in the task conversation's `morrow_kestrel_flow_hopf_packet.zip` (not repository assets).

**Failure condition:** If admissible HsH time flow must have a globally positive component `U^0>0`, its image is a contractible hemisphere of `S³`, hence degree zero. The example crosses `U^0=0`; HsH must determine whether that is allowed, sign-gauge equivalent, or forbidden. SO(4) rotations alone cannot create a nonzero degree from a trivial flow. If forbidden, abandon *flow-derived* Hopf stabilization and investigate a material-frame bundle instead. No particle interpretation or stability action is inferred.

**Next test:** Apply the same degree-density and compactification test to an actually derived HsH `u^A(x)`, preserving time-orientation rules and ᚼ operator constraints.
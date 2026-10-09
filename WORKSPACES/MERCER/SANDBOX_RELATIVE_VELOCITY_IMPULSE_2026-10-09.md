# Mercer sandbox | Relative-velocity impulse discriminator | 2026-10-09

**Status:** LOCAL MATHEMATICAL SANDBOX; no canonical SAT/H(s)H adoption; no claim of new standard-physics theorem. **Independent-first:** historical/project sources read before comparison with external resources. **Quarantine:** no PRIOR_ART access.

## Source provenance and exact coverage

- SAT historical: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Filament onto.txt`, opening 330 lines substantially read. Nathan's filament/time-surface distinction, speculative backpull/forwardpull and physical tension ideas motivate a carrier comparison; neither the quoted cosmological extrapolations nor the numerical claims are adopted.
- SAT historical: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H FIRST BUILD.txt`, opening 420 lines substantially read. Mixed Nathan/assistant synthesis; explicit cautions against tuning, and worldline→worldtube conversion. Mathematical claims in generated synthesis are not accepted as proof.
- HsH: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt`, opening 450 lines substantially read. Assistant-generated specification, especially the local angle-only interaction's inability to generate a long-range translation force.
- HsH: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/BOSONIC TIME AND TWO GRAVITIES.txt`, opening 360 lines substantially read; provenance is a mixed discussion, not independent proof.
- Common onboarding: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, required controls, symbol registry, Reference Desk. HSH_RESOURCES War Room declaration and its 41 linked routes overviewed, plus toolkit index, digestion, Tool Chest, resources index and preferences BOOT. Supporting-resource routes are not theory authority.

## Independent construction

Use a fixed Lorentzian retarded carrier for comparison, **assumed**, not derived from Euclidean 4D SAT. Two straight trajectories with parallel longitudinal laboratory velocities `u`, `v`, impact parameter `b>0`, and relative speed `w=|u-v|/(1-uv/c²)`. Work to leading order in coupling, neglect trajectory deflection during encounter. Let `C_s=g_1g_2/(4πK)` and `C_v=q_1q_2/(4πε₀)`, each with units energy×length; compare equal absolute static strengths `|C_s|=|C_v|=C`.

The source's retarded scalar field is `φ=C_source/[γ_v sqrt(b²+γ_v²(u-v)²t²)]` along the test trajectory, with `γ_v=(1-v²/c²)^(-1/2)`. A test scalar proper-time action `S_s=-∫(mc²+g_2φ)dτ` gives transverse force `F_x^s=C_s b/[γ_u(b²+γ_v²(u-v)²t²)^(3/2)]` (sign according to charge). A vector Lorentz force gives `F_x^v=C_v γ_v(1-uv/c²)b/[b²+γ_v²(u-v)²t²]^(3/2)`.

Integrate `∫dt b/(b²+A²t²)^(3/2)=2/(|A|b)`:

```math
|Δp_x^s|=2|C_s|/(γ_uγ_v|u-v|b),
|Δp_x^v|=2|C_v|(1-uv/c²)/(|u-v|b).
```

Therefore, after matching static strength,

```math
R(w):=|Δp_x^s/Δp_x^v|=1/[γ_uγ_v(1-uv/c²)]
     =sqrt(1-w²/c²)=1/γ_rel.
```

**Result:** worldline inclination does not alter the radial impulse exponent (both scale `b^-1` in the point-core Born encounter), but carrier tensor type and proper-time coupling change the velocity scaling. At `w=0.8c`, `R=0.6`; at `w=0.99c`, `R≈0.14106736`. These are pure dimensionless fixtures, not historical SAT constants.

## Finite core, exact extension

For a static uniform spherical source of radius `a` in its rest frame, the impulse for a straight flyby with `b<a` is multiplied, for **both** carriers, by

```math
H(b/a)=1-[1-(b/a)²]^(3/2),   0<b<a;
H(b/a)=1,                     b≥a.
```

Thus `R(w)` survives finite-core regularization exactly in this weak-scattering spherical fixture. At `b/a=1/2`, `H≈0.350480947`; for `b/a≪1`, `H≈3b²/(2a²)`. A non-spherical/chiral, deforming, or velocity-dependent source need not share this result.

For a linear signed two-carrier mixture with vector static fraction `η` and scalar fraction `1-η`, the normalized impulse is `I_mix/I_vector=η+(1-η)/γ_rel`. This is a **candidate constitutive discriminator**, not a measured gravity law.

## Numerical verification

Reproducible Python/SciPy fixture: seven distinct laboratory-velocity pairs including opposite-sign velocities; independent adaptive quadrature vs closed forms max relative error `4.44e-16`; retarded-root Liénard–Wiechert field evaluations vs boosted analytic fields max relative error `2.38e-14`; eight finite-core radial integrals vs analytic factor max absolute error `5.55e-16`. `c=1, C=1, a=1` in fixtures; no historical values targeted.

## Failure conditions and limits

1. `u=v` is not a flyby; infinite-time impulse integral diverges, so the isolated-encounter formula is inapplicable.
2. Strong deflection violates straight-line/Born approximation; radiation reaction and recoil are omitted.
3. Lorentzian retarded dynamics and scalar/vector actions are assumed standard physics. Neither the causal metric nor the source couplings have been derived from 4D Euclidean H(s)H worldtubes.
4. Different source signs, non-spherical cores, spin, nonlocal coupling or a rank-two tensor carrier can change the ratio.
5. This result is not a gravity derivation, novelty/priority claim, or confirmation of SAT.

**Next solver cursor:** replace the fixed source with two deformable finite cores and calculate the first correction to `R(w)` from induced carrier strain and core polarizability. The new mechanism must specify the worldtube-to-carrier source map; otherwise no unique H(s)H prediction follows.

**Namespace:** `LOCAL:MERCER-REL-SCATTER-20261009`; `u,v,w,b,a,C_s,C_v,R,H,η` are disposable local variables; `c,γ,ε₀` retain standard meanings. Historical symbols are not reassigned.

# Meridian sandbox | 2026-10-08 | Pressure SO(4) rank and inertia gate

**Status:** SANDBOXED, conditional geometry/mechanics, not theory authority. No historical constants fitted.

## Sources actually read
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT GEOMETRIC SOLVERS.txt`, complete (~5.4 kchar), blob `5429f7cb2adbfdc0abab7db46eff4ca4de08358a`. Historical solver taxonomy: UI scale/rotation, Whirligig constraints, provisional Spheres bifurcations. Source is a conversation/synthesis, not proof.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H STRUCTURAL SKETCH.txt`, opening ~28.4 kchar, blob `64906501d01db12171d3a2e58dc4fd0140d2784d`. Nathan's methodological instructions and tentative assistant reconstruction distinguished.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Math Extension.txt`, opening ~8.7 kchar, blob `aadf275de914f941298951d7d34205dd4e90dc33`. Read mathematical interoperability and Noether/continuum proposals; no imported physical claim.
- Read controlling front door, BEDROCK, symbol/workflow controls, Common Reference Desk, and October 5 HSH_RESOURCES packet routing (War Room declaration, tool chest, toolkit index, preference router, BigBook indexes). PRIOR_ART not accessed. Mersearch documentation/CLI checked; SQLite corpus index not mounted here. GitHub search used for path discovery only.

## Derived rank gate
For a homogeneous 4D ball of radius `a` under scalar plane pressure `p(X)=P cos(k·X+φ)`, the boundary traction integrates to

`F_i=P V4 [8 J₂(a|k|)/(a|k|)²] k sin(k·C_i+φ)`, with `V4=π²a⁴/2`.

For a rigid cluster with centered levers `r_i=C_i-Cbar`, the antisymmetric SO(4) torque matrix is `M=Σ_i(F_i r_iᵀ-r_i F_iᵀ)`. A single wave has `F_i=b_i k`, so `M=k Lᵀ-L kᵀ`, `L=Σ b_i r_i`. Therefore **rank(M)≤2, Pf(M)=0** for arbitrary centers under one common force direction. Here `Pf(M)=M01 M23−M02 M13+M03 M12`.

This does not imply rank-two angular acceleration for arbitrary inertia. For **three isotropic 4D balls** whose centers span at most an affine 2-plane, however, the normal 2-plane has degenerate second moment. At rest the angular acceleration `A` satisfies `S A+A S=M` with `S=Σ m_i[(a²/6)I4+r_i r_iᵀ]`. The normal-to-normal block vanishes, and the tangent-to-normal block has rank at most one. Hence `rank(A)≤2` and `Pf(A)=0`: a single plane wave cannot initiate two independent SO(4) rotation planes in this particular isotropic triplet model.

For two waves, `M=k₁∧L₁+k₂∧L₂`, and `Pf(M)=det[k₁,L₁,k₂,L₂]`. Two independent wave/lever planes can give rank four. Alternatively, splitting the *physical* normal-plane inertia degeneracy can yield rank-four angular acceleration even under a single rank-two torque.

## Reproducible numerical specimen
Three **nonoverlapping** homogeneous 4D balls, radius 0.35, centers `(0,0,0,0),(1,0,0,0),(0,1,0,0)`, unit masses, ideal massless rigid connectors, pressure amplitude `P=1/V4` (arbitrary units). Wave vectors `k₁=(1,0,1,0)/√2`, `k₂=(0,1,0,1)/√2`.

| Observable | One wave | Two waves |
|---|---:|---:|
| Pf(M) | 0 | -0.06891471768728182 |
| Pf(A) | 0 | -0.1346850994894006 |
| Canonical angular-acceleration rates | (0.38491155, ~0) | (0.40507018, 0.33249819) |

A single wave `k=(1,0,1,1)/√3` with imposed normal second-moment split `S₄₄ += 0.17` yields `Pf(A)=+0.004440187310560311` versus zero without the split. 300 random single-wave directions/phases gave `|Pf(A)|<6.7e-16`. 300 SO(4) covariance trials max residual `4.1e-15`. Analytic determinant identity, mirror parity and Sylvester residual tests passed.

## Status boundaries and next test
- The 4D pressure traction, torque-transmitting connectors, and rigid-body response are **assumptions**, not consequences of SAT.
- The one-wave **acceleration** gate requires normal-plane inertia degeneracy; anisotropic internal material can break it. One-wave torque itself always remains simple.
- Rank-four response is not persistent chirality, spin, or an interbraid force. Phase cancellations remain possible.
- **Next:** elastic connector/worldtube model, with one versus two waves; compare torque Pfaffian, acceleration Pfaffian, material strain, and transported frame holonomy after the forcing ceases.

**Candidate ᚼ grammar:** pressure direction + lever geometry → SO(4) torque bivector → physical inertia/constraint map → material frame evolution → intersection carrier dynamics. Pfaffian is a conditional geometric rank gate, not a fitted constant.

Local reproducible solver, numerical JSON, and three Class P figures accompany this run's thread checkpoint. No change to BEDROCK.

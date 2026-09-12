# Finite-Core Cross-Section Packet 001

Status: **frozen bounded result; carrier selection remains open**.

## Narrow question

What minimum cross-sectional state distinguishes a genuine finite normal core from a centerline with attached labels, while recovering the centerline as a declared limit?

## Source scope

- Current construction-lab control prompt: controlling.
- `synthesis/R4_FRAMED_CURVE_KINEMATICS.md`: full sequential read.
- `synthesis/FORMALISM_SELECTION.md`: full sequential read.
- `synthesis/CURRENT_SYNTHESIS.md`: targeted finite-core/readout read.
- `LIVE CONVOS/TEAM_SYNC_2026-09-07.md`: targeted finite-core handoff read.
- Google Drive: searched; no controlling H(s)H source located.
- Slack `#worldtube-lab`: full channel history; routing context only.

## Object and dimensional type

Let (gamma:I	omathbb R^4) be a regular arclength center-history, with rank-three normal space (N_sgamma=T(s)^perp). A finite core requires a positive-extent fiber (K_ssubset N_sgamma) and embedding

[
X(s,y)=gamma(s)+y,qquad yin K_s.
]

For moment-based readout the fiber also needs a measure (mu_s). Material transport is additional data; it is needed only when point identity or twist energy is asserted.

## Canonical cross-sectional data

Define centroid and covariance

[
c_s=M_s^{-1}int y,dmu_s,qquad
Q_s=M_s^{-1}int(y-c_s)(y-c_s)^T,dmu_s.
]

Recenter so (c_s=0), then remove scale:

[
S_s=rac{Q_s}{operatorname{tr}Q_s}-rac13I,qquad
I_2=operatorname{tr}(S_s^2),qquad I_3=det S_s.
]

Under normal-frame rotation (Rin SO(3)), (Smapsto R^TSR), so (I_2,I_3) are invariant. To separate radial bulk from boundary support add

[
chi=rac{mathbb E[|y|^4]}{mathbb E[|y|^2]^2}.
]

| Uniform fiber | eigenvalues of (S) | (I_2) | (I_3) | (chi) |
|---|---|---:|---:|---:|
| (B^3_arepsilon) bulk | ((0,0,0)) | 0 | 0 | (25/21) |
| (S^2_arepsilon) boundary | ((0,0,0)) | 0 | 0 | 1 |
| (B^2_arepsilon) support | ((1/6,1/6,-1/3)) | (1/6) | (-1/108) | (4/3) |
| (S^1_arepsilon) boundary | ((1/6,1/6,-1/3)) | (1/6) | (-1/108) | 1 |

Covariance alone therefore cannot distinguish (B^3) from (S^2), or (B^2) from (S^1). The fourth radial moment separates these canonical pairs. The tuple is a discriminator, not a complete shape invariant.

## Provisional ᚼ/ᚼᚼ state and perturbation

Represent coupled scale and normal rotation provisionally by (a(s)>0) and (U(s)in SO(3)). For a localized symmetric trace-free perturbation (A),

[
Q_s=a(s)^2U(s)left(q_0rac I3+eta f(s-s_0)Aight)U(s)^T.
]

This is bookkeeping, not a constitutive law. If (eta=0), (U) cancels: rotation of an isotropic full core is locally gauge. When (eta
e0), scale normalization removes (a), leaving (I_2=O(eta^2f^2)) and (I_3=O(eta^3f^3)).

For sheet normal (n_Sigma), let (hat n_N) be its normalized projection into the normal fiber. Then

[
zeta_Sigma=hat n_N^TS_shat n_N
]

is invariant under simultaneous frame change and records anisotropy relative to readout orientation.

## Transverse readout

At a crossing with (n_Sigmacdot T
e0), linearization gives

[
Delta s(y)=-rac{n_Sigmacdot y}{n_Sigmacdot T},qquad
L_Sigma(y)=y-Trac{n_Sigmacdot y}{n_Sigmacdot T}in TSigma.
]

The map is an isomorphism from the rank-three normal fiber to the sheet tangent space, with local volume factor

[
|det L_Sigma|=|n_Sigmacdot T|^{-1}.
]

Thus a full (B^3) core gives a three-dimensional sheet patch, while a rank-two (B^2) support and an (S^2) boundary each give a two-dimensional patch. Finite resolving thickness can raise apparent support dimension and is readout data, not automatically carrier data.

## Centerline limit

For (K_s^{(arepsilon)}=arepsilon K_s^{(1)}),

[
sup_{yin K_s^{(arepsilon)}}|X(s,y)-gamma(s)|	o0.
]

Every transverse patch has diameter (O(arepsilon)). Internal modes must be frozen or separately rescaled for this to recover the earlier worldline model.

## Candidate comparison and failure

- Full (B^3): canonical metric thickening; isotropic local rotation is gauge.
- Rank-two (B^2): its plane normal makes two orientational degrees geometric; in-plane rotation remains gauge without marking or anisotropy.
- Boundary-only (S^2): second-moment-degenerate with (B^3), but separated by support dimension or (chi).
- Layered object: a (B^3) bulk may coexist with anisotropic boundary/support fields on which observable rotation resides.

Failure condition: observable local rotation assigned to an isotropic (B^3) core without anisotropy, material/boundary marking, an external relational direction, or global return map is normal-frame gauge. The linear readout also fails at tangency (n_Sigmacdot T=0), where higher-order intersection geometry is required.

## Conditional prediction packet

No particle observable is earned because the carrier family remains open. A thin transverse resolving sheet does force a rival-family contrast:

[
dim R_Sigma(B^3)=3,qquad
dim R_Sigma(B^2)=2,qquad
dim R_Sigma(S^2)=2,
]

and, for a full core,

[
V_Sigma=rac{V_{B^3}}{|n_Sigmacdot T|}+O(arepsilon^4kappa).
]

Falsification: a coordinate-independent thin-sheet calculation for the declared carrier produces a different generic support dimension or no secant factor.

## Narrow paper skeleton update

Working class: **Finite-core object hierarchy and readout non-equivalence**.

1. Typed fibers in the rank-three normal bundle.
2. Gauge quotient and canonical moments.
3. Minimal perturbation making rotation observable.
4. Thin and finite-thickness resolving maps.
5. Centerline limit.
6. Candidate-separating readouts and failure cases.

## Exact handoff

Ravel: test (L_Sigma), ((I_2,I_3,chi)), and the gauge-null result for an isotropic (B^3) core against the current particle-scale candidate. Return the first place the construction requires a rank-two support plane, boundary field, or material director rather than a bare isotropic full tube.

# Playground 005 — Fourier selection rule for periodic Sim⁺(4) translation

**Lane:** Nadir Voss  
**Status:** PLAYGROUND / SANDBOX — source-grounded reconstruction, not an authentic historical-worker check-in and not theory authority  
**Date:** 2026-10-12  
**Namespace:** `LOCAL:NADIR-FOURIER`

## 0. Result

The previous Nadir reconstruction showed that a periodic dilation can satisfy both endpoint conditions (Q(L)=I) and (ho(L)=1) while leaving the affine translation (t(L)) nonzero. The exact discriminator is not endpoint dilation closure and not the Fourier content of (q=(\log\rho)') by itself. It is the Fourier content of the **positive accumulated dilation factor** (ho(s)) at the two SO(4) rotation windings.

For a closed constant double rotation with integer windings (m_1,m_2),

[
t_j(L)=L,widehat{ho}_{-m_j},v_j
]

after identifying each oriented rotation plane with (mathbb C). Thus full affine closure requires the resonant coefficient to vanish on every plane carrying body translation.

## 1. Source boundary

### Recovered internal source facts — `SRC/ACTIVE`

- `PLAYGROUND_003_CARTAN_SIM4_BACKBONE.md` introduces the sandbox (Sim^+(4)) decomposition into translation, SO(4) rotation and dilation.
- `PLAYGROUND_004_30SEP_RECOVERY_COLLISION.md` corrects provenance: oriented-similarity Hagalaz and a linear closure residual predated Playground 002/003. It proves automatic affine closure only for a **constant**, zero-dilation, invertible double-rotation generator.
- `REVIVAL_ROTATION_RECEIPTS/2026-10-12T0048Z_s4_nadir_voss.md` records the first periodic-dilation counterexample and names the general Fourier selection rule as the next cursor.

These files are project sources and sandbox continuity, not evidence that the following derivation is established physics.

### Standard mathematics — `STD/DERIVED`

Fourier coefficients on an (L)-periodic scalar function and the complex representation of a planar rotation are standard analysis/linear algebra.

### New result in this artifact — `GEN/CANDIDATE`

The plane-wise Fourier selection rule, its two-plane test fixture, and its proposed use as an affine-closure solver discriminator are new sandbox deductions in this reconstructed turn.

## 2. Definitions and convention

Use the right-body convention

[
G'(s)=G(s)A(s),qquad
A(s)=
egin{pmatrix}
q(s)I+Omega & v\\
0&0
end{pmatrix},
]

with (vinmathbb R^4) constant and

[
Omega=omega_1J_{12}+omega_2J_{34}.
]

Write the linear part as (ho(s)Q(s)), where

[
Q(s)=e^{sOmega},qquad
ho(s)=exp!left(int_0^s q(u),duight).
]

Then

[
t'(s)=ho(s)Q(s)v,qquad
t(L)=int_0^Lho(s)e^{sOmega}v,ds.
]

Assume

[
omega_j=m_jarpi,qquad
arpi=rac{2pi}{L},qquad m_jinmathbb Z,
]

and (int_0^Lq(s),ds=0). Therefore (Q(L)=I), (ho(L)=1), and (ho(s)) is (L)-periodic.

Define

[
widehat{ho}_n=rac1Lint_0^Lho(s)e^{-inarpi s},ds.
]

For plane (j), identify (v_{2j-1}+iv_{2j}) with (v_j^{mathbb C}). Direct substitution gives

[
t_j^{mathbb C}(L)
=left[int_0^Lho(s)e^{im_jarpi s},dsight]v_j^{mathbb C}
=Lwidehat{ho}_{-m_j}v_j^{mathbb C}.
]

Hence, for a specified constant (v),

[
t(L)=0
quadLongleftrightarrowquad
widehat{ho}_{-m_j}v_j^{mathbb C}=0
quad	ext{for }j=1,2.
]

For closure for **every** constant body translation (v), the stronger condition is

[
widehat{ho}_{-m_1}=widehat{ho}_{-m_2}=0.
]

This is a selection rule, not a quantization claim.

## 3. Deterministic fixture

Set (L=2pi), ((m_1,m_2)=(1,2)), and

[
q(s)=epsilon kcos(ks),qquad
ho(s)=e^{epsilonsin(ks)},qquad epsilon=0.4.
]

Because (ho) contains only harmonics that are integer multiples of (k):

| Case | (k) | nonzero component of (v) | selected winding | predicted (t(L)) | numerical result |
|---|---:|---|---:|---|---|
| hit plane 12 | 1 | (v_1=1) | 1 | ((0,2pi I_1(0.4),0,0)) | ((1.24\times10^{-14},1.281937913896652,0,0)) |
| miss plane 12 | 2 | (v_1=1) | 1 | (0) | norm (3.20\times10^{-14}) |
| hit plane 34 | 2 | (v_3=1) | 2 | ((0,0,0,2pi I_1(0.4))) | ((0,0,1.14\times10^{-14},1.281937913896666)) |
| miss both | 3 | (v_1=v_3=1) | 1,2 | (0) | norm (2.52\times10^{-14}) |

The 200,001-point trapezoid fixture agrees with the modified-Bessel prediction to less than (4\times10^{-14}) in every case. Reproducible probe: `WORKSPACES/NADIR_VOSS/sim4_fourier_translation_probe.py`.

## 4. Mechanism and discriminator

Endpoint tests see only (Q(L)) and (ho(L)); they cannot detect resonant affine drift accumulated during the cycle. The smallest solver improvement is therefore:

1. test linear closure (Q(L)=I), (ho(L)=1);
2. resolve the body-translation support by rotation plane;
3. compute (widehat{ho}_{-m_j}) only for occupied planes;
4. reject full affine closure if any (widehat{ho}_{-m_j}v_j^{mathbb C}
eq0).

This also sharpens the previous (k=2) “cancellation” example: it cancels translation in the (m_1=1) plane but is resonant in the (m_2=2) plane. Cancellation was support-dependent, not a property of the full double rotation.

## 5. Failure boundary

The rule fails as written if any of the following changes:

- (Omega) varies with (s) or does not commute with itself at different parameters;
- (v) is not constant in the chosen body frame;
- dilation is matrix-valued rather than scalar;
- the generator convention is changed without translating the group law;
- (Q(L)
eq I) or the rotation rates are not integer windings over (L).

Then the relevant object is a path-ordered transport integral, not a single scalar Fourier coefficient. A pseudoinverse must not be inserted to hide this boundary.

## 6. Tight next test

Replace constant (v) by an (L)-periodic body translation with Fourier coefficients (widehat v_n). The predicted convolution rule is

[
t_j^{mathbb C}(L)
=Lsum_nwidehat{ho}_{-m_j-n}widehat v_n.
]

A decisive solver test is to compare this convolution against direct path integration for a two-harmonic (v(s)), then repeat with a noncommuting (Omega(s)) to locate exactly where scalar spectral selection gives way to Magnus/path-ordering corrections.

No particle label, historical constant, or physical identification is used.

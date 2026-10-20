# Mercer s3 — cross-term throat determinant gate

Status: GEN/DERIVED mathematical sandbox; not authenticated historical Mercer participation, BEDROCK, or established physics.

## Controls and sources

Live BEDROCK was read completely (Git blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`, 46,072 fetched characters); subordinate STATE_OF_THE_THEORY was read completely (blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 11,012 characters). BR-000..007, OC-001/002, and ND-2026-10-18-03/05/06/07 control. Mersearch's shared request remains occupied and was not overwritten; no Mersearch result is claimed.

The preceding Enheduanna packet is PUBLISHED_VERIFIED at commit `d84c47e7af875e4b2c8a46ab261cc2e605c472fe`, exact SHA-256 `a25c679718ba0fad42f104a2626c7757045382776e1e526e364bbc5c3ee224dc`.

Historical source retained: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/THEORY REFINEMENT SUMMARY.txt`, complete source, blob `139a0a972c0900585aac8a83358683d67b6bf967`, commit/date previously verified as `a6b7f7c25bd9fcd9777c6010282d513f3e2b2bc5`, 2026-05-31T21:02:49Z. Its radial construction is preserved, not declared superseded.

Executed random reading with `random.Random(223)` selected `FOUNDATIONAL.txt`; complete 7,897 fetched characters, blob `5bfe1550ff781109d427fe542563adaa4852851a`. Date is unresolved. Takeaway: it explicitly distinguishes heuristic logical coherence from independently verified numerical derivation and warns against judgments made without corpus coverage. That supports this packet's narrow structural status.

## Calculation

For a smooth throat `a(rho)=sqrt(r0^2+rho^2)`, start with
[
ds^2=-da^2+a^2d\chi^2.
]
Attempt to generate a cross term by a coordinate shift
[
\chi=\psi+F(\rho),qquad da=a'd\rho.
]
The radial-angular block is
[
G_F=\begin{pmatrix}
-a'^2+a^2F'^2&a^2F'\\
a^2F'&a^2
\end{pmatrix}.
]
Its determinant is exactly
[
\det G_F=(-a'^2+a^2F'^2)a^2-(a^2F')^2=-a^2a'^2.
]
Thus every coordinate-generated cross term cancels. At the throat `a'(0)=0`, so `det G_F(0)=0` for every finite `F'`.

If instead one inserts an independent coefficient
[
G_B=\begin{pmatrix}-a'^2&B\\B&a^2\end{pmatrix},
qquad
\det G_B=-a^2a'^2-B^2,
]
then `det G_B(0)=-B(0)^2<0` when `B(0)!=0`. This algebraically restores a Lorentzian 2x2 block, but B is new metric data, not a coordinate transform. Moreover an SO(4)-invariant nonzero one-form on S3 does not exist, so a radial-angular cross term selects angular structure and breaks full spherical isotropy. An independent lapse is the isotropic alternative, likewise new metric data.

Dimensions: `[a]=[rho]=L`, angles dimensionless, `[F']=L^-1`, `[B]=L` when coordinate components are `(rho,psi)`, and the block determinant has `L^2`.

## Executed fixture

`r0=0.25 m`, independent displayed `B0=0.4 m`. Four coordinate shifts `F'=(0,0.5,2,-3) m^-1` were checked on 4,001 rho points.

```
max determinant identity error = 5.729e-14 m^2
coordinate-shift det at throat = 0
independent-cross det at throat = -0.16 m^2
independent-cross eigenvalues = -0.369968846143, 0.432468846143
coordinate cross term repair = FAIL
independent cross term repair = ALGEBRAIC PASS; NEW METRIC DOF
assertions = 4/4 PASS
```

Python SHA-256: `15e6c13f3fd4dd2d035f6a0a5963d9ae0682a02a73e8bdd141412afd6ec3c559`.
Lean SHA-256: `d596367f6bc69436461278f59788916d05b1607937d83769bf52fe6c48c214b9`; Lean unavailable, so uncompiled.
Plot SHA-256: `d3a2ed8b46531e0ca74d2f807131db1d6742842df88c0837c37c1f86f4ea4dd9`.

## Disposition

Coordinate mixing cannot evade the smooth-throat pullback obstruction. A nonzero independent cross term can repair the determinant only by adding metric structure and, in the radial-angular form, breaking full spherical isotropy. Physical ER identity is not inferred. CODATA verification is ineligible because no independent observable is predicted. BEDROCK is unchanged.

Ravel handoff: derive the most general SO(4)-symmetric Lorentzian throat metric and state exactly which free lapse/shift functions are inherited versus newly postulated.

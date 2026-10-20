# Aster s3 — SO(4)-symmetric throat lapse gate

Status: GEN/DERIVED sandbox; source-grounded reconstruction, not authenticated historical Aster participation, BEDROCK, or established physics.

Live BEDROCK read completely: blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`, 46,072 fetched characters. Subordinate STATE_OF_THE_THEORY: blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 11,012 characters. BR-000..007, OC-001/002 and ND-2026-10-18-03/05/06/07 control. Shared Mersearch request remains occupied and untouched; no Mersearch result is claimed.

Mercer's preceding packet is PUBLISHED_VERIFIED at commit `4356b3827fd62e625f4da37958f8210156cf14c6`, SHA-256 `77abb1173eb67cfc260afbf2344f1a7f40259efa9f604c73f219bdb86ca437e3`.

Historical radial source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/THEORY REFINEMENT SUMMARY.txt`, blob `139a0a972c0900585aac8a83358683d67b6bf967`, commit `a6b7f7c25bd9fcd9777c6010282d513f3e2b2bc5`, 2026-05-31T21:02:49Z, SHA-256 `293d3c89fe2d4a21b8a52b8dafcd4f4dd57b3111ed784d65d263d079bd87246a`.

Executed random draw `random.Random(224)` selected `ORDERS.txt`, read completely: 5,054 fetched characters, blob `1f9cec2b7468a87e689239d7b0d00f8e8ad825a5`; original date unresolved. It explicitly distinguishes fundamental quark count from coarse-grained higher-order braid count and openly leaves hydrogen/deuterium alternatives unresolved. This supports preserving OC-001 and not importing Q into the throat calculation.

Full SO(4) symmetry forbids a nonzero invariant angular one-form, so the cohomogeneity-one metric is
[
ds^2=-N(\rho)^2d\rho^2+a(\rho)^2d\Omega_3^2.
]
For `a=sqrt(r0^2+rho^2)`, define `N_eps=sqrt(a'^2+eps^2)`. Every `eps>0` is nondegenerate; `eps=0` is the exact radial pullback and degenerates at the throat.

Using proper radial coordinate `ds=N d rho`,
[
R=6\left[{1+\dot a^2\over a^2}+{\ddot a\over a}\right],quad
K=12\left[({\ddot a\over a})^2+({1+\dot a^2\over a^2})^2\right].
]
At the throat,
[
R(0)={6\over r_0^2}(1+\epsilon^{-2}),qquad
K(0)={12\over r_0^4}(1+\epsilon^{-4}).
]
Thus the regular family has no finite-curvature limit as `eps->0`; the pullback is not a removable coordinate singularity.

Fixture `r0=.25 m`:
```
eps=1.00 N(0)=1.00 R=192       K=6144
eps=0.50 N(0)=0.50 R=480       K=52224
eps=0.25 N(0)=0.25 R=1632      K=789504
eps=0.10 N(0)=0.10 R=9696      K=30723072
assertions = 5/5 PASS
```

Dimensions: `[rho]=[a]=L`, `[N]=[eps]=1`, `[R]=L^-2`, `[K]=L^-4`. Extrinsic curvature vanishes at the symmetric throat because `a'(0)=0`.

Python SHA-256 `01834e3be9e416be3dc42eac4e204dffa39854dc155332d8d09e2a49f3bb3deb`. Lean SHA-256 `b4758349007a9261a68678716bf9d546d7c2a66ec72abeff169a602aefecaac7`; Lean unavailable, uncompiled. Plot SHA-256 `8643db7f98111cff82af9c92e9f121b29cc6023521a732c15d62e099ed3fffc2`.

Verdict: an SO(4)-symmetric smooth throat requires independent positive lapse data. The exact radial Householder pullback is recovered only as a degenerate, curvature-divergent limit. No physical ER identity or CODATA-eligible prediction follows; BEDROCK unchanged.

Ariadne handoff: test whether the required lapse can be derived from an existing finite-core/Kerr-shell construction rather than inserted freely.

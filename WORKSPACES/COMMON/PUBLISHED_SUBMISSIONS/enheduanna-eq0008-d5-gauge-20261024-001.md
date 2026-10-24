# EQ-0008 — D5 gauge-curvature-via-linking audit

**Worker:** Enheduanna  
**Status:** DIMENSIONAL REPAIR PASS / NON-ABELIAN FACTORIZATION FAIL / GAUGE-GROUP EMERGENCE UNPROVED / NOT AN H(s)H CANDIDATE / CODATA GATE CLOSED

## Historical source

- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- Primary path: `SAT O Derivations/CODE-LOCKED DERIVS.txt`
- Locator: D5 lines 222–275
- Blob: `783b05d39d59bf854b92090e15d205e6823b51c8`
- File commit/date: `d3f5fa0223f66a2d2b74c2beca7c6b262b616bdc`, `2025-10-27T01:15:21Z`
- Standalone duplicate: `SAT O Derivations/SAT_D5_GAUGE_TOPOLOGY.txt`, complete 55 lines / 2,231 characters, blob `a29ad0141b8c1283f6d4dee43b7cc57209afbee7`, retrieved at commit `8d49183464ad8fb2411d5b8e13c6408eecd39e18` dated `2026-10-23T14:18:13Z`.

Verbatim historical mathematics:

```tex
A_\mu^{(G)}(x)=g_G J_\mu^{(G)}(x)
```

```tex
g_G\sim\frac{1}{\sqrt{\rho_G\ell_f^2}},\qquad \ell_f=(2A/T)^{1/3}
```

```tex
F_{\mu\nu}^{(G)}=\partial_\mu A_\nu^{(G)}-\partial_\nu A_\mu^{(G)}
+[A_\mu^{(G)},A_\nu^{(G)}],\qquad F_{\mu\nu}^{(G)}=g_GK_{\mu\nu}^{(G)}.
```

The source explicitly calls `rho_wind`, `rho_link`, and `rho_triplet` frequencies **per unit volume**.

## Definite dimensional correction

If `[rho_G]=L^-3` and `[ell_f]=L`, then `[rho_G ell_f^2]=L^-1` and the printed coupling has dimension `L^(1/2)`. A four-dimensional Yang–Mills coupling is dimensionless. The unique monomial repair retaining the stated square-root form and one density factor is

```tex
g_G\sim(\rho_G\ell_f^3)^{-1/2}.
```

This repairs dimensions only. It does not derive a gauge coupling, and D3/EQ-0006 already showed that the archive formula for `ell_f` is not a length under ordinary tension plus standard bending-rigidity typing.

## Non-Abelian algebra failure

Substitution of `A=gJ` into the displayed curvature gives

```tex
F=g\,dJ+g^2[J,J].
```

Therefore `F=gK` cannot simultaneously hold with a coupling-independent `K=dJ+[J,J]` outside the Abelian sector or special values `g=0,1`. One may define `K=dJ+g[J,J]`, but then `K` depends on the coupling and is not the independently topological two-form asserted by D5.

For constant `J_1=T_1`, `J_2=T_2` in an anti-Hermitian `su(2)` basis, `[T_1,T_2]=T_3`:

```tex
F_{12}=g^2T_3,\qquad (gK)_{12}=gT_3.
```

At `g=0.3`, the matrix-norm residual is `0.1484924240492`.

## Topology and gauge covariance

Permutation/exchange classes do not by themselves define `SU(2)` or `SU(3)` connections, transition functions, principal bundles, continuous Lie generators, or structure constants. In particular, `|S_2|=2` while `dim su(2)=3`, and `|S_3|=6` while `dim su(3)=8`; this mismatch is not itself a no-go theorem, but it proves that the identification is not supplied merely by counting exchanges. Also, a current `J_mu` does not transform as a gauge connection unless an inhomogeneous connection transformation law is constructed.

## Executed numerical result

```text
rho=2.500000000000000e+18 m^-3
ell=2.000000000000000e-06 m
archive g=(rho ell^2)^(-1/2)=3.162277660168379e-04 m^(1/2)
corrected g=(rho ell^3)^(-1/2)=2.236067977499790e-01 dimensionless
archive numerical ratio cm/m=10.000000000000002
corrected numerical ratio cm/m=1.000000000000000
su2 basis residual ||[T1,T2]-T3||=0.000e+00
g=1.00; ||F_exact||=7.071067811865e-01; ||gK||=7.071067811865e-01; residual=0.000000000000e+00
g=0.30; ||F_exact||=6.363961030679e-02; ||gK||=2.121320343560e-01; residual=1.484924240492e-01
g=0.10; ||F_exact||=7.071067811865e-03; ||gK||=7.071067811865e-02; residual=6.363961030679e-02
g=0.01; ||F_exact||=7.071067811865e-05; ||gK||=7.071067811865e-03; residual=7.000357133747e-03
|S2|=2; dim su(2)=3
|S3|=6; dim su(3)=8
rho=1.0e+12 m^-3 -> g_corrected=3.535533905933e+02
rho=1.0e+18 m^-3 -> g_corrected=3.535533905933e-01
rho=1.0e+24 m^-3 -> g_corrected=3.535533905933e-04
ALL ASSERTIONS PASS
```

The metre-to-centimetre unit change alters the archive formula's numerical value by a factor of ten; the corrected dimensionless combination is invariant. The weak-coupling limit also exposes the non-Abelian factorization failure: exact commutator curvature is `O(g^2)`, while the asserted `gK` is `O(g)` if `K` is coupling-independent.

## Current-status translation

`WORKSPACES/MERIDIAN/RUN_046_2026-09-18.md`, complete 90 lines / 7,783 characters, blob `a312d656942a915f5ca8adefaaf5da08e6299285`, explicitly classifies the topology-derived gauge-coupling bundle as mandatory historical vocabulary rather than current doctrine. No established later correction of D5 was found. The historical formula is retained, not erased or silently promoted.

## Reading round

- `BEDROCK.md`: complete, 548 lines / 82,842 characters; blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`.
- `STATE_OF_THE_THEORY.md`: complete, 155 lines / 11,012 characters; blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Random draw from 1,053 eligible substantial HsH text files: index 591, `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_1/frosch-loch.txt`, complete 2,038 lines / 121,805 characters; blob `6077ef831a37f9dda6db9f24c03cf7fe29cc191b`. Honest takeaway: this is a creative-development record about the Froschloch song, album sequencing, exposed mistakes, and “Gluteny”; it contributes nothing to D5's gauge derivation. Its value here is enforcing a genuinely unrestricted archive reading rather than selecting only theory-confirming material.

## Gate

CODATA comparison is inadmissible. D5 supplies no operational density measurement, uncertainty, renormalization scale, derived gauge bundle, independently predicted coupling, or held-out observable. The numerical values above are declared diagnostic inputs, not fits or predictions.

Exact reopening discriminator: define a finite-core configuration space and measure; construct a principal `U(1)`, `SU(2)`, or `SU(3)` bundle and connection from it; prove the connection transformation law and Bianchi identity; type `rho_G` and `ell_f`; derive running with scale; and predict at least one held-out dimensionless coupling with propagated uncertainty before consulting its measured value.

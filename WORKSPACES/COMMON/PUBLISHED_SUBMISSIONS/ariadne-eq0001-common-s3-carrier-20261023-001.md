# Ariadne CODE 000 packet: EQ-0001 common carrier of three equal 3-spheres

Date: 2026-10-23. Worker: **Ariadne**; next: **Alberr**. Status: **INTERNALLY CHECKED / LEAN CI QUEUED / NOT AN H(s)H CANDIDATE**. This is relay-represented work, not authenticated historical Ariadne participation, not BEDROCK, and not established physics.

## Result

For three equal Euclidean 3-spheres in `R^4`, with radius `R>0` and centers forming a nondegenerate equilateral triangle of side `d`, the regular common intersection is a circle of radius

\[
\rho^2=R^2-\frac{d^2}{3}
\]

only in the open range

\[
0<d<\sqrt3R.
\]

The radius identity is correct. The definite clarification is topological: at `d=0` the three constraints coincide and the intersection is `S^3`, not `S^1`; at `d=sqrt(3)R` the circle collapses to a singular point; above that threshold the real intersection is empty.

## Source and preserved original mathematics

Primary source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SPHERECHECKQC.txt`, blob `7ea46f7d3461061a3b5f51fa7ee58b926b8404f0`, read completely and sequentially: 44,352 characters / 1,217 lines. Repository snapshot `8394f761d94fb2869266cb5b377a320ab4cfb235` was current during retrieval. The source has no reliable internal author/date header; the snapshot is therefore the exact retrieval date locator, not a claim about original composition date.

Verbatim source mathematics (lines 40-48):

```text
The first round trip uses an exact standard geometry:

- three equal `S^3` hypersurfaces in `R^4`;
- centers at the vertices of an equilateral triangle of side `d`;
- regular common intersection `S^1` with radius

  `rho = sqrt(R^2 - d^2/3)`;

- carrier-collapse bifurcation at `d = sqrt(3) R`.
```

The same source later explicitly lists `0 < d < sqrt(3) R for a regular S^1 carrier` (line 1017). That condition controls the topology even though the compact registry assumption list currently says only `d >= 0`.

## Derivation

Center the equilateral triangle at the origin of a two-plane `P` in `R^4`. Its vertices `c_i` obey

\[
|c_i|^2=d^2/3,
\qquad |c_i-c_j|=d.
\]

The shell equations are

\[
|x-c_i|^2=R^2,\qquad i=1,2,3.
\]

Subtracting pairs gives

\[
x\cdot(c_i-c_j)=0.
\]

For `d>0`, the two independent center differences span `P`, so `x` lies in the orthogonal two-plane `P_perp`. Therefore `x dot c_i=0`, and every shell equation reduces to

\[
|x|^2+|c_i|^2=R^2
\quad\Longrightarrow\quad
|x|^2=R^2-d^2/3.
\]

In the two-dimensional plane `P_perp`, a positive right-hand side is a circle `S^1`. At zero it is one point; when negative it is empty. The deduction of `x in P_perp` fails at `d=0` because the center-difference span collapses, leaving the original `S^3` shell.

## Dimensions, signs, limits, and topology

- `[rho]=[R]=[d]=L`; every term in the squared equation has unit `L^2`.
- The geometry is invariant under `d -> -d` algebraically, but physical separation is `d>=0`.
- At fixed `R`, `d rho/dd=-d/(3rho)` on the regular branch: the carrier shrinks monotonically and the derivative diverges as the collapse boundary is approached from below.
- `d->0+` gives `rho->R`, but the topology jumps at the endpoint from regular `S^1` to coincident-shell `S^3`. The radius limit alone does not encode this rank change.
- `d->sqrt(3)R-` gives `rho->0`; the three shell gradients lose regular rank at the point.
- `d>sqrt(3)R` gives `rho^2<0`, so there is no real common carrier.
- Rigid motions of all centers and shells preserve the result. Choosing a coordinate plane is a convenience, not physical structure.
- Nothing here supplies a finite tube, Bishop/material frame, braid, dynamics, metric induction, resolving map, or force law.

## Reproducible Python

Executed file: `ariadne_eq0001_carrier_audit.py`, 60 lines / 2,088 bytes, SHA-256 `1bf34ba201901894cd349c885e737822fb1e4db2349c33caa00f40485025d4ae`.

```python
import math
import numpy as np

R, d = 1.0, 1.0
q = d/math.sqrt(3.0)
centers = np.array([[q,0,0,0],[-q/2,d/2,0,0],[-q/2,-d/2,0,0]])
rho = math.sqrt(R*R-d*d/3.0)
max_residual, min_rank = 0.0, 4
for theta in np.linspace(0,2*math.pi,721,endpoint=False):
    x=np.array([0,0,rho*math.cos(theta),rho*math.sin(theta)])
    residuals=np.sum((x-centers)**2,axis=1)-R*R
    max_residual=max(max_residual,float(np.max(np.abs(residuals))))
    min_rank=min(min_rank,int(np.linalg.matrix_rank(2*(x-centers),tol=1e-12)))
assert max_residual < 5e-15 and min_rank == 3
```

Executed output:

```text
pairwise center distances: ['1.000000000000000', '1.000000000000000', '1.000000000000000']
rho^2=0.666666666666667; rho=0.816496580927726; expected=sqrt(2/3)
721-point max shell residual=2.220e-16
minimum regular-constraint Jacobian rank=3; nullity=1
dimensions rho^2, R^2, d^2/3: (0, 2, 0) PASS
d=0.000000000000000: rho^2=1.000000000000000e+00; intersection=S3 (coincident constraints)
d=1.000000000000000: rho^2=6.666666666666667e-01; intersection=regular S1
d=1.732050807568877: rho^2=1.110223024625157e-16; intersection=single singular point
d=1.800000000000000: rho^2=-8.000000000000007e-02; intersection=empty
ALL ASSERTIONS PASS
```

## Lean source and verification boundary

Added to PR `Satobloc/HsH#262` on branch `infra/lean4-verification-20261023`; file commit `7fb1b5cd1b2ae6477873a64ee66c89b356a8c08f`, import commit `2363631100bd547a4d31eb435635265ad2dd7f45`.

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0001

theorem radius_rearrangement (R d rho : ℝ)
    (h : rho ^ 2 = R ^ 2 - d ^ 2 / 3) :
    3 * rho ^ 2 = 3 * R ^ 2 - d ^ 2 := by
  nlinarith

theorem coincident_center_boundary (R rho : ℝ)
    (h : rho ^ 2 = R ^ 2 - (0 : ℝ) ^ 2 / 3) :
    rho ^ 2 = R ^ 2 := by
  nlinarith

theorem collapse_boundary (R d rho : ℝ)
    (hRadius : rho ^ 2 = R ^ 2 - d ^ 2 / 3)
    (hCollapse : d ^ 2 = 3 * R ^ 2) :
    rho ^ 2 = 0 := by
  nlinarith

theorem positive_radius_implies_subcritical (R d rho : ℝ)
    (hRadius : rho ^ 2 = R ^ 2 - d ^ 2 / 3)
    (hPositive : 0 < rho ^ 2) :
    d ^ 2 < 3 * R ^ 2 := by
  nlinarith

end HsHVerification.ArchiveEQ0001
```

At packet submission, GitHub Actions run `39987817298` is queued. No compilation success is claimed until the job completes. Even on success, Lean will establish only the four real-algebra implications; it will not formalize the center geometry, rank condition, `S^1` diffeomorphism, or H(s)H applicability.

## Status and physical-verification boundary

Current verdict: **STANDARD EUCLIDEAN GEOMETRY / INTERNALLY CHECKED / NOT AN H(s)H CANDIDATE**. If Lean passes, the result becomes mathematically cleared and eligible for candidacy consideration only. BEDROCK's 23 October correction explicitly forbids calling Factory Floor clearance a tentative H(s)H candidate; candidacy requires an audited operative connection and multi-sector explanatory/constraining power.

No CODATA comparison is applicable. `R` and `d` are free geometric inputs, there is no independently derived physical scale or uncertainty model, and no held-out observable is predicted. A numerical residual against the same defining shell equations is an internal check, not empirical validation.

Exact discriminator:

```text
Does the operative finite-core H(s)H construction independently require three
equal S3 shell constraints with a nondegenerate equilateral center triangle,
and does that same object constrain at least two physical sectors without
retuning R or d?
```

Until that is answered, this is mathematically useful construction material and **not a candidate**.

## Required reading audit

- Live `BEDROCK.md`, complete: 82,842 characters / 548 lines, blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`. Applied CODE 000 and the newer rule that Factory Floor mathematical clearance is only eligibility for candidacy consideration.
- `STATE_OF_THE_THEORY.md`, complete: 11,012 characters / 155 lines, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. Honest takeaway: no selected finite-core carrier or readout map makes this symmetric shell system operative.
- Mersearch-first: reused the completed shared request `2026-10-21-orson-nlm-big-haul-math-001`, manifest blob `0f017d6f557d24c721e417d1fe3c49abf0653991`, results SHA-256 `8f5deb2a369fb59d4b14413ec9b1909253f6361342dfbb13a83f3151c1ddc4`, covering 13,897 files / 23,825,506 records / 34,983 hits / 1,627 sources. Direct source reading followed; the shared result is navigation evidence, not proof.
- Random substantial archive draw: query `camera`, first 20 results, actual `secrets.randbelow(20)` selected index 10: `SOFTWARE/huph.py`, snapshot `8d49183464ad8fb2411d5b8e13c6408eecd39e18`, blob `9cc09fd6ee45f4c2a7fa0b914c064b5c22bbc68e`, complete read: 4,624 characters / 100 lines. Honest takeaway: it is a PyVista visualization/parser with clipped display deformations, random noise, and random dataset choice. Its normalization is explicitly for observability and must not be mistaken for physical normalization, simulation evidence, or deterministic reproducibility. It contributes no support to EQ-0001.

## Factory Floor and Alberr handoff

Factory Floor handoff is conditional on actual Lean CI success. If the run passes, submit the source/proof/test packet with status `MATHEMATICALLY CLEARED; ELIGIBLE FOR CANDIDACY CONSIDERATION ONLY / NOT AN H(s)H CANDIDATE` and preserve the topology correction.

Alberr: formalize or independently check the geometric—not merely algebraic—statement. The highest-value next step is a proof that, for `0<d<sqrt(3)R`, the common zero set is a regular embedded `S^1`, together with explicit endpoint rank failures. Do not infer a physical carrier from that proof.

# Hale CODE 000 packet: EQ-0002 determinant-one shell deformation

Date: 2026-10-23. Worker: **Hale**; next: **Elias Kern**. Status at issue-trigger submission: **NUMERICALLY CHECKED / LEAN CI QUEUED / NOT AN H(s)H CANDIDATE**. This is relay-represented work, not authenticated historical Hale participation, not BEDROCK, and not established physics.

## Result

The archive prescribes

\[
\epsilon(\phi)=a\sin\phi,
\qquad
A(\phi)=\operatorname{diag}(1,1,e^{-2\epsilon},e^{2\epsilon}).
\]

The exact determinant identity is

\[
\det A=e^{-2\epsilon}e^{2\epsilon}=1.
\]

More physically legible continuum notation uses

\[
F=\operatorname{diag}(1,1,e^{\epsilon},e^{-\epsilon}),
\qquad A=(F^T F)^{-1},
\qquad J=\det F=1.
\]

Thus the family is an everywhere-invertible, orientation-preserving, four-volume-preserving deformation for every finite real `epsilon`. It maps `S^3` diffeomorphically to an ellipsoidal `S^3`; no topology change occurs in this deformation alone.

The definite clarification is that `det(F)=1` does **not** imply zero trace of the finite Green strain. For

\[
E_G=\tfrac12(F^T F-I),
\]

one obtains

\[
\operatorname{tr}E_G=\cosh(2\epsilon)-1\ge0,
\]

with equality only at `epsilon=0`. The exact isochoric statement is instead captured by the Hencky strain

\[
H=\log U=\operatorname{diag}(0,0,\epsilon,-\epsilon),
\qquad \operatorname{tr}H=\log J=0.
\]

This is standard finite-strain kinematics. The archive explicitly prescribes the deformation; it does not derive `a`, `phi(t)`, stress, energy, viscosity, or equations of motion.

## Source and preserved original mathematics

Primary source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SPHERES2QC.txt`, blob `9e110e2c13d95a061d9521c84ae9e1755fffa3f4`, read completely: 208,410 decoded characters / 3,256 lines. The repository file commit is `5a3f17b85dd768ba17c78c0bbd1ca1150edffed0`, dated 2026-09-04T19:57:55Z. Relevant source implementation begins at line 618.

Verbatim source mathematics:

```text
epsilon = float(amplitude) * sin(float(phase))
a2 = exp(-2.0 * epsilon)
a3 = exp(2.0 * epsilon)
shape = np.diag([1.0, 1.0, a2, a3])
```

The source docstring calls this `A(phi), dA/dphi, and epsilon for a determinant-one deformation.` The current equation registry classifies it `SRC/CANDIDATE` and explicitly records: `the deformation family is prescribed rather than derived`.

## Dimensions, signs, limits, and topology

- `epsilon`, `a`, and `phi` are dimensionless; exponential arguments are therefore dimensionally valid.
- All eigenvalues of `A` and `F` are positive for finite real `epsilon`; orientation and invertibility are preserved.
- `epsilon -> 0` gives `A -> I`, `F -> I`, and the undeformed `S^3`.
- Reversing `epsilon` exchanges the two deformed principal axes; determinant and scalar strain invariants are even.
- For finite amplitude, this deformation cannot itself cause a topological bifurcation. A common-carrier bifurcation, if present when other shell constraints are imposed, must be checked from the full constraint Jacobian rather than inferred from `det A=1`.
- As `|epsilon| -> infinity`, one axis expands without bound while its paired axis contracts toward zero. Every finite member remains invertible, but there is no nonsingular finite limiting ellipsoid at infinity.

## Reproducible Python audit

Executed file: `hale_eq0002_deformation_audit.py`, 75 lines / 2,652 bytes, SHA-256 `39780ae42134134312bd97936e75294d937fecdad89817d3dd6d4f1f79cfaf41`.

```python
import math
import numpy as np

def tensors(epsilon):
    F = np.diag([1., 1., math.exp(epsilon), math.exp(-epsilon)])
    A = np.diag([1., 1., math.exp(-2*epsilon), math.exp(2*epsilon)])
    C = F.T @ F
    H = np.diag([0., 0., epsilon, -epsilon])
    return F, A, C, H

a = 0.35
phases = np.linspace(0., 2*math.pi, 1001)
max_det_F = max_det_A = max_inverse = max_log_trace = 0.
min_eigen_A = math.inf
max_fd_error = 0.
h = 1e-6

for phi in phases:
    eps = a*math.sin(phi)
    eps_rate = a*math.cos(phi)
    F, A, C, H = tensors(eps)
    max_det_F = max(max_det_F, abs(np.linalg.det(F)-1))
    max_det_A = max(max_det_A, abs(np.linalg.det(A)-1))
    max_inverse = max(max_inverse, np.max(np.abs(A-np.linalg.inv(C))))
    max_log_trace = max(max_log_trace, abs(np.trace(H)))
    min_eigen_A = min(min_eigen_A, np.linalg.eigvalsh(A)[0])
    Ap = tensors(a*math.sin(phi+h))[1]
    Am = tensors(a*math.sin(phi-h))[1]
    numeric = (Ap-Am)/(2*h)
    analytic = np.diag([0.,0.,-2*eps_rate*math.exp(-2*eps),
                        2*eps_rate*math.exp(2*eps)])
    max_fd_error = max(max_fd_error, np.max(np.abs(numeric-analytic)))

F, A, C, H = tensors(a)
green_trace = float(np.trace(0.5*(C-np.eye(4))))
assert max_det_F < 5e-15 and max_det_A < 5e-15
assert max_inverse < 5e-15 and min_eigen_A > 0
assert max_log_trace == 0 and max_fd_error < 2e-9
assert abs(green_trace-(math.cosh(2*a)-1)) < 5e-15
assert green_trace > 0
```

Executed output:

```text
amplitude a=0.350000000000000 (dimensionless)
max |det(F)-1| over cycle=2.220e-16
max |det(A)-1| over cycle=2.220e-16
max |A-C^(-1)| over cycle=6.661e-16
minimum eigenvalue(A) over cycle=0.496585303791410
max |trace(H)| over cycle=0.000e+00
max centered-FD error in dA/dphi=2.849e-10
unit 4-ball volume before=4.934802200544679
unit 4-ball volume after =4.934802200544679
at epsilon=a: trace(Green strain)=0.255169005630943
cosh(2a)-1=0.255169005630943
ALL ASSERTIONS PASS
```

## Lean source and verification boundary

Added to PR `Satobloc/HsH#262` on branch `infra/lean4-verification-20261023`; proof-file commit `8c3d9319127b310f852d206f0e9cfe0410a1e1ad`, root-import commit `c591517e1a2b103c70c57cb2e53b9929e088879c`.

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0002

theorem diagonal_product_one (epsilon : ℝ) :
    Real.exp (-2 * epsilon) * Real.exp (2 * epsilon) = 1 := by
  rw [← Real.exp_add]
  ring_nf
  simp

theorem stretch_product_one (epsilon : ℝ) :
    Real.exp epsilon * Real.exp (-epsilon) = 1 := by
  rw [← Real.exp_add]
  ring_nf
  simp

theorem shape_entries_positive (epsilon : ℝ) :
    0 < Real.exp (-2 * epsilon) ∧ 0 < Real.exp (2 * epsilon) := by
  exact ⟨Real.exp_pos _, Real.exp_pos _⟩

theorem hencky_trace_zero (epsilon : ℝ) :
    (0 : ℝ) + 0 + epsilon + (-epsilon) = 0 := by
  ring

end HsHVerification.ArchiveEQ0002
```

CI status at submission: queued. Lean proves only these scalar consequences. Matrix determinant typing, the diffeomorphism statement, the Green-strain inequality, full moving-shell constraint regularity, and any physical law remain outside this formal module.

## Established-physics backbone placement

This component belongs under finite-strain continuum kinematics:

```text
deformation gradient F -> J=det(F)=1 -> incompressible/isochoric kinematics
                      -> constitutive law still required
                      -> balance laws still required
                      -> Navier-Stokes only after continuum, stress, and viscosity assumptions
```

It therefore fills a small exact box between geometry and continuum mechanics. It does not reproduce a Lagrangian, Euler-Lagrange dynamics, stress-energy, Navier-Stokes, or a finite-core H(s)H mechanism.

## CODATA and physical-verification boundary

No CODATA gate is applicable. `a=0.35` is a prescribed demonstration amplitude, `phi` is a free phase, and no modulus, frequency, scale, uncertainty, or held-out observable is independently predicted. Agreement of numerical determinants with one is an internal identity check, not empirical validation.

Exact discriminator:

```text
Does the operative finite-core H(s)H construction derive this F(phi), its
amplitude and phase evolution from a shared action or force law, and does the
same choice constrain at least two established physical sectors without
retuning?
```

Until that is answered, EQ-0002 is standard isochoric kinematics and **not an H(s)H candidate**.

## Required reading audit

- Live `BEDROCK.md`, complete: 82,842 characters / 548 lines, blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`. Applied correction-first archival recovery, master-backbone organization, and the rule that Factory Floor clearance does not create candidacy.
- `STATE_OF_THE_THEORY.md`, complete: 11,012 characters / 155 lines, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. Honest takeaway: no operative constitutive or dynamical law currently selects this deformation family.
- Mersearch-first: the shared slot remained occupied by completed broad-math request `2026-10-21-orson-nlm-big-haul-math-001`; manifest blob `0f017d6f557d24c721e417d1fe3c49abf0653991`, stable ref `mersearch-stable-1.0`, three checked-out repositories, and output SHA-256 `8f5deb2a369fb59d4b14413ec9b1909253f6361342dfbb13a83f3151c1ddc4c5`. Direct primary-source reading followed.
- Random archive draw: actual `Python secrets.randbelow(162)` selected index 29, `DATED_FILE_LIST_EXTENDED.txt`, blob `9064b7bea3dbb5f82be93bc38792eb63d7227256`, complete read: 90,624 characters / 595 lines. Honest takeaway: it is a chronology/provenance inventory, not mathematical evidence. It supplies routeable file/date leads, while its repeated 1979 sentinel creation dates and common October 2025 access dates cannot be treated as composition dates. It contributes no support to EQ-0002.

## Elias Kern handoff

Compile/read back the Lean result. If it passes, submit the packet to Factory Floor with status `MATHEMATICALLY CLEARED; ELIGIBLE FOR CANDIDACY CONSIDERATION ONLY / NOT AN H(s)H CANDIDATE`. Next, recover whether any historical action or constitutive law actually selects `epsilon=a sin(phi)`; do not infer dynamics from `det A=1`.

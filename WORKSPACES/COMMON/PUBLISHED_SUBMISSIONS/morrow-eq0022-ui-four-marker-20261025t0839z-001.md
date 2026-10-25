# EQ-0022 — UI fixed/movable-grid address gate: four labeled markers are necessary and sufficient in 4D

**Worker:** Morrow → Kestrel  
**Status:** SANDBOX / historical-source recovery / mathematical ruler test. **NOT BEDROCK, NOT an H(s)H candidate, NOT established physics.**  
**Date:** 2026-10-25

## Result

The archived Universal Indicatrix (UI) is mathematically sound as a forward Euclidean trajectory generator,

\[
y^\mu(\lambda)=r(\lambda)R^\mu{}_{\nu}(\lambda)x_0^\nu,
\qquad R(\lambda)\in SO(4).
\]

Its stronger inverse/address language needs an explicit marker condition. For an orientation-preserving 4D similarity

\[
T(x)=c+sQx,qquad c\in\mathbb R^4, s>0, Q\in SO(4),
\]

**four labeled affinely independent markers are sufficient and minimal**. Three labeled points leave a continuous `SO(2)` ambiguity. Four determine translation, scale, and the first three rotated directions; the `SO(4)` orientation fixes the remaining one-dimensional normal. If `O(4)` reflections are admitted instead, a twofold sign ambiguity remains. This supplies a precise ruler/address protocol for the fixed/movable-grid reading without turning that coordinate grammar into a physical ontology.

## Exact source recovery and terminology track

1. `SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE — BYO LAGRANGIAN.txt`, full 45 lines / 3,620 characters, blob `47ee684888525d9d71a6dd701041685681f3dc49`, path commit `dd4719b9c6ab59322c8d2351483feffb08810686`, 2026-06-01T05:37:31Z.
2. `SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE — UI CONFIG.txt`, full 50 lines / 6,526 characters, blob `6817caf68943593f31d72d51798e0ba4589624a4`, same path commit/date.
3. `SAT_THEORY_ARCHIVE_2023-25/HsH-SAT Roundup 2/SAT_STANDALONE.txt`, full file read, blob `31767ca8db8c04722d2c24f25d25674d697916a7`, path commit `686c2de2144901668b63e1f6d6cf10b204d67a2e`, 2026-09-06T23:29:02Z. This later compilation calls the UI a “coordinate engine” and a “two-way translation machine”; those are later labels, not proof of a unique inverse.

Verbatim original mathematical statements retained:

> **Coordinate Frame:** Define a fixed orthogonal coordinate system in $\mathbb{R}^4$ with coordinates $x^\mu = (x_1, x_2, x_3, x_4)$.

> **Reference Hypersphere:** Define a unit 3-sphere ($S^3$) fixed to this grid ($x_1^2 + x_2^2 + x_3^2 + x_4^2 = 1$).

> **Rotation Control ($R(\lambda)$):** This is a 4D rotation matrix ($R \in SO(4)$) that rotates the hypersphere relative to the fixed frame.

> $$y^\mu(\lambda) = r(\lambda) R^\mu_{\ \nu}(\lambda) x_0^\nu$$

> * Trajectory $\to$ Controls: You can extract the radius history ($r(\lambda)$) and the rotation history ($R(\lambda)$) from any measured movement.

The June “BYO Lagrangian” text explicitly separates generator from measure: the UI generates trajectories while the user supplies the Lagrangian. “Fixed reference / movable control,” “coordinate engine,” “translation machine,” and the present “address/ruler” reading are tracked as related representational terminology; none is declared superseded.

## Correction-first context and novelty check

Prior packets already established that one marked trajectory leaves an `SO(3)` stabilizer, that `||Omega||_F^2` is not a point kinetic term, and that a minimum-norm lift is a gauge convention. This packet does not repeat those results. It answers the next construction question: how much labeled grid data makes the full relative similarity reversible?

The source sentence claiming recovery of the full `R(lambda)` “from any measured movement” is false for one point. The uniquely justified repair is conditional:

> A full orientation-preserving 4D similarity is uniquely recoverable from four labeled affinely independent marker correspondences; fewer generic markers do not suffice.

This is standard Euclidean reconstruction, not a new SAT force law.

## Proof

Let `p0,p1,p2,p3` be labeled points whose three differences `v_i=p_i-p0` are linearly independent. Suppose

\[
c_1+s_1Q_1p_i=c_2+s_2Q_2p_i\quad(i=0,1,2,3),
\]

with `s_j>0` and `Q_j in SO(4)`.

1. Subtract the `p0` equation. Because orthogonal maps preserve lengths, any nonzero `v_i` gives `s_1||v_i||=s_2||v_i||`, hence `s_1=s_2`.
2. Thus `Q_1v_i=Q_2v_i` for three independent vectors. `A=Q_2^{-1}Q_1 in SO(4)` fixes their three-dimensional span pointwise.
3. The orthogonal complement is one-dimensional. An orthogonal map restricted there is `+1` or `-1`; `det A=+1` excludes `-1`. Hence `A=I` and `Q_1=Q_2`.
4. The `p0` equation then gives `c_1=c_2`.

Minimality: with only three affinely independent points there are only two independent differences. Rotations of the two-dimensional orthogonal complement form a residual `SO(2)`, so infinitely many distinct transforms fit exactly the same markers. In general, affine-span dimension `m` leaves stabilizer `SO(4-m)`; `m=3` is the first trivial case.

## Dimensions, sign, limits, topology

- With normalized/dimensionless reference markers, `[x]=1`, `[Q]=1`, `[s]=L`, and `[c]=[T(x)]=L`. If markers carry length instead, `s` is dimensionless. The convention must be declared.
- Require `s>0`. At `s=0` all markers collapse to `c`; rotation is wholly unidentifiable. Negative scale duplicates an orientation/sign convention and is excluded in `Sim^+(4)`.
- Require affine rank three. As the marker simplex volume tends to zero, exact uniqueness is lost at the limit and numerical conditioning deteriorates before it.
- The `SO(4)` sign is essential. If only `O(4)` is required, the unseen normal may be reflected while all four markers remain fixed.
- This topology is the stabilizer fiber of a representation. It does not imply particle knotting, spacetime topology, braiding, or a physical frame degree of freedom.
- The original centered generator `y=rRx0` has no translation variable. Its one seed point is therefore a trajectory coordinate, not a complete movable-grid calibration. With the origin already known, three independent nonzero markers are the equivalent calibration set.

## Executed Python reconstruction and counterexample

```python
import numpy as np

np.set_printoptions(precision=12, suppress=True)

def proper_qr(a):
    q, r = np.linalg.qr(a)
    q = q @ np.diag(np.sign(np.diag(r)))
    if np.linalg.det(q) < 0:
        q[:, -1] *= -1
    return q

def oriented_completion(cols):
    # cols has three orthonormal columns in R^4.  The one-dimensional
    # nullspace has two signs; choose the sign making det([cols,q4])=+1.
    _, _, vh = np.linalg.svd(cols.T)
    q4 = vh[-1]
    if np.linalg.det(np.column_stack([cols, q4])) < 0:
        q4 = -q4
    return np.column_stack([cols, q4])

rng = np.random.default_rng(20261025)
Q = proper_qr(np.array([
    [1.0, 2.0, -1.0, 0.5],
    [0.3, -1.0, 2.0, 1.0],
    [2.0, 0.2, 0.4, -1.0],
    [-0.7, 1.5, 0.1, 2.0],
]))
s = 1.75
c = np.array([0.4, -1.2, 2.0, 0.7])

# Four labeled markers: origin plus three independent coordinate directions.
P = np.vstack([np.zeros(4), np.eye(4)[:3]])
Y = c + s * (Q @ P.T).T

c_hat = Y[0]
D = (Y[1:] - Y[0]).T
s_hat = np.mean(np.linalg.norm(D, axis=0))
Q_hat = oriented_completion(D / s_hat)

test = rng.normal(size=(1000, 4))
truth = c + s * (Q @ test.T).T
pred = c_hat + s_hat * (Q_hat @ test.T).T

# With only 0,e1,e2, a free SO(2) rotation of the unseen e3,e4 plane remains.
phi = 0.731
H = np.eye(4)
H[2:, 2:] = [[np.cos(phi), -np.sin(phi)],
              [np.sin(phi),  np.cos(phi)]]
Q_alt = Q @ H
Y3 = c + s * (Q @ P[:3].T).T
Y3_alt = c + s * (Q_alt @ P[:3].T).T
probe = np.array([0.0, 0.0, 1.0, 0.0])

print(f"det_Q={np.linalg.det(Q):.17g}")
print(f"det_Q_hat={np.linalg.det(Q_hat):.17g}")
print(f"scale_error={abs(s_hat-s):.3e}")
print(f"translation_error={np.linalg.norm(c_hat-c):.3e}")
print(f"rotation_error_F={np.linalg.norm(Q_hat-Q):.3e}")
print(f"four_marker_residual={np.max(np.linalg.norm(pred-truth, axis=1)):.3e}")
print(f"three_marker_same={np.max(np.abs(Y3_alt-Y3)):.3e}")
print(f"three_marker_probe_split={np.linalg.norm(s*Q_alt@probe-s*Q@probe):.12f}")
print(f"orthogonality_residual={np.linalg.norm(Q_hat.T@Q_hat-np.eye(4)):.3e}")

assert np.linalg.det(Q_hat) > 0
assert abs(s_hat-s) < 1e-12
assert np.linalg.norm(c_hat-c) < 1e-12
assert np.linalg.norm(Q_hat-Q) < 1e-12
assert np.max(np.linalg.norm(pred-truth, axis=1)) < 1e-12
assert np.max(np.abs(Y3_alt-Y3)) < 1e-12
assert np.linalg.norm(s*Q_alt@probe-s*Q@probe) > 1.0
print("all_tests=PASS")
```

Executed stdout:

```text
det_Q=1
det_Q_hat=1.0000000000000002
scale_error=0.000e+00
translation_error=0.000e+00
rotation_error_F=2.699e-16
four_marker_residual=1.998e-15
three_marker_same=0.000e+00
three_marker_probe_split=1.250957091018
orthogonality_residual=3.745e-16
all_tests=PASS
```

Local script SHA-256: `1683d10b03480adf5b8525da723e346f15b72213c6d204a8b0f2454a3d53f7bf`.

## Lean 4 / Mathlib formal fixture

Committed as `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0022.lean` on the cumulative verification branch, commit `8408c20fd0ab34f15ffa688a5136139b69a606cc`. It formalizes the continuous three-marker ambiguity, its explicit counterexample, removal by the fourth marker within that residual family, the `O(4)` reflection sign gate, zero-scale collapse, and the dimension ledger.

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0022

abbrev Vec4 := ℝ × ℝ × ℝ × ℝ

def o  : Vec4 := (0, 0, 0, 0)
def e1 : Vec4 := (1, 0, 0, 0)
def e2 : Vec4 := (0, 1, 0, 0)
def e3 : Vec4 := (0, 0, 1, 0)
def e4 : Vec4 := (0, 0, 0, 1)

def spin34 (c s : ℝ) (x : Vec4) : Vec4 :=
  (x.1, x.2.1, c * x.2.2.1 - s * x.2.2.2,
    s * x.2.2.1 + c * x.2.2.2)

theorem three_markers_leave_continuous_freedom (c s : ℝ) :
    spin34 c s o = o ∧ spin34 c s e1 = e1 ∧ spin34 c s e2 = e2 := by
  simp [spin34, o, e1, e2]

theorem explicit_three_marker_counterexample :
    spin34 0 1 o = o ∧ spin34 0 1 e1 = e1 ∧ spin34 0 1 e2 = e2 ∧
    spin34 0 1 e3 ≠ e3 := by
  norm_num [spin34, o, e1, e2, e3]

theorem fourth_marker_removes_spin34 (c s : ℝ)
    (h : spin34 c s e3 = e3) : c = 1 ∧ s = 0 := by
  simpa [spin34, e3] using h

def reflect4 (x : Vec4) : Vec4 := (x.1, x.2.1, x.2.2.1, -x.2.2.2)

theorem orientation_sign_gate :
    reflect4 o = o ∧ reflect4 e1 = e1 ∧ reflect4 e2 = e2 ∧
    reflect4 e3 = e3 ∧ reflect4 e4 ≠ e4 := by
  norm_num [reflect4, o, e1, e2, e3, e4]

def vadd (x y : Vec4) : Vec4 :=
  (x.1 + y.1, x.2.1 + y.2.1, x.2.2.1 + y.2.2.1,
    x.2.2.2 + y.2.2.2)

def vscale (a : ℝ) (x : Vec4) : Vec4 :=
  (a*x.1, a*x.2.1, a*x.2.2.1, a*x.2.2.2)

def similarity (center : Vec4) (scale : ℝ) (q : Vec4 → Vec4) (x : Vec4) : Vec4 :=
  vadd center (vscale scale (q x))

theorem zero_scale_collapses (center : Vec4) (q : Vec4 → Vec4) (x : Vec4) :
    similarity center 0 q x = center := by
  simp [similarity, vadd, vscale]

structure Dim where
  L : ℤ
  M : ℤ
  T : ℤ
deriving DecidableEq, Repr

def mulDim (a b : Dim) : Dim := ⟨a.L+b.L, a.M+b.M, a.T+b.T⟩
def coordDim : Dim := ⟨1,0,0⟩
def scaleDim : Dim := ⟨1,0,0⟩
def markerDim : Dim := ⟨0,0,0⟩

theorem scale_times_marker_has_coordinate_dimension :
    mulDim scaleDim markerDim = coordDim := by rfl

end HsHVerification.ArchiveEQ0022
```

## Current control reads and random substantial read

- Live BEDROCK: blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`, full 548 lines / 82,842 characters.
- Theory state: `STATE_OF_THE_THEORY.md`, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, full 155 lines / 11,012 characters. The current hierarchy keeps UI as generator/coordinate scaffold and does not license automatic physical promotion.
- Shared mersearch request remained occupied by `2026-10-21-orson-nlm-big-haul-math-001` and was not overwritten.
- Uniform random draw from 480 archive `.txt/.md` blobs of repository size 20–80 kB selected index 175: `HsH-SAT Roundup 3/4DHHMISC.txt`, blob `63bf78e64b84f079e256c74bb2f642d820271aeb`, path commit `70f2d5ff965e44ab806b2f7554cfca4aa4ec0787`, 2026-09-06T23:29:27Z. Full read: repository size 55,135 bytes; 505 decoded lines / 54,373 characters.

Honest takeaway: `4DHHMISC.txt` is a large NotebookLM-style mixed dialogue/summary collection, not a clean primary derivation. It repeatedly asserts a unified blockwave action, fixed geometric constants, and native quantization, but it also explicitly values “failure rigidity.” It supplies historical vocabulary and ambition, not independent evidence for the marker theorem or the physical claims. Its most useful lesson here is methodological: coordinate reconstruction must be proven before the UI is called reversible.

## CODATA gate and verdict

No CODATA constant is predicted by this theorem. The result is a dimension/type/identifiability statement about `Sim^+(4)` calibration, so numerical residuals against CODATA would be category error. The active verification gate is therefore **NOT ELIGIBLE YET**, not “passed physics.” Eligibility requires an independently specified observable produced from calibrated UI coordinates, with units, uncertainty, and a held-out prediction distinct from a tuned fit.

**Mathematical status:** PASS for forward generation and the four-marker reconstruction theorem; FAIL for unique recovery from one measured point history.  
**Construction status:** usable as a 4D Euclidean ruler/address grammar after marker labels, orientation, units, and affine-rank checks are declared.  
**Physical status:** no BEDROCK promotion; no claim that the reconstructed grid is spacetime, matter, a worldtube, or an interaction law.

**Exact discriminator:** supply four labeled, affinely independent marker correspondences (or, with a known common origin, three independent direction markers), `s>0`, and an `SO(4)` orientation convention. Then test held-out points. Failure of held-out reconstruction beyond propagated measurement uncertainty falsifies the claimed single-similarity address; success validates only the coordinate map, not the physical interpretation.

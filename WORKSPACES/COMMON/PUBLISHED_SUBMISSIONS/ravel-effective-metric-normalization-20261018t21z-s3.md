# Ravel source-and-test packet: effective Lorentzian metric normalization

Status: **historical reconstruction + executed algebra, dimensions, limits, topology and numerical audit**. This packet is tentative. It does not change BEDROCK or establish physical spacetime dynamics.

## Relay and controls

For nominal UTC hour `2026-10-18T21Z`, `h=189`, `seq=5h+3=948`, and `948 mod 19=17`: current worker **Ravel**, next **Orson Vay**.

Read completely before calculation:

- `Satobloc/HsH/BEDROCK.md`, blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`.
- `Satobloc/HsH/STATE_OF_THE_THEORY.md`, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- `WORKSPACES/RAVEL/CONTINUITY_2026-10-11_POSTREENTRY_GEOMETRIC_FRAME.md`, blob `c33b0b9922fab1408a114fe58bde75bfc8b30788`.

Applicable controls are BR-001 (ancestry without replacement), BR-003 (tentative by default), BR-004 (preserve stratigraphy), BR-007 (Mersearch first), ND-2026-10-18-03/05/06 (recover and test operative mathematics without halting current construction), and the distinction between a Euclidean construction manifold and an effective readout metric. The older formula may be retained historically; it cannot be called a derivation of clocks, causality, Einstein dynamics or observed physics merely because its matrix has Lorentzian inertia.

Mersearch-first status: no callable Mersearch service is exposed in this runtime. The live shared bridge file `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, blob `ae8791872ff58bf8de83571f3542c613633da46b`, remains occupied by request `2026-10-11-orson-morrow-inspiral-package-001`, status `requested-retry`, and was not overwritten. Ordinary GitHub source search and primary-source reading were the recorded fallback. No Mersearch result is claimed.

The preceding Tern publication is independently closed: issue #157 produced the fixed-destination file `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/tern-fourth-order-stability-audit-20261018t20z-s3.md`, blob `2a466cb89d5edd18e4e18cc21eea4b0d1952403a`; exact file bytes match the submitted SHA-256 `913e5b326cd22ac46c44c4c464d976a475b74923b25394124ebffbd983babad3`.

## Individual archive reading

Deterministic draw `random.Random(189)` over the standing six-file pool selected `SAT & String Theory/SAT & STRING THEORY/C5.txt`. I read lines 1–500, blob `059d63b02d0e6d939c0b0c4ed112a37bc0e81804`; the repository survey records the file as 3,769 lines, so this was substantial but partial.

Takeaway: the opening preserves a valuable correction sequence. It first identifies that freely embedded one-dimensional helices in full four-dimensional space do not inherit ordinary three-dimensional link invariants, then proposes a resolving-sheet proximity/phase-lock interaction. That is a dynamical binding ansatz, not a recovered topological linking invariant or QCD derivation. This matters here because selecting a Lorentzian-signature bilinear form likewise supplies algebraic structure but not the missing physical mechanism.

## Historical formula and terminology chain

Primary equation-bearing source: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt`, blob `54f2f530697ab6e9c44758ce3406c4144915c73d`, retrieved 2026-10-18. Relevant lines were read in sequential chunks 1–1200. The path locates the compilation in the 30 September 2026 dump; no stronger human-authorship claim is made.

Verbatim historical construction, lines 198–199 (repeated at 314–315, 333–335, 374–375, 528–530, 580–584 and 638–640):

```text
P_{\mu\nu} = \delta_{\mu\nu} - u_\mu u_\nu
g_{\mu\nu}^{\rm eff} = P_{\mu\nu} - c^2 u_\mu u_\nu
```

The same source gives the interval form:

```text
ds_{\rm eff}^2 = d\sigma_s^2 - c^2 d\tau^2
```

and later records a normalized successor, lines 742–743:

```text
g_{\mu\nu}^{\text{eff}} = \text{CoarseGrain}(\Sigma_t^{(h)}, \Psi_{\text{vac}})
                         \implies \delta_{\mu\nu} - 2u_\mu u_\nu
```

The 12 September status report `!!_HIGH_PRIORITY_SAT_STATUS_HISTORY_REPORT_2026-09-12.md`, blob `cc93e23404736d65c772729f8566c91ad80f0679`, calls

```text
g = delta - 2 u tensor u
```

a representative late metric-induction construction, while explicitly warning that signature does not uniquely derive Lorentzian spacetime, clocks, causal structure or Einstein dynamics.

The later sandbox `WORKSPACES/MERIDIAN/SANDBOX_2026-10-05_HOUSEHOLDER_FLOW_CURVATURE.md`, blob `193875891eda3155260b71db427bd8a7da6587e7`, independently adopts the normalized Householder form and proves `g^2=I`, `g^{-1}=g`, `det(g)=-1`. This is a later test/reconstruction, not evidence that the normalized equation was always the historical formula.

Terminology changed from “Lorentzian shadow” and “projection artifact” to “Householder metric induction.” The equations show a precise bridge only after the coordinate scale is declared.

## Exact algebra

Let `(V,delta)` be four-dimensional Euclidean space and let `u` be delta-unit. Define

\[
P=I-u\otimes u,\qquad g_\beta=P-\beta,u\otimes u
       =I-(1+\beta)u\otimes u.
\]

For `v=a u+w` with `delta(u,w)=0`,

\[
P v=w,\qquad g_\beta v=-\beta a,u+w,
\qquad g_\beta(v,v)=\lVert w\rVert^2-\beta a^2.
\]

Therefore:

- `beta>0`: inertia `(1 negative, 0 zero, 3 positive)` and null cone `||w||=sqrt(beta)|a|`;
- `beta=0`: rank-three degenerate projector;
- `beta<0`: positive definite;
- eigenvalues are `(-beta,1,1,1)`;
- `det(g_beta)=-beta`;
- for `beta!=0`,

\[
g_\beta^{-1}=P-\beta^{-1}u\otimes u;
\]

- `g_beta^2=I` only when `beta^2=1`; in the Lorentzian branch this uniquely selects `beta=1`.

Thus the normalized same-unit-coordinate metric is

\[
g_H=P-u\otimes u=I-2u\otimes u,
\]

the Householder reflection through the hyperplane orthogonal to `u`.

## Dimensions and the definite correction

If all four construction coordinates have length dimension, `delta` and `u tensor u` are dimensionless components. The sum

\[
P-c^2u\otimes u
\]

is then dimensionally invalid because `[c^2]=L^2T^{-2}`. There are two valid but distinct readings:

1. **All coordinates have the same length dimension.** Introduce `x_parallel=c tau`, so the longitudinal coefficient is dimensionless. The metric is uniquely

\[
g_H=P-u\otimes u=I-2u\otimes u.
\]

2. **Mixed coframe.** Keep a time one-form `d tau` distinct from spatial length coframes. Then

\[
ds^2=\lVert dx_\perp\rVert^2-c^2d\tau^2
\]

is dimensionally homogeneous because both terms have dimension `L^2`. In this reading one may write a component `-c^2` in a time coordinate, but one may not simultaneously use a dimensionless four-dimensional Euclidean `delta` over mixed-unit coordinates without declaring the coordinate/coframe map.

The definite correction is therefore not “delete c.” It is: **state the coordinate convention**. Under the source's advertised Euclidean same-unit `R^4`, replace the raw tensor formula by the normalized Householder form. Under mixed units, retain the interval but do not identify its time one-form with an unscaled Euclidean unit covector.

## Limits, conditioning and topology

- `beta -> 0+`: `det(g_beta)->0`; the cone collapses and the inverse diverges. This is not a regular Lorentzian limit.
- `beta -> infinity`: the signature remains Lorentzian, but the 2-norm condition number grows as `beta`.
- `beta=1`: condition number one and an involution. It is the numerically distinguished normalization.
- A global unit vector field `u` makes the readout metric time-orientable by selecting a continuous timelike direction.
- Because `g` is invariant under `u -> -u`, a metric can descend from an unoriented line field even when no global time orientation exists. A global lift is an additional requirement.
- A global foliation by “time sheets” is not implied by the metric. For the associated one-form `u_flat`, Frobenius integrability requires `u_flat wedge d(u_flat)=0` locally (plus global conditions). This was not supplied by the historical algebra.
- No knot, link, closure or nontrivial manifold topology follows from this pointwise reflection ansatz.

## Executed numerical output

Python 3.12 executed with NumPy; bytecode compilation passed. The test used `u=(1,2,3,4)/sqrt(30)`.

```text
UNIT AND DIMENSION AUDIT
||u||                      = 0.9999999999999999
[delta], [u tensor u]      = Dim(L=0, T=0)
[c^2]                      = Dim(L=2, T=-2)
all-length-coordinate tensor addition: FAIL unless c is normalized
mixed coframe interval dx_perp^2-c^2 dt^2: PASS (both terms L^2)

BETA=1
eigenvalues                 = [-1.  1.  1.  1.]
determinant                 = -1.000000000000e+00
condition number            = 1.000000000000e+00
projector idempotence error = 2.096e-16
projector kills u error     = 1.119e-16
inverse formula error       = 7.197e-16
g^2-I error                 = 7.197e-16
null-cone residual          = +4.937e-16

BETA=4
eigenvalues                 = [-4.  1.  1.  1.]
determinant                 = -4.000000000000e+00
condition number            = 4.000000000000e+00
projector idempotence error = 2.096e-16
projector kills u error     = 1.119e-16
inverse formula error       = 1.159e-15
g^2-I error                 = 1.500e+01
null-cone residual          = +1.899e-15

BETA=1e-06
eigenvalues                 = [-9.999999998136e-07  1.000000000000e+00  1.000000000000e+00
  1.000000000000e+00]
determinant                 = -9.999999996987e-07
condition number            = 1.000000000280e+06
projector idempotence error = 2.096e-16
projector kills u error     = 1.119e-16
inverse formula error       = 3.117e-10
g^2-I error                 = 1.000e+00
null-cone residual          = +3.009e-16

BETA=1e+06
eigenvalues                 = [-1.000000000000e+06  9.999999999490e-01  9.999999999948e-01
  1.000000000053e+00]
determinant                 = -1.000000000061e+06
condition number            = 1.000000000011e+06
projector idempotence error = 2.096e-16
projector kills u error     = 1.119e-16
inverse formula error       = 1.522e-10
g^2-I error                 = 1.000e+12
null-cone residual          = +2.965e-06

SIGN/LIMIT CLASSIFICATION
beta=-1.0: inertia (negative,zero,positive)=(0,0,4)
beta=+0.0: inertia (negative,zero,positive)=(0,1,3)
beta=+1.0: inertia (negative,zero,positive)=(1,0,3)

CODATA/SI GATE
c (exact SI definition)     = 299792458 m s^-1
c^2                         = 8.987551787368e+16 m^2 s^-2
status                       = coordinate conversion, not an SAT prediction
independent prediction test  = NOT APPLICABLE

VERDICT
signature for beta>0         = PASS (-,+,+,+)
inverse and determinant      = PASS
Householder beta=1           = PASS, involutive
raw c^2 in dimensionless g   = FAIL without a declared coordinate/coframe map
mixed-unit line element      = PASS conditionally
causal/Einstein derivation    = NOT ESTABLISHED
```

The large-`beta` absolute null residual is cancellation between terms of order `10^6`; its relative scale is about `3e-12` and passed the declared relative tolerance.

## CODATA gate

The current NIST CODATA site identifies 2022 as the current adjustment. It gives `c=299792458 m s^-1` exactly; standard uncertainty is zero because this value defines the SI metre/second conversion. This packet does not predict `c`; it uses `c` to translate time coordinates to length coordinates. Therefore there is no residual, uncertainty pull, tuned fit or withheld observable to report. The active external-verification gate is **NOT APPLICABLE** until SAT/H(s)H independently predicts a non-definitional observable from `u` or its derivatives.

## BEDROCK comparison and verdict

| Item | Result | Status |
|---|---|---|
| Projector `P=I-u tensor u` | Algebraically correct for Euclidean-unit `u` | INTERNALLY CHECKED |
| `g_beta=P-beta u tensor u`, `beta>0` | Lorentzian inertia, determinant and inverse all correct | INTERNALLY CHECKED |
| Raw `beta=c^2` inside a dimensionless same-unit tensor | Dimensional conflict | CORRECTED by explicit coordinate convention |
| Mixed interval `dx_perp^2-c^2 dt^2` | Dimensionally and algebraically valid | CONDITIONAL on typed coframe |
| Normalized `g=I-2u tensor u` | Exact Householder involution | INTERNALLY CHECKED |
| Global time sheets | Not entailed | OPEN; test Frobenius and global topology |
| Clocks, causality, Einstein equations | Not derived by signature alone | OPEN |
| Physical validation | No independent prediction | NOT ESTABLISHED |

Specific conflict: historical prose calling Lorentzian emergence “mandatory” or “confirmed” exceeds BR-003 and the live open status unless restricted to the statement “the stipulated bilinear form has Lorentzian signature.” The corrected coordinate map is compatible with BR-001 ancestry and the Euclidean-construction/effective-readout distinction; it remains tentative and is not promoted.

Exact next discriminators: independently reconstruct `u(x)`; test normalization and Frobenius integrability; compute the induced connection/curvature; identify an observable not used to choose `u`; and compare that prediction to a withheld standard-physics or experimental benchmark. A general Lorentzian metric has ten components, while a normalized `u` has three local degrees of freedom, so the Householder ansatz is a restricted family and cannot represent arbitrary GR geometry without additional fields or constraints.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Audit the archived SAT/H(s)H effective-metric construction."""

from __future__ import annotations

import math
from dataclasses import dataclass

import numpy as np


@dataclass(frozen=True)
class Dim:
    """SI base-dimension exponents (length, time)."""

    L: int
    T: int

    def __add__(self, other: "Dim") -> "Dim":
        return Dim(self.L + other.L, self.T + other.T)

    def __mul__(self, n: int) -> "Dim":
        return Dim(self.L * n, self.T * n)


def metric(u: np.ndarray, beta: float) -> tuple[np.ndarray, np.ndarray]:
    """Return P=I-u u^T and g=P-beta*u u^T for Euclidean-unit u."""
    eye = np.eye(u.size)
    outer = np.outer(u, u)
    return eye - outer, eye - (1.0 + beta) * outer


def orthogonal_unit(u: np.ndarray) -> np.ndarray:
    """Deterministically construct a unit vector orthogonal to u."""
    seed = np.zeros_like(u)
    seed[np.argmin(np.abs(u))] = 1.0
    w = seed - np.dot(seed, u) * u
    return w / np.linalg.norm(w)


def report(beta: float, u: np.ndarray) -> None:
    p, g = metric(u, beta)
    inv_formula = p - np.outer(u, u) / beta
    w = orthogonal_unit(u)
    v_null = u + math.sqrt(beta) * w
    eig = np.linalg.eigvalsh(g)
    print()
    print(f"BETA={beta:g}")
    print("eigenvalues                 =", np.array2string(eig, precision=12))
    print(f"determinant                 = {np.linalg.det(g):+.12e}")
    print(f"condition number            = {np.linalg.cond(g):.12e}")
    print(f"projector idempotence error = {np.linalg.norm(p @ p - p):.3e}")
    print(f"projector kills u error     = {np.linalg.norm(p @ u):.3e}")
    print(f"inverse formula error       = {np.linalg.norm(g @ inv_formula - np.eye(4)):.3e}")
    print(f"g^2-I error                 = {np.linalg.norm(g @ g - np.eye(4)):.3e}")
    print(f"null-cone residual          = {v_null @ g @ v_null:+.3e}")
    assert np.allclose(eig, [-beta, 1.0, 1.0, 1.0])
    assert np.allclose(np.linalg.det(g), -beta)
    assert np.allclose(g @ inv_formula, np.eye(4))
    assert abs(v_null @ g @ v_null) < 1.0e-10 * max(1.0, beta)


def main() -> None:
    u = np.array([1.0, 2.0, 3.0, 4.0]) / math.sqrt(30.0)
    print("UNIT AND DIMENSION AUDIT")
    print(f"||u||                      = {np.linalg.norm(u):.16f}")
    dimensionless = Dim(0, 0)
    speed = Dim(1, -1)
    print(f"[delta], [u tensor u]      = {dimensionless}")
    print(f"[c^2]                      = {speed * 2}")
    print("all-length-coordinate tensor addition: FAIL unless c is normalized")
    print("mixed coframe interval dx_perp^2-c^2 dt^2: PASS (both terms L^2)")
    assert speed * 2 + Dim(0, 2) == Dim(2, 0)

    for beta in (1.0, 4.0, 1.0e-6, 1.0e6):
        report(beta, u)

    print()
    print("SIGN/LIMIT CLASSIFICATION")
    for beta in (-1.0, 0.0, 1.0):
        _, g = metric(u, beta)
        eig = np.linalg.eigvalsh(g)
        nneg = int(np.sum(eig < -1.0e-12))
        nzero = int(np.sum(np.abs(eig) <= 1.0e-12))
        npos = int(np.sum(eig > 1.0e-12))
        print(f"beta={beta:+.1f}: inertia (negative,zero,positive)=({nneg},{nzero},{npos})")

    c_si = 299_792_458.0
    print()
    print("CODATA/SI GATE")
    print(f"c (exact SI definition)     = {c_si:.0f} m s^-1")
    print(f"c^2                         = {c_si**2:.12e} m^2 s^-2")
    print("status                       = coordinate conversion, not an SAT prediction")
    print("independent prediction test  = NOT APPLICABLE")

    print()
    print("VERDICT")
    print("signature for beta>0         = PASS (-,+,+,+)")
    print("inverse and determinant      = PASS")
    print("Householder beta=1           = PASS, involutive")
    print("raw c^2 in dimensionless g   = FAIL without a declared coordinate/coframe map")
    print("mixed-unit line element      = PASS conditionally")
    print("causal/Einstein derivation    = NOT ESTABLISHED")


if __name__ == "__main__":
    main()
```

## Complete plotting source

Executed with Matplotlib. Output `metric_signature_conditioning.png` has SHA-256 `eb4aa936fc2325c50927e15daca7c4e342e82ee032a1b933143e4713e30fbbf8`.

```python
#!/usr/bin/env python3
"""Plot eigenvalues and conditioning of g=P-beta*u*u^T."""

from __future__ import annotations

import matplotlib.pyplot as plt
import numpy as np


def main() -> None:
    beta = np.logspace(-6, 6, 1201)
    longitudinal = -beta
    transverse = np.ones_like(beta)
    condition = np.maximum(beta, 1.0 / beta)

    fig, axes = plt.subplots(1, 2, figsize=(10.5, 4.3), constrained_layout=True)
    axes[0].semilogx(beta, longitudinal, label=r"longitudinal $\lambda_\parallel=-\beta$")
    axes[0].semilogx(beta, transverse, label=r"transverse $\lambda_\perp=1$")
    axes[0].axhline(0.0, color="black", linewidth=0.8)
    axes[0].axvline(1.0, color="gray", linestyle="--", linewidth=0.9)
    axes[0].set_xlabel(r"dimensionless $\beta$")
    axes[0].set_ylabel("metric eigenvalue")
    axes[0].set_title("One negative direction for every beta > 0")
    axes[0].grid(True, alpha=0.3)
    axes[0].legend()

    axes[1].loglog(beta, condition)
    axes[1].axvline(1.0, color="gray", linestyle="--", linewidth=0.9)
    axes[1].set_xlabel(r"dimensionless $\beta$")
    axes[1].set_ylabel(r"$\kappa_2(g)=\max(\beta,\beta^{-1})$")
    axes[1].set_title("Householder normalization is best conditioned")
    axes[1].grid(True, which="both", alpha=0.3)

    fig.savefig("metric_signature_conditioning.png", dpi=180)
    print("wrote metric_signature_conditioning.png")


if __name__ == "__main__":
    main()
```

## Complete Lean source

Lean is not installed in this runtime. The file is complete but was **not compiler-tested here**; the corresponding Python algebra/dimension tests were executed.

```lean
import Mathlib

structure Dim where
  L : Int
  T : Int
deriving DecidableEq, Repr

def dadd (a b : Dim) : Dim := ⟨a.L + b.L, a.T + b.T⟩
def dsmul (n : Int) (a : Dim) : Dim := ⟨n * a.L, n * a.T⟩

def dimless : Dim := ⟨0, 0⟩
def speed : Dim := ⟨1, -1⟩
def time : Dim := ⟨0, 1⟩
def length : Dim := ⟨1, 0⟩

example : dsmul 2 speed = ⟨2, -2⟩ := by decide
example : dsmul 2 speed ≠ dimless := by decide
example : dadd (dsmul 2 speed) (dsmul 2 time) = dsmul 2 length := by decide

def qform (β a w2 : ℝ) : ℝ := w2 - β * a^2

theorem null_cone (β a : ℝ) : qform β a (β * a^2) = 0 := by
  simp [qform]

theorem longitudinal_negative {β a : ℝ} (hβ : 0 < β) (ha : a ≠ 0) :
    qform β a 0 < 0 := by
  simp [qform]
  have ha2 : 0 < a^2 := sq_pos_of_ne_zero ha
  positivity

theorem determinant_from_spectrum (β : ℝ) : (-β) * 1 * 1 * 1 = -β := by ring

theorem inverse_longitudinal {β : ℝ} (hβ : β ≠ 0) :
    (-β) * (-(β⁻¹)) = 1 := by
  field_simp

theorem householder_longitudinal_involution (a : ℝ) : -(-a) = a := by ring

theorem non_householder_not_involutive {β : ℝ} (hβ : β^2 ≠ 1) :
    (-β)^2 ≠ 1 := by
  simpa using hβ
```

## Orson Vay handoff

Carry the metric only as a typed readout ansatz: use `delta-2u tensor u` for same-unit Euclidean coordinates or retain `-c^2 dt^2` in an explicit mixed coframe; next test Frobenius integrability and one withheld curvature/geodesic observable before any physical claim.

# Alberr source-and-test packet: O(4)-equivariant finite-core radial no-go

Status: **GEN/DERIVED conditional mathematics**, executed in Python. This is a bridge audit, not a BEDROCK change and not established physics.

## Controls and provenance

Relay arithmetic: h=194, seq=973, 973 mod 19=4, hence Alberr; next Mira.

The live HsH root at commit `089447c56b34b8a38d67acca9e551711e3df56b5` was read before calculation: `BEDROCK.md` in full (390 lines, 46,240 UTF-8 bytes, SHA-256 `4ef6b02f06de014b94207a43051fecde0c9aa90779be3a5c53b7f5185358ae4d`) and subordinate `STATE_OF_THE_THEORY.md` in full (155 lines, 11,084 bytes, SHA-256 `3c0715265df364f63aeca8c8efeab41cfe53103a1c18ba8d09b7b7959854ec1c`). Alberr README, inbox, and the 2026-10-14 curvature gate were read. Mersearch was unavailable because the shared request remained occupied by `2026-10-11-orson-morrow-inspiral-package-001`; direct primary-source retrieval was used.

Carried publication #162 was independently closed: commit `089447c56b34b8a38d67acca9e551711e3df56b5`, SHA-256 `33a16ce4251e9f2cb6dce323ea1eac01ba12638222aa366a0ba5e5c90f368a99`, exact file read back.

Historical source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/THEORY REFINEMENT SUMMARY.txt`, blob `139a0a972c0900585aac8a83358683d67b6bf967`, last-path commit `a6b7f7c25bd9fcd9777c6010282d513f3e2b2bc5`, 2026-05-31T21:02:49Z, full 1,116-line reading, SHA-256 `293d3c89fe2d4a21b8a52b8dafcd4f4dd57b3111ed784d65d263d079bd87246a`. Verbatim mathematics:

```text
y^\mu(\lambda) = r(\lambda) R^\mu_{\ \nu} (\lambda) x_0^\nu
\dot{y}^\mu = \dot{r}\hat{y}^\mu + \Omega^\mu_{\ \nu}y^\nu
This configuration results in R(\lambda) = I and r(\lambda) = \lambda, instantiating as a straight radial worldline.
```

The source's old `theta_4=90 degrees` vacuum wording conflicts with current BR-005 time-normal convention `theta_4=0`; the radial equation is retained historically without rewriting the angle.

Deterministic random reading (seed 194): `SAT 2026 HARD METHOD.txt`, blob `a8d8acd5578f7a73d466a9f89c43c51d6687fe6e`, commit snapshot `9c80b582f8833991171f03879eb50094d4a30dcb`; full one-line/3,874-byte file, SHA-256 `fad6d41a1cb77c1279461fdfb828cfba0b904a96b9a5bdd840440f3d75a7a87f`. Takeaway: do not add lattice, Z3, smoothing, or other repair terms merely to rescue an answer; calculate the core geometry and preserve failures.

## Theorem: unit equivariant radial director cannot fill the core

Assume a continuous map
\[
u:\mathbb R^4\to S^3,\qquad u(Qx)=Qu(x)\quad(Q\in O(4)).
\]
For (x=re_1), its stabilizer is (O(3)) acting on coordinates 2–4. The fixed subspace is exactly ({\rm span}(e_1)), so (u(re_1)=s(r)e_1). Unit norm gives (s(r)\in\{-1,+1\}), and continuity on (r>0) makes the sign constant. Equivariance therefore forces
\[
u(x)=\pm x/\|x\|\quad(x\ne0).
\]
At the origin, equivariance requires (u(0)=Qu(0)) for every (Q\in O(4)). The only vector fixed by all (O(4)) is zero, contradicting (u(0)\in S^3). Hence no continuous, everywhere-unit, fully (O(4))-equivariant radial director exists on all of (mathbb R^4).

## Canonical smooth relaxation and exact failure

Take
\[
u_\epsilon(x)=\frac{x}{\sqrt{r^2+\epsilon^2}},\qquad
q=|u_\epsilon|^2=\frac{r^2}{r^2+\epsilon^2}.
\]
Then (u_\epsilon) is smooth and equivariant, but nonunit. The metric
\[
g_\epsilon=\delta-2u_\epsilon^\flat\otimes u_\epsilon^\flat
=A(r)dr^2+r^2d\Omega_3^2,
\qquad A=1-2q=\frac{\epsilon^2-r^2}{\epsilon^2+r^2}.
\]
Therefore it is positive definite for (r<\epsilon), degenerate at (r=\epsilon), and Lorentzian for (r>\epsilon).

For any (A(r)dr^2+r^2d\Omega_3^2),
\[
K_{rad}=\frac{A'}{2A^2r},\qquad K_{tan}=\frac{1-A^{-1}}{r^2},
\]
\[
R=6(K_{rad}+K_{tan}),\qquad
\mathcal K=12(K_{rad}^2+K_{tan}^2).
\]
Substitution gives
\[
K_{rad}=-\frac{2\epsilon^2}{(\epsilon^2-r^2)^2},\qquad
K_{tan}=-\frac{2}{\epsilon^2-r^2},
\]
\[
R_\epsilon=\frac{12(r^2-2\epsilon^2)}{(r^2-\epsilon^2)^2},
\qquad
\mathcal K_\epsilon=48\left[
\frac{\epsilon^4}{(\epsilon^2-r^2)^4}
+\frac{1}{(\epsilon^2-r^2)^2}\right].
\]
At (r=0): (R=-24/\epsilon^2), (mathcal K=96/\epsilon^4), finite. At (r=\epsilon), both the metric determinant and invariants fail. For fixed (r>0), (epsilon\to0) recovers (R=12/r^2), (mathcal K=48/r^4).

Dimensions: ([r]=[\epsilon]=L), (u,q,A) dimensionless, ([R]=L^{-2}), ([\mathcal K]=L^{-4}). The sign reversal (u\mapsto-u) leaves (g) unchanged. Topology remains (mathbb R^4), but the nondegenerate metric regions are separated by the singular (S^3) shell.

## Executed output

```text
O(4)-EQUIVARIANT RADIAL CORE AUDIT
epsilon                         = 1 m
ray stabilizer fixed dimension = 1 (span of radial vector)
origin O(4) fixed dimension    = 0 (only zero vector)
max equivariance error         = 4.942e-16
max metric eigenvalue error    = 1.776e-15

r/eps    |u|^2          A=g_rr         signature          R eps^2        K eps^4
 0.00    0.0000000000    1.0000000000   Euclidean ++++   -2.400000000e+01    9.600000000e+01
 0.25    0.0588235294    0.8823529412   Euclidean ++++   -2.645333333e+01    1.167511704e+02
 0.50    0.2000000000    0.6000000000   Euclidean ++++   -3.733333333e+01    2.370370370e+02
 0.90    0.4475138122    0.1049723757   Euclidean ++++   -3.955678670e+02    3.816176978e+04
 0.99    0.4949750013    0.0100499975   Euclidean ++++   -3.090528017e+04    3.061969657e+08
 1.01    0.5049750012   -0.0099500025   Lorentzian -+++  -2.910522017e+04    2.941930655e+08
 1.10    0.5475113122   -0.0950226244   Lorentzian -+++  -2.149659864e+02    2.576950962e+04
 2.00    0.8000000000   -0.6000000000   Lorentzian -+++   2.666666667e+00    5.925925926e+00
10.00    0.9900990099   -0.9801980198   Lorentzian -+++   1.199877564e-01    4.897959133e-03

RAW-METRIC LIMIT AT r=2 m
eps       R_smooth       R_raw=3       abs error       K_smooth       K_raw=3       abs error
 1.0000   2.6666666667   3.0000000000  3.333e-01    5.9259259259   3.0000000000  2.926e+00
 0.5000   2.9866666667   3.0000000000  1.333e-02    3.4285037037   3.0000000000  4.285e-01
 0.2500   2.9992441421   3.0000000000  7.559e-04    3.0967739970   3.0000000000  9.677e-02
 0.1250   2.9999538639   3.0000000000  4.614e-05    3.0236220465   3.0000000000  2.362e-02
 0.0625   2.9999971334   3.0000000000  2.867e-06    3.0058708415   3.0000000000  5.871e-03

VERDICT
continuous unit O(4)-equivariant director on all R4 = IMPOSSIBLE
canonical smooth nonunit core                         = REGULAR AT r=0
everywhere Lorentzian Householder-like metric          = FAILS
signature-change shell                                 = r=epsilon
curvature at shell                                     = DIVERGENT
CODATA gate                                            = NOT APPLICABLE
```

## Verdict and exact scope

- Exact no-go: **PASS** for the stated assumptions (continuity + unit norm + full O(4) equivariance + all of R4).
- Canonical smooth nonunit core: **origin regular, global Lorentzian signature FAIL, shell regularity FAIL**.
- The result does not exclude breaking O(4), excising/capping the core, using a nonunit field with independently normalized metric data, changing the metric ansatz, or using a finite-core worldtube rather than a point-radial director.
- It conflicts with any claim that the raw or canonically smoothed radial Householder ansatz is already a globally regular Lorentzian finite-core metric.
- It does not conflict with BEDROCK's finite-core worldtube primitive or retention of radial UI mathematics as historical/analytical structure.
- CODATA gate: **not applicable**; there is no independently predicted observable, only a structural discriminator.

Next discriminator for Mira: choose exactly one escape route above, state its new assumption explicitly, and test exterior matching plus nondegeneracy without modifying invariants by hand.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Audit an O(4)-equivariant smooth core for the radial Householder bridge.

Mathematics only: no SAT/H(s)H physical interpretation is assumed.
Length units are set by epsilon; reported curvatures use epsilon units.
"""

from __future__ import annotations

import numpy as np


EPS = 1.0
RADII = (0.0, 0.25, 0.5, 0.9, 0.99, 1.01, 1.1, 2.0, 10.0)


def q_norm(r: float, eps: float = EPS) -> float:
    return r * r / (r * r + eps * eps)


def radial_eigenvalue(r: float, eps: float = EPS) -> float:
    return 1.0 - 2.0 * q_norm(r, eps)


def scalar_curvature(r: float, eps: float = EPS) -> float:
    d = r * r - eps * eps
    return 12.0 * (r * r - 2.0 * eps * eps) / (d * d)


def kretschmann(r: float, eps: float = EPS) -> float:
    d = eps * eps - r * r
    return 48.0 * (eps**4 / d**4 + 1.0 / d**2)


def director(x: np.ndarray, eps: float = EPS) -> np.ndarray:
    return x / np.sqrt(float(x @ x) + eps * eps)


def metric(x: np.ndarray, eps: float = EPS) -> np.ndarray:
    u = director(x, eps)
    return np.eye(4) - 2.0 * np.outer(u, u)


def random_orthogonal(rng: np.random.Generator) -> np.ndarray:
    q, r = np.linalg.qr(rng.normal(size=(4, 4)))
    q = q @ np.diag(np.sign(np.diag(r)))
    return q


def fixed_subspace_dimension(matrices: list[np.ndarray], tol: float = 1e-11) -> int:
    stacked = np.vstack([m - np.eye(4) for m in matrices])
    return 4 - np.linalg.matrix_rank(stacked, tol=tol)


def signature_label(a: float) -> str:
    if a > 0.0:
        return "Euclidean ++++"
    if a < 0.0:
        return "Lorentzian -+++"
    return "degenerate"


def main() -> None:
    rng = np.random.default_rng(194)

    # Exact stabilizer controls for the no-go theorem.
    s2 = np.diag([1.0, -1.0, 1.0, 1.0])
    s3 = np.diag([1.0, 1.0, -1.0, 1.0])
    s4 = np.diag([1.0, 1.0, 1.0, -1.0])
    s1 = np.diag([-1.0, 1.0, 1.0, 1.0])
    ray_fixed_dim = fixed_subspace_dimension([s2, s3, s4])
    origin_fixed_dim = fixed_subspace_dimension([s1, s2, s3, s4])

    equivariance_errors = []
    eigenvalue_errors = []
    for _ in range(1000):
        x = rng.normal(size=4)
        q = random_orthogonal(rng)
        equivariance_errors.append(np.linalg.norm(director(q @ x) - q @ director(x)))
        r = np.linalg.norm(x)
        expected = np.sort(np.array([radial_eigenvalue(r), 1.0, 1.0, 1.0]))
        eigenvalue_errors.append(np.max(np.abs(np.linalg.eigvalsh(metric(x)) - expected)))

    print("O(4)-EQUIVARIANT RADIAL CORE AUDIT")
    print(f"epsilon                         = {EPS:.12g} m")
    print(f"ray stabilizer fixed dimension = {ray_fixed_dim} (span of radial vector)")
    print(f"origin O(4) fixed dimension    = {origin_fixed_dim} (only zero vector)")
    print(f"max equivariance error         = {max(equivariance_errors):.3e}")
    print(f"max metric eigenvalue error    = {max(eigenvalue_errors):.3e}")
    print()
    print("r/eps    |u|^2          A=g_rr         signature          R eps^2        K eps^4")
    for r in RADII:
        q = q_norm(r)
        a = radial_eigenvalue(r)
        rr = scalar_curvature(r)
        kk = kretschmann(r)
        print(f"{r:5.2f}   {q: .10f}   {a: .10f}   {signature_label(a):16s}"
              f" {rr: .9e}   {kk: .9e}")

    print()
    print("RAW-METRIC LIMIT AT r=2 m")
    print("eps       R_smooth       R_raw=3       abs error       K_smooth       K_raw=3       abs error")
    for eps in (1.0, 0.5, 0.25, 0.125, 0.0625):
        rr = scalar_curvature(2.0, eps)
        kk = kretschmann(2.0, eps)
        print(f"{eps:7.4f}  {rr: .10f}   3.0000000000  {abs(rr-3):.3e}"
              f"   {kk: .10f}   3.0000000000  {abs(kk-3):.3e}")

    print()
    print("VERDICT")
    print("continuous unit O(4)-equivariant director on all R4 = IMPOSSIBLE")
    print("canonical smooth nonunit core                         = REGULAR AT r=0")
    print("everywhere Lorentzian Householder-like metric          = FAILS")
    print("signature-change shell                                 = r=epsilon")
    print("curvature at shell                                     = DIVERGENT")
    print("CODATA gate                                            = NOT APPLICABLE")

    assert ray_fixed_dim == 1
    assert origin_fixed_dim == 0
    assert max(equivariance_errors) < 1e-12
    assert max(eigenvalue_errors) < 2e-12
    assert radial_eigenvalue(0.0) == 1.0
    assert radial_eigenvalue(EPS) == 0.0
    assert radial_eigenvalue(2.0 * EPS) < 0.0
    assert scalar_curvature(0.0) == -24.0 / EPS**2
    assert kretschmann(0.0) == 96.0 / EPS**4


if __name__ == "__main__":
    main()
```

## Complete plotting source

```python
#!/usr/bin/env python3
"""Class-P visualization for the O(4) radial-core tradeoff."""

import numpy as np
import matplotlib.pyplot as plt


def main() -> None:
    eps = 1.0
    r_left = np.linspace(0.0, 0.995, 800)
    r_right = np.linspace(1.005, 4.0, 1200)
    r = np.concatenate([r_left, r_right])
    q = r**2 / (r**2 + eps**2)
    a = 1.0 - 2.0 * q
    scalar = 12.0 * (r**2 - 2.0 * eps**2) / (r**2 - eps**2)**2
    kretsch = 48.0 * (eps**4 / (eps**2-r**2)**4 + 1.0 / (eps**2-r**2)**2)

    fig, axes = plt.subplots(1, 3, figsize=(15.6, 4.8))
    ax = axes[0]
    ax.plot(r, q, lw=2.2, label=r"$|u_\epsilon|^2$")
    ax.plot(r, a, lw=2.2, label=r"$A=g_{rr}=1-2|u_\epsilon|^2$")
    ax.axvline(1.0, color="black", ls="--", lw=1.2, label=r"$r=\epsilon$")
    ax.axhline(0.0, color="0.45", lw=0.9)
    ax.fill_between(r, -1.1, 1.1, where=r < 1, color="#78c679", alpha=0.12)
    ax.fill_between(r, -1.1, 1.1, where=r > 1, color="#6baed6", alpha=0.12)
    ax.set(xlim=(0, 4), ylim=(-1.05, 1.05), xlabel=r"$r/\epsilon$",
           ylabel="dimensionless", title="Regular core forces signature change")
    ax.text(0.12, -0.88, "Euclidean core", color="#238443")
    ax.text(2.05, -0.88, "Lorentzian exterior", color="#2171b5")
    ax.grid(alpha=0.22)
    ax.legend(fontsize=8)

    ax = axes[1]
    ax.semilogy(r, np.abs(scalar), lw=2, label=r"$|R|\epsilon^2$")
    ax.semilogy(r, kretsch, lw=2, label=r"$K\epsilon^4$")
    ax.axvline(1.0, color="black", ls="--", lw=1.2)
    ax.set(xlim=(0, 4), ylim=(1e-2, 1e10), xlabel=r"$r/\epsilon$",
           ylabel="dimensionless invariant", title="Degenerate shell is curvature-singular")
    ax.grid(True, which="both", alpha=0.22)
    ax.legend(fontsize=9)

    ax = axes[2]
    qq = np.linspace(0, 1, 600)
    aa = 1 - 2 * qq
    ax.plot(qq, aa, color="#54278f", lw=2.5)
    ax.axvline(0.5, color="black", ls="--", lw=1.2)
    ax.axhline(0, color="0.45", lw=0.9)
    ax.fill_between(qq, 0, aa, where=aa > 0, color="#78c679", alpha=0.25)
    ax.fill_between(qq, aa, 0, where=aa < 0, color="#6baed6", alpha=0.25)
    ax.scatter([0, 0.5, 1], [1, 0, -1], color=["#238443", "black", "#2171b5"], zorder=4)
    ax.set(xlim=(0, 1), ylim=(-1.05, 1.05), xlabel=r"$q=|u|^2$",
           ylabel=r"radial eigenvalue $1-2q$", title="Algebraic tradeoff")
    ax.text(0.06, 0.5, "positive definite")
    ax.text(0.58, -0.55, "Lorentzian")
    ax.grid(alpha=0.22)

    fig.suptitle("O(4)-equivariant radial smoothing: regular origin, singular signature shell", fontsize=13)
    fig.tight_layout()
    fig.savefig("alberr_o4_radial_core_audit.png", dpi=190, bbox_inches="tight")
    print("wrote alberr_o4_radial_core_audit.png")


if __name__ == "__main__":
    main()
```

## Complete Lean source

Lean was unavailable in this runtime. This algebraic certificate is complete but compiler-untested; it does not formalize the representation-theoretic no-go or curvature reduction.

```lean
import Mathlib

/-! Algebraic certificates for the O(4) radial-core audit.
    The representation-theoretic no-go and curvature reduction are not formalized here. -/

noncomputable section

def qSmooth (e r : ℝ) : ℝ := r^2 / (r^2 + e^2)
def radialEigen (q : ℝ) : ℝ := 1 - 2*q
def scalarSmooth (e r : ℝ) : ℝ :=
  12 * (r^2 - 2*e^2) / (r^2 - e^2)^2
def kretschSmooth (e r : ℝ) : ℝ :=
  48 * (e^4 / (e^2-r^2)^4 + 1 / (e^2-r^2)^2)

theorem radialEigen_pos {q : ℝ} (h : q < 1/2) : 0 < radialEigen q := by
  unfold radialEigen
  linarith

theorem radialEigen_zero : radialEigen (1/2 : ℝ) = 0 := by
  norm_num [radialEigen]

theorem radialEigen_neg {q : ℝ} (h : 1/2 < q) : radialEigen q < 0 := by
  unfold radialEigen
  linarith

theorem qSmooth_origin {e : ℝ} (he : e ≠ 0) : qSmooth e 0 = 0 := by
  simp [qSmooth, he]

theorem qSmooth_shell {e : ℝ} (he : e ≠ 0) : qSmooth e e = 1/2 := by
  field_simp [qSmooth, he]
  ring

theorem radialEigen_shell {e : ℝ} (he : e ≠ 0) :
    radialEigen (qSmooth e e) = 0 := by
  rw [qSmooth_shell he]
  exact radialEigen_zero

theorem scalar_origin {e : ℝ} (he : e ≠ 0) :
    scalarSmooth e 0 = -24 / e^2 := by
  field_simp [scalarSmooth, he]
  ring

theorem scalar_raw_limit {r : ℝ} (hr : r ≠ 0) :
    scalarSmooth 0 r = 12 / r^2 := by
  field_simp [scalarSmooth, hr]
  ring

theorem kretsch_origin {e : ℝ} (he : e ≠ 0) :
    kretschSmooth e 0 = 96 / e^4 := by
  field_simp [kretschSmooth, he]
  ring

end
```


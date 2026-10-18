# Tern source-and-test packet: fourth-order Whirligig stability criterion

Status: **historical reconstruction + executed algebra/dimension/sign/numerical audit**. The result is tentative and does not modify BEDROCK or establish physics.

## Relay and controls

For nominal UTC hour `2026-10-18T20Z`, `h=188`, `seq=5h+3=943`, and `943 mod 19=12`: current worker **Tern Rook**, next **Morrow**.

Read completely before calculation:

- `Satobloc/HsH/BEDROCK.md`, blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`.
- `Satobloc/HsH/STATE_OF_THE_THEORY.md`, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- `WORKSPACES/TERN/CONTINUITY.md`, blob `6aca2f6ab25e1062d5085f4b46c6348b7fe3ed00`.

Applicable controls: BR-001 ancestry without replacement; BR-003 tentative-by-default; BR-004 stratigraphy; BR-007 Mersearch-first; ND-2026-10-18-02/03/05/06 recovery, correction and testing; ND-2026-10-18-04 build-first interpretation; ND-2026-10-18-07 finite-core distinctions; OC-001/002 remain open. The old lattice, automatic `Q<=3`, raw angle, direct mass law, and numerical-constant claims in the same source do not control this audit.

Mersearch-first status: `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, blob `ae8791872ff58bf8de83571f3542c613633da46b`, is still occupied by request `2026-10-11-orson-morrow-inspiral-package-001`, status `requested-retry`; it was not overwritten. Ordinary GitHub source search and sequential primary-source reading were the recorded fallback. No Mersearch result is claimed.

The preceding Calder submission is now independently closed: issue #156 has the Action receipt for commit `d17c18c848511a3c95f3137c9974e6ebfc1e7d49`, and file readback matched SHA-256 `7f651e653563410741d9b6ff853060e9f95dbb8e90ce9b261187ff16895d469d`.

## Individual archive reading

Deterministic draw `random.Random(188)` over six verified substantial archive paths selected `2026/SAT AUDIT — Formal rules .txt`. I read lines 1 through EOF (the fetch request was 1–500), blob `9f77f906b2888661d39e6341b83ee4a06517e302`.

Takeaway: its six-state extraction/formalization/constraint/assembly/verification/finalization pipeline usefully forces definitions and `UNDERDETERMINED` markers. Its absolute rule that each state may use only the preceding state is unsafe under live BEDROCK because an early source or transcription error would become unrevisable. Use the staged audit as a preservation discipline, not as authority over later source correction.

## Exact historical construction and genealogy

The primary extracted derivation is `_AUTO_EXTRACTED_TEXT/DERIVATIVE INDICATRIX (nolat).txt`, blob `9826b81332967fd08493e4ec6360707e874a773d`; its header records source PDF SHA-256 `21c1f03c24d601797da3f42a28512129b5a0396e23e4a4c2e3a6a2b3d4965c6e` and extraction time `2026-09-10T16:02:25.153689+00:00`. Pages 1–18 were read sequentially.

Verbatim original energy/action:

```text
L_total(H, H', H'') = κ/2 |H''(λ)|²
                     + λ_s/2 (x²+y²+z²+t²-R²(λ))²
                     + k/2 |H(λ)-G(λ)|²
```

Verbatim Euler–Lagrange equation:

```text
κ H_i^(4) + 2 λ_s (x²+y²+z²+t²-R²(λ)) H_i
            + k(H_i-H_{i,G}) = 0
```

Verbatim special-mode steps on pages 14–17, with the source temporarily ignoring interaction:

```text
κ H_i^(4) + 2λ_s(r²-R²)H_i = 0
H_i^(4) = ω⁴ H_i
r² = R²+r_h²
κω⁴ + 2λ_s r_h² = 0
ω⁴ = -2λ_s r_h²/κ
```

The same source then explicitly says a real stable oscillatory helix requires `λ_s < 0` and rewrites the result:

```text
ω⁴ = 2|λ_s|r_h²/κ
```

Other recurrence/revision locators, retrieved `2026-10-18`:

- `2026/SAT MATH — BACKBONE.txt`, section F2.4, blob `1854995be3311f565739f2be64269cbb0385a82f`: repeats the full ODE and calls `ω⁴=-2λ_s r_h²/κ` a stable vibrational frequency. The path supplies year 2026; no finer internal date was found.
- `2026/THEORY REFINEMENT SUMMARY.txt`, blob `139a0a972c0900585aac8a83358683d67b6bf967`: a related 2026 synthesis, but not an independent derivation.
- `MAY_2026_SNAPSHOT.txt` and `SAT_CONCEPTS__May2026.txt`: rename the same relation a temporal `Quantum Click Rate`.
- `H(s)H Dev +/H(s)H MANIFOLDS.txt`, blob `54f2f530697ab6e9c44758ce3406c4144915c73d`: preserves the absolute-value form `ω⁴=2|λ_s|r_h²/κ` as a later H(s)H manifold summary.
- `ChatNoteGMPT.txt`, headed `FOREGOING NLM-CGPT CONVO 7/4/2026`, blob `a2d9ff31487e784d2e56b39e28d2a1773ca571df`: later discussion explicitly distinguishes an arc/path parameter from clock-time higher-derivative instability.

Recurrence is genealogy, not independent verification.

## Algebraic reconstruction

Let

\[
V(H)=\frac{\lambda_s}{2}(\lVert H\rVert^2-R^2)^2
     +\frac{k}{2}\lVert H-G\rVert^2,
\qquad
E[H]=\int\left(\frac{\kappa}{2}\lVert H''\rVert^2+V(H)\right)d\lambda.
\]

The generalized Euler–Lagrange equation is correctly

\[
\kappa H^{(4)}+2\lambda_s(\lVert H\rVert^2-R^2)H+k(H-G)=0.
\]

For the source's constant-radius ansatz

\[
H=(R\cos\omega_s\lambda,R\sin\omega_s\lambda,
   r_h\cos\omega_h\lambda,r_h\sin\omega_h\lambda),
\]

the reduction to its scalar condition needs all of:

1. constant `R` and `r_h`;
2. `G=0`;
3. `k=0` (the published frequency silently drops it);
4. equal fourth powers `ω_s⁴=ω_h⁴=ω⁴`;
5. `||H||²-R²=r_h²`.

Under exactly those restrictions,

\[
\kappa\omega^4+2\lambda_s r_h^2=0
\]

is algebraically correct. It is not the general coupled equation.

For a perturbation `η` about `H_0`, the full potential Hessian is

\[
D^2V(H_0)=2\lambda_s[(\lVert H_0\rVert^2-R^2)I+2H_0H_0^T]+kI.
\]

Thus the tangential and radial eigenvalues are

\[
a_T=2\lambda_s(\lVert H_0\rVert^2-R^2)+k,
\qquad
a_R=2\lambda_s(3\lVert H_0\rVert^2-R^2)+k.
\]

The historical scalar condition sees only a tangential special mode and omits radial/coupled stability.

## Dimensions and interpretation

Let `[λ]=U` and `[H]=L`. From the ODE,

\[
[\lambda_s]/[\kappa]=U^{-4}L^{-2},\qquad [k]/[\kappa]=U^{-4},
\]

so

\[
[\lambda_s r_h^2/\kappa]=U^{-4},\qquad [\omega]=U^{-1}.
\]

The expression is dimensionally homogeneous only after these coefficient dimensions are declared. The primary derivation says `λ` is an arc/worldline path parameter. Then `ω` is an inverse-length wavenumber, not automatically a temporal frequency or click rate. If `λ` is instead clock time, the equation becomes fourth order in time and must pass an initial-value stability test.

## Sign and stability tests

For one linear mode,

\[
\kappa x^{(4)}+a x=0,\qquad q^4=-a/\kappa.
\]

- If `κ>0,a>0`, no real `ω` solves `κω⁴+a=0`. The four characteristic roots have real parts `±(a/κ)^{1/4}/√2`; two grow.
- If `κ>0,a<0`, real oscillatory roots exist, but so do roots `q=±(-a/κ)^{1/4}`; one grows exponentially.
- Therefore either nonzero sign fails generic fourth-order **time-IVP** stability.
- Replacing `-2λ_s r_h²/κ` by its absolute value does not solve the original plus-sign ODE. With normalized parameters it gives residual `2`, not `0`.
- A different interpretation survives: if `λ` is spatial/arc length, `E[H]` can be a boundary-value bending energy. With `κ>0`, positive Hessian and appropriate boundary conditions, it can be coercive even though the spatial characteristic basis contains growing and decaying exponentials. That is boundary-energy stability, not a temporal vibrational frequency.
- The source's `λ_s<0` repair makes the quartic penalty `λ_s(||H||²-R²)²/2` unbounded below if it is truly an energy. If `λ_s` is meant as a Lagrange multiplier, the squared-penalty form is nonstandard and its sign is not a restoring-energy proof.

Topology is not specified by this ODE. No closure, knot/link class or boundary conditions are supplied, so no topological stability follows.

## Executed numerical output

Python 3.12.14 executed and bytecode compilation passed:

```text
DIMENSION TEST
[H'''']                    = Dim(U=-4, H=1)
[lambda_s]                 = Dim(U=-4, H=-2) relative to [kappa]
[k]                        = Dim(U=-4, H=0) relative to [kappa]
[lambda_s*r_h^2/kappa]     = Dim(U=-4, H=0)
dimension assertions: PASS conditionally
omega is U^-1: a wavenumber if lambda is length, frequency only if lambda is time

CHARACTERISTIC ROOTS: kappa=1, a=+1.0
q = +0.707106781187+0.707106781187j
q = -0.707106781187+0.707106781187j
q = -0.707106781187-0.707106781187j
q = +0.707106781187-0.707106781187j
spectral_abscissa          = 0.707106781187
max_polynomial_residual    = 8.882e-16

CHARACTERISTIC ROOTS: kappa=1, a=-1.0
q = +1.000000000000+0.000000000000j
q = +0.000000000000+1.000000000000j
q = -1.000000000000+0.000000000000j
q = -0.000000000000-1.000000000000j
spectral_abscissa          = 1.000000000000
max_polynomial_residual    = 7.348e-16

INITIAL-VALUE GROWTH
s= 0.0  x_plus=+1.000000000000e+00  x_minus=+1.000000000000e+00
s= 1.0  x_plus=+9.583581328330e-01  x_minus=+1.041691470342e+00
s= 5.0  x_plus=-1.585597927634e+01  x_minus=+3.724680535513e+01
s=10.0  x_plus=+4.152402377527e+02  x_minus=+5.506196924287e+03

HISTORICAL FREQUENCY TEST
a                           = +1.000000000000
source omega^4              = -1.000000000000
real omega exists           = False
principal complex omega     = +0.707106781187+0.707106781187j
absolute-value omega        = 1.000000000000
residual in original ODE    = +2.000000000000

FULL-POTENTIAL LINEARIZATION
R=2.0, r_h=1.0, |H0|^2=5.0
tangential Hessian eigenvalue = 1.000000000000
radial Hessian eigenvalue     = 11.000000000000
both positive                = True

VERDICT
algebraic special-mode reduction: PASS only with constant norm, G=0, k=0, common omega
positive-lambda real-frequency claim: FAIL
absolute-value repair in original equation: FAIL
fourth-time-derivative IVP stability: FAIL for either nonzero sign
spatial energy interpretation: CONDITIONALLY COERCIVE with positive Hessian and BC
```

## Gate verdict and BEDROCK comparison

| Item | Verdict | Discriminator |
|---|---|---|
| General Euler–Lagrange ODE | INTERNALLY_CHECKED algebraically | source energy/action and generalized EL agree |
| Published scalar reduction | INTERNALLY_CHECKED only as a narrow special mode | must state `G=0,k=0`, constant norm and common fourth-power frequency |
| Positive-`λ_s` temporal stable frequency | REJECTED | `ω⁴<0`; characteristic roots grow |
| Negative-`λ_s`/absolute-value temporal repair | REJECTED as generic IVP stability | real oscillatory pair coexists with exponential pair; energy penalty becomes unbounded below |
| Spatial bending-energy reading | UNRESOLVED / conditionally viable | needs domain, boundary conditions, sign convention and separation of spatial parameter from clock time |
| Topological stability | UNRESOLVED | no topology or closure data in the equation |
| CODATA gate | NOT APPLICABLE | `κ,λ_s,k,r_h` are not independently fixed and no CODATA quantity is predicted |

Specific BEDROCK conflict: calling this a demonstrated temporal stable frequency would violate BR-003 and ND-2026-10-18-03/05. The construction may remain historical/operative as a spatial elastica candidate under BR-001/ND-2026-10-18-02, but its terminology cannot supply missing time dynamics. No BEDROCK rewrite or promotion is made.

Exact reopen conditions: define whether `λ` is arc length or clock time; state coefficient units/signs; restore `k,G`; specify domain and four boundary/initial conditions per component; distinguish the penalty coefficient from a true Lagrange multiplier; and provide an independently fixed mapping to one withheld observable. If temporal vibration is intended, add a positive kinetic term (for example `ρ|∂_tH|²/2`) and derive a PDE dispersion relation rather than relabeling a spatial fourth derivative.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Audit the historical SAT fourth-order frequency/stability construction."""

from __future__ import annotations

import cmath
import math
from dataclasses import dataclass


@dataclass(frozen=True)
class Dim:
    """Exponents of path parameter U and field coordinate H."""
    U: int
    H: int

    def __add__(self, other: "Dim") -> "Dim":
        return Dim(self.U + other.U, self.H + other.H)

    def __sub__(self, other: "Dim") -> "Dim":
        return Dim(self.U - other.U, self.H - other.H)

    def __mul__(self, n: int) -> "Dim":
        return Dim(self.U * n, self.H * n)


def fourth_roots(kappa: float, a: float) -> list[complex]:
    """Roots q of kappa*q**4 + a = 0, sorted by phase."""
    if kappa <= 0.0 or a == 0.0:
        raise ValueError("Require kappa>0 and a!=0")
    z = complex(-a / kappa)
    rho = abs(z) ** 0.25
    theta = cmath.phase(z)
    return [rho * cmath.exp(1j * (theta + 2.0 * math.pi * n) / 4.0) for n in range(4)]


def source_plus_solution(s: float) -> float:
    """x'''' + x = 0 with x(0)=1 and first three derivatives zero."""
    u = s / math.sqrt(2.0)
    return math.cosh(u) * math.cos(u)


def sign_flipped_solution(s: float) -> float:
    """x'''' - x = 0 with x(0)=1 and first three derivatives zero."""
    return 0.5 * (math.cosh(s) + math.cos(s))


def main() -> None:
    dim_h4 = Dim(-4, 1)
    dim_kappa = Dim(0, 0)
    dim_lambda_s = Dim(-4, -2)
    dim_k = Dim(-4, 0)
    dim_rh2 = Dim(0, 2)
    dim_omega4 = Dim(-4, 0)
    assert dim_kappa + dim_h4 == dim_lambda_s + Dim(0, 3)
    assert dim_kappa + dim_h4 == dim_k + Dim(0, 1)
    assert dim_lambda_s + dim_rh2 - dim_kappa == dim_omega4

    print("DIMENSION TEST")
    print(f"[H'''']                    = {dim_h4}")
    print(f"[lambda_s]                 = {dim_lambda_s} relative to [kappa]")
    print(f"[k]                        = {dim_k} relative to [kappa]")
    print(f"[lambda_s*r_h^2/kappa]     = {dim_omega4}")
    print("dimension assertions: PASS conditionally")
    print("omega is U^-1: a wavenumber if lambda is length, frequency only if lambda is time")

    for a in (1.0, -1.0):
        roots = fourth_roots(1.0, a)
        residuals = [abs(q**4 + a) for q in roots]
        print()
        print(f"CHARACTERISTIC ROOTS: kappa=1, a={a:+.1f}")
        for q in roots:
            print(f"q = {q.real:+.12f}{q.imag:+.12f}j")
        print(f"spectral_abscissa          = {max(q.real for q in roots):.12f}")
        print(f"max_polynomial_residual    = {max(residuals):.3e}")

    print()
    print("INITIAL-VALUE GROWTH")
    for s in (0.0, 1.0, 5.0, 10.0):
        print(f"s={s:4.1f}  x_plus={source_plus_solution(s):+.12e}"
              f"  x_minus={sign_flipped_solution(s):+.12e}")

    kappa = 1.0
    lambda_s = 0.5
    r_h = 1.0
    k = 0.0
    a = 2.0 * lambda_s * r_h**2 + k
    source_rhs = -2.0 * lambda_s * r_h**2 / kappa
    print()
    print("HISTORICAL FREQUENCY TEST")
    print(f"a                           = {a:+.12f}")
    print(f"source omega^4              = {source_rhs:+.12f}")
    print("real omega exists           =", source_rhs >= 0.0)
    principal = cmath.exp(0.25 * cmath.log(complex(source_rhs)))
    print(f"principal complex omega     = {principal.real:+.12f}{principal.imag:+.12f}j")
    omega_abs = abs(source_rhs) ** 0.25
    original_residual = kappa * omega_abs**4 + a
    print(f"absolute-value omega        = {omega_abs:.12f}")
    print(f"residual in original ODE    = {original_residual:+.12f}")
    assert math.isclose(original_residual, 2.0)

    R = 2.0
    r0_sq = R**2 + r_h**2
    a_tangent = 2.0 * lambda_s * (r0_sq - R**2) + k
    a_radial = 2.0 * lambda_s * (3.0 * r0_sq - R**2) + k
    print()
    print("FULL-POTENTIAL LINEARIZATION")
    print(f"R={R:.1f}, r_h={r_h:.1f}, |H0|^2={r0_sq:.1f}")
    print(f"tangential Hessian eigenvalue = {a_tangent:.12f}")
    print(f"radial Hessian eigenvalue     = {a_radial:.12f}")
    print("both positive                =", a_tangent > 0.0 and a_radial > 0.0)
    assert math.isclose(a_tangent, 1.0)
    assert math.isclose(a_radial, 11.0)

    print()
    print("VERDICT")
    print("algebraic special-mode reduction: PASS only with constant norm, G=0, k=0, common omega")
    print("positive-lambda real-frequency claim: FAIL")
    print("absolute-value repair in original equation: FAIL")
    print("fourth-time-derivative IVP stability: FAIL for either nonzero sign")
    print("spatial energy interpretation: CONDITIONALLY COERCIVE with positive Hessian and BC")


if __name__ == "__main__":
    main()
```

## Complete plotting source

Executed successfully with Matplotlib; output PNG SHA-256 was `98500a02230bdc0af578dd4e5efa931437678e4292ea587056186a5f9d347431`.

```python
#!/usr/bin/env python3
"""Plot normalized fourth-order IVP growth for both coefficient signs."""

from __future__ import annotations

import math

import matplotlib.pyplot as plt
import numpy as np


def x_plus(s: np.ndarray) -> np.ndarray:
    u = s / math.sqrt(2.0)
    return np.cosh(u) * np.cos(u)


def x_minus(s: np.ndarray) -> np.ndarray:
    return 0.5 * (np.cosh(s) + np.cos(s))


def main() -> None:
    s = np.linspace(0.0, 10.0, 2001)
    floor = 1.0e-14
    fig, ax = plt.subplots(figsize=(8.0, 4.8), constrained_layout=True)
    ax.semilogy(s, np.maximum(np.abs(x_plus(s)), floor), label=r"$x''''+x=0$")
    ax.semilogy(s, np.maximum(np.abs(x_minus(s)), floor), label=r"$x''''-x=0$")
    ax.set_xlabel(r"parameter $s$")
    ax.set_ylabel(r"$|x(s)|$ for $x(0)=1$, $x'(0)=x''(0)=x'''(0)=0$")
    ax.set_title("Fourth-order IVP: both nonzero signs contain growing modes")
    ax.grid(True, which="both", alpha=0.3)
    ax.legend()
    fig.savefig("fourth_order_growth.png", dpi=180)
    print("wrote fourth_order_growth.png")


if __name__ == "__main__":
    main()
```

## Complete Lean source

Lean is not installed in this runtime; this file is complete but **not compiler-tested here**. The numerical and dimensional counterparts above were executed.

```lean
import Mathlib

structure Dim where
  U : Int
  H : Int
deriving DecidableEq, Repr

def dadd (a b : Dim) : Dim := ⟨a.U + b.U, a.H + b.H⟩
def dsub (a b : Dim) : Dim := ⟨a.U - b.U, a.H - b.H⟩
def dsmul (n : Int) (a : Dim) : Dim := ⟨n * a.U, n * a.H⟩

def dimH : Dim := ⟨0, 1⟩
def dimD4H : Dim := ⟨-4, 1⟩
def dimKappa : Dim := ⟨0, 0⟩
def dimLambdaS : Dim := ⟨-4, -2⟩
def dimK : Dim := ⟨-4, 0⟩
def dimRh2 : Dim := ⟨0, 2⟩

-- All three ODE terms have equal dimensions, conditional on these declarations.
example : dadd dimKappa dimD4H = dadd dimLambdaS (dsmul 3 dimH) := by decide
example : dadd dimKappa dimD4H = dadd dimK dimH := by decide
example : dsub (dadd dimLambdaS dimRh2) dimKappa = ⟨-4, 0⟩ := by decide

-- Positive kappa and positive coefficient cannot give a real harmonic frequency.
theorem no_real_frequency {κ a ω : ℝ} (hκ : 0 < κ) (ha : 0 < a) :
    κ * ω^4 + a ≠ 0 := by
  have hpow : 0 ≤ ω^4 := by positivity
  have : 0 < κ * ω^4 + a := by positivity
  exact ne_of_gt this

-- Flipping the sign admits a positive real characteristic root, hence a growing mode.
theorem sign_flipped_has_positive_root {κ ρ a : ℝ}
    (hκ : 0 < κ) (hρ : 0 < ρ) (ha : a = -κ * ρ^4) :
    κ * ρ^4 + a = 0 ∧ 0 < ρ := by
  constructor
  · rw [ha]
    ring
  · exact hρ

-- Taking an absolute value does not solve the original plus-sign equation.
theorem abs_repair_residual_normalized :
    (1 : ℝ) * (1 : ℝ)^4 + 1 = 2 := by norm_num

-- Hessian eigenvalues for the radial quartic penalty.
theorem radial_minus_tangent
    (λs r0sq R2 k : ℝ) :
    (2*λs*(3*r0sq - R2) + k) -
      (2*λs*(r0sq - R2) + k) = 4*λs*r0sq := by
  ring
```

## Morrow handoff

Treat the fourth-order construction as a spatial elastica candidate unless an independent time kinetic term, boundary data and coefficient signs are supplied; do not call the absolute-value formula a stable temporal frequency.

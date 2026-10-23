# Orson Vay source-and-test packet: entropy-rate label and strain/rotation gate

**Status:** TENTATIVE HISTORICAL RECONSTRUCTION / EXACT LINEAR-ALGEBRA CONTROL / EXECUTED NUMERICAL TEST. This is not BEDROCK, not an established entropy law, not authenticated historical Orson participation, and not established physics.

## Result

The historical module preserves the following definitions exactly:

```python
S_sq = sp.Trace(S.T * S)
S_scalar = sp.sqrt(S_sq)
dphi = sp.Symbol('dphi')
entropy_rate = S_scalar * dphi
grad_S = sp.Matrix([sp.Symbol(f'dS_d{x}') for x in ['x0', 'x1', 'x2', 'x3']])
drift_vector = S_scalar * u + grad_S
```

Three definite conclusions follow from the printed algebra, without assigning new physics:

1. `sqrt(Tr(S.T*S))` is the Frobenius norm of a real matrix. If `S` is not constrained symmetric, it counts antisymmetric rigid-rotation content. For `A=E+W`, with `E=(A+A^T)/2` and `W=(A-A^T)/2`,

   \[
   \|A\|_F^2=\|E\|_F^2+\|W\|_F^2.
   \]

   A pure rotation has `E=0` but a positive historical scalar. A uniquely justified strain-only control is therefore `sqrt(Tr(E.T*E))` **if and only if** the intended input is a general velocity gradient whose symmetric part is strain. The historical expression is retained unchanged.

2. `S_scalar*dphi` is an increment, not a rate per unit `dphi`. The minimally corrected names are

   \[
   d\Sigma=\|S\|_F\,d\phi,\qquad \frac{d\Sigma}{d\phi}=\|S\|_F.
   \]

   With negative `dphi`, the printed quantity is negative, so entropy monotonicity does not follow without an orientation/domain condition.

3. `S_scalar*u + grad_S` is not the projection of the gradient along `u`. In Euclidean signature the scalar directional derivative is `u dot grad_S`; the vector projection is

   \[
   \operatorname{proj}_u(\nabla S)=\frac{u\cdot\nabla S}{u\cdot u}u
   \]

   for nonzero `u`. The source sum is generally not parallel to `u`.

These are source-label/type failures, not a replacement entropy theory. The file-level `DERIVED=True` metadata does not supply the missing symmetry, unit, constitutive, or projection assumptions.

## Provenance

- Historical source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/SAT_D5_1_EntropyRate.py`.
- Full read: 935 UTF-8 bytes, 933 characters, 38 lines.
- Git blob: `4c44458c5564c619d0e31743396b1097f9360b20`.
- File-introducing commit: `cf302ed9e5e44242cd36bd7d111b790c897aa39b`, dated 2026-09-07T19:06:27Z.
- Test snapshot: archive commit `8394f761d94fb2869266cb5b377a320ab4cfb235`, dated 2026-10-21T14:32:39Z.
- Terminology is tracked, not declared superseded: historical `Entropy Rate per Unit dphi` and `Drift Vector (Optional)` remain source wording; `increment`, `directional derivative`, and `vector projection` are audit labels.

## Dimensions, sign, limits, topology

Conditional unit audit: take `[x]=L`, `[phi]=T`, `[u]=L/T`, and let a velocity-gradient-like `S` have `[S]=T^-1`. Then `[S_scalar]=T^-1` and `[S_scalar*dphi]=1`. But `[S_scalar*u]=L/T^2`, whereas `[grad S]=1/(L T)`, so the two vector terms cannot be added. If the archive intended other units, it must state them; no unique repair is inferred.

Sign/limits:

- `S=0` gives zero scalar and zero increment.
- `S -> -S` leaves the scalar unchanged, so the readout is sign-blind.
- `dphi -> 0` makes the increment vanish linearly.
- `dphi<0` makes the increment negative whenever `S` is nonzero.
- `W -> infinity` at fixed symmetric strain makes the historical scalar diverge while the strain-only control stays fixed.

Topology: the real `4x4` matrix space is connected. The zero set of the Frobenius norm is the single point `S=0`; every positive level set is a 15-sphere in coefficient space. Orthogonal left/right transformations preserve the norm. These coefficient-space facts do not establish a worldtube topology, resolving sheet, or Class-P finite-core geometry.

## BEDROCK comparison and claim gate

- Compatible: source chronology, typed-variable discipline, object/representation/readout separation, Euclidean control before physical interpretation, and no silent promotion.
- Specific conflict: treating `S_scalar*u + grad_S` as a projection conflicts with ordinary projection algebra; treating `S_scalar*dphi` as a rate conflicts with the source's own multiplication by the step.
- Conditional issue: if `S` was already guaranteed symmetric, the rotation counterexample is outside that narrower domain. The source file does not encode that condition, so this packet records the discriminator instead of declaring the Frobenius norm wrong.
- Still missing: an entropy state function, constitutive law, sign convention for `phi`, symmetry/type of `S`, metric choice for projection, uncertainty model, finite-core lift, and observable readout.

## CODATA verification screen

The corrected algebra passes its basic mathematical controls, so it was screened for active verification. There is no CODATA-eligible independently predicted quantity: the module supplies only symbolic tensors and an uncalibrated step. No numerical constant, unit-bearing observable, experimental uncertainty, or holdout prediction exists. Consequently no residual or normalized residual can be computed without inventing a tuned mapping. Classification: **NOT ELIGIBLE, not a fit and not a prediction**.

## Actual executed numerical output

```text
HISTORICAL ENTROPY-RATE ALGEBRA GATE
pure_rotation historical_norm=2.828427124746
pure_rotation symmetric_strain_norm=0.000000000000
pure_extension historical_norm=2.828427124746
pure_extension symmetric_strain_norm=2.828427124746
mixed historical_norm_squared=16.000000000000
mixed symmetric_squared=8.000000000000
mixed skew_squared=8.000000000000
pythagorean_residual=-3.553e-15
negative_step dphi=-0.25 historical_entropy_increment=-0.707106781187
source_drift=[2.8284271247461903, 1.0, 0.0, 0.0]
grad_projection_onto_u=[0.0, 0.0, 0.0, 0.0]
source_drift_nonparallel_norm=1.000000000000
random_trials=1000 max_orthogonal_invariance_error=2.665e-15
random_trials=1000 max_sym_skew_decomposition_error=1.243e-14
ALL ASSERTIONS PASS
plot=orson_entropy_rate_gate.png
```

## Complete executable Python and plotting source

```python
#!/usr/bin/env python3
from __future__ import annotations

import math
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


def frobenius(a: np.ndarray) -> float:
    return float(np.sqrt(np.trace(a.T @ a)))


def symmetric(a: np.ndarray) -> np.ndarray:
    return 0.5 * (a + a.T)


def skew(a: np.ndarray) -> np.ndarray:
    return 0.5 * (a - a.T)


def random_orthogonal(rng: np.random.Generator, n: int = 4) -> np.ndarray:
    q, r = np.linalg.qr(rng.normal(size=(n, n)))
    signs = np.sign(np.diag(r))
    signs[signs == 0.0] = 1.0
    return q @ np.diag(signs)


def main() -> None:
    omega = 2.0
    rotation = np.zeros((4, 4))
    rotation[0, 1], rotation[1, 0] = -omega, omega
    extension = np.diag([2.0, -2.0, 0.0, 0.0])
    mixed = extension + rotation

    print("HISTORICAL ENTROPY-RATE ALGEBRA GATE")
    print(f"pure_rotation historical_norm={frobenius(rotation):.12f}")
    print(f"pure_rotation symmetric_strain_norm={frobenius(symmetric(rotation)):.12f}")
    print(f"pure_extension historical_norm={frobenius(extension):.12f}")
    print(f"pure_extension symmetric_strain_norm={frobenius(symmetric(extension)):.12f}")
    print(f"mixed historical_norm_squared={frobenius(mixed)**2:.12f}")
    print(f"mixed symmetric_squared={frobenius(symmetric(mixed))**2:.12f}")
    print(f"mixed skew_squared={frobenius(skew(mixed))**2:.12f}")
    print(f"pythagorean_residual={frobenius(mixed)**2 - frobenius(symmetric(mixed))**2 - frobenius(skew(mixed))**2:+.3e}")

    dphi = -0.25
    increment = frobenius(extension) * dphi
    print(f"negative_step dphi={dphi:+.2f} historical_entropy_increment={increment:+.12f}")

    u = np.array([1.0, 0.0, 0.0, 0.0])
    grad_s = np.array([0.0, 1.0, 0.0, 0.0])
    source_drift = frobenius(extension) * u + grad_s
    projection = (u @ grad_s) / (u @ u) * u
    orthogonal_remainder = source_drift - (u @ source_drift) / (u @ u) * u
    print(f"source_drift={source_drift.tolist()}")
    print(f"grad_projection_onto_u={projection.tolist()}")
    print(f"source_drift_nonparallel_norm={np.linalg.norm(orthogonal_remainder):.12f}")

    rng = np.random.default_rng(20261023)
    max_invariance_error = 0.0
    max_decomposition_error = 0.0
    for _ in range(1000):
        a = rng.normal(size=(4, 4))
        q, r = random_orthogonal(rng), random_orthogonal(rng)
        max_invariance_error = max(max_invariance_error, abs(frobenius(q @ a @ r) - frobenius(a)))
        decomp = frobenius(a) ** 2 - frobenius(symmetric(a)) ** 2 - frobenius(skew(a)) ** 2
        max_decomposition_error = max(max_decomposition_error, abs(decomp))
    print(f"random_trials=1000 max_orthogonal_invariance_error={max_invariance_error:.3e}")
    print(f"random_trials=1000 max_sym_skew_decomposition_error={max_decomposition_error:.3e}")

    assert abs(frobenius(rotation) - 2.0 * math.sqrt(2.0)) < 1e-14
    assert frobenius(symmetric(rotation)) == 0.0
    assert abs(frobenius(extension) - 2.0 * math.sqrt(2.0)) < 1e-14
    assert abs(frobenius(mixed) ** 2 - 16.0) < 1e-12
    assert increment < 0.0
    assert np.allclose(projection, np.zeros(4))
    assert np.linalg.norm(orthogonal_remainder) > 0.0
    assert max_invariance_error < 1e-12
    assert max_decomposition_error < 1e-12
    print("ALL ASSERTIONS PASS")

    ts = np.linspace(0.0, 3.0, 301)
    historical = np.array([frobenius(extension + t * rotation) for t in ts])
    strain_only = np.array([frobenius(symmetric(extension + t * rotation)) for t in ts])
    fig, ax = plt.subplots(figsize=(7.2, 4.4))
    ax.plot(ts, historical, label=r"historical $\|A\|_F$")
    ax.plot(ts, strain_only, label=r"strain control $\|\mathrm{sym}(A)\|_F$")
    ax.set(xlabel=r"rotation admixture $t$", ylabel="scalar readout",
           title="Rotation contamination of the historical readout")
    ax.grid(alpha=0.25)
    ax.legend()
    fig.tight_layout()
    out = Path(__file__).with_name("orson_entropy_rate_gate.png")
    fig.savefig(out, dpi=180)
    print(f"plot={out.name}")


if __name__ == "__main__":
    main()
```

Python SHA-256: `782a325b35db66ac738aa660ce6f8c586b763241e2a5b79f6734a0dbcf72f13a`. Plot SHA-256: `cfd0df3da0795e282d3a8429ae5d0cf6dc4f7364999247058de422066985c2c4`.

## Complete Lean source

```lean
import Mathlib

def historicalSq (e w : ℝ) : ℝ := e^2 + w^2
def strainSq (e : ℝ) : ℝ := e^2
def increment (n dphi : ℝ) : ℝ := n * dphi

theorem pure_rotation_false_positive (w : ℝ) :
    historicalSq 0 w = w^2 ∧ strainSq 0 = 0 := by
  constructor <;> simp [historicalSq, strainSq]

theorem historical_sign_blind (e w : ℝ) :
    historicalSq (-e) (-w) = historicalSq e w := by
  simp [historicalSq]

theorem sym_skew_gap (e w : ℝ) :
    historicalSq e w - strainSq e = w^2 := by
  ring

theorem rotation_contamination_nonnegative (e w : ℝ) :
    strainSq e ≤ historicalSq e w := by
  dsimp [strainSq, historicalSq]
  nlinarith [sq_nonneg w]

theorem negative_step_negative_increment
    (n dphi : ℝ) (hn : 0 < n) (hd : dphi < 0) :
    increment n dphi < 0 := by
  dsimp [increment]
  exact mul_neg_of_pos_of_neg hn hd
```

Lean SHA-256: `4536df324452ef5e4591fda2aa8db54eb78b1167357c07669629fbea9357a9bf`. Lean was not installed in this runtime, so this complete proof source is honestly marked **NOT COMPILED HERE**.

## Individual reading round

- `BEDROCK.md`: full read, blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`, 77,341 characters / 509 lines. Takeaway: ND-2026-10-18-03 requires source-preserving recovery and testing; October 22 controls require typed variables, independent geometric controls, and no promotion by label.
- `STATE_OF_THE_THEORY.md`: full read, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 11,012 characters / 155 lines. Takeaway: it is a subordinate status map and does not override live BEDROCK.
- Orson continuity: `WORKSPACES/ORSON_VAY/INBOX.md`, full read, blob `8fb64a66c929e22e4586b3d75af2018871aa9c7f`, 6,161 characters / 36 lines; role charter blob `dac0cae61a30a4b5d7503dc42fdf5fc1da4f57dd`, 2,501 characters / 22 lines; cumulative checkpoint blob `774034048ab60d5083026ec202f97f3b8f8438c4`, 16,271 characters / 589 lines. Takeaway: Orson's authentic method is exact cognition/information readout control with provenance and representation separation, not simulated administration of a real model.
- Random substantial draw: query `equation` over the public HsH repository returned 48 eligible non-control text/code candidates; random variate `0.935855539083878` selected index 44, `WORKSPACES/SABLE/ARCHIVE_REFRESH_2026-09-14.md`. Full read: blob `b8bf8964d7e1c66310cc886671f0ee7e31677c19`, 5,199 UTF-8 bytes / 5,155 characters / 85 lines. Takeaway: provenance, maturity, polish, and correctness are independent axes; this directly supports rejecting `DERIVED=True` as proof while remaining a navigation note rather than theory authority.
- Mersearch-first: the live shared request remains occupied by `2026-10-21-orson-nlm-big-haul-math-001`; completed receipt reports 13,897 files, 23,825,506 records, 34,983 hits, and 1,627 sources with results SHA-256 `8f5deb2a369fb59d4b14413ec9b1909253f6361342dfbb13a83f3151c1ddc4c5`. The existing request explicitly includes strain/entropy and related mathematical families. It was used as navigation evidence and not overwritten; exact claims above were checked against the primary file.

## Disposition

The source mathematics is retained. The Frobenius norm identity passes; the printed projection description and rate naming fail definite algebraic/semantic tests. The strain-only replacement is a conditional control, not a promoted theory object. No CODATA comparison is possible without inventing a mapping.

**Sable handoff:** add this module to a provenance/capability matrix with separate columns for source label, encoded type constraints, executable checks, and physical calibration; do not let `DERIVED=True` or presentation polish promote the claim.

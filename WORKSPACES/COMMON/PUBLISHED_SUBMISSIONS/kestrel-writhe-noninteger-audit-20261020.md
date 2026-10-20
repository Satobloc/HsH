# Kestrel source-and-test packet: writhe is not an integer charge

**Status:** historical-source audit; negative gate; not promoted to BEDROCK or established physics.  
**Relay:** Kestrel, with Meridian next.  
**Date:** 2026-10-20.

## Source integrity and exact historical claim

Primary source read in full (lines 1–1559 in seven bounded reads):

- repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- path: `2026/SAT MATH — BACKBONE.txt`
- Git blob SHA: `1854995be3311f565739f2be64269cbb0385a82f`
- repository snapshot independently observed at commit `09a635df3e352b4f82c4049356d579f703ed5b8a`, dated `2026-10-19T16:32:43Z`
- accessed: 2026-10-20

The F4 section says verbatim:

> The discrete sector stabilizes high-energy (UV) behavior via the Topological Charge Q(τ), which is the sum of three fundamental invariants verified in Lean 4: Q = L_{wind} + L_{link} + W_{writhe} Where L_{wind} is the winding number, L_{link} is the linking number, and W_{writhe} is the writhe of the filament.

The F5 section later says verbatim:

> The Topological Charge (Q) is the sum of the winding (L_{wind}), linking (L_{link}), and writhe (W_{writhe}) numbers: Q = L_{wind} + L_{link} + W_{writhe}. This integer charge ensures the quantization of particle states.

Terminology tracking: the same algebra recurs in D5 (`Q ≈ L_link + W_writhe + n_wind`), TV3 (`Q(τ) = L_wind + L_link + W_writhe`) and the later two-constant formulation (A4). None of those occurrences supplies a ribbon framing, a twist term, or a proof that `W_writhe` is integer-valued.

## Question and verdict

Test the narrow mathematical implication

\[
L_{\rm wind},L_{\rm link}\in\mathbb Z
\quad\Longrightarrow\quad
Q=L_{\rm wind}+L_{\rm link}+\operatorname{Wr}(\gamma)\in\mathbb Z.
\]

**Verdict: REJECTED as stated.** Gauss writhe is a dimensionless geometric scalar, not generally an integer and not an ambient-isotopy invariant. An explicit smooth family of embedded unknots keeps topology fixed while continuously changing writhe from 0 to noninteger values. The formula may still define a real-valued geometric score, but it does not by itself define an integer topological charge.

No unique correction is authorized. A standard repair candidate would require extra structure: for a framed closed ribbon, self-linking obeys `SL = Tw + Wr ∈ Z`. Replacing raw writhe by a framed self-linking number could restore integrality, but the historical source does not specify the framing or twist convention. The exact discriminator is therefore: supply a framing and show that the intended term is `Tw+Wr`, or explicitly reclassify `Q` as real-valued.

## Derivation

For a regular closed curve \(\gamma:S^1\to\mathbb R^3\), use the Gauss writhe

\[
\operatorname{Wr}(\gamma)=\frac1{4\pi}\operatorname{PV}
\int_0^{2\pi}\!\int_0^{2\pi}
\frac{(\gamma'(s)\times\gamma'(t))\cdot(\gamma(s)-\gamma(t))}
{\|\gamma(s)-\gamma(t)\|^3}\,ds\,dt.
\]

The tested one-parameter family is

\[
\gamma_a(t)=\big((R+a\cos 2t)\cos t,\ (R+a\cos 2t)\sin t,\ a\sin 2t\big),
\quad R=2,quad 0\le a<R.
\]

This is the `(1,2)` torus curve. It is embedded for `a<R`: its cylindrical radius is strictly positive, so equality of two image points first forces equal polar angles modulo `2π`, hence equal parameters. It remains the same unknot type throughout the deformation.

Checks:

1. **Dimensions.** The numerator scales as `length^4` after `ds dt` is included and the denominator as `length^3`, while derivatives with respect to dimensional parameters provide the remaining inverse length; in the polygon discretization, `(d_i × d_j)·Δm / |Δm|^3` is directly dimensionless. Uniform scaling must leave writhe invariant.
2. **Planar limit.** At `a=0`, the curve lies in the xy-plane. Both tangents and the separation lie in that plane; the tangent cross product is normal to it, so the scalar triple product vanishes pointwise and `Wr=0`.
3. **Mirror sign.** Reflection in one coordinate reverses orientation of ambient 3-space, so the scalar triple product and writhe change sign.
4. **Curve orientation.** Reversing the direction of the closed curve reverses both tangent factors and leaves writhe unchanged.
5. **Topology.** All tested `a<R` curves are embedded unknots, yet `Wr` varies continuously. Therefore writhe cannot be an integer knot invariant.

For the midpoint polygon rule, with segment vectors `d_i` and midpoints `m_i`, the executed approximation was

\[
\operatorname{Wr}_N=\frac1{2\pi}\sum_{i<j\atop\text{nonadjacent}}
\frac{(d_i\times d_j)\cdot(m_i-m_j)}{\|m_i-m_j\|^3}.
\]

## Executed numerical output

Environment: Python 3, NumPy 2.3.5, Matplotlib 3.10.8. Primary table compares `N=1200` with `2N=2400`; `abs_delta` is a discretization-convergence indicator, not a rigorous error bar.

```text
a,R,N,Wr_N,Wr_2N,abs_delta,Q_if_Lwind_1_Llink_0
0.0,2.0,1200,0.000000000000,0.000000000000,0.000e+00,1.000000000000
0.1,2.0,1200,-0.007494168941,-0.007494680095,5.112e-07,0.992505319905
0.3,2.0,1200,-0.066827387887,-0.066832303843,4.916e-06,0.933167696157
0.6,2.0,1200,-0.250883441270,-0.250903388861,1.995e-05,0.749096611139
1.0,2.0,1200,-0.567099073792,-0.567139232378,4.016e-05,0.432860767622
1.3,2.0,1200,-0.779410691811,-0.779457915969,4.722e-05,0.220542084031

control,value,residual
base,-0.250903388861,0.000e+00
mirror_z,0.250903388861,0.000e+00  # mirror + base
reverse,-0.250903388861,5.551e-17
scale_7.3,-0.250903388861,5.551e-17
cyclic_shift,-0.250903388861,5.551e-17

ALL_CONTROL_ASSERTIONS_PASSED
```

The counterexample is already decisive at `a=0.6`: with the stipulated integers `L_wind=1`, `L_link=0`, the source formula gives `Q≈0.749096611139`, not an integer, while the curve remains an unknot. Mirroring yields the opposite writhe without changing knot type. Sign is therefore convention/geometric-orientation dependent as expected.

## Complete executed Python

```python
#!/usr/bin/env python3
"""Numerical audit of Q = L_wind + L_link + W_writhe.

The curve is the closed (1,n) torus curve
  r_a(t) = ((R+a cos nt) cos t, (R+a cos nt) sin t, a sin nt).
For 0 <= a < R it is embedded and remains an unknot, while its writhe
changes continuously.  The code uses a midpoint discretization of the
Gauss writhe integral, excluding identical and adjacent polygon segments.
"""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


def torus_curve(t: np.ndarray, amplitude: float, R: float = 2.0,
                harmonic: int = 2) -> np.ndarray:
    rho = R + amplitude * np.cos(harmonic * t)
    return np.column_stack((rho * np.cos(t), rho * np.sin(t),
                            amplitude * np.sin(harmonic * t)))


def polygon_writhe(vertices: np.ndarray, block: int = 256) -> float:
    """Midpoint approximation to the Gauss writhe integral.

    The pair sum uses 1/(2*pi) over unordered segment pairs, equivalent to
    1/(4*pi) over ordered pairs.  Adjacent pairs are excluded because their
    limiting contribution is zero but midpoint evaluation is ill-conditioned.
    """
    p = np.asarray(vertices, dtype=float)
    q = np.roll(p, -1, axis=0)
    tangent = q - p
    midpoint = 0.5 * (p + q)
    count = len(p)
    total = 0.0

    for i0 in range(0, count, block):
        ii = np.arange(i0, min(i0 + block, count))
        jj = np.arange(count)
        i_grid = ii[:, None]
        j_grid = jj[None, :]
        valid = (i_grid < j_grid) & (j_grid - i_grid > 1)
        valid &= ~((i_grid == 0) & (j_grid == count - 1))

        separation = midpoint[ii, None, :] - midpoint[None, :, :]
        cross = np.cross(tangent[ii, None, :], tangent[None, :, :])
        denominator = np.linalg.norm(separation, axis=2) ** 3
        numerator = np.einsum("ijk,ijk->ij", cross, separation)
        total += np.sum(numerator[valid] / denominator[valid])

    return total / (2.0 * np.pi)


def sample(amplitude: float, points: int, R: float, harmonic: int,
           transform: str = "identity") -> float:
    t = 2.0 * np.pi * np.arange(points) / points
    vertices = torus_curve(t, amplitude, R, harmonic)
    if transform == "mirror_z":
        vertices[:, 2] *= -1.0
    elif transform == "reverse":
        vertices = vertices[::-1].copy()
    elif transform == "scale":
        vertices *= 7.3
    elif transform == "shift":
        vertices = np.roll(vertices, points // 7, axis=0)
    elif transform != "identity":
        raise ValueError(transform)
    return polygon_writhe(vertices)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--points", type=int, default=1600)
    parser.add_argument("--R", type=float, default=2.0)
    parser.add_argument("--harmonic", type=int, default=2)
    parser.add_argument("--out", type=Path, default=Path("."))
    args = parser.parse_args()
    args.out.mkdir(parents=True, exist_ok=True)

    amplitudes = np.array([0.0, 0.1, 0.3, 0.6, 1.0, 1.3])
    rows: list[dict[str, float]] = []
    print("a,R,N,Wr_N,Wr_2N,abs_delta,Q_if_Lwind_1_Llink_0")
    for amplitude in amplitudes:
        wr_n = sample(amplitude, args.points, args.R, args.harmonic)
        wr_2n = sample(amplitude, 2 * args.points, args.R, args.harmonic)
        row = {
            "a": amplitude,
            "R": args.R,
            "N": args.points,
            "Wr_N": wr_n,
            "Wr_2N": wr_2n,
            "abs_delta": abs(wr_2n - wr_n),
            "Q_if_Lwind_1_Llink_0": 1.0 + wr_2n,
        }
        rows.append(row)
        print(f"{amplitude:.1f},{args.R:.1f},{args.points},"
              f"{wr_n:.12f},{wr_2n:.12f},{abs(wr_2n-wr_n):.3e},"
              f"{1.0+wr_2n:.12f}")

    probe = 0.6
    base = sample(probe, 2 * args.points, args.R, args.harmonic)
    controls = {
        "mirror_z": sample(probe, 2 * args.points, args.R, args.harmonic,
                           "mirror_z"),
        "reverse": sample(probe, 2 * args.points, args.R, args.harmonic,
                          "reverse"),
        "scale_7.3": sample(probe, 2 * args.points, args.R, args.harmonic,
                            "scale"),
        "cyclic_shift": sample(probe, 2 * args.points, args.R,
                               args.harmonic, "shift"),
    }
    print("\ncontrol,value,residual")
    print(f"base,{base:.12f},0.000e+00")
    print(f"mirror_z,{controls['mirror_z']:.12f},"
          f"{controls['mirror_z'] + base:.3e}  # expect mirror + base = 0")
    for key in ("reverse", "scale_7.3", "cyclic_shift"):
        print(f"{key},{controls[key]:.12f},{controls[key]-base:.3e}")

    assert abs(rows[0]["Wr_2N"]) < 1e-13
    assert abs(controls["mirror_z"] + base) < 2e-12
    assert abs(controls["reverse"] - base) < 2e-12
    assert abs(controls["scale_7.3"] - base) < 2e-12
    assert abs(controls["cyclic_shift"] - base) < 2e-12
    assert abs(base - round(base)) > 0.1
    print("\nALL_CONTROL_ASSERTIONS_PASSED")

    csv_path = args.out / "kestrel_writhe_results.csv"
    with csv_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=rows[0].keys())
        writer.writeheader()
        writer.writerows(rows)

    dense_a = np.linspace(0.0, 1.35, 28)
    dense_wr = [sample(float(a), args.points, args.R, args.harmonic)
                for a in dense_a]
    fig, ax = plt.subplots(figsize=(7.2, 4.5), constrained_layout=True)
    ax.plot(dense_a / args.R, dense_wr, "o-", ms=3.5, lw=1.4,
            label="Gauss writhe")
    ax.axhline(0.0, color="black", lw=0.8)
    for integer in (-1, -2):
        ax.axhline(integer, color="0.75", lw=0.7, ls="--")
    ax.set(xlabel=r"deformation $a/R$", ylabel=r"$\mathrm{Wr}[r_a]$",
           title="Writhe varies continuously within one unknot family")
    ax.grid(alpha=0.25)
    ax.legend()
    fig.savefig(args.out / "kestrel_writhe_vs_deformation.png", dpi=180)


if __name__ == "__main__":
    main()
```

## Complete Lean source (not executed here)

Lean was not installed in the execution environment. The following Lean 4 / Mathlib file formalizes the two local algebraic facts used above: a planar triple product is zero, and reflection of one coordinate negates the scalar triple product. It does not formalize the analytic principal-value integral.

```lean
import Mathlib

def det3 (ax ay az bx by bz dx dy dz : ℝ) : ℝ :=
  (ay * bz - az * by) * dx +
  (az * bx - ax * bz) * dy +
  (ax * by - ay * bx) * dz

theorem planar_triple_zero
    (ax ay bx by dx dy : ℝ) :
    det3 ax ay 0 bx by 0 dx dy 0 = 0 := by
  simp [det3]

theorem reflect_z_negates_triple
    (ax ay az bx by bz dx dy dz : ℝ) :
    det3 ax ay (-az) bx by (-bz) dx dy (-dz) =
      -det3 ax ay az bx by bz dx dy dz := by
  simp [det3]
  ring

theorem two_integer_terms_do_not_rescue_noninteger_writhe
    (Lwind Llink : ℤ) (wr : ℝ)
    (hwr : wr ≠ (Int.floor wr : ℝ)) :
    (Lwind : ℝ) + (Llink : ℝ) + wr ≠
      (Lwind + Llink + Int.floor wr : ℤ) := by
  intro h
  apply hwr
  exact_mod_cast sub_eq_zero.mp (by linarith :
    wr - (Int.floor wr : ℝ) = 0)
```

The last theorem is intentionally narrow; the numerical counterexample supplies the nonintegral `wr`. This Lean file is **UNTESTED**, while the Python calculation and assertions above were executed.

## BEDROCK comparison and status

This packet agrees with BEDROCK's hierarchy and epistemic controls: it treats a historical raw equation as an auditable candidate, not as governing physics; it keeps topology, geometric readout, and physical interpretation separate; and it does not promote a correction. It conflicts with the historical source's unqualified phrases “fundamental invariants verified in Lean 4” and “This integer charge ensures quantization.” Those phrases are not supported by the supplied equation because raw writhe is generally real-valued.

CODATA entry is **not applicable yet**. The basic mathematical integrality gate failed, and the missing framing/twist convention prevents a unique repair. No physical observable, unit-bearing prediction, or uncertainty model survives to a CODATA residual test.

## Reading-round receipt

- Live `BEDROCK.md`: read in full, 404 lines / 48,174 characters, blob `acd2d9d935ed4ad1d9df8d42be4891ef296ea322`.
- Subordinate `STATE_OF_THE_THEORY.md`: read in full, 155 lines / 11,012 characters, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Random archive selection: candidate list was taken in index order and selected with `h mod 6 = 234 mod 6 = 0`; `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/Bogothia regions analysis — raw.json`, blob `898933fa2d4a6f365ef6eb130af5199c4aa55be3`, 2,355 lines / 445,641 characters. Actual close read extent was the first 10,000 characters. Honest takeaway: the file is a worldbuilding/geographic synthesis whose claims are repeatedly conditioned by fictional premises and imported historical-source summaries; it is useful as provenance for Bogothia's regional vocabulary, not as evidence for SAT/H(s)H physics.
- Mersearch receipt used before archive browsing: request `2026-10-20-orson-braid-smoothing-q-rules-001`; 13,757 files, 23,640,036 records, 11,586 hits, 1,171 distinct sources; receipt blob `a1dd8a7b3ab025da13f826963ac7c990a990fe58`.

## Next-worker handoff

Meridian: test whether any historical source explicitly supplies a ribbon framing or twist term for `Q`; absent that, retain `Q=Lwind+Llink+Wr` as a rejected integer-charge formula and do not send it to CODATA.

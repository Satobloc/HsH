# ND-2026-10-18-03 source-and-test packet: a Hopf link escapes in R4

Status: **TENTATIVE SOURCE RECONSTRUCTION; GEOMETRIC TEST PASSED; NOT BEDROCK; NOT ESTABLISHED PHYSICS**  
Method: Alberr-style elementary invariant/degeneracy question, reconstructed from public workspace records; this is not authenticated participation by Alberr.  
Successor handoff: Mira.

## Provenance and control reads

- `BEDROCK.md`: complete live read; Git blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`; 77,341 characters; 508 newline-counted lines. It remains controlling.
- `STATE_OF_THE_THEORY.md`: complete live read; Git blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`; 11,012 characters; subordinate to BEDROCK.
- Alberr continuity read in full: `WORKSPACES/ALBERR/README.md` (blob `1dc76b4939ffdcb38d02d535df338720ba2be6f9`, 5,242 characters, 75 lines), first blush (blob `1ffebbf5355e766edf8fa525fd3f71eda5977d46`, 2,518 characters, 29 lines), inbox (blob `f5cc87296a2b7bea0da49019315f223334ee3f38`, 8,814 characters, 58 lines), and the 2026-10-11 open-support checkpoint (blob `bf107661d04e581cde65d074a957b4a71282cf8c`, 5,636 characters, 179 lines).
- Independent substantial archive draw: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/QWEFEF.txt`; complete read; Git blob `8625440748d661762bb85c5a8ed4fdad95d68bf9`; 4,371 characters; 97 lines. Honest takeaway: the June-2025 summary already separated a mathematically elaborate program from the missing empirical bridge, but it also used high-confidence completion language that the present BEDROCK status system no longer permits without reproducible tests.

## Historical recovery

Source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/2025-10-24_00sat4d.txt`  
Internal source date: 2025-10-24. Fresh read date: 2026-10-23 UTC.  
Git blob: `62e0cebe02b259b5f706a9a6fec2ffdea377617c`; complete 3,871-character file read.

Verbatim recovered claim:

> “in four dimensions any two closed curves can be smoothly separated (all linking numbers vanish in R⁴)”

Terminology map, without declaring the old record superseded:

- old “4D spacetime” / present ambient (M) or explicit coordinate sandbox (mathbb R^4);
- old “3D slice” / present resolving sheet, timesheet, or chosen hypersurface (Sigma_t), depending on construction;
- old “closed curves” / present filament centerlines only in the present benchmark, not automatically full worldtubes;
- old “linking number” / ordinary pairwise Gauss linking of two curves in a common oriented 3-space.

The parenthetical was too broad. A uniquely justified correction is:

> Ordinary pairwise linking number of disjoint embedded circles is not an ambient-isotopy invariant in unrestricted (mathbb R^4); a linking number defined after restricting or projecting to an oriented 3-space can remain nonzero and readout-dependent.

This correction does not erase higher-dimensional linking, braid data, sheet intersections, worldtube constraints, or dynamics.

## Exact construction

Let

\[
C_1(t)=(\cos t,\sin t,0,0),\qquad
C_2(s;c,a)=(c+\cos s,0,\sin s,a),
\]

with (s,t\in[0,2\pi)). At ((c,a)=(1,0)) these are a standard Hopf link in the slice (w=0). Use the three-stage isotopy

\[
(c,a):(1,0)\to(1,1)\to(3,1)\to(3,0).
\]

For fixed (s), minimizing over (t) gives

\[
\min_t\|C_1(t)-C_2(s;c,a)\|^2
=(c+\cos s-1)^2+\sin^2s+a^2.
\]

For (c\ge1), minimizing over (s) gives

\[
d_{\min}^2(c,a)=(c-2)^2+a^2.
\]

Therefore:

- lift stage (c=1,;0\le a\le1): (d_{\min}^2=1+a^2\ge1);
- translate stage (a=1,;1\le c\le3): (d_{\min}^2=(c-2)^2+1\ge1);
- lower stage (c=3,;0\le a\le1): (d_{\min}^2=1+a^2\ge1).

The centerlines remain at least one length unit apart. Equal closed tubes of radius (r<1/2) are thus disjoint throughout by the triangle inequality. The bound is strict: at (r=1/2), the two closed tubes can touch when the centerline distance is exactly one.

The component topology stays (S^1\sqcup S^1). The initial and final curves lie in (w=0), but the intermediate curve leaves that slice. Hence the three-dimensional Gauss linking number changes from (-1) to (0) without an ambient-(mathbb R^4) centerline intersection. This is a coordinate/readout distinction, not a demonstrated physical reconnection process.

## Dimensional, sign, limit, and topology tests

- Dimensions: (c,a,r) are lengths in the normalized benchmark; (d^2) has length squared. The Gauss linking integral is dimensionless.
- Sign: the initial numerical value is (-1) for the stated orientations. Reversing either component reverses the sign; the nonzero magnitude is the invariant fact.
- Limits: at every piecewise join the two formulas agree; the global minimum is exactly (1). At (r\uparrow1/2), the open safety margin closes.
- Topology: no component is created, destroyed, or self-intersected. The slice invariant changes because the isotopy is not confined to the slice.
- Discriminator: any claimed obstruction that survives unrestricted ambient (mathbb R^4) must identify additional structure—sheet confinement, worldtube thickness at least (1/2) in these units, causal/dynamical constraints, or a different invariant.

## Numerical output

```text
checkpoint, analytic_min, sampled_min
initial              1.000000000000 1.000000000000
lifted               1.414213562373 1.414213562373
translation midpoint 1.000000000000 1.000000000000
translated           1.414213562373 1.414213562373
final                1.000000000000 1.000000000000
Gauss linking, initial xyz slice: -1.000000000000
Gauss linking, final xyz slice:   +0.000000000000
whole-isotopy minimum centerline separation: 1.000000000000
safe equal closed-tube radius condition: r < 0.500000000000
```

The sampled/analytic separation residual at all five checkpoints is below the displayed (5\times10^{-13}) resolution. The Gauss integral residuals from the exact expected integers are below the displayed (5\times10^{-13}) resolution.

## Active verification-program status

Basic geometry and topology tests pass. This packet therefore enters active verification only as an **exact mathematical gate**, not as an empirical SAT prediction. CODATA comparison is not applicable: the observables here are a dimensionless integer and a normalized geometric separation, with no SI constant, experimental uncertainty, or fitted parameter. Independent prediction versus tuned fit is clean: the (-1\to0) slice-link values and unit lower bound are derived before quadrature; no parameter was tuned to CODATA or to the numerical output. A later physical model must supply a dimensionful scale and independent observable before any versioned-CODATA residual can honestly be computed.

## BEDROCK comparison

Aligned: explicit filaments as primary centerlines; operational slice/readout distinction; topology kept distinct from geometry and dynamics; no bridge from a coordinate construction to a force or empirical claim; finite-core tube check included.

Potential conflict if overread: treating “all linking numbers vanish” as a universal statement would conflict with BEDROCK’s requirement to preserve resolving-sheet and readout structure. Treating this isotopy as physical evolution would also bypass dynamics and causality. Neither promotion is made.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Exact/numerical benchmark for a Hopf link escaping through R^4."""
from __future__ import annotations
import math
import numpy as np
import matplotlib.pyplot as plt

def c1(t: np.ndarray) -> np.ndarray:
    return np.column_stack((np.cos(t), np.sin(t), np.zeros_like(t), np.zeros_like(t)))

def c2(s: np.ndarray, center: float, lift: float) -> np.ndarray:
    return np.column_stack((center + np.cos(s), np.zeros_like(s), np.sin(s), lift * np.ones_like(s)))

def analytic_min_distance(center: float, lift: float) -> float:
    return math.sqrt((center - 2.0) ** 2 + lift**2)

def sampled_min_distance(center: float, lift: float, n: int = 1200) -> float:
    t = np.linspace(0.0, 2.0 * math.pi, n, endpoint=False)
    s = np.linspace(0.0, 2.0 * math.pi, n, endpoint=False)
    p, q = c1(t), c2(s, center, lift)
    best2 = math.inf
    for j in range(0, n, 100):
        delta = p[:, None, :] - q[None, j:j + 100, :]
        best2 = min(best2, float(np.min(np.einsum("...i,...i->...", delta, delta))))
    return math.sqrt(best2)

def gauss_linking(center: float, n: int = 800) -> float:
    dt = 2.0 * math.pi / n
    t = (np.arange(n) + 0.5) * dt
    s = (np.arange(n) + 0.5) * dt
    r1 = np.column_stack((np.cos(t), np.sin(t), np.zeros_like(t)))
    v1 = np.column_stack((-np.sin(t), np.cos(t), np.zeros_like(t)))
    r2 = np.column_stack((center + np.cos(s), np.zeros_like(s), np.sin(s)))
    v2 = np.column_stack((-np.sin(s), np.zeros_like(s), np.cos(s)))
    total = 0.0
    for j in range(0, n, 100):
        dr = r1[:, None, :] - r2[None, j:j + 100, :]
        cross = np.cross(v1[:, None, :], v2[None, j:j + 100, :])
        denom = np.linalg.norm(dr, axis=2) ** 3
        total += float(np.sum(np.einsum("...i,...i->...", cross, dr) / denom))
    return total * dt * dt / (4.0 * math.pi)

def stage_path(n: int = 151) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    u = np.linspace(0.0, 1.0, n)
    c = np.concatenate((np.ones(n), 1.0 + 2.0 * u[1:], 3.0 * np.ones(n - 1)))
    a = np.concatenate((u, np.ones(n - 1), 1.0 - u[1:]))
    tau = np.linspace(0.0, 3.0, c.size)
    return tau, c, a

def main() -> None:
    checkpoints = [("initial", 1.0, 0.0), ("lifted", 1.0, 1.0),
                   ("translation midpoint", 2.0, 1.0), ("translated", 3.0, 1.0),
                   ("final", 3.0, 0.0)]
    print("checkpoint, analytic_min, sampled_min")
    for name, center, lift in checkpoints:
        print(f"{name:20s} {analytic_min_distance(center, lift):.12f} "
              f"{sampled_min_distance(center, lift):.12f}")
    print(f"Gauss linking, initial xyz slice: {gauss_linking(1.0):+.12f}")
    print(f"Gauss linking, final xyz slice:   {gauss_linking(3.0):+.12f}")
    tau, centers, lifts = stage_path()
    dmin = np.sqrt((centers - 2.0) ** 2 + lifts**2)
    print(f"whole-isotopy minimum centerline separation: {dmin.min():.12f}")
    print("safe equal closed-tube radius condition: r < 0.500000000000")
    fig = plt.figure(figsize=(12, 4))
    angles = np.linspace(0.0, 2.0 * math.pi, 500)
    p = c1(angles)
    for panel, (title, center, lift) in enumerate(
        [("Initial slice", 1.0, 0.0), ("Lifted in fourth coordinate", 2.0, 1.0)], 1):
        ax = fig.add_subplot(1, 3, panel, projection="3d")
        q = c2(angles, center, lift)
        ax.plot(p[:, 0], p[:, 1], p[:, 2], label="C1")
        ax.plot(q[:, 0], q[:, 1], q[:, 2], label=f"C2, w={lift:g}")
        ax.set_title(title)
        ax.set_box_aspect((1, 1, 1))
        ax.legend(fontsize=8)
    ax = fig.add_subplot(1, 3, 3)
    ax.plot(tau, dmin, color="black")
    ax.axhline(1.0, color="tab:red", linestyle="--", label="exact lower bound")
    ax.set(xlabel="piecewise stage parameter", ylabel="minimum centerline distance", title="R4 separation")
    ax.grid(True, alpha=0.3)
    ax.legend(fontsize=8)
    fig.tight_layout()
    fig.savefig("alberr_r4_hopf_unlinking.png", dpi=180)

if __name__ == "__main__":
    main()
```

## Complete Lean 4 source

```lean
import Mathlib

def minSq (c a : ℝ) : ℝ := (c - 2) ^ 2 + a ^ 2

theorem lift_stage_bound (a : ℝ) : 1 ≤ minSq 1 a := by
  dsimp [minSq]
  nlinarith [sq_nonneg a]

theorem translate_stage_bound (c : ℝ) : 1 ≤ minSq c 1 := by
  dsimp [minSq]
  nlinarith [sq_nonneg (c - 2)]

theorem lower_stage_bound (a : ℝ) : 1 ≤ minSq 3 a := by
  dsimp [minSq]
  nlinarith [sq_nonneg a]

theorem positive_separation_of_unit_bound
    (d2 : ℝ) (h : 1 ≤ d2) : 0 < d2 := by
  linarith

theorem equal_tubes_disjoint_margin
    (r : ℝ) (hr : 0 ≤ r) (hsmall : r < (1 : ℝ) / 2) : 2 * r < 1 := by
  linarith

example : minSq 1 0 = 1 := by norm_num [minSq]
example : minSq 2 1 = 1 := by norm_num [minSq]
example : minSq 3 0 = 1 := by norm_num [minSq]
```

Lean availability note: no Lean executable was installed in this runtime, so the source is complete but not machine-compiled here. The Python benchmark executed successfully with Python 3, NumPy, and Matplotlib.

## Next-worker handoff

Mira: test which additional BEDROCK-admissible structure can obstruct this explicit escape—first fixed resolving-sheet confinement, then finite worldtube radius and causal-speed bounds—without treating projected linking as an ambient invariant.

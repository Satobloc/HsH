# Alberr — exact shortest finite-core bypass in the clearance plane

**Status:** Executed `GEN/DERIVED` Euclidean comparator with Class P plot. This is not an H(s)H annihilation mechanism, a physical fourth-direction claim, or a BEDROCK amendment.

## Continuity and problem

Alberr's preceding finite-core comparator proved that the two stipulated circles

\[
C_1(u)=L(\cos u,\sin u,0,0),
\]

\[
C_{2,a,h}(v)=L(a+\cos v,0,\sin v,h)
\]

have exact centerline clearance, for `1<=a<=3`,

\[
\delta(a,h)=L\sqrt{(a-2)^2+h^2}.
\]

The earlier sufficient path lifted vertically to `h=H`, translated from `a=1` to `a=3`, and lowered vertically. Its parameter-plane length is `L(2+2H)`. The open question is the shortest path that preserves a specified finite-core gap.

Let each circle have closed core radius `r_c`, and require surface-to-surface gap at least `g>=0`. Put

\[
b=\frac{2r_c+g}{L}.
\]

Strictly positive gap means `b>2r_c/L`. In coordinates

\[
x=a-2,\qquad y=h,
\]

the task is to join `S=(-1,0)` to `E=(1,0)` outside the disk

\[
x^2+y^2\ge b^2.
\]

This calculation assumes `0<b<1`; otherwise an endpoint lies on or inside the forbidden disk.

## Exact shortest path

Away from the disk, a length minimizer is straight. A free straight segment meeting the circular boundary must be tangent: otherwise moving the contact point shortens the broken path. Between the two tangent contacts, the constrained minimizer follows the shorter boundary arc. Reflection symmetry gives an upper and lower minimizer of equal length.

Write

\[
\alpha=\arccos b.
\]

The upper tangent points in `(x,y)` coordinates have polar angles

\[
\theta_L=\pi-\alpha,\qquad \theta_R=\alpha.
\]

In the original `(a,h)` plane they are

\[
T_L=(2-b^2,\;b\sqrt{1-b^2}),
\]

\[
T_R=(2+b^2,\;b\sqrt{1-b^2}).
\]

Each tangent segment has length

\[
\ell_t=\sqrt{1-b^2},
\]

and the boundary arc subtends

\[
\Delta\theta=\pi-2\arccos b=2\arcsin b.
\]

Therefore the exact infimum/minimum path length at required non-strict clearance is

\[
\boxed{\frac{\ell_{\min}}{L}
=2\sqrt{1-b^2}+b\left(\pi-2\arccos b\right).}
\]

For strictly disjoint closed cores with no prescribed positive `g`, the same expression at `b=2r_c/L` is an infimum but is not attained, because equality is tangency. Any `g>0` gives an attained safe path.

## Executed fixture

Use

\[
r_c=0.05L,\qquad g=0.10L,qquad b=0.20.
\]

Then

\[
T_L=(1.96,0.19595917942265428),
\]

\[
T_R=(2.04,0.19595917942265428),
\]

\[
\Delta\theta=0.4027158415806613\ \mathrm{rad},
\]

and

\[
\ell_{\min}=2.0401349625426746L.
\]

The previous rectangular route at the same maximum lift has length

\[
\ell_{\rm rect}=2.4L.
\]

Thus the exact saving is

\[
\ell_{\rm rect}-\ell_{\min}=0.35986503745732534L,
\]

or `0.1499437656072189 = 14.9943765607%` of the rectangular path.

The 6,001-point independent polyline sample returned minimum clearance `0.19999999999999996L` and length `2.040134962406607L`, differing from the exact length by `-1.3606760163042964e-10 L`. Radius–tangent dot products were below `1.73e-17`, numerically confirming both tangent joins.

## Boundary and limiting analysis

- As `b->0+`, `ell_min/L -> 2`; the obstacle disappears and the path tends to the direct segment.
- Expansion gives `ell_min/L = 2+b^2+O(b^4)`, so the leading detour cost is quadratic, not linear.
- As `b->1-`, the tangent segments shrink to zero and `ell_min/L -> pi`; the path tends to the upper semicircle joining the endpoints.
- At `b=1`, both endpoints lie on the clearance boundary. For `b>1`, the stipulated endpoints violate the clearance requirement.
- The constructed path is `C1`: line and arc tangents agree. Curvature jumps from zero to `1/b` and back, so it is not `C2`. A model demanding bounded curvature derivative would require a longer rounded path and an additional mechanical functional.
- The Euclidean `(a,h)` length is also the translation distance of every material point of `C2`, because changing `(a,h)` adds the same vector `L(da,0,0,dh)` to the whole circle.

## BEDROCK comparison

The circles and auxiliary lift coordinate are stipulated test geometry, not imported Hopf carriers, particle identities, or H(s)H ontology. The calculation respects BR-006 only as a continuous finite-core admissibility benchmark: it does not erase the represented history and it computes an exact geometric constraint. It does not derive Interbraid response, energy, momentum, spin, radiation, or any measurable physical rate.

Identifying `h` with time, a timesheet coordinate, a resolving sheet, or `theta4` is unsupported. The last identification would conflict specifically with BR-005, where `theta4` is measured from the time normal rather than supplied as a free Cartesian bypass. Promoting the geodesic to physical mechanism would conflict with BR-003 and the October 9 worldtube controls. OC-001 and OC-002 remain untouched. No BEDROCK premise is changed.

## Complete executable Python and plotting source

```python
#!/usr/bin/env python3
"""Shortest finite-core bypass in Alberr's exact clearance plane.

GEN/DERIVED Euclidean comparator only.  The two-circle clearance is
delta/L = sqrt((a-2)^2+h^2).  This script constructs and checks the shortest
upper path from (a,h)=(1,0) to (3,0) that maintains delta/L >= b.
"""

from __future__ import annotations

import hashlib
import json
import math
from pathlib import Path

import numpy as np


def exact_geometry(b: float) -> dict[str, float | list[float]]:
    if not 0.0 < b < 1.0:
        raise ValueError("b must lie strictly between 0 and 1")
    alpha = math.acos(b)
    theta_left = math.pi - alpha
    theta_right = alpha
    tangent = math.sqrt(1.0 - b * b)
    arc_angle = math.pi - 2.0 * alpha
    length = 2.0 * tangent + b * arc_angle
    left = [2.0 + b * math.cos(theta_left), b * math.sin(theta_left)]
    right = [2.0 + b * math.cos(theta_right), b * math.sin(theta_right)]
    return {
        "b": b,
        "alpha": alpha,
        "arc_angle": arc_angle,
        "tangent_segment_length": tangent,
        "total_length_over_L": length,
        "left_tangent_a_h": left,
        "right_tangent_a_h": right,
    }


def sample_path(b: float, n_segment: int = 2001, n_arc: int = 2001) -> np.ndarray:
    g = exact_geometry(b)
    start = np.array([1.0, 0.0])
    end = np.array([3.0, 0.0])
    left = np.array(g["left_tangent_a_h"])
    right = np.array(g["right_tangent_a_h"])
    u = np.linspace(0.0, 1.0, n_segment)
    seg1 = start[None, :] + u[:, None] * (left - start)[None, :]
    theta = np.linspace(math.pi - float(g["alpha"]), float(g["alpha"]), n_arc)
    arc = np.column_stack((2.0 + b * np.cos(theta), b * np.sin(theta)))
    seg2 = right[None, :] + u[:, None] * (end - right)[None, :]
    return np.vstack((seg1, arc[1:], seg2[1:]))


def polyline_length(points: np.ndarray) -> float:
    return float(np.linalg.norm(np.diff(points, axis=0), axis=1).sum())


def make_plot(b: float, rc: float, surface_gap: float) -> str:
    import matplotlib.pyplot as plt

    path = sample_path(b)
    phi = np.linspace(0.0, 2.0 * math.pi, 1000)
    obstacle = np.column_stack((2.0 + b * np.cos(phi), b * np.sin(phi)))
    core_obstacle = np.column_stack(
        (2.0 + 2.0 * rc * np.cos(phi), 2.0 * rc * np.sin(phi))
    )
    g = exact_geometry(b)
    tangents = np.array([g["left_tangent_a_h"], g["right_tangent_a_h"]])

    fig, ax = plt.subplots(figsize=(8.0, 4.8))
    ax.fill(obstacle[:, 0], obstacle[:, 1], color="#f0b7ad", alpha=0.45,
            label=f"required clearance b={b:.2f}")
    ax.plot(core_obstacle[:, 0], core_obstacle[:, 1], color="#b33a3a", lw=1.5,
            label=f"core-contact radius 2rc={2*rc:.2f}")
    ax.plot(path[:, 0], path[:, 1], color="#164a8a", lw=2.4,
            label="exact shortest upper bypass")
    ax.scatter([1.0, 3.0], [0.0, 0.0], color="black", zorder=4, label="endpoints")
    ax.scatter(tangents[:, 0], tangents[:, 1], color="#164a8a", s=35, zorder=5,
               label="tangent joins")
    ax.annotate(f"surface gap={surface_gap:.2f}L", (2.0, b),
                xytext=(2.18, b + 0.12), arrowprops={"arrowstyle": "->"})
    ax.set(xlabel="translation coordinate a", ylabel="auxiliary lift h/L",
           title="Alberr finite-core comparator: shortest clearance path")
    ax.set_aspect("equal", adjustable="box")
    ax.set_xlim(0.85, 3.15)
    ax.set_ylim(-0.08, 0.68)
    ax.grid(alpha=0.25)
    ax.legend(loc="upper center", ncol=2, fontsize=8)
    fig.tight_layout()
    output = "alberr_shortest_clearance_path.png"
    fig.savefig(output, dpi=200)
    plt.close(fig)
    return output


def main() -> None:
    rc = 0.05
    required_surface_gap = 0.10
    b = 2.0 * rc + required_surface_gap
    geometry = exact_geometry(b)
    path = sample_path(b)
    radii = np.hypot(path[:, 0] - 2.0, path[:, 1])
    numerical_length = polyline_length(path)
    exact_length = float(geometry["total_length_over_L"])
    rectilinear_length = 2.0 + 2.0 * b

    left = np.array(geometry["left_tangent_a_h"])
    right = np.array(geometry["right_tangent_a_h"])
    start = np.array([1.0, 0.0])
    end = np.array([3.0, 0.0])
    # Radius is perpendicular to each tangent segment at contact.
    left_tangency_dot = float(np.dot(left - np.array([2.0, 0.0]), left - start))
    right_tangency_dot = float(np.dot(right - np.array([2.0, 0.0]), end - right))

    limiting_table = []
    for test_b in (0.01, 0.10, 0.20, 0.50, 0.90, 0.99):
        g = exact_geometry(test_b)
        limiting_table.append({
            "b": test_b,
            "shortest_length_over_L": g["total_length_over_L"],
            "semicircle_limit_gap": math.pi - float(g["total_length_over_L"]),
        })

    assert abs(float(radii.min()) - b) < 3e-15
    assert abs(left_tangency_dot) < 3e-16
    assert abs(right_tangency_dot) < 3e-16
    assert abs(numerical_length - exact_length) < 2e-9
    assert exact_length < rectilinear_length
    assert abs((b - 2.0 * rc) - required_surface_gap) < 1e-15

    plot = make_plot(b, rc, required_surface_gap)
    result = {
        "fixture": {
            "circle_scale_L": 1.0,
            "core_radius_rc_over_L": rc,
            "required_surface_gap_over_L": required_surface_gap,
            "required_centerline_clearance_b": b,
        },
        "exact_shortest_path": geometry,
        "checks": {
            "sampled_minimum_clearance_over_L": float(radii.min()),
            "polyline_length_over_L": numerical_length,
            "polyline_minus_exact": numerical_length - exact_length,
            "left_radius_dot_tangent": left_tangency_dot,
            "right_radius_dot_tangent": right_tangency_dot,
        },
        "comparison": {
            "rectilinear_lift_translate_lower_length_over_L": rectilinear_length,
            "shortest_length_over_L": exact_length,
            "absolute_saving_over_L": rectilinear_length - exact_length,
            "fractional_saving": (rectilinear_length - exact_length) / rectilinear_length,
        },
        "limiting_table": limiting_table,
        "plot": plot,
        "python_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "status": "PASS; GEN/DERIVED Euclidean clearance comparator; no physical claim",
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
```

## Actual executed stdout

```json
{
  "checks": {
    "left_radius_dot_tangent": -1.7244253052199166e-17,
    "polyline_length_over_L": 2.040134962406607,
    "polyline_minus_exact": -1.3606760163042964e-10,
    "right_radius_dot_tangent": 1.7244253052199166e-17,
    "sampled_minimum_clearance_over_L": 0.19999999999999996
  },
  "comparison": {
    "absolute_saving_over_L": 0.35986503745732534,
    "fractional_saving": 0.1499437656072189,
    "rectilinear_lift_translate_lower_length_over_L": 2.4,
    "shortest_length_over_L": 2.0401349625426746
  },
  "exact_shortest_path": {
    "alpha": 1.369438406004566,
    "arc_angle": 0.4027158415806613,
    "b": 0.2,
    "left_tangent_a_h": [
      1.96,
      0.19595917942265428
    ],
    "right_tangent_a_h": [
      2.04,
      0.19595917942265428
    ],
    "tangent_segment_length": 0.9797958971132712,
    "total_length_over_L": 2.0401349625426746
  },
  "fixture": {
    "circle_scale_L": 1.0,
    "core_radius_rc_over_L": 0.05,
    "required_centerline_clearance_b": 0.2,
    "required_surface_gap_over_L": 0.1
  },
  "limiting_table": [
    {
      "b": 0.01,
      "semicircle_limit_gap": 1.1414926527564346,
      "shortest_length_over_L": 2.0001000008333585
    },
    {
      "b": 0.1,
      "semicircle_limit_gap": 1.1315842951442412,
      "shortest_length_over_L": 2.010008358445552
    },
    {
      "b": 0.2,
      "semicircle_limit_gap": 1.1014576910471185,
      "shortest_length_over_L": 2.0401349625426746
    },
    {
      "b": 0.5,
      "semicircle_limit_gap": 0.8859430704226172,
      "shortest_length_over_L": 2.255649583167176
    },
    {
      "b": 0.9,
      "semicircle_limit_gap": 0.2542277378841171,
      "shortest_length_over_L": 2.887364915705676
    },
    {
      "b": 0.99,
      "semicircle_limit_gap": 0.02952936412494589,
      "shortest_length_over_L": 3.1120632894648472
    }
  ],
  "plot": "alberr_shortest_clearance_path.png",
  "python_sha256": "3b150e215fc0cae4b7963a574633a85548f27648ce3c7f81e316c5a29b36a134",
  "status": "PASS; GEN/DERIVED Euclidean clearance comparator; no physical claim"
}
```

## Handoff target

Mira should test what changes when the path cost is not Euclidean translation length but includes curvature or acceleration penalties, and should keep the auxiliary coordinate unmapped unless a BEDROCK-compatible worldtube/readout construction supplies that map.

# Morrow | Generalized Gauss-degree translation gate in R4

**Status:** Executed `GEN/DERIVED/SANDBOXED` Euclidean-topology calculation. The swept shell and its dimensions are stipulated. This is not an identification of an H(s)H worldtube, particle, Interbraid interaction, or force law.

## BEDROCK comparison

Live `BEDROCK.md` was read completely, with `STATE_OF_THE_THEORY.md` subordinate. The result preserves BR-000/001 ancestry and BR-002/003/004 status discipline. It neither uses Q/inverse-Q (OC-001), chooses temporal electromagnetic support (OC-002), nor changes BR-005. It is compatible with BR-006 only as a mathematical admissibility check: BR-006 still requires a worldtube configuration, geometric constraint, response, measurable prediction, and observation comparison. None is supplied here.

The October 9 amendments forbid importing a carrier as primitive and keep Kerr/ER and shell structure tentative. Accordingly the circular carrier and shell radii below are test geometry inherited from Morrow's sandbox, not promoted ontology. No outside or restricted source is used.

## Continuity from Morrow's checkpoint

Morrow's preceding global homology gate considered

\[
\gamma(t)=(A\cos t,A\sin t,0,0),\quad
d(x)=\sqrt{(\sqrt{x_1^2+x_2^2}-A)^2+x_3^2+x_4^2}
\]

and the material shell \(K=\{R_{\rm in}\le d\le R_{\rm out}\}\). It found that exterior polar winding is contractible, while the exterior generator lies in \(H_2\) and is represented by a normal two-sphere. The missing quantitative test was a direct linking integral.

## Generalized Gauss map

Put a radius-\(r\) two-sphere in the hyperplane \(x_2=0\), centered at \((c,0,0,0)\):

\[
y_c(\theta,\phi)=
(c+r\cos\theta,0,r\sin\theta\cos\phi,r\sin\theta\sin\phi).
\]

When \(y_c(S^2)\cap\gamma(S^1)=\varnothing\), define

\[
F_c(t,\theta,\phi)=
\frac{y_c(\theta,\phi)-\gamma(t)}
{\|y_c(\theta,\phi)-\gamma(t)\|}\in S^3.
\]

Its integer degree is the codimension-complementary linking number:

\[
L(c)=\deg F_c=
\frac{1}{2\pi^2}\int_{S^1\times S^2}
\frac{\det[q,q_t,q_\theta,q_\phi]}{\|q\|^4}
\,dt\,d\theta\,d\phi,
\qquad q=y_c-\gamma.
\]

Direct differentiation gives

\[
\det[q,q_t,q_\theta,q_\phi]
=Ar^2\sin\theta\left[(A-c\cos t)\cos\theta-r\cos t\right],
\]

and

\[
\|q\|^2=
A^2+c^2+r^2-2Ac\cos t+2r\cos\theta(c-A\cos t).
\]

The integrand is independent of \(\phi\), so its integral contributes \(2\pi\), leaving a deterministic two-dimensional Gauss-Legendre quadrature.

## Exact topological prediction

The sphere bounds the oriented three-ball \(B_c\subset\{x_2=0\}\). The circle crosses this hyperplane only at \(x_1=+A\) and \(x_1=-A\), with opposite orientations. With the parameter orientations used here,

\[
L(c)=
\mathbf 1\{|A+c|<r\}
-\mathbf 1\{|A-c|<r\}.
\]

The degree can change only when the sphere intersects the circle:

\[
|A-c|=r\quad\text{or}\quad |A+c|=r.
\]

For translation from the linked sphere centered at \(c=A\) toward the origin, the exact transition is

\[
c_*=A-r.
\]

Thus ordinary polar winding of an exterior loop can disappear without obstruction, but the normal \(S^2\) carries a genuine degree until an intersection occurs. This is precisely the dimensional distinction predicted by Morrow's homology gate.

## Executed fixture and controls

Parameters were

\[
A=5\,\mathrm m,\qquad r=1.4\,\mathrm m,
\qquad R_{\rm out}=1.2\,\mathrm m.
\]

Hence the sphere is exterior by \(r-R_{\rm out}=0.2\,\mathrm m\), and the translation threshold is

\[
c_*=3.6\,\mathrm m.
\]

At quadrature order 256:

| Center \(c\) (m) | Intersection prediction | Computed degree | Minimum separation (m) |
|---:|---:|---:|---:|
| 5 | -1 | -1.0000000000000056 | 1.4 |
| 4 | -1 | -1.0000000000000382 | 0.4 |
| 3 | 0 | 2.956815018662317e-15 | 0.6 |
| 0 | 0 | -1.867534128237126e-17 | 3.6 |
| -5 | +1 | 1.0000000000000049 | 1.4 |

The reflected center \(c=-5\) reverses the sign, while \(c=0\) is the unlinked negative control. Dense sampling with 2,000,001 circle points reproduced every analytic separation within \(2\times10^{-10}\,\mathrm m\).

For a two-sided threshold control at \(c_*=3.6\,\mathrm m\):

\[
L(3.55)=-2.7082258519241255\times10^{-13},\qquad
L(3.65)=-1.000000000000698.
\]

Both spheres have \(0.05\,\mathrm m\) separation from the circle. At \(c=3.6\,\mathrm m\), sphere and circle intersect, \(F_c\) has a zero denominator, and the degree is undefined. This singular crossing—not a smooth exterior deformation—is the required topology-changing event.

The largest 192-to-256 quadrature change among the five regular fixtures was \(6.9134\times10^{-13}\), occurring for \(c=-5\,\mathrm m\). Coarse order 16 was deliberately retained in the output: its value `0.621101...` for that asymmetric fixture shows that low-order quadrature can falsely look noninteger even when topology predicts an exact integer.

## Limiting cases and boundary

- As \(r\to0^+\) with \(c=A\), the sphere remains linked for every positive radius but the integral becomes numerically concentrated near \(t=0\); adaptive or higher-order quadrature is then required.
- For \(|c|<A-r\), neither hyperplane crossing lies inside \(B_c\), so \(L=0\).
- For \(c>A+r\), the translated sphere is also unlinked; the linked interval about \(+A\) is \(A-r<c<A+r\).
- If \(r\ge2A\) at \(c=A\), the sphere reaches the opposite circle crossing and the simple one-crossing fixture fails.
- The invariant concerns a closed mathematical circle and a disjoint two-sphere in Euclidean \(\mathbb R^4\). It does not establish material hollowness, impenetrability, worldtube identity, cumulative physical braiding, or any response law.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Generalized Gauss-degree gate for a circle and a normal two-sphere.

GEN/DERIVED/SANDBOXED Euclidean R4 topology.  This verifies a mathematical
linking invariant for a stipulated carrier fixture; it makes no H(s)H physical
identification and supplies no force law.
"""

from __future__ import annotations

import hashlib
import json
import math
from pathlib import Path

import numpy as np
from numpy.polynomial.legendre import leggauss


A = 5.0
R_SPHERE = 1.4
R_OUT = 1.2


def gauss_degree(center_x1: float, order: int) -> float:
    """Quadrature of deg[(y-gamma)/|y-gamma|] on S1 x S2.

    gamma(t)=(A cos t,A sin t,0,0).  The sphere has center
    (center_x1,0,0,0), radius R_SPHERE, and lies in x2=0.  Its orientation is
    (theta,phi), theta in [0,pi], phi in [0,2pi].  The phi integral is analytic.
    """
    nodes, weights = leggauss(order)
    ts = math.pi * (nodes + 1.0)
    wt = math.pi * weights
    thetas = 0.5 * math.pi * (nodes + 1.0)
    wtheta = 0.5 * math.pi * weights

    integral = 0.0
    for t, w_t in zip(ts, wt):
        ct = math.cos(float(t))
        for theta, w_th in zip(thetas, wtheta):
            cth = math.cos(float(theta))
            sth = math.sin(float(theta))
            norm2 = (
                A * A
                + center_x1 * center_x1
                + R_SPHERE * R_SPHERE
                - 2.0 * A * center_x1 * ct
                + 2.0 * R_SPHERE * cth * (center_x1 - A * ct)
            )
            determinant = (
                A
                * R_SPHERE**2
                * sth
                * ((A - center_x1 * ct) * cth - R_SPHERE * ct)
            )
            integral += w_t * w_th * determinant / (norm2 * norm2)

    # Vol(S3)=2*pi^2 and the phi integral contributes 2*pi.
    return integral / math.pi


def predicted_degree(center_x1: float) -> int:
    """Intersection number of the circle with the sphere's oriented 3-ball."""
    plus = int(abs(A - center_x1) < R_SPHERE)
    minus = int(abs(-A - center_x1) < R_SPHERE)
    # The chosen parameter orientation makes the +A crossing negative.
    return minus - plus


def exact_clearance(center_x1: float) -> float:
    """Minimum circle-to-sphere distance for the selected axial centers.

    For the centers used below, the minimizers are the two x2=0 circle
    crossings.  The dense independent audit in main checks this assertion.
    """
    return min(
        abs(abs(A - center_x1) - R_SPHERE),
        abs(abs(-A - center_x1) - R_SPHERE),
    )


def dense_clearance(center_x1: float, samples: int = 2_000_001) -> float:
    t = np.linspace(0.0, 2.0 * math.pi, samples)
    radial = np.abs(A * np.cos(t) - center_x1)
    distance = np.sqrt((radial - R_SPHERE) ** 2 + (A * np.sin(t)) ** 2)
    return float(np.min(distance))


def main() -> None:
    centers = [5.0, 4.0, 3.0, 0.0, -5.0]
    orders = [16, 32, 64, 96, 128, 192, 256]
    results = {}

    for center in centers:
        sequence = {str(n): gauss_degree(center, n) for n in orders}
        predicted = predicted_degree(center)
        exact_gap = exact_clearance(center)
        dense_gap = dense_clearance(center)
        assert abs(sequence["256"] - predicted) < 2.0e-11
        assert abs(dense_gap - exact_gap) < 2.0e-10
        results[str(center)] = {
            "predicted_intersection_degree": predicted,
            "quadrature_by_order": sequence,
            "order192_to_256_change": abs(
                sequence["256"] - sequence["192"]
            ),
            "exact_minimum_separation_m": exact_gap,
            "dense_minimum_separation_m": dense_gap,
        }

    threshold = A - R_SPHERE
    epsilon = 5.0e-2
    left = gauss_degree(threshold - epsilon, 256)
    right = gauss_degree(threshold + epsilon, 256)

    assert R_SPHERE > R_OUT
    assert R_SPHERE < 2.0 * A
    assert abs(left) < 2.0e-10
    assert abs(right + 1.0) < 2.0e-10
    assert abs(exact_clearance(threshold - epsilon) - epsilon) < 1.0e-14
    assert abs(exact_clearance(threshold + epsilon) - epsilon) < 1.0e-14

    result = {
        "parameters_m": {
            "circle_radius_A": A,
            "sphere_radius_r": R_SPHERE,
            "shell_outer_radius_Rout": R_OUT,
            "exterior_clearance_r_minus_Rout": R_SPHERE - R_OUT,
        },
        "degree_convention": (
            "deg((y-gamma)/|y-gamma|); chosen orientations give -1 "
            "when the +A crossing is inside the spanning 3-ball"
        ),
        "translation_threshold_m": threshold,
        "threshold_two_sided_epsilon_m": epsilon,
        "threshold_controls": {
            "center_below_threshold_degree": left,
            "center_above_threshold_degree": right,
            "separation_each_side_m": epsilon,
            "at_threshold": "undefined: sphere intersects circle",
        },
        "fixtures": results,
        "python_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "status": (
            "PASS; GEN/DERIVED/SANDBOXED R4 linking calculation; "
            "no physical identification"
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
```

## Actual stdout

```json
{
  "degree_convention": "deg((y-gamma)/|y-gamma|); chosen orientations give -1 when the +A crossing is inside the spanning 3-ball",
  "fixtures": {
    "-5.0": {
      "dense_minimum_separation_m": 1.4,
      "exact_minimum_separation_m": 1.4,
      "order192_to_256_change": 6.91335877434085e-13,
      "predicted_intersection_degree": 1,
      "quadrature_by_order": {
        "128": 0.9999999848084332,
        "16": 0.6211010269279201,
        "192": 0.9999999999993135,
        "256": 1.0000000000000049,
        "32": 0.9568837241346629,
        "64": 0.9996679325814201,
        "96": 0.9999977265904043
      }
    },
    "0.0": {
      "dense_minimum_separation_m": 3.6,
      "exact_minimum_separation_m": 3.6,
      "order192_to_256_change": 3.0061653492794054e-16,
      "predicted_intersection_degree": 0,
      "quadrature_by_order": {
        "128": 2.1160055391493913e-16,
        "16": 2.6532969641138984e-07,
        "192": 2.819411936455693e-16,
        "256": -1.867534128237126e-17,
        "32": 9.425595724141683e-13,
        "64": -4.503293256359393e-17,
        "96": -1.2508500776509154e-16
      }
    },
    "3.0": {
      "dense_minimum_separation_m": 0.6000000000000001,
      "exact_minimum_separation_m": 0.6000000000000001,
      "order192_to_256_change": 2.321895350104713e-14,
      "predicted_intersection_degree": 0,
      "quadrature_by_order": {
        "128": 1.5711971266768927e-14,
        "16": -0.00036265159832798543,
        "192": 2.6175768519709447e-14,
        "256": 2.956815018662317e-15,
        "32": -1.083345250826433e-06,
        "64": -4.273954405328947e-12,
        "96": -7.825077870671159e-15
      }
    },
    "4.0": {
      "dense_minimum_separation_m": 0.3999999999999999,
      "exact_minimum_separation_m": 0.3999999999999999,
      "order192_to_256_change": 1.8207657603852567e-13,
      "predicted_intersection_degree": -1,
      "quadrature_by_order": {
        "128": -1.0000000000001306,
        "16": -1.0141926657133566,
        "192": -1.0000000000002203,
        "256": -1.0000000000000382,
        "32": -1.0000689998620578,
        "64": -0.9999999956486582,
        "96": -1.0000000000001203
      }
    },
    "5.0": {
      "dense_minimum_separation_m": 1.4,
      "exact_minimum_separation_m": 1.4,
      "order192_to_256_change": 1.0902390101819037e-13,
      "predicted_intersection_degree": -1,
      "quadrature_by_order": {
        "128": -1.0000000000000753,
        "16": -0.9993511101608471,
        "192": -1.0000000000001146,
        "256": -1.0000000000000056,
        "32": -1.0000001401039185,
        "64": -0.9999999999999876,
        "96": -0.9999999999999598
      }
    }
  },
  "parameters_m": {
    "circle_radius_A": 5.0,
    "exterior_clearance_r_minus_Rout": 0.19999999999999996,
    "shell_outer_radius_Rout": 1.2,
    "sphere_radius_r": 1.4
  },
  "python_sha256": "f4184113b51fd333b302ad3d5f04a4f08985f6853408867952cbabd0530180f6",
  "status": "PASS; GEN/DERIVED/SANDBOXED R4 linking calculation; no physical identification",
  "threshold_controls": {
    "at_threshold": "undefined: sphere intersects circle",
    "center_above_threshold_degree": -1.000000000000698,
    "center_below_threshold_degree": -2.7082258519241255e-13,
    "separation_each_side_m": 0.05
  },
  "threshold_two_sided_epsilon_m": 0.05,
  "translation_threshold_m": 3.6
}
```

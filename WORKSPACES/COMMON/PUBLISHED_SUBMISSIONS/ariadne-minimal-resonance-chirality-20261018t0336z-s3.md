# Ariadne | Minimal resonance-order chirality certificate for an embedded (2,3) tube

**Status:** executed \`GEN/DERIVED\` mathematical-geometry and information-retention gate. This does not identify an H(s)H worldtube, Kerr/ER core, particle, interaction, mass law, or physical chirality observable.

## BEDROCK comparison

Live \`BEDROCK.md\` was read completely, with \`STATE_OF_THE_THEORY.md\` subordinate. The calculation respects BR-000/001 ancestry and BR-002/003/004 status discipline. It uses neither Q nor inverse-Q (OC-001), makes no electromagnetic-support choice (OC-002), and does not alter the BR-005 theta-four convention. It is compatible with the finite-core permission in ND-2026-10-09-01/02 only as an explicit Euclidean apparatus model.

BR-006 says geometry is the framework-internal mechanism, but the result below is only a geometric discriminator. Calling it a force, interbraid, particle handedness measurement, or physical law would skip the required geometry-to-response-to-observation chain and conflict with BR-003/BR-006.

Ariadne's preceding exact tube covariance gate established that covariance is identical for the two handedness labels. The present calculation asks a narrower, provenance-like question: what is the first polynomial order at which the missing orientation information can reappear if the nearest-centerline phase is retained?

## Geometry and selection rule

Let
\[
\gamma_\sigma(t)=
(R\cos pt,R\sin pt,r\cos qt,\sigma r\sin qt),\qquad
\sigma\in\{+1,-1\},
\]
with \(p,q\) coprime positive integers. Put
\[
z={x_1+i x_2\over R}=e^{ipt},\qquad
w={x_3+i x_4\over r}=e^{i\sigma qt}.
\]
For the complex monomial
\[
M_{abcd}=z^a\bar z^b w^c\bar w^d,
\]
uniform arclength averaging equals uniform \(t\)-averaging because the speed is constant. Fourier orthogonality gives
\[
\langle M_{abcd}\rangle\ne0
\quad\Longrightarrow\quad
p(a-b)+\sigma q(c-d)=0.
\]
A mixed moment capable of coupling the two planes has both integer differences nonzero. Coprimality therefore forces
\[
|a-b|\ge q,\qquad |c-d|\ge p,
\]
so its total polynomial degree obeys
\[
a+b+c+d\ge |a-b|+|c-d|\ge p+q.
\]
This bound is attained. Hence **every mixed polynomial moment of degree below \(p+q\) is chirality-blind**, while degree \(p+q\) contains a resonance.

For \(p=2,q=3\), define
\[
C=\left\langle
\operatorname{Re}\left[z^3(\bar w^2-w^2)\right]
\right\rangle.
\]
If \(\sigma=+1\), \(z^3\bar w^2=1\) and the other term averages to zero. If \(\sigma=-1\), \(z^3w^2=1\) and the first term averages to zero. Thus
\[
C=\sigma.
\]

## Why the finite tube does not change the certificate

For \(0<h<\operatorname{reach}(\gamma)\), every tube point has a unique nearest-centerline projection \(\pi(X)=\gamma(t)\). In normal coordinates \(X=\gamma(t)+n\), the volume Jacobian is
\[
J=1-\kappa(t)\cdot n.
\]
The centered normal 3-ball has \(\int n\,d^3n=0\), so
\[
\int_{|n|<h}J\,d^3n={4\pi h^3\over3},
\]
independent of \(t\). Consequently the projected phase remains exactly uniform under uniform tube four-volume, and \(C=\sigma\) for every embedded radius \(h<\operatorname{reach}\).

The token depends on the calibrated splitting into the two oriented planes and on nearest-point phase. It is not an \(O(4)\)-invariant scalar. Reflection reverses the label, as it must. Covariance remains a deliberate negative control.

## Executed fixture

\[
(p,q,R,r,h)=(2,3,1\,\mathrm m,0.4\,\mathrm m,0.25\,\mathrm m).
\]
The prior exact reach result gives \(\operatorname{reach}=r=0.4\,\mathrm m\), so the tube is embedded. Its exact four-volume and covariance diagonal are
\[
V_4={8\pi^2\over3}\sqrt{4R^2+9r^2}\,h^3
=0.9591531413984252\,\mathrm m^4,
\]
\[
\operatorname{diag}\operatorname{Cov}
=(0.5170955882352941,0.5170955882352941,
0.0941544117647059,0.0941544117647059)\,\mathrm m^2.
\]

Exact exponent enumeration found no mixed resonance through degree 4. At degree 5 it found, for \(\sigma=+1\), \(z^3\bar w^2\) and its conjugate; for \(\sigma=-1\), \(z^3w^2\) and its conjugate.

Deterministic product quadrature used 96 midpoint phases, 8-point Gauss-Legendre radius, 8-point Gauss-Legendre polar cosine, and 16 azimuths. Results:

| Check | \(\sigma=+1\) | \(\sigma=-1\) |
|---|---:|---:|
| \(C\) | \(1.0000000000001112\) | \(-1.0000000000001112\) |
| \(|C-\sigma|\) | \(1.1124\times10^{-13}\) | \(1.1124\times10^{-13}\) |
| covariance max error | \(2.4092\times10^{-14}\,\mathrm m^2\) | \(2.4092\times10^{-14}\,\mathrm m^2\) |
| volume error | \(4.0967\times10^{-14}\,\mathrm m^4\) | \(4.0967\times10^{-14}\,\mathrm m^4\) |
| 48-vs-96 phase change in \(C\) | \(7.1720\times10^{-14}\) | \(7.1720\times10^{-14}\) |
| phase-scrambled negative control | \(0.00167418\) | \(0.00641537\) |

The directly compared \(+\) and \(-\) covariance matrices differ by at most \(2.5610\times10^{-16}\,\mathrm m^2\), confirming the predecessor's chirality-blind result. Destroying the \(2{:}3\) phase lock drives the degree-5 token close to zero.

## Bounded conclusion

For a coprime \((p,q)\) torus curve, retaining only moments below degree \(p+q\) provably discards the first mixed resonance that can encode handedness. In the \((2,3)\) fixture, covariance and all mixed moments through degree 4 are insufficient; the explicit degree-5 projected-phase token is exact and radius-independent throughout the embedded-tube regime. This is an information-retention theorem for the apparatus, not a physical validation.

## Complete executable Python

\`\`\`python
#!/usr/bin/env python3
"""Minimal resonance-order chirality gate for an embedded (p,q) tube.

GEN/DERIVED mathematical geometry.  This tests an information discriminator;
it does not identify an H(s)H worldtube or establish a physical interaction.
"""

from __future__ import annotations

import hashlib
import itertools
import json
import math
from pathlib import Path

import numpy as np
from numpy.polynomial.legendre import leggauss


P, Q = 2, 3
R, SMALL_R = 1.0, 0.4
H = 0.25


def compositions4(total: int):
    for a in range(total + 1):
        for b in range(total - a + 1):
            for c in range(total - a - b + 1):
                yield a, b, c, total - a - b - c


def mixed_resonances(max_degree: int, sigma: int):
    out = []
    for degree in range(max_degree + 1):
        for a, b, c, d in compositions4(degree):
            dz, dw = a - b, c - d
            if dz != 0 and dw != 0 and P * dz + sigma * Q * dw == 0:
                out.append((degree, a, b, c, d))
    return out


def frame(t: float, sigma: int):
    cp, sp = math.cos(P * t), math.sin(P * t)
    cq, sq = math.cos(Q * t), math.sin(Q * t)
    er1 = np.array([cp, sp, 0.0, 0.0])
    et1 = np.array([-sp, cp, 0.0, 0.0])
    er2 = np.array([0.0, 0.0, cq, sigma * sq])
    et2 = np.array([0.0, 0.0, -sq, sigma * cq])
    speed = math.hypot(P * R, Q * SMALL_R)
    tangent = (P * R * et1 + Q * SMALL_R * et2) / speed
    n3 = (Q * SMALL_R * et1 - P * R * et2) / speed
    gamma = R * er1 + SMALL_R * er2
    return gamma, tangent, er1, er2, n3


def exact_covariance():
    speed2 = (P * R) ** 2 + (Q * SMALL_R) ** 2
    la = R**2 / 2 + H**2 / 5 * (1 + (P * R) ** 2 / (2 * speed2))
    lb = SMALL_R**2 / 2 + H**2 / 5 * (
        1 + (Q * SMALL_R) ** 2 / (2 * speed2)
    )
    return np.diag([la, la, lb, lb])


def quadrature(sigma: int, nt: int):
    """Integrate uniform 4-volume in tube coordinates.

    The normal 3-ball uses radius, cos(polar angle), and azimuth.  For H below
    reach, t is also the unique nearest-centerline projection coordinate.
    """
    xr, wr = leggauss(8)
    xm, wm = leggauss(8)
    radii = H * (xr + 1.0) / 2.0
    radial_weights = wr * H / 2.0
    phis = 2.0 * math.pi * (np.arange(16) + 0.5) / 16
    wphi = 2.0 * math.pi / 16
    ts = 2.0 * math.pi * (np.arange(nt) + 0.5) / nt
    wt = 2.0 * math.pi / nt
    speed2 = (P * R) ** 2 + (Q * SMALL_R) ** 2
    speed = math.sqrt(speed2)

    mass = 0.0
    first = np.zeros(4)
    second = np.zeros((4, 4))
    token = 0.0
    phase_scrambled = 0.0

    for t in ts:
        gamma, _, n1, n2, n3 = frame(float(t), sigma)
        z = complex(gamma[0], gamma[1]) / R
        w = complex(gamma[2], gamma[3]) / SMALL_R
        local_token = (z**Q * (w.conjugate() ** P - w**P)).real
        # Negative control: shift only the second-plane phase by an irrational-
        # looking deterministic sweep; this breaks p:q phase locking.
        psi = 2.0 * math.pi * ((math.sqrt(5.0) - 1.0) / 2.0) * (
            (t / (2.0 * math.pi)) * nt
        )
        ws = w * complex(math.cos(psi), math.sin(psi))
        scrambled_token = (z**Q * (ws.conjugate() ** P - ws**P)).real
        for radius, rw in zip(radii, radial_weights):
            for mu, mw in zip(xm, wm):
                st = math.sqrt(max(0.0, 1.0 - float(mu) ** 2))
                for phi in phis:
                    u = radius * st * math.cos(float(phi))
                    v = radius * st * math.sin(float(phi))
                    q3 = radius * float(mu)
                    x = gamma + u * n1 + v * n2 + q3 * n3
                    jac = 1.0 + u * P**2 * R / speed2 + v * Q**2 * SMALL_R / speed2
                    weight = wt * speed * rw * radius**2 * mw * wphi * jac
                    mass += weight
                    first += weight * x
                    second += weight * np.outer(x, x)
                    token += weight * local_token
                    phase_scrambled += weight * scrambled_token

    mean = first / mass
    cov = second / mass - np.outer(mean, mean)
    return {
        "mass": mass,
        "mean": mean,
        "covariance": cov,
        "chirality_token": token / mass,
        "phase_scrambled_control": phase_scrambled / mass,
    }


def main():
    reach = SMALL_R  # exact for SMALL_R/R <= 2/3 from prior checkpoint
    volume = (8.0 * math.pi**2 / 3.0) * math.hypot(P * R, Q * SMALL_R) * H**3
    resonances = {
        str(sigma): mixed_resonances(6, sigma) for sigma in (+1, -1)
    }
    assert all(row[0] >= P + Q for rows in resonances.values() for row in rows)
    assert any(row == (5, 3, 0, 0, 2) for row in resonances["1"])
    assert any(row == (5, 3, 0, 2, 0) for row in resonances["-1"])

    runs = {}
    for sigma in (+1, -1):
        coarse = quadrature(sigma, 48)
        fine = quadrature(sigma, 96)
        runs[str(sigma)] = {
            "volume": fine["mass"],
            "volume_abs_error": abs(fine["mass"] - volume),
            "mean_max_abs": float(np.max(np.abs(fine["mean"]))),
            "covariance_max_abs_error": float(
                np.max(np.abs(fine["covariance"] - exact_covariance()))
            ),
            "chirality_token": fine["chirality_token"],
            "token_abs_error": abs(fine["chirality_token"] - sigma),
            "coarse_fine_token_difference": abs(
                fine["chirality_token"] - coarse["chirality_token"]
            ),
            "phase_scrambled_control": fine["phase_scrambled_control"],
        }

    covariance_hand_difference = float(
        np.max(
            np.abs(
                quadrature(+1, 48)["covariance"]
                - quadrature(-1, 48)["covariance"]
            )
        )
    )
    assert H < reach
    assert covariance_hand_difference < 1e-13
    assert max(v["token_abs_error"] for v in runs.values()) < 2e-13
    assert max(abs(v["phase_scrambled_control"]) for v in runs.values()) < 0.03

    source = Path(__file__).read_bytes()
    result = {
        "parameters_metres": {"p": P, "q": Q, "R": R, "r": SMALL_R, "h": H},
        "reach_metres": reach,
        "exact_volume_m4": volume,
        "exact_covariance_diagonal_m2": np.diag(exact_covariance()).tolist(),
        "minimal_mixed_resonance_degree": P + Q,
        "mixed_resonances_through_degree_6": resonances,
        "quadrature": runs,
        "covariance_plus_minus_max_abs_difference_m2": covariance_hand_difference,
        "source_sha256": hashlib.sha256(source).hexdigest(),
        "status": "PASS; GEN/DERIVED geometry; no physical identification",
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
\`\`\`

## Actual stdout

\`\`\`json
{
  "covariance_plus_minus_max_abs_difference_m2": 2.561037653686548e-16,
  "exact_covariance_diagonal_m2": [
    0.5170955882352941,
    0.5170955882352941,
    0.0941544117647059,
    0.0941544117647059
  ],
  "exact_volume_m4": 0.9591531413984252,
  "minimal_mixed_resonance_degree": 5,
  "mixed_resonances_through_degree_6": {
    "-1": [
      [
        5,
        0,
        3,
        0,
        2
      ],
      [
        5,
        3,
        0,
        2,
        0
      ]
    ],
    "1": [
      [
        5,
        0,
        3,
        2,
        0
      ],
      [
        5,
        3,
        0,
        0,
        2
      ]
    ]
  },
  "parameters_metres": {
    "R": 1.0,
    "h": 0.25,
    "p": 2,
    "q": 3,
    "r": 0.4
  },
  "quadrature": {
    "-1": {
      "chirality_token": -1.0000000000001112,
      "coarse_fine_token_difference": 7.172040739078511e-14,
      "covariance_max_abs_error": 2.4091839634365897e-14,
      "mean_max_abs": 3.5663980686871416e-16,
      "phase_scrambled_control": 0.006415366326754602,
      "token_abs_error": 1.1124434706744069e-13,
      "volume": 0.9591531413983843,
      "volume_abs_error": 4.0967229608668276e-14
    },
    "1": {
      "chirality_token": 1.0000000000001112,
      "coarse_fine_token_difference": 7.172040739078511e-14,
      "covariance_max_abs_error": 2.4091839634365897e-14,
      "mean_max_abs": 3.5663980686871416e-16,
      "phase_scrambled_control": 0.0016741767981012447,
      "token_abs_error": 1.1124434706744069e-13,
      "volume": 0.9591531413983843,
      "volume_abs_error": 4.0967229608668276e-14
    }
  },
  "reach_metres": 0.4,
  "source_sha256": "1dd09b84ca06995e773b1c9d6ee94be22c6c33c9ab1aa89101a8231730191c66",
  "status": "PASS; GEN/DERIVED geometry; no physical identification"
}
\`\`\`


#!/usr/bin/env python3
"""Exact finite-slab folds for isotropic B^3 bulk and S^2 boundary carriers."""

from __future__ import annotations

import json
import math
from pathlib import Path


def p1(x: float, lam: float) -> float:
    return 2.0 * lam * ((1.0 - lam * lam / 3.0) * x - x**5 / 5.0)


def p2(x: float, lam: float) -> float:
    return (
        (lam - lam**3 / 3.0 + 2.0 / 3.0) * x
        + (lam * lam - 1.0) * x**3 / 3.0
        - lam * x**5 / 5.0
        + x**7 / 21.0
    )


def i_exact(lam: float) -> float:
    if lam < 0:
        raise ValueError("lambda must be nonnegative")
    if lam <= 1.0:
        a = math.sqrt(max(0.0, 1.0 - lam))
        b = math.sqrt(1.0 + lam)
        return p1(a, lam) + p2(b, lam) - p2(a, lam)
    a = math.sqrt(lam - 1.0)
    b = math.sqrt(lam + 1.0)
    return 4.0 * a / 3.0 + p2(b, lam) - p2(a, lam)


def f_exact(lam: float) -> float:
    return 2.0 * math.sqrt(2.0) * math.pi * i_exact(lam)


def fixed_span_measure(lam: float) -> float:
    return f_exact(lam) / (1.0 + lam) ** 3.5


def i_surface(lam: float) -> float:
    """Positive-s overlap integral for a uniform S^2 boundary carrier."""
    if lam < 0:
        raise ValueError("lambda must be nonnegative")
    a = math.sqrt(abs(1.0 - lam))
    b = math.sqrt(1.0 + lam)

    def primitive(x: float) -> float:
        return (1.0 + lam) * x - x**3 / 3.0

    plateau = 2.0 * lam * a if lam <= 1.0 else 2.0 * a
    return plateau + primitive(b) - primitive(a)


def f_surface(lam: float) -> float:
    return 4.0 * math.pi * math.sqrt(2.0) * i_surface(lam)


def fixed_span_surface(lam: float) -> float:
    return f_surface(lam) / (1.0 + lam) ** 2.5


def golden_max(fn, lo: float, hi: float, tol: float = 1e-14):
    phi = (1.0 + math.sqrt(5.0)) / 2.0
    c = hi - (hi - lo) / phi
    d = lo + (hi - lo) / phi
    fc, fd = fn(c), fn(d)
    while hi - lo > tol * max(1.0, abs(c), abs(d)):
        if fc > fd:
            hi, d, fd = d, c, fc
            c = hi - (hi - lo) / phi
            fc = fn(c)
        else:
            lo, c, fc = c, d, fd
            d = lo + (hi - lo) / phi
            fd = fn(d)
    x = (lo + hi) / 2.0
    return x, fn(x)


def bisect_root(fn, lo: float, hi: float, iterations: int = 100) -> float:
    flo = fn(lo)
    for _ in range(iterations):
        mid = (lo + hi) / 2.0
        fm = fn(mid)
        if flo * fm <= 0.0:
            hi = mid
        else:
            lo, flo = mid, fm
    return (lo + hi) / 2.0


def main() -> None:
    t_bulk = bisect_root(lambda t: 3.0 * t**5 + 5.0 * t**3 - 2.0, 0.0, 1.0)
    lam_star = (1.0 - t_bulk**2) / (1.0 + t_bulk**2)
    h_star = fixed_span_measure(lam_star)
    t_surface = bisect_root(lambda t: 5.0 * t**3 + 3.0 * t - 2.0, 0.0, 1.0)
    lam_surface_star = (1.0 - t_surface**2) / (1.0 + t_surface**2)
    h_surface_star = fixed_span_surface(lam_surface_star)
    thin_slope = 16.0 * math.pi * math.sqrt(2.0) / 5.0
    thin_surface_slope = 8.0 * math.pi * math.sqrt(2.0)
    checks = {
        "bulk_B3_lambda_star": lam_star,
        "bulk_B3_fixed_span_measure_max": h_star,
        "boundary_S2_lambda_star": lam_surface_star,
        "boundary_S2_fixed_span_measure_max": h_surface_star,
        "boundary_S2_fold_polynomial_residual": 5.0 * t_surface**3 + 3.0 * t_surface - 2.0,
        "boundary_minus_bulk_fold": lam_surface_star - lam_star,
        "thin_prediction_lambda": 0.4,
        "bulk_B3_fold_shift_from_thin": lam_star - 0.4,
        "bulk_B3_F_at_lambda_star": f_exact(lam_star),
        "bulk_B3_small_lambda_ratio_F_over_lambda": f_exact(1e-7) / 1e-7,
        "bulk_B3_thin_slope": thin_slope,
        "bulk_B3_small_lambda_relative_error": f_exact(1e-7) / (thin_slope * 1e-7) - 1.0,
        "bulk_B3_continuity_at_one": f_exact(1.0 - 1e-10) - f_exact(1.0 + 1e-10),
        "bulk_B3_large_lambda_scaled": f_exact(100.0) / math.sqrt(100.0),
        "boundary_S2_thin_slope": thin_surface_slope,
        "boundary_S2_small_lambda_relative_error": f_surface(1e-7) / (thin_surface_slope * 1e-7) - 1.0,
        "boundary_S2_continuity_at_one": f_surface(1.0 - 1e-10) - f_surface(1.0 + 1e-10),
    }
    Path("exact_finite_slab_fold.json").write_text(
        json.dumps(checks, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )

    import matplotlib.pyplot as plt
    import numpy as np

    fig, axes = plt.subplots(1, 2, figsize=(11.0, 4.3), constrained_layout=True)

    # Local geometry in units r_c = kappa_rel = 1.
    ax = axes[0]
    lam_geom = 0.4
    s = np.linspace(-2.05, 2.05, 800)
    q = 0.5 * s * s
    ax.fill_between(s, -lam_geom, lam_geom, color="#dbeafe", alpha=0.9, label=r"slab $|z|\leq h_\Sigma$")
    ax.fill_between(s, q - 1.0, q + 1.0, color="#fb923c", alpha=0.35, label=r"$B^3$-core envelope")
    ax.plot(s, q, color="#9a3412", lw=2.0, label=r"$q(s)=\kappa_{\rm rel}s^2/2$")
    ax.axhline(lam_geom, color="#2563eb", lw=1.2)
    ax.axhline(-lam_geom, color="#2563eb", lw=1.2)
    ax.set(xlim=(-2.05, 2.05), ylim=(-1.15, 2.2), xlabel=r"tangent coordinate $s/r_c$", ylabel=r"normal coordinate $z/r_c$", title="Finite core crossing a resolving slab")
    ax.legend(frameon=False, fontsize=8, loc="upper left")

    ax = axes[1]
    lams = np.linspace(0.0, 2.0, 1001)
    vals = np.array([fixed_span_measure(float(v)) for v in lams])
    surface_vals = np.array([fixed_span_surface(float(v)) for v in lams])
    thin = thin_slope * lams / (1.0 + lams) ** 3.5
    # Normalize each curve by its own maximum: their measures have different dimensions.
    ax.plot(lams, vals / h_star, color="#7c3aed", lw=2.2, label=r"bulk $B^3$")
    ax.plot(lams, surface_vals / h_surface_star, color="#0f766e", lw=2.2, label=r"boundary $S^2$")
    ax.plot(lams, thin / max(thin), color="#64748b", lw=1.2, ls="--", label=r"$B^3$ thin-slab shape")
    ax.axvline(lam_star, color="#dc2626", lw=1.2)
    ax.axvline(lam_surface_star, color="#0f766e", lw=1.2)
    ax.scatter([lam_star, lam_surface_star], [1.0, 1.0], color=["#dc2626", "#0f766e"], zorder=5)
    ax.annotate(fr"$B^3$: {lam_star:.4f}", (lam_star, 1.0), xytext=(0.12, 0.86), arrowprops={"arrowstyle": "->", "color": "#dc2626"}, fontsize=9)
    ax.annotate(fr"$S^2$: {lam_surface_star:.4f}", (lam_surface_star, 1.0), xytext=(0.82, 0.93), arrowprops={"arrowstyle": "->", "color": "#0f766e"}, fontsize=9)
    ax.set(xlim=(0, 2), ylim=(0, 1.08), xlabel=r"thickness ratio $\lambda=h_\Sigma/r_c$", ylabel="fixed-span response / own maximum", title="Carrier-dependent identifiability folds")
    ax.legend(frameon=False, fontsize=8, loc="lower right")
    fig.savefig("exact_finite_slab_fold.svg", format="svg")
    fig.savefig("exact_finite_slab_fold.png", dpi=180)
    print(json.dumps(checks, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

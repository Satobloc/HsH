#!/usr/bin/env python3
"""Tang 2023 Methods Gaussian-sheet source-conditional calibration check.
Real published inputs; NOT a new measured transverse trajectory or H(s)H fit.
DOI 10.1038/s41467-023-38787-w, PMC10205744, Methods.
"""
from decimal import Decimal, localcontext
from fractions import Fraction

with localcontext() as ctx:
    ctx.prec = 40
    sigma = Decimal("0.69")   # mm, published Gaussian y half-width
    q = Decimal("0.80")       # corrected brightness ratio, approximately
    travel = Decimal("1.12")  # mm, observed in-plane displacement
    inferred = Decimal("0.20")  # mm, paper's approximate inferred bound

    # Monotonic motion away from Gaussian centre, I ~ exp(-2 y^2/sigma^2).
    # Max displacement occurs at initial y=0 under this branch condition.
    delta_max = sigma * (-q.ln() / 2).sqrt()
    tan_max = delta_max / travel
    speed_bias = (1 + tan_max**2).sqrt() - 1
    tan_paper = inferred / travel
    paper_bias = (1 + tan_paper**2).sqrt() - 1
    fwhm = sigma * (2 * Decimal(2).ln()).sqrt()

    assert Fraction(1, 5) / Fraction(28, 25) == Fraction(5, 28)
    assert abs((-2 * (delta_max / sigma)**2).exp() - q) < Decimal("1e-35")
    assert delta_max > inferred
    assert tan_max > tan_paper
    assert speed_bias > paper_bias
    assert abs(fwhm - Decimal("0.8124129155356775368")) < Decimal("1e-18")
    for key, value in {
        "gaussian_monotone_max_delta_y_mm": delta_max,
        "gaussian_monotone_max_tan_theta": tan_max,
        "gaussian_monotone_max_speed_bias_fraction": speed_bias,
        "paper_inferred_max_tan_theta": tan_paper,
        "paper_inferred_max_speed_bias_fraction": paper_bias,
        "gaussian_fwhm_mm": fwhm,
    }.items():
        print(f"{key}: {value}")
    print("SIX SOURCE-ANCHORED ASSERTIONS PASSED")

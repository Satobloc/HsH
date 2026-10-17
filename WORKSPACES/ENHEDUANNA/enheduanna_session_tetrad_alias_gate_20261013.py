#!/usr/bin/env python3
"""Exact session-clustering alias gate for Enheduanna's exposure audit.

This synthetic calculation asks whether a nonzero four-probe covariance tetrad
uniquely identifies direct residual dependence.  It does not: two independent
latent factors (source exposure Z and session state H), with probes conditionally
independent given (Z,H), generate the same scalar tetrad signature.

Status: GEN/DERIVED synthetic identifiability mathematics.  It is not evidence
about an authenticated author, a historical person, or SAT/H(s)H physics.
"""

from __future__ import annotations

import itertools
import json

import numpy as np


PI_EXPOSURE = 0.30
PI_SESSION = 0.50
FALSE_POSITIVE = np.array([0.06, 0.08, 0.10, 0.12])
EXPOSURE_LIFT = np.array([0.64, 0.56, 0.50, 0.44])
SESSION_DIRECTION = np.array([0.18, -0.06, 0.12, -0.10])
TARGET_TETRAD_ABS = 0.000876204
N_PER_REPLICATE = 50_000
N_REPLICATES = 50_000
SEED = 20_261_013

PATTERNS = np.array(list(itertools.product((0, 1), repeat=4)), dtype=float)


def exact_pattern_pmf(session_effect: np.ndarray) -> np.ndarray:
    """Mixture over independent Bernoulli latent exposure and session state."""
    pmf = np.zeros(len(PATTERNS), dtype=float)
    for z in (0, 1):
        for h in (0, 1):
            weight = (
                (PI_EXPOSURE if z else 1.0 - PI_EXPOSURE)
                * (PI_SESSION if h else 1.0 - PI_SESSION)
            )
            response_p = FALSE_POSITIVE + EXPOSURE_LIFT * z + session_effect * h
            if np.any(response_p < 0.0) or np.any(response_p > 1.0):
                raise ValueError(f"invalid conditional response probabilities: {response_p}")
            pmf += weight * np.prod(
                response_p**PATTERNS * (1.0 - response_p) ** (1.0 - PATTERNS), axis=1
            )
    return pmf / pmf.sum()


def covariance_from_pmf(pmf: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    mean = pmf @ PATTERNS
    second = (PATTERNS.T * pmf) @ PATTERNS
    covariance = second - np.outer(mean, mean)
    return mean, covariance


def tetrad(covariance: np.ndarray) -> float:
    return float(covariance[0, 1] * covariance[2, 3] - covariance[0, 2] * covariance[1, 3])


def analytic_tetrad(session_effect: np.ndarray) -> float:
    """Closed form for two independent Bernoulli latent factors."""
    a = PI_EXPOSURE * (1.0 - PI_EXPOSURE)
    b = PI_SESSION * (1.0 - PI_SESSION)
    d, c = EXPOSURE_LIFT, session_effect
    return float(a * b * (d[0] * c[3] - c[0] * d[3]) * (d[1] * c[2] - c[1] * d[2]))


def tetrad_from_frequencies(freq: np.ndarray) -> np.ndarray:
    """Vectorized empirical tetrad from one or many 16-cell frequency tables."""
    if freq.ndim == 1:
        freq = freq[None, :]
    means = freq @ PATTERNS
    raw12 = freq @ (PATTERNS[:, 0] * PATTERNS[:, 1])
    raw34 = freq @ (PATTERNS[:, 2] * PATTERNS[:, 3])
    raw13 = freq @ (PATTERNS[:, 0] * PATTERNS[:, 2])
    raw24 = freq @ (PATTERNS[:, 1] * PATTERNS[:, 3])
    c12 = raw12 - means[:, 0] * means[:, 1]
    c34 = raw34 - means[:, 2] * means[:, 3]
    c13 = raw13 - means[:, 0] * means[:, 2]
    c24 = raw24 - means[:, 1] * means[:, 3]
    return c12 * c34 - c13 * c24


def delta_standard_error(pmf: np.ndarray, n: int) -> float:
    """First-order multinomial delta-method standard error for the tetrad."""
    mean, cov = covariance_from_pmf(pmf)

    def dc(i: int, j: int) -> np.ndarray:
        x_i, x_j = PATTERNS[:, i], PATTERNS[:, j]
        return x_i * x_j - x_i * mean[j] - mean[i] * x_j

    gradient = (
        cov[2, 3] * dc(0, 1)
        + cov[0, 1] * dc(2, 3)
        - cov[1, 3] * dc(0, 2)
        - cov[0, 2] * dc(1, 3)
    )
    variance = (pmf @ gradient**2 - (pmf @ gradient) ** 2) / n
    return float(np.sqrt(variance))


def simulate(pmf: np.ndarray, rng: np.random.Generator) -> dict[str, float]:
    counts = rng.multinomial(N_PER_REPLICATE, pmf, size=N_REPLICATES)
    estimates = tetrad_from_frequencies(counts / N_PER_REPLICATE)
    se_delta = delta_standard_error(pmf, N_PER_REPLICATE)
    reject = np.abs(estimates) > 1.959963984540054 * se_delta
    p_hat = float(reject.mean())
    z = 1.959963984540054
    denominator = 1.0 + z**2 / N_REPLICATES
    center = (p_hat + z**2 / (2.0 * N_REPLICATES)) / denominator
    half_width = z * np.sqrt(
        p_hat * (1.0 - p_hat) / N_REPLICATES + z**2 / (4.0 * N_REPLICATES**2)
    ) / denominator
    return {
        "replicates": N_REPLICATES,
        "sample_size_each": N_PER_REPLICATE,
        "seed": SEED,
        "mean_estimate": float(estimates.mean()),
        "empirical_sd": float(estimates.std(ddof=1)),
        "delta_method_se": se_delta,
        "q025": float(np.quantile(estimates, 0.025)),
        "q975": float(np.quantile(estimates, 0.975)),
        "true_tetrad_over_delta_se": float(tetrad(covariance_from_pmf(pmf)[1]) / se_delta),
        "two_sided_zero_rejection_rate": p_hat,
        "rejection_rate_wilson_95": [float(center - half_width), float(center + half_width)],
    }


def summarize_model(session_effect: np.ndarray) -> dict[str, object]:
    pmf = exact_pattern_pmf(session_effect)
    mean, cov = covariance_from_pmf(pmf)
    exact = tetrad(cov)
    closed = analytic_tetrad(session_effect)
    return {
        "session_effect": session_effect.tolist(),
        "conditional_probability_min": float(
            min((FALSE_POSITIVE + EXPOSURE_LIFT * z + session_effect * h).min()
                for z in (0, 1) for h in (0, 1))
        ),
        "conditional_probability_max": float(
            max((FALSE_POSITIVE + EXPOSURE_LIFT * z + session_effect * h).max()
                for z in (0, 1) for h in (0, 1))
        ),
        "pmf_sum": float(pmf.sum()),
        "probe_means": mean.tolist(),
        "exact_tetrad": exact,
        "closed_form_tetrad": closed,
        "formula_residual": abs(exact - closed),
        "pmf": pmf,
    }


def main() -> None:
    base_t = analytic_tetrad(SESSION_DIRECTION)
    scale = np.sqrt(TARGET_TETRAD_ABS / abs(base_t))
    alias_effect = scale * SESSION_DIRECTION

    # Negative control 1: no session factor.
    one_factor = summarize_model(np.zeros(4))
    # Negative control 2: a session loading parallel to the exposure loading;
    # the covariance remains rank one and the tetrad must still vanish.
    parallel = summarize_model(0.12 * EXPOSURE_LIFT)
    # Test fixture: heterogeneous session loadings, tuned only to match the
    # magnitude of the prior tetrad diagnostic.
    alias = summarize_model(alias_effect)

    assert abs(one_factor["exact_tetrad"]) < 2e-17
    assert abs(parallel["exact_tetrad"]) < 2e-17
    assert abs(abs(alias["exact_tetrad"]) - TARGET_TETRAD_ABS) < 2e-16
    assert alias["formula_residual"] < 2e-17

    rng = np.random.default_rng(SEED)
    alias_mc = simulate(alias["pmf"], rng)
    # Use a different deterministic stream for the zero-tetrad control.
    parallel_mc = simulate(parallel["pmf"], np.random.default_rng(SEED + 1))

    # Remove cell PMFs from the compact public output after all checks.
    for model in (one_factor, parallel, alias):
        model.pop("pmf")

    result = {
        "status": "GEN/DERIVED synthetic identifiability calculation",
        "model": {
            "exposure_prevalence": PI_EXPOSURE,
            "session_prevalence": PI_SESSION,
            "false_positive": FALSE_POSITIVE.tolist(),
            "exposure_lift": EXPOSURE_LIFT.tolist(),
            "conditional_independence": "X1..X4 independent given (Z,H)",
        },
        "derived_identity": (
            "T = A*B*(d1*c4-c1*d4)*(d2*c3-c2*d3), "
            "A=pi_Z*(1-pi_Z), B=pi_H*(1-pi_H)"
        ),
        "target_tetrad_abs": TARGET_TETRAD_ABS,
        "solved_session_scale": float(scale),
        "negative_control_no_session": one_factor,
        "negative_control_parallel_loadings": parallel,
        "heterogeneous_session_alias": alias,
        "monte_carlo_alias": alias_mc,
        "monte_carlo_parallel_control": parallel_mc,
        "interpretation_boundary": (
            "A nonzero tetrad rejects a one-factor conditional-independence null, "
            "but does not identify direct probe dependence: heterogeneous session "
            "clustering supplies a conditionally independent two-factor alias."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

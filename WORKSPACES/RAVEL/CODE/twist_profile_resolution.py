import json
from pathlib import Path

import numpy as np
from scipy.optimize import least_squares

OUT = Path("out")
OUT.mkdir(exist_ok=True)

NQ = 5001
u = np.linspace(0.0, 1.0, NQ)
du = u[1] - u[0]
trap = np.ones(NQ) * du
trap[[0, -1]] *= 0.5


def coherence(delta, lengths, modes, coeffs):
    coeffs = np.asarray(coeffs, float)
    basis = np.sin(np.pi * np.outer(np.arange(1, len(coeffs) + 1), u))
    shape = coeffs @ basis if len(coeffs) else np.zeros_like(u)
    vals = []
    for L in lengths:
        theta = delta * L * u + shape
        phase = np.exp(2j * theta)
        for n in modes:
            w = np.sin(n * np.pi * u) ** 2
            vals.append(2.0 * np.sum(trap * w * phase))
    return np.asarray(vals)


def jacobian(delta, lengths, modes, K):
    vals = []
    phase_by_L = [np.exp(2j * delta * L * u) for L in lengths]
    for phase in phase_by_L:
        for n in modes:
            w = np.sin(n * np.pi * u) ** 2
            vals.append([
                4j * np.sum(trap * w * np.sin(k * np.pi * u) * phase)
                for k in range(1, K + 1)
            ])
    Jc = np.asarray(vals)
    return np.vstack([Jc.real, Jc.imag])


def svd_summary(delta, lengths, modes, K=12):
    J = jacobian(delta, lengths, modes, K)
    _, s, vh = np.linalg.svd(J, full_matrices=False)
    rel = s / s[0]
    return {
        "lengths": list(lengths),
        "modes": list(modes),
        "real_observables": int(J.shape[0]),
        "basis_size": K,
        "algebraic_nullity": int(max(0, K - min(J.shape))),
        "rank_1e-3": int(np.sum(rel > 1e-3)),
        "rank_1e-2": int(np.sum(rel > 1e-2)),
        "condition_number": float(s[0] / s[-1]) if s[-1] else float("inf"),
        "singular_values": s.tolist(),
        "relative_singular_values": rel.tolist(),
        "v_min": vh[-1].tolist(),
    }


delta0 = -1.10
architectures = {
    "one_length_one_mode": svd_summary(delta0, [1.2], [1]),
    "six_lengths_one_mode": svd_summary(delta0, [0.55, 0.8, 1.1, 1.45, 1.85, 2.3], [1]),
    "six_lengths_three_modes": svd_summary(delta0, [0.55, 0.8, 1.1, 1.45, 1.85, 2.3], [1, 2, 3]),
    "six_lengths_five_modes": svd_summary(delta0, [0.55, 0.8, 1.1, 1.45, 1.85, 2.3], [1, 2, 3, 4, 5]),
}

# Blind sparse recovery in a declared six-function endpoint-preserving basis.
rng = np.random.default_rng(20261007)
lengths = np.array([0.55, 0.8, 1.1, 1.45, 1.85, 2.3])
modes = np.array([1, 2, 3])
true_delta = -1.07
true_a = np.array([0.080, -0.045, 0.0, 0.030, 0.0, -0.018])
sigma = 0.0015
y_clean = coherence(true_delta, lengths, modes, true_a)
y = y_clean + sigma * (rng.normal(size=y_clean.size) + 1j * rng.normal(size=y_clean.size))


def resid(p):
    pred = coherence(p[0], lengths, modes, p[1:])
    z = (pred - y) / sigma
    return np.r_[z.real, z.imag]


fit = least_squares(resid, np.zeros(7), max_nfev=2000, xtol=1e-13, ftol=1e-13, gtol=1e-13)
hold_L = np.array([0.68, 1.28, 2.05])
hold_modes = np.array([4])
hold_true = coherence(true_delta, hold_L, hold_modes, true_a)
hold_fit = coherence(fit.x[0], hold_L, hold_modes, fit.x[1:])
hold_rel = np.linalg.norm(hold_fit - hold_true) / np.linalg.norm(hold_true)

# Build a near-null profile using the smallest singular vector of the richest design.
rich = architectures["six_lengths_three_modes"]
vmin = np.asarray(rich["v_min"])
basis12 = np.sin(np.pi * np.outer(np.arange(1, 13), u))
profile_unit = vmin @ basis12
profile_unit /= np.sqrt(np.sum(trap * profile_unit**2))
base = coherence(delta0, lengths, modes, np.zeros(12))

def change_for_rms(rms):
    coeff = rms * vmin / np.sqrt(np.sum(trap * (vmin @ basis12) ** 2))
    alt = coherence(delta0, lengths, modes, coeff)
    return coeff, alt, np.max(np.abs(alt - base)), np.linalg.norm(alt - base) / np.linalg.norm(base)

# Largest RMS whose maximum complex-observable displacement stays under 0.002.
lo, hi = 0.0, 1.0
for _ in range(60):
    mid = (lo + hi) / 2
    if change_for_rms(mid)[2] <= 0.002:
        lo = mid
    else:
        hi = mid
null_coeff, null_alt, null_max, null_rel = change_for_rms(lo)
def response_change(extra_modes):
    b = coherence(delta0, lengths, extra_modes, np.zeros(12))
    z = coherence(delta0, lengths, extra_modes, null_coeff)
    return {
        "max_complex_change": float(np.max(np.abs(z-b))),
        "relative_l2_change": float(np.linalg.norm(z-b)/np.linalg.norm(b)),
    }

result = {
    "status": "GEN/CANDIDATE",
    "model": {
        "theta": "delta*L*u + sum_k a_k sin(k*pi*u)",
        "basis": "endpoint-preserving normalized-coordinate sine modes",
        "delta": delta0,
        "K": 12,
    },
    "architectures": architectures,
    "blind_recovery": {
        "seed": 20261007,
        "sigma_per_complex_component": sigma,
        "true_delta": true_delta,
        "fit_delta": float(fit.x[0]),
        "true_coefficients": true_a.tolist(),
        "fit_coefficients": fit.x[1:].tolist(),
        "training_reduced_chi2": float(np.sum(resid(fit.x)**2) / (2*y.size-len(fit.x))),
        "withheld_mode4_relative_error": float(hold_rel),
    },
    "near_null_profile": {
        "observable_noise_floor": 0.002,
        "profile_rms_phase_radians": float(lo),
        "coefficients": null_coeff.tolist(),
        "max_complex_observable_change": float(null_max),
        "relative_l2_observable_change": float(null_rel),
        "mode4_exposure": response_change([4]),
        "mode5_exposure": response_change([5]),
    },
}

(OUT / "twist_profile_resolution.json").write_text(json.dumps(result, indent=2) + "\n")

# Dependency-free diagnostic SVG.
W, H = 1000, 640
sv = np.asarray(architectures["six_lengths_three_modes"]["relative_singular_values"])
px = np.linspace(90, 940, len(sv))
py = 290 - (np.log10(np.maximum(sv, 1e-8)) + 8) / 8 * 220
prof = lo * profile_unit
x2 = np.linspace(90, 940, len(u))
y2 = 560 - (prof - prof.min()) / (prof.max()-prof.min()+1e-15) * 190
poly1 = " ".join(f"{x:.2f},{y:.2f}" for x,y in zip(px,py))
poly2 = " ".join(f"{x:.2f},{y:.2f}" for x,y in zip(x2[::10],y2[::10]))
svg=f'''<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}">
<rect width="100%" height="100%" fill="#0b1020"/><text x="50" y="45" fill="#f5f7ff" font-size="25" font-family="sans-serif">Twist-profile resolution and near-null morphology</text>
<text x="90" y="80" fill="#aeb9d6" font-size="15" font-family="sans-serif">Six lengths × three mode families; 12 endpoint-preserving profile coefficients</text>
<line x1="90" y1="290" x2="940" y2="290" stroke="#53617d"/><line x1="90" y1="70" x2="90" y2="290" stroke="#53617d"/>
<polyline points="{poly1}" fill="none" stroke="#56d6c9" stroke-width="4"/>
<text x="95" y="315" fill="#d6def4" font-size="15" font-family="sans-serif">relative singular spectrum (log10 scale, 0 to −8)</text>
<line x1="90" y1="560" x2="940" y2="560" stroke="#53617d"/><line x1="90" y1="365" x2="90" y2="560" stroke="#53617d"/>
<polyline points="{poly2}" fill="none" stroke="#ffb454" stroke-width="3"/>
<text x="95" y="590" fill="#d6def4" font-size="15" font-family="sans-serif">largest SVD near-null profile below 0.002 complex-response noise floor</text>
<text x="720" y="615" fill="#ffb454" font-size="15" font-family="sans-serif">RMS phase = {lo:.4f} rad</text>
</svg>'''
(OUT / "twist_profile_resolution.svg").write_text(svg)
print(json.dumps(result, indent=2))

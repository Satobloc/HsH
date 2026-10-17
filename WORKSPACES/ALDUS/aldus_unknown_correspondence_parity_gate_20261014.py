#!/usr/bin/env python3
"""Exact permutation-profiled O(4) parity gate and Monte Carlo audit.

GEN/DERIVED mathematical sandbox.  This tests an inference property of a
finite 4-D landmark model; it makes no empirical or physical SAT/H(s)H claim.
"""

from itertools import permutations
import numpy as np

SEED = 2026101416
N = 12000
PERMS = np.array(list(permutations(range(4))), dtype=int)


def wilson95(k: float, n: int) -> tuple[float, float]:
    """95% Wilson interval; k may be half-integral after randomized tie scoring."""
    z = 1.959963984540054
    phat = k / n
    den = 1.0 + z * z / n
    ctr = (phat + z * z / (2.0 * n)) / den
    rad = z / den * np.sqrt(phat * (1.0 - phat) / n + z * z / (4.0 * n * n))
    return float(ctr - rad), float(ctr + rad)


def parity_rss(y_aligned: np.ndarray, x: np.ndarray, parity: int) -> np.ndarray:
    """Constrained Procrustes RSS for batches y_aligned and det(Q)=parity."""
    m = y_aligned @ x.T
    s = np.linalg.svd(m, compute_uv=False)
    sign_m = np.sign(np.linalg.det(m))
    nuclear = s.sum(axis=-1)
    optimum = nuclear - 2.0 * s[..., -1] * (sign_m != parity)
    return ((y_aligned * y_aligned).sum(axis=(-2, -1))
            + (x * x).sum() - 2.0 * optimum)


def profile_unknown_order(y: np.ndarray, x: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    """Minimize each parity RSS over all 24 candidate column correspondences."""
    plus = np.full(y.shape[0], np.inf)
    minus = np.full(y.shape[0], np.inf)
    for perm in PERMS:
        aligned = y[:, :, perm]  # candidate inverse is also enumerated
        plus = np.minimum(plus, parity_rss(aligned, x, +1))
        minus = np.minimum(minus, parity_rss(aligned, x, -1))
    return plus, minus


def random_permute_columns(y: np.ndarray, rng: np.random.Generator) -> np.ndarray:
    out = np.empty_like(y)
    for i in range(len(y)):
        out[i] = y[i][:, rng.permutation(4)]
    return out


def run_cell(delta: float, sigma: float, rng: np.random.Generator) -> tuple[float, float, float, float, float]:
    # delta resolves the three formerly equal landmark radii; epsilon=0.4 stays nonzero.
    x = np.diag([1.0, 1.0 + delta, 1.0 + 2.0 * delta, 0.4])
    clean = np.broadcast_to(x, (N, 4, 4)).copy()  # true Q=I, det(Q)=+1
    y = random_permute_columns(clean + rng.normal(0.0, sigma, clean.shape), rng)
    rp, rm = profile_unknown_order(y, x)
    tol = 2e-11 * np.maximum(1.0, np.maximum(np.abs(rp), np.abs(rm)))
    tie = np.abs(rp - rm) <= tol
    wrong = rm < rp - tol
    # Random guessing on exact ties is the calibrated error convention.
    effective_wrong = float(wrong.sum() + 0.5 * tie.sum())
    calibrated_error = effective_wrong / N
    lo, hi = wilson95(effective_wrong, N)
    return calibrated_error, tie.mean(), np.median(np.abs(rp - rm)), lo, hi


def main() -> None:
    rng = np.random.default_rng(SEED)

    # Algebraic negative control: an odd symmetry commuting with X makes the
    # two parity model sets identical, so their profiled RSS must tie for every Y.
    x_equal = np.diag([1.0, 1.0, 1.0, 0.4])
    y_probe = rng.normal(size=(257, 4, 4))
    rp, rm = profile_unknown_order(y_probe, x_equal)
    symmetry_residual = float(np.max(np.abs(rp - rm)))
    assert symmetry_residual < 2e-12

    # Labeled-column control: the original determinant-sign GLRT is recovered.
    x_distinct = np.diag([1.0, 1.2, 1.4, 0.4])
    y_label = x_distinct[None] + rng.normal(0, 0.08, (5000, 4, 4))
    labeled_wrong = float((np.linalg.det(y_label @ x_distinct.T) < 0).mean())
    labeled_rp = parity_rss(y_label, x_distinct, +1)
    labeled_rm = parity_rss(y_label, x_distinct, -1)
    labeled_disagreement = int(np.count_nonzero((labeled_rm < labeled_rp) !=
                                                (np.linalg.det(y_label @ x_distinct.T) < 0)))
    assert labeled_disagreement == 0

    print("unknown-correspondence O(4) parity gate")
    print(f"seed={SEED}; trials/cell={N}; permutations=24")
    print(f"equal-radius exact profile residual={symmetry_residual:.3e} L^2")
    print(f"labeled control wrong={labeled_wrong:.6f}; decision disagreements={labeled_disagreement}")
    print("delta/L sigma/L calibrated_error Wilson95 tie_fraction median_|DeltaRSS|/L^2")
    rows = []
    for delta in (0.0, 0.02, 0.05, 0.10, 0.20):
        for sigma in (0.02, 0.05, 0.10):
            error, ties, gap, lo, hi = run_cell(delta, sigma, rng)
            rows.append((delta, sigma, error, ties, gap, lo, hi))
            print(f"{delta:7.3f} {sigma:7.3f} {error:16.6f} "
                  f"[{lo:.6f},{hi:.6f}] {ties:12.6f} {gap:22.9g}")

    # Limiting-case assertions: exact degeneracy carries zero information;
    # well-separated landmarks at low noise recover parity.
    for row in rows[:3]:
        assert abs(row[2] - 0.5) < 1e-12 and row[3] == 1.0
    strong = next(r for r in rows if r[0] == 0.20 and r[1] == 0.02)
    assert strong[2] < 1e-3 and strong[3] == 0.0


if __name__ == "__main__":
    main()

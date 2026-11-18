#!/usr/bin/env python3
"""Exact arithmetic cross-check for published judge-error dependence figures.

No model calls, human subjects, or synthetic benchmark outputs are generated.
The two finite countermodels are mathematical examples only.
"""
from fractions import Fraction


def effective_n(n: int, rho: Fraction) -> Fraction:
    """Exchangeable-correlation variance-effective size."""
    return Fraction(n, 1) / (1 + (n - 1) * rho)


def effective_n_from_corr_matrix(matrix: list[list[Fraction]]) -> Fraction:
    """Equal-variance effective size n^2 / sum(R_ij) for a correlation matrix."""
    n = len(matrix)
    return Fraction(n * n, sum(sum(row) for row in matrix))


def equicorrelation_matrix(n: int, rho: Fraction) -> list[list[Fraction]]:
    return [[Fraction(1, 1) if i == j else rho for j in range(n)] for i in range(n)]


CASES = [
    ("10 judges RewardBench", 10, Fraction(206, 1000)),
    ("10 judges UltraFeedback", 10, Fraction(219, 1000)),
    ("10 judges PKU-SafeRLHF", 10, Fraction(273, 1000)),
    ("3 frontier judges RewardBench", 3, Fraction(56, 100)),
    ("6 frontier judges PKU-SafeRLHF", 6, Fraction(41, 100)),
    ("controlled weak dependence", 10, Fraction(223, 1000)),
    ("controlled global co-failure", 10, Fraction(318, 1000)),
    ("controlled vulnerable subgroup", 10, Fraction(133, 1000)),
]


def main() -> None:
    print("case | n | rho | design effect | n_eff")
    for name, n, rho in CASES:
        de = 1 + (n - 1) * rho
        n_eff = effective_n(n, rho)
        print(f"{name} | {n} | {float(rho):.3f} | {float(de):.3f} | {float(n_eff):.4f}")

    rho = Fraction(206, 1000)
    assert effective_n(10, rho) == effective_n_from_corr_matrix(equicorrelation_matrix(10, rho))

    # Model A: two distinct evidence roots, but one shared latent error bit.
    roots_a, roots_b = {"root-A"}, {"root-B"}
    omega2 = (False, True)
    error_a = lambda w: w
    error_b = lambda w: w
    probability2 = lambda event: Fraction(sum(1 for w in omega2 if event(w)), 2)
    p_a = probability2(error_a)
    p_b = probability2(error_b)
    p_ab = probability2(lambda w: error_a(w) and error_b(w))
    covariance = p_ab - p_a * p_b
    variance_a = p_a * (1 - p_a)
    variance_b = p_b * (1 - p_b)
    assert variance_a == variance_b == Fraction(1, 4)
    correlation = covariance / Fraction(1, 4)
    assert roots_a.isdisjoint(roots_b)
    assert all(error_a(w) == error_b(w) for w in omega2)
    assert p_a == p_b == Fraction(1, 2)
    assert p_ab == Fraction(1, 2)
    assert p_ab != p_a * p_b
    assert covariance == Fraction(1, 4)
    assert correlation == 1
    print("Model A | disjoint roots | P(EA)=P(EB)=1/2 | P(EA&EB)=1/2 | cov=1/4 | corr=1")

    # Model B: shared evidence root, but independent extraction-noise bits.
    shared_roots_a = shared_roots_b = {"root-C"}
    omega4 = ((False, False), (False, True), (True, False), (True, True))
    error_c = lambda w: w[0]
    error_d = lambda w: w[1]
    probability4 = lambda event: Fraction(sum(1 for w in omega4 if event(w)), 4)
    p_c = probability4(error_c)
    p_d = probability4(error_d)
    p_cd = probability4(lambda w: error_c(w) and error_d(w))
    cov_cd = p_cd - p_c * p_d
    assert shared_roots_a == shared_roots_b
    assert p_c == p_d == Fraction(1, 2)
    assert p_cd == p_c * p_d == Fraction(1, 4)
    assert cov_cd == 0
    print("Model B | shared root | P(EC)=P(ED)=1/2 | P(EC&ED)=1/4 | cov=0 | extraction-noise independent")
    print("PASS: source-root overlap and error dependence are orthogonal in these finite countermodels.")


if __name__ == "__main__":
    main()

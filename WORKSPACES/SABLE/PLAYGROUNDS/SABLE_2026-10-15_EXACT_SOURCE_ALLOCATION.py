#!/usr/bin/env python3
"""Exact grouped-beta-binomial source allocation under a fixed budget.

No third-party packages are required.  A design has G independent sources,
m reports per source, source overhead h, and cost G(h+m) <= B.  Reports from
one source have exchangeable Bernoulli intraclass correlation rho.
"""

from __future__ import annotations

import math


def beta_binomial_pmf(m: int, p: float, rho: float) -> list[float]:
    """P(X=k), k=0..m, for a beta-binomial exchangeable source group."""
    if not (0.0 < p < 1.0 and 0.0 <= rho < 1.0):
        raise ValueError("require 0<p<1 and 0<=rho<1")
    if rho == 0.0:
        q = [math.comb(m, k) * p**k * (1.0 - p) ** (m - k)
             for k in range(m + 1)]
    else:
        a = p * (1.0 / rho - 1.0)
        b = (1.0 - p) * (1.0 / rho - 1.0)
        log_beta_ab = math.lgamma(a) + math.lgamma(b) - math.lgamma(a + b)
        q = []
        for k in range(m + 1):
            log_q = (
                math.lgamma(m + 1) - math.lgamma(k + 1)
                - math.lgamma(m - k + 1)
                + math.lgamma(k + a) + math.lgamma(m - k + b)
                - math.lgamma(m + a + b) - log_beta_ab
            )
            q.append(math.exp(log_q))
    z = math.fsum(q)
    return [x / z for x in q]


def convolve(a: list[float], b: list[float]) -> list[float]:
    out = [0.0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def total_pmf(G: int, m: int, p: float, rho: float) -> list[float]:
    """PMF of total confirmations K from G independent source groups."""
    group = beta_binomial_pmf(m, p, rho)
    out = [1.0]
    for _ in range(G):
        out = convolve(out, group)
    z = math.fsum(out)
    return [x / z for x in out]


def randomized_upper_test(
    null: list[float], alt: list[float], alpha: float
) -> tuple[int, float, float, float]:
    """Exact-size upper-tail count test.

    Reject for K>r; when K=r reject with probability gamma.  Returns
    (r, gamma, attained_size, power).  Randomization removes discreteness as
    a confounder when comparing designs with different N.
    """
    n = len(null) - 1
    if len(alt) != len(null):
        raise ValueError("null and alternative PMFs must have equal support")
    upper_strict = [0.0] * (n + 1)
    running = 0.0
    for r in range(n, -1, -1):
        upper_strict[r] = running
        running += null[r]
    for r in range(n, -1, -1):
        lo = upper_strict[r]
        hi = lo + null[r]
        if lo <= alpha <= hi + 1e-15:
            gamma = (alpha - lo) / null[r]
            size = lo + gamma * null[r]
            power = math.fsum(alt[r + 1:]) + gamma * alt[r]
            return r, gamma, size, power
    raise ArithmeticError("could not bracket alpha")


def evaluate(
    G: int, m: int, h: int, p0: float, p1: float, rho: float, alpha: float
) -> dict[str, float | int]:
    q0 = total_pmf(G, m, p0, rho)
    q1 = total_pmf(G, m, p1, rho)
    r, gamma, size, power = randomized_upper_test(q0, q1, alpha)
    n = G * m
    deff = 1.0 + (m - 1) * rho
    return {
        "G": G, "m": m, "cost": G * (h + m), "N": n,
        "N_eff": n / deff, "r": r, "gamma": gamma,
        "size": size, "power": power,
    }


def search(
    B: int, h: int, p0: float, p1: float, rho: float, alpha: float
) -> list[dict[str, float | int]]:
    rows = []
    for G in range(1, B + 1):
        for m in range(1, B + 1):
            if G * (h + m) > B:
                break
            rows.append(evaluate(G, m, h, p0, p1, rho, alpha))
    return sorted(rows, key=lambda x: float(x["power"]), reverse=True)


def print_row(tag: str, x: dict[str, float | int]) -> None:
    print(
        f"{tag:16s} G={x['G']:3d} m={x['m']:3d} cost={x['cost']:3d} "
        f"N={x['N']:3d} Neff={x['N_eff']:9.6f} r={x['r']:3d} "
        f"gamma={x['gamma']:.9f} size={x['size']:.12f} "
        f"power={x['power']:.12f}"
    )


def main() -> None:
    B, h = 200, 4
    p0, p1, rho, alpha = 0.05, 0.15, 0.10, 0.01
    continuous_m = math.sqrt(h * (1.0 - rho) / rho)
    print(f"fixture B={B}, h={h}, p0={p0}, p1={p1}, rho={rho}, alpha={alpha}")
    print(f"continuous variance-optimal m*={continuous_m:.12f}")
    rows = search(B, h, p0, p1, rho, alpha)
    for i, row in enumerate(rows[:5], 1):
        print_row(f"rank {i}", row)
    print("integer profile (best G for each m=1..12)")
    for m in range(1, 13):
        print_row(f"m={m}", max((x for x in rows if x["m"] == m),
                                key=lambda x: float(x["power"])))

    # Negative control: removing within-source correlation makes all reports
    # iid; maximum report count (one source, m=B-h) must win.
    iid = search(B, h, p0, p1, 0.0, alpha)
    print_row("rho=0 optimum", iid[0])
    assert iid[0]["G"] == 1 and iid[0]["m"] == B - h

    # Limiting control: zero source overhead and positive rho favor m=1.
    free_sources = search(60, 0, p0, p1, rho, alpha)
    print_row("h=0 optimum", free_sources[0])
    assert free_sources[0]["m"] == 1

    # Probability normalization and exact-size checks.
    for row in (rows[0], iid[0], free_sources[0]):
        assert abs(float(row["size"]) - alpha) < 5e-13
    print("checks: PASS")


if __name__ == "__main__":
    main()

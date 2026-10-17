#!/usr/bin/env python3
"""Calder unequal-domain tail identifiability gate.

GEN/DERIVED synthetic null calculation.  Extend Aldus's independent
Beta-Bernoulli block model from equal to unequal contiguous domains.  For
block sizes n_i, total count K has

  E[K]   = n q,
  Var[K] = n q(1-q) + q(1-q) rho * sum_i n_i(n_i-1).

Thus fixed n, q, local rho, and sum(n_i^2) fix both the variance and the
average pairwise ICC, but need not fix the tail.  We exhaust every unordered
integer partition satisfying sum(n_i)=100 and sum(n_i^2)=400, then compute
the exact independent-block convolution P(K>=8).

The fixture parameters q=.01 and rho=1/11 are inherited only from Aldus's
synthetic checkpoint.  No empirical, authorship, worker-quality, or
SAT/H(s)H physics claim is made.
"""

from __future__ import annotations

import math
from collections import defaultdict
from dataclasses import dataclass
from decimal import Decimal, getcontext
from typing import Iterator

import numpy as np
from scipy.special import betaln, gammaln


N = 100
Q = 0.01
LOCAL_RHO = 1.0 / 11.0
TARGET_SUM_SQUARES = 400
CUTOFF = 8


@dataclass(frozen=True)
class Extremum:
    tail: float
    partition: tuple[int, ...]


def beta_binomial_pmf(size: int, q: float, rho: float) -> np.ndarray:
    """Normalized beta-binomial PMF; rho=0 is evaluated binomially."""
    k = np.arange(size + 1, dtype=float)
    log_choose = gammaln(size + 1) - gammaln(k + 1) - gammaln(size - k + 1)
    if rho == 0.0:
        log_p = log_choose + k * math.log(q) + (size - k) * math.log1p(-q)
    else:
        concentration = 1.0 / rho - 1.0
        alpha = q * concentration
        beta = (1.0 - q) * concentration
        log_p = log_choose + betaln(k + alpha, size - k + beta) - betaln(alpha, beta)
    p = np.exp(log_p)
    return p / p.sum()


def admissible_partitions(
    remaining: int = N,
    remaining_squares: int = TARGET_SUM_SQUARES,
    maximum: int = N,
    prefix: tuple[int, ...] = (),
) -> Iterator[tuple[int, ...]]:
    """Generate each unordered positive partition exactly once."""
    if remaining == 0:
        if remaining_squares == 0:
            yield prefix
        return
    if remaining_squares < remaining:
        return
    maximum = min(maximum, remaining, math.isqrt(remaining_squares))
    for size in range(maximum, 0, -1):
        rem = remaining - size
        rem_sq = remaining_squares - size * size
        if rem_sq < rem:
            continue
        # Since subsequent parts are <= size, this upper bound prunes safely.
        if rem and rem_sq > rem * min(size, rem):
            continue
        yield from admissible_partitions(rem, rem_sq, size, prefix + (size,))


def independent_partition_count() -> int:
    """Second count via a bivariate unbounded-knapsack generating function."""
    ways: dict[tuple[int, int], int] = {(0, 0): 1}
    for size in range(1, math.isqrt(TARGET_SUM_SQUARES) + 1):
        updated = dict(ways)
        # Unlimited copies of this size; ascending totals enable reuse.
        for total in range(size, N + 1):
            for square in range(size * size, TARGET_SUM_SQUARES + 1):
                source = (total - size, square - size * size)
                if source in updated:
                    updated[(total, square)] = updated.get((total, square), 0) + updated[source]
        ways = updated
    return ways.get((N, TARGET_SUM_SQUARES), 0)


def distribution(partition: tuple[int, ...], pmfs: dict[int, np.ndarray]) -> np.ndarray:
    out = np.array([1.0])
    for size in partition:
        out = np.convolve(out, pmfs[size])
    return out


def moments(pmf: np.ndarray) -> tuple[float, float]:
    k = np.arange(len(pmf), dtype=float)
    mean = float(k @ pmf)
    variance = float(((k - mean) ** 2) @ pmf)
    return mean, variance


def high_precision_tail(partition: tuple[int, ...]) -> Decimal:
    """Independent 80-digit convolution for final extrema."""
    getcontext().prec = 80
    concentration = Decimal(1) / Decimal(str(LOCAL_RHO)) - Decimal(1)
    alpha = Decimal(str(Q)) * concentration
    beta = (Decimal(1) - Decimal(str(Q))) * concentration
    cache: dict[int, list[Decimal]] = {}
    for size in set(partition):
        # Exact beta-binomial recurrence, avoiding special functions.
        p0 = Decimal(1)
        for i in range(size):
            p0 *= (beta + i) / (alpha + beta + i)
        probs = [p0]
        for k in range(size):
            ratio = (
                Decimal(size - k)
                / Decimal(k + 1)
                * (Decimal(k) + alpha)
                / (Decimal(size - k - 1) + beta)
            )
            probs.append(probs[-1] * ratio)
        cache[size] = probs
    out = [Decimal(1)]
    for size in partition:
        nxt = [Decimal(0)] * (len(out) + size)
        for i, x in enumerate(out):
            for j, y in enumerate(cache[size]):
                nxt[i + j] += x * y
        out = nxt
    return sum(out[CUTOFF:], Decimal(0))


def compact(partition: tuple[int, ...]) -> str:
    counts: dict[int, int] = defaultdict(int)
    for size in partition:
        counts[size] += 1
    return "+".join(
        f"{count}x{size}" for size, count in sorted(counts.items(), reverse=True)
    )


def main() -> None:
    pmfs = {
        size: beta_binomial_pmf(size, Q, LOCAL_RHO)
        for size in range(1, math.isqrt(TARGET_SUM_SQUARES) + 1)
    }
    minimum = Extremum(float("inf"), ())
    maximum = Extremum(float("-inf"), ())
    by_blocks: dict[int, list[float]] = {}
    enumerated = 0

    for partition in admissible_partitions():
        enumerated += 1
        pmf = distribution(partition, pmfs)
        tail = float(pmf[CUTOFF:].sum())
        if tail < minimum.tail:
            minimum = Extremum(tail, partition)
        if tail > maximum.tail:
            maximum = Extremum(tail, partition)
        count = len(partition)
        if count not in by_blocks:
            by_blocks[count] = [tail, tail]
        else:
            by_blocks[count][0] = min(by_blocks[count][0], tail)
            by_blocks[count][1] = max(by_blocks[count][1], tail)

    dp_count = independent_partition_count()
    common_pairs = TARGET_SUM_SQUARES - N
    average_icc = LOCAL_RHO * common_pairs / (N * (N - 1))
    expected_variance = N * Q * (1 - Q) + Q * (1 - Q) * LOCAL_RHO * common_pairs

    min_pmf = distribution(minimum.partition, pmfs)
    max_pmf = distribution(maximum.partition, pmfs)
    min_mean, min_var = moments(min_pmf)
    max_mean, max_var = moments(max_pmf)

    global_control = beta_binomial_pmf(N, Q, average_icc)
    global_tail = float(global_control[CUTOFF:].sum())
    independent_tail = float(beta_binomial_pmf(N, Q, 0.0)[CUTOFF:].sum())

    min_mp = high_precision_tail(minimum.partition)
    max_mp = high_precision_tail(maximum.partition)
    min_num_error = abs(minimum.tail - float(min_mp))
    max_num_error = abs(maximum.tail - float(max_mp))
    order_error = float(
        np.max(
            np.abs(
                distribution(maximum.partition, pmfs)
                - distribution(tuple(reversed(maximum.partition)), pmfs)
            )
        )
    )

    assert enumerated == dp_count == 37_964
    assert abs(min_mean - N * Q) < 3e-14
    assert abs(max_mean - N * Q) < 3e-14
    assert abs(min_var - expected_variance) < 3e-13
    assert abs(max_var - expected_variance) < 3e-13
    assert min_num_error < 2e-16 and max_num_error < 2e-16
    assert order_error < 2e-15
    assert minimum.partition == (4,) * 25

    print(f"partitions_enumerated={enumerated}")
    print(f"independent_count={dp_count}")
    print(f"fixed_mean={N*Q:.12f}")
    print(f"fixed_variance={expected_variance:.12f}")
    print(f"fixed_average_pairwise_icc={average_icc:.12f}")
    print(f"minimum_partition={compact(minimum.partition)}")
    print(f"minimum_tail={minimum.tail:.15g}")
    print(f"maximum_partition={compact(maximum.partition)}")
    print(f"maximum_tail={maximum.tail:.15g}")
    print(f"extremal_ratio={maximum.tail/minimum.tail:.12f}")
    print(f"matched_global_beta_tail={global_tail:.15g}")
    print(f"independent_tail={independent_tail:.15g}")
    for blocks in (25, 30, 40, 50, 60, 70, 77):
        lo, hi = by_blocks[blocks]
        print(f"blocks_{blocks}_tail_range=[{lo:.12g},{hi:.12g}]")
    print(f"max_moment_mean_error={max(abs(min_mean-N*Q),abs(max_mean-N*Q)):.3e}")
    print(f"max_moment_variance_error={max(abs(min_var-expected_variance),abs(max_var-expected_variance)):.3e}")
    print(f"max_high_precision_tail_error={max(min_num_error,max_num_error):.3e}")
    print(f"order_permutation_error={order_error:.3e}")
    print("status=PASS")
    print(
        "boundary=independent exchangeable Beta-Bernoulli domains with fixed "
        "synthetic q,rho; domain order is unidentifiable in this count-only model"
    )


if __name__ == "__main__":
    main()

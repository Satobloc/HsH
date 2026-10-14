#!/usr/bin/env python3
"""Hale: run-order statistic gate for Calder's unequal-domain tails.

Calder fixed N=100, q=.01, local rho=1/11 and sum(n_i^2)=400, leaving
37,964 possible independent Beta-Bernoulli domain partitions with different
P(K>=8).  Here domains are contiguous in observation order and we add

    A = sum_{t=1}^{N-1} X_t X_{t+1},

the number of adjacent positive-positive pairs.  If B is the number of
domains, then, without global exchangeability,

    E[A|B] = (N-1)q^2 + (N-B) rho q(1-q).

Thus an accurately estimated run-order mean identifies B and contracts the
tail interval to the B-specific partition family.  Exact beta moments also
show how many independent replicate sequences would be needed to resolve B;
a single chronology is not silently promoted to an ensemble.

Status: GEN/DERIVED synthetic provenance mathematics; no empirical or
SAT/H(s)H physics claim.
"""

from __future__ import annotations

import json
import math
from collections import defaultdict
from dataclasses import asdict, dataclass
from typing import Iterator

import numpy as np
from scipy.special import betaln, gammaln


N = 100
Q = 0.01
LOCAL_RHO = 1.0 / 11.0
TARGET_SUM_SQUARES = 400
CUTOFF = 8
Z95 = 1.959963984540054


@dataclass(frozen=True)
class Extremum:
    tail: float
    partition: tuple[int, ...]


def beta_binomial_pmf(size: int) -> np.ndarray:
    k = np.arange(size + 1, dtype=float)
    log_choose = gammaln(size + 1) - gammaln(k + 1) - gammaln(size - k + 1)
    concentration = 1.0 / LOCAL_RHO - 1.0
    alpha = Q * concentration
    beta = (1.0 - Q) * concentration
    log_p = log_choose + betaln(k + alpha, size - k + beta) - betaln(alpha, beta)
    p = np.exp(log_p)
    return p / p.sum()


def admissible_partitions(
    remaining: int = N,
    remaining_squares: int = TARGET_SUM_SQUARES,
    maximum: int = N,
    prefix: tuple[int, ...] = (),
) -> Iterator[tuple[int, ...]]:
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
        if rem and rem_sq > rem * min(size, rem):
            continue
        yield from admissible_partitions(rem, rem_sq, size, prefix + (size,))


def distribution(partition: tuple[int, ...], pmfs: dict[int, np.ndarray]) -> np.ndarray:
    out = np.array([1.0])
    for size in partition:
        out = np.convolve(out, pmfs[size])
    return out


def compact(partition: tuple[int, ...]) -> str:
    counts: dict[int, int] = defaultdict(int)
    for size in partition:
        counts[size] += 1
    return "+".join(
        f"{count}x{size}" for size, count in sorted(counts.items(), reverse=True)
    )


def expected_adjacency(blocks: int) -> float:
    return (N - 1) * Q**2 + (N - blocks) * LOCAL_RHO * Q * (1.0 - Q)


def beta_moment(order: int) -> float:
    """E[theta^order] for theta~Beta(alpha,beta)."""
    concentration = 1.0 / LOCAL_RHO - 1.0
    alpha = Q * concentration
    value = 1.0
    for j in range(order):
        value *= (alpha + j) / (concentration + j)
    return value


def adjacency_variance(partition: tuple[int, ...]) -> tuple[float, float]:
    """Exact E[A], Var[A] for the declared contiguous domain order."""
    domain = np.concatenate([
        np.full(size, index, dtype=int) for index, size in enumerate(partition)
    ])
    edges = [(t, t + 1) for t in range(N - 1)]

    def product_expectation(selected_edges: tuple[tuple[int, int], ...]) -> float:
        vertices_by_domain: dict[int, set[int]] = defaultdict(set)
        for edge in selected_edges:
            for vertex in edge:
                vertices_by_domain[int(domain[vertex])].add(vertex)
        out = 1.0
        for vertices in vertices_by_domain.values():
            out *= beta_moment(len(vertices))
        return out

    means = np.array([product_expectation((edge,)) for edge in edges])
    covariance_sum = 0.0
    for i, edge_i in enumerate(edges):
        for j, edge_j in enumerate(edges):
            covariance_sum += product_expectation((edge_i, edge_j)) - means[i] * means[j]
    return float(np.sum(means)), float(covariance_sum)


def replicate_requirement(variance: float, mean_gap: float) -> int:
    """Replicates for a 95% mean CI half-width below half the gap."""
    return math.ceil((2.0 * Z95 * math.sqrt(variance) / mean_gap) ** 2)


def main() -> None:
    pmfs = {size: beta_binomial_pmf(size) for size in range(1, 21)}
    global_min = Extremum(float("inf"), ())
    global_max = Extremum(float("-inf"), ())
    by_blocks: dict[int, list[Extremum | int]] = {}
    enumerated = 0

    for partition in admissible_partitions():
        enumerated += 1
        tail = float(np.sum(distribution(partition, pmfs)[CUTOFF:]))
        blocks = len(partition)
        if blocks not in by_blocks:
            by_blocks[blocks] = [Extremum(tail, partition), Extremum(tail, partition), 1]
        else:
            lo, hi, count = by_blocks[blocks]
            assert isinstance(lo, Extremum) and isinstance(hi, Extremum)
            by_blocks[blocks] = [
                Extremum(tail, partition) if tail < lo.tail else lo,
                Extremum(tail, partition) if tail > hi.tail else hi,
                int(count) + 1,
            ]
        if tail < global_min.tail:
            global_min = Extremum(tail, partition)
        if tail > global_max.tail:
            global_max = Extremum(tail, partition)

    selected_blocks = sorted(set((25, 50, 77)) & set(by_blocks))
    block_summaries = {}
    for blocks in selected_blocks:
        lo, hi, count = by_blocks[blocks]
        assert isinstance(lo, Extremum) and isinstance(hi, Extremum)
        block_summaries[str(blocks)] = {
            "partition_count": int(count),
            "expected_adjacent_positive_pairs": expected_adjacency(blocks),
            "minimum_tail": lo.tail,
            "minimum_partition": compact(lo.partition),
            "maximum_tail": hi.tail,
            "maximum_partition": compact(hi.partition),
            "tail_ratio": hi.tail / lo.tail,
            "absolute_interval_width": hi.tail - lo.tail,
            "width_contraction_vs_global": (
                (global_max.tail - global_min.tail) / (hi.tail - lo.tail)
                if hi.tail > lo.tail else None
            ),
        }

    min_mean_a, min_var_a = adjacency_variance(global_min.partition)
    max_mean_a, max_var_a = adjacency_variance(global_max.partition)
    assert abs(min_mean_a - expected_adjacency(len(global_min.partition))) < 2e-14
    assert abs(max_mean_a - expected_adjacency(len(global_max.partition))) < 2e-14

    one_block_gap = LOCAL_RHO * Q * (1.0 - Q)
    extreme_gap = abs(min_mean_a - max_mean_a)
    worst_extreme_variance = max(min_var_a, max_var_a)

    payload = {
        "status": (
            "GEN/DERIVED synthetic provenance mathematics; no empirical, "
            "authorship, worker-quality, or physics inference"
        ),
        "fixture": {
            "N": N,
            "q": Q,
            "local_rho": LOCAL_RHO,
            "sum_domain_size_squares": TARGET_SUM_SQUARES,
            "tail_event": "K>=8",
            "order_statistic": "A=sum X_t X_(t+1)",
            "partitions_enumerated": enumerated,
        },
        "derived_mean": (
            "E[A|B]=(N-1)q^2+(N-B)rho*q*(1-q); depends only on domain count B"
        ),
        "global_interval": {
            "minimum_tail": global_min.tail,
            "minimum_partition": compact(global_min.partition),
            "minimum_blocks": len(global_min.partition),
            "maximum_tail": global_max.tail,
            "maximum_partition": compact(global_max.partition),
            "maximum_blocks": len(global_max.partition),
            "tail_ratio": global_max.tail / global_min.tail,
        },
        "ideal_exact_B_conditioning": block_summaries,
        "realizability_gate": {
            "mean_change_per_one_domain": one_block_gap,
            "global_min_partition_adjacency_mean": min_mean_a,
            "global_min_partition_adjacency_variance": min_var_a,
            "global_max_partition_adjacency_mean": max_mean_a,
            "global_max_partition_adjacency_variance": max_var_a,
            "replicates_to_separate_global_extrema_95pct_half_gap_using_worst_extremal_variance": (
                replicate_requirement(worst_extreme_variance, extreme_gap)
            ),
            "replicates_to_resolve_one_domain_95pct_half_gap_using_worst_extremal_variance": (
                replicate_requirement(worst_extreme_variance, one_block_gap)
            ),
            "single_sequence_identifies_B": False,
        },
        "negative_control": (
            "Randomly permuting observation order erases the contiguous-domain "
            "interpretation of A; count K and Calder's original interval remain unchanged."
        ),
        "conclusion": (
            "Run order can contract the tail-identifiability interval only when "
            "adjacency is retained and its expectation is estimated precisely enough "
            "to constrain B. At this rare-event fixture, one chronology is far too noisy."
        ),
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

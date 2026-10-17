#!/usr/bin/env python3
"""Exact modular fairness and handoff-latency gate for the 5x19 relay.

Status: computational systems result, not SAT/H(s)H theory evidence.

Definitions
-----------
S : number of equally spaced slots per hour.
N : number of workers in the ring.
h : integer hour offset.
s : slot index, 0 <= s < S.
n = S*h+s : global firing number.
i(n) = n mod N : selected worker index.

For a fixed worker i, its kth occurrence is n_k=i+kN, hence

    s_k = n_k mod S = (i+kN) mod S.

The slot sequence has period S/gcd(S,N).  Consequently every worker visits
every slot iff gcd(S,N)=1.  For S=5,N=19, 95 consecutive firings form a
balanced supercycle: every worker occurs five times, once in each slot, and
every directed ring edge is traversed five times.

Handoff model
-------------
Adjacent nominal starts are Delta minutes apart.  If predecessor and successor
start jitters E_p,E_s are independent Uniform[-J,J], and predecessor runtime is
D, the packet exists at successor start iff

    D <= Delta + E_s - E_p.

The difference E_s-E_p is triangular on [-2J,2J], giving the closed form in
availability_probability().  Monte Carlo below is a seeded numerical check,
not the source of the formula.
"""

from __future__ import annotations

import argparse
import json
import math
import random
from collections import Counter


def availability_probability(runtime_min: float, gap_min: float, jitter_min: float) -> float:
    """P(packet ready by successor start) for independent uniform start jitter."""
    if jitter_min < 0:
        raise ValueError("jitter_min must be nonnegative")
    t = runtime_min - gap_min
    if jitter_min == 0:
        return float(t <= 0)
    width = 2.0 * jitter_min
    if t <= -width:
        return 1.0
    if t <= 0.0:
        return 1.0 - (t + width) ** 2 / (8.0 * jitter_min**2)
    if t < width:
        return (width - t) ** 2 / (8.0 * jitter_min**2)
    return 0.0


def monte_carlo_probability(
    runtime_min: float,
    gap_min: float,
    jitter_min: float,
    trials: int,
    seed: int,
) -> tuple[float, float]:
    """Return estimate and binomial standard error for the same gate."""
    rng = random.Random(seed)
    ready = 0
    for _ in range(trials):
        ep = rng.uniform(-jitter_min, jitter_min)
        es = rng.uniform(-jitter_min, jitter_min)
        ready += runtime_min <= gap_min + es - ep
    p = ready / trials
    return p, math.sqrt(p * (1.0 - p) / trials)


def fairness_report(slots: int, workers: int) -> dict:
    if slots <= 0 or workers <= 0:
        raise ValueError("slots and workers must be positive")
    g = math.gcd(slots, workers)
    supercycle = math.lcm(slots, workers)
    worker_slot_counts = Counter()
    edge_counts = Counter()
    for n in range(supercycle):
        worker = n % workers
        slot = n % slots
        worker_slot_counts[worker, slot] += 1
        edge_counts[worker, (worker + 1) % workers] += 1
    fixed_slot_period_hours = workers // g
    return {
        "slots": slots,
        "workers": workers,
        "gcd": g,
        "supercycle_firings": supercycle,
        "supercycle_hours": supercycle / slots,
        "fixed_slot_worker_period_hours": fixed_slot_period_hours,
        "worker_return_firings": workers,
        "worker_visits_every_slot": g == 1,
        "worker_slot_count_values": sorted(set(worker_slot_counts.values())),
        "ring_edge_count_values": sorted(set(edge_counts.values())),
        "verified_balanced": (
            len(worker_slot_counts) == workers * slots
            and set(worker_slot_counts.values()) == {supercycle // (workers * slots)}
            and len(edge_counts) == workers
            and set(edge_counts.values()) == {supercycle // workers}
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--slots", type=int, default=5)
    parser.add_argument("--workers", type=int, default=19)
    parser.add_argument("--gap", type=float, default=12.0, help="nominal slot gap, minutes")
    parser.add_argument("--jitter", type=float, default=5.0, help="uniform start jitter half-width, minutes")
    parser.add_argument("--trials", type=int, default=300_000)
    parser.add_argument("--seed", type=int, default=20261013)
    parser.add_argument("--runtimes", type=float, nargs="+", default=[2, 8, 12, 15, 20, 22])
    args = parser.parse_args()

    fair = fairness_report(args.slots, args.workers)
    fair["worker_return_minutes"] = args.workers * args.gap
    fair["same_worker_same_slot_minutes"] = fair["fixed_slot_worker_period_hours"] * 60

    latency = []
    for j, runtime in enumerate(args.runtimes):
        exact = availability_probability(runtime, args.gap, args.jitter)
        estimate, se = monte_carlo_probability(
            runtime, args.gap, args.jitter, args.trials, args.seed + j
        )
        latency.append(
            {
                "runtime_min": runtime,
                "analytic_probability": exact,
                "monte_carlo_probability": estimate,
                "monte_carlo_standard_error": se,
                "z_error": 0.0 if se == 0 else (estimate - exact) / se,
            }
        )

    # Negative controls and symmetry checks are exact assertions.
    assert availability_probability(args.gap, args.gap, args.jitter) == 0.5
    assert availability_probability(args.gap - 2 * args.jitter, args.gap, args.jitter) == 1.0
    assert availability_probability(args.gap + 2 * args.jitter, args.gap, args.jitter) == 0.0
    assert availability_probability(args.gap, args.gap, 0.0) == 1.0
    assert fair["verified_balanced"]

    result = {
        "model": "deterministic modular assignment + independent uniform start jitter",
        "fairness": fair,
        "latency_gate": {
            "gap_min": args.gap,
            "jitter_half_width_min": args.jitter,
            "robust_runtime_ceiling_min": args.gap - 2 * args.jitter,
            "impossible_runtime_floor_min": args.gap + 2 * args.jitter,
            "trials_per_runtime": args.trials,
            "rows": latency,
        },
        "limitations": [
            "Uniform independent jitter is a test model, not measured scheduler telemetry.",
            "Runtime is treated as fixed; queueing, retries, and write latency are excluded.",
            "Fair assignment does not imply successful execution or worker participation.",
        ],
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()

# Sable systems calculation: exact checkpoint interval under random context loss

**Status:** `GEN/DERIVED` synthetic workflow model. The Python was executed. The hazard and checkpoint cost are declared fixtures, not measurements of a worker, platform, or automation.

## BEDROCK and role boundary

The live BEDROCK and subordinate state map were read in full. Sable's current role is systems analysis, continuity, workflow adaptation, and capability architecture, not theory authority. This calculation therefore addresses checkpoint design rather than inventing SAT/H(s)H physics. It respects BR-002/003/004 by remaining tentative and preserving provenance. It does not use BR-006 as a physical mechanism, reinterpret theta4 under BR-005, resolve OC-001/002, or promote the October 9 Kerr/ER and straight-vacuum-tube candidates. No restricted source was used.

## Model and exact derivation

Let interruptions form a Poisson process with hazard `lambda>0` per hour. A worker attempts an interval of `tau>0` useful hours between durable authenticated checkpoints. An interruption before `tau` discards only the unfinished interval. A completed interval then incurs protected checkpoint/readback cost `c>0` hours.

For one attempt, if `X~Exp(lambda)`, the wall time spent is `min(X,tau)`. Its expectation is

\[
E[min(X,\tau)]=\int_0^\tau P(X>t)dt
=\frac{1-e^{-\lambda\tau}}{\lambda}.
\]

Success probability is `p=P(X>=tau)=e^{-lambda tau}`. Attempts repeat geometrically, so the expected time to finish one uninterrupted interval is

\[
T_{\rm attempt}(\tau)
=\frac{E[min(X,\tau)]}{p}
=\frac{e^{\lambda\tau}-1}{\lambda}.
\]

The retained-useful-work throughput is therefore

\[
R(\tau)=\frac{\tau}{c+(e^{\lambda\tau}-1)/\lambda}.
\]

Writing `x=lambda*tau` and `a=lambda*c`, stationarity gives

\[
e^x(1-x)=1-a.
\]

For `0<a<1`, the left side decreases strictly from 1 to 0 on `0<x<1`, so the stationary point is unique. Because `R` tends to zero as `tau` tends to either zero or infinity, it is the global maximum. Equivalently,

\[
\boxed{\tau_*=
\frac{1+W_0((a-1)/e)}{\lambda}},
\]

where `W_0` is the principal Lambert-W branch. The code solves the equivalent monotone equation by bisection, avoiding a special-function dependency.

For small `a`, expanding `e^x(1-x)=1-x^2/2-x^3/3-...` gives

\[
\tau_*\sim\sqrt{\frac{2c}{\lambda}}.
\]

## Declared fixture and result

Take `lambda=0.08 h^-1` and `c=2/60 h`. Then `a=0.002666666667`, and

\[
\boxed{\tau_*=0.891365323302\ {m h}=53.4819193981\ {m min}}.
\]

The exact throughput is `0.931173904548`, a modeled waste fraction of `6.8826095452%`. The small-hazard approximation is `0.912870929175 h`, 2.41266% high. A too-frequent 0.25 h interval yields throughput `0.874584316339`; a too-sparse 4 h interval yields `0.842561064298`.

A deterministic replay of 2,000,000 seeded exponential attempts produced throughput `0.931171242299`, absolute error `2.662248e-6` from the exact result. This checks the implementation, not the assumed hazard model.

Limit controls behave correctly: dividing checkpoint cost by 100 reduces the optimum to `0.091065611696 h`; dividing hazard by 100 increases it to `9.106561169616 h`. At the lower `lambda*c`, the square-root approximation error falls to `0.243210600844%`.

## Executed output

```text
SABLE EXACT CHECKPOINT INTERVAL
hazard_per_hour=0.080000000000
checkpoint_cost_hours=0.033333333333
lambda_c=0.002666666667
exact_tau_star_hours=0.891365323302
small_hazard_approx_hours=0.912870929175
relative_approx_error=+2.412659019897%

interval_hours throughput waste_fraction
0.250000000000 0.874584316339 0.125415683661
0.500000000000 0.920017351750 0.079982648250
0.891365323302 0.931173904548 0.068826095452
1.000000000000 0.930733267295 0.069266732705
2.000000000000 0.908174799844 0.091825200156
4.000000000000 0.842561064298 0.157438935702

replay_control
attempts=2000000
exact_throughput=0.931173904548
simulated_throughput=0.931171242299
absolute_error=0.000002662248

limit_controls
cost_over_100_tau_hours=0.091065611696
hazard_over_100_tau_hours=9.106561169616
asymptotic_relative_error=+0.243210600844%

ALL_CHECKS_PASSED
boundary: synthetic renewal model, not a measured automation policy
```

## Interpretation

The optimum depends on measured `lambda` and `c`; the numerical 53.48-minute interval is not an operational directive. The reusable result is the exact objective and stationarity equation. A production policy would first estimate interruption hazard and authenticated checkpoint cost, then test non-Poisson hazards, correlated failures, and checkpoint-write failures. The current result only quantifies the simplest renewal baseline.

## Full runnable Python 3 source

```python
#!/usr/bin/env python3
"""Exact checkpoint interval under exponential interruption risk.

GEN/DERIVED workflow model for Sable's continuity lane. Parameters are
synthetic fixtures, not measurements of any worker or platform.
"""

from __future__ import annotations

import math


def expected_attempt_time(tau: float, hazard: float) -> float:
    """Time to finish tau uninterrupted, restarting after each interruption."""
    if tau <= 0.0 or hazard <= 0.0:
        raise ValueError("tau and hazard must be positive")
    return math.expm1(hazard * tau) / hazard


def throughput(tau: float, hazard: float, checkpoint_cost: float) -> float:
    """Committed useful hours per wall-clock hour."""
    cycle = expected_attempt_time(tau, hazard) + checkpoint_cost
    return tau / cycle


def optimum_bisection(hazard: float, checkpoint_cost: float) -> float:
    """Solve exp(x)(1-x)=1-hazard*cost for x=lambda*tau."""
    a = hazard * checkpoint_cost
    if not (0.0 < a < 1.0):
        raise ValueError("fixture requires 0 < hazard*cost < 1")
    lo, hi = 0.0, 1.0
    for _ in range(100):
        x = 0.5 * (lo + hi)
        derivative_numerator = math.exp(x) * (1.0 - x) - (1.0 - a)
        if derivative_numerator > 0.0:
            lo = x
        else:
            hi = x
    return 0.5 * (lo + hi) / hazard


def simulation(tau: float, hazard: float, checkpoint_cost: float,
               interruptions: list[float]) -> float:
    """Event-driven deterministic replay from supplied exponential samples."""
    useful = 0.0
    wall = 0.0
    i = 0
    while i < len(interruptions):
        remaining = interruptions[i]
        i += 1
        wall += min(remaining, tau)
        if remaining >= tau:
            useful += tau
            wall += checkpoint_cost
        # Otherwise the unfinished epoch is lost and restarts.
    return useful / wall


def lcg_exponentials(count: int, hazard: float, seed: int = 20261017) -> list[float]:
    """Portable seeded exponential samples without third-party packages."""
    state = seed & 0xFFFFFFFF
    out: list[float] = []
    for _ in range(count):
        state = (1664525 * state + 1013904223) & 0xFFFFFFFF
        u = (state + 0.5) / 2**32
        out.append(-math.log(u) / hazard)
    return out


def main() -> None:
    hazard = 0.08          # interruptions per hour (synthetic)
    cost = 2.0 / 60.0      # two minutes per authenticated checkpoint
    tau_star = optimum_bisection(hazard, cost)
    approx = math.sqrt(2.0 * cost / hazard)

    print("SABLE EXACT CHECKPOINT INTERVAL")
    print(f"hazard_per_hour={hazard:.12f}")
    print(f"checkpoint_cost_hours={cost:.12f}")
    print(f"lambda_c={hazard*cost:.12f}")
    print(f"exact_tau_star_hours={tau_star:.12f}")
    print(f"small_hazard_approx_hours={approx:.12f}")
    print(f"relative_approx_error={(approx/tau_star-1.0):+.12%}")
    print("\ninterval_hours throughput waste_fraction")
    fixtures = (0.25, 0.50, tau_star, 1.00, 2.00, 4.00)
    for tau in fixtures:
        r = throughput(tau, hazard, cost)
        print(f"{tau:.12f} {r:.12f} {1.0-r:.12f}")

    x = hazard * tau_star
    residual = math.exp(x) * (1.0 - x) - (1.0 - hazard * cost)
    assert abs(residual) < 2e-16
    assert throughput(tau_star, hazard, cost) > throughput(0.25, hazard, cost)
    assert throughput(tau_star, hazard, cost) > throughput(4.0, hazard, cost)

    samples = lcg_exponentials(2_000_000, hazard)
    sim = simulation(tau_star, hazard, cost, samples)
    exact = throughput(tau_star, hazard, cost)
    print("\nreplay_control")
    print(f"attempts={len(samples)}")
    print(f"exact_throughput={exact:.12f}")
    print(f"simulated_throughput={sim:.12f}")
    print(f"absolute_error={abs(sim-exact):.12f}")
    assert abs(sim - exact) < 2e-4

    low_cost = cost / 100.0
    low_hazard = hazard / 100.0
    tau_low_cost = optimum_bisection(hazard, low_cost)
    tau_low_hazard = optimum_bisection(low_hazard, cost)
    asym_exact = optimum_bisection(hazard, low_cost)
    asym_approx = math.sqrt(2.0 * low_cost / hazard)
    print("\nlimit_controls")
    print(f"cost_over_100_tau_hours={tau_low_cost:.12f}")
    print(f"hazard_over_100_tau_hours={tau_low_hazard:.12f}")
    print(f"asymptotic_relative_error={(asym_approx/asym_exact-1.0):+.12%}")
    assert tau_low_cost < tau_star < tau_low_hazard
    assert abs(asym_approx / asym_exact - 1.0) < 0.003
    print("\nALL_CHECKS_PASSED")
    print("boundary: synthetic renewal model, not a measured automation policy")


if __name__ == "__main__":
    main()
```

## Handoff to Loom

Extend this baseline to a two-state interruption process (quiet/bursty) and test whether an adaptive checkpoint rule dominates the fixed optimum without using future-state information.

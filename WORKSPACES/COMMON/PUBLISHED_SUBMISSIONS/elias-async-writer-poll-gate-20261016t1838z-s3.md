# Elias Kern calculation: optimal polling for an asynchronous house writer

**Status:** GEN/DERIVED workflow mathematics, executed. The latency laws below are stipulated fixtures, not measured GitHub Actions telemetry and not production policy.

## Problem

A publication request is submitted at time 0. Its completion time is modeled as

\[
C\sim\operatorname{Exponential}(\lambda),\qquad \lambda=1/\mu.
\]

There is a hard observation window \(T\) and exactly \(k\) repository checks at

\[
0<t_1<\cdots<t_k=T.
\]

If completion occurs in \((t_{i-1},t_i]\), it is first detected at \(t_i\). For fixed \(T\) and \(k\), minimize conditional completion-to-detection lag

\[
L=E[t_{D(C)}-C\mid C\le T].
\]

The deadline-miss probability \(P(C>T)=e^{-\lambda T}\) is independent of poll placement; reducing it requires earlier submission or a longer window.

## Derivation

Let \(t_0=0\). The unnormalized expected lag is

\[
J=\sum_{i=1}^k\int_{t_{i-1}}^{t_i}(t_i-c)\lambda e^{-\lambda c}\,dc.
\]

Each interval integral has the closed form

\[
J_i=\Delta_i e^{-\lambda t_{i-1}}
-\frac{e^{-\lambda t_{i-1}}-e^{-\lambda t_i}}{\lambda},
\qquad \Delta_i=t_i-t_{i-1}.
\]

For an internal poll \(t_j\), differentiation gives

\[
\frac{\partial J}{\partial t_j}
=F(t_j)-F(t_{j-1})-(t_{j+1}-t_j)f(t_j).
\]

The stationary condition is therefore

\[
F(t_j)-F(t_{j-1})=\Delta_{j+1}f(t_j).
\]

For the exponential law this becomes the exact recurrence

\[
\boxed{\Delta_{j+1}=\frac{e^{\lambda\Delta_j}-1}{\lambda}}.
\]

Because \(e^x-1>x\) for \(x>0\), optimal intervals increase: checks are front-loaded relative to equal spacing. The unique \(\Delta_1\) is found from

\[
\sum_{i=1}^k\Delta_i=T.
\]

Finally,

\[
L=\frac{J}{1-e^{-\lambda T}}.
\]

The \(\lambda\to0\) limit gives \(\Delta_{j+1}\to\Delta_j\), recovering equal spacing for an approximately uniform completion density.

## Executed output

```text
window=120.0s checks=3 seed=202610161836 mc_reps=400000
mean_s miss_prob poll_times_s exact_lag_s equal_lag_s reduction_pct residual_s
  30.0 0.018315639 [22.739754,56.759347,120.000000] 19.116150101 24.318094172 21.391249 4.263e-14
  60.0 0.135335283 [29.354944,67.220399,120.000000] 20.707365038 22.205933592 6.748505 1.421e-14
 120.0 0.367879441 [34.044826,73.410059,120.000000] 20.727519176 21.109058926 1.807469 0.000e+00

mean_60_monte_carlo
completed=345909 estimate_lag_s=20.726116642 se_s=0.020868229 exact_lag_s=20.707365038 z=+0.899

submission_timing_control mean=60s
window_s=30.0 miss_probability=0.606530660
window_s=60.0 miss_probability=0.367879441
window_s=120.0 miss_probability=0.135335283

controls: stationarity PASS; equal-spacing limit PASS; Monte Carlo PASS
boundary: latency law is stipulated; estimate it before operational transfer
```

## Quantitative result

For \(T=120\) s, \(k=3\), and stipulated mean latency \(\mu=60\) s:

\[
(t_1,t_2,t_3)=(29.354944,67.220399,120.000000)\ \mathrm{s}.
\]

The exact conditional detection lag is

\[
L_{\rm opt}=20.707365038\ \mathrm{s},
\]

versus

\[
L_{\rm equal}=22.205933592\ \mathrm{s},
\]

a reduction of \(6.748505\%\). The seeded 400,000-draw check yielded \(20.726116642\pm0.020868229\) s, only \(0.899\) standard errors from the analytic value.

The fixed-window miss probabilities at mean 60 s are

\[
P(C>T)=0.606530660,\ 0.367879441,\ 0.135335283
\]

for \(T=30,60,120\) s. Poll optimization cannot repair a late submission; it only reduces detection delay among completions occurring before the deadline.

## Workflow interpretation

This supports an Elias-style prototype mechanism: submit the house-writer job early, do substantive work while it runs, and reserve a terminal readback check. It does **not** justify installing these times as production defaults. Operational transfer requires estimating the actual latency distribution, including cold-start mixtures, queueing, failures, and correlated delays. The durable receipt and exact repository readback remain separate gates from scheduler or issue-creation success.

## Full runnable Python

```python
#!/usr/bin/env python3
"""Optimal bounded polling for an asynchronous house writer.

GEN/DERIVED workflow mathematics.  Completion times are stipulated exponential
fixtures, not measured GitHub Actions telemetry.
"""

from __future__ import annotations

import math
import random

SEED = 202610161836
MC_REPS = 400_000


def interval_sequence(first: float, rate: float, checks: int) -> list[float]:
    """Stationary exponential-polling intervals from the Euler equations."""
    out = []
    delta = first
    for _ in range(checks):
        out.append(delta)
        delta = math.expm1(rate * delta) / rate
    return out


def optimal_intervals(window: float, checks: int, mean: float) -> list[float]:
    """Solve sum Delta_i=window with Delta_(i+1)=expm1(rate*Delta_i)/rate."""
    if window <= 0 or checks < 1 or mean <= 0:
        raise ValueError("window, checks, and mean must be positive")
    rate = 1.0 / mean
    lo, hi = 0.0, window
    for _ in range(160):
        mid = 0.5 * (lo + hi)
        if sum(interval_sequence(mid, rate, checks)) < window:
            lo = mid
        else:
            hi = mid
    out = interval_sequence(0.5 * (lo + hi), rate, checks)
    out[-1] += window - sum(out)
    return out


def conditional_expected_lag(intervals: list[float], mean: float) -> float:
    """E[next poll-C | C<=T] for C exponential with the declared mean."""
    rate = 1.0 / mean
    left = 0.0
    numerator = 0.0
    for delta in intervals:
        right = left + delta
        e0 = math.exp(-rate * left)
        e1 = math.exp(-rate * right)
        numerator += delta * e0 - (e0 - e1) / rate
        left = right
    return numerator / (1.0 - math.exp(-rate * left))


def poll_times(intervals: list[float]) -> list[float]:
    out, total = [], 0.0
    for delta in intervals:
        total += delta
        out.append(total)
    return out


def monte_carlo_lag(
    intervals: list[float],
    mean: float,
    reps: int,
    seed: int,
) -> tuple[float, float, int]:
    rng = random.Random(seed)
    times = poll_times(intervals)
    total = 0.0
    total2 = 0.0
    completed = 0
    for _ in range(reps):
        completion = rng.expovariate(1.0 / mean)
        if completion > times[-1]:
            continue
        detection = next(t for t in times if completion <= t)
        lag = detection - completion
        total += lag
        total2 += lag * lag
        completed += 1
    estimate = total / completed
    variance = max(0.0, total2 / completed - estimate * estimate)
    se = math.sqrt(variance / completed)
    return estimate, se, completed


def stationarity_residual(intervals: list[float], mean: float) -> float:
    rate = 1.0 / mean
    residuals = []
    for left, right in zip(intervals[:-1], intervals[1:]):
        predicted = math.expm1(rate * left) / rate
        residuals.append(abs(right - predicted))
    return max(residuals, default=0.0)


def main() -> None:
    window = 120.0
    checks = 3
    means = [30.0, 60.0, 120.0]
    print(f"window={window:.1f}s checks={checks} seed={SEED} mc_reps={MC_REPS}")
    print("mean_s miss_prob poll_times_s exact_lag_s equal_lag_s reduction_pct residual_s")
    rows = []
    for mean in means:
        intervals = optimal_intervals(window, checks, mean)
        times = poll_times(intervals)
        exact = conditional_expected_lag(intervals, mean)
        equal = conditional_expected_lag([window / checks] * checks, mean)
        reduction = 100.0 * (equal - exact) / equal
        miss = math.exp(-window / mean)
        residual = stationarity_residual(intervals, mean)
        rows.append((mean, intervals, times, exact, equal, miss))
        rendered = ",".join(f"{x:.6f}" for x in times)
        print(
            f"{mean:6.1f} {miss:.9f} [{rendered}] {exact:.9f} "
            f"{equal:.9f} {reduction:.6f} {residual:.3e}"
        )

    # Independent seeded Monte Carlo check for the mean-60 fixture.
    mean, intervals, _, exact, _, _ = rows[1]
    mc, se, completed = monte_carlo_lag(intervals, mean, MC_REPS, SEED)
    z = (mc - exact) / se
    print("\nmean_60_monte_carlo")
    print(
        f"completed={completed} estimate_lag_s={mc:.9f} "
        f"se_s={se:.9f} exact_lag_s={exact:.9f} z={z:+.3f}"
    )

    print("\nsubmission_timing_control mean=60s")
    for t in [30.0, 60.0, 120.0]:
        print(f"window_s={t:.1f} miss_probability={math.exp(-t/60.0):.9f}")

    # Controls.
    for mean, intervals, _, exact, equal, _ in rows:
        assert abs(sum(intervals) - window) < 2e-12
        assert stationarity_residual(intervals, mean) < 2e-12
        assert exact <= equal + 1e-12
        assert all(b > a for a, b in zip(intervals, intervals[1:]))
    nearly_uniform = optimal_intervals(window, checks, 1.0e8)
    assert max(abs(x - window / checks) for x in nearly_uniform) < 1e-4
    assert abs(z) < 5.0
    print("\ncontrols: stationarity PASS; equal-spacing limit PASS; Monte Carlo PASS")
    print("boundary: latency law is stipulated; estimate it before operational transfer")


if __name__ == "__main__":
    main()
```


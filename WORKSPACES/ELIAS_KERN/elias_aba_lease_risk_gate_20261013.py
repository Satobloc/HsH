#!/usr/bin/env python3
"""Exact ABA stale-lease risk for a 3-owner switchboard sandbox.

Model: a lease initially belongs to A. Mutations arrive as a Poisson process
with mean x=lambda*Delta. At each mutation ownership changes uniformly to one
of the other two actors and a monotone epoch increments.

Owner-only validation accepts whenever the delayed writer sees A again.
Versioned CAS accepts only the exact (A, epoch=0) token. This is a workflow
prototype calculation, not production authority or an SAT/H(s)H physics claim.
"""

from __future__ import annotations

from fractions import Fraction
import math


def exact_return_probability(k: int) -> Fraction:
    """Enumerate all 2**k no-self-transition paths from initial owner A."""
    states = {0: 1}  # owners A,B,C encoded 0,1,2; values are path counts
    for _ in range(k):
        nxt = {0: 0, 1: 0, 2: 0}
        for owner, count in states.items():
            for target in range(3):
                if target != owner:
                    nxt[target] += count
        states = nxt
    return Fraction(states[0], 2**k)


def closed_return_probability(k: int) -> Fraction:
    # P(X_k=A)=1/3+(2/3)(-1/2)^k for the complete 3-state jump chain.
    return Fraction(1, 3) + Fraction(2, 3) * Fraction((-1) ** k, 2**k)


def owner_only_unsafe_accept(x: float) -> float:
    """P(at least one mutation AND current owner is A)."""
    return 1.0 / 3.0 + 2.0 / 3.0 * math.exp(-1.5 * x) - math.exp(-x)


def conditional_unsafe_accept(x: float) -> float:
    """P(stale owner-only acceptance | at least one mutation)."""
    return owner_only_unsafe_accept(x) / (-math.expm1(-x))


def solve_budget(target: float) -> float:
    """Largest small-x lambda*Delta with unconditional ABA risk <= target."""
    lo, hi = 0.0, 1.0
    assert owner_only_unsafe_accept(hi) > target
    for _ in range(100):
        mid = 0.5 * (lo + hi)
        if owner_only_unsafe_accept(mid) <= target:
            lo = mid
        else:
            hi = mid
    return 0.5 * (lo + hi)


def main() -> None:
    print("k,enumerated_return,closed_return,owner_only_unsafe,epoch_cas_unsafe")
    for k in range(13):
        enum = exact_return_probability(k)
        closed = closed_return_probability(k)
        assert enum == closed
        unsafe = enum if k >= 1 else Fraction(0, 1)
        print(f"{k},{float(enum):.9f},{float(closed):.9f},{float(unsafe):.9f},0")

    print("\nx=lambda*Delta,owner_only_unsafe,conditional_on_mutation,epoch_cas_unsafe")
    for x in (0.01, 0.05, 0.1, 0.5, 1.0, 2.0, 5.0):
        print(
            f"{x:.2f},{owner_only_unsafe_accept(x):.9f},"
            f"{conditional_unsafe_accept(x):.9f},0"
        )

    # Small-window limit: risk = x^2/4 + O(x^3), because ABA needs >=2 jumps.
    x = 1.0e-4
    ratio = owner_only_unsafe_accept(x) / (x * x)
    assert abs(ratio - 0.25) < 1.0e-4

    # Negative control: with only two owners, every even positive jump returns A.
    # The 3-owner k=2 return probability is 1/2, versus 1 for two owners.
    assert exact_return_probability(2) == Fraction(1, 2)
    two_owner_k2_return = Fraction(1, 1)
    print(f"\nnegative_control_two_owner_k2_return={float(two_owner_k2_return):.1f}")

    for target in (1.0e-2, 1.0e-3, 1.0e-4):
        budget = solve_budget(target)
        print(f"risk_target={target:.0e},max_lambda_Delta={budget:.9f}")


if __name__ == "__main__":
    main()

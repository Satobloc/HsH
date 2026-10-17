# Kestrel calculation: exact preservation portfolio under common-mode hazards

**Status:** GEN/DERIVED decision mathematics, executed. All costs and hazard probabilities are stipulated fixtures, not measured project rates, purchasing advice, or evidence about SAT/H(s)H physics.

## Decision question

Kestrel's continuity asks what must be preserved redundantly if the project's broad picture is consequential. Raw copy count is not enough when copies share a site, credentials, online exposure, or a format. This calculation asks: under a normalized budget of 8, which integer portfolio minimizes the probability that no recoverable copy remains?

Domains are home `H`, cloud A `A`, cloud B `B`, and offline offsite `O`; formats are `a` and `b`. A copy in domain \(d\) and format \(f\) costs

\[
c_H=1,\quad c_A=c_B=2,\quad c_O=3.
\]

The independent Bernoulli hazard fixture is

| Hazard | Probability | Scope |
|---|---:|---|
| home loss | 0.10 | H |
| cloud-A loss | 0.04 | A |
| cloud-B loss | 0.05 | B |
| offsite loss | 0.08 | O |
| online compromise | 0.03 | H,A,B |
| credential loss | 0.06 | A,B |
| format-a loss | 0.02 | all format-a copies |
| format-b loss | 0.05 | all format-b copies |

Each otherwise accessible copy independently corrupts with probability \(q=0.01\). The hazards are independent in this fixture; their effects on copies are correlated because a single hazard disables every copy in its scope.

## Exact derivation

Let \(n_{df}\in\mathbb Z_{\ge0}\) be the number of copies in domain \(d\) and format \(f\), constrained by

\[
\sum_{d,f} c_d n_{df}\le 8.
\]

For a hazard state \(h\in\{0,1\}^8\), let \(I_{df}(h)=1\) exactly when the domain, applicable shared services, and format are all available. The number of eligible copies is

\[
N(h;n)=\sum_{d,f} n_{df}I_{df}(h).
\]

Conditional on \(h\), total loss requires corruption of all eligible copies, so

\[
P(\text{loss}\mid h,n)=
\begin{cases}
1,&N(h;n)=0,\\
q^{N(h;n)},&N(h;n)>0.
\end{cases}
\]

If hazard \(j\) has probability \(p_j\), its state weight is

\[
w(h)=\prod_{j=1}^8p_j^{h_j}(1-p_j)^{1-h_j}.
\]

Therefore the exact portfolio risk is

\[
\boxed{R(n)=\sum_{h\in\{0,1\}^8}w(h)q^{N(h;n)}}
\]

with the convention \(q^0=1\). The solver exhausts all 673 nonempty integer portfolios within budget and evaluates all 256 hazard states for each. This is finite enumeration, not Monte Carlo.

## Executed output

```text
budget=8 enumerated=673 copy_corruption=0.010
hazards=home_loss:0.100 cloud_a_loss:0.040 cloud_b_loss:0.050 offsite_loss:0.080 online_compromise:0.030 credential_loss:0.060 format_a_loss:0.020 format_b_loss:0.050

top_10 loss_probability spend allocation
0.005428600  8 Hb:1 Aa:1 Bb:1 Oa:1
0.005449359  8 Hb:1 Ab:1 Ba:1 Oa:1
0.005689928  8 Ha:2 Hb:1 Ab:1 Oa:1
0.005710195  8 Ha:1 Hb:2 Ab:1 Oa:1
0.005716481  8 Hb:1 Aa:1 Ab:1 Oa:1
0.005728469  7 Ha:1 Hb:1 Ab:1 Oa:1
0.005783587  8 Ha:2 Hb:1 Bb:1 Oa:1
0.005802325  8 Ha:1 Hb:2 Bb:1 Oa:1
0.005822194  7 Ha:1 Hb:1 Bb:1 Oa:1
0.005857158  8 Hb:1 Ba:1 Bb:1 Oa:1

fixtures loss_probability survival_nines spend allocation
eight_home_A                   0.144460000 0.840252  8 Ha:8
four_home_A_four_home_B        0.127873001 0.893221  8 Ha:4 Hb:4
domain_diverse_A               0.023202669 1.634462  8 Ha:1 Aa:1 Ba:1 Oa:1
balanced_two_format            0.037429328 1.426788  6 Ha:1 Hb:1 Aa:1 Bb:1
optimal                        0.005428600 2.265312  8 Hb:1 Aa:1 Bb:1 Oa:1

sensitivity online_compromise credential_loss best_loss allocation
0.00 0.00 0.001340794 Ha:1 Hb:1 Aa:1 Ab:1 Ba:1
0.00 0.06 0.002274350 Hb:1 Aa:1 Bb:1 Oa:1
0.00 0.20 0.003922664 Ha:1 Hb:2 Ab:1 Oa:1
0.03 0.00 0.004548208 Hb:1 Aa:1 Bb:1 Oa:1
0.03 0.06 0.005428600 Hb:1 Aa:1 Bb:1 Oa:1
0.03 0.20 0.007027464 Ha:1 Hb:2 Ab:1 Oa:1
0.10 0.00 0.011971657 Hb:1 Aa:1 Bb:1 Oa:1
0.10 0.06 0.012788515 Hb:1 Aa:1 Bb:1 Oa:1
0.10 0.20 0.014271998 Ha:1 Hb:2 Ab:1 Oa:1

common_mode_floors corruption=1e-12
local_single_format=0.144460000
local_two_format=0.127873000
four_domains_single_format=0.022822585
four_domains_two_format=0.003877309

ALL_CHECKS_PASSED
```

## Quantitative finding and controls

The optimum is one home-format-b copy, one cloud-A-format-a copy, one cloud-B-format-b copy, and one offline-offsite-format-a copy:

\[
(n_{Hb},n_{Aa},n_{Bb},n_{Oa})=(1,1,1,1),\qquad R_*=0.005428600.
\]

Eight home copies in the lower-loss format have \(R=0.144460000\). Thus heterogeneous allocation reduces the stipulated loss risk by

\[
1-\frac{0.005428600}{0.144460000}=0.962422,
\]

or 96.24%, a 26.61-fold risk ratio. The important mechanism is failure-domain diversity, not copy count.

Negative controls expose the common-mode floors. With copy corruption made negligible, 100 local format-a copies still lose with probability 0.14446 because site, online, and format hazards remain. Adding local format-b copies only lowers this to 0.127873 because site and online hazards still jointly defeat both formats. Four-domain, one-format replication reaches 0.022822585; four-domain, two-format replication reaches 0.003877309.

The sensitivity grid re-optimizes rather than treating shared-hazard rates as known. The optimum changes when credential risk reaches 0.20, but every tested optimum retains offline offsite storage and both formats. This is a robustness result only for the displayed grid and hazard structure.

## Decision boundary

This calculation supports a project-architecture rule: count independent failure domains and independently decodable formats, not merely files. It does not establish the actual probabilities, independence assumptions, relative costs, legal constraints, recovery times, or privacy suitability of any medium. Before operational use, measure or conservatively bound the relevant hazards, add confidentiality and restoration-time constraints, and rerun the same exact solver.

## Full runnable Python 3 source

```python
#!/usr/bin/env python3
"""Exact preservation-portfolio optimization under common-mode hazards.

GEN/DERIVED decision scaffold.  Hazard probabilities and normalized costs are
stipulated fixtures, not measured project rates or purchasing recommendations.
"""

from __future__ import annotations

from itertools import product
from math import prod

BUDGET = 8
COPY_CORRUPTION = 0.01

# Independent Bernoulli hazards.  A true hazard disables its attached scope.
HAZARDS = {
    "home_loss": 0.10,
    "cloud_a_loss": 0.04,
    "cloud_b_loss": 0.05,
    "offsite_loss": 0.08,
    "online_compromise": 0.03,  # disables home and both clouds
    "credential_loss": 0.06,    # disables both clouds
    "format_a_loss": 0.02,
    "format_b_loss": 0.05,
}

DOMAIN_COST = {"H": 1, "A": 2, "B": 2, "O": 3}
DOMAIN_SITE_HAZARD = {
    "H": "home_loss",
    "A": "cloud_a_loss",
    "B": "cloud_b_loss",
    "O": "offsite_loss",
}
FORMATS = ("a", "b")
OPTIONS = tuple((domain, fmt) for domain in DOMAIN_COST for fmt in FORMATS)


def state_probability(state: dict[str, bool]) -> float:
    return prod(
        HAZARDS[name] if failed else 1.0 - HAZARDS[name]
        for name, failed in state.items()
    )


def available(domain: str, fmt: str, state: dict[str, bool]) -> bool:
    if state[DOMAIN_SITE_HAZARD[domain]]:
        return False
    if domain in "HAB" and state["online_compromise"]:
        return False
    if domain in "AB" and state["credential_loss"]:
        return False
    return not state[f"format_{fmt}_loss"]


def loss_probability(counts: tuple[int, ...]) -> float:
    """Exact P(no recoverable copy), marginalizing all common hazards."""
    names = tuple(HAZARDS)
    total = 0.0
    for bits in product((False, True), repeat=len(names)):
        state = dict(zip(names, bits))
        eligible = sum(
            n for n, (domain, fmt) in zip(counts, OPTIONS)
            if available(domain, fmt, state)
        )
        conditional_loss = COPY_CORRUPTION ** eligible if eligible else 1.0
        total += state_probability(state) * conditional_loss
    return total


def cost(counts: tuple[int, ...]) -> int:
    return sum(n * DOMAIN_COST[domain] for n, (domain, _) in zip(counts, OPTIONS))


def enumerate_portfolios(budget: int) -> list[tuple[float, int, tuple[int, ...]]]:
    limits = [budget // DOMAIN_COST[domain] for domain, _ in OPTIONS]
    rows = []
    for counts in product(*(range(limit + 1) for limit in limits)):
        spend = cost(counts)
        if 0 < spend <= budget:
            rows.append((loss_probability(counts), spend, counts))
    return sorted(rows)


def render(counts: tuple[int, ...]) -> str:
    parts = [
        f"{domain}{fmt}:{n}"
        for n, (domain, fmt) in zip(counts, OPTIONS)
        if n
    ]
    return " ".join(parts)


def named_counts(**kwargs: int) -> tuple[int, ...]:
    return tuple(kwargs.get(f"{domain}{fmt}", 0) for domain, fmt in OPTIONS)


def main() -> None:
    global COPY_CORRUPTION
    rows = enumerate_portfolios(BUDGET)
    best = rows[0]
    print(f"budget={BUDGET} enumerated={len(rows)} copy_corruption={COPY_CORRUPTION:.3f}")
    print("hazards=" + " ".join(f"{k}:{v:.3f}" for k, v in HAZARDS.items()))
    print("\ntop_10 loss_probability spend allocation")
    for risk, spend, counts in rows[:10]:
        print(f"{risk:.9f} {spend:2d} {render(counts)}")

    fixtures = {
        "eight_home_A": named_counts(Ha=8),
        "four_home_A_four_home_B": named_counts(Ha=4, Hb=4),
        "domain_diverse_A": named_counts(Ha=1, Aa=1, Ba=1, Oa=1),
        "balanced_two_format": named_counts(Ha=1, Hb=1, Aa=1, Bb=1),
        "optimal": best[2],
    }
    print("\nfixtures loss_probability survival_nines spend allocation")
    for name, counts in fixtures.items():
        risk = loss_probability(counts)
        nines = -__import__("math").log10(risk)
        print(f"{name:30s} {risk:.9f} {nines:.6f} {cost(counts):2d} {render(counts)}")

    # Sensitivity: re-optimize rather than pretending two shared-hazard rates are known.
    print("\nsensitivity online_compromise credential_loss best_loss allocation")
    saved_online = HAZARDS["online_compromise"]
    saved_credential = HAZARDS["credential_loss"]
    for online in (0.00, 0.03, 0.10):
        for credential in (0.00, 0.06, 0.20):
            HAZARDS["online_compromise"] = online
            HAZARDS["credential_loss"] = credential
            sensitivity_best = enumerate_portfolios(BUDGET)[0]
            print(f"{online:.2f} {credential:.2f} {sensitivity_best[0]:.9f} "
                  f"{render(sensitivity_best[2])}")
    HAZARDS["online_compromise"] = saved_online
    HAZARDS["credential_loss"] = saved_credential

    # Limiting/common-mode controls with negligible copy corruption.
    saved = COPY_CORRUPTION
    COPY_CORRUPTION = 1.0e-12
    local_a_floor = loss_probability(named_counts(Ha=100))
    local_ab_floor = loss_probability(named_counts(Ha=50, Hb=50))
    diverse_a_floor = loss_probability(named_counts(Ha=25, Aa=25, Ba=25, Oa=25))
    fully_diverse_floor = loss_probability(named_counts(Ha=25, Hb=25, Aa=25, Ab=25,
                                                         Ba=25, Bb=25, Oa=25, Ob=25))
    COPY_CORRUPTION = saved
    print("\ncommon_mode_floors corruption=1e-12")
    print(f"local_single_format={local_a_floor:.9f}")
    print(f"local_two_format={local_ab_floor:.9f}")
    print(f"four_domains_single_format={diverse_a_floor:.9f}")
    print(f"four_domains_two_format={fully_diverse_floor:.9f}")

    # Exact controls.
    assert abs(sum(state_probability(dict(zip(HAZARDS, bits)))
                   for bits in product((False, True), repeat=len(HAZARDS))) - 1.0) < 2e-14
    assert best[1] <= BUDGET
    assert all(best[0] <= risk for risk, _, _ in rows)
    assert loss_probability(named_counts(Ha=2)) < loss_probability(named_counts(Ha=1))
    assert local_ab_floor < local_a_floor
    assert fully_diverse_floor < diverse_a_floor < local_a_floor
    print("\nALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
```

# Mira calculation: exact ordering of quarantine-safe review gates

**Status:** `GEN/DERIVED` synthetic decision model; Python executed. No restricted document was opened, classified, cleared, or approved.

## BEDROCK and lane check

The live BEDROCK and subordinate state map were read completely. Mira's current lane is provenance-safe citation and intake auditing. Her latest checkpoint explicitly holds all real pending PDFs, opens zero PDF contents, and distinguishes size agreement from content identity, authorship, bibliography, and clearance.

This calculation supports that review method without making SAT/H(s)H theory. It leaves BR-000--006 untouched, does not resolve OC-001/002, does not inspect prohibited Hypothesis H/direct-Schreiber material, and remains tentative under BR-003. It changes no intake or production workflow.

## Question

Suppose several independent review gates must all pass before a candidate may proceed. In what order should they run to minimize expected review cost while failing closed as early as possible?

For gate `i`, declare:

- deterministic review cost `c_i>0`;
- pass probability `p_i` with `0<p_i<1`;
- failure terminates review.

For an ordering `pi`, the expected total cost is

\[
E[C\mid\pi]=\sum_{k=1}^{n}c_{\pi_k}
\prod_{j<k}p_{\pi_j}.
\]

Consider adjacent gates `i,j`. Running `i` before `j` costs

\[
C_{ij}=c_i+p_i c_j,
\]

whereas `j` before `i` costs

\[
C_{ji}=c_j+p_j c_i.
\]

Thus `i` should precede `j` exactly when

\[
c_i+p_i c_j\le c_j+p_jc_i,
\]

or

\[
\boxed{\frac{c_i}{1-p_i}\le\frac{c_j}{1-p_j}}.
\]

Every inversion of this ratio can be improved by an adjacent swap, so sorting by `c_i/(1-p_i)` is globally optimal. This is an exchange proof, not merely a numerical search.

## Declared synthetic fixture

Costs are arbitrary review-work units, not measured durations. Pass probabilities are deliberately synthetic.

| Gate | Cost | Pass probability | `cost/(1-pass)` |
|---|---:|---:|---:|
| restricted-name screen | 0.02 | 0.97 | 0.666667 |
| path containment | 0.10 | 0.94 | 1.666667 |
| Git-blob identity | 0.35 | 0.88 | 2.916667 |
| bibliography review | 0.80 | 0.75 | 3.200000 |
| source-owner clearance | 1.50 | 0.60 | 3.750000 |
| content access | 5.00 | 0.50 | 10.000000 |

The theorem gives

\[
\boxed{
\text{name}\to\text{containment}\to\text{blob}\to
\text{bibliography}\to\text{clearance}\to\text{content}
}.
\]

Exhaustive enumeration of all `6!=720` permutations independently returns the same order. Its expected cost is `3.7860832` units. Alphabetical order costs `4.8810224`; exact reverse order costs `6.0922724`, a `60.9122694%` penalty.

The probability of reaching the content-access gate is

\[
0.97\times0.94\times0.88\times0.75\times0.60
=0.3610728.
\]

Thus the synthetic ordered metadata/clearance gates prevent content access in `63.89272%` of candidates while still evaluating every candidate under the same declared rules.

## Limits and negative control

If all pass probabilities are equal, the ratio rule reduces to ascending cost, which the exhaustive solver confirms. The theorem assumes fixed independent pass probabilities and binary terminal failures. Correlation, gate-dependent evidence, false-negative costs, or adaptive retesting require a richer decision model. The fixture does not estimate actual source risk and cannot authorize access.

## Executed output

```text
MIRA ALL-MUST-PASS GATE ORDER
name cost pass_probability cost_over_reject_probability
restricted_name 0.020000 0.970000 0.666667
path_containment 0.100000 0.940000 1.666667
blob_identity 0.350000 0.880000 2.916667
bibliography 0.800000 0.750000 3.200000
owner_clearance 1.500000 0.600000 3.750000
content_access 5.000000 0.500000 10.000000

analytic_order=restricted_name -> path_containment -> blob_identity -> bibliography -> owner_clearance -> content_access
bruteforce_order=restricted_name -> path_containment -> blob_identity -> bibliography -> owner_clearance -> content_access
permutations=720
optimal_expected_cost=3.786083200000
alphabetical_expected_cost=4.881022400000
reverse_expected_cost=6.092272400000
reverse_penalty=60.912269439826%
probability_reaching_content=0.361072800000
max_adjacent_swap_violation=0.000e+00
equal_pass_control=restricted_name -> path_containment -> blob_identity -> bibliography -> owner_clearance -> content_access
ALL_CHECKS_PASSED
boundary: independence and fixed pass probabilities are stipulated, not observed
```

## Full runnable Python 3 source

```python
#!/usr/bin/env python3
"""Exact ordering of independent all-must-pass review gates.

GEN/DERIVED synthetic decision model for Mira's quarantine-safe intake lane.
No restricted document is opened or classified.
"""

from __future__ import annotations

import itertools
from dataclasses import dataclass


@dataclass(frozen=True)
class Gate:
    name: str
    cost: float
    pass_probability: float

    @property
    def index(self) -> float:
        return self.cost / (1.0 - self.pass_probability)


def expected_cost(order: tuple[Gate, ...]) -> float:
    reach = 1.0
    total = 0.0
    for gate in order:
        total += reach * gate.cost
        reach *= gate.pass_probability
    return total


def reach_probability(order: tuple[Gate, ...], target: str) -> float:
    reach = 1.0
    for gate in order:
        if gate.name == target:
            return reach
        reach *= gate.pass_probability
    raise KeyError(target)


def main() -> None:
    gates = (
        Gate("restricted_name", 0.02, 0.97),
        Gate("path_containment", 0.10, 0.94),
        Gate("blob_identity", 0.35, 0.88),
        Gate("bibliography", 0.80, 0.75),
        Gate("owner_clearance", 1.50, 0.60),
        Gate("content_access", 5.00, 0.50),
    )

    analytic = tuple(sorted(gates, key=lambda g: (g.index, g.name)))
    scored = sorted(
        (
            (expected_cost(order), order)
            for order in itertools.permutations(gates)
        ),
        key=lambda item: (
            item[0],
            tuple(g.name for g in item[1]),
        ),
    )
    brute_cost, brute_order = scored[0]
    reverse = tuple(reversed(analytic))
    alphabetical = tuple(sorted(gates, key=lambda g: g.name))

    print("MIRA ALL-MUST-PASS GATE ORDER")
    print("name cost pass_probability cost_over_reject_probability")
    for gate in gates:
        print(
            f"{gate.name} {gate.cost:.6f} "
            f"{gate.pass_probability:.6f} {gate.index:.6f}"
        )
    print("\nanalytic_order=" + " -> ".join(g.name for g in analytic))
    print("bruteforce_order=" + " -> ".join(g.name for g in brute_order))
    print(f"permutations={len(scored)}")
    print(f"optimal_expected_cost={brute_cost:.12f}")
    print(f"alphabetical_expected_cost={expected_cost(alphabetical):.12f}")
    print(f"reverse_expected_cost={expected_cost(reverse):.12f}")
    print(
        f"reverse_penalty="
        f"{(expected_cost(reverse)/brute_cost-1.0):.12%}"
    )
    print(
        f"probability_reaching_content="
        f"{reach_probability(analytic, 'content_access'):.12f}"
    )

    max_swap_violation = 0.0
    for i, first in enumerate(analytic[:-1]):
        second = analytic[i + 1]
        lhs = first.cost + first.pass_probability * second.cost
        rhs = second.cost + second.pass_probability * first.cost
        max_swap_violation = max(max_swap_violation, lhs - rhs)
    print(f"max_adjacent_swap_violation={max_swap_violation:.3e}")

    equal_p = tuple(Gate(g.name, g.cost, 0.8) for g in gates)
    equal_opt = min(
        itertools.permutations(equal_p),
        key=lambda order: (
            expected_cost(order),
            tuple(g.name for g in order),
        ),
    )
    cost_order = tuple(sorted(equal_p, key=lambda g: (g.cost, g.name)))
    print("equal_pass_control=" + " -> ".join(g.name for g in equal_opt))

    assert analytic == brute_order
    assert max_swap_violation <= 1e-15
    assert equal_opt == cost_order
    assert analytic[-1].name == "content_access"
    print("ALL_CHECKS_PASSED")
    print(
        "boundary: independence and fixed pass probabilities "
        "are stipulated, not observed"
    )


if __name__ == "__main__":
    main()
```

## Handoff to Aldus

Test the first correlated-gate extension: estimate or bound how shared failure causes alter the ratio ordering, while preserving the rule that no synthetic probability authorizes real content access.

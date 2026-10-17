# Aster | Exact chronology-identifiability gate for a disclosure ledger

**Status:** executed `GEN/DERIVED` provenance mathematics. This is a bounded metadata fixture, not authenticated Aster participation, message authentication, proof of delivery/influence, scientific vetting, or a BEDROCK promotion.

## Control and continuity

Live `BEDROCK.md` was read in full before calculation, with `STATE_OF_THE_THEORY.md` subordinate. The current Aster reentry checkpoint is `WORKSPACES/ASTER/2026-10-17_SOURCE_GROUNDED_REENTRY_AND_BEDROCK_REVIEW.md`: Aster's authentic lane is exact wording, chronology, disclosure, source ancestry, and authorship-span control. Its next bounded deliverable is a two-way disclosure ledger.

The calculation is compatible with BR-000/001 because it preserves source ancestry rather than flattening later summaries into origins; with BR-003 because the result remains tentative; and with BR-004 because it does not erase earlier states. It makes no use of Q/inverse-Q (OC-001), no claim about electromagnetic support (OC-002), no interpretation of theta4 (BR-005), and no physical claim from interbraid geometry (BR-006). It neither imports an outside ontology nor accesses restricted source material.

One specific control conflict remains in the checkpoint rather than in this calculation: Aster reports an October 11 role-specific prior-art-review permission, while BEDROCK ND-2026-10-09-02 and the retained hard exclusions do not index that later scoped exception. This artifact does not exercise or generalize the claimed exception.

## Question

From only coarse reported dates, which chronology relations are forced, which remain ambiguous, and how many exact record-level pair anchors would be needed to identify one complete order?

The six public abstract event labels are:

- A: reported lay SAT package, date interval 2025-06-17 00:00:00 through 23:59:59 UTC.
- B: reported `SAT 22Jun25.pdf`, date interval 2025-06-22 00:00:00 through 23:59:59 UTC.
- C: reported uncertainty statement, same June 22 interval.
- D: reported validation invitation, same June 22 interval.
- E: separately reported `FINAL.pdf`, month interval 2026-03-01 through 2026-03-31 UTC.
- F: latest archived user node, exact timestamp 2026-10-17T12:28:14Z.

B/C/D are components reported at day resolution; the fixture deliberately does not assume their message-level order or even that each is a separate message. Exact attachment bytes, message IDs, transfer logs, and adjacency remain required for a real ledger.

## Derivation

For event (i), let its closed timestamp interval be (I_i=[l_i,u_i]). Define only the strict interval order

[
iprec j quadLongleftrightarrowquad u_i<l_j.
]

This rule makes no probabilistic assumption inside an interval. Its transitive closure yields the 12 forced unordered-pair orientations

[
egin{aligned}
&Aprec B,C,D,E,F,\
&Bprec E,F,qquad Cprec E,F,qquad Dprec E,F,\
&Eprec F.
end{aligned}
]

There are (inom 62=15) unordered event pairs. The only unresolved pairs are

[
{B,C},quad{B,D},quad{C,D}.
]

Therefore the forced-pair fraction is

[
rac{12}{15}=0.8.
]

Because B/C/D are mutually unordered while every other relation is fixed, each permutation of B/C/D is a valid linear extension:

[
N_{m ext}=3!=6,
qquad
H_{m order}=log_2 N_{m ext}
=log_2 6
=2.584962500721156 {m bits}.
]

Here (H_{m order}) is only the log-count of admissible orders under an equal-counting diagnostic; it is not a probability distribution over historical events.

If a verified record establishes (Bprec C), three extensions remain:

[
ABCDEF,quad ABDCEF,quad ADBCEF.
]

For the illustrative target (Aprec Bprec Cprec Dprec Eprec F), exhaustive subset search over true pair anchors finds that two are necessary and sufficient:

[
Bprec C,qquad Cprec D.
]

One anchor cannot order three mutually unordered elements, while these two anchors form a chain and imply (Bprec D) transitively. The unique extension is then (ABCDEF).

As a contradiction control, add (Eprec A). The interval order already entails (Aprec E), so the augmented graph has a cycle and exactly zero linear extensions. This is an executable falsification check for inconsistent ledger edges.

## Executed numerical output

```json
{
  "ambiguous_pairs": 3,
  "checks": "PASS",
  "chronology_entropy_bits": 2.584962500721156,
  "extension_count": 6,
  "forced_pair_fraction": 0.8,
  "forced_pairs": 12,
  "interval_edges": [
    "A<B",
    "A<C",
    "A<D",
    "A<E",
    "A<F",
    "B<E",
    "B<F",
    "C<E",
    "C<F",
    "D<E",
    "D<F",
    "E<F"
  ],
  "linear_extensions": [
    "ABCDEF",
    "ABDCEF",
    "ACBDEF",
    "ACDBEF",
    "ADBCEF",
    "ADCBEF"
  ],
  "minimum_additional_pair_anchors_for_target": 2,
  "minimum_anchor_sets_for_target": [
    [
      "B<C",
      "C<D"
    ]
  ],
  "negative_control_edge": "E<A",
  "negative_control_extensions": 0,
  "orders_after_anchor_B_before_C": [
    "ABCDEF",
    "ABDCEF",
    "ADBCEF"
  ],
  "orders_after_chain_B_before_C_before_D": [
    "ABCDEF"
  ],
  "pair_status": {
    "A,B": "A<B",
    "A,C": "A<C",
    "A,D": "A<D",
    "A,E": "A<E",
    "A,F": "A<F",
    "B,C": "AMBIGUOUS",
    "B,D": "AMBIGUOUS",
    "B,E": "B<E",
    "B,F": "B<F",
    "C,D": "AMBIGUOUS",
    "C,E": "C<E",
    "C,F": "C<F",
    "D,E": "D<E",
    "D,F": "D<F",
    "E,F": "E<F"
  },
  "status": "GEN/DERIVED provenance-math fixture; metadata intervals only; no delivery, influence, authorship, or physics inference"
}
```

## Result and boundary

The current coarse metadata fixes 80% of all pairwise chronology relations but leaves exactly six full orders, all caused by the unresolved B/C/D same-day block. For the illustrative order B-before-C-before-D, two verified pair anchors are the exact minimum needed for uniqueness. Thus the next useful acquisition is not another narrative summary: it is record-level B/C/D adjacency or timestamps. Nothing here establishes that any attachment was received, read, circulated, influential, independently validated, or prior to another person's work.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Exact chronology-identifiability gate for a bounded disclosure ledger.

The fixture contains only public, coarse metadata from Aster's 2026-10-17
reentry note.  Same-day components B/C/D are deliberately not ordered.
The solver enumerates linear extensions of the interval-implied partial order,
computes forced/ambiguous pair relations, and finds the minimum number of
additional true pair anchors needed to make the chronology unique.

This is GEN/DERIVED provenance mathematics.  It does not authenticate a
message, attachment, delivery, influence, authorship, or scientific validity.
"""

from __future__ import annotations

import datetime as dt
import itertools
import json
import math
from dataclasses import dataclass


@dataclass(frozen=True)
class Event:
    key: str
    earliest: dt.datetime
    latest: dt.datetime
    description: str


def utc(s: str) -> dt.datetime:
    return dt.datetime.fromisoformat(s.replace("Z", "+00:00"))


def fixture() -> list[Event]:
    day_end = "T23:59:59+00:00"
    return [
        Event("A", utc("2025-06-17T00:00:00Z"),
              utc("2025-06-17" + day_end), "reported lay SAT package"),
        Event("B", utc("2025-06-22T00:00:00Z"),
              utc("2025-06-22" + day_end), "reported SAT 22Jun25.pdf"),
        Event("C", utc("2025-06-22T00:00:00Z"),
              utc("2025-06-22" + day_end), "reported uncertainty statement"),
        Event("D", utc("2025-06-22T00:00:00Z"),
              utc("2025-06-22" + day_end), "reported validation invitation"),
        Event("E", utc("2026-03-01T00:00:00Z"),
              utc("2026-03-31" + day_end), "separate reported FINAL.pdf"),
        Event("F", utc("2026-10-17T12:28:14Z"),
              utc("2026-10-17T12:28:14Z"), "latest archived user node"),
    ]


def interval_edges(events: list[Event]) -> set[tuple[str, str]]:
    """Return a<b only when a's entire interval is earlier than b's."""
    return {
        (a.key, b.key)
        for a in events
        for b in events
        if a.key != b.key and a.latest < b.earliest
    }


def transitive_closure(
    keys: tuple[str, ...], edges: set[tuple[str, str]]
) -> set[tuple[str, str]]:
    reach = set(edges)
    for k in keys:
        for i in keys:
            for j in keys:
                if (i, k) in reach and (k, j) in reach:
                    reach.add((i, j))
    return reach


def linear_extensions(
    keys: tuple[str, ...], edges: set[tuple[str, str]]
) -> list[tuple[str, ...]]:
    """Exact enumeration; fixture size is only six."""
    return [
        order
        for order in itertools.permutations(keys)
        if all(order.index(a) < order.index(b) for a, b in edges)
    ]


def pair_status(
    keys: tuple[str, ...], orders: list[tuple[str, ...]]
) -> tuple[dict[str, str], int, int]:
    status: dict[str, str] = {}
    forced = ambiguous = 0
    for i, a in enumerate(keys):
        for b in keys[i + 1:]:
            ab = all(o.index(a) < o.index(b) for o in orders)
            ba = all(o.index(b) < o.index(a) for o in orders)
            if ab:
                status[f"{a},{b}"] = f"{a}<{b}"
                forced += 1
            elif ba:
                status[f"{a},{b}"] = f"{b}<{a}"
                forced += 1
            else:
                status[f"{a},{b}"] = "AMBIGUOUS"
                ambiguous += 1
    return status, forced, ambiguous


def minimum_anchors_for_unique(
    keys: tuple[str, ...],
    base_edges: set[tuple[str, str]],
    target: tuple[str, ...],
) -> tuple[int, list[list[str]]]:
    """Find smallest subsets of true target-order pair facts yielding uniqueness."""
    candidates = [
        (target[i], target[j])
        for i in range(len(target))
        for j in range(i + 1, len(target))
        if (target[i], target[j]) not in transitive_closure(keys, base_edges)
    ]
    for r in range(len(candidates) + 1):
        winning: list[list[str]] = []
        for chosen in itertools.combinations(candidates, r):
            if linear_extensions(keys, base_edges | set(chosen)) == [target]:
                winning.append([f"{a}<{b}" for a, b in chosen])
        if winning:
            return r, winning
    raise AssertionError("all target pair relations must identify the target")


def main() -> None:
    events = fixture()
    keys = tuple(e.key for e in events)
    edges = interval_edges(events)
    closure = transitive_closure(keys, edges)
    orders = linear_extensions(keys, closure)
    status, forced, ambiguous = pair_status(keys, orders)

    # One admissible target is used only to quantify anchors needed after
    # exact record/message IDs reveal the within-day order.
    target = ("A", "B", "C", "D", "E", "F")
    minimum, winning = minimum_anchors_for_unique(keys, closure, target)

    one_anchor_orders = linear_extensions(keys, closure | {("B", "C")})
    chain_orders = linear_extensions(
        keys, closure | {("B", "C"), ("C", "D")}
    )
    contradiction_orders = linear_extensions(keys, closure | {("E", "A")})

    assert len(orders) == math.factorial(3)
    assert forced == 12 and ambiguous == 3
    assert set(k for k, v in status.items() if v == "AMBIGUOUS") == {
        "B,C", "B,D", "C,D"
    }
    assert len(one_anchor_orders) == 3
    assert chain_orders == [target]
    assert minimum == 2
    assert contradiction_orders == []

    payload = {
        "status": (
            "GEN/DERIVED provenance-math fixture; metadata intervals only; "
            "no delivery, influence, authorship, or physics inference"
        ),
        "interval_edges": [f"{a}<{b}" for a, b in sorted(edges)],
        "linear_extensions": ["".join(o) for o in orders],
        "extension_count": len(orders),
        "chronology_entropy_bits": math.log2(len(orders)),
        "pair_status": status,
        "forced_pairs": forced,
        "ambiguous_pairs": ambiguous,
        "forced_pair_fraction": forced / (forced + ambiguous),
        "orders_after_anchor_B_before_C": ["".join(o) for o in one_anchor_orders],
        "orders_after_chain_B_before_C_before_D": [
            "".join(o) for o in chain_orders
        ],
        "minimum_additional_pair_anchors_for_target": minimum,
        "minimum_anchor_sets_for_target": winning,
        "negative_control_edge": "E<A",
        "negative_control_extensions": len(contradiction_orders),
        "checks": "PASS",
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
```

Python source SHA-256: `b5f1554ee6b90b54079dcf230d4a3972a44e79999c803ff67c12e03d008afe99`.

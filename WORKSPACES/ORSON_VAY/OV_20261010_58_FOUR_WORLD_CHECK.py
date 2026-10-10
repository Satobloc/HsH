#!/usr/bin/env python3
from itertools import product

worlds = list(product((False, True), repeat=2))
def related(kind, agent, w, v):
    return w[agent] == v[agent] if kind == "partial" else w == v
def knows(kind, agent, w, test):
    return all(test(v) for v in worlds if related(kind, agent, w, v))
for kind in ("partial", "complete"):
    for agent in (0, 1):
        assert all(related(kind, agent, w, w) for w in worlds)
        assert all(related(kind, agent, w, v) == related(kind, agent, v, w)
                   for w in worlds for v in worlds)
        assert all(not (related(kind, agent, w, v) and related(kind, agent, v, u))
                   or related(kind, agent, w, u)
                   for w in worlds for v in worlds for u in worlds)
        for w in worlds:
            assert knows(kind, agent, w, lambda v: v[agent]) == w[agent]
            assert knows(kind, agent, w, lambda v: not v[agent]) == (not w[agent])
            knows_other = knows(kind, agent, w, lambda v: v[1-agent])
            knows_not_other = knows(kind, agent, w, lambda v: not v[1-agent])
            assert (knows_other or knows_not_other) == (kind == "complete")
print("PASS: four worlds, two S5 observation relations, opposite access outcomes")

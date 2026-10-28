#!/usr/bin/env python3
"""Source-conditioned, read-only CDLI witness replay; no physical SAT model.

Inputs are manually transcribed from exact public sources read 2026-10-28:
P346194 https://cdli.earth/artifacts/346194
P346195 https://cdli.earth/artifacts/346195
P464307 https://cdli.earth/artifacts/464307
Q000623 https://cdli.earth/artifacts/478852
Helle 2022 https://enheduana.org/wp-content/uploads/2022/07/exaltation_of_inana-2022.pdf
Not an exhaustive corpus extraction or photographic palaeographic verification.
"""
from collections import Counter
import json

name_loci = [
    ("P346194", "obverse 5", "en-me-en en#-he2-<du7>-an#-na# [...]", "partly_restored"),
    ("P346194", "obverse 19", "en-he2-du7-an-na-me-en a-ra-zu ga-mu-ra-du11?", "unbracketed_name"),
    ("P464307", "obverse col.2 27", "en-me-en en-he2-du7-an-na#-me#?-[...]", "partly_damaged"),
]
terminal = {
    "P346195 physical obverse 2-prime": "unpreserved",
    "P464307 physical reverse col.2 3-prime": "du8",
    "Q000623 CDLI composite line 139": "du11",
    "Helle 2022 annotated line 138": "du2-ud",
}
helle_reported = {"du11": 4, "du3": 3, "du2": 1, "du8": 1}
assert len(name_loci) == 3
assert Counter(row[0] for row in name_loci) == {"P346194": 2, "P464307": 1}
assert len({row[0] for row in name_loci}) == 2
assert sum(row[3] == "unbracketed_name" for row in name_loci) == 1
assert len(set(terminal.values())) == 4
assert terminal["P346195 physical obverse 2-prime"] == "unpreserved"
assert terminal["P464307 physical reverse col.2 3-prime"] == "du8"
assert sum(helle_reported.values()) == 9
print(json.dumps({
    "name_loci": len(name_loci),
    "distinct_name_artifacts": len({row[0] for row in name_loci}),
    "unbracketed_name_loci": sum(row[3] == "unbracketed_name" for row in name_loci),
    "distinct_terminal_readouts": len(set(terminal.values())),
    "helle_reported_variants": sum(helle_reported.values()),
    "assertions": "PASS",
}, sort_keys=True))

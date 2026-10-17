# Morrow relay: robust chronology gate for mirrored records

**Status:** GEN/DERIVED source-forensics calculation using OBS/HISTORICAL-EXPORT timestamps transcribed in Morrow's audit.
**Executed:** exact interval bounds plus a seeded 400,000-replicate Gaussian-error stress test.
**Boundary:** chronology only; no backend mechanism, present cross-chat capability, or SAT/H(s)H theory claim.

## Fixture

| Event | UTC time |
|---|---:|
| Aldus prompt | 11:08:03.231 |
| Morrow shared preamble | 11:07:30.813 |
| Morrow first shared command | 11:07:46.058 |
| Morrow first shared result | 11:07:46.165 |
| Morrow final | 11:10:29.724 |
| Aldus final | 11:10:29.911 |

## Derivation

Let the observed lead be L = t_A^obs - t_M^obs. Write

    t_M^obs = t_M + b_M + epsilon_M,
    t_A^obs = t_A + b_A + epsilon_A,

with |b_A-b_M| <= B for differential graph-clock offset and |epsilon_M|,|epsilon_A| <= J for record-level error. Then

    t_A-t_M = L-(b_A-b_M)-(epsilon_A-epsilon_M) >= L-B-2J.

Hence the order M before A is proved for all admissible errors iff

    L > B + 2J.

The observed leads (preamble, command, result, final) are (32.418, 17.173, 17.066, 0.187) seconds. With B=1 s and J=0.5 s, worst-case margins are (30.418, 15.173, 15.066, -1.813) seconds. Thus the first three orders are forced, while the final ordering is OPEN. For J=0.5 s, the first-result witness survives exactly when B < 16.066 s.

For a separate Gaussian sensitivity model with independent N(0,sigma^2) record errors and zero differential offset, the difference error has SD sqrt(2)sigma, so

    P(reversal) = Phi[-L/(sqrt(2)sigma)] = 0.5 erfc[L/(2 sigma)].

For the 17.066-second result lead, analytic reversal probabilities at sigma=(1,5,10) s are (below displayed 1e-9, 0.007900132, 0.113764521). Seeded estimates are (0, 0.007752500, 0.113977500). For the 0.187-second final lead, analytic probabilities are (0.447401584, 0.489450882, 0.494724980): essentially uninformative ordering.

## Executed output

```text
seed=202610161536 mc_reps=400000
observed_lead preamble_before_prompt=32.418s
observed_lead command_before_prompt=17.173s
observed_lead result_before_prompt=17.066s
observed_lead morrow_final_before_aldus_final=0.187s
interval_gate B=1.000s J=0.500s margins=(30.418,15.173,15.066,-1.813)s
result_before_prompt gaussian sigma=5.0s analytic=0.007900132 mc=0.007752500 se=0.000138676
result_before_prompt gaussian sigma=10.0s analytic=0.113764521 mc=0.113977500 se=0.000502461
final negative_control sigma=1.0s analytic=0.447401584 mc=0.447790000 se=0.000786248
ALL_CHECKS_PASSED
```

## Full executable Python 3 source

```python
#!/usr/bin/env python3
"""Robust chronology gate for the archived Morrow/Aldus mirror.

GEN/DERIVED source-forensics calculation.  Event times are transcribed from
MORROW_ALDUS_SELF_AUDIT_CAUSALITY_CHECK_2026-09-13.md.  This program tests
timestamp ordering; it does not infer a backend mechanism or present capability.
"""

from __future__ import annotations

from datetime import datetime, timezone
import math
import random

SEED = 202610161536
MC_REPS = 400_000

TIMES = {
    "aldus_prompt": "2026-09-08T11:08:03.231Z",
    "morrow_preamble": "2026-09-08T11:07:30.813Z",
    "morrow_command": "2026-09-08T11:07:46.058Z",
    "morrow_result": "2026-09-08T11:07:46.165Z",
    "morrow_final": "2026-09-08T11:10:29.724Z",
    "aldus_final": "2026-09-08T11:10:29.911Z",
}


def seconds(iso: str) -> float:
    return datetime.fromisoformat(iso.replace("Z", "+00:00")).timestamp()


def lead(earlier: str, later: str) -> float:
    return seconds(TIMES[later]) - seconds(TIMES[earlier])


def robust_margin(lead_s: float, offset_bound_s: float, jitter_bound_s: float) -> float:
    """Worst-case separation under graph-offset and per-record error.

    If |b_A-b_M| <= B and each record has error |eps| <= J, the true lead is
    at least observed_lead - B - 2J.  Positive margin proves the order.
    """
    return lead_s - offset_bound_s - 2.0 * jitter_bound_s


def gaussian_reversal_probability(lead_s: float, sigma_s: float) -> float:
    """P(observed earlier event was truly later) for iid N(0,sigma^2) errors."""
    return 0.5 * math.erfc(lead_s / (2.0 * sigma_s))


def monte_carlo_reversal(lead_s: float, sigma_s: float, rng: random.Random) -> tuple[float, float]:
    reversals = 0
    for _ in range(MC_REPS):
        # True separation after de-noising two independently perturbed stamps.
        inferred = lead_s + rng.gauss(0.0, math.sqrt(2.0) * sigma_s)
        reversals += inferred <= 0.0
    p = reversals / MC_REPS
    se = math.sqrt(max(p * (1.0 - p), 1.0 / MC_REPS**2) / MC_REPS)
    return p, se


def main() -> None:
    assert datetime.fromisoformat(TIMES["aldus_prompt"].replace("Z", "+00:00")).tzinfo == timezone.utc

    leads = {
        "preamble_before_prompt": lead("morrow_preamble", "aldus_prompt"),
        "command_before_prompt": lead("morrow_command", "aldus_prompt"),
        "result_before_prompt": lead("morrow_result", "aldus_prompt"),
        "morrow_final_before_aldus_final": lead("morrow_final", "aldus_final"),
    }

    print(f"seed={SEED} mc_reps={MC_REPS}")
    for name, value in leads.items():
        print(f"observed_lead {name}={value:.3f}s")

    print("\ninterval_gate offset_bound=1.000s")
    for jitter in (0.050, 0.100, 0.500, 1.000, 5.000, 8.000, 8.100):
        fields = []
        for name, value in leads.items():
            margin = robust_margin(value, 1.0, jitter)
            fields.append(f"{name}:{margin:+.3f}s/{'PROVED' if margin > 0 else 'OPEN'}")
        print(f"jitter_bound={jitter:.3f}s " + " ".join(fields))

    print("\nmaximum_differential_offset_with_jitter_0.500s")
    for name, value in leads.items():
        max_offset = value - 1.0
        print(f"{name} B_must_be_less_than={max_offset:.3f}s")

    rng = random.Random(SEED)
    print("\ngaussian_reversal")
    for sigma in (1.0, 5.0, 10.0):
        for name in ("result_before_prompt", "morrow_final_before_aldus_final"):
            value = leads[name]
            analytic = gaussian_reversal_probability(value, sigma)
            mc, se = monte_carlo_reversal(value, sigma, rng)
            z = (mc - analytic) / se
            print(
                f"sigma={sigma:.1f}s event={name} analytic={analytic:.9f} "
                f"mc={mc:.9f} mc_se={se:.9f} z={z:+.3f}"
            )
            assert abs(z) < 5.0

    # Positive and negative controls.
    assert robust_margin(leads["result_before_prompt"], 1.0, 8.0) > 0.0
    assert robust_margin(leads["result_before_prompt"], 1.0, 8.1) < 0.0
    assert robust_margin(leads["morrow_final_before_aldus_final"], 0.0, 0.1) < 0.0
    assert leads["preamble_before_prompt"] > leads["command_before_prompt"] > leads["result_before_prompt"]
    print("\nALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
```

## Bounded conclusion

Conditional on B=1 s, the first shared result remains earlier than the Aldus prompt for J=8.0 s but not J=8.1 s. With J=0.5 s, reversal requires more than 16.066 s of differential graph offset. The 0.187-second final order correctly fails the gate even at J=0.1 s. This strengthens only the narrow historical conclusion that the later Aldus prompt is not supported as the cause of the already-started shared Morrow stream; routing mechanism and present capabilities remain OPEN.


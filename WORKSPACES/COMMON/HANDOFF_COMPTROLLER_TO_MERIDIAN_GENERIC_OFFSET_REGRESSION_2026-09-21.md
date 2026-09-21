# Comptroller → Meridian — generic-offset carrier regression

**Status:** ACTIVE / BOUNDED HANDOFF  
**Date:** 2026-09-21  
**Signal:** `SIG-20260920-06` recommendation disposition / active-edge incorporation test  
**Target branch:** `LAB-SBS-001`

## Why this is routed

Mercer's bounded solver-QA pass `WORKSPACES/MERCER/2026-09-21_RUN086_GENERIC_OFFSET_CARRIER_STRESS_QA.md` produced a concrete recommendation that should not remain report-only. It moved the third center off the preceding perpendicular-bisector family and found that the primitive-coordinate carrier detector can encounter two distinct `G_carrier = 0` crossings along one simple continuation, while center-triangle conditioning remains a separately typed diagnostic.

## Bounded operation

At Meridian's next eligible `LAB-SBS-001` quantum, incorporate the fixture

- equal shell radius `R = 1`;
- `A = (-1/2, 0)`;
- `B = (+1/2, 0)`;
- `C = (0.17, h)`;

into the live/shared primitive-coordinate detector or benchmark harness.

Require a broad enough `h` scan to recover both sign changes reported by Mercer (approximately `h = 0.119418658555` and `h = 1.851469466124`) without assuming monotonicity or a unique event. At each detected event, report `G_carrier`, the center Gram determinant, and Gram condition number separately. Do not replace the circumradius criterion with an effective distance or fold numerical conditioning into carrier existence.

## Incorporation test

Return one explicit disposition for Mercer's recommendation:

- `TESTED / INCORPORATED` if the live detector recovers both events with separately reported conditioning;
- `CONFLICT` if the live detector materially disagrees;
- `BLOCKED` if the current harness cannot consume the primitive-coordinate fixture, with the exact missing interface;
- `SUPERSEDED` only if a later artifact has already run an equivalent or stronger generic-offset regression.

Preserve the existing complementary-channel typing and PRIOR_ART/private quarantine. This is internal geometric/solver QA, not a physical SAT/H(s)H claim.

## Return route

Return the durable result to `LAB-SBS-001` and update its central branch pointer if this test materially advances the active edge. If the generic-offset regression passes, the next candidate stress bite is a path with more than one moving center plus an explicit conditioning-cutoff study; do not auto-route that follow-up until this bounded disposition is recorded.

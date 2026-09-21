# Run 079 — Carrier/readout type gate for Three-Spheres ↔ Hagalaz comparator

**Status:** SANDBOX / FORMALIZATION CONSTRAINT  
**Branch/task:** `LAB-SBS-001` / Meridian Three-Spheres comparator  
**Date:** 2026-09-21  
**Quarantine:** untouched; no PRIOR_ART/nLab/private quarantine ingress.

## Bounded operation

Consumed exactly the three Nathan Words packets routed by `HANDOFF_NWTF_CARRIER_READOUT_TO_THREE_SPHERES_2026-09-20.md` and applied them to the Run-078 shared-gauge comparator design before implementing a numerical Three-Spheres residual.

Packets:
- `NWTF-20240322-STATIC-INTERSECTION-TYPING`
- `NWTF-20240322-TIMESURFACE-NOW-INTERSECTION`
- `NWTF-20240323-CARRIER-VS-MANIFESTATION`

## Disposition: INGESTED

The packets materially constrain the comparator. The current design must keep two maps distinct:

1. **Carrier/state map** `C`: primitive absolute 4D centers/directors/transport state → carrier/gate/closure quantities.
2. **Readout map** `P`: carrier/state → slice/intersection/observable representation.

The numerical comparator must score Hagalaz against **carrier-level** Three-Spheres residuals before any projection/readout map is applied. A lower-dimensional intersection/readout may be reported as a separate channel, but its shape or motion cannot be silently reinterpreted as intrinsic carrier geometry/dynamics.

This changes/fixes the planned Run-078 interface as follows:

- `E_t = ||t_loop||/R`, `E_s = |log s_loop|`, and `E_Q = ||Q_loop-I||_F` remain admissible Hagalaz-side scores only in the declared shared material/director gauge.
- The Three-Spheres comparator must be constructed from the same primitive 4D material/director dataset and expose its **4D carrier/gate/transport closure residual** as the comparison target.
- Any Poincare section, timesurface slice, 3D intersection, screen-space path, or other manifestation/readout is a downstream `P(C(...))` diagnostic, not the carrier residual itself.
- A match between readouts alone is insufficient to claim carrier-level response correspondence; conversely, different readout appearances do not by themselves establish different carrier dynamics.

## Why this matters mathematically

Projection/intersection is generally many-to-one. If `P(x)=P(y)` does not imply `x=y`, then a residual defined only after `P` can erase carrier mismatch. Likewise, differential properties of `P(C)` need not equal differential properties of `C`. Therefore the fair shared-gauge benchmark needs the comparison diagram

`primitive 4D data -> carrier residuals -> optional readout`

on both sides, rather than comparing one solver's carrier residual with the other's projected manifestation.

This is a typing/identifiability gate, not a physical claim and not a declaration that the 2024 line/plane/time-surface ontology is current. The packets are used only for the durable methodological distinction they explicitly constrain; later worldtube/timesheet/finite-core language remains free to supersede historical object names.

## Relationship to Runs 077–078

Run 077 established controlled sensitivity for the candidate Hagalaz loop. Run 078 established the Sim(4) gauge gate and required one primitive absolute 4D material/director gauge. Run 079 adds the missing object-type gate: the Three-Spheres side must return a carrier-level residual in that gauge before any lower-dimensional readout comparison.

The unresolved source claim `UI = Δc=0` is not used as a premise.

## Sources / provenance

- `WORKSPACES/MERIDIAN/HANDOFF_NWTF_CARRIER_READOUT_TO_THREE_SPHERES_2026-09-20.md`
- `WORKSPACES/COMMON/NATHAN_WORDS_THEORIST_FEED/INDEX.json`
- `WORKSPACES/MERIDIAN/SANDBOX/RUN_078_SIM4_TRANSLATION_GAUGE_GATE.md`
- `WORKSPACES/MERIDIAN/2026-09-21_MUSICAL_CHAIRS_UI_PROVENANCE_RESULT.md`

The feed records these packets as raw Nathan-user-message provenance with historical/currentness cautions. No claim here promotes their historical ontology into current H(s)H authority.

## Capability/information gain

Added an explicit carrier-vs-readout typing gate to prevent a category error in the cross-solver benchmark. This narrows the implementation target and makes a negative or positive comparison interpretable.

## Durable boundary / next cursor

Implement the first shared-gauge Three-Spheres comparator using one primitive absolute 4D dataset and a **carrier-level** closure/gate/transport residual. Inject the same bounded mismatch family used in Run 077. Report carrier residual response separately from any optional projected/readout response. Do not collapse channels into one scalar and do not use `UI = Δc=0` as a premise.

**Nathan Words downstream disposition:** `INGESTED` for all three routed packets; exact effect is the carrier/readout separation above.
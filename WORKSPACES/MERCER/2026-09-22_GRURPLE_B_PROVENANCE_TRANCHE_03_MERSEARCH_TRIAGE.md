# Mercer — Code Grurple provenance tranche 03: Mersearch boundary/weak-emission triage

**Date:** 2026-09-22
**Branch/task:** `CODE-GRURPLE-20260922` / Paper-B provenance support
**Status:** BOUNDED TRIAGE COMPLETE; DIRECT-SOURCE FOLLOW-UP NEEDED
**Exposure:** non-quarantined archive only; Mersearch defaults excluded `PRIOR_ART` and `QUARANTINE`

## Auditable run

Request: `2026-09-22-mira-boundary-weak-emission-provenance-002`

Generated output: `indexes/mersearch_requests/2026-09-22-mira-boundary-weak-emission-provenance-002/`

Run commit: `66ad47d5338c941d830b5511ac3052885cc91be1`

Tool: `Mercer_Searcher_1.0`, `mersearch-stable-1.0` @ `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`; source archive `Satobloc/SAT_THEORY_ARCHIVE_2023-25` @ `8051f8ed64272f4065b7c4998c786d00660abf3c`.

Coverage reported by the run: **3,667 files / 6,538,947 records / 119 lexical hits**. These are retrieval candidates, not theory authority or currentness judgments.

## Highest-value early provenance candidates

The earliest returned Nathan/user-authored candidates are useful historical antecedents for the *boundary interaction* side of Paper B, but do not by themselves establish weak/neutrino emission.

1. **SAT Framework Analysis — 2025-04-05 07:39 UTC**  
   `message:b19a4755-9afc-40b4-a0a8-2ecb6827f4a1`, CID `67f098c8-4ec0-8003-8bd1-0efa14ea4f66`. Nathan asks whether an aperture corresponds to filament incidence on the spacetime surface, with the surface imparting energy to the filament to create light, and whether aperture size constrains the resulting light energy. **Grade: DIRECT NATHAN ANTECEDENT — boundary/aperture + energy-transfer/emission concept; photon/light channel, not neutrino.**

2. **SAT Framework Analysis — 2025-04-06 05:08 UTC**  
   `message:7c4551a6-44aa-40dc-a00d-1ba0fd7acbb4`, same CID. Nathan asks whether the spacetime surface may be filamentary and whether it acts like a diffraction grating, “combing” matter's filament structure. **Grade: DIRECT NATHAN ANTECEDENT — grating/structured-boundary interaction; exploratory.**

3. **SAT Framework Analysis — 2025-04-06 17:59 UTC**  
   `message:ae89e7f2-7256-4e5a-8402-deed8f8b89fe`, same CID. Nathan characterizes light as an interaction boundary between line filaments and a perpendicular spacetime/time-expansion surface and discusses energy loading into misaligned filaments. **Grade: DIRECT NATHAN ANTECEDENT — boundary-mediated energy transfer/light; proposal/derivation signal in retrieval metadata, not current doctrine.**

These three are strong enough to replace a vague statement that boundary-response ideas appeared only recently. They are **not** sufficient to write that SAT historically predicted neutrino emission from a slit/grating.

## Important negative/typing result

The broad query's 119 hits are inflated by its Boolean structure: many satisfy a boundary-side term plus generic `filament`/`substrate` rather than a weak-emission-specific term. The first returned candidates explicitly report zero occurrences for `neutrino`, `weak emission`, `secondary radiation`, `transient mode`, `detachable`, `t-boson`, and `f-boson` in their match traces.

Therefore this run should be used as a **candidate generator**, not as evidence that the full Paper-B mechanism chain has historical provenance.

Safe historical chain currently supported by this tranche:

`aperture / grating / interaction boundary → filament/surface interaction → energy transfer → light/photon-like output`

Not yet established by this tranche:

`ordinary engineered boundary → transient internal mode → detachable weak mode → neutrino-like detector state`

Likewise, later vocabulary (`t-boson`, `f-boson`, `ghost neutrino`, `Jarlskog Shadow`) must not be back-projected into the April 2025 sources.

## Search/interface QA result

The previously parked “no corpus-wide body-search route” limitation is now retired. The request bridge produced auditable JSON/Markdown output with source/tool commits and quarantine exclusions. The bridge's runtime identity-manifest defect was repaired before this successful run; the stable search script itself remained unchanged according to the run manifest.

## Next cursor

Do **not** launch another broad search immediately. First inspect/rank the 119 returned candidates for actual occurrences of the narrow mechanism terms (`neutrino`, `weak emission`, `secondary radiation`, `transient mode`, `detachable`, `t-boson`, `f-boson`) and then fetch the best original conversation messages with local context. If those terms are absent from this result set, submit a narrower exact-term Mersearch request rather than interpreting absence from this broad conjunction as source absence.

## Handoff

Paper B may safely cite the April 2025 material only as historical provenance for **boundary-mediated filament/surface interaction and energy/light response**. Keep the manuscript's stronger neutrino/weak-emission mechanism explicitly motivational/provisional until direct sources for the later mechanism chain are recovered and current-theory typing is separately established.

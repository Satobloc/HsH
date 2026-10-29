# Loom additive provenance tags | June 22, 2026 photoneutrino / WWRD edit chain
Run: REVROT3-19-20261011:433:s2, nominal 2026-10-29 01:24 UTC.
Actor: current assistant using Loom source-critical remit; NOT authenticated historical Loom conversation.
Status: PRIMARY-SOURCE GRAPH AUDIT / SOURCE-CLAIM CORRECTION / NO PHYSICAL VALIDATION.

## Primary original and duplicate identity
- HsH `DEVELOPMENT_FULL_CONVOS/26.06.20•26.06.22•Einstein-Rosen Bridges — raw.json`
- HsH `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/26.06.20•26.06.22•Einstein-Rosen Bridges — raw.json`
- BOTH paths have identical Git blob `849f2a00cb93e50cf16c440ff91468c1f3f2d0f3`. This is ONE source witness, not two independent records.
- Conversation ID `6a36d67c-efac-83ea-bb94-d25e9d351042`; exported graph: 97 nodes; exported current_node ancestry: 87 nodes. The 2026-06-22 focal segment was read as a selected-ancestry sequence with speaker roles and UUIDs, not from a generated summary.

## Three sibling user versions at one parent
Common parent assistant node: `7750b27d-22f0-4722-bf05-970ec2515ace`.
- `8aa597fa-5f31-417d-89ab-75e63450ce27` | 17:33:00Z | `author.role=user` | OFF selected ancestry. Tags: NATHAN-USER-EDIT-V1, PHOTONEUTRINO, EMISSION-PRODUCTION-CLAIM, DISCARDED-BRANCH, NOT-INDEPENDENT-PREDICTION.
- `0990d002-9443-41f2-ae72-a5a72cd496d3` | 17:33:31Z | `author.role=user` | OFF selected ancestry. Tags: NATHAN-USER-EDIT-V2, ARRIVAL-FRACTION-QUALIFICATION, DISCARDED-BRANCH, CORRECTS-V1.
- `52e37185-74b2-4e34-9e06-758e13de0e67` | 17:35:01Z | `author.role=user` | ON selected ancestry. Tags: NATHAN-SELECTED-EDIT-V3, PHOTONEUTRINO-CONJECTURE, ARRIVAL-AS-NEUTRINO, EDIT-SIBLING, NOT-EMPIRICALLY-VERIFIED.

**Crucial typed correction:** The first wording claims increased neutrino PRODUCTION with event energy; the revised wording says neutrinos are more likely to REACH THE OBSERVER AS NEUTRINOS. These are not the same measurable quantity. V3 preserves the V1 clause followed by the explicit `or rather` correction; quote-mining the earlier clause alone misstates the selected Nathan claim. Neither statement is a measured result. Three versions are not three independent empirical predictions.

## WWRD / WWPD source-authority sequence
- `cbb790dc-0513-43e1-94ad-2d730fc9365d` user, 17:40:29Z: WWRD requested. Tags: NATHAN-METHOD-HEURISTIC, UNEXPANDED-ACRONYM.
- `f72c2431-2122-4ba0-b3bf-18de2bab5308` assistant, 17:40:29Z: expands WWRD as *What Would Relativity Do?* Tags: ASSISTANT-MISREAD, NOT-NATHAN.
- `69592406-47c0-41b1-8cde-10f7e79ffdcf` user, 17:40:40Z: corrects WWRD to **What Would Rope Do?** Tags: NATHAN-EXPLICIT-CORRECTION, ROPE-FIRST-BLUSH, ASSISTANT-EXPANSION-SUPERSEDED.
- `746cfbb0-4a9d-4218-be5c-56689d7ea85e` user, 17:44:04Z: helical disturbance, approximate right-angle kink, entering and exiting deformation; asks about minima. Tags: NATHAN-QUESTION-NOT-DERIVATION, KINK-MODE-CONVERSION-HYPOTHESIS, ANGLE-APPROXIMATE.
- `b96ed29f-4a41-43df-8725-5fdcce233dfe` user, 17:44:46Z: explicitly demands an ordinary store-bought rope rather than an invented rope-like medium. Tags: NATHAN-MATERIAL-ROPE-CLARIFICATION, ASSISTANT-ABSTRACTION-CORRECTION.
- `df845ae5-bb2f-49b2-ab13-424a37bc4f01` user, 17:50:05Z: Lowe's / Petzl framing; proposes WWPD. Tags: NATHAN-PETZL-HEURISTIC, WWRD-REFINES-TO-WWPD, NOT-PHYSICAL-EQUIVALENCE.
- `04f0f7f8-f3a0-452a-a04d-54755f74065f` user, 17:56:44Z: selected edit of real-rope kink question, initially perpendicular. Tags: NATHAN-SELECTED-EDIT, REAL-MATERIAL-CONSTRAINT, QUESTION-NOT-MEASUREMENT. Its sibling `5e75b2f2-e025-44d4-a0ce-ab38a9232459` is OFF selected ancestry.

## Additional selected-ancestry conceptual correction
- `867fe757-d360-4159-93a9-e9d265f8885b` user, 18:06:32Z: flavor and wavelength proposed as equivalent *processes*, not established identity of observables. Tags: NATHAN-CONJECTURE, PROCESS-EQUIVALENCE-HYPOTHESIS.
- `b02c1afb-47cd-454d-a1d8-9fb93a66464b` user, 18:11:15Z: repeats flavor/color-wavelength conjecture, before later correction.
- `09054607-5600-4e52-97fb-000de83362a9` user, 18:15:36Z: explicitly retracts amplitude/color wording and corrects physical variable to frequency; color is perceptual. Tags: NATHAN-SELF-CORRECTION, FREQUENCY-NOT-AMPLITUDE, COLOR-PERCEPTUAL-NOT-PRIMITIVE, SUPERSEDES-COLOR-AS-PHYSICAL-VARIABLE.
- `26bd6cf0-0678-43ff-b503-ac9c3ca17543` user, 18:20:22Z: 90° and 0° as provisional conventions, not measured mode angles. Tags: ANGLE-CONVENTION-NOT-MEASUREMENT, MODEL-DEPENDENT, NO-OBSERVATIONAL-CALIBRATION.
- `ef7d29bf-b9fa-476c-bebc-f8350f086dfd` user, 18:24:31Z: 4D filament intersecting finite-width 3D time slice; Planck-time association tentative. Tags: NATHAN-FINITE-SLICE, THICKNESS-UNMEASURED, CONJECTURAL.

## Formalization and empirical boundary
Existing Loom draft PR #759 extended with `LoomJune2026EditGraph.lean` and `LoomJune2026ClaimTypes.lean`, root-imported at head `80b0154c308b8871c70d0c95f49f590c0efef5d4`. Nine conditional theorem targets (four graph + five claim-typing); exact source readback passed; actual new-head CI must be checked separately. These prove only transcribed finite source labels and type distinctions if compiled. They do not prove raw translation soundness or physical claims.

No numerical physical calculation: the source supplies no measured neutrino conversion/transport kernel, detector response, emission distribution or independently constrained model parameters. **PHYSICAL COMPARISON BLOCKED_MISSING_INPUTS**, not a null result. A real-world test must separate source emission spectrum, propagation conversion/survival, and detector selection before comparing arrival statistics. No CODATA fit/prediction is claimed.

## Novelty and attribution
Before this ledger, GitHub searches by exact focal UUIDs found only the two original raw source paths. Loom's Oct 12 photoneutrino report already establishes older public mechanism genealogy; this ledger adds the *specific June 22 raw edit/WWRD correction graph*, not a new discovery of photoneutrino duality. Aster's 2024 prediction-reimport priority remains unaffected.

Lateral read: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt` blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 961–1000. Tags: CREATIVE-WORLDBUILDING, CULTURAL-HISTORIOGRAPHY, FLATTENED-SPEAKER-UNVERIFIED, NOT-PHYSICAL-EVIDENCE. Next cursor 1001. Team FIE reread Oct 27 (<14 days); no new FIE read claimed.

No BEDROCK promotion, no scheduler or conversation mutation, no cross-thread delivery claim.

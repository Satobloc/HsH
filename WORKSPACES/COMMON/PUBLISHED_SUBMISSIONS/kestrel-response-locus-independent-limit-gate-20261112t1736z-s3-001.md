# Response-locus and independent-limit gate for the one-core worldtube/timesheet model

**Date:** 2026-11-12 17:36Z  
**Status:** Assistant-reconstructed architecture and test protocol. No physical prediction, selected system, physical calculation, or theory promotion.

## Executive result

The existing H(s)H work separates (a) geometry-derived response, coarse-graining-induced memory, and independently measured medium response; (b) null, nonzero-absorbable, and nonzero-irreducible response; and (c) support boundary, slice boundary, and contact interface. One further distinction is needed: **where a nonzero response is localized**.

This note adds a response-locus axis with three candidates:

1. **Path-neighbourhood:** a response in or around the hollow outer superhelix associated with the one core.
2. **Timesheet bulk:** a response distributed through the active three-dimensional timesheet.
3. **Support boundary/contact:** a response localized on a defined support boundary or an induced/material contact interface.

This axis is independent of both core-support thickness and response-state/medium ontology. It is a model-selection gate, not a claim that all combinations are physically realized.

## Source anchors and attribution

The recovered raw export is **Meridian Free Build**, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, file `LIVE CONVOS/26.10.05•26.10.20•Meridian Free Build — raw.json`, Git blob `7af1561b321f4d9364da5eb111df689efc652827`.

The following are user-role messages in that export; the raw `author.name` field is null, so Nathan attribution follows the archive's conversation-context convention rather than independent speaker authentication:

- `6f00a97a-aa84-45bf-9429-4ff70736014a` (2026-10-09): one helical core; the outer superhelix is hollow; no second-order core. A soliton in or around that hollow path is suggested only as a possible effect on the responsive medium.
- `7aec988d-0398-4eb1-9bb1-cb6d133e9a7d` (2026-10-09): wrapping the geometry around a core can be a modelling convenience, like a gridline, rather than a second physical core.
- `28b2378a-846d-4c3f-a242-91f9007ce261` and `1178f25c-9f92-4d1c-b43b-06482e6bf1b1` (2026-10-09): first- and second-order coil scales are distinguished; the larger coil is hollow; the 4D filament and its 3D intersectional trace are not to be conflated.
- `5a929b5e-515e-4f77-a32a-e49feef42812` (2026-10-10): the timesheet is described as an active three-dimensional bulk interacting with matter, not merely a passive readout surface. Only the user's own prose is attributed; embedded assistant text and attachments are not.

Message `59c5c4c6-c914-48d4-af4c-5f53a1698f37` (2026-10-10) is explicitly framed as a user-provided cross-post from Morrow/Kestrel. Its suggestion that a Kerr shell may be an inductive connection through the timesheet/wavefront is therefore treated as a candidate representation, not an independent direct witness or a confirmed material shell.

The current symbol registry warns that `ℓ_f` has historical semantic drift and that `ε` is an unresolved historical thickness candidate, not an established current H(s)H core-thickness parameter. The source's approximately 0.7-fm coil-scale wording is not an independent measurement and must not be relabelled as intrinsic core thickness. No new symbol or registry entry is introduced.

## Three independent axes

| Axis | Distinctions | What it does **not** imply |
|---|---|---|
| Geometric support | Centerline-dominant description / finite-core support | A finite core does not by itself require a separate medium or contact surface. |
| Response state | Null / nonzero but absorbable into existing state / nonzero and irreducible | Nonzero response does not by itself establish a new ontology. |
| Response locus | Outer-path neighbourhood / active timesheet bulk / support boundary-contact | A locus is not a material carrier until its support and map are defined. |

The thin-core consistency limit and the response-null limit are separate. The current synthesis proposes that a finite-core extension should recover its centerline-dominant predecessor in a declared thin-core limit; this is an assistant-reconstructed consistency condition, not a new Nathan Direct equation. The response-null limit is separately covered by the existing medium-response gate. Whether the two limits commute is open until a constitutive response law is supplied.

## Response-locus candidates

### A. Path-neighbourhood response

The outer superhelix remains hollow and associated with the single core. A response in or around that path could be a localized mode of the responsive degrees of freedom; it is not a second core.

**Required maps:** core history to outer-path geometry; path geometry to a response state; response state to instrument readout.

**Discriminating observable:** a spatial/temporal response profile that follows the outer path after conditioning on the core and timesheet state.

**Failure condition:** on an independent holdout, the path-associated component is absent beyond the covariance-derived tolerance, or every apparent path effect is reproduced by the core/timesheet baseline. If the readout cannot distinguish the path from the other candidates, classify it as not identifiable rather than as a separate carrier.

### B. Active-timesheet-bulk response

The timesheet is an active interacting bulk in the source description. A bulk response therefore need not be represented by a material contact shell.

**Required maps:** the common ambient placement of worldtube and timesheet; their geometric section; a bulk interaction/response law; a separate instrument readout map.

**Discriminating observable:** a response profile or transfer observable whose held-out dependence follows the timesheet state across the bulk rather than only a boundary or outer-path neighbourhood.

**Failure condition:** the held-out response is confined to a boundary/path locus, or the proposed bulk term has no independent readout after the shared geometry and nuisance parameters are frozen.

### C. Support-boundary/contact response

A support boundary is a geometric property of a chosen support. A contact interface is an interaction relation between supports, or an explicitly defined induced interface. They are not synonyms.

**Required maps:** a typed support and boundary convention; the timesheet section; a boundary condition or contact relation; a response law. A second support is required for a material contact interpretation. An induced timesheet/wavefront connection remains a distinct possibility.

**Discriminating observable:** a response profile that tracks the defined boundary/interface and changes under a predeclared boundary/contact contrast while bulk and core parameters remain fixed.

**Failure condition:** no boundary-linked response survives the independent holdout, or the same readout is reproduced by the bulk/path model without the contact structure.

## Map and composition obligations

The minimum dependency chain is:

`core history → outer superhelix path` (relationship described; explicit map missing)  
`core history → finite-core support` (support type, dimension, and thickening map unresolved)  
`global Klein Fabric → local native 4D geometry` (map or explicit identification unresolved)  
`support + timesheet → geometric section` (requires a common ambient map)  
`worldtube/timesheet state → physical response` (interaction law missing)  
`physical response → instrument data` (readout map missing).

The geometric intersection is not the interaction law, and the interaction law is not the instrument readout. If the worldtube is placed in a global fabric (K) while the timesheet is defined in a separate local ambient space (M^4), the section cannot be formed until a map (K\to M^4) or an explicit identification (K=M^4) is supplied.

The existing distinction between `∂W`, `∂_{Σ_t}(W∩Σ_t)`, and a contact interface remains in force. Equality of the first two boundary constructions is not assumed. Its proof requires a source-defined support type, boundary convention, regularity, and transversality hypotheses.

## Independent test matrix

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification threshold |
|---|---|---|---|---|---|
| Path-neighbourhood response | Same core geometry, timesheet state, instrument response, and nuisance budget | Calibrate path/readout parameters on training blocks; freeze them for independent acquisition blocks | Response profile relative to the hollow outer path; exact profile awaits a constitutive law | Minimally sufficient established-physics model for the selected system, with identical shared parameters | Covariance-derived threshold fixed before holdout; reject this locus if no residual path dependence remains |
| Timesheet-bulk response | Same geometry, instrument, and nuisance treatment | Calibrate bulk response once; test independent timesheet conditions | Bulk response/transfer profile; exact observable awaits the response law | Same standard baseline and instrument model | Reject if the held-out response is not bulk-distributed or is fully reproduced by path/boundary alternatives |
| Boundary/contact response | Same core and timesheet geometry, plus declared boundary/contact parameters | Calibrate boundary law once; test independent boundary/contact conditions | Boundary/interface-localized response; exact observable awaits the contact law | Same standard baseline without an independently adjustable contact surface | Reject if no boundary-linked response survives covariance or the interface adds no separable held-out prediction |

No numeric threshold is assigned here. It must come from the actual dataset's units, provenance, calibration, full uncertainty covariance, and independent holdout. No P2 system has been selected and no physical calculation or fit was performed.

## Existing formal basis and limits

The following already-existing Lean results provide the abstract conditions; no new theorem is added:

- Kestrel PR #873: `KestrelIntersectionDimensionGate` supplies conditional transverse-intersection dimension results, and `KestrelProjectedIncidence.hallway_factorization_iff_fiber_compatibility` supplies the factorization gate: a downstream observable factors through a projection exactly when it is constant on that projection's fibers.
- PR #873's last successful verification was Actions run #43202552666, job #131129411360, on merge reference `7ca33453a6fc74f8e165821abac942414ef9546b`. The relevant module blobs match the PR branch and that merge reference. This is not a standalone exact-head build or current-main integration; the PR base subsequently advanced. Tests, lint, nanoda, and the separate global axiom audit were skipped. PR #873 remains open/draft/unmerged.
- Nadir PR #1189: `NadirWitnessCarryingComposition.twoStage_witness_carrying_composition` compiled in exact-head Actions run #43084102284, job #130743880601. That PR is also open/draft/unmerged and its base is another research branch, not current main.

These proofs check only their formalized abstract statements. They do not establish that the physical maps exist, that a candidate response locus is real, or that any detector measures it. The boundary-of-section equality and all source-to-response/readout maps remain unproved or undefined.

## Relationship to existing work

This is an additive refinement, not a replacement or duplicate of:
- Kestrel issue #1313, which separates support boundary, slice boundary, and contact interface;
- Aster issue #1630, which separates response activity and absorbability/irreducibility;
- Sable issue #1364, which separates geometry-derived response, coarse-graining memory, and independently measured medium response;
- the one-core/hollow-superhelix source-fidelity work and Kestrel's readout-sufficiency work.

The new contribution is the **response-locus axis** and its cross-check against the independent geometric thin-core and response-null limits. It turns the next geometry-to-observable question into a bounded selection problem without adding a new physical primitive.

## Disposition

- Source-backed working structure: one core, hollow outer superhelix, active timesheet bulk.
- Active candidate: a Kelvin-vortex or justified-equivalent response mechanism.
- Unresolved: response locus, support type/thickness, global-to-local map, constitutive response, instrument readout, and whether any separate medium is irreducible.
- Optional: material contact shell, separate medium ontology, and any additional surface/twist law not forced by a source-defined map and observable.
- No second core is introduced.
- No SAT-O or Blockwave equation is transcribed, corrected, or promoted.
- P2 remains HOLD; no physical system, dataset, fit, prediction, or independent measurement is claimed.

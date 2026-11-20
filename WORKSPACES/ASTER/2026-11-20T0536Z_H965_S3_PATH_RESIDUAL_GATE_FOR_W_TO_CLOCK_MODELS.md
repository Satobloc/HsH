# H965:S3 | Path-residual gate for source-typed w-to-clock models

**Run key:** `REVROT3-19-20261011:965:s3`  
**Selected ring label:** Aster, index 2  
**Next ring label:** Ariadne, index 3  
**Lane:** 36 architecture, workflow, and prediction overlay. This does not reactivate Aster's frozen Paper A review or reassign any standing lane.

**Disposition:** A new post-composition testability gate is specified: a proposed `PathResidualWitness` distinguishes coordinate-only reparameterization, lossy projection/foliation, and physical path transport by requiring any claimed path-dependent clock effect to be predicted as a residual beyond the standard comparator on an untouched holdout. This extends, rather than replaces, the existing coordinate-role, composition, and identifiability contracts. No new physical law, calculation, fit, prediction, measurement, or theory promotion is claimed.

## 1. Source and authority

### Aster role boundary

Aster is a deterministic revival-ring label, not an authenticated historical instance or thread. The historical Aster export is conversation `6ab006ce-e358-83ea-b3dd-7b23a26c00fa`, recorded raw Git blob `1bf6e65c4ac1650297acb67d7e39f700454a03c8`.

The existing source-backed role record identifies three direct user-role messages:
- `d15369d1-1412-4f4a-9460-702d2de573ea` (2026-09-22): source-fidelity questions about whether a text reads like Nathan, whether he said it elsewhere, and whether it conflicts with prior statements.
- `01505af7-37cd-491f-a951-1822934e36ff` (2026-09-22): a historical Paper A review assignment.
- `e3067f7b-f1c2-45fb-ab98-075d4a798ae5` (2026-10-11): a clarification scoped to one prior-art-review question. It is not a blanket access grant.

No standalone signed specialist charter was recovered. The raw export path returned zero bytes in this runtime, so this run relied on the already parsed, source-backed Aster workspace record rather than claiming a fresh raw-export parse. The current Code Grurple roster supersedes the historical Paper A assignment: **REVIEW FROZEN / CROSS-READ OPEN**. No manuscript review was reopened.

### Coordinate-source strata

The relevant source statements are not one reconciled equation:

| Source | Exact locator | Source status | What it supports |
|---|---|---|---|
| 2026-10-09 | Conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`; message `3c657387-b80b-4982-a61a-8e6d8568b8d1`; raw blob `7af1561b321f4d9364da5eb111df689efc652827`; [source custody record](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ASTER/2026-11-13T1400Z_SOURCE_CUSTODY_AMENDMENT_TO_1631.md) | Direct user-role source | `w=ct` is described as a time-length scale in metres in a classical Minkowski-limit discussion. No complete coordinate transformation or observer-readout map is supplied. |
| 2026-10-21 | Message `c5525f53-b7cc-4444-8102-3bf6fdb1c892`; 2026-10-21T13:55:40.205Z; [source witness](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/LOOM/2026-11-16_H885_S3_P2_SOURCE_GEOMETRY_VERSION_WITNESS.md) | Direct user-role source, recovered from the Library raw export | A native `cw=t` / `(++++)` / Forest Normalization convention is stated in a natural-unit context. The source does not define the type of `w`, the units of the symbols in that convention, or a map to the October 9 variables. |
| 2026-11-08 | Conversation `6aecede1-4c08-83e9-abc4-da64f59a4f51`; message `c0520975-02a0-408f-a250-364b88ab7b30`; raw SHA-256 `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d`; Git blob `c1793cebf08ed57881eb144ee23fe6d1d6d69f1a`; [source recovery record](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ASTER/2026-11-06_TOPLESS_PRIOR_CONTEXT_RECOVERY_DELTA.md) | Direct user-role, current-ancestry, provisional source | `w` is tentatively described as a fourth spatial dimension distinct from proper time, with time moving along `w` and a “same c, different paths” possibility. No defined `w`-to-clock map or final supersession is supplied. |
| 2026-10-29 TOPLESS | Existing prior-context references only | Raw original not recovered | Not treated as a fresh source witness or global supersession. |

The source classes, scopes, and chronology are preserved separately. The October 21 normalization statement is not silently inverted into the October 9 relation. The November 8 proposal is later but explicitly tentative. A direct user-role message is not, by itself, proof of a unique embedded-document author.

## 2. New architecture: classify each map stage before composing it

Existing contracts already cover:
- source-typed coordinate roles and scope: [issue #1737](https://github.com/Satobloc/HsH/issues/1737);
- ordered coordinate-to-instrument composition: [issue #1738](https://github.com/Satobloc/HsH/issues/1738);
- geometry-to-observation map closure: [issue #1341](https://github.com/Satobloc/HsH/issues/1341);
- joint-readout identifiability and fiber compatibility: [issue #1301](https://github.com/Satobloc/HsH/issues/1301).

The new addition is a **map-semantics discriminator at the end of that chain**. It is not another generic coordinate-role field. A model may compose several kinds of map, but each stage must say what it does.

### A. Coordinate reparameterization

A coordinate reparameterization changes the description of the same physical configuration. It therefore needs:
- a specified domain and codomain;
- an inverse or explicit restricted-domain inverse;
- the metric/tensor transformation rule;
- a representation-compatible observation operator.

If the observation operator is transported consistently, the invariant physical readout is unchanged. A pure coordinate reparameterization cannot be counted as a new physical path effect.

### B. Projection or foliation

A projection or slice map may be many-to-one. It therefore needs:
- explicit source and target spaces;
- the admissible domain and projection fibers;
- a statement of which observables are constant on each fiber;
- additional readout channels if the discarded distinctions are meant to be recovered.

A projection that erases the distinction needed by the proposed observable cannot support an identifiable prediction without another channel.

### C. Physical transport or evolution

A physical path-transport claim is not merely a coordinate change. It needs:
- a source-defined evolution or transport law;
- path parameter and orientation;
- initial and boundary conditions;
- causal/clock semantics;
- a clock, phase, or other observable readout;
- frozen parameters shared across calibration and holdout conditions.

The November 8 “same c, different paths” proposal could eventually instantiate this class, but the source does not yet provide the law or readout. It remains `MAP_SEMANTICS_UNRESOLVED`, not an established dynamical model.

These classes are composable, not mutually exclusive. A model may use a coordinate change, then a foliation, then physical transport. The composition order and each stage's semantics must be explicit.

## 3. New testability gate: PathResidualWitness

A raw path-dependent time difference is not, by itself, an H(s)H prediction. Standard GR already predicts travel-time differences from source direction, detector baseline, spacetime geometry, and detector response.

The new `PathResidualWitness` is an extension of the existing `ComparisonFreeze`. It binds:

1. **Model identity:** exact source branch, map-stage types, map definitions, parameter manifest, and predicted observable.
2. **Standard comparator:** exact GR/standard propagation model, detector geometry, waveform/response implementation, and shared nuisance parameters.
3. **Observation identity:** event, data release and digest, detector set, acquisition, timing estimator, clock synchronization, and calibration provenance.
4. **Uncertainty:** timing and calibration covariance, estimator uncertainty, and the coverage meaning of every quoted interval.
5. **Prediction:** the H(s)H-specific residual predicted before holdout access.
6. **Partition:** calibration/fit events and untouched holdout events, with exclusions and access history.
7. **Decision:** preregistered falsification threshold and independent review scope.

The bookkeeping observable is:

`path residual = observed inter-site arrival-time difference - standard-comparator geometric propagation delay`.

This is a proposed test definition, not a new physical law or a source-derived H(s)H equation.

Admission rules:

- A coordinate-only map must preserve the standard invariant readout after consistent transformation. It predicts no additional physical residual.
- A projection must pass the relevant fiber-compatibility or joint-readout identifiability test.
- A physical-transport map must predict its residual from frozen parameters on untouched data.
- A map fitted separately to every event is hidden flexibility, not a cross-event prediction.
- If the map, calibration covariance, or holdout is absent, the result is `MAP_INCOMPLETE`, `CALIBRATION_ONLY`, or `NO_PREDICTION`, not PASS.

## 4. Real-data anchor and test matrix

GW150914 is used only as an existing measured-system anchor, not as a newly selected P2 system. The official GWOSC event record reports the signal arriving first at L1 and 6.9 ms later at H1, with displayed asymmetric bounds of +0.5/-0.4 ms. The figure caption does not assign those bounds a confidence or coverage level. The prior Aster source-genealogy report records that this delay is derived from the same H1/L1 strain record, not an independent observation. It also records the existing source-level baseline projection. No raw H1/L1 HDF5 or O1 calibration covariance was acquired in this run.

Sources:
- [GWOSC GW150914](https://gwosc.org/events/GW150914/), DOI [10.7935/K5MW2F23](https://doi.org/10.7935/K5MW2F23).
- [Aster h950 source-genealogy and dependence audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ASTER/2026-11-19T1424Z_H950_S2_GW150914_SOURCE_GENEALOGY_AND_DEPENDENCE_AUDIT.md).
- [Existing h954 timing-angle publication](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/h954-s3-gw150914-timing-angle-band-20261119t1836z-001.md).

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification threshold |
|---|---|---|---|---|---|
| H0: standard GR propagation | Source sky position and emission time, detector coordinates, clock synchronization, timing calibration, waveform, detector response and noise model | Calibrate/estimate on a declared event set; hold out independent events and detector configurations | Inter-site arrival-time difference from standard propagation and baseline geometry | GR waveform and detector geometry | Frozen predictive interval from joint timing/calibration covariance |
| H1a: coordinate-only w/t reparameterization | Same physical source, detector, metric and response parameters as H0 | Same data partitions as H0 | Same invariant arrival-time prediction after consistent transformation | H0 | Any apparent residual must first survive representation-coherence and calibration checks |
| H1b: projection/foliation | H0 shared parameters plus explicitly declared projection parameters | Calibrate projection on training events; test fiber-identifiability on holdout | Only readouts identifiable through the declared projection | H0 with the same observation operator | Failure of fiber compatibility or inability to distinguish required path classes |
| H1c: physical path transport along spatial w | H0 shared parameters plus a source-defined transport law and its declared parameters | Freeze the transport law on calibration events; hold out independent events and detector geometry | Additional inter-site timing/phase residual beyond H0 | H0 with identical shared calibration and nuisance parameters | Preregistered interval from actual joint covariance; reject if held-out observations systematically violate the frozen prediction |

GW190425 and GW241011 are possible transfer checks, not clean independent replication by default. The existing h962 comparison records their different source classes and observing runs but also their shared Virgo detector. They should not be silently treated as independent detector-network validation.

**Current empirical status:** `CANDIDATE_ONLY / NO_HSH_PATH_MAP / NO_HSH_RESIDUAL_PREDICTION / NO_UNTOUCHED_HOLDOUT / NO_NUMERIC_FALSIFICATION_THRESHOLD`. P2 remains HOLD. No new fit, raw-data calculation, or independent measurement was performed.

## 5. Forced versus optional geometry

**Forced by the source and test logic:**
- preserve the October 9, October 21, and November 8 coordinate/normalization strata;
- keep spatial `w`, time-length coordinate, normalized variable, and proper-time readout distinct until a typed map exists;
- specify every projection and composition map;
- distinguish a coordinate artifact from a physical transport law;
- compare any claimed new path effect against the standard GR path prediction;
- freeze shared parameters and use untouched holdout data.

**Not forced by these sources:**
- finite worldtube thickness;
- twist or holonomy as an additional physical variable;
- contact surfaces;
- a new responsive-medium law;
- an extra physical dimension beyond the source's own provisional description.

Those features require separate source commitments or derived geometry. Naming a coordinate does not force a finite core, twist, or material contact surface.

## 6. Lean and existing formal work

No new Lean module was created because the physical map semantics and path-to-clock law are not source-defined. Formalizing an invented map would prove an assistant reconstruction rather than the historical proposal.

Existing relevant verification was checked:

- [Aster PR #1444](https://github.com/Satobloc/HsH/pull/1444), exact head `223d54664380222e66e7399a15ab7344739640ad`, [Actions run #42435344972](https://github.com/Satobloc/HsH/actions/runs/42435344972): SUCCESS. `AsterClockMapGate` proves conditional scalar identities, including that if the same real-valued `c,t,w` satisfy both literal equations and `t != 0`, then `c^2 = 1`. It does not establish that the historical sources intended identical variables or units, nor does it supply a physical map.
- [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873), exact head `94b6d96c91806a95505260a3c52220f4af294185`, [Actions run #44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878): SUCCESS. Its projection/fiber results are generic mathematical constraints, not a physical w-to-clock translation.
- [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133), current head `15187ebf44b022f85c6ce1412e8f0cbf43e8d303`, [Actions run #44653388084](https://github.com/Satobloc/HsH/actions/runs/44653388084): FAILURE. Its current head is not Lean-verified.
- [Loom PR #2151](https://github.com/Satobloc/HsH/pull/2151), exact head `8d61b6efab5c79b4e96550f5781638757311b1ae`, [Actions run #44680856975](https://github.com/Satobloc/HsH/actions/runs/44680856975): SUCCESS. This is an adjacent GW241011 symmetric-restriction result, not a w-to-clock map proof.

Lean checks only the formalized propositions. These runs do not validate the source translation, physical premises, detector calibration, or H(s)H predictions.

## 7. Existing infrastructure and project controls

- HsH `main` at pre-write read: `9b8741308abd58daa76872122de676c55c02dc89`.
- The three repository front doors were read. HSH_RESOURCES root README only; no payload was accessed.
- Mersearch has no callable action in this runtime. All four canonical request lanes remain `requested`; no lane was overwritten, retriggered, retried, or released. No local pinned checkout was present. Library raw-export retrieval and bounded GitHub source search are fallbacks, not Mersearch results.
- Existing HsH Math Hopper references, Whirligig Kernel 0, and relevant Lean PRs were checked before considering new tooling. No separate Math Hopper or Whirligig connector surfaced. SciSpace is available but unnecessary for this source/architecture audit. No new dependency, tool, fork, subscription, or cost.
- Task Branch Graph remains 18 records against 16 declared branches. No graph or owner mutation.
- P0 Code Grurple remains ACTIVE; Aster Paper A formal review remains FROZEN / CROSS-READ OPEN.
- P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- FIE last full review is November 10; next review is November 24, so no early re-review was performed.
- The immediately preceding Ariadne h965:s4 run completed the unrelated SAT-archive reading break at lines 2081-2120; next cursor 2121. This run did not duplicate it.
- No SAT-O or Blockwave equation was retrieved, copied, corrected, or modified. No BEDROCK promotion, paper-gate advancement, or P2 selection.

## 8. Run and succession boundary

The incoming Loom h965:s2 optional packet was read. The current Aster execution has no authenticated current-thread reference; its cached result belongs to the previous worker. The next deterministic label, Ariadne h965:s4, had already completed before this run's final reconciliation. No successor packet was created, and no direct-thread delivery, consumption, acknowledgment, assignment, or ownership transfer is claimed.

The existing :36 automation remained enabled and unchanged. No task, ID, prompt, schedule, phase, cadence, or enabled-state mutation; no sixth task, signet, or conversation rename.

**Return pin:** `H965:S3 / ASTER-ASSISTANT-RECONSTRUCTION / PATH-RESIDUAL-WITNESS-PROPOSED / W-TO-CLOCK-MAP-SEMANTICS-UNRESOLVED / GW150914-ANCHOR-NOT-HOLDOUT / PR1444-AND-PR873-EXACT-HEAD-PASS / PR1133-EXACT-HEAD-FAIL / ISSUE-PUBLICATION-PENDING-READBACK / P2-HOLD / ARIADNE-S4-ALREADY-COMPLETED / TASK-UNCHANGED / NO-SIXTH-TASK`

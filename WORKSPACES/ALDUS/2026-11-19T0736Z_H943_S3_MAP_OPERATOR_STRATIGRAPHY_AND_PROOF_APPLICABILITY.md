# H943:S3 | Map-operator stratigraphy and proof applicability crosswalk

**Run:** `REVROT3-19-20261011:h943:s6`  
**Scheduled slot:** `:36`  
**Deterministic ring label:** Aldus (index 6); next ring label Calder (index 7)  
**Participation:** source-grounded assistant reconstruction. No authenticated current Aldus thread or historical-instance participation is claimed.  
**Purpose:** additive architecture/workflow clarification for the existing P2 comparison matrix. This is not a new physical hypothesis, P2 gate, or theory promotion.

## Executive result

A cross-read of the FIE source, later direct-source clarifications, the H835/H836 geometry reports, and two existing Lean PRs exposed a consequential namespace/application risk: several distinct questions had been grouped under “projection/coarse-graining,” even though they have different mathematical premises and different physical evidence requirements.

The source’s `P` denotes timesheet intersection/section. In the Nadir Lean modules, `P` denotes an abstract projection map. Those are not interchangeable. This report preserves the source notation and uses `I_Σ` as a local alias for intersection, reserving `Π` for the separate abstract projection/readout map.

Four obligations are now kept distinct:

1. **Intersection/coarse-graining order:** whether `I_Σ ∘ C4` agrees with `C3 ∘ I_Σ`.
2. **Factorization through projection:** whether coarse-graining descends through a separate projection `Π`, which is equivalent to fiber-compatibility.
3. **Incidence recovery:** whether projected overlap establishes genuine intersection, which requires injectivity on the relevant domain or a witness-carrying lift.
4. **Predictive discrimination:** whether an H(s)H readout can be separated from a standard-only predictor after calibration, nuisance parameters, and uncertainty are fixed.

Existing Lean results cover important abstract conditions for items 2–4 and conditional readout consequences for item 1. They do not define the physical maps or prove that the H(s)H source claims instantiate those conditions. No new Lean module was justified while the source-authorized map signatures remain incomplete.

## 1. Source strata and authority

| Source | Classification | What it supports | What it does not establish |
|---|---|---|---|
| *The Fundamental Intuitions — Extended* (six-page archival PDF; extracted text fully read) | Historical conceptual source | A 4D filament/worldline, a time-wavefront/timesheet, and particle identity associated with their intersection; interaction/back-reaction is part of the conceptual picture | A measured system, calibrated detector map, finite-core construction map, or empirical prediction |
| SAT4D O1 and the Aldus support-strata cross-read | Historical source plus later direct-source terminology shift | Distinguishes a 1D curve from a 4D volume swept out by it; later use of “filament” shifts toward a 4D totality | A source-defined bundle/thickening map from the 1D curve to the 4D support, or a map from that support to a measured observable |
| 2026-10-07/09 direct-source material preserved in the H836 source audit | Nathan Direct, source-audit crosswalk | Rejects treating the timesheet as a passive display/readout slice; preserves intersection/interaction distinctions | A complete constitutive interaction law or a detector projection |
| 2026-10-29 4D/3D slice clarification | Nathan Direct clarification record | Keeps the 4D worldtube/support distinct from the 3D timesheet/section and preserves dimensional bookkeeping | A complete transverse-intersection construction or an empirical readout |
| 2026-11-08 source-fidelity records | Nathan Direct as recorded in the source-audit chain | Worldtube plus timesheet is the current minimal working representation; the medium remains provisional; a present slice is not guaranteed to reconstruct a complete history | A unique medium, universal reconstruction theorem, or complete forward map |
| BEDROCK entry `ND-2026-10-18-07` | BEDROCK attribution; raw message not recovered in this run | Records the open operator-order question `P(C(G))` versus `C3(P(G))` and the distinction between 4D and 3D coarse-graining | Fresh raw-message authentication of that notation or a proof that the two routes agree |
| PR #873 and PR #1189 | Assistant formalizations on separate draft branches | Conditional theorems about incidence, fiber compatibility, composition, nuisance identifiability, and robust readout separation | Soundness of source translation, existence of physical maps, or observational truth |
| H0/H1 P2 comparison matrix | Existing candidate test design | A standard Kelvin-vortex comparator family and a finite-core H(s)H target are already recorded | Acquired raw data, a frozen shared-parameter fit, or a validated H(s)H forward/readout map |

The FIE extracted text is the full six-page text companion to the archived PDF, read in full. [PDF source](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/9320ed810f458770e3172e4a444f0a83baa11400/THE%20FUNDAMENTAL%20INTUITIONS%20%E2%80%94%20EXTENDED.pdf); [text extraction](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/9320ed810f458770e3172e4a444f0a83baa11400/_AUTO_EXTRACTED_TEXT/THE%20FUNDAMENTAL%20INTUITIONS%20%E2%80%94%20EXTENDED.txt), blob `9b94093053f28be8bf64ee227d3382d2296f63ea`. Source PDF SHA-256 recorded in the archive extraction: `d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9`. The extraction is an archival reading aid, not a replacement for the PDF.

The raw source for `ND-2026-10-18-07` was not recovered. Its operator-order wording remains a BEDROCK attribution. The H836 correction is retained as a source-fidelity guard, not promoted into a newly authenticated raw quotation.

Source crosswalks read: [Aldus H784 support-strata cross-read](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-4d-filament-support-strata-crossread-20261102t0124z-s2-001.md); [Kestrel H835 typed map-composition report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-14T1900Z_H835_S0_TYPED_GEOMETRY_MAP_COMPOSITION_AND_SOURCE_FIDELITY_UPDATE.md); [Sable H836 intersection-not-projection correction](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-h836-s0-timesheet-intersection-not-projection-20261114t2000z-001.md); [2026-10-29 4D/3D slice clarification](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/2026-10-29_NATHAN_DIRECT_4D_3D_SLICE_CLARIFICATION.md).

## 2. Typed operator vocabulary

The following names are local disambiguation labels for the existing source distinctions. They are not new SAT-O or Blockwave equations.

| Local name | Intended role | Current status |
|---|---|---|
| `γ¹` | Earlier 1D centerline/worldline/filament description | Historical source object; not silently identified with the later 4D totality |
| `W⁴` | Current finite-core worldtube/support representation | Working H(s)H representation; exact support, boundary, and thickness parameterization remain incomplete |
| `Σ³` | Timesheet/time-surface | Source-supported interacting 3D bulk; not a passive detector screen |
| `T : γ¹ → W⁴` | Thickening/sweep/bundle construction | Candidate assistant reconstruction only; no source-defined normal fibers, regularity, cross-section transport, or composition law recovered |
| `I_Σ(W) = supp(W) ∩ Σ` | Intersection/section operation; local alias for the source’s `P` | Conceptually source-supported; exact admissible domain, support type, boundary behavior, and transversality conditions are not closed |
| `J(W,Σ)` | Physical interaction/coupling between worldtube and timesheet | Interaction premise is source-supported; constitutive law and contact geometry are not defined |
| `Π : S → O` | Separate projection/coordinate/readout map | Not source-defined or instantiated; do not call this the source’s `P` |
| `R : O → D` | Instrument response, calibration, and data-generation map | Not defined or calibrated |
| `C4 : W⁴ → W⁴_c` | 4D/worldtube coarse-graining | BEDROCK-attributed notation; exact map not recovered |
| `C3 : S → S_c` | Coarse-graining of intersectional/3D traces | BEDROCK-attributed notation; exact map not recovered |
| `D` | Measured data space | No H(s)H dataset/readout was acquired in this run |

`I_Σ` and `J` must remain separate: a geometric intersection/section does not itself specify the physical interaction law. Likewise `Π` and `R` are separate from both. A detector readout cannot be silently substituted for the source’s intersection operation.

The later direct-source description of one helical core with a hollow outer coil is not a second core. Coil radius and intrinsic core thickness are distinct quantities. No independent twist field, contact-surface geometry, or constitutive boundary law is promoted here. The Hagalaz/framed-sphere construction in the existing Nadir research branch remains optional shorthand, not a physical ontology or an adopted map.

## 3. Proof-to-claim applicability crosswalk

### A. Intersection/coarse-graining route agreement

The source-register question is:

`I_Σ ∘ C4  ?=  C3 ∘ I_Σ`

This is an operator-order/commutation question. It is not the same as factorization through a projection. The Kestrel `scale_route_agreement` results establish conditional consequences: equality of two abstract routes implies equality after a readout; if the readout is injective on the relevant image, observed equality can reflect route equality. They do **not** prove the two physical routes agree.

**Physical blocker:** `C4`, `C3`, the admissible support, and `I_Σ` are not yet source-defined as complete maps. No commutation claim is accepted.

### B. Coarse-graining factorization through a separate projection

The Nadir module uses an abstract projection `P : Wf → Of`, a fine-to-coarse map `C4`, and a coarse readout `Pcoarse`. Its central theorem says an induced map on the image of `P` exists exactly when `Pcoarse ∘ C4` is constant on every fiber of `P`; the induced map is unique on that image.

For this crosswalk, write that abstract projection as `Π`:

`Π(x) = Π(y)  ⇒  Pcoarse(C4(x)) = Pcoarse(C4(y))`.

This is a fiber-compatibility condition. It is **not** the source’s `P_Σ` intersection operation, and it does not prove the source’s `I_Σ`/coarse-graining routes commute.

### C. Projected overlap versus genuine incidence

The Kestrel module proves that genuine intersection projects to overlap. The converse requires injectivity of the projection on the relevant domain, or a separately carried witness/lift. A noninjective readout can create spurious projected overlap; a downstream readout cannot restore a distinction already collapsed upstream.

Therefore a projected overlap cannot by itself establish physical contact or intersection.

### D. Composition of nested maps

The Nadir witness-carrying composition theorem establishes conditional composition when each stage has the required fiber-compatibility and the induced output carries a witness that it lies in the next image. This is the relevant abstract result for a hierarchy of nested representations. It does not construct the H(s)H maps or establish their compatibility.

### E. H(s)H versus standard predictive discrimination

The Nadir robust-readout result supplies a sufficient conditional discriminator: if the proposed H(s)H readouts for two states are separated by more than `K ε + 2 δ`, then a `K`-Lipschitz standard-only predictor cannot fit both within tolerance `δ`, assuming the baseline separation is bounded by `ε`.

The theorem does not supply physical values for `K`, `ε`, or `δ`. Those must come from a specified measured system, calibrated readout, uncertainty model, and predeclared evaluation rule.

### F. Local parameter identifiability

The Kestrel nuisance-range result gives the relevant local criterion: a geometry-sensitive direction is locally distinguishable only when the geometry sensitivity has a component outside the nuisance-parameter sensitivity range. If geometry sensitivity lies wholly inside that nuisance range, the local geometry effect is absorbable by nuisance changes.

No physical Jacobians, calibration point, nuisance basis, or covariance were supplied here.

## 4. Existing Lean evidence

No new Lean file or PR was created. The existing proofs were checked before considering new formalization.

| Existing work | Exact head and run | Build | Relevant theorem-specific axiom observations |
|---|---|---|---|
| [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873) | `94b6d96c91806a95505260a3c52220f4af294185`; [run #44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878) | Exact-head checkout; full Lake build, 8,956 jobs successful | Genuine-intersection projection, injective lift, downstream non-restoration, and scale-route/readout equivalence theorems reported no axiom dependencies. Fiber-factorization/uniqueness and some set-equivalence results use `Classical.choice`, `Quot.sound`, or `propext`. |
| [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189) | `da1e7d5dff0cdbc1d81303e3c573b79832087a38`; [run #44106198466](https://github.com/Satobloc/HsH/actions/runs/44106198466) | Exact-head checkout; full Lake build, 8,961 jobs successful | `imageProjection_surjective` reported no axiom dependencies; factorization and witness composition use `Classical.choice`; uniqueness uses `Quot.sound`; robust readout separation uses `propext` and standard Lean classical/quotient dependencies. |

No `sorryAx` line was found in either inspected job log. The global axiom-audit stage, separate tests, and lint were not run as part of these build records. Both PRs remain OPEN / DRAFT / UNMERGED on branches separate from `main`; no independent review or merge is claimed. The inspected theorem-specific outputs for the Nadir robust-readout results and Kestrel nuisance-range results include `[propext, Classical.choice, Quot.sound]`; these are Lean dependencies, not physical assumptions.

Lean verifies the encoded abstract statements only. It does not validate the translation from the source, establish physical map existence, calibrate an instrument, or prove an empirical prediction.

## 5. Existing P2 test matrix: additive map-closure refinement

| Hypothesis | Shared parameters that must be fixed | Calibration / holdout | Predicted observable | Standard comparator | Falsification / failure condition |
|---|---|---|---|---|---|
| `I_Σ ∘ C4` and `C3 ∘ I_Σ` agree | Same admissible support, slice, thickness/scale, boundary conditions, and coarse-graining conventions | Not acquired; uncertainty bounds absent | Not formed until `Π` and `R` are defined | Existing H0 standard Kelvin-vortex family | An admissible source-defined case where the two routes differ beyond a predeclared uncertainty bound |
| Coarse-graining descends through `Π` | Same fine/coarse representation and readout definitions | Not acquired | Induced coarse readout on `range(Π)` | Same H0 readout | A fiber pair with equal `Π` output but unequal coarse outputs |
| Projected overlap establishes incidence | Same domain and injectivity/witness conditions | Not acquired | Contact/incidence observable | Standard geometric incidence/readout | A projected overlap with disjoint preimages, or failure of the required injectivity/witness condition |
| H(s)H is distinguishable from H0 | Shared geometry, nuisance, calibration, and instrument parameters | No calibration set or independent holdout; Figshare DOI `10.6084/m9.figshare.30903347` is a locator only, not a retrieved/versioned dataset | No H(s)H forward/readout value yet | Existing H0 comparator family | A standard-only predictor fits all frozen holdout observations within the predeclared tolerance; robust separation cannot be established |
| Geometry is locally identifiable | Frozen parameterization and nuisance basis | No Jacobians or covariance | Geometry-sensitive observable direction | H0 plus shared nuisance model | Geometry sensitivity is contained in the nuisance range at the calibrated point |

This is an additive clarification to the existing [P2 two-campaign matrix, issue #1855](https://github.com/Satobloc/HsH/issues/1855). The controlling E-D-F-R admission gate remains unchanged: E requires identifiable measured data; D requires a source-authorized H(s)H forward/readout map; F requires a coherent comparison freeze; R requires independent replication. This crosswalk refines the map obligations inside D and the route/readout coherence needed for F. It creates no new P2 gate and does not change P2 status.

## 6. What is required, provisional, or still optional

- **Conceptual core:** a 4D filament/worldline history, a 3D time-surface/timesheet, and an intersection/interaction relationship are part of the historical conceptual architecture.
- **Current H(s)H representation:** a finite-core worldtube plus interacting timesheet is the working minimum. The exact thickening/sweep map and calibrated thickness are not yet defined.
- **Helical structure:** one helical core with a hollow outer coil is the source-supported description; the coil radius is not the intrinsic thickness, and no second core is introduced.
- **Twist:** no independent twist field or constitutive twist law is established by this crosswalk.
- **Contact surfaces:** interaction is a source premise; a particular contact-surface geometry and boundary law remain uninstantiated.
- **Projection/readout:** `Π` and `R` are separate, currently undefined maps.
- **Hagalaz/framed-sphere shorthand:** optional representation only, not a physical equivalence or adopted ontology.

No added thickness law, twist field, contact-surface model, or worldtube/timesheet equivalence is promoted.

## 7. Next closure sequence

1. Recover the raw source for the BEDROCK-attributed `ND-2026-10-18-07` operator-order note before treating its notation as a direct quotation.
2. Obtain source-authorized domains, codomains, support definitions, and conditions for `T`, `I_Σ`, the interaction law, `Π`, `R`, `C4`, and `C3`. Do not invent missing maps to make the Lean interface compile.
3. Select an identifiable measured system and acquire the actual versioned dataset, provenance, units, acquisition-unit map, calibration, covariance, and uncertainty bounds.
4. Freeze H0/H1 shared parameters, the independent acquisition-unit holdout, observable metric, and falsification tolerance before evaluation.
5. Only then instantiate the existing Lean map/fiber/identifiability theorems against source-authorized definitions and run exact-head verification.
6. Keep independent empirical validation separate from compilation and source-critical attribution.

## 8. Run boundaries and project status

- Mersearch was not callable in this runtime; all four existing request lanes remain occupied/requested, and Tern retains release authority. No request was overwritten or retriggered. Bounded GitHub code search was used only in HsH and the public SAT archive; HSH_RESOURCES root README/index only, with no private payload opened.
- Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, and relevant Lean PRs were checked. SciSpace is available but no new literature/tooling was needed. No new tool, dependency, fork, subscription, or expense.
- P0 Code Grurple remains ACTIVE. P1 Orson cognition remains OVERDUE / NOT READY / Orson-owned. P2 remains HOLD. P3 remains INCOMPLETE.
- The November 9 minor-paper gate remains missed; November 30 major and December 14 full-theory gates remain separate.
- FIE’s full six-page text extraction was read for this source crosswalk. Its formal periodic re-review remains scheduled for November 24; it was not yet 14 days since the recorded November 10 review.
- No physical calculation, fit, prediction, numeric falsification threshold, or independent measurement was performed. No SAT-O or Blockwave equation was changed. No BEDROCK theory promotion.
- The task graph remains `ACTIVE_SEED`, 16 declared branches / 18 records, unresolved. WH-01’s next cursor remains 2026-11-15 18:50Z; this run only refreshed the interval run-list and did not inspect all job endpoints, so no WH-01 ledger/cursor advance is claimed. WH-02 PR #1710 remains Calder-owned, OPEN / DRAFT / UNMERGED; no rebase, code edit, CI dispatch, review, or merge. WH-05 remains Tern-controlled and blocked by the four occupied Mersearch lanes.

**No task, ID, prompt, schedule, phase, cadence, or enabled-state change. No sixth task. No signet or conversation rename.**

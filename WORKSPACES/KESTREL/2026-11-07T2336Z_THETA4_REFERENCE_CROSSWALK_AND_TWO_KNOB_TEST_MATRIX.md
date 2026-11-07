# Kestrel h671:s3 | θ₄ reference crosswalk and two-knob observability map

**Nominal run:** 2026-11-07T23:36:00Z  
**Run key:** `REVROT3-19-20261011:671:s3`  
**Selection:** Kestrel (ring index 14); next Meridian (index 15).  
**Participation:** current-assistant, source-grounded Kestrel reconstruction; not an authenticated historical Kestrel thread.  
**Status:** SOURCE-CROSSWALK / WORKFLOW-ARCHITECTURE / MAP-UNDEFINED / NO-PHYSICAL-CALCULATION / NO-THEORY-PROMOTION.

## First-blush synthesis

The consequential picture is not one angle equation. It is a two-knob moving-slice geometry, followed by a local orientation/shape readout whose reference direction changed across the recovered source chronology. The important thing to preserve is the separation of pitch and cross-sectional radius. The important thing not to invent is the map that turns those quantities into θ₄ and a measured cross-sectional shape.

The project can reason forward from that picture without pretending that the missing map has already been supplied.

## 1. Direct-source crosswalk

### A. 2024 moving-plane geometry

Raw source: `Satobloc/HsH`, conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`, blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`.

Two direct user messages on the same source path:

- `aaa2d0b1-017d-453e-b95a-b23915f87d32`, 2024-03-22T15:29:30.774Z: with the plane moving perpendicular to the straight axis, the straight-line intersection remains stationary while the helix intersection traces a circle; its speed depends on helix pitch and the plane's rate of travel.
- `aaa2a1cc-e884-4f6a-800f-8afc29ab221a`, 2024-03-22T15:35:10.461Z: the circular-path radius is independent of pitch and depends on the straight-axis-to-helix distance, identified there with the helix cross-sectional radius.

This is a direct geometric distinction:

- longitudinal phase/orbit rate: pitch plus slice rate;
- transverse orbit size: cross-sectional radius, not pitch.

It is a source-grounded kinematic comparator. It is not, by itself, a physical H(s)H worldtube-to-timesheet law.

### B. 2026-08-27 θ₄ statement

Raw source: `Satobloc/HsH`, conversation `6a8eacca-c470-83ea-af92-8fb8df194de9`, blob `92454acdaad701193e2a0c6cf64a7d7b70a03dbb`.

Direct user message `95319111-ba02-4b45-885a-6e44bd5fed7d`, 2026-08-27T00:20:22.945Z:

- assigns θ₄ = 90° to the vacuum direction described as perpendicular to the time sheet and parallel to the time normal/propagation direction;
- describes θ₄ as the inverse pitch of the helix;
- associates θ₄ with intersectional particle cross-section oblateness;
- corrects the earlier assistant assumption that w-orthogonality is fixed by construction: the source says it is exact only in perfect vacuum and is not generally true of H(s)H helical worldtubes.

The last point matters. An orthogonal Euclidean lift is not a universal physical premise for the H(s)H worldtube.

### C. Current BEDROCK convention

Current live `BEDROCK.md` blob: `527924246cc25caf7fac02dce4b20f024013cd19`, BR-005, lines 324–329.

BR-005 records the 2026-09-16 Nathan Direct clarification as:

- θ₄ is measured from the time normal;
- null/vacuum orientation is θ₄ = 0;
- the filament tangent is parallel to the time normal / timesheet propagation direction;
- for a particle at rest, θ₄ is equivalent to inverse helical pitch.

The indexed source is `!!_RUNNING_COTHEORIST_LOG.md`, 2026-09-16. The underlying raw 2026-09-16 source event was not recovered in this run. BR-005 remains the current working convention, but its raw-source locator remains an open provenance task.

### D. Apparent 90°/0° difference

The 2026-08-27 wording assigns 90° to the direction parallel to the time normal. BR-005 assigns 0° to that same direction by measuring from the time normal. A sheet-referenced versus normal-referenced convention change is a plausible reconciliation.

It is not yet a source-authenticated conversion. The raw 2026-09-16 event is missing, and the metric/signature and exact angle construction have not been supplied. A Euclidean complementary-angle identity does not automatically settle a Lorentzian or non-orthogonal H(s)H geometry. Keep the two source statements visible; do not silently rewrite either one.

### E. Assistant reconstructions kept separate

Ravel's `WORKSPACES/RAVEL/PLUS4_HELIX_TIMESHEET_INTERSECTION_KERNEL_2026-09-16.md`, blob `80d85b3c8d...` (Ravel sandbox), gives an all-plus Euclidean fixed-helix reconstruction containing:

`tan(θ₄) = 2πR/P` and `dℓ/dw = sec(θ₄)`.

Those are assistant-authored conditional model equations, not Nathan Direct SAT-O/Blockwave equations. The first also makes θ₄ depend on both R and P, whereas the direct source only says “inverse pitch” and does not provide a dimensionally complete map. Neither equation is adopted here.

The older `SAT-TO-STANDARD 2.txt` symbol dictionary and `H(s)H MANIFOLDS.txt` working document were not used as direct-source authority. No SAT-O or Blockwave equation was transcribed, corrected, or modified in this run. No corrected physical equation is proposed.

## 2. The actual architecture gap

The current source record supports three distinct quantities, but not yet a unique composition:

- (P): helix pitch;
- (R): cross-sectional radius;
- (	heta_4): a source-stated inverse-pitch / local-orientation quantity associated with intersectional oblateness.

The missing typed chain is:

`W⁴_core --E?--> helix/axis state (P,R) --I_Σ?--> timesheet intersection --O?--> (phase rate, orbit radius, cross-section shape)`

Each question mark is a real missing map, not a decorative arrow:

1. **Core-to-helix map E:** What support is being reduced to a centerline/axis, and what information does that projection discard?
2. **Intersection map IΣ:** What are the ambient space, support type, timesheet, metric/signature, orientation, transversality conditions, and intersection operation?
3. **Readout map O:** How do the intersection geometry and θ₄ produce an instrument-defined observable, with units and uncertainty?

The map must state domains, codomains, units, metric/frame, conditions, preserved quantities, fibers, and composition order. The generic Kestrel factorization result already formalizes one necessary condition: a downstream observable can factor through a coarse projection only when it is constant on that projection's fibers. This is not a claim that the physical H(s)H maps exist.

The 4D finite-core worldtube remains a project reconstruction target, but this θ₄ source cluster does not fix its support type or quantitative thickness. It does not force a twist field, contact surface, constitutive law, or a particular boundary/interior model. Those additions remain optional until an internal source defines them and a typed map carries them into an observable.

## 3. Existing proof and measurement gates reused

No new Lean theorem was needed or added. Existing modules were checked against their actual Actions logs:

- **Kestrel PR #873**, branch `research/kestrel-original-slice-fidelity-20261028t0900z`, head `1971e3d58a28f7c6de5cf024039dbcedb133121c`. Run #42153410233 checked out merge commit `a2c3304` (PR head merged into base `c7dc2c4)); full root build succeeded, 8,955 jobs. `KestrelProjectedIncidence` built at 8932/8955. `hallway_factorization_iff_fiber_compatibility` reports `Classical.choice`; `hallway_factorization_unique` reports `Quot.sound`; the scale-route agreement propositions report no axioms. Full log: zero `sorryAx`, zero bare `admit`. Separate global axiom audit, tests, lint and nanoda were skipped. This is a merge-reference build, not exact-head-only verification.
- **Hale PR #1387**, branch `research/hale-measurement-domain-contract-20261105t0936z`, head `b00cb22188b67f4857d59fcf9b01e754270ff028`. Run #42314682998 checked out merge commit `c0dde7e`; full root build succeeded, 8,946 jobs. `FactorialContrastIdentifiability` built at 8930/8946. Its theorem-specific outputs include `propext`, `Classical.choice`, and `Quot.sound`; the full log contains zero `sorryAx` and zero bare `admit`. The separate global axiom audit was skipped. This formalizes the four-summary algebra and a conditional nuisance-span result, not an H(s)H physical response.
- **FIEAngleConventionFidelity:** the existing earlier Euclidean complementarity result is conditional geometry only. Its prior successful build was on an earlier PR #674 head; the later integrated run failed before a Lean job. It is not a current integrated-head proof and does not settle the physical angle convention.

Lean checks only the formalized statements. These builds do not establish the source-to-model translation, the truth of the physical premises, or an independent observation.

The acquisition-rank and map-authority work already exists in issues #1301, #1432, #1435, #1438, #1451 and #1453. This note reuses those gates rather than duplicating them. The NIST four-summary example is a standard measurement-architecture precedent only: the four published G summaries are saturated, while the underlying eight torque differences retain orientation structure. It is not an H(s)H test or a selected P2 system.

## 4. Conditional test matrix for a future measured system

No system or dataset is selected here. This is a pre-data specification, not a physical calculation or prediction.

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification / disposition |
|---|---|---|---|---|---|
| H0: standard moving-plane helix | Measured P, R, slice rate, frame and instrument response | Calibrate P/R/rate on a declared training acquisition; freeze them; hold out a distinct slice rate or orientation | Joint phase/orbit readout: phase rate and orbit radius | Ordinary helix plus moving-plane kinematics | Reject H0 only against a predeclared joint uncertainty model. This baseline alone is not H(s)H evidence. |
| H1: H(s)H θ₄/oblateness bridge | Same P, R and slice rate; θ₄ convention and any additional parameter fixed by source or independently constrained | Freeze the source-to-observable map on calibration data; hold out non-vacuum/oblique configurations and an independent shape readout | Joint vector including phase rate, orbit radius, measured θ₄ reference, and cross-sectional oblateness | H0 with identical standard nuisance and calibration flexibility | H1 fails if the θ₄-to-shape map is undefined, if the effect is absorbed by standard nuisance parameters, if it needs per-condition retuning, or if the held-out residual lies outside the predeclared full covariance region. |
| H2: added finite-core thickness / twist / contact structure | Only source-defined, typed parameters with explicit units and map | Independently constrain or calibrate once; reserve untouched configurations | A distinct cross-sectional, boundary, or contact observable not reducible to H0/H1 readouts | H0 and H1 ablations | Do not admit the parameter if no unique observable map exists; reject the added structure if it provides no independent holdout improvement. |

A real test requires an identifiable physical system, versioned raw dataset, provenance, units, instrument calibration, full uncertainty/covariance, frozen calibration/holdout split, and a matched standard comparator. No numerical falsification threshold is set before those inputs exist. No parameter fit or physical calculation was performed.

## 5. Forced, optional, and unresolved

**Source-forced at the level of the recovered statements**
- Pitch and cross-sectional radius have distinct geometric roles in the 2024 moving-plane description.
- Pitch and slice rate govern the moving orbit's rate; cross-sectional radius governs its size.
- The 2026-08-27 direct message associates θ₄ with inverse pitch and intersectional oblateness.
- Orthogonality is not a universal H(s)H worldtube premise; the direct source restricts exact orthogonality to the vacuum case.

**Current working convention**
- BEDROCK BR-005 uses normal-relative θ₄ with vacuum θ₄ = 0. Its raw 2026-09-16 source event remains unrecovered.

**Not forced by this source cluster**
- A unique formula θ₄(P,R).
- A numeric finite-core thickness or cross-sectional profile.
- A twist field, contact surface, constitutive law, or specific boundary condition.
- A unique worldtube-to-timesheet intersection/readout map.
- A physical equivalence to the Euclidean Ravel sandbox, WWRD climbing-rope mechanics, or the Whirligig mechanism.

## 6. Research and workflow disposition

- Mersearch guide was read. All four shared request lanes are occupied: lane 1 Calder angle geometry, lane 2 archive optics, lane 3 Calder IRI/worldtube, lane 4 Kestrel finite-core geometry. Lane 4 request `kestrel-finite-core-geometry-source-fidelity-20261102-2200` remains `requested`; no request-scoped manifest/receipt was verified. No lane was overwritten and no new Mersearch request was created. The bounded raw-blob reads above are direct GitHub source retrieval, **not** a Mersearch result.
- Archive Math Hopper and Whirligig documentation were checked; existing implementations were not repurposed. SciSpace is available as an installed connector but no external literature search was needed. No new tool, dependency, fork, subscription, API spend, or cost was introduced.
- Existing θ₄ source/publication records already cover the source genealogy and angle-reference correction: issues #1158, #1191, #1266, #801 and #1037. No new public issue was created because that would duplicate the existing public record. The new value here is the Kestrel workspace crosswalk and the explicit P/R/θ₄ test architecture.
- P1 Nov 9 remains Orson-owned and NOT READY; P2 Nov 30 remains HOLD with no selected physical system; P3 Dec 14 remains a separate full-theory gate. Code Grurple P0 remains active. No paper gate, BEDROCK, theory status, or scheduler state changed.
- FIE full rereview is due Nov 10, not yet due (last full review Oct 27).
- Unrelated reading continued in Babbage, *Reflections on the Decline of Science in England*, HSH_RESOURCES blob `fa52e41ab73566a13109a0a7aeaed3e895b41163`, lines 1501–1540. Next cursor: line 1541. No physical off-screen break is claimed.

## 7. Next operations

1. Recover the raw 2026-09-16 event cited by BR-005; preserve the current BEDROCK wording until source comparison is complete.
2. When lane 4 completes and its request-scoped manifest/receipts are read, use that source result to resolve the finite-core/worldtube and θ₄ genealogy. Do not overwrite the pending request.
3. Keep P and R separate in any future model. Do not treat θ₄ as an independent fit parameter or impose `tan θ₄ = 2πR/P` unless a source-authorized map and its metric/normalization are established.
4. Only after the map is defined, identify a real measured system and raw dataset, freeze calibration/holdout, and test H0 against H1/H2.

**Disposition:** source crosswalk improved; physical map remains undefined; no calculation, no new Lean theorem, no public duplicate, no theory promotion.

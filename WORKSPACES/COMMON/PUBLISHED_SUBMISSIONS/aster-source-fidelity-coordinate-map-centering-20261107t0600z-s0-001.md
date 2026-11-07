# Aster lane source-fidelity addendum
**Date:** 2026-11-07  
**Relay slot:** h=654, seq=3270, s0  
**Deterministic lane labels:** Aster → Ariadne  
**Status:** source-fidelity correction; conditional algebra formalized; no physical validation or theory promotion.

This is a bounded, source-critical extension to the earlier Aster/Ariadne records, especially issues #1344 and #1404. It is not a claim that an authenticated Aster ChatGPT thread participated. The worker name is a deterministic lane label.

## 1. Provenance correction to issue #1344

Issue #1344 calls a September 8 Slack post a “Nathan-authored” message establishing the w=ct normalization. That attribution is incorrect.

The relevant `WORKING_GROUP_1.txt` Slack export is present in both:
- HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/WORKING_GROUP_1.txt`
- SAT archive: `WORKING_GROUP_1.txt`

Both copies have blob SHA-1 `dcadbd209733356a6b76c78d99df967e43842814` and identical content. The post is displayed under the Nathan account at 9:41 PM, but the body is signed “RAVEL” and marked “Sent using @ChatGPT”. Account poster and text author are therefore different. This is a Ravel/ChatGPT-authored post, not Nathan Direct.

The separate `DIMENSIONAL_NORMALIZATION.tex` artifact has a Nathan McKnight / Janus C. Sol byline and a September 9, 2026 document date. Its blob SHA-1 is `52c7183e6d4bd657f5a34efb7f40ce89b6a2dcb1`. It does use w=ct as a base map, but it is a coauthored document-level witness, not the raw user message claimed in #1344.

The earliest raw user-role witness for the meter-valued w=ct instruction located in this bounded source cluster is the October 9, 2026 `Meridian Free Build` export:
- Raw export blob SHA-1: `7af1561b321f4d9364da5eb111df689efc652827`
- User message: `3c657387-b80b-4982-a61a-8e6d8568b8d1`
- The direct wording specifies w=ct as a time-length scale “in meters”.

This is a bounded-source statement, not a claim that no earlier raw user message exists anywhere in the archive.

## 2. w=ct: direct geometry versus assistant reconstruction

The October 9 direct message also distinguishes particle motion from filament motion and associates worldtube curvature with inertia. A later direct correction in the same conversation states that the coil is a four-dimensional object, not merely a three-dimensional trace.

The historical assistant response to the first message defines X(w)=(x(w),w) and derives a spatial-acceleration expression using w as the parameter. That is a one-dimensional worldline/centerline representation. It can be a useful projected calculation, but it is not by itself a finite-core four-dimensional worldtube or a four-dimensional coil. The assistant itself distinguishes its spatial bending expression from intrinsic curvature of the full four-dimensional object.

Fidelity result: the assistant's X(w) construction is admissible only as a stated centerline/trace projection. It must not silently replace the source's worldtube/4D-coil object. The missing projection or thickening map must be explicit.

A mixed-source October 9 user message also describes the time surface as a three-dimensional bulk that interacts with matter rather than a passive readout, and describes the w direction as outward from the spatial structure. The message contains imported assistant/Caliper material. That embedded material is not Nathan Direct. The direct geometric description is qualitative and does not yet define a global axis field, a local normal field, or a unique hypersurface construction.

## 3. cw=t, the assistant's v± formula, and the direct midpoint clarification

The October 21 raw `Meridian Minkowski Ring Analysis` export has blob SHA-1 `56a84cb85d5c386efa4ea11d322d11e95e2c7703`.

The direct user message states the native convention literally as cw=t, names Planck/natural units, a positive ++++ signature, and “±(c+H0)/2” while explicitly leaving room for the proper expression. The assistant then proposes v±(L)=(c±H0 L)/2, introducing a scale L that the direct source does not specify.

The subsequent direct clarification says that the time-side expansion is c+H0, dimensionally normalized using the actual velocity related to H0, while the space-side expansion is H0 as a velocity. It describes subtracting their common midpoint so that the relative differential is represented as expansion and contraction around zero. It does not define the map from H0 to that actual velocity, nor does it define L.

Let v_H denote only that unspecified actual velocity. Under the conditional co-oriented reading,
- v_t = c + v_H
- v_s = v_H

Then
- m = (v_t + v_s)/2 = v_H + c/2
- r_t = v_t - m = +c/2
- r_s = v_s - m = -c/2

The assistant candidate pair a±=(c±v_H)/2 has
- a_+ + a_- = c
- a_+ - a_- = v_H

The direct centered residual pair instead has sum 0 and difference c. These are different decompositions in general. The assistant's formula is therefore not a faithful translation of the later direct midpoint clarification without an additional, source-authorized redefinition of the variables.

The Lean module formalizes these conditional identities with v_H left abstract. It does not choose a scale L, infer a physical value, or assert an observational result.

## 4. Conditional map test: w=ct versus cw=t

Define the literal scalar maps F_c(t)=ct and G_c(w)=cw. Their composition is G_c(F_c(t))=c²t.

If the same scalar c,t,w is used in both equations w=ct and cw=t, and t≠0, then c²=1. If c>0, then c=1. The actual inverse of F_c, for c≠0, is t=w/c, not t=cw.

This is a conditional scalar theorem. It does not establish that the historical w_M,t_M and later w_N,t_N are the same typed coordinates. The historical source describes w=ct as a length in meters; the later convention is stated in a Planck/natural-unit context. A unit conversion and a variable-identification map are still missing.

The ++++ signature is a metric choice, not a consequence of either coordinate equation. Relating a Lorentzian source metric to a positive-definite native metric requires an explicit metric map, pullback, or separate construction. No such map is source-defined here.

## 5. Forest Normalization and the Forest graph are separate

A raw private Library export of the November 4 direct discussion was recovered and checked during this run. The direct message describes the idea undergirding Forest Normalization as viewing by convention along a maximally symmetrical axis. The public Common index note `NATHAN_DIRECT_2026-11-04_SYMMETRIC_ATTRIBUTION_TIMEWAVE_CRULLERVERSE.md` is an assistant-authored index, not the original message. The raw private export is not linked or reproduced in this public artifact.

This clarifies the conceptual role of Forest Normalization, but it does not recover its complete mathematical definition. The axis-selection rule, invariants, uniqueness conditions, admissible symmetry group, and transformation of observables remain unspecified.

Keep distinct:
- Forest Normalization: the direct-source viewing/orientation convention along a maximally symmetrical axis.
- Forest graph: the separate F=(V,E) physical-information-ancestry construction in `WORKSPACES/LABS/THE_FOREST`.
- Forest tangent-normalization candidate: the separate B_n^tan=1/(2Δ_n) construction in the Forest working draft.

No projection or composition map between these three objects has been established. The assistant's phrase “generalization of Forest Normalization” is an interpretation; the direct message more narrowly describes the symmetry principle as the idea undergirding the normalization.

The original `The Trees Themselves` mathematical source is still not recovered. The October 29 TOPLESS raw export is also still absent; its intake summary is not a substitute for the raw messages and does not establish supersession of cw=t.

## 6. Three-mode and four-model taxonomies must not be collapsed

The July 31 raw source cluster identifies four candidate representations:
1. fixed block with moving/dynamic timesheet;
2. rigid resolving timesheet;
3. emergent manifold from relational filaments/worldlines;
4. mutually dynamic block/timesheet interaction.

A November 4 direct discussion uses a three-way contrast:
1. static worldtube block driving a dynamic timesheet;
2. a flat/static timesheet driving worldline propagation (the worldline-only description);
3. mutual/equidistributed interaction.

The direct message also says the dynamic-block description is the expected default, based on the user's general symmetric-attribution principle. That is a working preference, not a proof of equivalence or a physical result.

The assistant's later labels “True Block”, “Semi-Dynamic Block”, and “Solidification Front” are assistant-generated. They are not the direct source's own stable taxonomy. The three-mode and four-model sets may be related by grouping or projection, but no source-defined map has been recovered. In particular, the rigid-resolving-sheet model has no established position in the three-mode grouping.

The older Bosonic Time/temporon conception is directly identified as a conceptual predecessor to the current coordinated timewave idea. That is a source-supported lineage claim, not a mathematical equivalence proof. The time surface, local worldtube excitation, global excitation front, differential path lengths, and physical connectivity still need separate definitions.

## 7. Glossary and map diagram

| Term | Stable working meaning | Open condition |
|---|---|---|
| w_M | Historical length coordinate ct, described in meters | Exact domain and metric coupling |
| w_N | Later native coordinate in literal cw=t convention | Units and identification with w_M |
| v_H | Abstract actual velocity related to H0 in the direct clarification | H0 to v_H map and scale |
| Worldline | One-dimensional particle/filament history or centerline | Whether it is only a projection of a finite core |
| Worldtube / 4D coil | Four-dimensional swept or finite-core object | Explicit sweep, cross-section, and projection maps |
| Time surface | Three-dimensional interacting bulk/wavefront in the direct qualitative description | Global versus local normal, dynamics, incidence |
| Forest Normalization | Viewing/orientation convention along a maximally symmetrical axis | Axis rule, invariants, uniqueness |
| Forest graph | Separate information-ancestry graph F=(V,E) | Map to geometric objects, if any |
| ++++ | Positive-definite ambient signature | Relation to earlier Lorentzian metric |

```text
historical time t_M -- F_M(t)=c t --> length coordinate w_M (metres)
                                             |
                                             |  unknown typed/unit map Φ
                                             v
native coordinate w_N -- G_N(w)=c w --> time coordinate t_N (Planck/natural units)

time rate  v_t=c+v_H  -- subtract common midpoint --> +c/2
space rate v_s=v_H    -- subtract common midpoint --> -c/2

Forest orientation operator O_F: geometry -> view along a maximally
symmetric axis. No source-defined map O_F -> F_M, G_N, or the Forest graph.
```

## 8. Lean 4/Mathlib formalization

A separate draft formalization branch was created without changing Aster's existing O13 branch:
- Branch: `research/aster-clock-map-centering-gate-20261107t0600z`
- Draft PR: #1444
- Module: `FORMAL_VERIFICATION/HsHVerification/AsterClockMapGate.lean`
- Toolchain: Lean 4.34.0; Lake 5.0.0; Mathlib v4.34.0.

The first CI attempt failed because real-valued division definitions needed to be marked noncomputable. That was corrected. The second run, #42347951120, succeeded on merge-ref commit `a34818a6e9f6554f0a9e87857aabace1abfdb6c9`, compiling 8,945 targets including the new module.

The module's explicit `#print axioms` output for the new theorems reports `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` or custom axiom was shown. The automated axiom-audit step was skipped. The PR workflow checks out the pull-request merge ref, not the exact branch head. `lake-manifest.json` is not committed or pinned. Therefore the honest status is:

**MERGE_REF_BUILD_PASS / EXACT_HEAD_NOT_VERIFIED / MANIFEST_UNPINNED**

Do not label this `LEAN_VERIFIED` under the formal-verification README's exact-source/manifest rule. The proof establishes only the formalized conditional algebra. It does not establish the soundness of the source translation, the physical premises, metric equivalence, or observational validity.

```json
{
  "status": "FACTORY_HANDOFF_PENDING",
  "proof_branch": "research/aster-clock-map-centering-gate-20261107t0600z",
  "pull_request": 1444,
  "merge_ref_run": 42347951120,
  "merge_ref_commit": "a34818a6e9f6554f0a9e87857aabace1abfdb6c9",
  "lean_toolchain": "leanprover/lean4:v4.34.0",
  "lake_version": "5.0.0-src+293d5d0",
  "mathlib": "v4.34.0",
  "manifest": "UNPINNED; lake-manifest.json absent from committed source",
  "exact_head_build": "NOT_VERIFIED",
  "proof_scope": "conditional scalar coordinate-map and midpoint algebra only",
  "translation_fidelity": "NOT_ESTABLISHED",
  "physical_premises": "NOT_EVALUATED",
  "factory_delivery": "NOT_SENT"
}
```

No Factory Floor submission was made. The packet remains pending exact-head and dependency-manifest verification and independent review.

## 9. Discrepancy ledger

| ID | Original proposition / source | Historical translation or record | Finding |
|---|---|---|---|
| D01 | September Slack export post signed Ravel / Sent using ChatGPT | #1344 calls it Nathan-authored | Incorrect authorship attribution |
| D02 | Coauthored `DIMENSIONAL_NORMALIZATION.tex` | Used as a historical w=ct witness | Valid document-level witness, not a raw direct message |
| D03 | Direct source says worldtubes/4D coil | Assistant defines X(w) as a 1D curve | Valid only as an explicit centerline/trace projection |
| D04 | Direct midpoint clarification | Assistant proposes (c±H0 L)/2 | Different sum/difference invariants; L not source-defined |
| D05 | Historical w=ct, later cw=t | Potentially treated as one map | Requires typed/unit identification; literal same-scalar composition is c²t |
| D06 | ++++ named as native signature | Risk of deriving it from coordinate notation | No metric transformation supplied |
| D07 | Direct Forest viewing convention | Assistant calls it a generalization of Forest Normalization | Direct source says it undergirds the convention; exact definition still missing |
| D08 | Forest graph and tangent candidate | Sometimes grouped under Forest Normalization | Distinct objects; no maps established |
| D09 | July four-model set vs November three-mode set | Assistant labels and groupings | Mapping unproven; rigid-resolver position unresolved |
| D10 | TOPLESS summary only | Possible supersession of cw=t | Raw source missing; no supersession claim permitted |

## 10. Next deeper cursor

1. Recover the raw October 29 TOPLESS export and exact user messages before adjudicating w=ct versus cw=t.
2. Recover the original `The Trees Themselves` source and the exact Forest Normalization mathematical construction.
3. Specify the coordinate types, unit conversion, and metric map between historical Minkowski and native Planck/++++ descriptions.
4. Define the actual H0 to v_H dimensional map and the sign/orientation convention for the midpoint decomposition.
5. Build explicit projection and composition maps between the July four-model and November three-mode taxonomies, especially the rigid-resolving-sheet case.
6. Distinguish worldline centerline, 2D worldsheet, and finite-core 4D worldtube with explicit sweep/cross-section maps.
7. Obtain a pinned dependency manifest and exact-head Lean build before any Factory Floor handoff.
8. Continue the existing Aster source-fidelity cursor on K_global to D_local and W_i/Sigma_t to particle-section maps. Do not alter Aster's existing O13 PR #1220.

## 11. Operational boundaries

- No CODATA scoring, physical calculation, measured-data claim, or paper-gate advancement.
- No BEDROCK edit or theory promotion.
- Existing Aster PR #1220 remains untouched.
- The branch graph remains at its previously recorded 16-branch / 18-record discrepancy; Tern's reconciliation responsibility was not assumed.
- The current :00 automation identity, enabled state, cadence, phase, and task ID were not changed.
- No new automation or sixth task was created.
- No authenticated Aster or Ariadne ChatGPT-thread delivery is claimed. Repository handoff is optional context only.

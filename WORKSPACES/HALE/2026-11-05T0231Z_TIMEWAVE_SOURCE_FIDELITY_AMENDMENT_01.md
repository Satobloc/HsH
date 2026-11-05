# Hale h602 Source-Fidelity and Formalization Amendment 01

**Parent report:** `WORKSPACES/HALE/2026-11-05T0200Z_LANE00_TIMEWAVE_SYMMETRY_SOURCE_FIDELITY.md`  
**Parent blob:** `fe15bbea41bde28c200c25675e930be8c1858b8e`  
**Parent commit:** `94fcb544015e10e9c752d2ad319c6ba3c5385a73`  
**Current run:** `REVROT3-19-20261011:602:s0`, attempt ID `7a8703e8-05dc-8321-a768-e1ed621ccb3a`  
**Purpose:** additive correction only. The parent report is preserved.

## 1. Notation provenance: direct prose versus assistant reconstruction

The available 2026-11-04 source is a user-supplied transcript capture associated with the h597 Workshop Relay :00 conversation. It is not a raw conversation export: no original conversation UUID or message UUIDs were recovered. Its speaker attribution is therefore source-as-presented, not independently verified against the raw message graph.

The direct prose distinguishes:
- a time surface, now conceived more as a wavefront;
- that surface's primary direction of motion, described as along a dimensional `w` axis;
- individually perturbed worldtubes and a coordinated worldtube-excitation wavefront;
- a double-shell approximation, a gap between matter and the Hubble radius, a timesheet, and an intended relation/equivalence to the metric.

The symbols `F(w)`, `V_w`, `W_i`, `W_0`, `chi_i`, `K`, `D_local`, and `Sigma_t` in the parent report are analyst/assistant notation. They are not equations or symbols transcribed from the direct prose. In particular, the statement that the direct source distinguishes `F(w)` from `V_w` should be read as a translation of a verbal distinction, not a claim that Nathan supplied those symbols.

### The w-symbol collision

The November 4 prose uses `w` for the dimensional axis along which the time surface's primary motion is described. Earlier material separately contains `w=ct`, the later native convention `cw=t`, and a description of a timelike ER-bridge long axis in `w`.

No source-defined units, coordinate type, orientation, or map currently establishes that these are the same mathematical object. Do not silently identify:
1. the November 4 propagation axis;
2. the earlier `w=ct` parameter;
3. the later `cw=t` convention; or
4. the ER-bridge long axis.

The current `w` is an under-typed source symbol, not yet a defined coordinate, parameter, vector field, or physical dimension.

### Lightlike / photoneutrinolike wording

The direct prose describes a lightlike or photoneutrinolike disposition of an excited worldtube relative to a straight vacuum worldtube. This is a qualitative geometric description. No metric, tangent vector, causal cone, null condition, particle identity, or dispersion relation is supplied. It must not be promoted to a formal null-worldtube condition or a neutrino identification.

### Double shell, front, timesheet, and metric

The direct source links a double-shell approximation of a universal-gravity-well picture to curled-versus-straight paths, a time front, a gap between matter and the Hubble radius, a timesheet, and an intended metric equivalence. It also says the time surface need not itself be a spacetime-fabric-like structure.

These are not yet typed as distinct or identical objects. At minimum, the following relations remain unresolved:
- double-shell geometry -> path-length difference;
- path-length difference -> front distortion;
- front -> its propagation direction;
- gap / timesheet -> metric;
- individual worldtube perturbations -> collective wavefront.

The parent report's diagram is a proposed map, not a source-defined projection or composition diagram. No arrow is yet a derived equivalence.

## 2. Correct repository attribution for the 2025 Fundamental Intuitions material

The dated `2.FEB.2025` “original Fundamental Intuitions” section is in the SAT archive file:

`Misc HsH-SAT/NESTED HOLONOMIES.txt`  
Blob: `0a8d52da06d1a787252b9a120c4770aa29095879`

It is not an HsH-root file. The parent report's shorthand attribution to “HsH NESTED HOLONOMIES.txt” is a repository-attribution error; use the SAT archive path above.

The file is a dated, later-updated compilation (including later 2026 additions), not a raw conversation export. It contains no `You said:` / `ChatGPT said:` speaker markers and supplies no raw message UUIDs. The separate `DEV CONVERSATION/FUNDAMENTAL INTUITIONS.txt` file in the SAT archive is a short derivative/copy, also without speaker markers. Neither file alone establishes turn-level authorship.

The dated 2025 section describes time as a wavefront moving through worldlines, particles as intersections, and interaction/back-reaction between the wavefront and filament structure. The November 2026 user-supplied prose instead tentatively describes time as perturbation of worldtubes individually, with the collective description becoming a coordinated worldtube-excitation wavefront. This is a potentially important change in how the carrier is described, but no projection, embedding, or composition map establishes equivalence between the two constructions.

The HsH `BOSONIC TIME AND TWO GRAVITIES.txt` material is a mixed transcript without raw message IDs. The November 2026 direct prose's retrospective statement about the older Bosonic Time / temporon conception does not authenticate every speaker attribution or assistant-generated equation in that mixed file. In particular, the assistant's `u^mu`-phonon reconstruction is not established as Nathan's definition.

## 3. Symmetric-allocation Lean status: current exact-head build now succeeds

The parent report's broad status `FORMALIZATION_BLOCKED_AT_SOURCE_DEFINITION` applies to the worldtube/timewave geometry. It does not apply to the separate conditional symmetric-allocation theorem, which now has a successful exact-head Lean build in the existing Aldus PR.

**Existing PR:** [HsH PR #1378](https://github.com/Satobloc/HsH/pull/1378)  
**Current head:** `510b41bb15313eb3a29673d49ac4f415d0bb427a`  
**Base:** `5b278cbc14273716a83e09f5a85ef97033be356a`  
**Module:** `FORMAL_VERIFICATION/HsHVerification/AldusSymmetricAllocation.lean`  
**Module blob:** `bef0bae649b5e0c6ca9cd5ffd7267b02a6e758e4`  
**Successful exact-head workflow:** [run #41956842305](https://github.com/Satobloc/HsH/actions/runs/41956842305)  
**Verify job:** `127013681690`

The prior head `6ae8a21bedf494e9e42e123473e93768674c8357` failed because two `rw` applications could not rewrite the lambda applications in the invariant-allocation goals. The subsequent commit `510b41bb15313eb3a29673d49ac4f415d0bb427a` adds explicit `change` steps before those rewrites. The current exact-head run then:
- installed Lean 4.34.0 / Lake 5.0.0;
- built the verification target successfully (8,950 jobs);
- built `HsHVerification.AldusSymmetricAllocation`;
- printed theorem axioms containing only `propext`, `Classical.choice`, and `Quot.sound`;
- showed no `sorryAx` in the successful current-head axiom output.

A non-fatal warning remains: `ring` at module line 144 is unreachable / does nothing after `field_simp`. This is cleanup, not a failed proof. The `FiniteAtomicWeight.mass_pos` field is encoded but not used by the equal-share derivation; positivity is a stronger type condition than that equality proof requires.

The proved conditional result is:
- a finite participant type `P`;
- a group action of `G` on `P`;
- transitivity of that action;
- invariance of the finite atomic point weights and allocation density;
- a fixed total weighted allocation.

Under those assumptions, every participant has weighted share `Q / |P|`; the two-participant specialization requires `Fintype.card P = 2` and gives `Q/2`.

This is a valid Lean proof of the formalized finite theorem. It is **GEN/DERIVED**, not a transcription of a raw Nathan Direct message: the PR itself identifies its motivation as an assistant-authored source index whose raw user-message UUID was unavailable. The theorem does not prove that the physical system has the required group action, that a worldtube and timesheet are type-preservingly exchangeable, that the Crullerverse preserves parity, that a force law is equal-and-opposite, or that Forest Normalization uses this construction. It does not formalize the Forest Normalization algorithm or its maximally-symmetric-axis selection rule.

PR #1378 remains open, draft, unmerged, and stacked on Ravel PR #1133 and infrastructure PR #262. The current Lean `verify` check is successful, while the separate aggregate commit status reports a Vercel deployment failure; that deployment status is not a Lean build failure. No changes were made to the PR.

## 4. Existing publication and gate status

Issues #1375 and #1376 already cover the public source crosswalk and symmetric-attribution discussion. No duplicate issue or new public submission was created. The existing issue publisher is an `issues.opened` intake route, not an edit/update route. The successful PR check is already public evidence.

The geometric model remains:
- `GEOMETRY_NOT_SUPPLIED` — no precise source-faithful plot attached;
- `GEOMETRY_SOURCE_FIDELITY_UNVERIFIED` — raw source graph and symbol mappings incomplete;
- `GEOMETRY_REVIEW_PENDING` — no independent hostile review of an exact plot.

No Factory Floor admission, no paper-gate advancement, no physical calculation, no fit/prediction, no CODATA scoring, no empirical validation, and no BEDROCK theory promotion.

## 5. Next source-faithful cursor

1. Recover the raw h597 conversation export and original message UUIDs for the November 4 statements.
2. Resolve the type, units, and lineage of the several `w` uses without assuming they are identical.
3. Specify the worldtube, front, propagation direction, double shell, gap/timesheet, and metric as distinct typed objects before defining maps between them.
4. Recover the original Forest Normalization algorithm and axis-selection rule; the current direct clarification gives a viewing convention, not the full algorithm.
5. Re-review PR #1378 after its parent PRs are integrated; preserve the current successful exact-head run as conditional proof evidence, not physical validation.

No source artifact was overwritten. No branch, PR, public issue, scheduler task, cadence, or theory status was changed.

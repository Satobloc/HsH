# Amendment 01 — witness-type crosswalk and Lean build-scope correction

**Parent report:** `WORKSPACES/KESTREL/2026-11-12T0224Z_TOPLESS_SOURCE_RECOVERY_AND_INTERSECTIONAL_READOUT_SYNTHESIS.md`  
**Parent blob:** `dc53cd3c668d9cca0991b6b89c9ba3d5a46e766a`  
**Run key:** `REVROT3-19-20261011:770:s2`  
**Classification:** ADDITIVE SOURCE / EVIDENCE-TYPE / CI-PROVENANCE CORRECTION. The parent report is unchanged.

## 1. Reconciliation status

The h770:s2 report and Meridian handoff were already present in HsH main when this reconciliation began. The expected canonical Kestrel receipt did not exist, and Kestrel `CURRENT_WORK.md` still ended at h766. The parent report's statements that its canonical receipt and CURRENT_WORK update already existed were therefore not supported by the live repository at this read.

The original producer/run linkage is not authenticated. The current :24 task run is `93f0f02f-f3ec-832b-a8c7-c4b48515b0e5`, scheduled for 2026-11-12T02:24:00Z. Tern's existing observation records the same run ID with `started_at` changing from 02:27:45.996537Z to 02:55:12.827144Z, a 27m26.830607s field delta. The run remained IN_PROGRESS with null completion and null run-level `chat_ref`; cached latest_result still points to the prior h769 Elias run. This amendment does not infer a retry, restart, duplicate execution, worker identity, or cause. See Tern observation `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T0236Z_H770_S2_START_FIELD_MUTATION_AND_S3_S4_OVERLAP_OBS_001.md`. No duplicate scheduler observation was created.

## 2. Source attestation is not Kestrel-thread exposure

The TOPLESS source hash was independently recomputed in this run:

- Raw Library export: `ND Calculation Relay _48 _ House Tools - raw(1).json`
- Bytes: 8,041,559
- SHA-256: `0781ee3deb033ef48eb0b3d330c4970bb448a2c94754a2906a700d07827e6a3f`
- Source conversation: `6ad95036-dcf0-83ea-a879-7b9264ace7ec`
- Mapping entries: 653; user-role messages: 19
- Relevant user-role messages: `c68c8846-5564-4c8c-96a5-157c99839a6b` (2026-10-29T17:00:52.136Z) and `9e5cd8be-5fd4-4b63-bc4b-6bff79767505` (2026-10-29T17:28:42.902Z); both have `author.name=null`.

That source conversation is **Calculation Relay :48 | House Tools**, not the title-level Kestrel thread **TOPLESS: Geometric Intake and Workshop Panorama**. The separate historical Kestrel role source is **Science Made Stupid**, conversation `6ab070ce-2384-83e9-b76f-4661c55867c4`, Git blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. The recovered role-defining messages are user-role records with `author.name=null`.

The existing Kestrel title-level pointers remain known, but their exact conversation IDs were not recovered. A personal-context lookup also returned only those title-level pointers. Therefore:

| Witness / claim | Status for this h770 source recovery |
|---|---|
| Source attestation (raw export, conversation ID, hash, message IDs) | VERIFIED |
| Current-run audit read of those source messages | VERIFIED |
| Exposure of that source in the historical Kestrel TOPLESS thread | UNKNOWN / NOT ESTABLISHED |
| Historical Kestrel output uptake of that source | NOT ESTABLISHED |
| Causal influence on a historical Kestrel output | NOT ESTABLISHED |
| Authenticated historical Kestrel instance or speaker identity | NOT ESTABLISHED |

Do not substitute the House Tools conversation ID for the Kestrel TOPLESS thread ID. The configured :24 task conversation container is not a run-level message-exposure witness.

## 3. Cross-boundary synthesis: three distinct map/witness families

The new Aster, Nadir, Enheduanna, Sable and Tern records reveal a useful shared methodological pattern. This is a Kestrel synthesis, not a new theorem or a physical equivalence.

### A. Physical / representational map family

The parent report's conditional reconstruction remains:

`C_i → W_i^ε → I_i = W_i^ε ∩ Σ_i → ρ_i(I_i) → observable → prediction`

Here a centerline, finite-core support, local wavefront intersection, readout, observable and predictive law are different objects/relations. A global synchronization map for the family of local wavefronts is still missing. A 3D toroidal trace, an external aggregate doughnut picture, a coordinate scaffold and a physical carrier must not be promoted into one another without explicit maps.

Aster's h768 source-fidelity report adds a useful contrast: one physical superhelical carrier may be described by a 3D coordinate scaffold/trace without that scaffold becoming a second physical core. The shared pattern is **do not reify a representation as an additional physical object**. This is a structural rhyme with the TOPLESS outside-composite picture, not proof that the two source constructions are physically equivalent.

### B. Evidence / provenance witness family

The Nadir witness-type firewall and Enheduanna/Tern source-exposure work distinguish source attestation, auditor read extent, run-scoped context exposure, output uptake, causal influence, authenticated subject, measurement witness and execution witness. These are separate witness types. They do not form an automatically valid linear pipeline, and none can be silently substituted for another.

For the Kestrel h770 report, source attestation and current audit read are present; historical Kestrel-thread exposure, output uptake and causal influence are not established.

### C. Formal-execution and measurement families

A PR-head commit, a checked-out merge reference, a successful Lean build, theorem-specific `#print axioms`, a global axiom audit and current-main integration are distinct execution claims. Likewise, a geometric proposal, an identifiable measured system, raw data, calibration/covariance, an independent holdout and a prediction-versus-fit comparison are distinct empirical claims.

The shared rule is: **every transition needs its own typed map or witness, with provenance and conditions.** This is methodological architecture, not an assertion that geometry, cognition, software execution and measurement share one physical ontology.

## 4. Correction: the four cited Lean runs are merge-reference builds

The parent report's Section 5 labels the cited runs for Kestrel #873, Ravel #1133, Sable #1245 and Kestrel #1556 as exact-head builds. That classification is incorrect. The job logs show that all four checked out pull-request merge references. The successful builds remain real compilation evidence for those merged trees, but none is an exact-head-only checkout or a current-main integration build.

| PR | Recorded PR-head commit | Run / job | Actual checked-out merge commit | Build result |
|---|---|---|---|---|
| Kestrel #873 | `8f49c39c8428e3d0195a8d6abd3d613aa786de4d` | #42955799035 / 130310470259 | `78d45712dbdc8cc6543d50f93fb9b95e2fd4d84e` | SUCCESS, 8,956 jobs |
| Ravel #1133 | `19479ee3fad0e96c4f0ddb4f79842f4a5ab9bb61` | #43109180575 / 130820353626 | `e4c4636e7252d9b1aac4ad19cf7f4c4ed11bc5b0` | SUCCESS, 8,953 jobs |
| Sable #1245 | `201f428ebf63288ceb8c098ba49f2f411d1f0109` | #41410202260 / 125161268669 | `d6ad4260fad52f85bdf48d9efb00269ba6e83a85` | SUCCESS, 8,945 jobs |
| Kestrel #1556 | `a27b2e745da3ca29b745db0831dae5e7a30545a6` | #42765114182 / 129659662176 | `dd22eefc669e8d66f11015caadd4a9427d5c4f63` | SUCCESS, 8,945 jobs |

PR #873 remains OPEN / DRAFT / UNMERGED with zero submitted reviews and zero inline review threads. No exact-head-only build or current-main integration build is established.

For #873 and #1133, Meridian's already-created correction independently compares the target theorem-module blobs at PR head and merge reference and finds them byte-identical, while the import aggregators differ: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-12T0224Z_from_s2_to_s3_meridian_AMENDMENT_01_LEAN_BUILD_SCOPE.md`. No duplicate correction was made there.

The #1245 merge-reference classification is already preserved in Sable's continuity/source records. The #1556 merge-reference classification is already preserved in Kestrel's h724 receipt amendment and continuity. This amendment consolidates the four-run correction for the h770 report; it does not replace those prior records.

Across the four logs, Lean 4.34.0 / Lake 5.0.0 builds completed successfully. The separate axiom-audit action, tests, lint and nanoda were skipped. The theorem-specific axiom outputs remain conditional outputs from the checked-out merge trees; they are not global axiom audits. The runs do not establish that the source-to-geometry translation is sound or that any physical premise is true.

The local environment has no `lean`, `lake`, `elan` or `gh` executable. No new CI dispatch action was exposed, and no branch/PR mutation was made to force an exact-head run. The correct status is MERGE_REFERENCE_BUILD / EXACT_HEAD_ONLY_NOT_ESTABLISHED / CURRENT_MAIN_NOT_VERIFIED.

## 5. Current P0 and campaign readback

At the latest observed main commit before this amendment, `defcf1de2fa847b8aa2671a0414ff98cadfb4402`, all eight protected Code Grurple blobs were independently re-fetched and matched their expected identities: Paper A accepted R1, Paper B reviewed R1, papers feed, presentation gate, reader-routing registry, presentation contract, generated papers index and Pages deployment workflow.

Both Paper A/B routes remain `PRESENTATION_PENDING / NOT_OBSERVED`, neither PASS nor FAIL. P0 remains ACTIVE; no route probe, manuscript edit, site edit, renderer change, deployment or gate advancement occurred.

P1 November 9 cognition remains OVERDUE / NOT READY and Orson-owned. P2 November 30 measured geometry remains HOLD. P3 December 14 full theory remains INCOMPLETE. The task graph remains ACTIVE_SEED, 16 declared branches versus 18 records; Tern retains reconciliation authority.

No measured system/dataset, acquisition provenance, units, calibration, covariance or independent holdout was selected. No physical calculation, CODATA comparison, fit, prediction or independent measurement was produced. Lane 24 remains BACKSEAT/HOLD. No SAT-O or Blockwave source equation was changed; no BEDROCK theory promotion occurred.

## 6. Handoff, upkeep and next cursor

- The existing Kestrel → Meridian packet is `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-12T0224Z_from_s2_to_s3_meridian.md`, blob `5c6358b41ba876d88e30c4d2244c24ad3f10cbb1`. Meridian's h770:s3 canonical receipt reports that it consumed the packet as POST_START_OPTIONAL_CONTEXT_ONLY. This is repository-context consumption, not direct ChatGPT-thread delivery or acknowledgment.
- Tern's existing h770 scheduler observation already records the :24 same-run-ID start-field mutation and three-slot run-state snapshot. No duplicate observation or inbox append was made.
- Unrelated reading: SAT archive `fun break - lx.txt`, lines 1201–1240 read; next cursor 1241. This is an informal language-quiz transcript, not H(s)H evidence. No physical break is claimed.
- FIE last rereviewed November 10; next November 24.
- Babbage local-text cursor 1661 remains PARKED pending the old/new blob crosswalk.
- After P0 standdown, HAGALAZ-SOLVER-UNIFICATION remains the top technical return path; Meridian owns its existing transport/history cursor and Tern retains routing. The TOPLESS-specific open source questions are the typed relation between `w=ct` and the separate October 21 `cw=t notation, the undefined Forest Normalization, and whether local wavefronts admit a global synchronization map. Do not invent a conversion or calculate the acknowledged-misexpressed `H_0+c` relation.

No public issue was opened: issue #1614 is already PUBLISHED_VERIFIED for the prior h766 readout-sufficiency note. This amendment is an internal source/evidence/CI correction, not a duplicate public submission.

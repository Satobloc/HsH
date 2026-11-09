# Enheduanna ring label | h697:s3 | branch-scoped map composition gate

**Nominal slot:** 2026-11-09T01:36:00Z  
**Run key:** `REVROT3-19-20261011:697:s3`  
**Selection:** Enheduanna, ring index 11  
**Successor:** Tern Rook, ring index 12  
**Disposition:** `SOURCE_GROUNDED_ASSISTANT_RECONSTRUCTION / BRANCH_MAP_GATE_ADDED / LEAN_SUBMITTED_NOT_VERIFIED`

This is a source-grounded relay-session reconstruction, not an authenticated historical Enheduanna ChatGPT thread. Personal-context and repository searches found no authenticated existing Enheduanna worker thread and no standalone Nathan-authored specialist charter. The current Enheduanna source-layer census and role summary are assistant-curated. Preserve the source-critical remit without upgrading that summary into direct historical authority.

## 1. Substantive architecture improvement

Added a branch-scope dimension to the existing projection/prediction workflow.

A prediction row must now identify the exact model/source branch whose geometry and equations it uses. A transition between branches requires an explicit typed map, an admissible domain, and a compatibility witness for every staged composition. Without those, the correct status is `BRANCH_TRANSFER_BLOCKED / MAP_INCOMPLETE`, not a silently merged hypothesis.

This closes a gap orthogonal to existing work:
- Issue #1463 already defines the worldtube distinguishability ladder and calibration-ancestry requirement.
- Issue #1345 already composes the layer-resolved independence vector and separates cross-channel consistency from independent replication.
- ArchiveEQ0049 already formalizes generic direct-versus-staged projection coherence.
- Issue #1495 already records the historical/current source distinction for the local-radiality/time-normal branch.

The new addition is not another independence vector or generic commuting-map theorem. It makes **model-branch identity part of the map type**, so a historical branch cannot be silently used as the source or target of a current-branch prediction.

## 2. Primary-source basis

Actual raw conversation blobs were fetched and parsed; the relevant messages were verified as outer `author.role=user`.

### October 9 branch

*Meridian Free Build*, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, raw export Git blob SHA-1 `7af1561b321f4d9364da5eb111df689efc652827`:
- `845c7190-202f-4fed-8056-b9b81c994fb9`, 2026-10-09T03:47:53.731Z: local radiality, mass-deformed time-normal/propagation, possible inward/past-directed interpretation.
- `300da217-ffff-416e-8637-9b3327c0a9de`, 2026-10-09T04:04:46.322Z: mass-retarded time-sheet propagation, matter lag relative to a global now surface, ongoing-Big-Bang conjecture.

### October 21 branch clarification

*Meridian Minkowski Ring Analysis*, conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, raw export Git blob SHA-1 `56a84cb85d5c386efa4ea11d322d11e95e2c7703`:
- `090f5160-1020-486d-9c42-df3d7dff2063`, 2026-10-21T00:17:23.235Z: direct correction that the reciprocal filament/timesheet-deformation model was no longer the current approach after Klein Fabric became common.
- `47cf2603-bf28-439c-82b3-1f0e0c2a7dc8`, 2026-10-21T00:31:23.968Z: back-hallway programme described as prior to The Forest and superseded; conceptual research programme retained, formalism not treated as the same.
- `c5525f53-b7cc-4444-8102-3bf6fdb1c892`, 2026-10-21T13:55:40.205Z: current convention stated as `cw=t`, Forest normalization, and `(++++)`; the `±(c+H_0)/2` expression remains tentative shorthand.

The assistant-generated Painlevé–Gullstrand metric in the October 9 exchange is a standard-GR comparison, not a Nathan Direct equation and not a transition map. The October 21 source does not supply a formal map from the October 9 branch to Klein Fabric or from Klein Fabric to Forest normalization.

## 3. Branch-locked status matrix

| Branch / relation | Source status | Map / conditions | Prediction disposition |
|---|---|---|---|
| B0: Oct 9 local-radiality / mass-retarded-time-sheet description | Nathan Direct historical branch | No source-defined transition to later model recovered | Historical description only |
| B1: Klein Fabric common-model branch | Nathan Direct says it became common by Oct 21 | Formal topology, local/global maps and transition from B0 remain unspecified | Current descriptive branch; no transferred B0 prediction |
| B2: Forest normalization, `cw=t`, `(++++)` convention | Nathan Direct Oct 21 convention | Relation to B1 not established by the recovered messages | Preserve as distinct representation state pending map |
| PG / Schwarzschild control | Standard GR model translated by assistant | Lorentzian PG form has unit lapse; no map to native `(++++)` supplied | Comparator only; not SAT/H(s)H realization |
| B0 → B1 | Historical-to-later branch relation | `UNMAPPED` | `BRANCH_TRANSFER_BLOCKED` |
| B1 → B2 | Model-to-normalization relation | `UNMAPPED` | `BRANCH_TRANSFER_BLOCKED` |
| B0 → PG | Comparison, not source-derived transition | No equivalence asserted | `COMPARATOR_ONLY` |

For future test matrices, add:
1. immutable branch/source-state identifier;
2. source and target carrier types;
3. transition classification (`equivalence`, `refinement`, `supersession`, or `unresolved`);
4. explicit transition map and domain;
5. intermediate compatibility conditions and composition order;
6. standard comparator branch;
7. parameter/calibration ancestry and frozen holdout;
8. observable, uncertainty/covariance, and falsification threshold.

A missing transition map blocks transfer; it does not prove the branches incompatible. A verbal claim that a branch was superseded does not establish an equivalence or refinement map.

## 4. Lean 4 / Mathlib formalization

Existing isolated project reused: PR #262 infrastructure branch `infra/lean4-verification-20261023`, Lean 4.34.0 / Mathlib v4.34.0. No new tool, dependency, fork, or service.

New draft PR: #1508, `Add branch-scoped map composition gate`  
Branch: `research/enheduanna-branch-scoped-map-composition-20261109t0136z`  
Head: `8647396cb5a3ce4803720a02982bc9af1a12df96`  
Module: `FORMAL_VERIFICATION/HsHVerification/EnheduannaBranchScopedMapComposition.lean`  
Module blob: `e38901478a62cb5807b2d52978afc514250f3061`  
Root aggregator blob: `fb0da3035c9f48be7285851255d39679a2ca66c9`

The module defines:
- `BranchMap Carrier Source Target`: source/target branch indices, map, admissible source domain, target admissibility, and preservation;
- `compose`: only accepts maps with matching intermediate branch indices and requires an explicit intermediate-domain compatibility witness;
- `transportClaim`: a claim transfer requires an explicit map;
- conditional theorems `compose_preserves_target`, `transport_compose`, and `transport_identity`.

The type indices prevent composing maps whose middle branch types do not match. The compatibility witness prevents treating a merely type-correct composition as domain-valid.

**Lean status at report creation:** `LEAN_SUBMITTED_NOT_VERIFIED`. PR-triggered Actions run #42547294085 / job #128934928067 was queued, then in progress at the Lake dependency-manifest step. The compile step had not yet started. No theorem is called compiled or verified. The local runtime has no repository checkout or Lean/Lake executable. The workflow has tests, lint and the separate global axiom audit disabled; those remain separate gates even if the build succeeds.

The formalization proves only the abstract conditional map-composition contract. It does not authenticate the source messages, establish that B0/B1/B2 maps exist, prove physical equivalence, or validate any H(s)H premise.

## 5. Tool and archive checks

- HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES front doors were read; each repository was also searched independently for branch/map/source context.
- Stable Mersearch 1.0 is the preferred three-repository search, but no Mersearch connector/action or local executable is available. All four existing bridge lanes remain occupied/requested. No request was overwritten or retriggered. GitHub code search and direct raw-blob retrieval are bounded fallbacks, **not** a Mersearch run or exhaustive corpus search.
- Existing Math Hopper issue #578 / PR #991, Lean infrastructure PR #262 and relevant Lean PRs #790, #951, #1133, #1455, #873, plus Whirligig Kernel 0, were checked. The existing Aster ArchiveEQ0049 projection-coherence theorem was read and reused conceptually; no duplicate generic coherence theorem was added. SciSpace is available but unnecessary for this internal source/architecture question.
- No local repository checkout was present. The existing issue publisher is suitable for the public report; no existing Actions writer was found for an arbitrary Enheduanna workspace report. Direct GitHub connector writes are the fallback used for the draft PR and worker-local record.

## 6. Physical and project boundaries

No physical system, measured dataset, units, calibration, uncertainty/covariance, fit, numerical prediction, falsification threshold, or empirical validation was supplied or calculated. No data-free physical fixture or numerical test was created.

- P0 Code Grurple remains ACTIVE.
- P1 November 9 cognition paper remains Orson-owned / NOT READY.
- P2 November 30 measured-system geometry remains HOLD.
- P3 December 14 full-theory paper remains separate / INCOMPLETE.
- No BEDROCK, SAT-O, Blockwave, task-graph, paper-gate, or theory-status change.
- FIE rereview is due 2026-11-10, not yet performed in this run.
- Unrelated reading: HSH_RESOURCES Babbage, *Reflections on the Decline of Science in England*, lines 1521–1560 read; next cursor 1561.

## 7. Return cursor

`BRANCH_SCOPE_LOCK / B0-OCT09 → B1-KLEIN-FABRIC → B2-FOREST-++++ / MAPS-UNMAPPED / PR1508-LEAN-PENDING / NO-PHYSICAL-PREDICTION / P0-ACTIVE / P1-NOT-READY / P2-HOLD / P3-INCOMPLETE / NEXT=TERN-ROOK-OPTIONAL-CONTEXT`

Next useful operation: inspect PR #1508's exact-head CI to completion, correct any Lean errors without changing the historical source record, then obtain independent translation review. Separately, recover source-defined transition/projection maps only if the primary archive actually contains them; do not infer them from the branch names or the PG comparison.

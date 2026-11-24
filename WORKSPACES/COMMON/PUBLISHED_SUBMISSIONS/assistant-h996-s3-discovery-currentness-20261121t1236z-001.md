# H996:S3 — Discovery Snapshot Currentness and Dual-Eligibility Contract

**Run key:** `REVROT3-19-20261011:996:s3`  
**Nominal slot:** 2026-11-21T12:36:00Z  
**Deterministic ring selection:** h=996, seq=4983, index=5, Mira; successor index=6, Aldus.  
**Current run:** `124d45f8-85a8-84c2-87e3-9a6f2b55e0b0`, scheduled 12:36:00Z, started 12:38:07Z, `IN_PROGRESS` at the last scheduler readback, `chat_ref=null`. The cached latest result belongs to the preceding h995 Sable run, not this execution.  
**Automation preservation:** existing :36 task `6a9f52b69ec08191b0a2ba24a074f781` remains enabled at `DTSTART;TZID=America/New_York:20261001T143600`, `RRULE:FREQ=HOURLY`; prompt and Lane Charter 36 phase unchanged. No task was created or modified; no sixth task.  
**Participation:** assistant-level operational reconstruction. The current run has no authenticated worker-thread reference. Mira's restricted charter and private workspace were not accessed; `charter_read_performed=false`, `private_material_accessed=false`, `assignment_status=NONE`, and the payload class is `OPERATIONAL_ONLY`. A cleared shared role witness is not a signed specialist charter.

## 1. New evidence: snapshot-source currentness

The h996:s2 readback on [P0 issue #1747, comment #7062655847](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7062655847) examined an earlier discovery snapshot sourced from HsH commit `eec446c7794e2f023ba399097a25109f1b220495`. This report is a source-currentness addendum to that existing incident, not a second P0 incident. A subsequent generated-index refresh is now present on current main.

| Object | Verified value |
|---|---|
| Current HsH main | `d819682520d70826e6dc212f412b09c007e08e26` |
| Current snapshot blob (Git blob SHA-1) | `b8fd32c1f6d7977620dbedb55868f0916162b4e5` |
| Snapshot size | 29,960,301 bytes |
| Snapshot updated | 2026-11-21T12:47:49Z |
| Embedded HsH source commit | `031ccbb0e839ed7e86f605d1cdbec8d8514f059a` |
| Embedded SAT archive source commit | `d10dd333f2487054807bda398995300c538caa7e` |
| HsH and SAT source status | `complete` |
| Refresh commit parent | `031ccbb0e839ed7e86f605d1cdbec8d8514f059a` |
| Refresh commit changed paths | `PUBLIC_SITE/generated/discovery.json` only |

The refresh commit is `d819682520d70826e6dc212f412b09c007e08e26`, authored by `github-actions[bot]` at 12:47:54Z. Its sole parent is the embedded HsH source commit `031ccbb...`; its only changed path is the generated discovery JSON. Thus the current snapshot is not merely an old index being compared with a much later source tree.

Relative to the preceding 12:25:48Z snapshot, the 12:47:49Z refresh adds two HsH records and removes none: the Loom h995:s4 correction-propagation/run-identity report and its Common tagging-ledger addendum. Three existing records were updated: the clone-footprint check-ins, Loom CURRENT_WORK, and Loom CONTINUITY.

Nine relevant source/policy inputs were fetched at both the embedded source commit and current main. All nine blob IDs matched:

| Input | Git blob SHA-1 |
|---|---|
| `tools/site_discovery.py` | `97ff9c6d00544251c05bd6bb6053907805438f3e` |
| `tests/test_site_discovery.py` | `4d646dba614f50b912391c13cd516616700d2ac3` |
| `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md` | `36b2669c328466f0f579e188fbec5796d6ca44dc` |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| Paper A R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |

This is a **snapshot-source currentness witness**: the current snapshot's embedded source commit is the refresh commit's parent, and the relevant generator, tests, routing policy, presentation policy, manuscript inputs, and curated-paper index are byte-identical between that source commit and current main. The snapshot itself is the only changed file in the refresh commit. No per-record approved-derivative binding is serialized in the current discovery records.

The discovery snapshot covers HsH and the SAT archive, not HSH_RESOURCES; it is not a three-repository Mersearch result.

## 2. Current discovery projection

The snapshot contains 16,932 documents:

- 10,000 `WORKSPACES/**` records.
- 10,000 of those records have a generic `reader.html?mode=browse...` target.
- 9,763 have generated excerpts from raw source text.
- 60 workspace paper records.
- The separate display docket contains 48 entries.

Two relevant records remain in the full catalog but outside the 48-item docket:

| Record | Source blob | Reader target | Excerpt |
|---|---|---|---|
| Paper A, `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | Generic browse target present | None |
| Paper B, `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | Generic browse target present | First 1,400 cleaned characters present |

Both records are labelled `Working record`; neither is in the 48-item docket. The separate curated `papers.json` is unchanged and contains only the Cruller-Rubin sandbox R0 entry. Docket exclusion therefore does not remove a record from the full discovery catalog and does not, by itself, suppress its generic reader target.

## 3. Source-level policy mismatch, not a live-route finding

Current `tools/site_discovery.py` uses one broad `eligible(path)` predicate for discovery inclusion, emits a generic reader target for each eligible record, and creates a first-1,400-character excerpt for eligible small Markdown/text files. Its tests explicitly retain a `WORKSPACES/MERCER/**` file as discovery-eligible.

The current `READER_ROUTING_REGISTRY.md` says `WORKSPACES/**` is not ordinary default reader content unless an explicit presentation derivative nominates the artifact. `PRESENTATION_GATE.md` and `PRESENTATION_CONTRACT.md` likewise require a presentation derivative and treat raw source as secondary, not the default reader fallback.

The source-level mismatch is therefore current: the generated index serializes default reader targets for workspace records that the routing/presentation policy leaves pending. The index also emits excerpts without a separate public-safe snippet-eligibility decision.

**This does not establish that a live UI route rendered, that a browser exposed a file, or that an unauthorized person accessed anything.** Live route status remains `NOT_OBSERVED`; no authorized browser/deployment observation was made.

## 4. Architecture improvement: separate eligibility and projection maps

The new workflow improvement is to extend the existing `DiscoverySurfaceWitness` with a `SnapshotSourceCurrentnessWitness`, and keep three eligibility decisions distinct:

1. **Inventory/search metadata eligibility:** whether a source record may appear in the structural discovery catalog.
2. **Search-snippet eligibility:** whether a public-safe excerpt may be emitted. This is a separate decision, not inherited from file extension or size.
3. **Presentation eligibility:** whether an approved, current, source-bound derivative exists and may be used as a default reader target.

The maps must be explicit:

- `SourceBlob -> InventoryRecord -> optional SearchSnippet`
- `SourceBlob -> ApprovedPresentationDerivative -> Deployment -> ReaderRoute`
- `RawSourceRef` is a separate secondary affordance, never the implicit default reader map.

The required invariant is: **search-index eligibility does not imply snippet eligibility or reader eligibility**. A record may remain searchable as metadata while presentation is pending. Excerpts and default reader targets require a current source-bound derivative and a current snapshot witness. A source change preserves inventory/metadata but invalidates the old snapshot and presentation derivative; a fresh snapshot alone does not authorize presentation.

This is not a new tool or a code change. It is a source-currentness extension and explicit crosswalk between the existing discovery implementation and the existing typed presentation gate.

## 5. Existing implementation and Lean formalization

The existing [PR #2009](https://github.com/Satobloc/HsH/pull/2009) already contains the implementation direction: retain workspace metadata, suppress raw excerpts and default reader targets, mark presentation pending, and keep workspace drafts out of the curated display docket. Its body records 4/4 local tests and `py_compile` success. It remains OPEN / DRAFT / UNMERGED. Current head is `ee582b8de93f88f49445c211892529c40b47fded`; base is `d47be7cfacfa182aedaad17a9e0841eb80fdfddb`. Compared with current main, the PR head is 3 commits ahead and 3,170 behind; its changed paths are `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md`, `tests/test_site_discovery.py`, and `tools/site_discovery.py`. No exact-head PR-triggered workflow run was found. No rebase, merge, or code modification was performed.

Existing [PR #1471](https://github.com/Satobloc/HsH/pull/1471) contains the Lean 4 model `CodeGrurpleDiscoveryProjection`. Its `DiscoveryProjection` explicitly separates inventory, metadata, docket, excerpt, reader target, presentation state, derivative source/digest, and snapshot witness. It proves, among other statements:

- `metadata_visibility_requires_inventory`
- `docket_membership_requires_explicit_eligibility`
- `excerpt_visibility_requires_current_presentation`
- `reader_target_requires_current_presentation`
- `source_change_preserves_inventory_and_metadata`
- `source_change_closes_raw_excerpt_and_reader_target`
- `source_change_invalidates_old_snapshot`
- `fresh_snapshot_alone_does_not_enable_pending_presentation`
- `paper_a_snapshot_violates_projection_gate`
- `paper_b_snapshot_violates_projection_gate`

The model's `DiscoverySnapshotWitness` requires the embedded source commit to equal the refresh parent, the record source blob to equal the current source blob, and the refresh diff to contain only the generated discovery index. The h996 currentness evidence supplies a newer external witness for those premises, but the module's concrete `observedSnapshot` constants still encode a November 15 snapshot and have not been updated to h996 values.

Lean verification limits: the current PR head is `b8f76827c7766b9838b734915b7eff863d1dc747`. The available run #43705989028 checked out merge-reference commit `875a1164316b68f90b0ba93bda355a24c79e8f35`, not the exact PR head. `CodeGrurpleObservationGate.lean` built as a module at 8,931/8,947 jobs and emitted theorem-specific axiom lists `[propext, Classical.choice, Quot.sound]`. The overall library build failed in the unrelated `MovingPlaneTraceGeometry.lean` declarations at lines 72, 76, 80, 84, 96, 100 and 197 because they depend on noncomputable real division/slice definitions. Tests, lint, leanchecker, nanoda and global axiom audit were skipped. This is not an exact-head successful full build, and it does not establish the external source-to-ID translation or live route behavior.

## 6. Independent acceptance/failure matrix

| Case | Required result |
|---|---|
| Workspace draft with no approved derivative | Metadata may remain; no default reader target; no raw excerpt; presentation pending |
| Curated artifact with approved derivative | Reader target points to derivative, not raw source; source blob and derivative digest match |
| Source blob changes | Inventory/metadata remain; old snapshot/derivative invalidated; excerpt and reader target close |
| Snapshot refresh without approved derivative | Still presentation pending; no default reader target |
| Missing/revoked observation capability | No route probe and no acceptance claim |
| Live UI route | Separate authorized observation bound to exact deployment and route IDs |

For the current snapshot, the source-level acceptance condition is violated by 10,000/10,000 workspace reader targets and 9,763 raw-source excerpts, while no per-record approved-derivative binding is serialized. A future independent static test can establish repair by parsing the exact generated snapshot and finding zero default reader targets and zero excerpts for pending `WORKSPACES/**` records unless an explicit public-safe snippet and presentation approval is present. A separate authorized browser/deployment test is required before any live-route PASS/FAIL statement.

## 7. Boundaries and next authorized step

- P0 Code Grurple remains ACTIVE. PR #2009 and PR #1471 were read-only; no branch, code, test, or task was changed.
- Meridian retains implementation/repair ownership, Tern retains release authority, and Mercer retains QA; those boundaries remain unchanged.
- Mersearch was not run: all four request lanes remain requested/occupied; the Lane 2 receipt exists but is not a release, and no local pinned checkout or callable Mersearch action is available. No lane was overwritten or retriggered.
- No HSH_RESOURCES private payload was accessed. SciSpace was available but unnecessary for this repository-source audit. No new tool, dependency, fork, subscription, or expenditure.
- P1 remains Orson-owned / OVERDUE / NOT READY; P2 measured geometry remains HOLD; P3 remains INCOMPLETE. No paper gate advanced.
- No physical calculation, fit, H(s)H prediction, independent measurement, SAT-O/Blockwave equation change, or BEDROCK theory promotion.

**Next authorized step:** the P0 maintainer may update the existing PR #1471 `observedSnapshot` constants to the h996 source/refresh commits and current Paper A/B source blobs, then obtain an exact-PR-head Lean run. The authorized P0 implementation owner may rebase PR #2009, run its exact-head tests, and obtain a separate authorized live-route observation. This run does not perform either operation.

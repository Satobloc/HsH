# Enheduanna h834:s2 — third discovery-index snapshot, P0 continuity, and proof triage

**Nominal slot:** 2026-11-14T18:24:00Z  
**Run key:** `REVROT3-19-20261011:834:s2`  
**Deterministic selection:** h=834, seq=4172, ring index 11 = Enheduanna; next index 12 = Tern Rook.  
**Disposition:** `P0_DISCOVERY_POLICY_MISMATCH_PERSISTS_ON_THIRD_SNAPSHOT / EIGHT_PROTECTED_OBJECTS_EXACT / LIVE_ROUTE_UNKNOWN / NO_DUPLICATE_PUBLICATION / NO_PHYSICAL_RESULT`

## 1. Identity and historical authority

The Enheduanna label is a deterministic revival-ring address, not an authenticated ChatGPT identity or thread.

The workspace README, BOOT, source-layer census, and historical source pointer were checked. The only located direct Nathan instruction is MARLOWE raw-conversation user message `11399ca2-5bd6-4203-9e19-e8e044fbc736`, in conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`. It gives broad archive-revival guidance ("consider all archives"), not a detailed technical charter. No standalone Nathan-authored Enheduanna specialist charter and no authenticated currently usable Enheduanna thread were recovered. The current source-recovery/provenance role is an assistant-maintained operational synthesis, not a signed charter.

No historical-person emulation, continuity claim, or direct-thread delivery is asserted.

## 2. Controls and repositories read

The following live HsH controls were fetched from `main`:

| Control | Blob |
|---|---|
| `BEDROCK.md` | `0253ace674bbc361464b7bbaac2c41aa3d8e8867` |
| `STATE_OF_THE_THEORY.md` | `2614c8a0273632083ac9a6d2892f956636d913e0` |
| Steering Charter 2026-10-26 | `be44c424674764c602b5f618dfce528c0f97b0ef` |
| Three Paper Campaign | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| Three-repository onboarding | `fe40260cda5ce360909f2adfd64a3cc3e2c92a05` |
| Nathan Direct methodology/model overview | `a8e333b1d5b5aa1d9772366945dd88769d24153c` |
| Revival Rotation V3 | `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14` |
| V4 not-found revival control | `6761337dfcd0847226ee7baad84db0a9c496760a` |
| Thread-routing rule | `d9ea7c3a04e03822c65ee231d0b9545bf37907bd` |
| Worker upkeep/priority protocol | `e43002b54ca211e563a02b37f6e07fdfb9b45ed0` |
| Task branch graph | `4ee79fa0a30fedb1feffd0a92c2716f87a365670` |

The HsH main head at the source snapshot was `12f1eee4aa4b8f627dfe75832ee07510890c6488`.

The SAT archive root README was read. HSH_RESOURCES metadata/README were checked; the repository metadata reports public visibility while its README describes a private/internal reference boundary. Only the root README was read. No HSH_RESOURCES payload was opened.

## 3. P0 Code Grurple: protected sources remain exact

All eight protected Paper A/B source/control objects were fetched from current `main` and matched their pinned expected blob IDs:

| Object | Current blob |
|---|---|
| Paper A accepted R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B reviewed R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| `PUBLIC_SITE/PAPERS_FEED.json` | `e3552fdac0f187b066b59a9742563094efffe011` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| Conversation Viewer/Whirligig Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

Result: **8/8 exact pinned blob matches**. The established aggregate fingerprint was not independently recomputed in this pass.

The ordinary papers index still contains only the Cruller-Rubin entry. The papers feed remains dated 2026-10-21: Paper A is `sandbox_staged_accepted_r1` with no `site_version` and null `posted_date`; Paper B is `sandbox_posted_reviewed_r1` with historical `site_version=34` and `posted_date=2026-09-23`. These are feed metadata, not current deployment or live-route evidence.

## 4. New readback: third discovery-index snapshot

The actual GitHub API contents endpoint was used to fetch and parse the current generated discovery index, rather than relying on search snippets.

- File: `PUBLIC_SITE/generated/discovery.json`
- Blob: `c56c8cf18a2821cdb9ac2c9e16ff94ce3175e0ec`
- Snapshot updated: `2026-11-14T18:21:37Z`
- HsH source commit recorded inside the snapshot: `8bc5051a9fc178f7fe397083fc5f3e339246601d`
- Documents: **14,785**
- Rolling docket: **48**
- Excerpt errors: **6**

Both pending Code Grurple R1 records remain in the full searchable `documents` catalog:

| Field | Paper A | Paper B |
|---|---|---|
| Source | `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` |
| Source blob | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Index status | Working record | Working record |
| Default reader target | Raw workspace path via `reader.html?mode=browse` | Raw workspace path via `reader.html?mode=browse` |
| Raw excerpt | None | 1,400 cleaned characters |
| In 48-item docket | No | No |

Neither target is in the 48-item docket. `PUBLIC_SITE/generated/papers.json` still excludes both. This is the **third time-separated snapshot** (17:37, 17:57, 18:21) from the same automatic discovery pipeline, not three independent evidence channels.

### Source logic still permits the records

Current `tools/site_discovery.py` remains blob `97ff9c6d00544251c05bd6bb6053907805438f3e`:

- `eligible(path)` accepts the configured `.pdf`, `.md`, `.txt`, `.tex`, and `.json` extensions and excludes only the configured exclusion regex, generated paths, and hidden path components. It does **not** exclude `WORKSPACES/PAPERS/**`.
- `route(repo,path)` generates a `reader.html?mode=browse` target for each eligible record.
- `excerpt()` permits Markdown/text files up to 128,000 bytes and returns the first 1,400 cleaned characters.
- The bounded docket is separate from the complete searchable inventory.

Current `tests/test_site_discovery.py` remains blob `4d646dba614f50b912391c13cd516616700d2ac3`; it explicitly expects a `WORKSPACES/MERCER/...` document to be eligible and has no Paper A/B pending-source regression case.

The current [Automatic Discovery](../../PUBLIC_SITE/AUTOMATIC_DISCOVERY.md) contract says the full catalog remains searchable, the site consumes the index without a Sites redeployment, and open pages refresh every five minutes. The unchanged Reader Routing Registry says `WORKSPACES/**` is not ordinary reader content absent an explicit presentation derivative and that a manually constructed URL must not bypass the default-deny rule. The Presentation Gate and Contract likewise prohibit raw Markdown/TeX as default reading content.

**Disposition:** the source-layer discovery/reader-policy mismatch persists. This is not a confirmed live raw-display incident. The separate reader application may enforce a downstream guard, but its behavior remains UNKNOWN. The Browser connector returned “access requires the originating browser context”; no live route probe was performed. No site, reader, index, manuscript, feed, or PDF was modified.

Existing public [issue #1747](https://github.com/Satobloc/HsH/issues/1747) already covers this finding. Its published artifact and issue envelope were independently compared byte-for-byte and SHA-256 recomputed:

- Publisher comment: `#6881766930`
- Artifact blob: `c11b99ca1176dde239d8b216ebd4bd3c8ed9f44d`
- Bytes: 12,276
- SHA-256: `487690d3c4f388a3c3bbf86d3d72ff7a8d2d6f98fd939ee3bcc284e43831c657`
- Exact issue-envelope/artifact equality: PASS

No new public issue, comment, submission, retry, or duplicate was created.

## 5. Existing Enheduanna publication custody

The preceding boundary-provenance report [#1741](https://github.com/Satobloc/HsH/issues/1741) was also independently re-read:

- Artifact blob: `04c21506861c2d495cf7db091dac1b8b7d1a1dbf`
- Bytes: 9,540
- SHA-256 recomputed: `45b1527316110adce7e160416846a306ae8c5ebbe718ccfccc174c1e78bfc378`
- Exact issue-envelope/artifact equality: PASS
- Publisher comment: `#6879254591`

This confirms the existing h830:s3 publication; it is not a new submission.

## 6. Proof-first triage: preserve the distinction between two boundary statements

The published h830:s3 report proposes the relative-topology inclusion

`∂_Σ(Section ∩ Window) ⊆ (∂_Σ Section ∩ cl_Σ Window) ∪ (cl_Σ Section ∩ ∂_Σ Window)`.

Under the ordinary topological definitions, the proof is conditional and short: closure monotonicity gives `cl(A ∩ B) ⊆ cl(A) ∩ cl(B)`; `int(A ∩ B)=int(A) ∩ int(B)`; a point on the boundary of the intersection is therefore in both closures and outside at least one interior. It belongs to the corresponding boundary/other-closure term. This is a topology lemma, not a physical H(s)H equation, not a claim about which physical boundary produced an observed edge, and not a smooth-face/corner equality theorem.

The existing Enheduanna [PR #1594](https://github.com/Satobloc/HsH/pull/1594) is a **different** conditional formalization:

- Branch: `research/enheduanna-sweep-boundary-contract-20261111t1036z`
- Head: `136071f6b0665d28a4a77611712a53aeca74fe8c`
- Module: `FORMAL_VERIFICATION/HsHVerification/EnheduannaSweepBoundaryGate.lean`
- Module blob: `8a3fccff88129be151458fe0452ea79f9abd016f`
- Existing verify run: [#43006069897](https://github.com/Satobloc/HsH/actions/runs/43006069897), job `verify`, conclusion SUCCESS.

That module formalizes a typed `SweepBoundaryContract` whose product-boundary/Stokes identity is an explicit premise, then proves conditional endpoint/side conservation consequences. It explicitly does not construct a smooth flow, immersion, embedded worldsheet, distributional current, Poincare-dual representative, metric, or physical H(s)H identification. It does **not** formalize the Section/Window boundary inclusion above.

The Aster claim-origin bridge at issue #1746 and Ariadne h832:s4 QC already cover the proposed claim-origin witness and its refinements. No duplicate witness, theorem, PR, or CI run was created.

Local `lean`, `lake`, `elan`, and a local Mersearch checkout/executable are absent. No authorized Actions-dispatch writer was available. Therefore the Section/Window inclusion was **not** compiled or run in this activation. The successful PR #1594 build is not evidence for that separate inclusion, its translation, or any physical premise.

## 7. Mersearch, priority, and project controls

All four canonical Mersearch requests remain `requested`. Their request-scoped directories are absent (404); no manifests/results/receipts were found. No callable Mersearch action or local pinned checkout exists. GitHub source inspection is not represented as Mersearch. No request was overwritten, retriggered, released, or duplicated.

Current priority read:

- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY; Orson-owned.
- P2 measured geometry: HOLD; no system selected.
- P3 full theory: INCOMPLETE.
- FIE next rereview: 2026-11-24.

WH-05 remains highest overall but blocked by the four occupied Mersearch lanes. WH-02 remains the highest-priority unblocked maintenance item and its code/rebase action remains Calder/authorized-maintainer-owned. The 2026-11-14 15:56 America/New_York queue cutoff had not yet been reached at this run's time; no premature P1/HIGH escalation was applied.

The graph remains 16 declared branches versus 18 actual records (12 active, 5 completed, 1 blocked). The graph's P2 node remains marked active while the current queue says HOLD. Tern retains graph/queue authority; no graph or queue edit was made.

## 8. Unrelated reading and return cursor

Read Charles Babbage, *Reflections on the Decline of Science in England*, Project Gutenberg #1216, public HTML lines **543–582**. Babbage argues that coarser recording increments can create greater apparent agreement; he contrasts transit observations recorded at different temporal resolutions. This is an unrelated historical reading, not modern measurement evidence or a validation of any current instrument.

**Next cursor:** line 583.

FIE remains on its existing November 24 rereview date; no premature rereview or physical break is claimed.

## 9. Final boundaries

No measured physical system was selected. No raw data/calibration/covariance/holdout was acquired. No physical calculation, CODATA comparison, fit, prediction, independent measurement, SAT-O/Blockwave equation modification, P2 selection, paper-gate advancement, or BEDROCK theory promotion occurred.

No site or PR code was changed. No public submission was duplicated. No task, ID, prompt, schedule, phase, cadence, enabled state, task count, or ownership was changed. No sixth task was created.

**Next useful action belongs to Tern/P0 ownership:** decide whether the discovery builder should make pending workspace manuscripts metadata-only (no raw excerpt and no default reader target), or whether a downstream reader guard can be independently demonstrated to enforce the same default-deny contract. Any live route PASS requires an authenticated browser readback and deployment/build identity; the repository index alone cannot supply it.

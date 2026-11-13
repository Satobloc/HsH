# Mercer h793:s3 — P0 dual-anchor source-binding revalidation

**Classification:** INTERNAL P0 PRESENTATION QA / SOURCE IDENTITY VERIFIED / READER ROUTES NOT OBSERVED / NO STANDDOWN.

**Run key:** `REVROT3-19-20261011:793:s3`  
**Nominal slot:** 2026-11-13T01:36Z  
**Selected deterministic label:** Mercer, ring index 16  
**Next deterministic label:** Ravel, ring index 17  
**Current HsH branch:** `main`  
**Pre-write HsH main:** `383a11579735bd5c5f7d7ec76f9128f23e240b3d`

## 1. Authority and scope

The fixed-ring calculation is (h=793), (seq=5h+3=3968), and (3968\bmod19=16). The next ring index is 17. These are deterministic labels, not authenticated ChatGPT identities.

The original Mercer source was recovered from:

- `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/26.06.23•26.10.01•Quantum Gravity and Experiments — raw.json`
- Conversation: `6a3a2037-3698-83ea-924d-2cb8c4ac7701`
- Raw Git blob: `d828fef5352045cb4d9486fdbeabd04043c4c119`
- 44 mapping entries; 8 user-role messages.
- Direct role message: `bb8ecf64-8863-4ee7-a078-ca8cc4104974`, 2026-10-01T20:56:07.264Z.

The historical :48 remit covers equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences, with an archive-reading/source-provenance practice. It is historical authorization, not proof of a current Mercer thread. A bounded personal-context search did not establish a currently usable Mercer Free Build conversation ID. The automation conversation is not Mercer identity authentication.

The controlling Code Grurple roster currently narrows Mercer to **Paper A+B presentation QA only** while P0 is active. No manuscript content, site, renderer, route, deployment, P1/P2/P3 or theory work was undertaken.

## 2. Substantive improvement: dual-anchor source binding

The P0 source check was strengthened from a main-branch/feed comparison to a three-way, source-ref-aware identity check for each paper:

`feed.manuscript_blob = blob(main, manuscript_path) = blob(manuscript_ref, manuscript_path)`.

For both papers, the feed's pinned blob equals the current-main source blob and the blob fetched at the exact commit named by `manuscript_ref`. This detects a stale or mispointed source-ref commit that a main-only hash comparison would miss.

This is an added **diagnostic provenance check**, not a new Code Grurple acceptance requirement and not evidence of a compiled derivative or live route.

| Paper | Current-main blob | Blob at feed's manuscript_ref | Feed manuscript_blob | Result |
|---|---|---|---|---|
| A, TeX | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | Exact match |
| B, Markdown | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | Exact match |

Feed commit references:

- Paper A: `58b0ed9c19c8dba123846c411d4ac8b7db5c0df9`
- Paper B: `731e2fb5888b0aec856fd9e31319c39746514239`

The exact source files were fetched independently at both `main` and the feed's commit reference. No manuscript file was edited.

## 3. Fresh eight-file P0 fingerprint

Compared the previous P0 baseline `8dc33c17b11cf083a6b8d3e5011b2e4c016a0739` with current main `383a11579735bd5c5f7d7ec76f9128f23e240b3d`:

- 148 commits ahead, 0 behind.
- 93 changed paths.
- 0 changes to the eight protected P0 paths.
- All eight current blobs exactly match the established protected vector.

| Protected path | Current Git blob |
|---|---|
| `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| `PUBLIC_SITE/PAPERS_FEED.json` | `e3552fdac0f187b066b59a9742563094efffe011` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| `.github/workflows/deploy-conversation-viewer-pages.yml` | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

Ordered path-tab-blob vector SHA-256:  
`833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`.

The only latest-main commit inspected directly, `383a115`, refreshes Conversation Viewer catalog/discovery/manifests. It does not change a protected P0 path.

## 4. Feed, derivative and deployment state

The current feed blob is `e3552fdac0f187b066b59a9742563094efffe011`, updated 2026-10-21.

| Field | Paper A | Paper B |
|---|---|---|
| Feed status | `sandbox_staged_accepted_r1` | `sandbox_posted_reviewed_r1` |
| Site display | `sandbox_manuscript` | `sandbox_manuscript` |
| Feed site version | absent | 34 |
| Feed posted date | absent | 2026-09-23 |

The feed's B version/date are historical metadata, not current deployment identity. A feed/card entry is not route acceptance.

The generated paper index currently contains only `cruller-rubin`; neither A nor B is registered as a presentation derivative. The current `.github/workflows/deploy-conversation-viewer-pages.yml` does not watch `PAPERS_FEED.json`, `WORKSPACES/PAPERS` or `paper.html`. It is the Conversation Viewer/Whirligig deployment path, not the required legacy A/B reader deployment.

The site development work log records the 2026-11-02 corrective rollback to the original Viewer workflow and a narrow Whirligig-only backend. Rebuilding the entire Glass Sausage Factory was explicitly identified there as an unauthorized scope expansion. No migration or replacement reader was attempted.

The two feed URLs still name the legacy ChatGPT Sites host:

- `https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=convergent-motifs-r1`
- `https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=boundary-weak-emission-r1`

No authenticated originating browser context, Sites editor/deployer, owner preview, renderer/config identity, derivative PDF digest or deployed build identity was available. Under the standing no-repeat rule, no route probe was made without a new capability or source trigger.

## 5. Acceptance matrix and falsification boundary

The controlling roster requires both actual routes to pass:

1. headings and paragraphs render as document typography, not source markup;
2. inline and display mathematics render;
3. citations, references and links remain legible and usable;
4. long equations, references, URLs and narrow/mobile widths remain usable;
5. SANDBOX classification and review/provenance affordances remain visible;
6. Paper A is the accepted R1 blob;
7. Paper B is the reviewed R1 blob.

| Predicate | Paper A | Paper B |
|---|---|---|
| Source pin / current-main blob | VERIFIED | VERIFIED |
| Feed path/blob binding | VERIFIED | VERIFIED |
| Feed manuscript_ref commit resolves to same blob | VERIFIED | VERIFIED |
| Format adapter/parser identity | NOT OBSERVED | NOT OBSERVED |
| Presentation derivative + content digest | NOT OBSERVED | NOT OBSERVED |
| Deployed build identity | NOT OBSERVED | NOT OBSERVED |
| Live route readback | NOT OBSERVED | NOT OBSERVED |
| Seven-point visual/interaction acceptance | NOT OBSERVED | NOT OBSERVED |

Both routes remain **PRESENTATION_PENDING / NOT_OBSERVED**, neither PASS nor FAIL. P0 remains ACTIVE; standdown is not satisfied. No new route failure is claimed.

## 6. Formalization reuse and limits

Existing [PR #1471](https://github.com/Satobloc/HsH/pull/1471) already models typed source/feed/adapter/derivative/deployment/route identities and a separately granted observation capability. Its current head is `206cb9b1bb5349bba6aaad031d2a8b578c25197b`; module blob `ae363d6b17d22a1d89ee6ab7bf6405f31e260941`.

Existing Actions run [#42667731836](https://github.com/Satobloc/HsH/actions/runs/42667731836), job #129335772337, completed successfully: Lean 4.34.0 / Lake 5.0.0, full root build 8,945 jobs. The log's checked-out source commit is `cd2e5a391483cc8a8d2f52e136e5fa7d2db52f0e`, a merge-reference build, not an exact-head standalone run. Relevant theorem-specific axiom reports include `[propext, Classical.choice, Quot.sound]`; `github_pages_ne_chatgpt_sites` reports no axioms.

The existing model does not represent the feed's `manuscript_ref` commit-to-blob resolution as a separate field. The new dual-anchor result is an external GitHub data check; it is not formalized by PR #1471. No new Lean theorem, build, PR, branch or code change was made. Lean's abstract transition system does not establish actual PDF content, deployment, browser access or live route rendering.

## 7. Mersearch, repositories and reading

The Mersearch worker guide and pinned stable release were read. The actual four Common bridge request files remain occupied/requested:

1. `calder-angle-geometry-source-fidelity-20261102-1337`
2. `archive-harvest-20261025-optics-01`
3. `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
4. `kestrel-finite-core-geometry-source-fidelity-20261102-2200`

No request was overwritten or retriggered. No local checkout exists, so no pinned local Mersearch run was possible. GitHub source retrieval was used for known paths and is not represented as a Mersearch search.

HsH, SAT archive and HSH_RESOURCES front doors were read. The SAT archive file `SAT Mark V/TheTANGLE.txt`, lines 1801–1880, was read as the required unrelated archival pass; next cursor 1881. It is not theory evidence. HSH_RESOURCES was limited to its public front door; no private payload was copied or exposed. No physical break is claimed.

The task graph remains ACTIVE_SEED, 16 declared branches versus 18 records; Tern retains reconciliation authority. FIE was last reviewed 2026-11-10; next review 2026-11-24.

Campaign gates remain separate:

- P0 Code Grurple: ACTIVE.
- P1 cognition, Nov 9: OVERDUE / NOT READY; Orson-owned.
- P2 geometry, Nov 30: HOLD.
- P3 full theory, Dec 14: INCOMPLETE.

## 8. Execution and write disposition

The current :36 automation remains enabled with its exact original task ID and hourly America/New_York :36 VEVENT. Current run `9590ff51-0a90-832e-928e-13c50784631e` is IN_PROGRESS, scheduled 01:36Z and reported started 01:32:57.659769Z; completion and run-level chat_ref are null. Cached latest_result belongs to prior Enheduanna h792:s3 run `8f1d0e76-94a4-8323-8da7-6cb0d36ed208`, not this run.

No local checkout and no approved generic internal workspace writer were available. The issue publisher is fixed-destination public-safe output, and the paper-series workflow only updates the generated paper index; neither is suitable for operational receipts/inboxes. The GitHub Contents API was therefore used only as the documented fallback, with fresh blob-SHA compare-and-swap on semantic files and exact readback.

No public issue was created: this is internal P0 QA, not a public research result. No task, ID, schedule, phase, cadence, prompt, branch, ownership, manuscript, feed, gate, renderer, site or theory state was changed. No sixth task was created.

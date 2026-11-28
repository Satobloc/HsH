# Workshop Relay h1163:s3 — queued discovery refresh source-cut race

**Nominal slot:** 2026-11-28T11:36:00Z  
**Run key:** `REVROT3-19-20261011:1163:s3`  
**Selected routing label:** Alberr (ring index 4); next Mira (index 5). Routing is not worker/thread authentication.  
**Disposition:** `SOURCE_REPRODUCTION_VERIFIED / INVENTORY_COMPARE_VERIFIED / LEAN_VERIFIED / P0_PRESENTATION_SAFETY_FAIL`

This is assistant-level source-grounded execution. No authenticated current Alberr thread was established; no scheduled-task conversation association is treated as proof of a live Alberr thread.

## 1. Routing and autonomy boundary

The selected ring label is Alberr, but the controlling [Alberr workspace README](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALBERR/README.md) says historical source recovery is not live-thread reentry or task acceptance; manual reentry is required; current authenticated thread is not established; current task/lease/review/response obligation is NONE; and autonomy is TOTAL. It explicitly states there is no mandatory specialist, productivity quota, first-blush requirement, theory test, or obligation to produce a project result. No standalone signed Nathan-authored specialist charter is established.

Accordingly, this is assistant-level shared Lane 36 workflow work, not Alberr participation or an assignment to Alberr. No Alberr workspace pointer or inbox was changed. The next ring label is Mira, but Mira remains under the Code Grurple quarantine interlock; no Mira workspace was opened or written. No direct-thread delivery, consumption, acknowledgment, or ownership transfer is claimed.

## 2. Fresh queued-refresh reproduction

The existing `.github/workflows/refresh-site-discovery.yml` checks out moving `main`, not the immutable push-event SHA, then commits the generated index and uses `git pull --rebase origin main` before push. Its concurrency group has `cancel-in-progress: false`.

Two queued push runs on 2026-11-28 provide a fresh reproduction:

| Run | Event head | HsH commit actually scanned | Generated commit |
|---|---|---|---|
| [#46140706288](https://github.com/Satobloc/HsH/actions/runs/46140706288) | `d17f6c83834e4709160d239e2ac2edf1e520fda5` | `8685328408a0c2133d38d635ee56db0b61def3f7` | `d0a04b5dc3131f637936854a445752db7e328935` |
| [#46140762348](https://github.com/Satobloc/HsH/actions/runs/46140762348) | `8685328408a0c2133d38d635ee56db0b61def3f7` | `d0a04b5dc3131f637936854a445752db7e328935` | `e166676cb1849dc49b20076936a537e942ef435c` |

Both jobs completed SUCCESS. The first generated commit's direct parent is `868532...`; the second generated commit's direct parent is `d0a04...`. The second run's embedded HsH source cut is `d0a04...`, not its triggering event head `868532...`. Both generated commits changed only `PUBLIC_SITE/generated/discovery.json`.

The second run therefore scanned the first generated-only commit. This is confirmed by its Actions job log, embedded source field and Git parent—not inferred from counts. At this audit cut, main was `e166676cb1849dc49b20076936a537e942ef435c`, whose direct parent is `d0a04b5dc3131f637936854a445752db7e328935`.

### Exact snapshot comparison

The two immutable discovery blobs were fetched and parsed:

- `9ffe310e8a4bd6661980de381ffe65fee204858b`, updated `11:38:08Z`.
- `e07fcafced9308598ceaba8d71f05e325f35d885`, updated `11:39:39Z`.

Both contain 18,418 documents, 48 docket entries, 577 visual records (417 square), six excerpt-decoding errors, and complete HsH/SAT scan statuses.

Comparison results:

- Sorted document inventory `(repo,path,blob_sha,size)`: **equal**.
- Sorted visual inventory `(path,blob_sha,width,height,square)`: **equal**.
- Document IDs: **equal**.
- Error sets: **equal**, although array order differs.
- Four `revision_detected` flags reset from true to false while their source blob SHAs remained unchanged.
- `updated`, HsH source commit and `checked_at` changed.

The four transient-flag changes affect the Ariadne h1163:s2 receipt/amendment, Loom h1163:s0 publication, and Ariadne h1163:s2 published artifact. The current JSON mixes durable inventory, transient revision flags and scan diagnostics. These comparisons do not establish equality of a complete future `PublishedKey`; they show why the key/receipt boundary must be explicit. A no-op key must either include every output-determining field or move transient scan state into a separate receipt.

This is a new live reproduction of the source-head self-reference amplification already described in Calder PR #2562 and Hale h1103. It is not a new root-cause class.

## 3. Architecture improvement: event/checkout/publication witness

The verification contract now distinguishes:

1. `event_head`: immutable push-trigger SHA; for scheduled runs, main captured at run start.
2. `checkout_head`: commit actually checked out and scanned.
3. `generated_parent`: direct parent of the generated snapshot commit.
4. `generated_commit`: the snapshot commit.
5. `current_main`: branch head at independent final readback.

For a source-bound publication:

\[
checkout\_head=event\_head,\quad
generated\_parent=checkout\_head,\quad
current\_main=generated\_commit.
\]

A queued run must not silently substitute a newer moving `main` for its event head. If the branch advances, it must establish a validated content-key no-op or abort/recompute with a new scan receipt. Rebasing generated output onto a different source cut without updating and revalidating provenance is not acceptable.

The `PublishedKey`/`ScanReceipt` separation in Calder PR #2562 remains useful. The content key must cover eligible document and visual inventories and all transformation inputs. The receipt should preserve event head, checkout head, repository heads, scan time, completeness, diagnostics and publication parent. Thumbnail sidecars and carried-forward prior state require independent integrity checks.

## 4. Lean formalization

Created draft child [PR #2757](https://github.com/Satobloc/HsH/pull/2757), stacked on Calder's [PR #2562](https://github.com/Satobloc/HsH/pull/2562). The PR title/body were corrected to shared-workflow scope after deterministic ring-index recheck; its branch slug retains an earlier mistaken Hale label but is not worker attribution. It adds `HsHVerification.DiscoveryEventCheckout` and imports Calder's existing `PublishedKey`.

The `RunWitness` contract proves:

- safe publication implies generated parent equals event head;
- safe publication implies current main equals the generated commit at readback;
- equal published keys do not imply event-head binding;
- source-cut binding alone does not imply current-at-readback;
- current-at-readback does not imply event-head binding.

The first exact-head attempt, [run #46141399707](https://github.com/Satobloc/HsH/actions/runs/46141399707), failed because Lean could not synthesize `Decidable` for three negated witness predicates. The definitions were unfolded explicitly with `simp` and the branch was corrected. Current exact PR head: `38493c9978cb9af440d3fa7d9164e7bc614a0abb`; new module blob: `c1be7d38407bab10e67d907fae7548b89c4109e8`. The corrected exact-head [run #46141714807](https://github.com/Satobloc/HsH/actions/runs/46141714807) completed SUCCESS. Lean 4.34.0 / Lake 5.0.0; the full verification root built 8,949 jobs; the new module built at 8,947/8,949 and the root aggregator at 8,948/8,949. The main parent-binding theorem reports no axioms; the three counterexample theorems report `propext` only. No `sorryAx` appeared in the inspected theorem outputs. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped.

Commit identifiers are abstract `Nat` tokens. Lean does not authenticate GitHub events, source inventory, JSON, branch state, or translation to the live workflow. This is a software-contract theorem, not an H(s)H physical theorem. PR #2757 is OPEN / DRAFT / UNMERGED; no main or production workflow change was made.

## 5. Current P0 record-level witness

The second snapshot was parsed in full (33,112,983 characters in the decoded JSON response). It contains 11,462 `WORKSPACES/**` records:

| Check | Result |
|---|---:|
| Workspace records | 11,462 |
| Generic reader targets | 11,462 |
| `presentation_state` fields | 0 |
| Excerpts | 11,214 |
| Workspace records in 48-item docket | 48 |

Paper A R1 source `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` and Paper B R1 source `0a1dca42cafd9a02faceff4ec0851659a317b2bb` both remain in the discovery catalog with generic raw-workspace reader targets. Paper B has a bounded excerpt; Paper A does not. Neither appears in `PUBLIC_SITE/generated/papers.json`, whose nine entries are separate historical compilations and the Cruller-Rubin sandbox record.

The source-level presentation defect is directly visible in the generated records. The reader-routing registry's default-deny rule is not implemented by the current generator.

Unchanged release boundary: source-level presentation safety **FAIL**; Paper A/B live routes **NOT_OBSERVED**; deployment **NOT_VERIFIED**; release/standdown **NOT_AUTHORIZED**. No live route, visitor rendering, deployment or release action was performed. The snapshot does not establish actual visitor exposure.

## 6. Governance and periodic work

The latest PWH deep review is Tern h1138:s3, [issue #2679](https://github.com/Satobloc/HsH/issues/2679). It records the canonical PWH queue cursor still at h1081:s3 and the task graph at 18 records / 16 declared branches (5 completed / 12 active / 1 blocked). Tern retains queue/graph authority; the P0 interlock blocks those writes. The h1138 review set the next trigger at five further run-bound completed products. This run does not independently adjudicate that count or modify the queue/graph.

- Code Grurple remains active; Meridian owns implementation, Mercer independent A/B QA, Tern release authority.
- P1 cognition remains overdue/frozen/Orson-owned. No model calls, human sessions, API expenditure or protocol change.
- P2 November 30 remains HOLD; no measured system was selected or analyzed.
- P3 December 14 remains incomplete.
- FIE last reviewed November 24; next due December 8.
- Unrelated-source break completed in this run: SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 2401–2440. It contains a historical assistant-generated, explicitly tentative Proto-Germanic/Old English/German/Norse “water” comparison and a user request about Langobardic and Visigothic. No linguistic claim was promoted. Next cursor: line 2441.
- All four Mersearch lanes remain occupied/requested; no query, retry, overwrite or release. No private HSH_RESOURCES payload was opened.
- Existing Math Hopper #578/PR #991, Lean PR #2562, Whirligig Kernel 0, SciSpace connector and existing workflow were checked. No new tool, dependency, fork, subscription or expenditure.
- The archive-reading break is complete; no physical off-screen movement is claimed by this cloud execution.
- No SAT-O/Blockwave equation changes, manuscript edits, theory promotion, physical calculations, fits or predictions.

## 7. Scheduler and next cursor

The existing :36 Worldtube task remains enabled with its exact task identity, hourly schedule and phase unchanged. No sixth task, task mutation, signet or conversation rename.

Next ring label: Mira. Mira remains under the Code Grurple quarantine interlock; only cleared operational information may cross. No Mira workspace/private material was opened, no inbox write was made, and no direct-thread delivery or acknowledgment is claimed. No assignment or ownership transfer is created.

**Next technical cursor:** use the event/checkout witness to specify event-head pinning and no-rebase publication semantics in the existing discovery pipeline review. Keep the PublishedKey/ScanReceipt split, but include visual inventory, transient revision flags, diagnostics and cache integrity in the source-to-output mapping. Do not alter the P0 implementation branch or declare route acceptance.

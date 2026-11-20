# Mercer h979:s4 | Paper A/B presentation QA snapshot

**Run key:** `REVROT3-19-20261011:979:s4`  
**Nominal run:** 2026-11-20T19:48:00Z  
**Actual execution start:** 2026-11-20T19:52:11.164568Z  
**Repository snapshot:** `Satobloc/HsH` main at `e9fc93b584b09750e5f87a0c37bf4bc5583bc022`  
**Disposition:** SOURCE_AND_FEED_IDENTITY_VERIFIED / PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED

## Scope and authority

Mercer was selected by the fixed ring at index 16; Ravel is next at index 17. The historical direct-user role message assigns Mercer equations, dimensional analysis, constitutive physics, coarse-graining, forces, and quantitative consequences. No standalone signed Mercer charter or authenticated current Mercer conversation was established. The current Code Grurple roster is the controlling lane assignment: Mercer performs Paper A and Paper B presentation QA only while P0 is active. This run did not reopen manuscript content, edit a manuscript, change a site, or take ownership of P0 standdown.

## Source identity and eight-object control vector

Both current R1 source blobs exactly match the commits pinned by `PUBLIC_SITE/PAPERS_FEED.json`:

- Paper A TeX: source commit `58b0ed9c19c8dba123846c411d4ac8b7db5c0df9`; blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B Markdown: source commit `731e2fb5888b0aec856fd9e31319c39746514239`; blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.
- Current feed blob: `e3552fdac0f187b066b59a9742563094efffe011`.

The eight protected P0 objects were re-read at the main snapshot above:

| Object | Blob |
|---|---|
| Paper A R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Papers feed | `e3552fdac0f187b066b59a9742563094efffe011` |
| Presentation gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Reader routing registry | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| Presentation contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| Generated PDF-series index | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| GitHub Pages viewer/Whirligig workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

The feed entries remain `sandbox_staged_accepted_r1` for Paper A and `sandbox_posted_reviewed_r1` for Paper B. Paper A has no posted date or site version. Paper B records site version 34 and posted date 2026-09-23. Those fields are metadata, not current route readback.

## Source-side semantic signatures

These are checks of source structure, not tests of the rendered pages.

**Paper A (146 lines):** 10 section commands (9 unstarred plus References), 4 subsections, 5 paragraph headings, 2 equation environments, 4 inline math spans, one table with five rows, 11 manual references, and the expected sandbox watermark/box. No citation, cross-reference, figure, URL, or bibliography macros were found. The source's `\mathcal R_{4}` placeholder remains undefined; no map or conditions are supplied.

**Paper B (137 lines):** 17 Markdown headings (2 H1, 11 H2, 4 H3), 2 blockquote lines, 6 B0-B5 control items, 2 inline math spans, 3 display-math blocks, and 10 numbered references. No dollar-delimited math, fenced code, Markdown tables, inline links, or HTML tags were found.

The source-defined observable `\Delta R_D(G_i,G_j)=R_D(G_i)-R_D(G_j)` is a definition, not a theorem. The following flux integral is a model equation whose measures, domains, units, source spectrum, and detector model are not fully instantiated in this draft. The Meridian h979:s3 semantic-anchor report is now published as issue [#2220](https://github.com/Satobloc/HsH/issues/2220), with publisher confirmation #7049143071 and exact artifact readback. Its anchors are source-side expectations only; they do not establish renderer behavior.

## Presentation chain and live-route state

The current Presentation Gate and Reader Routing Registry remain default-deny: raw TeX/Markdown, feeds, manifests, workspaces, and control files are not ordinary reader documents. A reader derivative must preserve source identity and be independently checked for typography, mathematics, references, page bounds, and navigation.

The separate generated PDF-series index contains only `cruller-rubin`; it is not an A/B reader. The current GitHub Pages workflow deploys the Conversation Viewer and Whirligig routes, not the separate `glass-sausage-factory` ChatGPT Sites pages. The site-development log records the earlier rollback to the Viewer/Whirligig-only backend and states that the separate Sites surface cannot be published from this GitHub connector session.

Required routes:
- [Paper A](https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=convergent-motifs-r1)
- [Paper B](https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=boundary-weak-emission-r1)

The two feed URLs were opened once with the available web reader, which returned no page content. This is **not** a route pass or route failure. No authenticated Sites editor/browser route readback was available. Both required routes therefore remain `PRESENTATION_PENDING / NOT_OBSERVED`; Grurple standdown is not satisfied. Canonical P0 issue [#1747](https://github.com/Satobloc/HsH/issues/1747) remains OPEN.

## Exact-head verification correction

PR #1471 head is `b8f76827c7766b9838b734915b7eff863d1dc747`. Actions run #43705989028 has the same `head_sha` and the same PR head SHA, so it is an **exact-head** run, not a merge-reference run as previously described. Its `verify` job failed at `Install Lean and compile formal library`. This is a correction to prior reporting. It is not a live-route test and does not establish a presentation result.

PR #1471 remains OPEN / DRAFT / UNMERGED. No retry, rebase, merge, PR edit, or code change was made.

## Formalization and physical-evidence triage

Paper A's comparison expression is a synthesis object; the unresolved `\mathcal R_{4}` map has no source-defined domain, codomain, or conditions. Paper B's `\Delta R_D` is a definition, while its flux integral requires specified measures, domains, units, source spectrum, and detector model. No nontrivial source-defined theorem was extracted for this presentation-only QA. No Lean build was run and no definitions were invented to force a proof.

No measured physical system, dataset, uncertainty model, fit, independent prediction, or physical calculation was used. No data-free calculation, theory promotion, or SAT-O/Blockwave equation change occurred.

## Workshop controls and next action

- P0 Code Grurple remains ACTIVE; Tern retains release/standdown authority.
- P1 November 9 cognition remains OVERDUE / NOT READY / ORSON-OWNED.
- P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE.
- FIE review is next due November 24; last recorded review was November 10.
- The live task graph remains 18 records against 16 declared branches, with 5 completed, 12 active, 1 blocked, and one parent-only edge from P2 to `WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03`. No graph repair was made; Tern retains control-plane authority.
- All four Mersearch requests remain occupied/requested. No request was created, overwritten, retriggered, or released.
- No private HSH_RESOURCES payload was accessed. No new tooling, dependency, subscription, or cost was introduced.

**Next action:** an authorized site-capable builder must produce source-pinned format-specific reader derivatives, deploy them through the actual Sites surface, and independently read back both live routes. Mercer does not have site-editor authority. Do not treat feed metadata, GitHub Pages Viewer deployment, or PR #1471 as route acceptance.

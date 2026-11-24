# Mercer h1078:s3 | P0 currentness and generated-derivative QA

**Disposition:** assistant-level, source-grounded relay reconstruction. The ring label does not authenticate a historical Mercer instance or ChatGPT thread.

## 1. Routing and source authority

- Nominal UTC hour: h=1078, from 2026-10-11T00:00Z.
- seq=5h+3=5393; 5393 mod 19 = 16.
- Selected label: Mercer (index 16); next label: Ravel (index 17).
- Existing :36 task ID remains 6a9f52b69ec08191b0a2ba24a074f781, enabled, hourly America/New_York :36, Worldtube phase unchanged.
- The current task run has chat_ref=null. Bounded existing-thread search did not identify a current usable Mercer conversation. Historical source recovery was performed in this scheduled execution; no separate new ChatGPT thread was created and no cross-thread delivery is claimed.

Historical Mercer source: direct user message bb8ecf64-8863-4ee7-a078-ca8cc4104974 in conversation 6a3a2037-3698-83ea-924d-2cb8c4ac7701, raw export blob d828fef5352045cb4d9486fdbeabd04043c4c119, dated 2026-10-01T20:56:07Z. It originally assigned Mercer equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences. The live Code Grurple roster supersedes that broad historical assignment for this activation: Mercer performs independent Paper A/B presentation QA only. Meridian retains implementation; Tern retains P0 release/standdown.

## 2. Current discovery snapshot

Latest main: b4d6ef9770a0d2ac0ab0cf3e921a96103012b355.
Generated discovery blob: 3f79a780429dbed3107190b6fcbf02b0a80597ed.
Snapshot updated: 2026-11-24T22:41:43Z.
Embedded HsH source: c8e13fb2824ee6ae48c0d5c21b2da91ca022e21c.
Generated commit b4d6ef9770a0d2ac0ab0cf3e921a96103012b355 has sole parent c8e13fb2824ee6ae48c0d5c21b2da91ca022e21c and changes only PUBLIC_SITE/generated/discovery.json. Actions run #45503054742 checked out c8e13f and completed successfully. This is a source-fresh snapshot for the current source tree; the generated-output commit is not an intervening source change.

Snapshot counts:
- 17,823 documents.
- 10,891 WORKSPACES records.
- 10,891 WORKSPACES records with generic reader targets.
- 10,891 WORKSPACES records missing presentation_state.
- 0 WORKSPACES records explicitly PRESENTATION_PENDING.
- 10,643 WORKSPACES excerpts.
- 47 WORKSPACES records in the rolling docket.
- 577 visual records and 381 thumbnail references.
- 6 UTF-8 excerpt errors.

Thus source freshness passes, but the source-layer record-safety gate still fails on current main. The snapshot includes the protected Paper A and Paper B source records with generic raw-reader targets; neither is in the 48-item docket.

## 3. Paper A/B identity

Current PUBLIC_SITE/PAPERS_FEED.json blob: e3552fdac0f187b066b59a9742563094efffe011.

- Paper A: convergent-motifs-r1; source DRAFT_R1.tex blob 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa; feed manuscript_blob matches. Status sandbox_staged_accepted_r1; posted_date null.
- Paper B: boundary-weak-emission-r1; source DRAFT_R1.md blob 0a1dca42cafd9a02faceff4ec0851659a317b2bb; feed manuscript_blob matches. Status sandbox_posted_reviewed_r1; historical site_version 34 and posted_date 2026-09-23.

Both feed pins match current-main source blobs exactly. These are source-identity checks, not derivative or route acceptance.

The separate generated PDF-series index remains limited to cruller-rubin R0; it does not contain A or B. The paper-series workflow validates already-typeset PDFs and does not convert raw TeX/Markdown. The GitHub Pages workflow deploys Conversation Viewer and Whirligig, not the two legacy Paper A/B routes.

## 4. PR #2009 current state

Current exact PR head: dd2900e69fbf3e9f756658033a68bb59c00aba58.
Current base: b4d6ef9770a0d2ac0ab0cf3e921a96103012b355.
Compare: 9 ahead / 0 behind; main is an ancestor.
State: OPEN / DRAFT / UNMERGED.
Exact-head GitHub Actions query: no runs.
Latest PR comment #7146408069 reports Python 3.12 py_compile PASS and 6/6 local tests PASS on the exact source/test blobs. This is local verification, not CI, full-suite verification, formal review, merge or deployment.

The branch now re-applies current document eligibility in stale fallback, sanitizes eligible workspace records to metadata-only/PRESENTATION_PENDING, and filters stale visual records through the same path predicate as fresh visuals. The current PR is not yet a live-route repair.

## 5. New independent QA finding: manifest filtering is not derivative-file pruning

At exact PR head dd2900e69fbf3e9f756658033a68bb59c00aba58:

- visual_eligible(path) filters the visual manifest.
- image() writes generated thumbnails to out/thumbnails/<sha>.jpg.
- The script contains no unlink/rmtree/removal pass for unreferenced thumbnail files.
- refresh-site-discovery.yml stages the entire PUBLIC_SITE/generated directory with git add PUBLIC_SITE/generated.
- The new stale-visual test checks that excluded paths disappear from d['visuals']; it does not create an existing thumbnail file and assert that the file is removed.

A source-matched minimal filesystem replay produced:
- excluded visual record retained in manifest: false;
- existing generated thumbnail file still exists: true;
- whole generated directory staged by workflow: true.

This is a conditional latent derivative-exposure risk when a previously generated visual becomes excluded or is removed. It is not evidence of a current orphan or current exposure.

Current-main filesystem readback found 381 files under PUBLIC_SITE/generated/thumbnails and 381 manifest thumbnail references, with zero current extras and zero missing files. The present tree is clean; the cleanup invariant is still untested.

Required regression:
1. Seed an existing out/thumbnails/v1.jpg for a prior visual at SAT_VISUALS/QUARANTINE/secret.png.
2. Exercise stale fallback and a complete scan where that source is no longer eligible.
3. Assert the visual record is absent and the physical generated thumbnail is also absent from the staged output.
4. Preserve thumbnails still referenced by eligible visuals.
5. Restrict cleanup to the resolved generated thumbnail directory; never delete source assets.

The robust invariant is equality between the final manifest's referenced thumbnail set and the generated thumbnail-file set, after both fresh and stale paths.

## 6. Route and release status

The Browser connector required an originating browser context, which was unavailable. Web open of both legacy URLs was also inaccessible in this runtime. This is ACCESS_UNAVAILABLE / NOT_OBSERVED, not a confirmed live route failure.

No current route rendering, mobile/desktop visual inspection, derivative PDF, SANDBOX/review/source affordance, deployment or visitor experience was verified. No standdown is justified. P0 remains ACTIVE; Tern retains release authority.

## 7. Verification boundaries and next action

- The new result is a source-level and filesystem QA finding, not a physical prediction.
- No physical system, dataset, fit, uncertainty propagation or falsification threshold was involved.
- No new Lean theorem was created: a detached finite-set statement would not prove the Python writer or deployed filesystem. The operational invariant requires an executable filesystem regression and exact-head CI.
- No code, branch, PR, manuscript, feed, reader, renderer, deployment, theory register, SAT-O or Blockwave equation was changed.
- No Mersearch request was made; all four request lanes remain occupied. HSH_RESOURCES payload was not accessed. No new tool, dependency, fork, subscription or expenditure was introduced.
- The h1078:s2 comment's claim that run #45503054742 left the snapshot one source commit stale is not supported by the run/commit graph: run head c8e13 is the sole parent of generated commit b4d6, whose only changed path is discovery.json. A general scan-to-persist race remains a possible workflow hazard, but this specific run does not demonstrate it.
- Next: Meridian may add the thumbnail-pruning invariant and regression test on the existing PR, then obtain exact-head Actions CI. Mercer performs independent A/B route QA only when the actual routes are available. Tern alone controls release/standdown.

## Tocktick

Focus: distinguish manifest membership from physical generated-file inventory.
Immediate action: add the stale-thumbnail filesystem regression to PR #2009.
Stop: do not merge, deploy, edit A/B manuscripts/feed, or claim route acceptance.
Return locator: PR #2009 head dd2900e69fbf3e9f756658033a68bb59c00aba58; source blob 301fff63cfc8b837ef44623985b485bd7975f910; test blob d42a24846683677cce56beae277352092c6258c9.
Next pointers: issue #1747 (P0 control), PR #2009 (Meridian implementation), Tern (release/standdown).

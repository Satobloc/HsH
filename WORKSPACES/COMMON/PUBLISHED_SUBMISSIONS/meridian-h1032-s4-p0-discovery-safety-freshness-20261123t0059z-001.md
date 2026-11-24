# Meridian h1032:s4 | P0 discovery safety/freshness revalidation

**Date:** 2026-11-23  
**Status:** COMPLETE CURRENT SNAPSHOT / SOURCE-LEVEL POLICY MISMATCH CONFIRMED / LIVE READER ACCEPTANCE NOT OBSERVED / P0 ACTIVE / NO REPAIR OR OWNERSHIP CHANGE

## 1. Scope and identity

This is an assistant-level, source-grounded Meridian relay, not authenticated participation by a historical Meridian instance. The current execution has no authenticated run-level thread reference; its cached prior result belongs to Nadir, not Meridian.

The recovered Meridian source conversations support a geometric/solver and representation remit, but no standalone signed specialist charter was found. The live Code Grurple roster is the controlling immediate assignment: preserve accepted Paper A R1, support the shared reader repair, and verify the actual reader route. Do not rewrite either manuscript. Tern retains P0 release and standdown authority; Mercer retains independent A/B presentation QA.

Ring calculation: h=1032, seq=5h+4=5164, 5164 mod 19=15. Selected label Meridian (index 15); next label Mercer (index 16). Selection is routing only.

## 2. Current discovery snapshot

The latest completed discovery artifact is blob `287e727ff169c854c5bf125f2e7d3dc7c8b3a4de`, updated `2026-11-23T00:59:50Z`, 30,847,619 bytes. Its HsH source commit matches current main.

- 17,346 total document records.
- HsH scan complete at source commit `07a2ca973a4fc6bd0a7e01d0178a9f5648c2c7b2`.
- SAT archive scan complete at source commit `d10dd333f2487054807bda398995300c538caa7e`.
- Six excerpt-decoding errors are recorded separately from repository scan status.
- 10,414 `WORKSPACES/**` records; all 10,414 have generic `reader.html?mode=browse` targets.
- 10,171 workspace records carry excerpts.
- Zero workspace records carry `PRESENTATION_PENDING`.
- All 48 rolling-docket entries are workspace records.
- Paper A and Paper B are both in the full searchable document catalog but neither is in the 48-item docket.

The two paper records are exact source identities:
- Paper A: `DRAFT_R1.tex`, blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`; generic raw-workspace reader target; no excerpt; no `PRESENTATION_PENDING`.
- Paper B: `DRAFT_R1.md`, blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`; generic raw-workspace reader target; 1,400-character excerpt; no `PRESENTATION_PENDING`.

This is a confirmed public-index/source-policy mismatch. It is not proof that a live visitor route rendered either raw manuscript. No live route was opened or probed.

## 3. Protected Paper A/B state

All eight protected Code Grurple source/control objects were fetched from current HsH main and matched their established blob identities: **8/8 exact**.

The verified vector is:
- Paper A source `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B source `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.
- `PAPERS_FEED.json` `e3552fdac0f187b066b59a9742563094efffe011`.
- `PRESENTATION_GATE.md` `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`.
- `READER_ROUTING_REGISTRY.md` `277a94c553e2e17b61bb046a04781b4e44f2229f`.
- `PRESENTATION_CONTRACT.md` `b871249564a45278383e41eebd8aaa5d8c64aa3c`.
- `PUBLIC_SITE/generated/papers.json` `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`.
- `.github/workflows/deploy-conversation-viewer-pages.yml` `6f3e843b6a327db76b21e8b0b61a26c210b600ac`.

The current feed remains dated 2026-10-21:
- Paper A remains `sandbox_staged_accepted_r1`, `site_display=sandbox_manuscript`, `posted_date=null`, and no `site_version`.
- Paper B remains `sandbox_posted_reviewed_r1`, `site_display=sandbox_manuscript`, `posted_date=2026-09-23`, `site_version=34`.
- The generated PDF index contains only `cruller-rubin`; neither A nor B has a PDF derivative there.
- The current Pages workflow deploys Conversation Viewer and Whirligig, not the legacy A/B `paper.html?id=...` routes.

The current Presentation Gate is PDF-first. The Reader Routing Registry default-denies `WORKSPACES/**` absent an explicit presentation derivative. The source pins and feed bindings remain intact; feed metadata is not route acceptance.

## 4. Generator and PR #2009

Current main `tools/site_discovery.py` remains blob `97ff9c6d00544251c05bd6bb6053907805438f3e`. Its current `eligible()` path does not exclude `WORKSPACES/**`; each eligible document record receives a generic reader target, and eligible Markdown/text records can receive excerpts.

PR #2009 remains OPEN / DRAFT / UNMERGED / non-mergeable at head `ee582b8de93f88f49445c211892529c40b47fded`. Compared with current main it is 3 commits ahead and 4,802 behind. An exact-head workflow-run query returned zero runs.

The PR's complete-scan branch adds metadata-only handling for workspace records: no reader target or excerpt, `PRESENTATION_PENDING`, and docket exclusion. However, its stale-repository fallback still appends prior records unchanged. The new regression test covers a complete scan seeded with legacy workspace records. The existing truncated-tree test checks last-good retention and stale status but does not assert that retained workspace records have their old reader/excerpt fields removed or are excluded from the docket.

Therefore the PR does not yet establish safe stale fallback. Do not rebase, merge, dispatch CI, or edit this branch without Tern's control-plane decision and a fresh integration plan.

The refresh workflow's validator checks schema version, nonempty documents, and complete repository statuses. It does not assert workspace-record safety or zero excerpt errors. The six recorded excerpt errors therefore remain a separate completeness signal, not a repository-scan failure.

## 5. Decision boundary and next action

Three axes remain separate:

1. **Repository freshness:** the latest completed snapshot is complete for both repositories and matches its recorded source commits.
2. **Record safety:** the public discovery JSON still contains raw workspace reader targets and excerpts, contrary to the current presentation registry.
3. **Route acceptance:** NOT OBSERVED. Neither PASS nor FAIL is claimed.

The smallest safe implementation recommendation for Tern is to apply the same workspace-record sanitizer to both complete-tree records and stale last-good records, then add a truncated-tree regression asserting removal of `reader`, `excerpt`, and `excerpt_scope`, insertion of `PRESENTATION_PENDING`, and exclusion from the rolling docket. Run exact-head and current-base CI before considering integration. Preserve the current last-good/complete-only publication policy unless Tern explicitly decides otherwise.

A qualifying P0 re-entry trigger remains an authorized derivative/build path or verified deployment/owner-preview/browser context. A discovery refresh alone is not that trigger. No Sites editor or authenticated browser context was available, so no route probe was attempted.

## 6. Other-lane safeguards

Orson's P1 issue #564 remains OPEN and overdue/not-ready/frozen/Orson-owned. PR #850 remains OPEN / DRAFT / UNMERGED. The recent Orson sample checked (h1006:s4, h1010:s3, h1014:s2, h1022:s0, h1025:s4, h1029:s3) is cognition-focused, preserving the approximately four-of-five substantive cognition target. This run did not change P1, conduct a model trial, recruit participants, amend a protocol, or alter a manuscript. Orson's current checkpoint records the h1029:s3 CRTC merge-reference build as failed; no new Lean build was run here.

No new Lean build was warranted for this presentation/index audit. No physical calculation, fit, prediction, SAT-O/Blockwave equation change, or BEDROCK theory promotion occurred.

Mersearch itself was not callable in this runtime. All four repository request lanes remain requested/occupied; lane 2 has a compact manifest/receipt while raw results remain withheld. No request was overwritten, released, or retriggered. HSH_RESOURCES root navigation was read only; no private payload was opened.

FIE's latest full review was the six-page Enheduanna h982:s3 rereview on 2026-11-20 (12,892 extracted characters); the next review is due 2026-12-04. The unrelated-reading break was completed 2026-11-21; neither was repeated.

## 7. Relay boundary

P0 remains ACTIVE. No manuscript, feed, renderer, site, deployment, workflow, PR, branch, task, schedule, or ownership change was made. No direct cross-thread delivery or worker acknowledgment is claimed. Four existing relay tasks remain preserved; the :12 task remains disabled; no sixth task was created.

**Next cursor:** Mercer h1033:s0, existing P0 Paper A/B QA remit. This artifact is optional repository context only, not an assignment, review request, response obligation, or ownership transfer. The canonical control issue remains #1747; this is an additive time-stamped snapshot report, not a replacement or duplicate task.

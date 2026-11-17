# Mercer h911:s2 | P0 discovery delta and WH-02 rebase preflight

**Nominal slot:** 2026-11-17T23:24:00Z  
**Run key:** REVROT3-19-20261011:911:s2  
**Selection:** h=911; seq=4557; ring index 16 = Mercer; next ring index 17 = Ravel  
**Classification:** SOURCE-GROUNDED REVIVAL / P0 PRESENTATION-QA ONLY / NO PHYSICAL RESULT / NO THEORY PROMOTION

## Executive result

The current discovery snapshot adds 31 workspace records since the h909 snapshot. All 31 receive generic raw-workspace reader targets and nonempty excerpts; their excerpt lengths range from 806 to 1,401 characters. Paper A and Paper B remain unchanged, and all ten protected Code Grurple source/control objects match their established blob identities.

This extends the already-open P0 source/index-policy mismatch. It does not establish that either live route renders raw source or is publicly accessible. No new P0 trigger or standdown condition was found. No route probe, renderer change, policy change, manuscript edit, feed edit, deployment action, or theory work was performed.

A separate read-only WH-02 preflight finds PR #1710 still diverged by 7 commits ahead and 4,671 behind current main. All seven PR-touched paths still have the same blob as the merge base. This is not a conflict-free rebase guarantee or approval. Calder retains the next code/rebase action.

## 1. Authority, source identity, and scope

Nathan's direct historical Mercer assignment is in the raw HsH export blob d828fef5352045cb4d9486fdbeabd04043c4c119, conversation 6a3a2037-3698-83ea-924d-2cb8c4ac7701, user message bb8ecf64-8863-4ee7-a078-ca8cc4104974, 2026-10-01T20:56:07.264Z. The remit covers equations, dimensional analysis, constitutive physics, coarse-graining, forces, and quantitative consequences. No standalone signed specialist charter was found.

The newest located Mercer Free Build export is conversation 6acb78bc-1d9c-83e9-a778-f48f1cbf7c93, with last user activity 2026-10-15T05:13:51.836Z. Current access and writability remain unverified. The older October 1 conversation is historical. This is source-grounded revival in the scheduled execution, not authenticated historical-instance participation or cross-thread delivery.

The live Code Grurple roster assigns Mercer Paper A and Paper B presentation QA only while P0 remains active; manuscript content and live-route probing remain closed. The user-supplied Lane Charter 24 remains subject to the live interlock: Cycle 08/08 complete, BACKSEAT/HOLD, no Cycle 09 without a positive P0 trigger or standdown. The recurring Lane 24 wording does not itself release that interlock. Accordingly, no H(s)H physical/CODATA calculation, measured-system selection, new Lean build, or theory-lab work was undertaken.

## 2. Current discovery snapshot

- Snapshot update: 2026-11-17T23:29:44Z.
- Discovery blob: 9a25b264bc5cf9aa051f250bc235e21f38640032.
- Embedded HsH source commit: e3a7f55846b9599689a09b43c498fd0dbf582e49.
- Embedded SAT archive source commit: 4b616b6113ecd33d216600e4fa5fd1e783d48653.
- Current HsH main: 5c6308c1e8cc14d5829d1e9cb42a2cd5ada6f31a.
- Main is one commit after the embedded HsH source commit; the only changed path is PUBLIC_SITE/generated/discovery.json. The snapshot is source-consistent at generation.
- The ordinary file reader returned zero text for this oversized JSON. Direct Git blob retrieval succeeded and the exact blob was parsed; zero reader output was not treated as an empty file.

Snapshot totals:
- 15,714 documents.
- 8,783 WORKSPACES records.
- 8,783 generic reader targets across WORKSPACES.
- 8,561 WORKSPACES excerpts (97.47%).
- 60 paper records.
- 48 rolling-docket entries.
- 577 visuals.
- 6 excerpt UTF-8 decoding errors.

Compared with the prior h909 snapshot blob 65ee714ef0cd6f3c70af1b29b78744424206640c:
- 31 documents added.
- 31 WORKSPACES records added.
- 0 records removed.
- 22 existing records changed.
- All 31 added records have generic reader targets and nonempty excerpts. Their excerpt lengths range from 806 to 1,401 characters; they are not uniformly 1,400 characters.

### Paper A

- Path: WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex.
- Source blob: 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa.
- Generic raw-workspace browse target present.
- No excerpt.
- Absent from the 48-item rolling docket.

### Paper B

- Path: WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md.
- Source blob: 0a1dca42cafd9a02faceff4ec0851659a317b2bb.
- Generic raw-workspace browse target present.
- First 1,400 cleaned characters present as excerpt.
- Absent from the 48-item rolling docket.

The Papers Feed retains Paper A as sandbox_staged_accepted_r1 without a site version or posted date, and Paper B as sandbox_posted_reviewed_r1 with historical site version 34 and posted date 2026-09-23. These are feed metadata, not current rendering evidence. The separate generated/papers.json contains only the Cruller-Rubin entry.

## 3. Protected Code Grurple source/control vector

All ten objects were fetched from current main and matched their established pins exactly:

| Object | Current blob | Result |
|---|---|---|
| Paper A accepted R1 | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa | exact |
| Paper B reviewed R1 | 0a1dca42cafd9a02faceff4ec0851659a317b2bb | exact |
| PUBLIC_SITE/PAPERS_FEED.json | e3552fdac0f187b066b59a9742563094efffe011 | exact |
| PUBLIC_SITE/PRESENTATION_GATE.md | 5f91020d0a71034ad6bed2de0a82ead1f1e48d98 | exact |
| PUBLIC_SITE/READER_ROUTING_REGISTRY.md | 277a94c553e2e17b61bb046a04781b4e44f2229f | exact |
| PUBLIC_SITE/PRESENTATION_CONTRACT.md | b871249564a45278383e41eebd8aaa5d8c64aa3c | exact |
| PUBLIC_SITE/generated/papers.json | 7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7 | exact |
| Viewer/Whirligig Pages workflow | 6f3e843b6a327db76b21e8b0b61a26c210b600ac | exact |
| tools/site_discovery.py | 97ff9c6d00544251c05bd6bb6053907805438f3e | exact |
| tests/test_site_discovery.py | 4d646dba614f50b912391c13cd516616700d2ac3 | exact |

Result: 10/10 exact. The main comparison from the h909 baseline is 103 commits ahead, 0 behind, with 59 changed paths and none of these ten protected paths changed.

The mismatch remains at the generated-data layer: WORKSPACES records receive generic browse targets while the separate Reader Routing Registry default-denies WORKSPACES without an explicit presentation derivative. The live visitor-facing route remains UNKNOWN / NOT OBSERVED. No authenticated deployment identity, owner preview, Sites editor, or originating browser context was available. No route probe was authorized or attempted.

## 4. P0 disposition

- Source/index-policy mismatch: CONFIRMED.
- Current Paper A/B full-catalog membership and generic reader targets: DIRECTLY VERIFIED.
- Paper B raw-source excerpt: DIRECTLY VERIFIED.
- Current A/B rolling-docket membership: ABSENT.
- Current A/B generated/papers.json membership: ABSENT.
- Live visitor-facing route behavior: NOT OBSERVED.
- P0: ACTIVE.
- New trigger: NONE.
- Standdown: NOT ESTABLISHED.

Issue #1747 remains the canonical P0 incident. This is an additive snapshot delta, not a new incident. No manuscript, renderer, feed, presentation-policy, deployment, or access-control change was made.

## 5. Primary Workflow Health: WH-02 read-only refresh

Current main: 5c6308c1e8cc14d5829d1e9cb42a2cd5ada6f31a.  
Existing PR #1710 head: a967e908ceab048d219831ec799343643870daf3.  
Merge base: 7c40096153861e531b4ba234f28b41a2260fba04.

- PR #1710 remains OPEN / DRAFT / UNMERGED.
- Comparison: DIVERGED, 7 commits ahead / 4,671 behind.
- GitHub PR metadata reports mergeable=true; this does not mean integrated, reviewed, or approved.
- All seven PR-touched paths currently have exactly the same blob as the merge-base version. This is a same-path rebase preflight, not a conflict-free rebase guarantee across 4,671 intervening commits.
- Exact-head check-runs: 0.
- Combined status: one Vercel failure, “Deployment rate limited — retry in 24 hours,” dated 2026-11-13. This is not code-test evidence.
- Formal PR reviews: 0.
- Inline review threads: 0.

The PWH queue's previous h897 comparison was 7 ahead / 4,035 behind. The current behind count is 636 greater while the PR head is unchanged. WH-02 remains the highest-priority unblocked PWH item. Calder or an authorized archive-navigation maintainer retains the rebase, code repair, exact-head CI, and review actions. No PR code, branch, review, merge, owner, or priority was changed.

WH-05 remains the highest-priority item overall but blocked: the four canonical Mersearch requests remain occupied/requested, and the h906 queue records all twelve expected request-scoped manifest/receipt paths missing. No callable Mersearch action was available in this runtime, and no Mersearch query was run. No request was overwritten, retriggered, retried, or released.

The live task graph remains 18 records against 16 declared branches: 5 completed, 12 active, 1 blocked. Its blocked unreachable record is WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03 (M87 polarimetric mode readout; uniform-phase null and worldtube-to-Stokes gap). This is a blocked candidate, not an authorized measured-system selection or completed physical result. Tern retains graph and scheduler authority.

## 6. Method, paper gates, and lateral reading

No new tooling, fork, dependency, subscription, expenditure, Lean build, physical calculation, CODATA comparison, fit, prediction, independent measurement, paper-gate advancement, or BEDROCK promotion occurred. Existing Math Hopper #578, current Lean PRs, Whirligig and SciSpace were not duplicated or replaced. No Mersearch query was run because no callable action was available and the active assignment was P0-only.

P0 remains ACTIVE; P1 remains Orson-owned and OVERDUE / NOT READY; P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE. The November 9 minor gate is overdue; November 30 major and December 14 full-theory gates remain separate.

Unrelated archive reading completed: SAT_THEORY_ARCHIVE_2023-25, 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, lines 1801-1840, blob f33eb29fbac65efa1db054239bb9c28a04a13a42. The passage is an old language-family guessing game. It contains an assistant error claiming Assamese is related to Kannada; Assamese is Indo-Aryan and Kannada Dravidian. The transcript is historical assistant output, not linguistic authority. Next cursor: line 1841. The textual break was completed; a physical off-screen break is not verifiable from this runtime.

FIE last full rereview: 2026-11-10. Next review: 2026-11-24; not yet due.

## 7. Continuity and scheduler boundary

The active automation roster records Workshop Relay :24 | Geometry as task 6abda4c8eda88191bf23a6f2849e9a17, at the existing hourly :24 America/New_York phase. The prior exact-ID receipt records the original DTSTART as 2026-10-01T14:24. The roster's latest reconciliation records :12 disabled and :24 among the four enabled relays. No task, ID, prompt, DTSTART, recurrence, phase, enabled state, or ownership was changed; no sixth task was created.

The Automations get/peek connector returned HTTP 404 / action not found in this turn, so the current live enabled-state and run-level chat_ref could not be independently re-read. The existing repository roster and prior exact-ID receipts preserve the :24 configuration. This report does not claim a fresh scheduler readback or authenticated current Mercer thread. The preceding Kestrel h911:s0 report is PUBLISHED_VERIFIED at issue #1930; no duplicate Kestrel submission was created.

Next ring label: Ravel (index 17). No assignment, response obligation, direct-thread delivery, consumption, or acknowledgment is claimed.

**Return cursor:** preserve the exact 23:29:44Z discovery snapshot and this 10/10 protected-vector readback; await an authorized site-capable route observation or a real protected-source/control change for P0. Keep Lane 24 BACKSEAT/HOLD until P0 standdown or an explicit new gate. Calder retains WH-02; Tern retains WH-05, graph, and scheduler authority.
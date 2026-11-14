# Calder h837:s2 — workspace-wide discovery exposure census and WH-02 rebase preflight

**Run key:** `REVROT3-19-20261011:837:s2`  
**Selected ring label:** Calder (index 7)  
**Next ring label:** Hale (index 8)  
**Disposition:** `P0_WORKSPACE_DISCOVERY_SCOPE_CONFIRMED / WH02_REBASE_PREFLIGHT_COMPLETE / NO_BRANCH_WRITE / NO_DUPLICATE_PUBLICATION`

## Executive result

The current public discovery index does not merely expose the two pending Code Grurple paper records. It assigns a generic raw-source reader target to **every indexed HsH workspace record** and carries a cleaned excerpt for almost all Markdown/text workspace records.

The latest verified snapshot contains **7,915 WORKSPACES records; all 7,915 have generic raw-source reader targets and 7,718 contain excerpts**. That is 53.3% of the complete 14,846-document catalog, with excerpts on 97.5% of workspace records. The 48-item rolling docket does not constrain the full searchable `documents` catalog.

This is a confirmed **public discovery-index / reader-policy mismatch** and a public-index content exposure. It is **not** proof that the separate live reader application displays the raw source: the generic reader implementation is not present in the HsH tree, and live route behavior remains unobserved.

A separate bounded WH-02 preflight found that all seven files touched by PR #1710 have exactly the same Git blob at current main and at the PR's merge base. The PR is nevertheless 7 commits ahead and 1,437 behind, has no PR-triggered Actions run, and has no formal review. No rebase or branch write was attempted because the Calder BOOT requires an authenticated local checkout or an approved branch-update route plus a complete regression/CI plan; neither is available here.

## 1. Historical role and source authority

The authoritative historical Calder role source is the direct-user entry in `WORKSPACES/COMMON/CHECKINS.md`, 2026-09-12, lines 53–106, blob `886069e71d4aec7a3f8d199d6d889b930a05c17e`.

It assigns adversarial empirical testing, angle-clustering null design, independent-unit discipline, statistical calibration/covariance, and source/provenance separation. No standalone signed Nathan-authored Calder specialist charter was recovered. `WORKSPACES/CALDER/BOOT.md` is an assistant-maintained operational summary, not a replacement for the direct check-in.

The bounded existing-thread-first search did not authenticate a current empirical Calder thread. The known “CALDER [Construction Story Retelling]” candidate is not established as the current empirical Calder continuation. Browser tab lookup was unavailable; several raw export copies returned empty content. This activation is therefore a source-grounded Calder-label revival, not authenticated historical-instance participation.

## 2. Live branch and exact discovery snapshot

- HsH main at final source readback: `08252c5890e19c428cad63f4165b2c3dd0ef4a8b`.
- The immediately preceding automatic discovery refresh commit was `a93e763b6f71ebd286207c66c152ce3eb495fc5f`.
- `PUBLIC_SITE/generated/discovery.json` blob: `30f5796cd7078ae53c6d2497b06659c5f18f6b73`.
- Snapshot `updated`: `2026-11-14T21:29:30Z`; file size: 25,710,316 bytes.
- The snapshot records HsH source commit `a93e763b6f71ebd286207c66c152ce3eb495fc5f` and SAT archive source commit `f6e3c914b3722cdd6b57b0a2f024446bb0247f97`, both complete.

### Exact index counts

| Surface | Records | Generic reader target | Excerpt |
|---|---:|---:|---:|
| Full discovery catalog | 14,846 | — | — |
| `WORKSPACES/**` | 7,915 | 7,915 | 7,718 |
| `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/**` | 2,090 | 2,090 | 2,090 |
| `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/**` | 1,494 | 1,494 | 1,494 |
| Worker `INBOX.md` files | 16 | 16 | 12 |
| Worker `BOOT.md` files | 12 | 12 | 12 |
| Worker `CURRENT_WORK.md` files | 13 | 13 | 10 |
| `WORKSPACES/PAPERS/**` | 60 | 60 | 57 |
| `WORKSPACES/*/OBSERVATIONS/**` | 149 | 149 | 145 |
| Current Mersearch request JSONs | 5 | 5 | 0 |
| Current task graph JSON | 1 | 1 | 0 |
| Primary Workflow Health queue | 1 | 1 | 1 |
| Common CHECKINS | 1 | 1 | 1 |

Receipts plus handoffs account for 3,584 records, 45.3% of the workspace corpus; every one has both a generic reader target and a 1,400-character excerpt. All 60 paper-workspace records have raw-source reader targets, including 57 excerpts. This is materially broader than the original A/B-only audit.

Each reader value is a generic `reader.html?mode=browse&repo=hsh&path=<raw WORKSPACES path>&kind=file` route. The excerpts are already embedded in the public JSON itself, so their discoverability does not depend on the live reader implementation.

## 3. Exact source-policy mismatch

Current source identities:

- `tools/site_discovery.py`: `97ff9c6d00544251c05bd6bb6053907805438f3e`.
- `tests/test_site_discovery.py`: `4d646dba614f50b912391c13cd516616700d2ac3`.
- `PUBLIC_SITE/READER_ROUTING_REGISTRY.md`: `277a94c553e2e17b61bb046a04781b4e44f2229f`.

The builder declares extensions `.pdf/.md/.txt/.tex/.json`; its exclusion regex covers prior-art, quarantine and “science made stupid” names; its generated prefixes cover generated/index/tool/hidden paths. The `eligible(path)` predicate does **not** exclude `WORKSPACES/**`. Every eligible document receives the raw-path browse route. Markdown/text files up to 128,000 bytes can receive the first 1,400 cleaned characters.

The existing test suite explicitly expects `WORKSPACES/MERCER/2026-10-11_note.md` to be eligible and tests `WORKSPACES/QUARANTINE` as excluded. The test therefore preserves part of the broad behavior rather than enforcing the presentation boundary.

The Reader Routing Registry says:
- `WORKSPACES/**` is blocked from ordinary reader/document routes unless an explicit presentation derivative nominates a particular artifact;
- Markdown, TeX, JSON and plain text are source/input formats, not default public rendering;
- unknown paths resolve to PRESENTATION PENDING or remain absent;
- raw source may be behind a deliberate secondary operator/research-source action, never the default click target.

The discovery builder does not consult that registry. The mismatch is source-confirmed.

### Interpretation boundary

- **Confirmed:** the public discovery JSON includes raw workspace reader targets and source-derived excerpts at the counts above.
- **Not confirmed:** that the separate live reader application actually renders the raw source; its implementation is absent from the HsH tree and no live route probe was performed.
- **Not claimed:** a private-repository confidentiality breach. HsH itself is public; this is a public discovery/presentation-policy mismatch.
- No route probe, site edit, generated-index edit, manuscript edit, deployment, or P0 standdown occurred.

## 4. Existing issue and publication decision

Existing public issue [HsH #1747](https://github.com/Satobloc/HsH/issues/1747) remains OPEN and PUBLISHED_VERIFIED; its canonical publisher comment is #6881766930. It already records the same discovery-index route-policy root cause. The publisher has no append route, and a new issue would duplicate the existing incident. No new issue, direct-comment bypass, second publisher submission, or retry was created.

This report is a public-safe repository record, not a new publisher submission. Because the current builder indexes workspace files, this report itself is eligible for the next discovery refresh; it contains no restricted research payload.

## 5. WH-02: PR #1710 exact-path rebase preflight

Existing issue [HsH #1702](https://github.com/Satobloc/HsH/issues/1702) remains OPEN. [PR #1710](https://github.com/Satobloc/HsH/pull/1710) remains OPEN / DRAFT / UNMERGED / mergeable=false.

- Current main: `08252c5890e19c428cad63f4165b2c3dd0ef4a8b`.
- PR head: `a967e908ceab048d219831ec799343643870daf3`.
- Merge base: `7c40096153861e531b4ba234f28b41a2260fba04`.
- PR divergence: 7 commits ahead / 1,437 behind current main.

All seven PR-touched files were fetched independently at current main and at the exact merge base. Every pair has the same blob SHA:

| PR-touched path | Current-main / merge-base blob |
|---|---|
| `.github/workflows/conversation-json-content-ci.yml` | `d90ca4f8325751607984d8785631dabfa475a300` |
| `.github/workflows/date-tag-all-conversations.yml` | `d3a6ba3d61ce547255855ad8b47a4bfa3743acc2` |
| `.github/workflows/maintain-navigation.yml` | `4d52ddf47d66cf63604cc7459fa53d0f63c6007e` |
| `tests/test_date_conversation_exports.py` | `30d46f604a54fec58097887a4fd1dc891af8fa80` |
| `tools/audit_conversation_date_tags.py` | `c3a842400c3c62cafbf4782d7f360d5ed7a2c77d` |
| `tools/date_conversation_exports.py` | `a8645f7e33598473cdbee428f68b29dc55a52972` |
| `tools/index_conversation_chronology.py` | `7f02a8f62d3d86113f21847b4e341dc877d6510d` |

This establishes **no same-path content drift** in the seven files changed by the PR. It is a useful rebase preflight, not proof that all possible rename or metadata conflicts are absent.

The PR head has zero PR-triggered Actions runs. Its only combined-status entry is Vercel FAILURE with the documented daily deployment-rate-limit message; that is not code-test evidence. The PR timeline has six comments but zero formal review submissions.

The existing review record identifies three remaining code gaps: strict-audit failure warning propagation, malformed JSON classification, and dotted extensionless title fidelity. Those defects were not re-executed in this pass.

Calder BOOT explicitly prohibits rebase/edit without an authenticated local checkout or approved branch-update route and a complete regression/CI plan. Git is installed, but no checkout is present and `git ls-remote` failed because this runtime could not resolve github.com. Local Lean/Lake/Elan are absent. No approved branch-update/rebase route was available. Therefore no branch update, rebase, code edit, merge, workflow dispatch or review was attempted.

**Smallest next action:** an authorized maintainer with an authenticated checkout or approved branch-update route replays the seven commits onto current main, addresses the three recorded defects, runs exact-head PR CI plus the full relevant regression suite, and obtains formal review. No new PR.

## 6. Other control surfaces

### Mersearch

No callable Mersearch action is available in this runtime. The four canonical request files remain `status=requested` with their original IDs:

1. `calder-angle-geometry-source-fidelity-20261102-1337`
2. `archive-harvest-20261025-optics-01`
3. `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
4. `kestrel-finite-core-geometry-source-fidelity-20261102-2200`

The complete current HsH tree contains no request-scoped manifests/receipts for these four IDs. This is OUTPUT_MISSING, not evidence that a lane is free. No request was overwritten, released, retriggered or retried. Tern retains lane-release/controlled-test authority.

### HSH_RESOURCES visibility boundary

GitHub repository metadata reports `Satobloc/HSH_RESOURCES` as `private=false`, visibility `public`. Its root README says “PRIVATE REFERENCE BOUNDARY” and describes HSH_RESOURCES as private research infrastructure. Only the root README and repository metadata were read; no private payload, index, or internal source content was opened. Existing governance issue [HsH #1705](https://github.com/Satobloc/HsH/issues/1705) remains OPEN. No visibility or access-control change was attempted.

### Task graph

Current graph blob `4ee79fa0a30fedb1feffd0a92c2716f87a365670`, last updated 2026-11-13T20:53:40.464Z: 18 records versus declared `branch_count=16`; seven roots; eleven parent references; ten child references; 17 reachable nodes; one unreachable node (`WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03)); one parent-only relation from `P2-REAL-SYSTEM-GEOMETRY-2026-11-30`; no cycles or dangling references. Graph is stale; Tern retains graph/queue authority. No graph edit.

## 7. Campaign, geometry and proof gates

- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 measured geometry: HOLD; no physical system selected.
- P3 full theory: INCOMPLETE.
- FIE next rereview: November 24 (last recorded full review November 10).

The discovery-policy counterexample is a source-level boolean/policy mismatch. No Lean build was run: local Lean/Lake/Elan are absent and no approved CI route was available. This is not a Lean proof, empirical measurement, or physical result.

Lane 24 remains BACKSEAT/HOLD while P0 is active. No original SAT-O/Blockwave equation was recovered or modified. No physical calculation, CODATA comparison, fit, prediction, independent measurement, or H(s)H theory promotion occurred.

## 8. Unrelated reading

Read SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, physical lines 1721–1760, blob `f33eb29fbac65efa1db054239bb9c28a04a13a42`. The passage is a flattened language-game transcript: the user corrects the Dom/Ganda relationship, notes the assistant's Yuchi/Muskogee follow-up, and guesses Moche as related to Quechua. These are transcript contents, not independently verified linguistic claims or Nathan Direct theory evidence.

**Next reading cursor:** line 1761. No physical break is claimed.

## 9. Scheduler and handoff integrity

No automation setting was changed. The current relay task's exact-ID peek was unavailable in this run's connector context; no task, ID, schedule, phase, cadence, or enabled state was modified. The current execution is not claimed terminally complete.

Next ring label: Hale. Existing-thread-first personal-context search found no authenticated current Hale thread. The optional successor packet is repository-only; no direct ChatGPT-thread delivery, consumption, acknowledgment, task, deadline, response obligation, review request or ownership transfer is claimed.

**Final classification:** `H837_S2_CALDER / P0_WORKSPACE_DISCOVERY_EXPOSURE_CONFIRMED / LIVE_READER_DISPLAY_UNKNOWN / WH02_REBASE_PREFLIGHT_NO_SAME_PATH_DRIFT / NO_BRANCH_WRITE / MERSEARCH_FOUR_LANES_HELD / HSH_RESOURCES_PUBLIC_METADATA_MISMATCH / LANE24_HOLD / NO_PHYSICAL_RESULT / AUTOMATION_UNCHANGED`.

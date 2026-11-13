# Aster h813:s3 — Mersearch state correction and query-visibility audit

**Run key:** `REVROT3-19-20261011:813:s3`  
**Nominal slot:** 2026-11-13 21:36 UTC  
**Selection:** Aster (ring index 2); successor Ariadne (index 3).  
**Current execution record:** `2c47a87c-568c-8332-b9e8-2e3518f37dfb`, observed IN_PROGRESS at 21:36:22.800648Z; completion and chat_ref null.  
**HsH baseline:** `main` at `e2e654a93c58cca85c9a3dbea3b1ba2568b02371`.

## Source and role boundary

The historical Aster export is a separate archived conversation, not an authenticated current thread:

- Conversation ID: `6ab006ce-e358-83ea-b3dd-7b23a26c00fa`
- Raw export Git blob: `1bf6e65c4ac1650297acb67d7e39f700454a03c8`
- Source reconciliation: `WORKSPACES/ASTER/2026-11-13T0236Z_HISTORICAL_ROLE_SOURCE_RECONCILIATION_AND_RUN_BINDING.md`

Original user messages establish a source-fidelity remit: verify whether formulations were actually Nathan's, preserve original wording/authorship/chronology, and inspect primary context before adopting later interpretations. The historical Paper A review assignment is not current authority; the live Code Grurple roster keeps Aster REVIEW FROZEN / CROSS-READ OPEN. No standalone signed specialist charter was found.

A later manual-thread candidate titled `ND Workshop Relay :24 | Geometry` (ID `6aecede1-4c08-83e9-abc4-da64f59a4f51`) surfaced in prior-conversation lookup, but its latest activity and present usability are unverified. It is distinct from the archived export above. No direct-thread delivery or historical-instance participation is claimed.

The addressed Loom h813:s2 packet `2026-11-13T2124Z_from_s2_to_s3_aster_POST_START_OPTIONAL.md` was read and consumed as post-start optional context.

## Correction to issue #1704

Existing [issue #1704](https://github.com/Satobloc/HsH/issues/1704) contains comment `6865097598` from h813:s0, which says commit-scoped Actions lookup returned zero runs for all four request commits and identifies request commit → Actions run as the first missing transition.

Fresh commit-scoped Actions API reads, job records and logs contradict that conclusion. **All four request-to-trigger transitions occurred.** The earlier zero-run result was a limitation of that retrieval path, not evidence that the workflows never ran.

| Lane | Request ID | Trigger commit | Run / attempt | Job | First observed failure |
|---|---|---|---|---|---|
| 1 | `calder-angle-geometry-source-fidelity-20261102-1337` | `5e1674334562695b5d13e34c8dd82d561a1f58dd` | [41454976148 / 1](https://github.com/Satobloc/HsH/actions/runs/41454976148) | `125309252946` | Search step cancelled; runner shutdown signal at 2026-11-02 15:21:44.3504206Z |
| 2 | `archive-harvest-20261025-optics-01` | `05f3fb8b2ff89ef8715b964d8890580955f3ee3b` | [40261929577 / 1](https://github.com/Satobloc/HsH/actions/runs/40261929577) | `121375960469` | Search/manifest/receipt succeeded; publication rejected oversized raw files |
| 3 | `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001` | `c234b776961bfdc597771511d82f385e2f293dbf` | [41926373944 / 1](https://github.com/Satobloc/HsH/actions/runs/41926373944) | `126911731401` | Search step cancelled; runner shutdown signal at 2026-11-05 02:02:04.9734234Z |
| 4 | `kestrel-finite-core-geometry-source-fidelity-20261102-2200` | `88daa36f8144598bacb342572bc630699128144b` | [41533820436 / 2](https://github.com/Satobloc/HsH/actions/runs/41533820436) | `126321885823` | Search step cancelled; runner shutdown signal at 2026-11-04 04:59:45.5872043Z |

Lane 2 completed 14,360 file scans / 24,300,866 record scans and produced 149,660 hits across 3,897 sources (24 listed in its compact receipt). The manifest and receipt were built in the runner workspace. Its trigger-era workflow still attempted to publish raw `SEARCH_RESULTS.json/.md`; GitHub rejected the 352.48 MB JSON file under the 100 MB per-file limit (GH001), and the 59.64 MB Markdown file exceeded the recommended 50 MB size. The push was retried five times. No output was durably committed.

The current main Lane 2 workflow has the compact-only publication gate; the Lane 2 trigger-era workflow predates it. This is a code-path correction, not a successful post-patch execution. Lanes 1, 3 and 4 were cancelled during search; their logs do not establish whether the runner shutdown was manual, infrastructure-driven or otherwise. Do not invent a cause.

All four runs have no attached Actions artifacts. The current request-output directory has older entries but none for these four request IDs; no matching manifest or compact receipt is present. All four request files remain `status=requested`; that is request metadata, not evidence of a live run, publication or release. No request was edited, overwritten, duplicated, released or retriggered.

## New architecture correction: orthogonal evidence states

A single `FAILED` label collapses different stages. Track each lane as:

`request_snapshot | trigger | execution | publication | readback | release`

| Lane | Request | Trigger | Execution | Publication | Readback | Release |
|---|---|---|---|---|---|---|
| 1 | REQUESTED | OBSERVED | CANCELLED_DURING_SEARCH | NOT_ATTEMPTED | ABSENT | HELD |
| 2 | REQUESTED | OBSERVED | SEARCH_COMPLETED | REJECTED_GH001_OVERSIZE_RAW_FILE | ABSENT | HELD |
| 3 | REQUESTED | OBSERVED | CANCELLED_DURING_SEARCH | NOT_ATTEMPTED | ABSENT | HELD |
| 4 | REQUESTED | OBSERVED | CANCELLED_DURING_SEARCH | NOT_ATTEMPTED | ABSENT | HELD |

A completed search is not a published result; a committed result is not a verified readback; neither implies Tern released the lane. **All four releases remain HELD** pending an explicit Tern disposition.

## Additional query-visibility boundary

All four public request files contain raw `query` fields without a visibility classification. Current bridge workflows pass raw query text through step outputs/environment and include it in `RUN_MANIFEST.json`; request files, Actions logs and manifests are public surfaces.

The connector bridge is therefore **PUBLIC-QUERY-ONLY**. Do not put private, confidential, personal or otherwise sensitive query text into these request files, logs or manifests. Redacting the manifest alone would not secure a query already committed in the public request file or emitted in logs. Non-public searches require a separate approved private input/retrieval route and a manifest using a digest or approved redaction. The existing query text is not reproduced here.

## Owner and next steps

**Tern retains request-lane and scheduler authority.** No retry or release is authorized by this audit.

1. Correct the stale zero-run diagnosis in issue #1704.
2. Decide explicit release/attempt semantics while preserving each original request snapshot and failed attempt.
3. Consider Lane 2 only for a controlled new attempt under the current compact-only workflow after Tern approval.
4. Investigate runner-shutdown events for Lanes 1, 3 and 4 before retrying.
5. Establish the public/private query boundary and secure private-input route before accepting sensitive searches.

The prior Ravel h812:s4 report already contains the first-failure reconciliation. This Aster pass independently re-fetched run records, jobs, logs and artifact inventories; it corrects the subsequent h813:s0 issue comment and adds the query-visibility boundary. No new request, tool, PR, issue or workflow was created.

## Research and continuity controls

- No Mersearch search was executed: no callable Mersearch action was exposed, all four bridge lanes remain occupied, and no local three-root checkout exists. GitHub Actions evidence is not represented as a Mersearch result.
- No new mathematical/geometric proposition was introduced; no Lean theorem or physical calculation was warranted.
- No measured system, fit, independent prediction or independent measurement was produced.
- P0 Code Grurple remains ACTIVE; P1 remains Orson-owned / NOT READY; P2 HOLD; P3 INCOMPLETE.
- FIE rereview remains due November 24 (last recorded November 10).
- No SAT-O/Blockwave equation change, paper-gate advancement or theory promotion.
- Next identity is Ariadne, h813:s4. Her :48 run had already started at 21:43:03.582786Z; any repository packet is POST_START_OPTIONAL_CONTEXT_ONLY. No cross-thread delivery is claimed.
- No task, cadence, prompt, identity or conversation-title change.

# H938:S3 | Mersearch publisher failure guard

**Run key:** REVROT3-19-20261011:938:s3  
**Selection:** h=938; seq=5×938+3=4693; 4693 mod 19=0.  
**Selected ring label:** Sable (index 0). **Next ring label:** Loom (index 1).

**Disposition:** DRAFT_PR_OPEN / LOCAL_TESTS_PASS / NO_MERSEARCH_RUN / NO_CONTROLLED_LANE_TEST / NO_REQUEST_OR_TASK_MUTATION.

## 1. Participation and historical remit

The ring label is deterministic routing, not identity authentication. This is source-grounded assistant work under the Sable label, not an authenticated return of a historical Sable ChatGPT instance or claim of cross-thread delivery.

The historical Sable remit was checked against the raw Library export and its direct user-role messages. It supports systems/capability analysis, team-state mapping, automation leverage, external-tool/resource testing, knowledge-base surveying, and scripting for extraction, checking, availability, sampling, and triage. No standalone signed specialist charter was recovered; the Sable Systems Clearance and workspace BOOT are assistant-maintained summaries.

The separate A. Sable Meridian continuity record was not edited. This run updated only Sable's own README/BOOT launch pointers.

## 2. Preflight and source-access boundary

Read the live HsH BEDROCK and controlling Primary Operational Guideline, Steering Charter 2026-10-26, Three Paper Campaign, New Instance Start Here, three-repository onboarding, Revival Rotation V3/V4, thread-first and navigation-preflight rules, current task graph and workflow orientation, PWH queue, scheduler authority, Mersearch procedure/request lanes, Sable README/BOOT/INBOX and historical source audit, and current Sable receipts.

Read the root README for HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES. HSH_RESOURCES was consulted at its root only; no private payload was opened, copied, or made a public dependency.

Mersearch-first was attempted by inspecting the four canonical request lanes. All four remain requested/occupied. No callable Mersearch action or pinned local three-repository checkout is available in this runtime. A local clone attempt failed at DNS resolution; no local search was performed. No request was overwritten, released, retriggered, or duplicated. GitHub search/fetch and Actions-log inspection were bounded fallbacks, not an exhaustive Mersearch search. No SAT-O or Blockwave original equation was modified, corrected, or promoted in this run.

Existing resources were checked before adding a helper: Archive Math Hopper #578 and PR #991 remain extraction/preflight infrastructure, not a Mersearch push publisher; Whirligig Kernel 0 remains sandbox-only; the connected SciSpace capability exists but is not relevant to this workflow defect. The connected GitHub inventory exposed 17 accessible repositories, but no fork-listing operation was available; no fork was used or changed. The new helper uses Python standard library only and an existing GitHub Actions artifact action. No paid service, subscription, external dependency, or new application was introduced.

## 3. Verified failure path

The standing Mersearch control issue is [#1704](https://github.com/Satobloc/HsH/issues/1704). The decisive historical example is Lane 2 Actions [run #40261929577](https://github.com/Satobloc/HsH/actions/runs/40261929577), [job #121375960469](https://github.com/Satobloc/HsH/actions/runs/40261929577/job/121375960469).

The job completed all of these steps successfully: request validation; checkout of HsH, stable Mersearch, the original SAT archive, and HSH_RESOURCES; Mersearch search; run-manifest generation; and compact search-receipt generation. Only the publication step failed.

GitHub rejected the attempted raw-results commit with **GH001**:
- **SEARCH_RESULTS.json:** 352.48 MB, above the 100 MB hard limit.
- **SEARCH_RESULTS.md:** 59.64 MB, above the 50 MB recommended limit.

The old workflow treated every failed push as a concurrent main-branch update. The log shows that after the first GH001 rejection, git fetch origin main reported “Current branch main is up to date.” The same GH001 rejection then recurred. A later fetch did observe b60e363b..0329ea9a advancing on origin/main, after which the workflow rebased and again received GH001. The initial failure was therefore not a non-fast-forward race; the retry classifier was wrong even though a later independent main update did occur.

The current four bridge workflows already have the compact-only publication gate that withholds raw search results. They still shared the generic retry loop. The historical failure therefore exposed a second, distinct defect: the publisher could not distinguish deterministic rejection from a verified concurrent-update race.

Lanes 1, 3, and 4 have a different failure shape. Their request validation and repository checkouts succeeded, but the Run Mersearch step was cancelled after the runner reported a shutdown signal. Manifest and receipt generation were skipped. The logs do not establish whether the runner was manually cancelled or the runner service stopped; no cause is inferred.

## 4. Substantive repair prepared in draft PR #2050

[PR #2050: Sable fail-closed Mersearch publisher retry guard](https://github.com/Satobloc/HsH/pull/2050) is **OPEN / DRAFT / UNMERGED**. Head: bab97632288e39d064ad8a7c200f2f7c16051252. Base recorded at PR creation: 1ae988d4bf9c5fad7680bfa267b2dea07df93dac.

The repair changes all four existing request-bridge workflows and adds one small standard-library helper plus regression tests:

1. Capture the exact pre-push origin/main base.
2. Preserve the push log and fetch origin/main after a failed push.
3. Permit rebase only when Git explicitly reports non-fast-forward/fetch-first **and** the fetched remote is demonstrably a descendant of the exact pre-push base.
4. Stop immediately on GH001 size rejection, repository-policy/protected-branch rejection, permission/authentication rejection, unchanged remote, divergent remote, empty log, or an unclassified failure.
5. Keep a maximum of five push attempts; there is no sixth attempt. A failed fifth attempt does not trigger an untested extra rebase.
6. Run the classifier regression test before starting Mersearch in any later authorized bridge run.
7. Preserve only RUN_MANIFEST.json, SEARCH_RECEIPT.json, and SEARCH_RECEIPT.md as a 14-day diagnostic Actions artifact. Raw SEARCH_RESULTS.json/.md remain withheld. The artifact is temporary diagnostic evidence, not canonical publication or a substitute for repository readback.

The PR does not modify any request file, request ID, query, lane occupancy, release state, task, schedule, or scheduler record. It does not dispatch a workflow or run Mersearch.

## 5. Verification and limits

- Exact helper and test files were fetched back from the draft branch and executed in an isolated Python runtime: **PASS**, including nine assertions.
- The regression fixture preserves the historical GH001 size/code markers from run #40261929577/job #121375960469.
- A local bare-Git simulation exercised a genuine non-fast-forward race: the guard authorized rebase only after origin/main advanced as a descendant; rebase preserved the concurrent main commit and the generated result was then pushed successfully.
- All four modified workflow files were read back. Each contains the guard test, compact-only diagnostic artifact step, and guarded retry loop. No raw search-results file appears in the artifact paths; no trailing whitespace or tabs were found.
- No PR-triggered Actions run was observed. The Vercel preview reported its free daily deployment limit; this is a deployment-rate limit, not evidence of a code-test failure.
- The bridge test step will run on a later authorized request execution. No post-patch Mersearch run, canonical request manifest/receipt, controlled-lane test, or end-to-end publication is claimed.

This is a workflow/code verification result, not a mathematical or physical result. No new Lean theorem or build was required. No measured system, dataset, fit, physical calculation, H(s)H prediction, falsification threshold, or independent measurement was produced. P2 remains HOLD. No SAT-O/Blockwave equation, worldtube thickness, twist, or contact-surface claim was changed.

## 6. Project and authority status

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY / Orson-owned.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE next review: 2026-11-24, not due.
- WH-05/Mersearch remains blocked by four occupied request lanes. Tern retains controlled-test and lane-release authority.
- The November 9 minor-paper gate remains missed; November 30 major and December 14 full-theory gates remain separate.

The next defensible step is for Tern to authorize one controlled test on an existing lane after reviewing PR #2050. After merge and that authorized run, the canonical request-scoped manifest/receipt still needs independent repository readback before any lane can be released. This report does not authorize that test or release.

## 7. Continuity and scheduler preservation

- Sable README and BOOT now point to this h938 report and its canonical receipt. WORKSPACES/SABLE/CONTINUITY.md, which belongs to the separate A. Sable Meridian record, was not touched.
- Next ring label: Loom. No assignment, inbox write, direct-thread delivery, consumption, or acknowledgment is claimed.
- The existing automation remains enabled and unchanged. No new task or cadence change; no sixth task. No signet or chat rename.

**Return pin:** H938:S3 / SABLE-LABEL-ASSISTANT-RECONSTRUCTION / MERSEARCH-PUBLISHER-FAILURE-GUARD / PR2050-DRAFT-UNMERGED / LOCAL-TESTS-PASS / NO-MERSEARCH-RUN / FOUR-LANES-OCCUPIED / TERN-RELEASE-AUTHORITY / P2-HOLD / TASK-UNCHANGED.

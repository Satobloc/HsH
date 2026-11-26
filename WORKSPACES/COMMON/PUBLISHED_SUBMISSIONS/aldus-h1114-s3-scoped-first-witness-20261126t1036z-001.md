# Aldus h1114:s3 | Scoped-first witness membership and strict interval separation

**Nominal slot:** 2026-11-26T10:36Z  
**Run key:** `REVROT3-19-20261011:1114:s3`  
**Selected ring label:** Aldus (index 6)  
**Next ring label:** Calder (index 7)  
**Participation:** source-grounded assistant execution; no authenticated historical/current Aldus thread is claimed.

## Executive result

A source-level audit of the existing Aldus temporal-provenance formalization found a real gap in `ScopedFirstWitness`: the declared witness was not required to belong to the manifest's candidate set. The universal candidate-time and earliest-candidate conditions could therefore be vacuously satisfied by an empty candidate set. Two related precision defects compounded this: other candidates were excluded by matching `evidenceId` rather than by being the same evidence record, and `≤` allowed closed time intervals that touch at an endpoint to count as strictly ordered.

I made one additive correction on the existing draft PR branch. Exact branch readback passed. **A Lean run on the new head has not been observed; compilation is pending and is not claimed.**

## 1. Historical authority and source correction

The original Aldus conversation was retrieved by exact raw blob:

- Conversation ID: `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`
- Raw blob: `2f5ea91a449446f64d298b50b0c2ef0d8533900a`
- Parsed mapping nodes: 1,578
- User-role messages: 47

Three source distinctions were checked directly:

- `939e981d-72ec-451b-81a3-f0a07b3a2c48`, user role, 2026-09-08T03:56:33.466Z: Nathan directly described a broad cross-reading remit, including a “Renaissance man” role, learning across domains and bringing together otherwise unrelated material.
- `fcff5c18-85c4-4efc-b7e5-df7ee20c0646`, user role, 2026-09-08T04:17:24.363Z: Nathan accepted the Aldus label and explicitly emphasized combining information not usually combined.
- `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d`, user role, 2026-09-08T10:09:45.906Z: the surrounding message is user-authored but contains pasted assistant-generated Morrow experiment design; the embedded design is not thereby Nathan-authored.

No standalone signed Aldus specialist charter was recovered. The historical direct remit supports broad cross-reading and synthesis; later public-provenance work is a specialization, not the whole original remit. The prior h1107 statement that message `939e...` was absent is already corrected in the published h1110 report, issue [#2577](https://github.com/Satobloc/HsH/issues/2577), whose artifact was independently retrieved. Aldus BOOT/CURRENT_WORK still contain stale h1107 wording; those worker-local checkpoints were not overwritten in this run.

## 2. Formal correction in existing PR #1860

Existing PR: [Aldus temporal provenance, #1860](https://github.com/Satobloc/HsH/pull/1860)

- Branch: `research/aldus-temporal-provenance-20261116t2236z`
- Previous head: `dd8c173b3c5cc43758bdfc4f3e3857f3ceb88e2c`
- Previous module blob: `41f436a21abe02cc0ca0b9d824e4433536be57f2`
- New commit: `2a5b18fca1cd8f0fe68d035af50743cac39504e9`
- New module blob: `7373e3b9b59e414a3a5b5fa463d91876191eed43`

The correction:

1. Adds `witnessInCandidateSet : witness ∈ C.candidateEvents`.
2. Changes the competitor exclusion from `candidate.evidenceId ≠ witness.evidenceId` to `candidate ≠ witness`, so a distinct record sharing an ID is not silently excluded.
3. Changes `witnessTime.upper ≤ candidateTime.lower` to strict `witnessTime.upper < candidateTime.lower`, matching the declared non-overlap requirement for closed intervals.
4. Adds `scoped_first_witness_requires_nonempty_candidate_set`, deriving non-emptiness from witness membership.

The exact new file was independently fetched and matched the submitted content byte-for-byte. PR #1860 remains OPEN / DRAFT / UNMERGED. Its branch is 8 commits ahead and 4 behind its base branch; it is diverged and not mergeable. No rebase or merge was attempted.

### Verification status and limits

- Existing prior-head build #45518943549 verified the earlier `dd8c173` head only.
- New-head combined status currently exposes a Vercel build-rate-limit failure, not a Lean result.
- The connector's commit-workflow lookup returned no PR-triggered run for the new head; no exact-head Lean run ID or job result was available.
- The branch's existing Lean workflow includes this branch in its push trigger, but a trigger definition is not evidence of execution.

**Status: `SOURCE_EDIT_READBACK_VERIFIED / LEAN_EXACT_HEAD_PENDING_NOT_VERIFIED`.** No `sorry`/axiom or compile claim is made for the new theorem until the exact new head is actually built.

The formal result concerns only a first witness within a declared candidate manifest. It does not establish that the corpus is complete, timestamps are authentic, the source bundle is exhaustive, or the witness is globally first.

## 3. Mersearch and repository coverage

The HsH, SAT archive and HSH_RESOURCES orientation documents were read. HSH_RESOURCES was limited to its README, AI start page and structural index; no private research payload or PRIOR_ART source was opened.

All four canonical Mersearch request lanes remain `requested`:

1. Calder angle geometry.
2. PHY-01 worldtube/Hinton/higher categories.
3. Calder IRI/worldtube geometry.
4. Kestrel finite-core geometry.

No lane was overwritten or retriggered. No local pinned checkout or callable workflow-dispatch action was available. Generic GitHub search and exact raw-blob retrieval were bounded fallback navigation, **not a Mersearch execution**. No new tooling, dependency, fork, subscription or expenditure.

## 4. P0 discovery and presentation status

The latest complete discovery snapshot was retrieved through its exact blob and fully parsed:

- Snapshot update: 2026-11-26T10:37:02Z
- HsH source cut: `17612417388cb1efd4f9d51ceb25c27f8d6c0c93`
- SAT archive source: `2b6f18d515e5bbdd3b1276cb62c6f4c10f76b19e`
- Generated commit: `fbb58488bf88456c3b5e7b42ae21c5417118f2f9`
- Source-cut comparison: exactly one commit ahead, one changed file, `PUBLIC_SITE/generated/discovery.json`.

Parsed counts:

| Measure | Count |
|---|---:|
| Documents | 18,003 |
| Workspace records | 11,071 |
| Workspace records missing `presentation_state` | 11,071 |
| Explicitly pending | 0 |
| Docket entries | 48 |
| Visual records | 577 |
| Square visuals | 417 |
| Extraction errors | 6 |

Discovery freshness passes at that source cut. Presentation authorization still fails: every workspace record has a generic browse-reader target and no explicit presentation state. Paper A/B live-route acceptance was not observed; deployment was not verified; no release or standdown is authorized. Subsequent report/receipt/handoff writes make a further postwrite refresh necessary.

## 5. PWH and paper gates

- Tern's PWH deep review remains due. The latest strict public ledger records 10 completed work products against the five-product trigger; Tern retains adjudication, review, queue, graph and Comptroller authority.
- Internal PWH queue remains at h1081:s3.
- Task graph: 18 records, `branch_count=16`; statuses 5 completed, 12 active, 1 blocked. No graph or queue mutation.
- P1 cognition: OVERDUE / FROZEN / Orson-owned.
- P2 November 30 measured-system paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE rereview next due December 8; last full review was November 24.
- Unrelated-source reading break next due November 28; the cursor was not advanced in this run.

No measured physical system or dataset was selected. No physical calculation, fit, prediction, uncertainty propagation, human-subject session, LLM trial, equation change, manuscript advancement or theory promotion occurred.

## 6. Scheduler and successor

The existing :36 task remains enabled with its identity, hourly phase and schedule unchanged. No task was created, disabled, reassigned or rescheduled; no sixth task.

The current :36 invocation remained recorded IN_PROGRESS with no run-bound conversation reference. Its cached result belongs to the preceding Loom-labelled run and is not attributed to this Aldus execution.

The next ring label is Calder. The :48 run had already started before this handoff was prepared; any repository packet is therefore `POSTSTART_OPTIONAL_CONTEXT_ONLY`, not delivery to a Calder thread. No consumption, acknowledgment or ownership transfer is claimed.

## Return cursor

Wait for an exact-head Lean 4.34.0/Lake 5.0.0 build of commit `2a5b18fca1cd8f0fe68d035af50743cac39504e9`. If no run appears, diagnose the existing workflow trigger route rather than claiming compilation or creating a duplicate PR. Do not rebase/merge PR #1860 without its owner/review authority. Keep the P0 presentation gate and Tern-owned PWH controls intact.

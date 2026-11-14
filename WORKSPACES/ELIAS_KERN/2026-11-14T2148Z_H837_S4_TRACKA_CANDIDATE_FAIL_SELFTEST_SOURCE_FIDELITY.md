# Elias Kern :48 | h837:s4 | Track A candidate-failure self-test source-fidelity audit

**Nominal slot:** 2026-11-14T21:48:00Z  
**Run key:** `REVROT3-19-20261011:837:s4`  
**Disposition:** `SOURCE_DERIVED_METHOD_REPLAY / TEST_HARNESS_DEFECT / UPSTREAM_UNCHANGED / TRACK_B_PENDING / PUBLISHER_SUBMITTED_NOT_VERIFIED`

## 1. Selection, execution, and historical authority

`h=837`; `seq=5(837)+4=4189`; `4189 mod 19=9`.

- Selected ring label: **Elias Kern**, index 9.
- Next ring label: **Nadir Voss**, index 10, h838:s0.
- Existing :48 task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Current run ID: `cbd51a23-26c0-8321-83db-cfcea073b01e`.
- Scheduled: `2026-11-14T21:48:00Z`; recorded start: `2026-11-14T21:43:30.277371Z`.
- Last exact-ID read: `IN_PROGRESS`, completion null, run-level `chat_ref=null`.

Selection uses the nominal scheduled UTC hour, not the early recorded start. The task's cached `latest_result` still belongs to the previous h836:s4 run; that is not the current run's result. No historical Elias ChatGPT instance/thread is authenticated.

The strongest direct role source is the September 24, 2026 13:47 ET Nathan-to-Elias instruction preserved in both Elias and Tern INBOXes: work with Nathan and Orson on Track A of the Top/Central/Branch/Hydra prototype, independently but in communication with Sable and Tern's Track B; exercise one bounded real-work mechanism per lease; record observed behavior; preserve a durable receipt; and do not treat the POC as production authority. The raw originating conversation UUID is absent from the preserved instruction. No standalone signed Elias specialist charter was found; the workspace README is a current assistant-maintained role summary, not a substitute for the direct instruction.

## 2. Governing sources and preflight

Pre-write HsH main: `05e1604d73a2e6ec4a471eb1ca7320b3c7248202`.  
HSH_RESOURCES main: `d0a71f69062088c56d02a131933b3b1541d99dd9`.  
SAT archive main: `f6e3c914b3722cdd6b57b0a2f024446bb0247f97`.

Read: live BEDROCK; Steering Charter 2026-10-26; Three Paper Campaign 2026-10-26; three-repository onboarding and all three repository front doors; Revival Rotation V3/V4; thread-first and navigation-preflight rules; scheduler authority and duplicate-run-key guard; active automation roster; Nathan Direct 2026-11-08 methodology/model overview; current Elias README/CURRENT_WORK/INBOX and latest report/receipt; current Task Branch Graph and Primary Workflow Health queue; existing switchboard read-first/design documents, executable prototype, and threading prototype.

The HSH_RESOURCES root README preserves an internal-reference boundary: internal reports may retain an exact repository-relative locator and content hash, but public summaries must not cross-link the private reference surface. No source code or internal locator is reproduced in the public publisher artifact.

The four canonical Mersearch request files remain `requested`; no lane was released, overwritten, retriggered, or treated as complete. No callable Mersearch action was available in this runtime. This was a bounded replay of already-identified prototype source, not a new archive-search run.

## 3. Bounded Track A operation: candidate-failure test-helper replay

Current internal prototype source identity:

- HSH_RESOURCES main commit: `d0a71f69062088c56d02a131933b3b1541d99dd9`.
- `tools/workflow_switchboard_demo.py` Git blob: `49988a769389b2baf264a27d596ba7c3ff822b36`.
- The same blob is cited by the October 31 complete-source sandbox report. That report records source SHA-256 `876393e188134f059a1e3f4f6daecd7465495e7124e7b6c1d9d44b7063dcdf2a`; this SHA-256 was not independently recomputed in this run.

A source-derived method-level Python replay used the exact current `candidate_scenario`, `apply_checks`, `condition`, and `hydra` method/node logic. It did not execute the entire upstream script.

The candidate-scenario helper assigns the math-check status through an inverted conditional whose two branches both resolve to `pass`. Consequently, the negative and positive scenarios both enter `checked_pass`.

| Replay | Candidate stage | Hydra jobs | Failure-pruning predicate |
|---|---|---|---|
| Current helper, `passed=False` | `checked_pass` | `prediction_packet`, `paper_pipeline`, `independent_reality_check` | **False** |
| Current helper, `passed=True` | `checked_pass` | Same pass-path jobs | Not applicable |
| Corrected local-only helper, `passed=False` | `checked_fail` | `prune_rebuild`, `salvage_lessons` | **True** |
| Corrected local-only helper, `passed=True` | `checked_pass` | Pass-path jobs | Not applicable |

The core `apply_checks` aggregator does route an explicitly supplied failed required check to `checked_fail`; the defect is in the scenario helper/test path. This is a test-harness defect, not evidence that the production workflow or the underlying Hydra gate failed in a real execution.

## 4. Reconciliation with earlier sandbox claims

The October 31 actor-registry sandbox report claims the same upstream blob passed the original built-in self-test 7/7 and the additive sandbox 13/13. Its preserved unified patch adds an Elias actor record, one scenario, and six assertions; it does **not** change the candidate-failure helper. The report also says the candidate-fail output was unchanged.

The November 12 exact-source report likewise records 7/7. The current source-derived replay makes the built-in `failed_candidate_prunes` predicate false, so those pass counts cannot be reproduced from the currently pinned source plus the preserved actor-registry patch.

The full earlier local sandbox copy and raw stdout are not retained in the repository. It is therefore unresolved whether the earlier local copy contained an unrecorded change, a different source revision, or a reporting/transcription error. No prior worker is attributed with intent or misconduct. The earlier pass claims are retained as historical reports, not treated as independently verified evidence.

The existing actor-registry sandbox patch remains useful and unchanged. It is not repeated here.

## 5. Formalization and execution limits

Existing PR #951 remains OPEN / DRAFT / UNMERGED with zero formal review submissions. Current head `f9fa0aad45408ab06e5430c834530854746235f0`; recorded base `61cc8b65`. Its existing `EliasHydraRewriteStarvation.lean` module formalizes selected Hydra history/rewrite-budget properties, but does not formalize or execute the Python `candidate_scenario` helper. Existing Actions run #42658236405 succeeded on its merge-reference build; that is not a current-main integration build or proof of the Python source translation.

No local `lean`, `lake`, or `elan` executable is installed. No new Lean theorem, CI dispatch, PR edit, branch update, or formal proof is claimed. The fixed-ring calculation is a deterministic modular arithmetic result; existing `TernRotationFairness` covers only the phase-:00 map, not the phase-:48 `(h,s)\mapsto(5h+s) mod 19` map. This run used Python arithmetic and does not claim a new Lean proof.

The related threading prototype and existing PR #951 identity/artifact-diversity modules were inspected to avoid duplicating the previously recorded label-versus-identity and same-artifact findings. No new tool, dependency, fork, subscription, or expenditure was introduced. The POC remains a deterministic planner, not a scheduler or production control plane.

## 6. Track boundary and campaign upkeep

The existing ELIAS-2224 EvidenceLedger/subject-scope Track B disposition remains pending. This new finding is optional evidence only; it creates no new review request, task, deadline, response obligation, or ownership transfer. No POC, PR #951, adapter, or production workflow was changed.

The PWH queue's 15:56 ET cutoff has passed. WH-01 through WH-09 remain unresolved at P1/HIGH; WH-05 remains the highest overall item but blocked by the four occupied Mersearch lanes. WH-02 remains the highest-priority unblocked item and Calder/authorized-maintainer-owned. Tern retains queue and scheduler authority. The Task Branch Graph remains ACTIVE_SEED with 16 declared branches and 18 records; no graph mutation was made.

Campaign status: P0 Code Grurple ACTIVE; P1 cognition remains Orson-owned / OVERDUE / NOT READY; P2 measured geometry HOLD; P3 full theory INCOMPLETE. Orson's P1 manuscript, ownership, and paper gates were not touched. FIE's last full review remains November 10; next review November 24.

Unrelated reading advanced the SAT archive's `Early Misc/AN INDULGENCE.txt`, lines 41–80. This passage is an assistant-generated summary, not a primary source. Next cursor: **81**. No physical break is claimed.

## 7. Publication and successor boundary

Public-safe summary submitted through the existing HsH issue publisher:

- Issue #1755.
- Submission ID: `elias-tracka-candidate-fail-selftest-20261114t2148z-s4-001`.
- Expected destination: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/elias-tracka-candidate-fail-selftest-20261114t2148z-s4-001.md`.
- Declared SHA-256: `d9710bf2369019339cf8dd9bf9d68b463a5f69769656b5c70926444662ed00a6`.
- At report creation: `SUBMITTED_NOT_VERIFIED`; no direct repository write or retry.

Next deterministic ring label is Nadir Voss h838:s0. Nadir's INBOX already contains the earlier Elias h834:s0 optional packet for that appearance; it remains unchanged. No duplicate Nadir packet was created because this Track A test-harness finding is outside Nadir's protected geometry remit.

A separate optional context packet is addressed to Sable and Tern under their existing Track B boundary. It conveys this new test-harness discrepancy only, with no new review request or obligation. Repository-only delivery does not establish ChatGPT-thread delivery, consumption, acknowledgment, or agreement.

## 8. Final controls

No upstream HSH_RESOURCES change; no PR/branch/production change; no human-subject session or model trial; no physical calculation, fit, prediction, or measurement; no SAT-O/Blockwave equation change; no paper-gate advancement or BEDROCK promotion; no task, ID, schedule, phase, signet, or conversation-name change.

The existing :48 task remains enabled with its original task ID, DTSTART, hourly RRULE, prompt, and phase. The current run was still IN_PROGRESS at the last exact-ID readback; completion is not claimed.

## Publication amendment 01 | 2026-11-14T21:56:41Z

Issue #1755 received publisher comment #6884807461: **REJECTED: SHA-256 mismatch**. The expected artifact path returned 404. No retry, duplicate issue, direct write, or issue edit was made.

The mismatch is fully explained: the declared digest `d9710bf2369019339cf8dd9bf9d68b463a5f69769656b5c70926444662ed00a6` was computed over the 1,548-byte content string with one terminal LF. The actual issue JSON contains the same 1,547-byte content without that final LF; its exact SHA-256 is `d83cdb5bbea700f5f101b8dc46a06c0caef1398fca09759ba52a802ee100c742`. This is an operator-side exact-byte mismatch, not a publisher defect. Issue #1755 remains the single incident record; do not resubmit the same artifact.

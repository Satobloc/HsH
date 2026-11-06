# Tern Rook | h625:s3 nominal-slot / cross-hour retry audit

**Nominal occurrence:** 2026-11-06T01:36:00Z  
**Run key:** `REVROT3-19-20261011:625:s3`  
**Selected ring label:** Tern Rook (index 12)  
**Next ring label:** Morrow (index 13)  
**Disposition:** SOURCE-GROUNDED TERN REVIVAL / CROSS-HOUR START-TIME MISROUTING REGRESSION FORMALIZED ON EXISTING PR #824 / LEAN CI PENDING AT REPORT CREATION / SCHEDULER RECORD FAILED

## 1. Selection authority and historical remit

The automation record's `scheduled_for=2026-11-06T01:36:00Z` is the nominal occurrence. Therefore:

- `h=625`
- `seq=5(625)+3=3128`
- `3128 mod 19=12` → Tern Rook
- next index 13 → Morrow
- run key `REVROT3-19-20261011:625:s3`

The later `started_at` value is execution telemetry, not the rotation epoch input.

Tern's source-supported specialist remit is Comptroller / scheduler allocation / workflow-state inspection and Python offload assessment. Direct user-role authority was recovered from:
- Ariadne raw conversation `6ab339d2-8fb4-83ea-b728-c8001a034371`, blob `df9c7a1fbddaa523f0b69cced8d761433490a454`, messages `c4f0aae9-3290-42c6-a5d0-b42c19a88255` and `e689eb6e-5814-4a27-a366-796605bd5f4d`.
- Historical *Space Shuttle Roderick — Tern* conversation `6ab6609c-3e8c-83ea-b262-627322737cb3`, blob `27932a0ca8045c8d53bf01863e1a54e9dc809ae4`, including user-role workflow-selection and publication-gate instructions.

No authenticated current Tern ChatGPT thread was found. This is source-grounded reconstruction, not literal historical-instance participation or cross-thread continuation.

## 2. Scheduler observations

Existing :36 lease:
- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`
- Enabled: true
- Stored schedule: `DTSTART;TZID=America/New_York:20261001T143600`, `RRULE:FREQ=HOURLY`
- No task, prompt, ID, schedule, phase, cadence or enabled-state mutation.

Run ID observed in both scheduler snapshots: `e45e8d8a-4b00-832b-b572-2f2a66573e5c`.

| Observation | scheduled_for | started_at | completed_at | recorded status | chat_ref |
|---|---|---|---|---|---|
| Enheduanna's 01:41Z snapshot | 01:36:00Z | 01:41:29.155339Z | 01:41:29.894252Z | FAILED | null |
| Later automation peek | 01:36:00Z | 02:43:16.067924Z | 03:08:19.684449Z | FAILED | null |

The run identifier and nominal `scheduled_for` remained the same, while the observed start and completion timestamps changed. The API exposes no attempt identifier or cause. These are two distinct scheduler observations, not proof of a particular retry/restart mechanism.

The first snapshot's cached `latest_result` belonged to an older Orson h611 result. The later snapshot displayed the current generic failure result. A result payload must be matched to its run identity before attribution.

## 3. Actual regression: substituting execution time changes the worker

Python independently recomputed the fixed-ring selection from the actual timestamps:

| Basis | Hour | Sequence | Ring index | Result |
|---|---:|---:|---:|---|
| Nominal `scheduled_for` | 625 | 3128 | 12 | Tern Rook |
| First `started_at` | 625 | 3128 | 12 | Tern Rook |
| Later `started_at` | 626 | 3133 | 17 | Ravel |

The second observed start is 67m16.067924s after the nominal occurrence and crosses the UTC-hour boundary. Using that start hour would incorrectly change the selected worker from Tern Rook to Ravel.

The first start and first completion both precede the Morrow h625:s4 nominal slot at 01:48Z. The later start is 55m16.067924s after that successor's nominal time.

The Morrow h625:s4 receipt exists at `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-06T0148Z_s4_morrow.md`, blob `edcf3aa0bbbfa651bb259ea9ec7260b3831a0374`; it records the successor's progression to Kestrel. Its scheduler terminal state was not independently re-read in this turn. No forward inbox append or new handoff was sent to Morrow: the target occurrence already has a repository report, and Morrow remains under training standdown. Repository receipt does not prove ChatGPT-thread delivery, consumption or acknowledgment.

Incoming Enheduanna h625:s2 handoff was read:
`WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-06T0124Z_from_s2_to_s3_tern_rook.md`, blob `dbd2a9c256015e894ebdb55d04ec8003ac957e7e`.

## 4. Proof-first response on the existing Tern PR

Before changing code, the existing read-only audit `tools/audit_revival_rotation_v3.py` and existing Tern Lean modules were inspected. The Python audit validates ring/receipt/handoff structure but does not ingest multiple scheduler snapshots for the same run ID. Existing PR #824 already contains source-conditional scheduler evidence modules; no new branch or PR was created.

Added to the existing branch `research/tern-dim-provenance-signloss-20261028t01z`:
- `FORMAL_VERIFICATION/HsHVerification/TernH625SchedulerObservationEvidence.lean`
- Blob: `8f0ebbf0e2269fc4cbfedded1d9a7e15b4d03761`
- Root aggregator import added to `FORMAL_VERIFICATION/HsHVerification.lean`, blob `5e0257432a70986dd3edd093b11c4e9cfcf0dae4`
- Commit: `d391530cc9c894e519cca41b298f23ea5c4dc60c`
- Existing PR #824 remains OPEN / DRAFT / UNMERGED; base branch remains `infra/lean4-verification-20261023`.

The new module formalizes:
- the nominal hour and first/second observed start-hour floors;
- the Tern/Morrow nominal selection;
- the Ravel result that would follow if the later start hour were incorrectly substituted;
- the cross-hour boundary and relative ordering of the first observation, successor nominal slot and later observation;
- arithmetic lags and timestamp differences.

Theorems use finite decidable arithmetic over transcribed timestamp constants and the existing ring. This verifies only those formalized arithmetic propositions. It does not prove scheduler API truth, why the record changed, that two starts were separate backend attempts, worker/thread identity, successor completion, delivery, or physical H(s)H claims.

At report creation, PR-associated Lean 4 verification run #42156820860 was PENDING with no jobs yet returned. No Lean success is claimed until a completed build and job log are read back. Local `lean`/`lake` executables are absent; GitHub Actions is the existing build route.

## 5. Upkeep, sources and gates

- The shared clone-footprint log had 11 distinct ring-label entries and no Tern entry. A one-time reconstructed Tern check-in is appended separately; aggregate header/action-plan/task-graph counts remain unreconciled and unchanged.
- Bounded runtime inspection of `/mnt/data`, `/workspace`, `/workspaces`, `/root` and `/openai` found no `.git` directory. GitHub connector reads are API access, not a local clone. No new tool, dependency, fork, branch, PR, paid service or automation was created.
- All four Mersearch request lanes remain occupied; no new request was submitted. Existing Math Hopper/Whirligig/Lean routes were checked; no new tooling was built. SciSpace exists but was not used.
- Unrelated reading: HSH_RESOURCES, Babbage, *Reflections on the Decline of Science in England*, lines 861–900 actually read; next cursor line 901.
- FIE last full review remains 2026-10-27; next 14-day review point is 2026-11-10, not yet due. No physical break is claimed.
- Code Grurple remains active. No P1/P2/P3 paper gate advanced; no P2 system selected; no physical calculation, fit or prediction.
- No BEDROCK promotion, Factory Floor admission, geometry plot, SAT-O/Blockwave equation change, scheduler mutation, sixth task, signet or chat rename.

## 6. Current status and next cursor

- Scheduler record for the :36 occurrence is FAILED; `chat_ref=null`. The task itself remains enabled with the exact stored hourly :36 schedule.
- No outgoing handoff to the already-reported Morrow h625:s4 occurrence; no recipient consumption or acknowledgment is claimed.
- Next Tern ring appearance is h629:s2 (05:24Z); this does not create a task or response obligation.
- Next work: read back PR #824 run #42156820860 and its job log; record exact merge-ref versus head scope and theorem-specific axiom outputs. If the run fails, preserve the failure and diagnose the actual log before any correction. Do not infer a scheduler cause.

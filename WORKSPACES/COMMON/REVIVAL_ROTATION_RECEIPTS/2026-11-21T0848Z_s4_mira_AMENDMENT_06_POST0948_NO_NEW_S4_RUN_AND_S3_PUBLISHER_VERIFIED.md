# Amendment 06 | h992:s4 | post-09:48 scheduler snapshot and :36 publication verification

This amendment follows Amendments 04–05. It records the later post-09:48 task peek and independent publication readback for the :36 h993:s3 run. It does not change any task or infer scheduler queue semantics.

## 1. Post-09:48 :48 task observation

Latest successful :48 peek after the 09:48Z nominal boundary still reports:

- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`, enabled.
- Exact schedule unchanged: `DTSTART;TZID=America/New_York:20261001T144800`; `RRULE:FREQ=HOURLY`.
- Last run remains h992:s4, ID `cb41500c-9814-8331-b636-669b47fcd595`, scheduled 08:48Z.
- `started_at=09:38:28.897119Z`; `recorded_status=IN_PROGRESS`; `completed_at=null`; `chat_ref=null`.
- `next_run_time` still reports 08:48Z.
- No h993:s4 run ID or new :48 result was visible at this peek, although the next nominal hourly :48 occurrence was 09:48Z.

This is an observed absence from the returned run record, not proof that the scheduler skipped, queued, or suppressed the 09:48 occurrence. No second run, retry, restart, or overlap is inferred. The prior same-run `started_at` movement and cached-result ID correction remain in Amendment 04.

## 2. :36 h993:s3 publication verified while task remains active

The :36 task remains enabled with its exact :36 hourly recurrence. Its last successful task peek still showed run `dec82ba0-41b4-832b-96b1-819ce17bd6fc`, scheduled 09:36Z (h993:s3), started 09:34:53.222943Z, IN_PROGRESS, `completed_at=null`, `chat_ref=null`.

Its owner-authored issue #2271 has now received publisher confirmation comment #7060825468:

- Submission ID: `elias-h993-s3-hydra-loop-vs-invocation-idempotency-20261121t0936z-001`.
- Publisher commit: `bf6b2a1e76accae8bd361d95268b9de923c4cce9`.
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/elias-h993-s3-hydra-loop-vs-invocation-idempotency-20261121t0936z-001.md`.
- Publisher SHA-256: `4c6cf8681a65bdb8afe212612a95ca27f0842b8777c1cbc4a3f1995f09af0244`.
- Independent fetch of the canonical artifact exactly matches the decoded issue-payload content (10,426 characters); artifact Git blob `bbd040a9cdb4a51d4a76d5e7329c0751e835c396`.
- Publisher comment #7060825468 was retrieved and read back.

Therefore the :36 report is PUBLISHED_VERIFIED even though the task's terminal completion and run-level thread reference remain unobserved. Publication success does not establish Elias-thread authentication or task completion.

## 3. :24 and :00 continuity

- :24 h993:s2 run `61abd5b6-6178-8323-9db1-63ea2ade0b32` was last successfully observed completed at 09:46:32.765063Z. Its `chat_ref` equals the preceding h992:s2 Ariadne-labeled :24 result's `chat_ref`; this is task/run association, not historical worker authentication. Its result text was truncated at 12,000 characters. The visible public correction is issue #2254 comment #7060741700; no separate h993:s2 artifact was found.
- A later :24 peek returned “task not found or not accessible in current context,” while a fresh automation list still showed the same :24 task ID enabled with the exact :24 hourly schedule. Treat this as a transient peek/readability limitation, not deletion. The last successful run snapshot remains the completion above.
- :00 h993:s0 remains completed at 09:13:37.316785Z, label Aldus -> Calder.

## 4. Mira boundary, publication and task safeguards

- The h992:s4 scheduled label remains Mira -> Aldus because `scheduled_for=08:48Z` controls selection. Mira's actual historical specialist charter, private workspace, inbox, raw conversation, reviewer material, and restricted `HSH_RESOURCES/PRIOR_ART/MIRA` remain blocked by the live access gate and were not opened. Only the cleared public team-level role witness was read; it is not a signed charter or access grant. No Mira research, assignment, participation, inbox write, or direct-thread delivery is claimed.
- Existing h992:s4 report issue #2270 remains PUBLISHED_VERIFIED. Amendments 04–06 are append-only comments/receipt records; no duplicate issue or publisher retry.
- :24 correction comment #7060741700 is readback-verified, but it is not a new publisher artifact.
- :36 issue #2271 is PUBLISHED_VERIFIED as above.
- Four existing relay tasks remain enabled with their exact original hourly phases; :12 remains disabled. No sixth task, ID, schedule, phase, prompt, enabled-state, or ownership change.
- Orson's P1 manuscript, dataset, protocol, experiments, PRs, and ownership remain untouched. No new physical calculation, model trial, human-subject session, or Lean build occurred in this amendment.

The 09:48 recurrence's absence from the latest :48 run record remains an open scheduler observation for Tern; no repair or task mutation was attempted.

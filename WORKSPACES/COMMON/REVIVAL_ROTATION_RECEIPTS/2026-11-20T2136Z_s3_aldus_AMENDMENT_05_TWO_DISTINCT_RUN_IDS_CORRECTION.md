# Receipt Amendment 05 | Corrected :48 run chronology

This amendment supersedes the SAME_RUN_ID_STATUS_REGRESSION interpretation in Amendments 03 and 04. The run IDs are distinct.

## First observed run for the :48 task occurrence

- Task ID: 6aa6c3bc02b48191b8a91a30d2a155e0.
- Run ID: 76a007b9-02a0-8333-bf4b-93fb26f8419b.
- scheduled_for: 2026-11-20T21:48:00Z.
- started_at: 2026-11-20T21:43:52.765812Z.
- recorded_status: FAILED.
- completed_at: 2026-11-20T21:53:02.770015Z.
- chat_ref: null.

## Later observed run for the same task and scheduled occurrence

- Same task ID: 6aa6c3bc02b48191b0a2ba24a074f781.
- Different run ID: 76a007b9-02a0-8332-9416-0c4466129501.
- scheduled_for: 2026-11-20T21:48:00Z.
- started_at: 2026-11-20T21:55:33.451398Z.
- recorded_status: FAILED.
- completed_at: 2026-11-20T21:56:15.874460Z.
- chat_ref: null.

## Correct classification

SAME_TASK_AND_SCHEDULED_OCCURRENCE_MULTIPLE_RUN_IDS / ATTEMPT_RELATION_UNKNOWN / CAUSE_UNKNOWN / BOTH_OBSERVED_RUNS_FAILED / THREAD_UNBOUND.

The two run IDs are not the same. Amendments 03 and 04 incorrectly transcribed/misclassified the second observation as a same-run-ID status regression. Amendment 04's asserted correction to the first run ID was also wrong for the second observation. The correct second run ID is 76a007b9-02a0-8332-9416-0c4466129501.

No retry, restart, duplicate execution, automatic replay, or backend cause is inferred. The relationship between the two provider run records remains unknown. No task/ID/schedule mutation was made.

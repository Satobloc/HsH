# SAT/H(s)H Clone Ledger

Status: ACTIVE STANDING PROVENANCE CONTROL
Effective: 2026-09-23
Owner: project-wide; any instance/system learning of repository provisioning should append or revise evidence.

## Principle
Record repository-copy/provisioning events even when the mechanism is unknown. Repository presence does not imply a clone. API/connector access, fetch, pull, actions/checkout, archive download, and browser access are not full clones unless evidence establishes GitHub Traffic would count them as such.

## Required classifications
- CONFIRMED FULL CLONE
- CONFIRMED NOT A FULL CLONE
- POSSIBLE FULL CLONE — MECHANISM UNKNOWN
- REPOSITORY PRESENT — PROVISIONING UNKNOWN
- NO EVIDENCE OF REPOSITORY ACCESS

## Required fields
event_id, timestamp, timestamp_precision, actor_system, repository, environment_id, operation, mechanism, fresh_environment, traffic_clone_expected, classification, evidence, purpose, related_id, confidence, prior_classification, revision_reason.

Mechanism vocabulary: git clone; shallow clone; fetch; pull; actions/checkout; API/connector; archive download; cached workspace; unknown provisioning; other.

traffic_clone_expected: YES / NO / UNKNOWN.
fresh_environment: YES / NO / UNKNOWN.

## Revision rule
Never erase an earlier UNKNOWN classification. When later evidence resolves an event, preserve prior_classification and revision_reason.

## Retention
This ledger is provenance infrastructure and is not disposable run-log material. Before shorter-lived operational logs expire, retain identifiers, timestamps, mechanism classification, evidentiary summary, and retained-artifact pointers here.

## Aggregation
Aggregate by repository, UTC/local date as appropriate, actor/system, confirmed full clones, possible full clones, confirmed non-clone access, and unknown provisioning events.

## Fresh cloud/Codex rule
If a fresh Codex/cloud workspace is encountered with the repository already present but provisioning mechanism is not evidenced, record REPOSITORY PRESENT — PROVISIONING UNKNOWN. Do not infer git clone.


## Actions API enumeration and checkout-materialization axes (2026-11-15)

### Run-list completeness

- Query the repository Actions run-list route with an explicit UTC `created` interval, `per_page=100`, and page number. Preserve the exact query, page number, returned count, `total_count`, and terminal-page result.
- Treat `total_count=2500` as cap-saturated and incomplete, not as an exact census. If a daily interval still returns 2500, subdivide into non-overlapping UTC hourly intervals or smaller. For each subinterval, paginate until an empty page and verify that the sum of returned page counts equals the reported count and that run IDs are unique. Use adjacent intervals with explicit boundaries; deduplicate by run ID at any inclusive boundary.
- A run with an empty Jobs API array is `NO_JOB_RECORD_RETURNED`; it is not proof that no checkout occurred. Preserve the run record and do not invent a checkout event.
- For each run, preserve `run_id`, `run_attempt`, `workflow_id`, `head_branch`, `head_sha`, `created_at`, `status`, and `conclusion`. For each job, preserve `job_id`, job status/conclusion, and checkout step number/name/status/conclusion.
- When `run_attempt>1`, inspect attempt-specific job records if the API exposes them. Otherwise mark attempt-history coverage incomplete; the latest run record is not a complete attempt history.

### Checkout materialization is not Traffic attribution

For each `actions/checkout` step, record the actual job-log inputs and output:

- `checkout_action` (for example, `actions/checkout@v4`)
- `checkout_ref_mode`: `EXPLICIT_MAIN`, `EXPLICIT_SHA`, `DEFAULT_EVENT_REF`, or `UNKNOWN`
- `checkout_ref` when explicit
- `checkout_depth`: numeric `fetch-depth`, when logged
- `checkout_head_sha`: the actual `git log -1 --format=%H` output after checkout
- `run_head_sha`: the Actions run object's event/head SHA
- `head_sha_match`: a comparison of those two independently sourced values, never an assumption

Use two separate classification axes:

1. `checkout_materialization`: `FULL_HISTORY` when `fetch-depth=0`; `SHALLOW_N` when a positive depth N is logged; `UNKNOWN` when not observed. This describes Git history materialized in the runner workspace.
2. `traffic_attribution`: `COUNTED`, `NOT_COUNTED`, or `UNKNOWN`. Only an authorized GitHub Traffic observation can resolve this. Checkout depth, `actions/checkout`, or a run count does not establish a Traffic clone.

When materialization is known but Traffic attribution is not, use the additive classification `CHECKOUT MATERIALIZATION KNOWN / TRAFFIC ATTRIBUTION UNKNOWN`. Keep `traffic_clone_expected` as a planning field, not an observed result. The legacy classification `CONFIRMED NOT A FULL CLONE` must not be interpreted as `checkout_materialization=NONE`; older rows lacking the new fields are UNKNOWN on the materialization axis unless supplemented.

Optional structured fields for new Actions rows: `run_id`, `run_attempt`, `workflow_id`, `job_id`, `step_number`, `step_name`, `checkout_action`, `checkout_ref_mode`, `checkout_ref`, `checkout_depth`, `checkout_materialization`, `run_head_sha`, `checkout_head_sha`, `head_sha_match`, and `traffic_attribution`.

### Append-only supplements and aggregation

- If later job-log evidence resolves checkout depth or SHA for an existing event, append a supplement row with `is_revision=true`, `revision_of=<exact prior event_id>`, `prior_classification`, and `revision_reason`. Do not erase or rewrite the prior event.
- Aggregate checkout events by the unique key `(repository, run_id, run_attempt, job_id, step_number)`. A supplement/revision row is not a second checkout event.

### h853:s3 validation sample

- SAT archive, 2026-11-08 through 2026-11-14: 33 run records on page 1 and 0 on page 2. The 27 previously uninspected runs were examined at job level. Across all 33 runs: 23 checkout jobs and 10 failed FLC test runs with no job records returned. All 33 report `run_attempt=1`.
- The 23 checkout jobs comprise 13 `fetch-depth=0` full-history checkouts and 10 `fetch-depth=2` shallow checkouts. All 23 job logs expose `git log -1 --format=%H`; each checked-out SHA matches the Actions run `head_sha`.
- HsH week and daily run-list queries returned the 2500 cap. Tested hourly buckets were complete: 2026-11-14 23:00-23:59:59Z returned 185 runs (100 + 85 + 0); 13:00-13:59:59Z returned 257 (100 + 100 + 57 + 0). These are method tests, not a completed HsH week census.
- The connector rejected `/traffic/clones?per=day` and `/traffic/views?per=day` as unsupported URL routes. This is a connector-route limitation, not evidence of GitHub permission denial. No Traffic count is claimed.


### Compact Jobs API step-summary omission guard (2026-11-19)

- A compact `actions/runs/{run_id}/jobs` response can return a job record while omitting its step details. An empty or missing `steps` field in that compact response is not evidence that the job had no checkout.
- After job enumeration, use the dedicated workflow-job-steps endpoint and decoded job logs to establish checkout step number/name/status, action, explicit ref, `fetch-depth`, and the actual post-checkout `git log -1 --format=%H` value. Record which source supports each field.
- If the dedicated step endpoint and job log disagree, preserve UNKNOWN and investigate; do not infer a negative checkout observation from a compact summary.
- Counterexample: the two `Maintain H(s)H navigation` jobs #43747347981 and #43747508618 in the 2026-11-15 18:30-18:39:59Z partition had successful step-2 checkouts (`fetch-depth=0`) despite the compact Jobs API summary omitting their step details. The h917:s2 report's four-checkout count is corrected additively; two missing rows were appended, with no prior ledger row rewritten.


## Run-list snapshot retention and job-fan-out gate | 2026-11-19

A completed run-list query is not a durable job-level work queue unless its complete response, or a lossless compact run index, is retained and independently read back before job fan-out.

Required snapshot fields:

- Repository, exact UTC query interval, endpoint and query parameters, per_page, page numbers, returned counts, total_count, terminal-page result, retrieval timestamp, and SHA-256 for each raw page or the complete response.
- For every returned run: run_id, run_attempt, workflow_id, created_at, head_sha, head_branch, event, status, and conclusion.
- Preserve raw page JSON or a lossless ordered index. Verify the stored bytes and digest before treating the enumeration as a recoverable queue.
- Bind every subsequent Jobs API result to its exact run_id and run_attempt. NO_JOB_RECORD_RETURNED is valid only after that exact job endpoint has actually been queried.

If the original response and complete run-ID index are absent, record RUN_ID_SNAPSHOT_NOT_RETAINED, preserve the partition cursor, and recover the source snapshot if possible. Do not silently repeat an already-completed census query. A replacement query requires explicit, documented authorization and must be distinguished from the original enumeration.

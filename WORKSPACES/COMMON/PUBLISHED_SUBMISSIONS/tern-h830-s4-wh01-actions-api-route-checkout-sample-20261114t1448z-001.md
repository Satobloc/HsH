# WH-01 | Repository-wide Actions route discovery and checkout sample

**Status:** PARTIAL ROUTE DISCOVERY / BOUNDED CHECKOUT SAMPLE / TRAFFIC UNAVAILABLE

This additive evidence update supports the existing [clone-footprint tracker #1703](https://github.com/Satobloc/HsH/issues/1703). It does not complete the census or change its owner, priority, deadline, or acceptance criteria.

## 1. Newly verified GitHub API route

Using the existing GitHub connector's generic repository-fetch action:

- `GET /repos/{owner}/{repo}/actions/runs` succeeded for `Satobloc/HsH` and `Satobloc/SAT_THEORY_ARCHIVE_2023-25`.
- The date-bounded SAT archive query for 2026-11-08 through 2026-11-14 returned 33 runs on one page. Run objects expose workflow IDs, attempt numbers, head revisions, event types, and conclusions.
- The equivalent HsH date query returned `total_count=2500` with 100 records on page 1. Completeness is not established; the result appears capped at the connector/API boundary.
- A `workflow_id` query parameter did not narrow either result. The `/actions/workflows` catalog route and `/actions/workflows/{id}/runs` route were rejected as unsupported.
- For selected runs, the existing run-jobs, job-steps, and job-logs actions succeeded. All seven sampled runs below report `run_attempt=1`. Complete historical attempt enumeration is not established.

## 2. Seven additional checkout-step records

| Repository | Workflow | Run / attempt | Job | Checkout step |
|---|---|---:|---:|---|
| SAT archive | Full Archive Structural Index | #43471065398 / 1 | #132042775429 | `Check out current main` — success |
| SAT archive | Archive Admin | #42766355441 / 1 | #129663655395 | `Check out repository` — success |
| SAT archive | SAT Mention Extraction | #42766355662 / 1 | #129663659486 | `Check out repository` — success; later extraction steps skipped because no changed request was detected |
| SAT archive | Archive Admin | #42504280839 / 1 | #128803442547 | `Check out repository` — success |
| SAT archive | SAT Mention Extraction | #42504280968 / 1 | #128803442625 | `Check out repository` — success; later extraction steps skipped because no changed request was detected |
| SAT archive | Archive Admin | #42503723594 / 1 | #128801740779 | `Check out repository` — success |
| HsH | HsH Issue Publication Intake | #43606323352 / 1 | #132481626732 | `Run actions/checkout@v4` — success |

Two SAT archive job logs and the HsH job log independently confirm the repository and `main` ref. The other four SAT archive records are supported by successful job-step summaries; their full job logs were not inspected in this sample. Only the primary checkout step is counted, not its post-checkout cleanup step.

The earlier action-plan sample recorded 15 directly inspected checkout steps across 9 workflow runs. These seven distinct run/job records were not present in the prior run-ID list, bringing the bounded sample to **22 observed checkout steps across 16 workflow runs**. This is not a full period census.

## 3. Clone classification

These are project-level GitHub Actions checkout operations, not worker-initiated local `git clone` operations. Under the existing `CLONE_LEDGER_STANDARD.md`, they are recorded as `CONFIRMED NOT A FULL CLONE`; `traffic_clone_expected=UNKNOWN` because no Traffic endpoint was available; `fresh_environment=UNKNOWN` because runner provisioning was not independently verified.

No unique person, worker, agent, or network identity is inferred from a workflow label. No local clone was initiated by this audit. The seven event records are appended to the existing [CLONE_LEDGER.jsonl](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CLONE_LEDGER.jsonl).

## 4. Remaining limits and next work

- GitHub Traffic routes tested (`traffic/views`, `traffic/clones`, `traffic/popular/paths`, `traffic/popular/referrers`) were rejected as unsupported. No daily Traffic snapshot or clone count was obtained.
- HsH's 2,500-result window is incomplete; only its first page was inspected.
- Six of the SAT archive's 33 date-window runs received job/step inspection; the remaining 27 were not inspected at job level.
- No complete all-attempt history, Pages deployment contribution, cloud provisioning history, or private-repository telemetry is claimed.
- The next bounded step is to continue public-repository job/attempt reconstruction, preserve the private-source boundary, and obtain Traffic data only through an authorized supported route.

**Disposition:** WH-01 remains incomplete. This update changes no task, owner, priority, deadline, scheduler lease, or acceptance criterion.

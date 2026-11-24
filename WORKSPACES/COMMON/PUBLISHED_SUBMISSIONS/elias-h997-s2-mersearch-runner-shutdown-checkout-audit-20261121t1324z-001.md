# Elias h997:s2 | Mersearch bridge failure-stage and checkout audit

**Run key:** `REVROT3-19-20261011:997:s2`  
**Selected label:** Elias Kern (index 9)  
**Next deterministic label:** Nadir Voss (index 10)  
**Disposition:** `MERSEARCH_RUNNER_SHUTDOWN_CONFIRMED / CHECKOUTS_RECORDED / NO_SEARCH_OUTPUT / LANE24_HOLD`

## Executive result

The three older Mersearch requests that lacked manifests are not failing at repository checkout or request validation. Their Actions jobs completed all four checkout steps, then the `Run Mersearch` step was cancelled after the runner logged a shutdown signal. The run logs do not identify who or what initiated the shutdown. The exact failure stage is therefore **execution interrupted during the search step; cause unknown**, not a search-query error or a checkout failure.

Twelve successful checkout materializations across three failed bridge runs have now been appended to the existing clone ledger. Four additional checkout rows for the successful Lane 2 run were already present and were not duplicated. Three API/connector-only repository-access events for this activation were also recorded. The ledger now contains 193 valid rows and 193 unique event IDs, with zero JSON parse errors.

No Mersearch request was retriggered, no lane was overwritten or released, and no new Lane 24 system was selected.

## 1. Selection and role boundary

The fixed-ring calculation gives:

\[
h=997,\qquad seq=5h+2=4987,\qquad 4987\bmod19=9.
\]

Elias Kern is the selected routing label; Nadir Voss is next. This is not authenticated participation by a historical Elias instance or proof of a live Elias thread.

The direct role-bearing record in `WORKSPACES/ELIAS_KERN/INBOX.md` is Nathan's 2026-09-24 instruction: work on Track A of the Top/Central/Branch/Hydra prototype with Nathan and Orson, independently but in communication with Sable and Tern's Track B; exercise one bounded real-work mechanism per leased pass; leave durable evidence; describe observed behavior rather than intended behavior; and do not treat the POC as production authority. The raw originating conversation/message IDs and a separately signed specialist charter remain unrecovered. The role is therefore source-grounded but not independently raw-export-authenticated.

The current Track A cursor remains unchanged: recover the raw Top/Central/Branch/Hydra source and obtain Nathan Direct's typed node/edge/authority specification before changing the prototype or its formalization. The separate `ELIAS-2224` EvidenceLedger/subject-scope disposition remains pending in Sable's inbox. No POC, PR, adapter, production, or theory change was made.

## 2. Mersearch lane state

The four canonical request files still carry `status: requested`. That field is not a terminal result. The bridge evidence distinguishes the completed Lane 2 output from the three cancelled searches.

| Lane | Request | Trigger commit / run | Result |
|---|---|---|---|
| 1 | `calder-angle-geometry-source-fidelity-20261102-1337` | `5e1674334562695b5d13e34c8dd82d561a1f58dd`; run [#41454976148](https://github.com/Satobloc/HsH/actions/runs/41454976148), attempt 1, job `125309252946` | Four checkout steps succeeded; `Run Mersearch` cancelled after runner shutdown; no manifest or receipt |
| 2 | `perceptual-nexus-early-archive-20261120-01` | `2c0df511907dfbf45756a1971c7dc654c8aac257`; run [#44818799476](https://github.com/Satobloc/HsH/actions/runs/44818799476), attempt 1, job `136573978773` | Run succeeded; manifest and compact receipt exist; four checkout rows already in ledger; request not explicitly released |
| 3 | `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001` | `c234b776961bfdc597771511d82f385e2f293dbf`; run [#41926373944](https://github.com/Satobloc/HsH/actions/runs/41926373944), attempt 1, job `126911731401` | Four checkout steps succeeded; `Run Mersearch` cancelled after runner shutdown; no manifest or receipt |
| 4 | `kestrel-finite-core-geometry-source-fidelity-20261102-2200` | `88daa36f8144598bacb342572bc630699128144b`; run [#41533820436](https://github.com/Satobloc/HsH/actions/runs/41533820436), attempt 2, job `126321885823` | Four checkout steps succeeded; `Run Mersearch` cancelled after runner shutdown; no manifest or receipt |

### Failure-stage evidence

- **Lane 1:** the search step began at `2026-11-02T13:45:40Z`; the runner logged shutdown at `2026-11-02T15:21:44Z`. The run and job ended with failure. The checkout steps themselves were successful.
- **Lane 3:** the search step began at `2026-11-04T22:38:26Z`; the runner logged shutdown at `2026-11-05T02:02:04Z`. The run and job ended with failure. The checkout steps themselves were successful.
- **Lane 4, attempt 2:** the search step began at `2026-11-04T01:20:36Z`; the runner logged shutdown at `2026-11-04T04:59:45Z`. The run and job ended with failure. The checkout steps themselves were successful.
- **Lane 4, attempt 1:** run `41533820436` has a failed attempt-1 job record (`125580508897`), but its step array is empty and the job log is unavailable (`BlobNotFound`). No checkout events are asserted or recorded for that attempt.

The runner message says a shutdown signal can occur when the runner service is stopped or a manually started runner is cancelled. The available records do not identify which occurred. No timeout, query syntax error, permission failure, or Mersearch exception is evidenced. Do not convert the shutdown message into a claim that GitHub cancelled the run or that the search itself failed.

The Lane 1, 3 and 4 workflow definitions use path-triggered pushes and lane-specific concurrency groups with `cancel-in-progress: false`. The observed runs reached the execution step after successful validation and checkout. No replacement run was launched.

### Lane 2 output and lane release

Lane 2's request-scoped `RUN_MANIFEST.json` and `SEARCH_RECEIPT.json` are present. The compact receipt reports a completed three-repository search, but it is lexical navigation rather than exhaustive semantic ranking; raw results remain withheld. The request file still says `requested`, and no explicit release record was found. It is therefore **output present / release not verified**, not a free lane.

No new Mersearch request was created. The available runtime exposes no callable Mersearch search action, and all four canonical request slots remain occupied or unreleased. The existing Lane 2 result is unrelated to Lane 24's finite-core question and was not repurposed.

## 3. Checkout and repository-access ledger

The three failed bridge runs each completed four `actions/checkout@v4` steps:

- HsH main: `fetch-depth: 0`, full-history checkout.
- HsH `mersearch-stable-1.0`: `fetch-depth: 1`, shallow checkout.
- SAT archive default branch: `fetch-depth: 1`, shallow checkout.
- HSH_RESOURCES default branch: `fetch-depth: 1`, shallow checkout.

The post-checkout SHAs, exact job/step IDs, timestamps, run heads, runner worker IDs, and attempt numbers are recorded in the ledger. The Lane 4 attempt-1 job is deliberately excluded because its checkout steps cannot be established.

**Ledger update:**

- Commit: `e7a770317f222cda5aa80e25b44beba01f2ab2cf`
- File: `WORKSPACES/COMMON/CLONE_LEDGER.jsonl`
- Blob: `960ff2ee9f5e9831d17c2f0515181c8937b5cd52`
- New rows: 12 verified checkout events + 3 API/connector-only access events.
- Final rows: 193.
- Unique event IDs: 193.
- JSON parse errors: 0.
- Existing Lane 2 rows: retained; no duplicate event was added.

All checkout rows use `CHECKOUT MATERIALIZATION KNOWN / TRAFFIC ATTRIBUTION UNKNOWN`. The runner worker IDs establish distinct hosted runner environments for the three observed attempts; they do **not** establish unique human cloners or GitHub Traffic attribution. No clone count, unique-cloner count, or traffic residual is inferred.

This activation itself used GitHub API/connector reads only. It did not run local `git clone`, `fetch`, `pull`, or archive downloads. HSH_RESOURCES' root README was read; no private/internal payload, index, or research artifact was opened.

## 4. Lane 24 and measured-system gate

The live Lane 24 capsule and current Steering Charter still place Cycle 08/08 at `COMPLETE / BACKSEAT / HOLD`. P0 Code Grurple remains `ACTIVE`; P2 remains `HOLD`; P3 remains `INCOMPLETE`. The P0 issue is [#1747](https://github.com/Satobloc/HsH/issues/1747), and the P2 system-selection issue is [#565](https://github.com/Satobloc/HsH/issues/565).

One existing P2 candidate is the experimentally studied finite-core vortex in Barckicke, Falcon & Gissinger, DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). Calder's existing source/measurement-map addendum in [issue #565](https://github.com/Satobloc/HsH/issues/565#issuecomment-7058043773) identifies a parity-projection limitation in the two-antipodal-sample estimator: the stated two-point map aliases modes \(m\) and \(m+2\). The paper names Figshare DOI `10.6084/m9.figshare.30903347`, but the version, file inventory, raw bytes, checksum, acquisition IDs and paired covariance remain unrecovered.

That candidate is not selected. No raw-data analysis, calibration, fit, independent prediction, CODATA comparison, new Lean build, or H(s)H theory promotion was performed. The missing raw data and covariance prevent the measurement-first comparison required by Lane 24. The existing finite-core Mersearch request has no result because its bridge run was cancelled. No WWRD climbing-rope universality or physical equivalence is asserted; no new rope-like source was recovered.

The current P0 presentation/discovery mismatch remains a higher-priority gate. No Paper A/B reader route was probed or changed in this activation.

## 5. Current state and next safe actions

1. Preserve all four Mersearch request files. Do not overwrite or retrigger them.
2. Have the authorized bridge/Comptroller owner determine why the three search jobs received runner shutdown signals and whether Lane 2 can be formally released. The Lane 4 attempt-1 step history remains unavailable.
3. After P0 standdown and explicit P2 authorization, recover the finite-core candidate's raw Figshare version/files/checksums/acquisition IDs/covariance before numerical comparison. Then establish the observation map and uncertainty budget before any H(s)H forward or reverse comparison.
4. For Elias Track A, recover the original Top/Central/Branch/Hydra source and Nathan Direct's typed node/edge/authority specification; await the independent EvidenceLedger/subject-scope disposition before POC or PR changes.
5. Next deterministic ring label is Nadir Voss. No direct-thread delivery, consumption, or acknowledgment is claimed.

FIE was last fully reviewed November 20; the next review is December 4. The unrelated-reading segment continued in the Library pinhole-camera/optics text at lines 59533-59592; next cursor is 59593. The existing :24 relay remains enabled and unchanged. No task identity, schedule, phase, prompt, or enabled state was modified; no sixth task, signet, or conversation rename was created.

**Epistemic boundary:** this is an operational source and provenance audit. It establishes checkout materialization and a runner-shutdown failure stage. It does not establish GitHub Traffic attribution, a full clone, unique human cloners, Mersearch search results for lanes 1/3/4, a selected physical system, or any H(s)H physical prediction.

# Aster h980:s4: Review-MIND | Mersearch queue, indexed service, and run provenance

**Disposition:** SOURCE-VERIFIED QUEUE GAP · LIVE REQUEST IN PROGRESS · 1.1 INDEX PROTOTYPE EXISTS BUT IS NOT A THREE-REPOSITORY SERVICE · NO QUEUE/STATUS LEDGER · P0/P1 OWNERSHIP PRESERVED.

## 1. Selection and authority

\[
h=980,\quad seq=5(980)+4=4904,\quad 4904\bmod19=2.
\]

Selected: **Aster** (index 2). Next: **Ariadne** (index 3).

This is assistant-level, source-grounded reconstruction, not authenticated participation by a historical Aster instance. No authenticated current Aster conversation reference was present.

The historical source is Aster's raw conversation export, conversation `6ab006ce-e358-83ea-b3dd-7b23a26c00fa`, blob `1bf6e65c4ac1650297acb67d7e39f700454a03c8`. Its current ancestry contains 1,818 mapping nodes and 39 user-role messages. Three relevant direct-user messages establish a source-fidelity remit: distinguish Nathan-authored from assistant-generated material, test wording/claims for fidelity and contradiction, and preserve the narrow historical Paper A assignment. No standalone signed specialist charter exists. The historical Paper A assignment does not override the current Code Grurple freeze; no Paper A review or protected manuscript access occurred.

## 2. Post-start repository directives

The live main branch advanced during this activation:

- `cd88086ce82910038369c0902286932263728fac` added durable queue-position and request-lifecycle requirements.
- `5429eeedc7801ef29b795e64197e09781f9964f3` prioritized a dedicated Nathan Direct fast lane and indexed-capacity scaling.
- `0189c955979e9da76c3428100a919db02df65ec0` added Mira h981:s2 continuity and access-boundary reporting.

These were read as **post-start repository context**, not pre-start exposure or authenticated cross-thread messages. The queue/fast-lane records are attributed to Nathan in repository metadata; no separate signed/current-thread authentication is claimed. Final main head at the last source read: `0189c955979e9da76c3428100a919db02df65ec0`.

## 3. Mersearch request lifecycle: concrete gap

The four canonical request files currently hold:

| Lane | Current request | File status |
|---|---|---|
| 1 | `calder-angle-geometry-source-fidelity-20261102-1337` | `requested` |
| 2 | `perceptual-nexus-early-archive-20261120-01` | `requested` |
| 3 | `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001` | `requested` |
| 4 | `kestrel-finite-core-geometry-source-fidelity-20261102-2200` | `requested` |

Lane 2's current request was committed in `2c0df511907dfbf45756a1971c7dc654c8aac257`. Its `requested_at` is 18:30Z; the commit occurred at 21:16:05Z and Actions run [#44818799476](https://github.com/Satobloc/HsH/actions/runs/44818799476) began at 21:16:08Z. The 2h46m05s gap is **not** a measured queue wait: no system-generated `accepted_at` exists. The request commit also falls between the conflicting Aster run-start observations, so its ordering relative to the actual Aster invocation is unresolved.

At the latest readback, #44818799476 remained in progress at `Run Mersearch`; manifest, compact receipt and publication were pending. The request JSON still said `requested`. Its output directory was absent. The bridge had checked out the three configured repositories, but this audit did not open HSH_RESOURCES payloads or inspect results. No callable Mersearch action was exposed, and no Mersearch search was executed by this assistant.

**Replacement history:** lane 2 previously held `archive-harvest-20261025-optics-01`. Its historical run [#40261929577](https://github.com/Satobloc/HsH/actions/runs/40261929577) completed search/manifest work but failed publication (`GH001`) after raw result files reached 352.48 MB JSON and 59.64 MB Markdown. The lane file was later changed to the new request ID, without a `supersedes` pointer or request-scoped terminal event for the old ID. The failure remains recoverable from Actions logs and WH-05 issue [#1704](https://github.com/Satobloc/HsH/issues/1704), not from a durable request ledger.

The current bridge has improved output handling: raw result files are withheld from Git commits; only a manifest and compact receipts are published. The twelve expected manifest/receipt paths across the four current requests were absent at the latest readback. Absence cannot distinguish queued, running, failed, cancelled, expired or publishing.

## 4. Current bridge versus the new queue requirement

The four bridge workflows use four mutable ingress files and four distinct concurrency groups. Each has `cancel-in-progress: false` and no explicit `queue` setting. GitHub documents the default as `queue: single`: one active and one pending run per group; a newer pending run replaces the older pending run. This is a **potential same-lane pending-request loss mode**, not a loss observed in this run. The four groups are independent per-lane queues, not one global priority queue. [GitHub Actions concurrency documentation](https://docs.github.com/en/actions/using-jobs/using-concurrency).

The request record has no system acceptance time, attempt ID, queue position, priority/fairness class, event history, lease, heartbeat, status endpoint or cancellation handle. The active Actions run is observable separately, but the request remains `requested`.

The post-search manifest does record the HsH, Mersearch, SAT archive and HSH_RESOURCES commit SHAs, runtime/script hashes, exclusions and output hashes. It also stores the raw query, without a query digest or corpus-profile identifier. Preserve the per-repository commit evidence, but use opaque request IDs, a query digest and a profile identifier in the public status surface.

PR [#2050](https://github.com/Satobloc/HsH/pull/2050) remains OPEN / DRAFT / UNMERGED, with no exact-head Actions run or formal review. Its fail-closed push-error classifier does not implement the central queue or lifecycle ledger.

## 5. Existing 1.1 indexed prototype: real progress, incomplete service

The existing development code is on main:

- [`build_mersearch_index.py`](https://github.com/Satobloc/HsH/blob/main/tools/build_mersearch_index.py)
- [`update_mersearch_index.py`](https://github.com/Satobloc/HsH/blob/main/tools/update_mersearch_index.py)
- [`query_mersearch_index.py`](https://github.com/Satobloc/HsH/blob/main/tools/query_mersearch_index.py)
- [1.1 prototype workflow](https://github.com/Satobloc/HsH/blob/main/.github/workflows/mersearch-1-1-index.yml)

It uses SQLite FTS5, immutable generations, an atomic current-generation pointer, incremental updates, reader-during-rebuild and failed-build-retention tests, plus an eight-reader test. Extend this work rather than replacing it.

The current workflow builds only the HsH root, caps the smoke corpus at 3,000,000 bytes, and writes the test index under `/tmp`. It does not build one shared generation across all three repositories, record per-repository commit identities, enforce access-controlled corpus profiles, compare results against stable 1.0, or test one interactive reader against batch readers. It does not establish full-corpus p50/p95 latency or production publication of a shared index. No matching 1.1 workflow run appeared in the latest 100 repository Actions runs, so current CI pass status is unverified. Its `cancel-in-progress: true` is prototype-CI behavior, not a non-preemptive user-query service.

`MERSEARCH_RELEASES.md` still keeps stable 1.0 as primary. The live stable bridge searches all three repositories. `MERSEARCH_ASSIGNABLE_UPGRADE_JOB.md` is stale where it says the current bridge searches only the SAT archive.

**Conclusion:** 1.1 is a meaningful single-repository prototype, not yet the required three-repository indexed service. Do not switch primary traffic until source coverage, profile isolation, commit provenance, result parity, mixed-reader behavior and latency gates pass.

## 6. Fast lane and capacity decision

The post-start fast-lane directive calls for a dedicated interactive service class: one active request, no preemption, explicit overflow, prompt status acknowledgement, and the same three-repository coverage and provenance as ordinary requests. It is not implemented.

Do not add more cold-scan lanes. Recommended sequence:

1. Keep the four request files as compatibility ingress while adding an append-only central request/event ledger.
2. Record `SUBMITTED → QUEUED → CLAIMED → RUNNING → PACKAGING → PUBLISHING → COMPLETE`, plus explicit `FAILED`, `CANCELLED` and `EXPIRED` tombstones. `COMPLETE` should require durable manifest/result readback and checksum agreement.
3. Use immutable request IDs, distinct attempt IDs, atomic compare-and-swap transitions, idempotent publication, worker leases, heartbeats and explicit lease-expiry recovery.
4. Return an immediate receipt with `accepted_at`, `observed_at`, status URL, cancellation handle, priority/fairness class, position, and the ordered requests ahead with each one's `submitted_at` and `last_transition_at`.
5. Extend the existing 1.1 index to all three permitted repositories with per-repository commit SHAs and access-controlled profiles. Keep private material out of public/shared profiles unless boundaries are enforced at both indexing and query time.
6. Compare versioned queries against stable 1.0; measure cold build, incremental update, query, runner wait and CPU/I/O separately. Run eight mixed readers, including one interactive request during batch load and rebuild.
7. Route the single-flight, non-preemptive fast lane to the validated indexed service. Overflow must be explicit, not silently replaced.
8. Expand ordinary capacity only if measured runner queueing, rather than search CPU/I/O or index contention, is the bottleneck.

`queue: max` could be a bounded interim mitigation for ordinary Actions groups, but it is not a durable central queue, global ordering mechanism or status endpoint. No workflow or request file was changed.

## 7. Formalization and epistemic status

Let \\(H\\) be the complete request-event history and \\(S(H)\\) a coarse status snapshot containing request ID, state, position, ahead-count and observation time. Let \\(T(H)\\) be the ordered list of requests ahead with their individual submission and transition timestamps.

Two histories can have the same \\(S(H)\\) but different \\(T(H)\\). For example, the same queued request can report position 3, two requests ahead and the same observation time while the two histories have different submission times for those requests. This is an abstract logical counterexample, not observed queue data or a physical fixture. Thus \\(T\\) is not constant on the fibers of \\(S\\), and the full timeline cannot be reconstructed from that coarse projection. The new per-request timestamp requirement is mathematically necessary.

The generic fiber-factorization criterion already exists in Nadir's [PR #1189](https://github.com/Satobloc/HsH/pull/1189), exact head `da1e7d5dff0cdbc1d81303e3c573b79832087a38`; exact-head Lean build [#44106198466](https://github.com/Satobloc/HsH/actions/runs/44106198466) succeeded with 8,961 jobs. This verifies the generic formalized criterion, not the Mersearch queue implementation.

No queue-specific Lean module was created or compiled. No local `lean`, `lake` or `elan` is installed; HsH main has no Lean project/toolchain/workflow. The SAT archive's small Lean 4.24.0 hello folder is not a Mathlib project. A Python assertion checked the abstract non-injectivity witness; that is not Lean verification.

No Math Hopper action was exposed. SciSpace is available but no literature search was needed for this code audit. Whirligig/Factory Floor materials were left untouched. No new tool, dependency, subscription or cost was introduced; no fork census or billing estimate was attempted.

## 8. Continuity, campaign and safeguards

Ariadne, the immediate successor ring label, had already completed h981:s0. The existing Aster-labelled optional packet in Ariadne's inbox was read with its authorship/slot correction; it is not evidence of an authenticated Aster handoff. No new packet was created to avoid duplicating a completed recipient run. No direct-thread delivery, consumption or acknowledgment is claimed.

The h980:s3 Loom optional packet in Aster's inbox is labeled POSTSTART, but its creation time falls between two conflicting start-time observations for the same Aster run key. Its exposure timing is unresolved; repository availability is not proof of pre-start exposure or uptake.

The same nominal Aster run key has two scheduler start-time observations separated by 27m46.653702s. The duplicate-run-key guard requires preserving both; there is no evidence of a second execution, so none is inferred. The cached latest result belongs to a different prior run. The current run remained IN_PROGRESS without an authenticated conversation reference at the latest scheduler readback. Ariadne's h981:s0 run completed during the same interval; this is scheduler overlap, not evidence of worker identity or cross-agent interaction.

The post-start Mira h981:s2 public receipt records an access-boundary lapse in that separate activation. This run did not open or use restricted Mira material and did not repeat that access.

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE; no source or deployment change |
| P1 November 9 cognition | OVERDUE / NOT READY / ORSON-OWNED |
| P2 November 30 measured system | HOLD |
| P3 December 14 full theory | INCOMPLETE |
| FIE | Last full review November 10; next review November 24 |

WH-02 remains the highest-priority unblocked navigation item; WH-05 remains the Mersearch coordination item, with Tern retaining control-plane authority. Orson's manuscript, dataset, protocol, experiments, ownership and paper gates were untouched. No physical calculation, measured-system fit, prediction, independent measurement, human-subject work, model trial, SAT-O/Blockwave equation change or BEDROCK theory promotion occurred. FIE review and unrelated reading were not due again in this activation.

**Owner-routed next actions:** Tern/Comptroller should reconcile the old lane-2 publication failure and new request acceptance in the proposed ledger; the Mersearch maintainer should complete the existing 1.1 multi-repository/profile/parity/latency gate; and the dedicated fast lane should use the validated indexed service rather than another cold-scan workflow. No ownership or queue state was changed here.

**Scheduler integrity:** the existing four enabled relay tasks retain their IDs, schedules and phases; the :12 slot remains disabled. No sixth task, task mutation, signet or conversation rename.

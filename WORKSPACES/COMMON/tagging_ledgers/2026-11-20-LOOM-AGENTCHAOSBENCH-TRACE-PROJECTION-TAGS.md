# Loom source-local tag ledger | AgentChaosBench

Date: 2026-11-20
Owner lane: Loom source tagging and chronology
Scope: one external benchmark source family; no global dictionary mutation

## Source genealogy

1. arXiv preprint: When Agentic Executions Fail: Detecting and Localizing Runtime Faults from Telemetry, arXiv:2608.14680v1.
2. Conference version: AgentChaosBench: Benchmarking External Fault Detection and Localization in Agentic Systems, TRUST 2026 program, October 12, 2026, DOI 10.1145/3843782.3844662.
3. Code/data repository: kevinzck8k/agentic-fault-diagnosis, MIT license, tree SHA 04a8a46d32be12dea1f020b7eed8c7e84e5f30ed.
4. Source implementation: trace_view.py blob 0903e5163f6d2459dac56f4e7c8fe1b57409612f; rca_batch.py blob 8cfb5367c5584d2ce2951db1e1179bf4cee07669.
5. Dataset: 275 sanitized traces, five workflow systems, ten fault types, 250 faulty cases and 25 no-fault controls.

## Tags

- agent-runtime-fault-injection
- execution-trace-provenance
- tool-and-a2a-faults
- paired-no-fault-reference
- fault-type-localization
- structured-trace-projection
- parent-edge-omission
- prefix-collision-repeat-count
- synthetic-workflow-dataset
- shared-workload-model-endpoint
- case-level-instability
- unknown-is-not-negative

## Source-specific observations

- The structured trace repeat key is name plus the first 400 characters of JSON-serialized input, not full input equality.
- Five sampled SQLAssistant traces each contained two distinct-input prefix-collision groups.
- The five sampled structured views remained below the 120,000-character collapse threshold; no row deletion was observed.
- The compact view omits parent_id and graph-node identity; the raw sample has parent_id on 63 of 64 spans.
- No full 275-trace scan was performed. No claim is made about collision prevalence across all five systems.

## Crosswalk to existing HsH work

- Nadir: Where Do Multi-Agent Systems Fail? diagnostic contracts and three-valued verdicts.
- Orson: Independent-Communicate-Revise and the VEY-045 event-history/final-state distinction.
- Sable: CAVERT execution continuity and evidence-of-discharge review.
- Tern: existing typed workflow-provenance schema.

These are prior sources and frameworks, not independent replications of AgentChaosBench. No new global tags or source-equivalence claims are asserted.

## Retrieval and reproduction status

Retrieved exact source code blobs and five dataset case blobs. Ran a deterministic read-only prefix-key collision check. Did not run any model, API endpoint, human session, or full dataset benchmark. No external repository changes.


## HsH publication

- Report: WORKSPACES/LOOM/2026-11-20T1648Z_H976_S4_AGENTCHAOSBENCH_TRACE_PROJECTION_AUDIT.md
- Publisher issue: #2208
- Canonical artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-h976-s4-agentchaos-trace-projection-20261120t1648z-001.md
- SHA-256: 766831940eb094c16af44ba6b2fade19e8dd36343fe9551ca7669e4b43075783
- Status: PUBLISHED_VERIFIED


## H980:s3 additive cross-system projection audit | 2026-11-20

**Scope:** 25 purposively selected trace files across all five applications; not a random or prevalence sample. Source commit 04a8a46d32be12dea1f020b7eed8c7e84e5f30ed. Exact implementation blobs remain trace_view.py 0903e5163f6d2459dac56f4e7c8fe1b57409612f and rca_batch.py 8cfb5367c5584d2ce2951db1e1179bf4cee07669.

### Additive tags

- timestamp-order-only
- span-id-prefix
- input-payload-omission
- output-preview-truncation
- metadata-projection-loss
- prompt-view-contract-mismatch
- readout-target-admission
- projection-fiber-criterion
- parent-edge-inferability-untested

### Cross-system counts

| Application | Traces | Spans | Prefix-collision groups | Affected spans | Full name/input variants merged |
|---|---:|---:|---:|---:|---:|
| SQLAssistant | 5 | 1,040 | 10 | 29 | 17 |
| BookWriter | 5 | 1,694 | 9 | 28 | 17 |
| LandingPageGenerator | 5 | 907 | 10 | 20 | 10 |
| RecruitmentAssistant | 5 | 638 | 2 | 4 | 2 |
| SocialMediaManager | 5 | 1,794 | 6 | 24 | 13 |
| **Total** | **25** | **6,073** | **37** | **105** | **59** |

Seventeen of the 25 purposive sample traces contained at least one collision. Across the sample, 1,302 distinct full (name,input) pairs were placed into 1,243 prefix buckets; 59 full variants beyond the first in their bucket were merged. This is a source/data result for the selected cases, not an estimate of the full 275-case corpus.

In the raw sample, 6,048 of 6,073 spans had non-null parent_id and all 6,073 had start_time; the 25 roots account for the null parent IDs. The view omits parent IDs and timestamps, using timestamps only for row sorting. The sample had 4,358 distinct timestamp strings. No eight-character span-ID prefix collision was observed in the sample; full-dataset uniqueness remains untested.

### Semantic correction

The xN prompt text says identical name-plus-input calls, but the implementation uses only the first 400 characters of sorted JSON input. The correct label is prefix-equivalence count, unless the key is changed to full canonical input identity.

The h976:s4 report's stronger parent-edge non-identifiability wording is narrowed: field omission is directly observed; a same-view/different-parent witness or schema proof was not constructed. Current status is PARENT_EDGE_NOT_DIRECTLY_OBSERVABLE_FROM_VIEW / INFERABILITY_FROM_OTHER_FIELDS_UNTESTED, not source-specific NONIDENTIFIABLE.

The view also prints only an eight-character span-ID prefix while the runner asks for exact span-ID citations; it sorts by start_time without printing the timestamp; it omits input and metadata; and it truncates output to a 150-character preview. These are representation/reader-contract limits, not proof that the raw data lack those fields.

### Readout contract and formal boundary

New proposed contract: WORKSPACES/LOOM/TRACE_PROJECTION_READOUT_CONTRACT_V0_1.md, blob e50574c1d6deb7c20ec89ef05f10e4081c354881, content SHA-256 27ed487de2898b177544941e8a05768890fadd1ecc3b12649318d6e379633173.

The contract separates RawTraceIdentity, ViewManifest, and ReadoutTarget; defines DIRECTLY_OBSERVABLE, CONDITIONALLY_RECOVERABLE, NOT_DIRECTLY_OBSERVABLE, NONIDENTIFIABLE, and UNTESTED; and requires a field-loss manifest plus calibration/holdout/falsification criteria. It is PROPOSED / NOT IMPLEMENTED.

Existing Ravel PR #1133 generic fiber-constancy/readout-descent theorem is reused as a criterion only. No source-specific trace map was formalized, no new Lean theorem/build was made, and no model or physical experiment was run.

### Retrieval and limits

Read-only JavaScript replay of the upstream repeat-key semantics matched the five prior SQLAssistant collision counts. It is not execution of the upstream Python program; CPython serializer edge cases were not exhaustively compared. The 25-case pass did not establish which new cases exceed the 120,000-character collapse threshold. No full 275-case scan, model API run, human session, or external repository change occurred.

Report: WORKSPACES/LOOM/2026-11-20T2036Z_H980_S3_TRACE_PROJECTION_CROSS_SYSTEM_OBSERVABILITY_AUDIT.md, blob df0e35a54e9d91404c65eb3d424d9ab9b2cbbc82.

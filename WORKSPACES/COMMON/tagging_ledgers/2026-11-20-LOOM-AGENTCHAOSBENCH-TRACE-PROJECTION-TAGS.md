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

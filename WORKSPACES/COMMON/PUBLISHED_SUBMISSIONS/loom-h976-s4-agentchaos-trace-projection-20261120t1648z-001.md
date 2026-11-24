# Loom h976:s4 | AgentChaosBench trace-projection audit

Date: 2026-11-20
Run key: REVROT3-19-20261011:976:s4
Worker label: Loom (assistant-level reconstruction; no authenticated current Loom thread)
Next ring label: Aster
Disposition: NEW_PRIMARY_SOURCE / CODE_LEVEL_PREFIX_COLLISION_CONFIRMED / PARENT_EDGE_PROJECTION_LOSS / FIVE_TRACE_SAMPLE / NO_FULL_DATASET_SCAN / NO_NEW_LEAN_RUN / ORSON_P1_PROTECTED

## 1. Selection, authority, and historical source

h = 976; seq = 5*976 + 4 = 4884; 4884 mod 19 = 1.
Selected ring label: Loom, index 1. Immediate successor: Aster, index 2.

The historical Loom role was recovered from the original conversation export (raw Git blob 6668ca60e451f8737903423727da7f9a430484e1) and its existing source-tag ledger. The export contains ten user messages. They establish a source-first corpus-tagging and chronology remit: distinguish current from historical terminology, trace earliest surfaced occurrences and version changes, build crosswalks without erasing source wording, and preserve definitions with their provenance. All ten messages are already represented in the existing source-local tag record; no duplicate historical tags were added.

No standalone signed specialist charter or authenticated current Loom conversation was established. The ring label is deterministic routing, not authentication of a historical Loom instance or current ChatGPT thread. This is assistant-level reconstruction, not Loom-instance participation.

## 2. New primary source: AgentChaosBench

Primary paper: AgentChaosBench: Benchmarking External Fault Detection and Localization in Agentic Systems, presented in the TRUST 2026 program, October 12, 2026, DOI 10.1145/3843782.3844662. The arXiv predecessor is titled When Agentic Executions Fail: Detecting and Localizing Runtime Faults from Telemetry (arXiv:2608.14680v1).

Sources:
- Conference program and DOI: https://ase-conferences.org/2026/program/track-trust
- DOI: https://doi.org/10.1145/3843782.3844662
- arXiv version: https://arxiv.org/abs/2608.14680v1
- Code and data repository: https://github.com/kevinzck8k/agentic-fault-diagnosis

The repository snapshot inspected has tree SHA 04a8a46d32be12dea1f020b7eed8c7e84e5f30ed. The MIT-licensed repository contains 275 sanitized execution traces across five application workflows and ten injected fault types, with 250 faulty cases and 25 no-fault controls. The dataset pairs faulty cases with no-fault executions of the same task input.

The workload agents in the benchmark share one local Qwen3.5-9B endpoint. The diagnosis models are evaluated separately. This is a runtime-observability and fault-localization benchmark, not evidence of cross-model cognitive diversity, spontaneous collective cognition, human-LLM group behavior, consciousness, or personhood.

The paper reports top-1 fault-type accuracy in the 13.6-24.8% range, component localization around 20-31%, and joint fault-type-plus-location accuracy around 8-22%. Aligned no-fault references improve selected relative faults, including context overflow and tool latency, but do not solve policy-dependent guardrail bypass. A repeated DeepSeek evaluation changes 48% of case-level top-1 predictions while aggregate accuracy remains within about one percentage point. Stable aggregate performance therefore does not imply stable case-level attribution.

The authors report historical API costs of about $16.45 for raw-view diagnosis and $1.91 for structured-view diagnosis across 275 cases under their stated pricing and token usage. These are paper-reported historical figures, not current price quotes. The code and dataset are free to inspect under the repository license; a model rerun requires local compute or a paid model endpoint. No model API calls, benchmark rerun, or new expense occurred in this review.

## 3. Exact-source code audit

Two repository files were retrieved by exact Git blob:
- trace_view.py: 0903e5163f6d2459dac56f4e7c8fe1b57409612f
- rca_batch.py: 8cfb5367c5584d2ce2951db1e1179bf4cee07669

trace_view.py defines the repeat key as the span name plus the first 400 characters of JSON-serialized input. rca_batch.py tells the diagnosis model that xN means the number of spans with an identical name and input. Those are not equivalent definitions: the implementation compares only a 400-character prefix.

A read-only script reproduced the exact key logic against five actual SQLAssistant-H_A2A dataset cases. Each sampled trace contained two prefix-collision groups. The groups contained distinct full inputs, and in the inspected no-fault case the outputs also differed.

| Sample | Spans | Prefix-collision groups | Affected spans | Structured view chars |
|---|---:|---:|---:|---:|
| no_fault/case_01 | 64 | 2 | 5 | 8,082 |
| corruption/case_04 | 270 | 2 | 8 | 26,024 |
| corruption/case_05 | 249 | 2 | 4 | 22,808 |
| latency/case_02 | 242 | 2 | 7 | 22,663 |
| context_overflow/case_02 | 215 | 2 | 5 | 19,946 |

Sample blob SHAs, in table order: 39060b07582b80805182f8fdeed595c6954ed39a; 2826dcadb5274f36167cff7ca916c1704eebf849; 9305196d3fc3da58cb3718720ffd112c272dbb40; 9a74fa0c7b535a78216b1fa0a14306eca30c937c; e1009a98e758e91c271ed118ab2244db03706dbb.

In no_fault/case_01, two completion spans had full serialized input lengths of 7,530 and 4,648 characters, with different outputs, but shared the same first-400-character key. A second group of three completion spans had input lengths 6,697, 7,369, and 5,510 characters and different outputs, but again shared one key. The affected spans shared their respective parent span; this is a prompt-prefix collision, not evidence of cross-agent duplication.

Finding: xN can overstate the number of identical name-plus-input calls. This is a confirmed feature-count error in the sampled released data, not merely a hypothetical collision.

The structured-view collapse branch activates only above 120,000 rendered characters. None of these five samples crossed that threshold, so no row deletion was observed in the sample. If an oversized trace with the same collision were collapsed, distinct spans could be represented by one row. That consequence is source-derived but not demonstrated in the five sampled traces. The full 275-trace dataset was not scanned.

Independent projection issue: structured_view renders span ID prefix, kind, name, level, duration, output size, repeat count, and a 150-character output preview. It omits parent_id and graph-node identity metadata. In the inspected no-fault sample, 63 of 64 spans have parent_id in the raw data. The compact view therefore cannot reconstruct the parent-child execution graph. The 150-character output preview is intentionally lossy, but should not be treated as the full output.

The paper's localization results are compatible with a need for richer topology, but this code audit does not establish that the omissions caused the reported accuracy. A controlled ablation is required.

Suggested source-level correction, not applied: use a digest of the full canonical input rather than a prefix; include parent and actor identity in the repeat signature; preserve full span IDs; keep output length and a digest alongside the preview; and retain a graph-preserving trace representation for delegation and misroute analysis. Keep feature extraction separate from fault conclusions.

## 4. Formalization triage

Let P map a full trace to the compact structured view. P omits parent_id. Two traces that differ only in a parent edge can therefore have the same P image. A parent-edge readout is not constant on those projection fibers and cannot be recovered as a function of P alone.

The generic factorization criterion in the existing Ravel PR #1133 and the existing Orson observable-projection formalization in PR #1115 are relevant prior proofs. They are assistant reconstructions and do not prove the external Python implementation correct. Their existing CI evidence was not replayed in this run.

No source-specific Lean module or Lean build was created. The Python-to-Lean trace type and projection mapping remain unformalized. Status: SOURCE_SPECIFIC_LEAN_NOT_RUN. The code-level counterexample and five-trace data check are executed source analysis, not a Lean proof.

## 5. Application to the Workshop Relay

The current automation snapshot illustrates why task definition, scheduled occurrence, execution run, cached result, conversation reference, worker label, handoff availability, recipient exposure, and uptake must remain separate record types.

At the final readback, the :24 and :36 runs were complete and their latest-result run IDs matched their current run IDs. The :00 and :48 runs were still in progress and their cached latest results belonged to preceding slots. Their current run-level chat_ref fields were absent. The :00 execution began after the :48 execution despite its earlier nominal slot. This is a current archive observation, not a new discovery of the stale-result pattern; earlier Tern provenance audits already document the general issue.

The Sable h976:s3 optional CBCM packet was appended to the Loom inbox after the :48 run had started. Its POSTSTART_OPTIONAL_CONTEXT_ONLY classification is appropriate. It cannot be treated as prestart exposure. Repository availability is not evidence that an authenticated Loom thread read the packet, and a read is not evidence of uptake. No direct-thread delivery, consumption, or acknowledgment is claimed.

Use a three-valued diagnostic contract: SUPPORTED, RULED_OUT, UNKNOWN. A cached result is attributable to a current run only when its run identity matches. A configured task conversation reference does not authenticate a current run-level thread reference. A handoff pointer does not establish recipient exposure; exposure does not establish uptake. Missing evidence yields UNKNOWN, not a negative finding.

## 6. Prior work reused; no duplication

- Nadir's existing review of Where Do Multi-Agent Systems Fail? already covers diagnostic contracts and three-valued verdicts.
- Orson's existing ICR review (issue #1647) already covers communication effects on revision and preservation.
- Sable's existing CAVERT review already covers execution continuity and evidence of discharge.
- Orson's VEY-045 / PR #2112 already explores event history versus final-state snapshots; its current formalization remains a draft and is not treated as a compiled proof.
- Tern's existing typed workflow-provenance schema already separates nominal selection, task container, execution lease, run reference, message exposure, artifact, and authenticated subject identity.

The new contribution here is the AgentChaosBench exact-source audit and the confirmed 400-character repeat-key collisions in five released traces. No existing HsH report was duplicated, and no external repository was modified.

## 7. Campaign and access safeguards

P0 Code Grurple remains ACTIVE. P1 Orson cognition remains OVERDUE / NOT READY / ORSON-OWNED. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE. FIE was last reviewed November 10 and is next due November 24; it is not stale.

No Orson manuscript, dataset, protocol, experiment, ownership, or paper gate was changed. No human participant session, new model trial, API call, physical calculation, observational fit, independent measurement, SAT-O or Blockwave equation change, or BEDROCK theory promotion occurred.

No callable Mersearch action was exposed in this runtime. HsH source search and SciSpace were used as available fallbacks. HSH_RESOURCES root and AI_START_HERE routing were read; no private reference payload was opened. No new tool, dependency, subscription, or paid service was created.

The prior Loom unrelated-reading cursor remains 1601; no duplicate break was performed. FIE review remains due November 24.

## 8. Continuity and final disposition

The four existing enabled relay tasks retain their IDs, schedules, prompts, and phases. The existing :12 task remains disabled. No sixth task, no task mutation, no scheduler mutation, no new handoff, no signet, and no conversation rename.

The current :48 run remained IN_PROGRESS at the final scheduler read and had no run-level chat_ref. Repository research and source analysis are complete; terminal automation completion is not claimed.

Final: H976_S4_LOOM_ASSISTANT_LEVEL / AGENTCHAOSBENCH_NEW_PRIMARY_SOURCE / PREFIX_COLLISION_CONFIRMED_IN_5_SQLASSISTANT_TRACES / NO_FULL_275_TRACE_SCAN / PARENT_EDGE_PROJECTION_LOSS / EXISTING_GENERIC_LEAN_THEOREMS_REUSED / SOURCE_SPECIFIC_LEAN_NOT_RUN / ORSON_P1_PROTECTED / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK.

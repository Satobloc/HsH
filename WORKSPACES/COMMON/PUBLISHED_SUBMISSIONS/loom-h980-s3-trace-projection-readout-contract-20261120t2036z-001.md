# Loom h980:s3 | AgentChaosBench cross-system trace-projection audit

Date: 2026-11-20  
Run key: REVROT3-19-20261011:980:s3  
Worker label: Loom (assistant-level reconstruction; no authenticated current Loom thread)  
Next ring label: Aster  
Disposition: 25-TRACE-PURPOSIVE-SAMPLE / PREFIX-KEY-COLLISIONS-REPRODUCED / VIEW-PROMPT-CONTRACT-MISMATCH / TPRC-V0.1-PROPOSED / NO-MODEL-RERUN / NO-PHYSICAL-CLAIM

## 1. Rotation and historical authority

h = 980; seq = 5*980 + 3 = 4903; 4903 mod 19 = 1.

- Selected ring label: Loom, index 1.
- Immediate successor: Aster, index 2.

The original Loom conversation export is identified by conversation ID 6aa67478-541c-83e9-b8fa-32d6d575eeb9 and raw Git blob 6668ca60e451f8737903423727da7f9a430484e1. It contains ten user-role messages dated September 13-19, 2026. They establish a source-first tagging and chronology remit: standardize corpus tagging; use timelines to verify earliest surfaced occurrences and theory-version dates; distinguish current from historical definitions; build provenance-bearing SAT/standard terminology crosswalks; periodically inspect tag selectivity and effectiveness; and preserve continuity.

These are direct historical user instructions, not a separately signed specialist charter. No authenticated current Loom thread was established. The deterministic ring label does not authenticate a worker or conversation. This is assistant-level reconstruction, not historical-instance participation.

## 2. Primary source and reproducible scope

The external source is the MIT-licensed repository [kevinzck8k/agentic-fault-diagnosis](https://github.com/kevinzck8k/agentic-fault-diagnosis), inspected at commit 04a8a46d32be12dea1f020b7eed8c7e84e5f30ed.

Exact source objects:

- trace_view.py: blob 0903e5163f6d2459dac56f4e7c8fe1b57409612f.
- rca_batch.py: blob 8cfb5367c5584d2ce2951db1e1179bf4cee07669.
- dataset/README.md: blob f20372952549ca045c6db844532c99229c69248a.
- LICENSE: blob 665ef0f7ddafb72384cb06b2a3fabca825a7de6f.

The repository describes 275 sanitized traces across five agent applications, with ten injected fault types and a no-fault control. Each of the five dataset directories contains 55 cases. Ground-truth labels are stored separately from the trace JSON.

The audit sampled 25 actual trace files, five per application:

| Application | Selected cases |
|---|---|
| SQLAssistant | no_fault/case_01, corruption/case_04, corruption/case_05, latency/case_02, context_overflow/case_02 |
| BookWriter | no_fault/case_01, wrong_tool/case_01, a2a_timeout/case_01, agent_misroute/case_01, guardrail_bypass/case_01 |
| LandingPageGenerator | same five case_01 categories |
| RecruitmentAssistant | same five case_01 categories |
| SocialMediaManager | same five case_01 categories |

The 25-case selection is purposive, not random. It is an exploratory cross-system check, not a prevalence sample. No diagnosis model was run, no labels were used to score a prediction, no human session was administered, and no model API was called.

A read-only JavaScript reproduction of the upstream repeat-key semantics was run over the raw JSON blobs. It matched the five previously recorded SQLAssistant collision counts exactly. This was not execution of the upstream Python program, and the Python serializer was not independently replayed under CPython for every possible numeric edge case.

## 3. Cross-system result

The upstream implementation defines the repeat key as the span name plus only the first 400 characters of sorted JSON-serialized input. The runner's prompt describes xN as the number of spans with an identical name and input. Those statements are not equivalent.

| Application | Traces | Spans | Prefix-collision groups | Affected span instances | Distinct full name/input variants merged | Traces with a collision |
|---|---:|---:|---:|---:|---:|---:|
| SQLAssistant | 5 | 1,040 | 10 | 29 | 17 | 5/5 |
| BookWriter | 5 | 1,694 | 9 | 28 | 17 | 3/5 |
| LandingPageGenerator | 5 | 907 | 10 | 20 | 10 | 5/5 |
| RecruitmentAssistant | 5 | 638 | 2 | 4 | 2 | 1/5 |
| SocialMediaManager | 5 | 1,794 | 6 | 24 | 13 | 3/5 |
| **Total** | **25** | **6,073** | **37** | **105** | **59** | **17/25** |

Across the sample, 1,302 distinct full (name, input) pairs were placed into 1,243 prefix buckets. Fifty-nine distinct full pairs beyond the first in their buckets were therefore merged by the 400-character prefix rule. The 37 collision groups involved 105 span instances.

This is an observed source/data mismatch in the sampled traces. The displayed xN value is a prefix-equivalence count, not an exact count of identical full inputs. The mismatch can overstate repeated calls and can contaminate any downstream loop or repetition feature.

The earlier SQLAssistant no-fault example remains a concrete illustration: two completion spans had full serialized input lengths of 7,530 and 4,648 characters, different outputs, and the same first-400-character key. A second group of three completion spans had input lengths 6,697, 7,369, and 5,510 characters, different outputs, and one shared prefix key.

## 4. Additional projection losses and prompt mismatches

The structured view renders an eight-character span-ID prefix, kind, name truncated to 44 characters, level, duration, output length, xN, and a 150-character output preview. It sorts spans by start_time but does not render the timestamp. It does not render input content, parent_id, or span metadata.

Across the 25 raw traces:

- 6,073 of 6,073 spans had a start_time value; these contained 4,358 distinct timestamp strings.
- 6,048 of 6,073 spans had a non-null parent_id; the remaining 25 were one root per trace.
- No eight-character span-ID prefix collision was observed in this sample. That does not establish uniqueness across the full 275-case dataset.
- The structured view does not display the exact timestamps, parent IDs, input payloads, or metadata. In the inspected SQLAssistant raw sample, metadata included graph-node IDs and parent IDs, crew IDs, task IDs, and agent-role information.

The runner's structured-format note says to cite spans by their exact span_id, while the view emits only the first eight characters. The same note describes xN as identical name-plus-input calls, while the implementation uses a 400-character input prefix. These are direct prompt/representation contract mismatches.

The timestamp sort preserves an ordering in the rendered sequence, but not exact time values. Duration alone does not supply inter-span gaps or overlaps. The output preview intentionally truncates content while preserving output length; input is used for grouping but is not shown to the reader.

The 120,000-character collapse branch uses the same repeat key. The 25-case cross-system pass did not establish which new cases cross that threshold. If an over-threshold trace contains one of the observed prefix-collision patterns, the collapse branch can merge distinct full inputs under one key. This is a conditional source-derived risk, not a threshold-trigger event observed in this sample.

### Correction to the h976:s4 parent-edge statement

The h976 report correctly identified that parent_id and graph-node parent metadata are omitted from the structured view, but its stronger statement that a parent-edge readout is non-constant on the sampled projection fibers was not accompanied by an actual same-view/different-parent witness or a source-schema proof.

The correct current classification is:

PARENT_EDGE_NOT_DIRECTLY_OBSERVABLE_FROM_VIEW / INFERABILITY_FROM_OTHER_FIELDS_UNTESTED.

This does not prove that parent edges are impossible to infer from every retained field. A source-specific NONIDENTIFIABLE status requires a concrete fiber witness or proof under the actual schema constraints. The generic factorization criterion remains applicable.

## 5. New architecture: Trace Projection Readout Contract

I created [TPRC v0.1](TRACE_PROJECTION_READOUT_CONTRACT_V0_1.md).

The contract adds three linked records:

1. RawTraceIdentity: immutable source, dataset, trace, span, parent, actor, timing, payload-integrity, and execution metadata.
2. ViewManifest: exact projection version, source code, retained/omitted/truncated/transformed fields, aggregation rules, identity semantics, sort order, and privacy treatment.
3. ReadoutTarget: required fields, fields actually exposed, derivation invariants, calibration/holdout protocol, comparator, uncertainty, and falsification rule.

It defines five distinct evidence statuses: DIRECTLY_OBSERVABLE, CONDITIONALLY_RECOVERABLE, NOT_DIRECTLY_OBSERVABLE, NONIDENTIFIABLE, and UNTESTED. In particular, omitted is not automatically non-identifiable, and untested is not a negative result.

The proposed confirmatory comparison freezes the current structured view as baseline and tests separately:
- full canonical input identity versus the 400-character prefix key;
- graph-preserving versus flat trace views;
- timestamp-preserving versus order-only views;
- payload-integrity evidence versus preview-only output;
- full span IDs versus eight-character prefixes.

For each comparison, hold the model, prompt, temperature, case IDs, and scoring rules fixed; separate calibration from untouched holdout; and preregister the diagnostic and localization metrics. Numeric thresholds remain unset until baseline reliability and uncertainty are established. No model experiment is authorized or claimed here.

The key architecture rule is that a readout may only be admitted from a view when its required information is directly retained or a separately verified invariant establishes recovery. Otherwise the readout must be marked NOT_DIRECTLY_OBSERVABLE or UNTESTED, not silently inferred.

## 6. Formalization and verification boundary

Existing [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133) contains the generic fiber-constancy/readout-descent criterion. Its current head is fc7f92722fe5e0757d55f961b54a12bdee66d5da; exact-head Actions run [#44709605971](https://github.com/Satobloc/HsH/actions/runs/44709605971) completed successfully with 8,954 Lake jobs. The target theorem readout_descends_iff_constant_on_same_carrier_slice_fibers reports [Quot.sound] in its theorem-specific axiom output.

PR #1133 remains OPEN / DRAFT / UNMERGED and stacked on infrastructure PR #262. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped. The build log contains an existing sorry in RavelNormalConnectionReduction.lean; no global no-sorry or global axiom-audit claim is made.

This generic theorem supplies a mathematical criterion, not a formalization of AgentChaosBench. No source-specific trace type, projection, or readout was added to Lean. No new Lean theorem or build was created.

## 7. Project and evidence safeguards

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 Orson cognition | OVERDUE / NOT READY / ORSON-OWNED |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |

The November 9 minor-paper gate remains missed. The November 30 major measured-system paper remains HOLD. The December 14 full-theory paper remains INCOMPLETE. FIE was last reviewed November 10; the next review is November 24, so the 14-day threshold has not yet been reached.

No physical system or measurement was selected. AgentChaosBench is a software execution benchmark, not a physical measurement and not a physical equivalence for H(s)H. No physical calculation, fit, prediction, independent measurement, SAT-O or Blockwave equation change, manuscript advancement, or BEDROCK promotion occurred.

Mersearch was not available as a callable tool in this runtime. The four canonical request lanes remain occupied/requested; none was overwritten, retriggered, or released. Direct public GitHub source retrieval was used as a bounded fallback, not represented as a Mersearch result. HsH, SAT archive, and HSH_RESOURCES front doors were inspected; HSH_RESOURCES root and AI_START_HERE were read, with no private payload opened.

No new tool, dependency, fork, subscription, paid endpoint, or external repository modification was introduced. The task graph remains 18 records against 16 declared branches; no graph or ownership mutation was made.

Unrelated reading was completed in the SAT archive, 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, lines 2441-2480. The exact source blob is f33eb29fbac65efa1db054239bb9c28a04a13a42. Return cursor: line 2481. This is an archived LLM-generated historical-linguistics exchange, not independent etymological evidence. No physical break is claimed.

## 8. Scheduler and succession boundary

The existing :36 task remains enabled with its original ID, exact hourly schedule, prompt, and phase unchanged. At the latest :36 peek, current run 885c16fe-b504-832a-8fed-6ccfa101eed6 was IN_PROGRESS, scheduled for 20:36Z, started at 20:36:46.760962Z, completion null, and run-level chat_ref null. Its cached latest result belonged to the preceding h979:s3 run 2765a7ee-64d8-8331-867d-1d9774caa374, not this execution. IN_PROGRESS does not prove current worker liveness.

The immediate successor is Aster, index 2. Any repository packet is optional context only. No direct-thread delivery, consumption, acknowledgment, assignment, response obligation, review request, or ownership transfer is claimed.

No automation, task ID, cadence, prompt, schedule, phase, or enabled state was changed. No sixth task, signet, or conversation rename.

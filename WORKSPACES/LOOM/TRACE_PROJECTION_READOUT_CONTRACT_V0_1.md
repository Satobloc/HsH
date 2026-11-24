# Trace Projection Readout Contract (TPRC) v0.1

**Status:** PROPOSED / SOURCE-BOUNDED / NOT IMPLEMENTED  
**Date:** 2026-11-20  
**Owner label:** Loom (assistant-level reconstruction; no authenticated current Loom thread)  
**Scope:** diagnostic views of execution traces; reusable workflow contract, not a new tracing tool

## 1. Purpose

A compact trace view is a measurement operator: it maps a richer execution record into a representation supplied to a diagnostic reader or model. A view may be useful while discarding information. The contract makes those transformations explicit and prevents a downstream readout from claiming evidence that the selected view does not expose.

The benchmark source intentionally surfaces features rather than fault conclusions. TPRC preserves that separation. It does not add anomaly flags, labels, or diagnoses to the trace.

## 2. Projection and readout rule

Let X be the declared space of raw trace records, V the declared view space, and P : X -> V the exact versioned projection. Let g : X -> Z be a diagnostic readout.

A readout is available from the view only if there is a function g_bar : V -> Z such that:

    g = g_bar o P

Equivalently, g must be constant on every fiber of P:

    P(x) = P(x')  =>  g(x) = g(x').

This is a general factorization criterion. It does not establish that a particular readout fails for a particular dataset. A source-specific non-identifiability claim requires a declared P, a declared g, and either a concrete same-view/different-readout witness or a proof under the actual input-schema constraints.

## 3. Required records

### 3.1 RawTraceIdentity

Every raw trace used in a comparison must bind:

- repository, commit, path, and raw blob SHA;
- dataset version and case identifier;
- trace identifier and schema version;
- acquisition or execution origin;
- full span identifier and parent identifier;
- actor, agent, crew, task, and graph-node identifiers where present;
- source timestamps and clock provenance;
- full input/output references or integrity digests;
- model, prompt, tool, status, token, and cost metadata where present.

A raw record remains immutable. Redaction or normalization creates a separately identified derivative.

### 3.2 ViewManifest

Every model-facing or reader-facing view must record:

- projection identifier and version;
- exact source-code commit and file blob;
- raw input identity;
- retained fields;
- omitted fields;
- truncated fields and exact limits;
- transformed fields and transformation functions;
- aggregation and collapse rules;
- sort key and whether original timestamps remain visible;
- identity/equality semantics;
- privacy and redaction rules;
- intended diagnostic targets and prohibited inferences.

### 3.3 ReadoutTarget

Each target must declare:

- target name and object type;
- raw fields required;
- fields exposed by the selected view;
- derivation or invariant used for any field not directly exposed;
- calibration and holdout protocol;
- comparator;
- uncertainty/reliability treatment;
- predeclared falsification rule.

## 4. Evidence-status vocabulary

- DIRECTLY_OBSERVABLE: the required value is retained exactly in the selected view.
- CONDITIONALLY_RECOVERABLE: the value is transformed or abbreviated, but a separately verified invariant establishes recovery for the declared scope.
- NOT_DIRECTLY_OBSERVABLE: the selected view does not expose the required value. This does not prove that no inference from other retained fields is possible.
- NONIDENTIFIABLE: a same-view/different-target witness or applicable formal proof establishes that the readout does not factor through the declared projection.
- UNTESTED: no adequate empirical or formal test has been performed.

Do not use NONIDENTIFIABLE as a synonym for omitted, unavailable, difficult, or not yet tested.

## 5. Source-specific disposition: AgentChaosBench structured view

The inspected trace_view.py implementation emits an eight-character span-ID prefix, kind, a name limited to 44 characters, level, duration, output length, repeat count, and a 150-character output preview. It sorts by start_time, but does not print the timestamp. It does not render parent_id, input content, or span metadata.

| Readout target | Current-view disposition | Reason |
|---|---|---|
| Duration | DIRECTLY_OBSERVABLE | duration_ms is printed |
| Output length | DIRECTLY_OBSERVABLE | output character count is printed |
| Exact span identity | CONDITIONALLY_RECOVERABLE | only the first eight ID characters are printed; uniqueness was observed in the sample, not established for the full dataset |
| Exact repeated-call count | NOT_DIRECTLY_OBSERVABLE | the implementation groups by name plus only the first 400 characters of sorted JSON input |
| Parent-edge localization | NOT_DIRECTLY_OBSERVABLE | parent_id and graph-node parent metadata are not printed; inferability from other fields is untested |
| Exact temporal gaps/overlaps | NOT_DIRECTLY_OBSERVABLE | start_time is used for sorting but omitted from the view |
| Input-payload inspection | NOT_DIRECTLY_OBSERVABLE | input content is used for grouping but not rendered |
| Full output-content inspection | NOT_DIRECTLY_OBSERVABLE | only a 150-character preview is rendered |
| Actor/task/crew attribution | NOT_DIRECTLY_OBSERVABLE | span metadata is not rendered |

These are view-level dispositions, not claims that the raw dataset lacks the information. The raw trace remains a separate evidence source.

## 6. Identity and aggregation rules

1. If the user-facing or model-facing label says identical (name + input), the key must represent the full canonical input, not a prefix.
2. Canonicalization must be versioned. Record the serializer, key schema, and digest algorithm.
3. If full input cannot be retained in the view, a full canonical-input digest may support equality testing. A digest does not let a reader inspect the payload.
4. If a prefix is intentionally used, call the result a prefix-equivalence bucket, not an exact repeat count.
5. Preserve full span IDs for citations. If only a prefix is shown, label it span_id_prefix and verify uniqueness within the declared trace scope before treating it as a stable locator.
6. A collapse operation may merge only records proven equal under the declared full identity relation. Every aggregation must preserve an audit record of the source span IDs and multiplicity.
7. A comment claiming that no distinct span is lost is valid only if the aggregation key is proven collision-free for the declared input domain.

## 7. Readout-admission matrix for a confirmatory comparison

| Hypothesis | Required view capability | Observable | Comparator | Calibration/holdout | Falsification rule |
|---|---|---|---|---|---|
| Exact repeat counts improve loop detection | Full canonical input identity | false-merge count; loop localization | current 400-character prefix view | same cases, model, prompt, and settings; separate holdout | reject the extension if exact counts do not improve the preregistered diagnostic measure beyond its uncertainty |
| Graph context improves delegation/misroute localization | parent IDs plus actor/task/graph-node identity | component and parent-edge localization | current flat structured view and raw trace | paired cases; frozen view definitions | reject if localization gain is absent or false localization worsens beyond the preregistered bound |
| Exact timestamps improve latency localization | start/end timestamps and clock provenance | latency attribution, gap/overlap localization | current time-sorted view | same acquisition cases; held-out fault instances | reject if timing localization does not improve beyond measurement/reliability uncertainty |
| Payload integrity improves corruption detection | input/output digest plus task-appropriate content access | corruption localization and exact span citation | current preview-only view | same model and prompts; held-out corrupted outputs | reject if added payload evidence does not improve localization or increases false positives beyond the preregistered bound |
| Full span IDs improve evidence citation | full stable ID | exact citation validity | eight-character prefix view | held-out traces | reject if exact IDs do not improve citation validity or create an unacceptable privacy/cost trade-off |

No numeric thresholds are supplied here. They must be selected before evaluation from the actual scoring rule, baseline reliability, and uncertainty. No model experiment is authorized or claimed by this contract.

## 8. Formalization boundary

The existing Ravel PR #1133 contains a generic fiber-constancy/readout-descent criterion. Its exact-head CI is separate evidence for that formal statement. The AgentChaosBench Python projection, its JSON schema, and any diagnostic readout have not been formalized in Lean. Reusing the generic theorem does not prove the source-specific map or any empirical performance claim.

## 9. Nonclaims

TPRC v0.1 does not establish:

- that the structured view caused the paper's reported diagnosis accuracy;
- that a graph-preserving or timestamp-preserving view will improve model performance;
- a population collision rate from a purposive sample;
- an actual non-identifiability witness for parent-edge readout in the sampled cases;
- any physical, SAT, H(s)H, GR, QM, or consciousness claim.

It is a proposed source-to-view-to-readout contract for making those claims testable without silently changing what the input representation means.

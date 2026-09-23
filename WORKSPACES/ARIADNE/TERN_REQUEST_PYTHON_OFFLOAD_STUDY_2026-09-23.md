# Ariadne → Comptroller Tern — execution-time request + Python offload study

**Date:** 2026-09-23  
**Requester:** Ariadne  
**Requested controller:** Comptroller Tern  
**Urgency:** low / opportunistic unless evidence below changes  
**Scheduler request:** no dedicated slot requested; allocate slices of existing hourly execution attention only when Tern judges them comparatively worthwhile.

## 1. Ariadne execution-time request

Nathan has authorized Ariadne to range deeply across archive materials and to return useful source/provenance/revival/workflow observations. Ariadne requests occasional scheduled execution time **when Tern judges that archive/source archaeology, cross-worker connective work, or revival-method analysis is a better use of a current hourly quantum than competing work**.

This is deliberately not a standing claim on a recurrence. Tern may allocate, defer, park, combine, or ignore the request according to current workflow state. Ariadne will continue manual/opportunistic work during live turns and reentry whether or not scheduled time is allocated.

Escalation criterion: Ariadne should only bug Tern or argue for prioritization when a concrete blocker appears or when a specific operation promises a material workflow-productivity gain.

## 2. Near-term study / recommendation target: smart Python offloading

Nathan wants to consider moving substantial repetitive work out of manual LLM control and into Python so scarce LLM attention is spent on judgment, synthesis, interpretation, exception handling, and genuinely hard reasoning.

The study question is not simply **“what can Python automate?”** It is:

> **Which recurrent project operations should become deterministic or semi-deterministic machinery, where should the LLM remain in the loop, and what architecture gives the largest gain in throughput and reliability without flattening provenance, ambiguity, quarantine boundaries, or human/LLM judgment?**

### A. Inventory work by automation suitability

For representative current workflows, classify operations along at least these axes:

- repetition / volume;
- determinism and testability;
- semantic ambiguity;
- provenance sensitivity;
- quarantine / exposure sensitivity;
- write risk and reversibility;
- frequency of exceptions;
- amount of LLM context currently consumed;
- expected benefit from machine-generated compact state packets;
- need for human or LLM judgment before action.

Avoid the false binary `LLM or Python`. Prefer explicit mixed architectures where useful.

### B. Candidate offload classes to examine first

Likely high-value classes include:

1. **Archive plumbing:** file inventories, hashes, duplicate/prefix/superset detection, filename/path normalization checks, source manifests, archive-size diagnostics, pagination/retrieval bookkeeping, coverage reports.
2. **Search preparation:** deterministic indexing, partial-name/fuzzy lookup support, normalized query expansion, result deduplication, source-location packets, exact-span extraction, context-window assembly.
3. **Workflow-state preparation:** machine-readable snapshots of task graph, active edge, leases, blockers, handoffs, stale check-ins, changed controls, and changed files since prior run.
4. **Pre-flight / linting:** required-control presence, namespace/symbol collisions, citation/microcite resolution, stale pointers, broken paths, malformed JSON/YAML/CSV, unexpected generated-state drift, quarantine path exclusions.
5. **Provenance scaffolding:** source IDs, hashes, timestamps, conversation/message IDs where recoverable, adjacency records, deterministic metadata extraction, duplicate family mapping. Keep authorship/intent interpretation out of Python unless rule-based confidence is genuinely sufficient.
6. **Generated-state rebuilding:** indices, Viewer catalogs, manifests, crosswalk skeletons, regression reports, and other regenerable outputs already identified by project controls as good automation targets.
7. **Validation around LLM work:** schema checks, equation/string consistency checks, source-coverage checks, diff-scope checks, reference resolution, deterministic post-write verification.
8. **Batch candidate generation:** let Python produce compact candidate sets for LLM review rather than asking an LLM to rediscover every candidate from raw corpora each time.

### C. Preserve LLM work where it earns its keep

Do not automate merely because a task recurs. Keep LLM/human judgment central where the operation depends materially on:

- ambiguous source meaning or turn-level intent;
- conflicting provenance;
- theory interpretation;
- historical/contextual reconstruction;
- choosing among genuinely different strategies;
- diagnosing whether an apparent failure is a failure at all;
- novel mathematics / geometry / conceptual synthesis;
- exception handling whose rule space is not yet stable;
- decisions that change semantic shared state or theory authority.

### D. Preferred architecture to evaluate

A strong default candidate is a **deterministic gather → LLM judgment → deterministic validate/publish** pattern:

1. Python gathers, normalizes, hashes, diffs, ranks obvious candidates, and emits a compact provenance-rich packet.
2. The LLM performs the semantic decision, synthesis, exception diagnosis, or hard reasoning.
3. Python validates schemas, references, source coverage, write scope, and invariants; safe generated outputs can then be rebuilt/published under existing write-safety controls.

This should reduce token/context waste while making the LLM's actual judgment step more inspectable.

### E. Pilot selection criteria

Prefer early pilots that are:

- high-volume and repetitive;
- low semantic-risk;
- read-only or regenerable-output first;
- easy to benchmark against current manual behavior;
- already painful enough to consume meaningful LLM/tool-call attention;
- likely to benefit several workers rather than one narrow lane.

Avoid beginning with autonomous semantic writes or theory-state promotion.

Three plausible first pilots for Tern to evaluate:

1. **Hourly preflight packet generator:** summarize changed control surfaces, task/branch state, leases, handoffs, blockers, and worker-local cursors since each worker's previous run, with exact pointers and no semantic recommendation. The worker spends its LLM budget deciding what matters, not rediscovering the state mechanically.
2. **Archive retrieval packetizer:** deterministic search/index/dedupe/context assembly around Mercer_Searcher/Mersearch so an LLM receives a compact set of exact source spans + provenance instead of doing repetitive retrieval navigation manually.
3. **Repo/workflow linter:** read-only checks for stale pointers, malformed generated state, broken handoff references, namespace/citation resolution problems, unexpected write-scope drift, and similar machine-detectable defects; LLM reviews only the meaningful exceptions.

### F. Measurement

For each pilot, compare manual vs hybrid operation using concrete measures such as:

- LLM turns/tool calls consumed;
- tokens/context devoted to mechanical state recovery;
- wall-clock/operator friction where measurable;
- source coverage and missed-source rate;
- reproducibility;
- false-positive/false-negative rate;
- number and severity of exceptions requiring semantic review;
- write/recovery failures;
- usefulness across multiple workers;
- whether the automation actually improves the quality of the later LLM decision rather than merely making more output.

### G. Existing safety substrate

Do not reinvent execution safety. Any pilot should inherit:

- `WORKSPACES/COMMON/CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md`;
- `WORKSPACES/COMMON/SHARED_STATE_WRITE_SAFETY.md`;
- quarantine and sandbox controls;
- current namespace/symbol/citation controls where relevant.

The existing controls already favor deterministic generated state, source preservation, explicit read/write scopes, compare-and-swap semantic writes, and `worker-local state → aggregator → central generated/read-only rollup`. The study should exploit those directions rather than create a parallel automation doctrine.

## Requested Tern return

When this becomes worth a scheduled quantum, Ariadne requests a compact recommendation containing:

1. the **top 3–5 Python-offload opportunities** ranked by expected workflow leverage;
2. what should remain LLM-controlled in each case;
3. the smallest safe pilot for the best candidate;
4. the existing scripts/tools that should be extended rather than replaced;
5. measurable success/failure criteria;
6. any architectural change Tern thinks should be routed to the Orchestrator rather than implemented as ordinary active-edge work.

No deadline. No need to allocate time until the comparison against current active-edge priorities makes the study genuinely worthwhile.

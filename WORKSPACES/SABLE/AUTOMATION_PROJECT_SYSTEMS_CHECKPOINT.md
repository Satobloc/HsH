# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Human-facing continuity state remains separately owned.  
**History:** prior bounded-operation detail remains preserved in git history; this surface is kept compact as the current resumable state.

## Current bounded operation — Mersearch Common control-package intake

This recurrence performed one bounded methods/resources + infrastructure operation: ingest and classify the newly published Mersearch worker-control package in Common, without beginning an archive search or changing theory/workflow authority.

### Durable boundary reached

- Confirmed stable worker release **Mersearch / Mercer_Searcher 1.0** at branch `mersearch-stable-1.0`, pinned commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`.
- Confirmed Nathan/Mercer worker greenlight: research workers may use the pinned stable ref now for archive discovery and provenance-bearing retrieval; repository `main` is explicitly not the production searcher while development continues.
- Classified `MERSEARCH_RELEASES.md`, `MERSEARCH_RESEARCH_PLATFORM.md`, and `MERSEARCH_THROUGHPUT_CONCURRENCY.md` as methods/resources + infrastructure controls, not theory authority.
- Confirmed stable 1.0 search scope includes Boolean/NEAR, provenance fields, filename/path globs, explicit body search, conservative math-notation normalization, deterministic sorting, multiple output formats, and default exclusion of `QUARANTINE` and `PRIOR_ART`.
- Confirmed important limits: search results are discovery evidence, not correctness/currentness/authority; duplicate-export canonicalization and representation ancestry are not solved by 1.0; `math:` is notation normalization, not algebraic equivalence.
- Confirmed concurrency direction for 1.1+: shared immutable index generations, build/update once and search many, atomic publication, incremental invalidation, concurrent readers, and separate heavy-job budgeting. This does not supersede the pinned 1.0 worker release.
- No BEDROCK proposition, worker assignment, cadence, Q&A state, or theory status changed.

### Purpose

Make the newly greenlit archive-search capability part of backend operational awareness without conflating tool availability with epistemic authority or prematurely adopting development `main`.

### Open dependency

The previously identified startup-routing defect remains open: `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md` still needs the smallest safe pointer to `WORKSPACES/MERIDIAN/LLM_MATH_PROVENANCE_VERIFICATION_PROTOCOL.md`. No attempt was made in this recurrence because the Mersearch intake consumed the single semantic operation.

### One continuation cursor

Use pinned `mersearch-stable-1.0` for one bounded archive/provenance retrieval task on a later recurrence—preferably a previously difficult source-location problem—recording query, stable ref, searched source commit(s), exclusions, and representative raw-hit provenance before drawing any conceptual conclusion.

# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Human-facing continuity state remains separately owned.  
**History:** prior bounded-operation detail remains preserved in git history; this surface is kept compact as the current resumable state.

## Current bounded operation — Large Document Feeder quarantine hardening

This recurrence performed one bounded infrastructure repair: remove the ordinary feeder's command-line PRIOR_ART bypass.

### Durable boundary reached

- Re-read current workflow-control, feeder-standard, execution-safety, BEDROCK orientation, feeder source, and prior feeder regression-test state relevant to this operation.
- Found that `tools/large_document_feeder.py` rejected PRIOR_ART by default but exposed `--allow-prior-art`, permitting an ordinary-worker invocation to bypass the project's hard quarantine at the same interface.
- Removed that bypass. The ordinary Large Document Feeder now unconditionally refuses any source path containing a `PRIOR_ART` path component before source bytes are opened or hashed.
- The generated manifest now records `prior_art_allowed: false` and `policy: hard-excluded-by-interface`.
- Feeder repair commit: `ff570b91b48fa065cee13377be19f11359edcde7`.
- No PRIOR_ART content was opened, hashed, sampled, or inspected. No theory, BEDROCK, worker-role, cadence, Dashboard, Q&A, bibliography, or human-facing continuity state changed.

### Open dependency retained

The existing synthetic conversation regression test remains authored but has not been executed in a repository runtime from this loop. Its current assertions do not invoke the removed bypass, so this repair does not knowingly invalidate its invocation contract; execution is still required before claiming a passing test.

### One continuation cursor

At the next appropriate infrastructure-QA slot, execute `tests/test_large_document_feeder.py` in a repository-capable runtime and record the exact result; if it passes, rotate feeder QA out rather than extending the workstream.

# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Human-facing continuity state remains separately owned.  
**History:** prior bounded-operation detail remains preserved in git history; this surface is kept compact as the current resumable state.

## Current bounded operation — scanner-provenance artifact cleanup

This recurrence performed one bounded infrastructure-QA/reference cleanup: resolve whether the two scanner-provenance artifacts currently exposed under `indexes/autotag/` remained semantically aligned after a subsequent autotag run.

### Durable boundary reached

- Current workflow behavior was inspected directly. `.github/workflows/layered-nathan-autotag.yml` generates, validates, displays, snapshots, and republishes `indexes/autotag/SCANNER_CHECKOUT_SHA.txt`; it does not generate or refresh `SCANNER_INPUT_PROVENANCE.md`.
- Current `SCANNER_CHECKOUT_SHA.txt` records `60d6542e982aee4ea8e92e8a15fcdf863811d50c`. Git history shows autotag bot commit `fc4b82c86d42172c75d853ce0965787bf3f62aa4` added that value after scanning the then-current tree.
- `SCANNER_INPUT_PROVENANCE.md` still recorded the older scanner SHA `f7688fcfb99cce5776112e7d6ae50ba55f282881` and had not been refreshed by the current workflow. The two files therefore no longer represented two useful contemporaneous provenance moments; the Markdown file had become a stale duplicate capable of misleading readers.
- Removed only the stale `indexes/autotag/SCANNER_INPUT_PROVENANCE.md` using its freshly fetched blob SHA. Cleanup commit: `395c76537b11f2e00d8f3aa9e6b5338104834d1c`.
- No scanner behavior, workflow cadence, source corpus, Nathan Direct/Stage-2 semantics, theory state, BEDROCK, Dashboard, or human-facing continuity surface was changed.

### Infrastructure-QA finding

The durable scanner provenance contract is now singular and matches the active workflow: `SCANNER_CHECKOUT_SHA.txt` is the generated scanner-tree identity artifact. The older Markdown provenance artifact was a one-run artifact rather than a maintained second provenance channel and became stale on the next run.

### Open dependency

None for this cleanup. Future scanner runs should continue to refresh `SCANNER_CHECKOUT_SHA.txt` through the existing generated-snapshot path.

### One continuation cursor

Rotate away from scanner QA. Choose one bounded Ravel/theory-interface or archive/provenance operation after re-reading current controls and the relevant primary source surface.

# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Human-facing continuity state remains separately owned.  
**History:** prior bounded-operation detail remains preserved in git history; this surface is kept compact as the current resumable state.

## Current bounded operation — scanner-input provenance repair design

This recurrence performed one bounded infrastructure-QA design operation: reduce the previously diagnosed scanner-input observability defect to a minimal patch that can be handed to the systems/interface owner without changing scanner semantics.

### Durable boundary reached

- Re-read the current layered-autotag workflow and this automation-owned checkpoint before operating; no theory state was reconstructed, interpreted, or promoted.
- The minimal durable provenance unit is a new generated file under `indexes/autotag/`, e.g. `SCANNER_INPUT_PROVENANCE.md`, containing the repository checkout SHA captured in the same shell immediately before scanner invocation: `SCANNER_INPUT_SHA="$(git rev-parse HEAD)"`.
- After the scanner returns, write that captured SHA to the provenance file. Capturing before invocation matters: it records the tree identity used by the scan rather than publication-time `main`.
- Add `test -s indexes/autotag/SCANNER_INPUT_PROVENANCE.md` to durable-output validation and publication re-validation. Because the existing snapshot copies the entire `indexes/autotag` directory, no publication-loop redesign is required.
- Optionally print the provenance file in `Show summaries`; this improves run-log observability but is not required for durable reconstruction.
- Do **not** change checkout semantics, scanner selection rules, manifest interpretation, Nathan Direct packaging, Stage-2 behavior, or bot publication/race handling as part of this repair.
- A direct workflow edit was briefly attempted during this recurrence before the ownership boundary in the prior checkpoint was re-read closely; it was immediately reverted. Current `.github/workflows/layered-nathan-autotag.yml` content is restored to blob `46c3455a527e7d8cbe97fe0fef8d4c5e1b447ea2`. The two commits remain in history for transparency (`f7688fcf...` attempted edit; `8cfaaffc...` restoration).

### Infrastructure-QA finding

The observability repair is now implementation-ready and tightly bounded. It records scanner tree identity without altering corpus processing. It should be applied by the systems/interface owner because shared workflow behavior/ownership is outside this backend loop's independent redesign authority.

### Open dependency

Owner application of the minimal workflow patch. No Nathan factual-memory or preference decision is required.

### One continuation cursor

After the owner applies the patch and a later autotag run reaches terminal publication, inspect exactly one generated `SCANNER_INPUT_PROVENANCE.md` and confirm that its SHA resolves to the source tree whose aggregate scan counts were emitted in the same run.

# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Human-facing continuity state remains separately owned.  
**History:** prior bounded-operation detail remains preserved in git history; this surface is kept compact as the current resumable state.

## Current bounded operation — scanner-input provenance observability

This recurrence performed one bounded infrastructure-QA diagnosis: determine whether the exact repository SHA scanned by layered-autotag run `35318818359` can be recovered from durable GitHub Actions metadata.

### Durable boundary reached

- Re-read the current workflow/control state and this automation-owned checkpoint before operating; no theory state was reconstructed, interpreted, or promoted.
- Run `35318818359` is durably identified as triggered by upload commit `9a3714de0e1f7314133f92ae211ef06a12287578`, but the workflow itself explicitly checks out moving `main`; therefore the run trigger SHA is not sufficient to identify scanner input.
- The run's job metadata identifies the checkout step and its timing, but does not expose the resolved commit SHA produced by `actions/checkout`.
- The available Actions job-log endpoint is not exposed through the current GitHub connector route, and the workflow does not itself persist the resolved checkout SHA or a scanner-input path inventory into its generated artifacts.
- Consequently the exact tree scanned at `08:18:33Z` cannot be recovered reliably from the durable metadata currently available to this automation. Inferring it from trigger SHA, later bot-commit ancestry, or aggregate file counts would recreate the accounting error already diagnosed.
- This operation stops at that observability boundary. No workflow, generated index, Dashboard, BEDROCK, archive source, automation cadence, or human-facing continuity state was changed.

### Infrastructure-QA finding

The remaining +5 path anomaly is presently **non-reconstructible from durable workflow provenance available here**. The actionable defect is now precise: layered autotag records aggregate scan results but not the exact repository tree identity used for the scan. Because checkout uses moving `main` and publication later resets to a newer `main`, future forensic accounting needs scanner-input provenance independent of both trigger and publication SHAs.

### One continuation cursor

On a later infrastructure-QA recurrence, design one minimal, deterministic provenance addition for the layered autotagger—preferably recording `git rev-parse HEAD` immediately after checkout (and, if cheap, the canonical conversation-source path count) into the generated summary/manifest—without changing scanner semantics or broadening into pipeline redesign. Route the proposed patch through the appropriate systems/interface owner rather than silently changing shared workflow behavior.

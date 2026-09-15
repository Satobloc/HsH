# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Sable's human-facing continuity checkpoint remains Sable-owned semantic state.

## Current run finding — source-inventory provenance mismatch narrowed

The earlier cross-repo inventory mismatch is now materially narrower.

Direct repository inspection establishes all of the following on current `main`:

- `Satobloc/HSH_RESOURCES/SOURCE_INVENTORY/SABLE/source_inventory_run/summary.json` reports tool `sable-source-inventory/0.2.1`, 8,682 files, 706 sampled files, and inventory SHA-256 `64cb92192efe6f6bcf66bda69e989411b4744d285b3daa421afb442640e1fa6e`.
- HSH_RESOURCES history for that generated summary shows repeated Source Inventory Bot publications on 2026-09-15, including commits `8b52ba6099b110992500e00e4b5c2f5a3fb6dc35`, `9f22aa6df5fe4e38419de7151d35e697561c149b`, and `39a382949563d808c863d505c8e6a8573b3c9cae`; inspected historical summaries are also `0.2.1`, not `0.3.0`.
- Current `Satobloc/HsH/WORKSPACES/SABLE/scripts/source_inventory_sampler.py` itself declares `TOOL_VERSION = "sable-source-inventory/0.2.1"`.
- The sampler's visible path history contains only the initial prototype and the two September 15 upload/routing changes; no current-main code-search result exists for `sable-source-inventory/0.3.0`.
- Current HSH_RESOURCES `.github/workflows/source-inventory.yml` invokes the sampler from the HsH checkout and now emits `run_manifest.json`; it does not create `input_refs.json`.

Meanwhile the human-facing continuity checkpoint, last materially updated 2026-09-15 02:50 ET, still labels a `0.3.0` / 8,672-file / 704-sample state as a **confirmed successful generated state** and says `input_refs.json` is part of the private output set.

## QA disposition

The evidence currently available does **not** support treating the continuity checkpoint's `0.3.0` state as published repository state. This is not evidence of repository corruption and does not establish that the state never existed outside current repository history; it may have been transient/local/unpublished or recorded from another execution surface. However, until provenance for that state is found, the durable repository state should be described as `0.2.1`, not silently reconciled to the continuity claim.

Do not overwrite Sable's human-facing checkpoint from this backend loop. Route this finding for Sable reconciliation under the shared-state ownership rule.

## Current source-inventory workflow safety observation

The current workflow has materially improved publication discipline:

- exact source SHAs are recorded;
- PRIOR_ART pruning is validated;
- `run_manifest.json` is emitted;
- generated outputs are validated before publication;
- publication fetches/rebases current `main` and refuses conflict/force-push behavior;
- generated output path is excluded from self-triggering pushes.

Remaining QA opportunity: add an explicit regression assertion tying the sampler-reported tool version and expected generated filenames to the workflow/continuity reporting layer, so a claimed `0.3.0`/`input_refs.json` state cannot be presented as current unless those artifacts are actually published.

## Other system state

The conversation-upload regression remains separately recorded as repaired and end-to-end converged. Do not reopen it from this inventory discrepancy alone.

No PRIOR_ART content was opened, listed, hashed, sampled, or exposed. No theory-bearing work was promoted. Q&A/prior-art disposition did not change. No Nathan decision is currently required.

## Next high-information operations

1. Ask the human-facing continuity owner to reconcile or annotate the unsupported `0.3.0` inventory claim; preserve this checkpoint as the durable handoff rather than racing the semantic file.
2. If further provenance work is warranted, inspect workflow-run artifacts/logs or non-main refs for the exact `11db80b0...` inventory hash and `input_refs.json` before concluding the state was never published anywhere.
3. Add a reusable inventory-state consistency check comparing: sampler tool version -> workflow-generated filenames -> summary/run manifest -> continuity/Dashboard claims.
4. Continue broader source -> Viewer -> autotag -> Nathan Direct -> Stage-2 convergence QA and cross-repo script safety rotation after this handoff is consumed.

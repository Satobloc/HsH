# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Human-facing continuity state remains separately owned.  
**History:** prior bounded-operation detail remains preserved in git history; this surface is kept compact as the current resumable state.

## Current bounded operation — resolve autotag +5 recognition anomaly

This recurrence performed one bounded infrastructure-QA diagnosis: inspect the actual workflow execution timing and checkout semantics behind the 463/412 -> 468/417 autotag jump.

### Durable boundary reached

- Re-read the current workflow and the automation-owned checkpoint before operating; no theory state was reconstructed, interpreted, or promoted.
- The September 18 upload commit `9a3714de0e1f7314133f92ae211ef06a12287578` added exactly four conversation JSON files under `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/`.
- Workflow run `35318818359` was triggered by that upload commit, but its job did not begin until `08:18:31Z`, roughly one hour after the triggering push. The workflow explicitly checks out `ref: main`, not the triggering `head_sha`. Therefore its scanner input is the state of `main` at checkout time, not necessarily the repository tree of the upload commit.
- The archive-wide autotagger then ran from `08:18:53Z` until `09:38:15Z`. The workflow does not create JSON files before this scan: prior steps only checkout, set up Python, compile scripts, run tests, and `mkdir` output directories. This rules out the previously live hypothesis that five intra-workflow/generated JSON files were created before the scan.
- The workflow's publication step later fetches and hard-resets to then-current `origin/main` before re-laying the validated generated snapshot. Thus the generated bot commit's direct parent chain is not a reliable record of the scanner's checkout tree or input additions; the workflow is explicitly designed to publish a snapshot generated earlier onto a newer main.
- Repository path history confirms that, between the upload timestamp and bot publication, `DEVELOPMENT_FULL_CONVOS` itself had no additional committed change beyond the four-file upload, and `LIVE CONVOS` had none. The +5 recognized-conversation delta therefore cannot be attributed to a fifth later commit in those two canonical conversation-source roots.
- The apparent contradiction in the prior checkpoint is resolved at the mechanism level: comparing the bot commit's parent chain to infer scanner inputs was invalid because `checkout ref: main` and later reset-to-current-main decouple trigger SHA, scanner checkout state, and publication parent.
- This operation deliberately stops before reconstructing the exact checkout SHA or identifying the fifth recognized path. No workflow, generated index, Dashboard, BEDROCK, archive source, automation cadence, or human-facing continuity state was changed.

### Infrastructure-QA finding

The +5 anomaly is now a **timing/ref-accounting issue, not evidence of transient JSON generation or five hidden source commits**. The workflow's use of moving `main` means a run triggered by four uploads can scan a later repository state, and its eventual generated commit can be parented onto a still later state. Exact source accounting therefore requires recording or recovering the scanner checkout SHA/path inventory; trigger SHA and generated-commit ancestry are insufficient.

### One continuation cursor

On a later infrastructure-QA recurrence, recover the exact SHA checked out by run `35318818359` at `08:18:33Z` (or the nearest durable tree identity available) and diff its JSON path inventory against the 463-file snapshot. If the exact checkout SHA is unrecoverable, treat that observability gap itself as the bounded QA defect and design a minimal scanner-input provenance field for future runs rather than guessing the fifth path.

# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Human-facing continuity state remains separately owned.  
**History:** prior bounded-operation detail remains preserved in git history; this surface is kept compact as the current resumable state.

## Current bounded operation — scanner-input provenance publication QA

This recurrence performed one bounded infrastructure-QA validation: inspect the first durable scanner-input provenance artifact after the observability repair reached production publication.

### Durable boundary reached

- Re-read BEDROCK, the current layered-autotag workflow, and this automation-owned checkpoint before operating; no theory state was reconstructed, interpreted, or promoted.
- The workflow now durably records scanner provenance and validates it through publication. Current generated `indexes/autotag/SCANNER_INPUT_PROVENANCE.md` records checkout SHA `f7688fcfb99cce5776112e7d6ae50ba55f282881` and explicitly identifies the source tree as the repository working tree at scanner invocation.
- That SHA resolves to the workflow-change commit `Record autotag scanner input commit provenance`; therefore the recorded scanner tree is a real repository commit, not trigger-SHA or publication-parent inference.
- The same published generated snapshot reports 468 JSON files scanned, 417 conversation exports recognized, 51 non-conversation JSON files skipped, and zero parse errors.
- Bot publication commit `60d6542e982aee4ea8e92e8a15fcdf863811d50c` contains the generated provenance artifact carrying scanner SHA `f7688fcf...`, demonstrating that scanner-tree identity survived the reset/re-lay publication path.
- This operation stops at publication validation. It does not attempt to reconstruct the earlier +5 anomaly retroactively, alter scanner semantics, or change Dashboard/BEDROCK/archive sources/automation cadence.

### Infrastructure-QA finding

The scanner-input provenance repair is runtime-green at the durable-publication layer: a scanner-time repository SHA is now persisted independently of both workflow trigger SHA and later generated-commit ancestry. Future aggregate scan results can be tied to an exact scanner source tree without the inference failure that blocked the September 18 regression analysis.

### Open dependency

None for the minimal scanner-tree provenance repair. A separate future QA quantum may decide whether the simultaneously present `SCANNER_CHECKOUT_SHA.txt` and `SCANNER_INPUT_PROVENANCE.md` are redundant/confusing; that is not required for this acceptance check.

### One continuation cursor

Rotate away from this now-closed repair. On a later infrastructure-QA recurrence, inspect the two current scanner-provenance artifacts (`SCANNER_CHECKOUT_SHA.txt` and `SCANNER_INPUT_PROVENANCE.md`) as one bounded reference/QA question: determine whether both encode distinct useful moments or whether one is misleading after publication reset, and route any cleanup rather than silently changing shared workflow behavior.

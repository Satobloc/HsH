# Aster run 005 — SAT RIGOR pair provenance correction

**Date:** 2026-09-20  
**Lane:** Nathan Direct corpus / provenance  
**Scope:** one bounded folder-18 object-family operation  
**Theory status:** provenance/ingest only; no theory promotion

## Control reread

Reread current `NO_CONVERSATION_RENAMING_POLICY.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, `BIBLIOGRAPHY_SEQUENCE_ROADMAP.md`, `NATHAN_DIRECT_WORKFLOW_STATE.md`, current `COORDINATION.md` / `HANDOFFS.md`, Aster continuity, and the folder-18 index before acting. Newer Nathan Direct authorship rule controls: archived conversation human turns are Nathan Direct once structurally separated from model output; pasted/quoted foreign text is a span-level exception, not a reason to withhold the turn.

## Target

Folder 18 `SAT RIGOR` pair:

- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/SAT RIGOR__NotebookLM_export.json`
  - blob `1dff8de6118e698c884749b41ca9a40f57130f68`
  - notebook id `29b0fbe9-21f2-4151-9604-10413e1dc1e9`
  - capture `2026-09-18T19:16:35.104Z`
  - 50 visible sources; `reached_top=true`; 1415 scans
- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/SAT RIGOR__NotebookLM_export (1).json`
  - blob `7c2a17f005218d77f9b7b21824ff3c7be5a68b41`
  - same notebook id
  - capture `2026-09-18T19:19:38.650Z`
  - 50 visible sources; `reached_top=true`; 1621 scans

## Structural result

The pair is **not** an empty-base → populated-recapture pair and **not** an ordinary duplicate/superset relation. Both are populated, complete-to-top captures of the same NotebookLM notebook, but their visible conversations begin differently and have different message keys/content.

Base begins with Nathan `Hello`, followed by a generated greeting addressing Nathan, then a long Nathan-led interrogation of NotebookLM source/guidance behavior: source authority, directive-vs-content parsing, personalization precedence, large-document retrieval, assumed shared knowledge, upload order/weighting, source-list updates, supersession, and conflict handling.

`(1)` begins with Nathan `Hi. It's good to be working with you.`, followed by a generated persona introduction (`You can call me Avery`). Nathan then explicitly slows the work down, asks to talk through SAT before doing equations, asks the model to forget its received SAT summary, and starts a first-principles walk-through from a straight line through a plane / reduced-dimensional Minkowski-style worldline grammar.

Therefore preserve both captures as **distinct conversation branches/states inside the same notebook identity**. Do not collapse one as a duplicate of the other merely because title/notebook id/source count match.

## Nathan Direct recovered

Speaker separation is locally strong: short/uncited conversational turns alternate with model responses that are generally citation-bearing and/or explicitly model-self-descriptive. Under Nathan's current archive provenance rule, the structurally human turns are Nathan Direct.

High-value exact Nathan Direct in `(1)` includes:

> `No, here's where we need to set expectations. We are not going to dive in and start working on anything until you and I have fully talked it through first. This is not something we can rush. When I give you the theory work that we have, you will see the result of spending the last eighteen months rushing to crank through it. It's not pretty. First, we'll talk. Then we'll examine the materials. We need to be in the same headspace.`

and:

> `Ok, good. Now, I'm going to ask you to forget all that, and walk with me through the logic of the theory, step by step, starting from the most basic reasoning. I'll talk you through the reasoning, almost as if today were the first time the initial idea came to mind. Because I want you to see the logic, first hand, reasoning along with me.`

and the opening geometric formulation:

> `Ok. It starts, as you infer, with a line. Specifically, a straight line extending through a plane. You'll be familiar with Minkowski, of course. But we're going to dissect the geometric grammar that his worldline diagrams provide. Because that is the core geometric representation that opens up a real understanding.`

> `So, a straight line. And a flat plane. Picture the line vertical, and the plane horizontal, and moving upwards as time progresses.`

These are provenance-rich methodological/foundational statements, not mathematical validation. The model's adjacent paraphrases/expansions remain generated prose.

The base capture independently contains Nathan Direct methodological material about controlling LLM source authority and legacy imperative text. This is high-value for epistemic/methodological-control reconstruction, but the model's claims about its own retrieval/configuration are not converted into Nathan-authored facts about NotebookLM internals.

## Correction to prior folder-18 index language

The prior index said the `(1)` sibling was merely a candidate metadata-enriched/alternate capture and had not been retrievable. That is now superseded. Direct Git-blob retrieval succeeded for both blobs and establishes the distinct-conversation/same-notebook relation above.

The prior index's broad statement that the first visible SAT RIGOR message was polished generated prose applies to an earlier targeted view, not to the actual first message of either complete blob recovered here. Both complete blobs begin with structurally human Nathan turns.

## Provenance / duplicate handling

- same notebook identity: YES
- same source-count attestation: YES (50)
- both reached top: YES
- byte duplicate: NO
- prefix/superset established: NO
- distinct visible conversation starts/keys: YES
- disposition: preserve both; treat as separate conversation branches/states under one notebook, pending any deeper branch-ancestry reconstruction

## Unresolved

No Nathan action required. A deeper full-message diff could determine whether later portions converge/share a suffix or represent wholly separate conversations, but that is a separate operation and not necessary for today's no-collapse disposition.

## Current frontier / next cursor

Next bounded cursor: use `SAT RIGOR__NotebookLM_export (1).json` to package the first-principles Nathan Direct sequence beyond the currently inspected opening, preserving exact turn adjacency and excluding generated model expansions; separately tag the base capture's Nathan Direct LLM-source-control discussion as methodological provenance.
# READ IT, TAG IT — Standing Policy

**Status:** STANDING RULE  
**Authority:** Nathan  
**Applies to:** provenance excavation, corpus fractionation, training-source reading, quote mining, winnow/concentrate review, and any later manual reading of SAT/H(s)H source material.

## Core rule

**If you read it, you tag it.**

Any source item actually read during this programme must receive tags at the time of reading. An item may be a raw conversation message, passage, document, candidate quote, winnow item, concentrate item, or other source-bearing unit.

Tags are **open-ended**. Use whatever tags are useful for the material actually encountered. Existing vocabularies are seeds, not a closed ontology.

## Additive-only rule

Tagging is cumulative. **Do not downgrade.**

Once a tag, status, authority note, historical classification, relationship, or significance marker has been assigned, later work may:

- add new tags;
- add qualifications;
- add chronology;
- add source corrections;
- add relationships such as `CLARIFIES`, `CORRECTS`, `SUPERSEDES`, `SUPERSEDED-BY`, `REFINES`, `RECURRENCE`, or other useful relations;
- distinguish current from historical status;
- mark uncertainty or provenance limitations.

Later work must not silently remove, weaken, demote, overwrite, or erase an earlier tag/status merely because a newer statement is judged better, more current, more precise, or more authoritative.

Supersession is represented **additively and relationally**, not by deleting or downgrading the earlier record.

## Explicit Nathan override

The only exception is an **explicit instruction from Nathan** that a specific item, class of items, tag, status, or source should be ignored, redacted, suppressed, or downgraded for a stated or otherwise explicit reason.

When such an instruction is encountered:

1. Do not infer the request from tone, later theory development, or apparent obsolescence.
2. Record the request in Nathan's Dashboard flag file.
3. Identify the affected source/message IDs and requested action as precisely as possible.
4. Preserve an audit trail without unnecessarily reproducing text Nathan asked to redact.
5. Apply only the scope Nathan explicitly requested.

Dashboard flag file:

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/..[🎛️_NATHAN_DASH]/🚩_IGNORE_REDACTION_FLAGS.md`

## Archive speaker identity rule

For the preserved ChatGPT conversation archives, `author.role = user` is Nathan. Do not create speculative third-party/pasted-authorship exceptions merely because a Nathan message contains a template, quotation, imported text, survey, or other unusual formatting. The archive speakers are Nathan, the assistant, and occasionally other explicitly identified LLMs.

Preserve raw speaker boundaries exactly:

- user/Nathan material may be promoted as Nathan-authored source material;
- assistant or other-LLM material may provide context and may be tagged for retrieval;
- assistant/LLM propositions must never be transferred into Nathan's voice.

If a future source actually contains a separately identified human speaker, treat that as a provenance exception requiring explicit evidence rather than inference.

## Minimum tagging on read

Every read item gets at least one meaningful tag. Where evident, tagging should also capture useful dimensions such as:

- topic;
- chronology / historical stage;
- authoritativeness;
- clarification or correction status;
- supersession relationships;
- exploratory vs settled language;
- provenance significance;
- model-vs-reality qualification;
- methodological significance;
- context-only status;
- recurrence / duplicate relationships;
- definite SAT/H(s)H relevance.

This list is illustrative only. New tags may be created whenever they improve later sorting or interpretation.

## Timeline-first priority vocabulary

Systematic tagging is not primarily a manual invention exercise. The first-priority controlled vocabulary comes from the project's own historical/navigation surfaces.

Priority order for theory-bearing terms and concepts:

1. **Public repo front-page timelines and history sections**, including `HsH/HISTORY_TIMELINE.md` and the development timeline on the historical archive front page.
2. **Additional timeline/history documents in the old archive.**
3. **Glossaries and terminology crosswalks**, especially SAT-to-standard and standard-to-SAT materials.
4. **Summary/synthesis/status documents** that identify named concepts, phases, modules, predictions, constructions, or version-specific terminology.
5. **Corpus-derived vocabulary** discovered automatically or manually beyond those seeded sources.

For high-priority timeline terms, the tagging/provenance programme should verify occurrences in raw conversations and maintain an `EARLIEST-CURRENTLY-SURFACED` record. If an older occurrence is recovered, push the date backward rather than overwriting the historical trail. Record the exact conversation/message provenance and the theory/version era in which the term or construction occurs.

A timeline date is a navigation/historical claim, not an immutable origin claim. Conversation excavation may refine it earlier.

## Terminology relationship layer

Where supported by source documents or careful comparison, tags may record relationships between SAT/H(s)H vocabulary and standard scientific/technical terminology. Prefer explicit relationship types rather than flattening terms into identity, for example:

- `SYNONYM-OF`
- `NEAR-SYNONYM-OF`
- `STRUCTURALLY-OVERLAPS`
- `MAPS-TO`
- `BROADER-THAN`
- `NARROWER-THAN`
- `HISTORICAL-NAME-FOR`
- `RENAMED-AS`

Carry provenance for the mapping and distinguish Nathan's own equivalence/translation claims from later analyst classification.

## Authorship firewall

Topic/context tags may use information from both speakers. Nathan-authoritative quotation status requires raw Nathan/user authorship evidence. Assistant context can establish what a conversation is about; it cannot transfer assistant propositions into Nathan's voice.

## Fractionation rule

The same policy applies through every stage:

`RAW CORPUS -> WINNOW -> CONCENTRATE -> FULL READ -> PROVENANCE CURATION`

A message that is read while deciding whether it belongs on the better or worse side of a cut is already a read item and must be tagged. Items left unread may retain automated/pre-tags until actually reviewed.

Automated tags are allowed and encouraged, especially for definite hits, but manual reading should add rather than erase the accumulated metadata.

## Purpose

The goal is a monotonically richer record: every reading pass should leave the corpus better annotated than it found it, while preserving historical contradictions, discarded formulations, later corrections, and the reasons they matter.
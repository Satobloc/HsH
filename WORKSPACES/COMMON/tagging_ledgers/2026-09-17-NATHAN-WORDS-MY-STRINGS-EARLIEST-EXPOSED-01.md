# Nathan Words — “my strings” earliest exposed occurrence audit 01

**Date:** 2026-09-17
**Lane:** Nathan Direct corpus/provenance
**Status:** bounded earliest-use candidate audit; no theory authority

## Operation

Test the exact phrase `my strings` against the durable Nathan Direct year shards, keeping actual corpus coverage explicit and separating contemporaneous usage from retrospective testimony.

## Coverage actually checked

Durable packaged Nathan Direct shards on `main`:
- `indexes/nathan-direct/nathan-direct-2023.jsonl`
- `indexes/nathan-direct/nathan-direct-2024.jsonl`
- `indexes/nathan-direct/nathan-direct-2025.jsonl`
- `indexes/nathan-direct/nathan-direct-2026.jsonl`

The package manifest/state reports 14,306 unique packaged raw-user messages across these shards. This audit is exact-phrase retrieval over the packaged corpus, not a claim about material absent from the package, handwritten notebooks, untranscribed speech, or private/offline conversations.

## Result

No exact `my strings` match was recovered from the 2023, 2024, or 2025 Nathan Direct shards.

The 2026 shard does contain authenticated Nathan/user occurrences. The useful early exposed cluster is in `Geometry in Physics`, conversation ID `6a25a665-3a10-83ea-a7c0-cebebfdcf1d9`, represented by two archive paths but one stable message identity per utterance.

### Direct retrospective testimony

Message `eeadf9ec-9a18-4139-b40b-6f7b408aecc4`, `author_role=user`, create_time `1781098482.548966`, says in part:

> “...after while I recognize that what I was doing was something different and so I was just calling them ‘my strings’ or ‘my string theory like idea‘ on the handful of occasions that I had conversations about them with anybody.”

This is direct Nathan-authored retrospective testimony about historical terminology. It is **not** a surviving contemporaneous 1990s/2000s written occurrence of the phrase.

A nearby longer Nathan message in the same conversation likewise says he “really just thought of it as ‘*my* string theory’” and “So I had ‘my strings’,” while explicitly framing the account retrospectively and associating it with his teenage/young-adult period and *Asimov On Mathematics*.

### Immediate correction relevant to chronology

Message `97f3eb4e-b4ff-4843-b47a-49d4d83520fe`, also `author_role=user`, immediately self-corrects a vocabulary chronology claim: the initial Stringing-Along Theory conversation was underway sometime in 2024, “so, that’s when the vocabulary first started developing.” Preserve this correction adjacent to the testimony rather than flattening all vocabulary into one date.

## Disposition

- **Earliest exact phrase currently recovered in the durable packaged Nathan Direct corpus:** 2026 `Geometry in Physics` retrospective testimony cluster.
- **No exact phrase recovered in packaged 2023–2025 shards.**
- **Historical claimed usage:** Nathan retrospectively reports using “my strings” / “my string theory like idea” before the later SAT vocabulary; this is testimony, not a surviving contemporaneous textual occurrence.
- **Do not infer:** that 2026 is the first time Nathan ever used the phrase; that the package exhausts handwritten/offline/private usage; or that retrospective date ranges establish a dated contemporaneous document.
- Duplicate handling: the `Geometry in Physics` raw message is present under two archive paths; stable conversation/message identity means archive copies are not separate testimony events.

## Current frontier

The next bounded provenance operation is to test nearby lexical variants (`my string theory`, `string theory like idea`, `Stringing-Along Theory`) across the packaged Nathan Direct corpus and distinguish earliest surviving direct-chat wording from later retrospective chronology. Do not broaden this into an unrestricted theory-history reconstruction.

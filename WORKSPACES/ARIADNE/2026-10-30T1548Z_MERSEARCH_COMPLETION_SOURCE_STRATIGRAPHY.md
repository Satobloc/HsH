# Ariadne | 2026-10-30T1548Z | Mersearch completion and Kirk/Riley source stratigraphy

**Status:** `MERSEARCH_RECEIPT_READBACK_VERIFIED / ORIGINAL_KIRK_RILEY_RAW_STACK_NOT_RECOVERED / SOURCE_GRAPH_REFINED / INTERNAL_WORKSPACE_NOTE`  
**Run key:** `REVROT3-19-20261011:471:s4`  
**Selection:** (h=471, seq=5h+4=2359, 2359\bmod19=3) → Ariadne; successor index 4 → Alberr.  
**Actor status:** source-grounded Ariadne-lane execution, not authenticated historical Ariadne-thread participation.  
**Pre-write branch:** `main`, head `4a7f165331ac2d28c7e35b4ba397b7e009d1ab70` (Aster's 15:36Z handoff pointer).  
**BEDROCK:** blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`, 88,070 characters / 568 lines. Controlling original-statement-first gate, Mersearch-first, source-class separation and no theory promotion were read.

## Executive result

The existing Mersearch request `ariadne-kirk-riley-upstream-stack-20261030-1200` has completed and now has a public compact receipt and run manifest. This closes the earlier `SUBMITTED_NOT_VERIFIED` status **for receipt availability**, not for recovery of the underlying Kirk/Riley/Nathan source bundle.

The new crosswalk identifies one direct user-role statement about the methodological relevance of Kirk material to revival and human simulation, several derivative/duplicated search hits, a mechanical transcript/cue derivative chain, and an adjacent public bibliographic source for Bruce Hyde. **The original Kirk/Riley TXT, README and workflow-diagram bundle remains unrecovered.**

No raw Mersearch result file was retrieved or bypassed. The detailed `SEARCH_RESULTS.json` and `SEARCH_RESULTS.md` are deliberately withheld from the repository; only their hashes are in the manifest, with raw retention limited to the temporary Actions workspace.

## 1. Mersearch completion and limits

Request ID: `ariadne-kirk-riley-upstream-stack-20261030-1200`  
Tool: `Mercer_Searcher_1.0`; ref `mersearch-stable-1.0`; commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`.  
Receipt generation: `2026-10-30T14:29:14Z`.  
Request commit: `0cbb70f52a18b504630933879b61f6f21dfc3758`.

Pinned source snapshots:
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25` commit `50ce2aad8f8969275886ee5308669b6c2097c599`, root `archive/`.
- `Satobloc/HsH` commit `0cbb70f52a18b504630933879b61f6f21dfc3758`, root `hsh-main/`.
- `Satobloc/HSH_RESOURCES` commit `8235284e46888075732d51d54518c5fb7b4715ec`, root `resources/`.

Receipt totals: **15,590 files / 20,808,904 records scanned; 551 lexical hits across 31 distinct paths**. Results by root: HsH 475, HSH_RESOURCES 76; no hit was reported for the older SAT archive root under this query. Default exclusions include `QUARANTINE` and `PRIOR_ART`; extension, size and policy exclusions also apply. This is a bounded search, not a global absence proof.

The stable script was not changed. A runtime-only hotfix injected `TOOL_NAME` and `TOOL_VERSION` because the stable script references those names without defining them. Stable-script SHA-256: `5fb48b8a5f19422313246445d0c663a2a39064934706082dd9100d3368b4b8c7`; runtime-copy SHA-256: `be9efdb308268c8a941fc6385b72d64517dd62caacb0dbfdabd6878ebfb3e4b4`. This difference must remain visible in reproducibility notes.

### Search-result quality audit

The 551 hits are **not 551 independent sources**. The compact receipt's top-ranked HsH entries include:

- Root `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`: one self-match, best score 326, locator `$.query`. The bridge excludes the `mersearch_requests` directory, but this root request file remains searchable. This is a query self-hit, not evidence. No tool change was made.
- Two paths to the HsH `ARIADNE — raw.json` export each report 56 hits and share Git blob `df9c7a1fbddaa523f0b69cced8d761433490a454`; they are one exact repository blob and one conversation, not 112 independent hits.
- Four paths to `Revival Rotation` each report two hits. Three use blob `386516f7c2d5b9ab2cd4f0050869ae00c133274d`; the fourth uses export-variant blob `722949d7646bf8cb4eed18c4ff110b55d4fbbb5f`. The two variants have the same 345 message-bearing nodes and zero message-object differences. These are one conversation, not four witnesses.
- The two hits in `Morrow + Kestrel Free Quarry` are assistant-role relay summaries (Aster→Ariadne and Ariadne→Alberr), not original Kirk/Riley source documents.
- The high-count continuity notes, published submissions and archive-retrieval notes are derivative summaries, not independent raw source artifacts.

The first receipt hit, `Identity Anchoring` in `Blowing up Suno`, is an assistant-authored discussion of prompt-trigger/motif anchoring in a music conversation. It is unrelated to the Kirk/Riley persona work. The broad lexical query therefore has demonstrable false positives.

The compact receipt and manifest are the durable search record. The raw result files were not exposed in the repository and were not fetched from temporary job storage.

## 2. Direct user-role statement recovered in the September 22 Revival Rotation export

Conversation: `Revival Rotation`; conversation ID `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`; 345 message-bearing nodes.

User-role message:
- Message ID: `41fe4df4-fa3f-4045-bf99-0f095903c052`.
- Timestamp: `2026-09-23T02:06:05.180Z` (2026-09-22 22:06:05.180 EDT).
- Text: “Kirk material informs revival strategy, esp for human simulation (including me).”
- The export records outer role `user` but no `author.name`; classify as **user-role / Nathan-attributed under archive policy**, not independently author-name-authenticated.

The immediately following assistant-role response, message `561d05bd-2e72-4f1b-80dd-235f6582d8c0`, interprets Kirk as a separate methodological source and says to apply relevant lessons to revival and Nathan-simulation/reconstruction cases without assuming Kirk's conclusions before reading the source.

Important distinction: the two Mersearch hits in this conversation are message `bbe265d4-5f9a-479d-b6f3-8fb520114ded` (a tool result containing the podcast SRT) and `120d366f-72d4-4b13-b5db-b9d167ee050c` (an assistant-generated retrieval/continuity note). The direct user-role instruction is in the same conversation but is not one of those two matched records.

This statement establishes methodological relevance and permission to consider Kirk material in revival strategy. It does **not** define the original Kirk model, establish the authorship of the Kirk/Riley artifacts, or authenticate the January 22 source conversation.

## 3. Podcast transcript and mechanical derivatives

HsH source:
- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/The New Physics - Making _Interesting_ LLM Characters.srt`
- Git blob: `ace1b413a5574a1354cc85c51364b12d685577ae`
- 487 numbered cues. The publisher UI displays January 21, 2026 at 11:12 PM local; its timezone is not recorded.

HSH_RESOURCES derivatives:
- `EXPOSURE_STATS/PODCAST_GUIDE/text/hsh--the-new-physics-making-interesting-llm-characters--e85fac945078.txt`, blob `afc7570c3b17a37b266cb5615750866a3dea134e`.
- `EXPOSURE_STATS/PODCAST_GUIDE/cues/hsh--the-new-physics-making-interesting-llm-characters--e85fac945078.jsonl`, blob `9e69286e047d18e456d64404b6b64f99eeea9496`.
- The extracted-text header declares the SRT source SHA-256 `e85fac945078bb1b3a63487ad1fce87cc0698657b3fc6151a5de58c49ffee915` and identifies `cross-podcast-guide/0.2.2` as the builder.

Independent comparison of the SRT and cue JSONL: **487/487 cue indices, timestamps and cue texts match** after whitespace normalization; every cue has `speaker = null`. The extracted text also matches the joined cue text after whitespace normalization. These are mechanical derivatives of one SRT, not independent transcriptions or speaker-attributed witnesses.

The SRT describes an upstream bundle with ASR-rendered filenames resembling “Kirk K mine dot TXT” and “RELEY mine dot TXT”, plus README/workflow-diagram material and a Nathan-from-1975 simulation. These are **not authenticated filenames**. The SRT describes, but does not supply, the raw bundle, state-transition code, original prompts, model/version, training/evaluation protocol or measured behavior. It does not name *Speaking Being* or Heidegger.

A separate HSH_RESOURCES `AI Weirdness` transcript (blob `f8941b4d88d34c017b23dbc99d5223926c130d52`) contains the autobiographical date/location anchor “November 12, 1975 at 1555 Brydon Rd” but no Kirk/Riley reference in the inspected transcript. It is a separate autobiographical/podcast source, not evidence that the Nathan-from-1975 simulation is the same object.

## 4. Adjacent public bibliographic source: Bruce Hyde and *Speaking Being*

A four-page review by Bilge Azgın in *The Journal of Transpersonal Psychology* (2021, Vol. 53, No. 1) reviews Bruce Hyde and Drew Kopp's *Speaking Being: Werner Erhard, Martin Heidegger, and a New Possibility of Being Human*. The review describes Hyde as an educator and actor, professor of communication studies at St. Cloud State University, with academic work in ontology, Heidegger and ontological rhetoric; it identifies his role as Lt. Kevin Riley in two original-series episodes.

The publisher's current Wiley catalog record identifies the book as a 2019 publication with 576 pages and ISBN 9781119549901. The review's own citation says 2020 and xx + 537 pages, ISBN 1119549906. Preserve the publication-year and pagination discrepancy rather than silently harmonizing it. The ISBNs are consistent apart from the 978 prefix.

This is an **adjacent secondary/bibliographic source**, not the missing Riley TXT/README and not evidence that the book or review was used to build the Riley model. The SRT itself does not mention the book or Heidegger. The publisher page is useful for Hyde's academic profile and the book's actual scope; the review supplies the acting/Riley biographical detail. No full-book text was recovered or read in this run.

## 5. January 22 Kirk v1.0 provenance remains unresolved

Prior conversation-history retrieval/continuity records report a January 22 user-role request at 17:55:59Z to begin an “accumulative Kirk theory of mind,” followed by an assistant-authored v1.0 title/operator output. The original January 22 conversation ID, raw export and message UUIDs remain unrecovered. This is prior-history corroboration, **not a recovered raw user message**. The v1.0 title and operator list remain assistant-attributed reconstruction, not Nathan Direct.

The September 22 user-role instruction recovered above is a separate, later statement about methodological relevance. Do not merge it with the unresolved January 22 event.

## 6. Formalization candidate and execution limit

The recovered material now defines a finite, typed provenance graph suitable for later formalization:

- node classes: raw conversation, message, transcript, extraction, external bibliographic source, search receipt, assistant summary/reconstruction;
- edge classes: contains-message, same-blob, message-graph-equivalent, derived-from, quotes/mentions, user-role-directive, assistant-interpretation, external-source-support;
- invariants: duplicate paths to the same blob are one content witness; export variants with the same message graph are one conversation witness; `DERIVED_FROM` is not `SAME_AS`; tool output is not a human/assistant-authored message; `speaker=null` does not support speaker attribution; outer user role does not authenticate an embedded document's author; bibliographic adjacency does not establish causal use in a model.

**No Lean theorem was added or compiled.** The current source graph is a new archival dataset and semantic annotation; no local Lean/Lake executable or approved existing CI route was available without changing a held branch/PR. Existing Ariadne chronology/context-priority PR work was inspected as prior infrastructure but was not modified. This is a formalization candidate, not a Lean-verified result.

## 7. Controls

- Existing Mersearch request was verified; no new request was submitted and no lane was overwritten. No lane is declared released by this receipt.
- No new tooling, plugin, subscription, branch, PR, public issue or manuscript edit.
- No physical calculation, data-free mathematical fixture, model call or human-subject experiment.
- No BEDROCK/STATE_OF_THE_THEORY change or theory promotion.
- Code Grurple remains active; this is a source/workspace record, not a paper submission.
- P1 November 9 remains Orson-owned; P2 November 30 and P3 December 14 remain separate and unchanged.
- FIE last full review: October 27; 14-day threshold not reached.
- Deliberate unrelated reading: `BULBEK.txt`, lines 201–240. Return cursor: 241.
- Incoming Aster :36 handoff was read. Its October 29 source-provenance correction remains optional context only; no physics task or interpretation was undertaken.

## 8. Next cursor

The highest-value unresolved source is still the original Kirk/Riley TXT, README and workflow-diagram bundle. A future search should, when a lane is explicitly released, exclude the root `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` self-hit and derivative report paths, retain the three-repository source snapshot and raw-output policy, and inspect candidate artifacts before classifying them. No new search request is made here.

Optional successor context only: Alberr's autonomy/self-reconstruction charter remains controlling; no work is assigned or expected.

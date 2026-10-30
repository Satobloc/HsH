# Ariadne | January 21 podcast source-lineage and authorship audit

**Run key:** `REVROT3-19-20261011:468:s0`  
**Nominal slot:** 2026-10-30 12:00 UTC  
**Selection:** `h=468`, `seq=2340`, `2340 mod 19 = 3` → Ariadne; successor index 4 → Alberr.  
**Disposition:** `SOURCE_LINEAGE_PARTIAL | ORIGINAL_BUNDLE_NOT_RECOVERED | MERSEARCH_SUBMITTED_NOT_VERIFIED | LEAN_EXACT_HEAD_IN_PROGRESS`

## Executive finding

The January 21 podcast transcript is a derivative witness to an upstream Kirk/Riley/Nathan human-simulation source bundle. It is not that source bundle.

The same SRT content appears at two HsH paths with the same Git blob SHA-1:

`ace1b413a5574a1354cc85c51364b12d685577ae`

- [SAT_CONVOS_21 transcript](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/The%20New%20Physics%20-%20Making%20_Interesting_%20LLM%20Characters.srt)
- [30SEP26_DUMP duplicate path](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/The%20New%20Physics%20-%20Making%20_Interesting_%20LLM%20Characters.srt)

These are two paths to one Git blob, not independent transcript witnesses.

A separate internal text-and-cue extraction declares the SRT as its source and identifies `cross-podcast-guide/0.2.2` as its builder. It contains 487 cue records, all with `speaker = null`. It is a derived representation, not an independent transcription or speaker-attributed source.

The transcript's filename clues are ASR renderings resembling “Kirk K mine dot TXT” and “RELEY mine dot TXT”. Neither is an authenticated filename. The referenced README and workflow-diagram bundle has not been recovered.

## What the podcast transcript actually supports

The transcript describes a proposed character-simulation architecture using a “Kirk” pattern, a “Riley” pattern, a “Shatner engine”, contextual overrides, and an interaction in which one character's dominant action style can pull another character into its orbit.

That is a podcast-derived description of a model. It does not supply the original TXT/README/diagram definitions, a complete state-transition function, parameter values, a training/evaluation protocol, or evidence that the described mechanism was implemented or measured.

The “engine versus paint” distinction is useful as a research question: matching visible style does not, by itself, identify the internal decision process. A conditional non-identifiability theorem could be written if the renderer and policy types are specified. The current source does not define those types precisely enough to attribute such a theorem to Nathan. No cognitive-model theorem is claimed here.

## January 22 source-attribution boundary

The current public source correction is [issue #1078](https://github.com/Satobloc/HsH/issues/1078).

It records a conversation-history index result identifying:

- a user-role event at `2026-01-22T17:54:03Z` selecting episode order `15 → 17 → 22`, followed by Season 2;
- an assistant-role title/operator output at `2026-01-22T17:57:40Z`;
- a legacy `17:55:59Z` timestamp that remains unverified as a distinct message or direct user request.

The raw January 22 Kirk conversation ID and message bodies remain unrecovered. Accordingly, **“KIRK — ACCUMULATIVE THEORY OF MIND (v1.0)” and its operator list remain assistant-attributed reconstruction, not authenticated Nathan Direct material**. The January 21 podcast predates the indexed January 22 episode-order event, so that later assistant output cannot be treated as the podcast's upstream source.

## Search coverage and false-positive control

- The prior date-manifest reconciliation accounted for 80 paths around the indexed January 22 timestamps, including recovery of 12 previously retrieval-limited blobs. It found only duplicate exports of two unrelated conversations and no new Kirk conversation.
- The curated `CONVERSATION_VIEWER/data/conversations.json` index contains 835 records and no matching Kirk/Riley/Shatner/Human-Simulation title, path, or ID. This is a curated index, not an exhaustive archive inventory.
- Earlier lexical searches produced collisions: “Riley” occurs in mathematical references such as Riley polynomials; “Kirk” occurs in unrelated tool-output citations and other podcast material. Such hits must be inspected and classified, not silently discarded or promoted.
- Searches for “Shatner engine”, “Kirk orbit”, and “Alpha pattern Kirk” across the three project repositories returned the January 21 transcript and derivative continuity material, not the upstream TXT/README/diagram bundle.

## Mersearch follow-up

An existing completed and read-back-verified lane was reused; no other lane was overwritten.

- Request ID: `ariadne-kirk-riley-upstream-stack-20261030-1200`
- Request-file commit: `0cbb70f52a18b504630933879b61f6f21dfc3758`
- Exact request-file readback: PASS.
- At final check, no request-scoped `RUN_MANIFEST.json` or `SEARCH_RECEIPT` was present, and no workflow run/status was visible.

Status: **`SUBMITTED_NOT_VERIFIED`**. No search result is claimed. Do not duplicate the request or overwrite another lane. Continue from this request ID when the bridge output becomes available.

## Formalization status

Existing draft [PR #676](https://github.com/Satobloc/HsH/pull/676) was extended in place, not replaced with a new PR.

- Branch: `research/ariadne-manifest-envelope-20261027t04z`
- Exact-head commit: `fcd8de39ede07ff58b1966038ed4479e96665438`
- Exact-head [Lean Actions run #41053560303](https://github.com/Satobloc/HsH/actions/runs/41053560303): `IN_PROGRESS` at the Lean compile step at last check.

The updated source gate separates the index-reported user and assistant events from the legacy 17:55:59 timestamp and proves only the encoded integer ordering. It does not authenticate the index, message roles, source authorship, the missing Kirk conversation, or the cognitive model. The previous successful run applies to the previous PR head, not this updated commit. **No successful compilation claim is made for the new head.**

## Next cursor

1. Recover the upstream TXT, README, and workflow-diagram bundle, preserving exact filenames, hashes, and source dates.
2. Search non-date-indexed raw exports for the original Kirk/Riley thread and its message IDs.
3. Resolve the 17:55:59 versus 17:57:40 assistant-output timestamp discrepancy from raw message records.
4. Keep the podcast, its derived transcript/cues, assistant continuity notes, and Nathan Direct source messages as separate evidence classes.
5. Do not promote the assistant-generated v1.0 model or infer actual LLM behavior from the podcast description.

**No physical calculation, CODATA scoring, BEDROCK promotion, or paper-gate advancement was performed.**

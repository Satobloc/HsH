# Ariadne :12 | Real-source counterexample to date-envelope search

Nominal 2026-10-27T04:12Z, h=388, seq=1941, ring index 3 Ariadne, next Alberr index 4. Actor is current assistant, NOT authenticated original Ariadne. Native remit: Kirk/Riley/Nathan human-simulation archival provenance, not generic SAT physics.

## Finding
The actual HsH date manifest `indexes/manifests/development-conversation-dates.json` (Git blob `fe640f339e6ca8e3e1bdbfe4666a0fc75d1536eb`, generated 2026-10-26T22:47Z) has 1,196 records; 80 date envelopes span the target 2026-01-22T17:55:59Z, corresponding to 51 roughly title-normalized groups. The manifest has 406 skipped records. An envelope spanning a date is NOT evidence of a message on that date. These are candidate counts, not a comprehensive search or unique-conversation count.

I fetched and parsed all timestamped mapping nodes in four actual JSON exports, comparing their individual create_time values with the Jan 22 UTC day:
- `CONVOS_23/25.07.14...Storytelling Voice Analysis -- raw.json`, blob `1760e811ccbbaaa1f7d0331d8e7dbeecd227eee6`: 40 timestamped messages, ZERO Jan 22; closest bracket 2025-07-14T11:35:12Z to 2026-10-16T14:20:48Z.
- `30SEP26_DUMP/25.12.21...Conversation topics suggestions -- raw.json`, blob `f5dd8134fb40da6912734bbfa2dda30a109b4306`: 151 messages, ZERO Jan 22; bracket 2025-12-22T07:31:00Z to 2026-06-02T03:41:02Z.
- `SAT_CONVOS_16/25.07.25...Concise Persona Guidelines -- raw.json`, blob `9a1b5cdb455cd2c6ed8ef932aedcb6ed5eb3250f`: 32 messages, ZERO Jan 22; bracket 2025-07-25T22:08:41Z to 2026-09-12T22:00:42Z.
- `30SEP26_DUMP/25.12.22...Theory discussion response -- raw.json`, blob `9da248def68201ca24446c7d2d742d832766440c`: 46 messages, ZERO Jan 22; bracket 2025-12-22T22:43:46Z to 2026-06-02T03:40:36Z.

The target original Kirk request is still unresolved as a GitHub raw export. Earlier Ariadne work recovered the contemporaneous Jan 22 Kirk Theory of Mind from conversation-history context, and a separate Jan 21 derivative podcast; this search does NOT change that source hierarchy. The date manifest is an overinclusive index, not evidence of raw-source absence. Source body text and private conversation IDs are not republished.

## Formalization and actual execution status
Lean 4/Mathlib draft PR #676, stacked on the previously CI-successful Ariadne chronology PR #649: `FORMAL_VERIFICATION/HsHVerification/AriadneEnvelope.lean`. The new module encodes all 40 observed Storytelling timestamp-second values, retaining duplicates, and tests: (1) real earliest/latest messages enclose Jan 22; (2) every message timestamp falls outside Jan 22; (3) the conjunction is a source-specific false-positive witness. No synthetic physical system, model fitting or physical calculation. Lean source commit `7338b7f32507ffc517d8d4cbfa2a21257b887cad`, import commit `c3f351a5493c23d8b9d8ef121c1c44a8dc6319ac`. CI run #40448998890 was queued/in progress at last check. Do NOT claim compiled until independent log readback; proof would establish only the encoded timestamp proposition.

## Mersearch and method boundary
Mersearch-first controls inspected; the shared `MERSEARCH_REQUEST.json` blob `c1fa41685d5103f84b0e831a7b1fd898f976f2bf` belongs to the Indicatrix corpus request and was NOT overwritten. No three-repository Mersearch run was performed. The fallback was a bounded date-manifest plus four full raw JSON reads. A lexical search also surfaced unrelated 'kirk' in a Scots Doric language discussion and 'Riley' as minimalist composer in GENRELAB (blob `ab8154bd79b300fee4d667f7c7933f1c15c98b18`), illustrating semantic false positives. This was the deliberate unrelated linguistic/music reading checkpoint.

## Next cursor
Use per-message timestamps, not date-envelope titles, to prioritize remaining raw candidates; retrieve the exact Jan 22 Kirk conversation UUID and original assistant/user messages, then independently recover earlier Kirk/Riley TXT/README sources and publisher edit history. No source promotion, new automation, task/schedule mutation, protected signet, cross-chat delivery or historical-instance authentication.

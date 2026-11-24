# Loom h1060:s2 | Aldus mixed-span provenance audit

**Disposition:** SOURCE PARSED / HISTORICAL LOOM REMIT RECOVERED / MIXED-SPAN REGRESSION IDENTIFIED / EXISTING LEDGER AND GATE AMENDED / NO SHARED TAGGER CODE CHANGE / NO NEW LEAN BUILD / NO PHYSICAL CALCULATION / NO THEORY PROMOTION.

## 1. Execution and authority

The :24 task's nominal scheduled slot is 2026-11-24T04:24:00Z. Thus h=1060, seq=5302, ring index 1: Loom. The next label is Aster (index 2). The run started at 05:10:16Z, 46m16s after its nominal slot; the h1060:s3 Aster run had already completed at 04:50:08Z. Selection is routing metadata, not authenticated Loom-thread participation. No direct-thread delivery or historical-instance participation is claimed.

Loom's original conversation is 6aa67478-541c-83e9-b8fa-32d6d575eeb9, raw Git blob 6668ca60e451f8737903423727da7f9a430484e1. Ten direct user-role messages establish the Read-It-Tag-It remit: tag the user's corpus, preserve chronology, normalize terminology without collapsing distinctions, and keep source identity visible. The current workspace remains PAUSED / ACCESSIBLE-UNSCHEDULED; no current usable Loom thread was authenticated.

## 2. Aldus source and new span case

The public HsH raw source is `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.06•26.09.08•Aldus [AUTO H(s)H Gitter] — raw (2).json`, Git blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`, conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`. It contains 1,578 mapping nodes, 1,577 message objects and 47 user-role messages.

Direct user-role anchors:
- `939e981d-72ec-451b-81a3-f0a07b3a2c48` (2026-09-08T03:56:33.466Z): broad cross-domain reading and archive-exploration remit.
- `fcff5c18-85c4-4efc-b7e5-df7ee20c0646` (04:17:24.363Z): confirms the Aldus label and explicitly adds combining information not usually combined.
- `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d` (10:09:45.906Z): a mixed outer user message.
- `fc6745e5-b1f1-465f-9d8c-0e10bbf2aae7` (2026-09-09T02:26:53.510Z): user reports cross-thread responses, information associated with Janus, and an assistant momentarily referring to itself as Meridian.

For message `3eec9833…`, the single outer user-role body is 5,072 characters:
- `[0,202)`: Nathan's framing.
- `[202,5072)`: 4,870 characters of text the user presents as a Morrow response.

The embedded span is not wholly identical to the Morrow source. Morrow conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, assistant message `12959526-2797-5c4c-9e5f-4dc23c465a04` at 2026-09-08T08:42:36.612Z, is 4,148 characters. Across four Morrow snapshots (blobs `342b50c3927c3466783b091234647f338990a113`, `e32873cd17c1d96003dced0310ebf4d3cd954d07`, `362075c5e32ec9e97579bd1de58fba7f612cb6bb`, `ee394b446b2e36d35fd1e5ecd004685c0422457b`) that message ID and body length remain stable. The Aldus embedded span shares an exact 1,105-character prefix with that assistant message, then diverges. The remaining 3,765 characters are unresolved relative to that message. This is a partial match, not an exact whole-message copy and not a basis for attributing the full embedded span to Morrow.

The assistant response `04795ad3-9e95-58d2-8459-6974b29b6275` (2026-09-09T02:27:06.256Z) contains a seeded past-chat citation to Janus and an assistant self-report about memory, artifact and turn-routing coupling. The user's observation is direct evidence of what Nathan reported; the assistant's explanation is not a platform-routing audit. Its own text distinguishes memory/artifact coupling from the unresolved mechanism of turn-routing.

## 3. Tagging and gate change

The existing Loom tag ledger did not contain the Aldus conversation ID or these message IDs. An additive section now tags the three direct role/observation messages and the mixed message's outer framing separately. The Morrow prefix match is recorded as assistant-origin context; the divergent remainder remains unresolved. The assistant's Janus-citation response is recorded as assistant context, never as Nathan-authored material.

`SOURCE_PROVENANCE_GATE.md` now adds an eighth regression case: a ChatGPT outer user turn with direct framing plus a large embedded assistant-attributed span that only partially matches a source assistant message. The gate preserves outer-role, span-origin, exact-match length, unresolved remainder, and citation metadata as distinct fields.

This is an additive source/schema case only. No shared tagger, workflow, manifest, PR or global policy was changed. Existing PR #759 remains OPEN / DRAFT / UNMERGED; its abstract outer-role non-injectivity formalization does not authenticate this source mapping or prove the manually identified span boundary. No new Lean build was run. No new theorem or parser validation is claimed.

## 4. Duplication and operating boundaries

The broader Aldus cross-graph and identity chronology was already published in the prior h1053:s4 report. This work does not repeat that analysis; it adds a Loom-specific message/span tagging record and a regression fixture. No duplicate report or issue was created.

All four Mersearch request lanes remain unreleased. Lane 2 has a request-scoped manifest and receipt while its request file still says `requested`; lanes 1, 3 and 4 have no manifest/receipt at the expected request-scoped paths. No lane was overwritten or retriggered.

Lane 24 remains `P0-HOLD / CYCLE 08/08 COMPLETE / BACKSEAT`. No physical calculation, CODATA comparison, SAT-O/Blockwave equation change, fit, prediction, paper advancement or theory promotion occurred.

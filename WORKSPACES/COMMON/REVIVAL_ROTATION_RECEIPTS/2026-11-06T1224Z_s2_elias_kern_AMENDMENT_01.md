# Elias Kern h636 re-entry amendment 01

**Run key:** `REVROT3-19-20261011:636:s2`  
**Nominal slot:** 2026-11-06T12:24:00Z  
**Selection:** Elias Kern (index 9); next Nadir Voss (index 10)  
**Status:** SAME_OCCURRENCE_REENTRY; additive verification only.

## Existing occurrence and scheduler evidence

The h636 handoff and receipt predated this automation attempt:
- Elias→Nadir handoff commit `b32261e0b7004787c54261bb340dc4be28751a88`, 12:41:53Z.
- Elias h636 receipt commit `d832d97dd42435e4974e75fe0e9a2246e0240321`, 12:44:24Z.
- Nadir inbox append commit `bd9ad944457108660c58e6873b17e45dc32ea8b5`, 12:42:50Z.
- Nadir h636 receipt commit `135b9dc25601adc41984fca65a055a1fca9c9e24`, 12:46:36Z.

Current :24 run ID `2e945995-8bb4-8326-af52-03bb21914db6`: scheduled 12:24Z, started 12:48:36.665706Z, recorded `in_progress`, no completion time, `chat_ref=null`. Cached `latest_result` is h635 / 11:24Z, run `8399239a-5850-832f-8221-73719f38ec95`; it is stale and is not h636 output.

Nadir's :36 run `f4fdce80-5a74-832e-ba3c-92447c81de3c` started 12:40:34.199523Z and completed 12:49:22.478667Z. Nadir's inbox contains a consumption note labelled 12:40Z, but that label precedes the handoff's first verified main-branch commit at 12:41:53Z. The note itself was committed at 12:42:50Z. Nadir could have read the handoff after its commit during the run, but the exact read time is not independently established. Classify `CONSUMPTION_REPORTED / TIME_UNVERIFIED`; repository evidence only, no cross-thread delivery or identity claim.

## Historical Track A authority and source limits

Elias's workspace README identifies Track A as Nathan + Elias Kern + Orson Vey, independently communicating with Sable + Tern Rook's Track B. Elias's authority is prototype operation/documentation only, not production-workflow or SAT/H(s)H theory authority.

The strongest available Nathan Direct role-setting records are role-tagged entries in `WORKSPACES/TERN/INBOX.md`: 2026-09-24 13:47 ET (“SWITCHBOARD PROTOTYPE: CONFER WITH SABLE + ROTATE ELIAS + ORSON OBSERVER”) and 13:48 ET (“ADD THREADING TO SWITCHBOARD EXPERIMENT”). They define bounded Track A prototype work, durable before/after receipts, preserving displaced work, discretionary seed/vacate/propagate/accumulate/rendezvous/rejoin experiments, and independent Track B dispositions. The raw originating conversation/message locator remains unrecovered.

Bounded HsH raw-candidate checks rejected the Sep 24 “Access Branched Chat” export (conversation `6ab4c380-c578-83ea-9181-5ce56e1dd488`, blob `8c16f7bec4169672209925e97cf3f3469190b406`): its only user-role hit is an unrelated podcast list. “Style Spec Discussion” (blob `b962b0c7ff51aadef7226d05c4ebda4f93abeb16`) and “Website Design Direction” (blob `2a543d1112c39053fe126a0cf21e872fb4ed6972`) contain no matching user-role instructions. SAT archive main tree (5,178 paths) had no Elias/Kern/switchboard/Sep-24 raw-conversation path. This is bounded negative evidence, not proof of corpus-wide absence. Personal-context search found no authenticated active Elias thread.

## Exact-source Track A runtime checks

HSH_RESOURCES main at inspection: `ecc83767ac59b1a2119e647d36d1ce14a054ce52`. Both existing standard-library scripts were materialized without source edits; local Git-blob hashes matched upstream exactly.

| Script | Upstream blob | Runtime result |
|---|---|---|
| `workflow_switchboard_demo.py` | `49988a769389b2baf264a27d596ba7c3ff822b36` | exit 0; 7/7 self-checks true |
| `workflow_threading_demo.py` | `ce313e46b1b85ae35028b46a4196d2a945b535d8` | exit 0; 6 tests PASS |

SHA-256: switchboard source `876393e188134f059a1e3f4f6daecd7465495e7124e7b6c1d9d44b7063dcdf2a`; switchboard output `cca1febf9d4224b9bb6dbf7619b5b8ca7a15e82371d6719dcf5b2962e9cca20f`; threading source `e7bafa2a54ca14b3f4b50456cd2a6777461565bd2e40264caf53b4813fe6249c`; threading output `98192c7ae2cf35f753823bf3b18625e74b5feade89c3756a1e2ff69467d21d03`.

An in-memory source-derived test instantiated distinct `thread-A` and `thread-B` states and passed B a receipt whose free-form metadata named A as origin. B accepted it. This confirms the existing gap: `OutputReceipt` has no typed thread identifier and `add_receipt` checks `seed_version` only. Result SHA-256: `9650b47b1a29ca69e547b18a9f28ab7c5a13207f00e4868de2b8e5a6b11be77e`. Classification: synthetic software counterexample, not a real cross-thread event, production collision, physical fixture, or cognition result. Python emitted a nonfatal host spreadsheet-warmup diagnostic on stderr; both script processes exited 0.

## Preserved gates

- Sable's inbox still has the optional EvidenceLedger disposition request but no independent Track B `KEEP | MODIFY | TEST | REJECT | DEFER` response. No POC/production change.
- PR #951 remains OPEN/DRAFT/UNMERGED, head `d12e66d42b800b42a279fee97a9002243713d843`. Actions #42190662639 succeeded on a synthetic merge reference; exact-head standalone build, tests, lint, nanoda and separate axiom audit remain unverified/skipped. No new Lean run.
- All four Mersearch lanes remain occupied/requested; no new request or overwrite. Existing Math Hopper, Whirligig and SciSpace options were checked; no new tool, dependency, paid service or API spend.
- HsH main at 12:50Z: `69b84de34b6c7e393b578d8e79a2d20f81c5f819`; only `PUBLIC_SITE/generated/discovery.json` changed. Task graph remains 16 declared versus 18 records; Tern owns reconciliation.
- Code Grurple P0 remains active. A/B reader routes remain pending; P1 Nov 9 Orson-owned/NOT READY; P2 Nov 30 HOLD; P3 Dec 14 separate. No physical calculation, CODATA comparison, fit, prediction, independent measurement, theory promotion or Factory Floor admission.
- FIE last full review Oct 27; next due Nov 10. The h636 occurrence already read Babbage through lines 1381–1420; next cursor 1421.

The :24 task remains enabled, ID `6abda4c8eda88191bf23a6f2849e9a17`, original hourly America/New_York :24 schedule and phase unchanged. No prompt/ID/schedule/enabled-state change; no sixth task.

**Disposition:** the original h636 receipt and Nadir handoff are preserved. This amendment adds exact-source runtime verification and corrects the Nadir consumption-time interpretation. No duplicate handoff, public issue, or cross-thread delivery claim.

# Morrow h667:s3 → Kestrel h667:s4 | optional source-provenance context

**Source occurrence:** `REVROT3-19-20261011:667:s3`, nominal 2026-11-07T19:36:00Z.  
**Recipient occurrence:** `REVROT3-19-20261011:667:s4`, nominal 2026-11-07T19:48:00Z.  
**Classification:** `OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_REVIEW_REQUEST / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_OBLIGATION`.

## Useful source finding

Morrow's archive-only source audit recovered a direct user-role witness for the phrase “inverse pitch of the helix” in the archived Calder conversation:

- Conversation: `6a8eacca-c470-83ea-af92-8fb8df194de9`
- Raw export blob: `92454acdaad701193e2a0c6cf64a7d7b70a03dbb`
- Current-path user message: `95319111-ba02-4b45-885a-6e44bd5fed7d`
- Timestamp: 2026-08-27T00:20:22.945Z

The same message associates vacuum `theta_4 = 90°` with a direction perpendicular to the time sheet and parallel to the time normal, then says `theta_4` is always the inverse pitch of the helix. This directly supports the historical wording, but does not provide a unique angle-reference convention or a dimensionally complete formula.

The exact raw user event behind the 2026-09-16 running-log entry remains unrecovered. The current BEDROCK BR-005 normal-relative `theta_4 = 0` entry is unchanged. A separate Ravel assistant reconstruction derives `tan(theta_4) = 2*pi*R/P` under a fixed helix/timesheet model; that is not Nathan Direct.

## Durable records

- Morrow source addendum: `WORKSPACES/MORROW/2026-11-07T1936Z_BR005_AUG27_DIRECT_SOURCE_ADDENDUM.md`
- Updated BR-005 source-lineage ledger: `WORKSPACES/COMMON/tagging_ledgers/2026-10-31-MORROW-BR005-THETA4-REFERENCE-CONVENTION-01.md`

The addendum records branch membership, off-path sibling exclusions, the exact September 16 candidate check, Mersearch state, and PR #674's conditional Lean limits.

## Boundary

This is archive/provenance context only. Morrow's direct theory stop remains controlling for Morrow and is not transferred to Kestrel. No theory assignment, proof request, physical calculation, review request, or response is sought. Kestrel's own specialist remit remains controlling.

Repository handoff only. No authenticated Kestrel ChatGPT thread, cross-thread delivery, consumption, acknowledgment, or participation is claimed.


## Formalization evidence update

A later Actions audit found that the FIE angle-convention module blob `056ff72af5e01c2db4f554f549d9a99a7cb34ce9` is identical at current PR #674 head `138a40a678a61cfb8bb00448b6f5b4bc20b504c5` and earlier commit `74dbac1b8658117dfaacb9553b637df109656c63`.

Lean run #40447650215 succeeded on the earlier commit. Job #122002634931 used Lean 4.34.0 / Lake 5.0.0; `lake build` completed 8,943 jobs and explicitly built the FIE module. Its four `#print axioms` outputs list `propext`, `Classical.choice`, and `Quot.sound`. The workflow did not enable a separate axiom audit, leanchecker, tests, or lint.

The current PR head also imports a later `SourceSpanAttributionGate`; its current-head run #40498334138 is a failed conversation-JSON content check, not a Lean build. Thus the FIE module blob has an actual earlier successful build, while the integrated current PR head remains unverified. This proves compilation of conditional complementarity statements only, not historical angle intent, the September 16 raw source, the helix-to-pitch translation, or physical truth.

No new Lean run, code change, proof request, or review task is made. This is optional provenance context only.

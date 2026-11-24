# Amendment 01 | Tern h1058:s4 | Post-receipt discovery and final ledger reconciliation

This amendment supersedes only the P0 discovery-currentness statement and clone-ledger count in the canonical receipt `2026-11-24T0248Z_s4_tern_rook.md`. The original receipt remains intact.

## Latest P0 currentness

- Current main: `5466d143faeaa24c292007f7461c8e827e4fcae0`, committed 03:53:08Z.
- Latest parsed discovery blob: `b1b9a2a20d48e4f5cb2fdb3d2497b66ee9aa36ac`, updated 03:52:56Z.
- Embedded HsH source: `da1db53fe6622cea1e5494abca0f232149add05f`.
- Main is two commits ahead of the embedded source. The only non-index file change after the embedded source is the newly added canonical Tern receipt; the other commit is the discovery refresh itself. The snapshot therefore omits this receipt and is one receipt behind main.
- Parsed counts: 17,629 documents; 10,697 workspace records; 10,697 generic reader targets; 10,697 missing `presentation_state`; zero `PRESENTATION_PENDING`; 48 docket entries; 577 visuals; six extraction errors.
- Disposition: **SNAPSHOT ONE RECEIPT BEHIND / RECORD SAFETY FAIL**. Presentation Gate and Reader Routing Registry remain default-deny; no live visitor rendering or route acceptance observed.
- Public corrections: [P0 issue #1747 comment #7121525530](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7121525530) and [canonical PWH issue #2466 Amendment 04, comment #7121525944](https://github.com/Satobloc/HsH/issues/2466#issuecomment-7121525944).

## Final clone-ledger reconciliation

The preceding ledger readback was blob `f5464d0560878d960fb6cbeff4ce057c3fb0ff41`, 525 rows, 522 unique populated event IDs, three legacy rows without IDs, zero duplicates and zero parse errors.

Two final append-only events record the post-receipt P0/issue amendment writes and their exact readback. The final ledger is therefore expected to contain 527 rows, 524 unique populated event IDs, three legacy rows without IDs, zero duplicates and zero parse errors. Its final blob is recorded in the final run readback, not inferred from the preceding blob.

## Unchanged disposition

- Host run `6fcadb81-a81c-8329-b5d0-6dd5b292a0cc` remains FAILED at 03:40:39.598940Z; `chat_ref=null`.
- Canonical publication remains issue #2466 with publisher-confirmed SHA-256 `13197ba827bbaa49b3c585813f9d32bc8ab457d5fef1fc4b5cb5e4a4578ae6a0`.
- Duplicate issue #2468 remains an audit-only collision; no second artifact, merge or retry.
- PWH deep review was material-triggered; the normal five actual completed activation threshold was not established.
- Morrow h1059:s0 completed, but no direct delivery or acknowledgment is claimed. Existing OP-01 packet for h1062:s4 remains; no new handoff.
- Four original relay tasks preserved; :12 disabled; no sixth task, no scheduler mutation, no theory promotion.

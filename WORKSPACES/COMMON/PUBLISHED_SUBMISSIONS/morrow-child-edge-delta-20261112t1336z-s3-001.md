# Morrow source-snapshot comparator correction

**Status:** existing-tool correction committed; exact repository readback verified; comparison logic executed against two authentic archived conversation snapshots.

## Defect corrected

`WORKSPACES/MORROW/compare_conversation_exports.mjs` already reported child edges present in an older snapshot but absent from a later one. It did not report the reverse: newly added child edges. That omission concealed a useful distinction between (a) a new edge attached to a node already present in both snapshots and (b) edges wholly inside a newly added subtree.

## Existing-tool change

The comparator now reports:

- added and removed mapping-node IDs;
- all added child edges;
- added child edges whose parent existed in the older snapshot;
- added child edges whose parent is new in the later snapshot;
- the old-to-new `current_node` transition.

The existing removed-edge, payload-change, parent-change, active-branch and branch-prefix checks remain intact. No new tool, dependency, fixture, fork or workflow was created.

## Validation against the actual source snapshots

Both source blobs belong to the same archived conversation, `6a9ee7ca-d340-83ea-b99d-6a3097429f36`:

- earlier snapshot: `362075c5e32ec9e97579bd1de58fba7f612cb6bb` (465 mapping nodes);
- later snapshot: `ee394b446b2e36d35fd1e5ecd004685c0422457b` (697 mapping nodes).

The executed comparison returned:

| Check | Result |
|---|---:|
| Added mapping nodes | 232 |
| Removed mapping nodes | 0 |
| Added child edges | 232 |
| Added edges from an already-present parent | 1 |
| Added edges from newly added parents | 231 |
| Removed old child edges | 0 |
| Changed parent edges | 0 |
| Changed shared-message payloads | 1 |
| Old active branch remains a prefix of the new branch | PASS |
| Duplicate message IDs / broken active-branch traversal | 0 / 0 |

The single edge added from a shared parent is:

`5103e41b-1dae-54c5-a8ee-b91ca82f7103 → bc0aa167-caf3-58b9-b69a-48b8ab7da5c3`

The new child is assistant-authored. It is followed by a user-role child. This establishes a snapshot graph expansion, not independent corroboration of the assistant's content. The one changed shared payload is retained as a separate discrepancy, not silently normalized.

## Interpretation and limits

The two files are snapshots of one conversation, not independent witnesses. The new edge shows that a later snapshot attached a continuation to a previously terminal node in the earlier snapshot. The 231 other new edges belong to the added continuation subtree. The old active branch remains preserved as a prefix.

The changed comparison logic was executed in the available V8 runtime against the exact fetched raw blobs. A local Node CLI run was unavailable in this environment; the repository file was independently read back byte-for-byte after the change. This is source-comparison evidence, not an H(s)H theorem, physical calculation, theory validation, authorship adjudication or independent measurement.

## Provenance

- Repository: `Satobloc/HsH`, branch `main`.
- Script before: `fbdbcbd27a3a7e270d1a58cd439e312a3615fbcd`.
- Script after: `ca2bda99804c80b9c5d5eeb8f254ecfbbd703699`.
- Commit: `0da66cb47238bbc021f7803b8b25c6a1025ae5ae`.
- Exact script readback: PASS.

# Conversation-context citation edge extraction for Morrow snapshots

**Scope:** archive-only tooling improvement. This adds a separate citation-reference graph to the existing raw-export comparator. It does not interpret the citations as proof of runtime retrieval, context injection, worker identity, or cross-thread delivery.

## Exact source inputs

All Morrow snapshots share conversation ID **6a9ee7ca-d340-83ea-b99d-6a3097429f36**. They are versioned exports of one conversation, not independent witnesses.

| Snapshot | Git blob | Mapping nodes |
|---|---|---:|
| Morrow early | **342b50c3927c3466783b091234647f338990a113** | 107 |
| Morrow intermediate | **e32873cd17c1d96003dced0310ebf4d3cd954d07** | 117 |
| Morrow later | **362075c5e32ec9e97579bd1de58fba7f612cb6bb** | 465 |
| Morrow latest | **ee394b446b2e36d35fd1e5ecd004685c0422457b** | 697 |

The separately loaded comparison target is the A-container export, conversation ID **6a9dea2e-bb98-83ea-a74f-4beb4baa3153**, Git blob **2f5ea91a449446f64d298b50b0c2ef0d8533900a**. Its title is archive metadata only and is not used to infer worker identity.

## Comparator improvement

The existing **WORKSPACES/MORROW/compare_conversation_exports.mjs** now:

- Extracts message-level **conversation_context_citation_metadata** as a distinct evidence graph, separate from parent/child conversation edges.
- Preserves source message ID, role, timestamp, citation UUID, context type, target conversation ID, metadata status, attribution, and citation timestamp.
- Resolves a target only when its raw export is among the supplied inputs.
- Compares citation edges across snapshots of the same conversation, reporting added, removed, and changed edges, including seeded-to-complete metadata-status changes.
- Checks whether a citation **pub_date** equals the target export's conversation-level **create_time** or any target message timestamp.
- Performs a conservative normalized snippet-prefix lookup and reports matching target message IDs. This is a string-match diagnostic only.

The comparator deliberately does not infer that a citation was retrieved at runtime, caused a response, transferred context, authenticated an instance, or delivered material to another thread.

## Snapshot results

| Snapshot | Citation entries | Types | Metadata status |
|---|---:|---|---|
| Morrow 107 | 2 | 2 past-conversation | 2 seeded |
| Morrow 117 | 8 | 6 past-conversation, 2 general-memory | 3 seeded, 5 complete |
| Morrow 465 | 22 | 9 past-conversation, 13 general-memory | 22 complete |
| Morrow 697 | 35 | 12 past-conversation, 23 general-memory | 34 complete, 1 seeded |
| A-container 1,578 | 55 | 26 past-conversation, 20 general-memory, 1 user-instructions, 8 unknown | 51 complete, 4 seeded |

Pairwise citation-edge deltas for successive Morrow snapshots:

| Transition | Added | Removed | Changed |
|---|---:|---:|---:|
| 107 to 117 | 6 | 0 | 1 |
| 117 to 465 | 14 | 0 | 3 |
| 465 to 697 | 13 | 0 | 0 |

The 107-to-117 change includes the existing Janus citation on message **95bfdf06-d045-5d74-b9d8-bc657610eab6** changing from seeded to complete. Six citation entries were added, including past-conversation references and general-memory entries. The 117-to-465 transition adds fourteen entries and completes three previously seeded citation records. The 465-to-697 transition adds thirteen later entries without changing or removing the earlier twenty-two.

## A-container target resolution

The Morrow snapshots contain three, four, and five past-conversation citation edges to the loaded A-container export in the 117-, 465-, and 697-node snapshots respectively.

For every one of those twelve edges:

- The target conversation export resolves by conversation ID.
- The citation **pub_date** exactly equals the A-container's top-level **create_time**, **1788734012.522178**.
- No citation **pub_date** equals a message-level **create_time**.
- The normalized snippet-prefix check finds a target user-message ID.

The matching target-message IDs include **6f93a66b-34cb-484f-a3ce-1e5ade380065**, **3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d**, **ae2eb196-7aa1-4d4d-ae9f-5efa10cce4cb**, and, in the largest snapshot, **188f08ce-f50f-4e00-8db7-4518e7725559**.

This makes the timestamp interpretation explicit: in these records, **pub_date** behaves as the cited conversation's creation timestamp, not the cited message timestamp and not a retrieval timestamp. Snippet matches are metadata-to-text correspondences, not proof of when or how the source entered a model's context.

## Validation and limits

The extraction and diff functions were executed in the V8 tool runtime against the exact fetched raw JSON blobs. An in-memory fault-injection test removed one A-container citation from a copy of the 117-node Morrow snapshot; the diff detected exactly one removed edge. The original source object was not modified.

The repository Node CLI was not run. No local repository checkout or existing Actions workflow for this comparator was available. The updated file was independently fetched after writing and matched the submitted content exactly.

Final comparator blob: **b4e4c68eaa063d4c5a678fa1137b2b0a110e7943**.

Change commit: **107fbde8ed21c59a8a2e23cf730b53e0eb9fda59**.

Existing issues #1087 and #720 already document the manual citation-provenance and paired-identity chronology work. This change automates extraction and snapshot comparison; it is not a new context-injection finding and does not duplicate those conclusions.

No Lean theorem was warranted because this is a data-processing and source-custody tool, not a new mathematical claim. No physical dataset, calculation, fit, prediction, or independent measurement was used. No SAT-O or Blockwave equation changed, and no theory or BEDROCK status was promoted.

# Nathan Words — Live Provenance Branch QA 01

Date: 2026-09-16
Lane: Nathan Direct / provenance
Status: metadata-authenticated branch/adjacency QA; no theory promotion

## Required-control read
Read this run: `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, `BIBLIOGRAPHY_SEQUENCE_ROADMAP.md`, `NATHAN_DIRECT_WORKFLOW_STATE.md`, current `COORDINATION.md` / `HANDOFFS.md`, and prior lane ledger `2026-09-16-NATHAN-WORDS-STRING-EXPOSURE-05.md`. No conversation identity was altered.

## Source identity
Raw Library source: `ALDEN CROSS — raw (1).json`

Raw conversation metadata directly exposes:
- title: `ALDEN CROSS`
- conversation_id: `6aa814bf-053c-83ea-8145-f130df03b231`

The priority 2026-09-14 provenance sequence is therefore no longer merely an isolated message-ID recovery; it is tied to a metadata-bearing conversation identity.

## Authenticated provenance turn
Message `d5e21827-643b-43e6-92b1-daec4e514756` is directly `author.role=user`, create_time `1789404770.464818` (2026-09-14 16:52:50 UTC / 12:52:50 EDT). Exact raw wording includes:

> `SAT is my own and exists in the form that it does largely independently of mainstream science, or rather, shaped by my general science education and interests which doesnt include braid theory.`

Its raw child is assistant message `8551f1a8-d8cc-46a6-ac39-03faf58f126e`.

## Branch sibling relation
Assistant message `8551f1a8-d8cc-46a6-ac39-03faf58f126e` has **two direct user children**, establishing a genuine branch-sibling relation rather than ordinary chronological duplication:

1. `007c230d-a6df-438c-bb4a-922271b37c86`
   - `author.role=user`
   - create_time `1789405306.246924` (2026-09-14 17:01:46 UTC / 13:01:46 EDT)
   - wording ends: `The news and publications over the last 18 months *mirror* that development.`

2. `7a17692d-fe79-4850-9633-b35908efc843`
   - `author.role=user`
   - create_time `1789405328.734796` (2026-09-14 17:02:08 UTC / 13:02:08 EDT)
   - textual superset of the sibling, adding only `, lagging by several months.` to the final sentence.

Both contain the same provenance testimony that SAT is described by Nathan as a `thirty+ year old development from Minkowski formalism`, that subsequent development is described as internal reasoning, that he `did not know anything about braid theory until a few days ago`, and that SAT development is based on the Fundamental Intuitions.

## Duplicate / provenance disposition
Do **not** collapse these two user messages as archive-copy duplicates. They have distinct message IDs, distinct timestamps, distinct turn/request IDs, and share one raw parent as alternate branch children. Preserve both identities and record a near-duplicate/textual-superset relation. The later sibling is not evidence of a second independent attestation; it is a branch variant of the same local response event.

The assistant parent is context/adjacency only and must not be converted into Nathan-authored content.

## Epistemic status
These messages are direct Nathan provenance testimony about his own conceptual/exposure history. They do not by themselves establish scientific novelty, external priority, correctness, diffusion into mainstream science, or the accuracy of the separate publication/news comparison claims contained in the same turns. Those require independent evidence and remain analytically separate.

## Counts / state change
- raw conversation identities newly attached to the priority sequence: 1
- authenticated Nathan messages rechecked: 3
- direct raw parent→child adjacency relations rechecked: 3 relevant edges (`d5e...` → assistant parent; assistant parent → two user branch siblings)
- genuine user branch-sibling pair classified: 1
- textual superset relation classified: 1
- archive-copy duplicate collapses authorized: 0
- master-package additions: 0
- theory promotions: 0
- quarantine exposure: 0

## Frontier / next actions
The priority 2026-09-14 testimony is now source-identity + role + message-ID + timestamp + raw-adjacency authenticated. Next useful provenance work should either (a) verify that these exact message identities are represented correctly in the durable Nathan Direct package and Stage-2 surfaces, including both branch siblings, or (b) move to a fresh bounded provenance/packaging target. Do not spend another cycle re-finding the same raw testimony unless a package mismatch appears.
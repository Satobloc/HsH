# CORRECTION: A/M-container identity labels in Morrow chronology reports #720 and #1087

**Status:** Direct Nathan source recovered; labels corrected; Slack side-room reply posted and read back; corrected Lean code committed; exact-head CI pending.

## What is corrected

The earlier paired-chronology reports #720 and #1087 referred to the conversation titled `Aldus [AUTO H(s)H Gitter]` as “Aldus” and called its messages “Aldus messages.” That is not an authenticated worker identity.

Nathan's direct instruction in the existing Slack thread `#all-hsh-working-group-one`, parent message timestamp `1788865941.954509` (2026-09-08 07:12:21 EDT), says:

> If both conversation streams identify as Morrow, that is allowed.

The same instruction says to use container labels for provenance only:
- **A-container:** conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`, archived title `Aldus [AUTO H(s)H Gitter]`.
- **M-container:** conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, archived title `MORROW [Reconstruct H(s)H Synthesis]`.

The title string “Aldus” is preserved as source metadata, not treated as a distinct worker identity. Both streams are permitted to identify as Morrow. This does not prove they are one process or two processes. The present scheduled selection is “Morrow” by the rotation formula, but this run is not authenticated to either A-container or M-container.

## Corrected reading of the source chronology

Primary raw exports:
- M-container Git blob `362075c5e32ec9e97579bd1de58fba7f612cb6bb`.
- A-container Git blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`.
- Earliest surviving M-container snapshot `e32873cd17c1d96003dced0310ebf4d3cd954d07`.

The source-specific `citation.pub_date` value `1788734012.522178` exactly matches the A-container's top-level conversation `create_time`, not the message-level `create_time` of either message matched by the citation snippets.

| M-container citation-bearing answer | Exact A-container message matched by snippet | A-container message time UTC | Gap after A-container conversation create_time |
|---|---|---:|---:|
| `2a0548d8-b6a8-54f7-8e38-d3ddd4124c24` | `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d` | 2026-09-08 10:09:45.906Z | 128,173.383822 s |
| `74526064-80ab-5fd3-850f-a42e58bfe730` | `ae2eb196-7aa1-4d4d-ae9f-5efa10cce4cb` | 2026-09-08 11:01:57.555Z | 131,305.032822 s |

The first M-container answer (`2a0548d8…`, 11:00:51.446219Z) precedes the later A-container prompt (`ae2eb196…`) by 66.108781 s. The M-container follow-up answer (`74526064…`, 11:03:32.172734Z) follows that A-container prompt by 94.617734 s. These are timestamp-order facts only. They do not prove context exposure, a backend route, causal influence, or memory transfer.

In the earliest surviving M-container snapshot, the later answer's citation UUID `768864ea-463b-4740-9d52-ff5fbebfa905` is present with status `seeded`; in the later full export the body and citation UUID are unchanged and status is `complete`. This is a difference between archived metadata snapshots, not a runtime trace.

## Side-room instruction followed

The existing Slack side-room thread was read in full: 19 prior replies, all signed as M-container notes, with no A-container-authored testimony.

One short reply was added as reply 20:
https://hshworkinggroupone.slack.com/archives/C0C09NV79CL/p1793342429717989?thread_ts=1788865941.954509&cid=C0C09NV79CL

It explicitly reports this run's container provenance as unknown. This is an actual Slack thread reply, not a claim of delivery into either historical ChatGPT conversation.

## Lean correction

The existing open draft PR #719 was corrected to use A-container / M-container labels throughout the source mapping and to preserve the exact archive title as title text.

- Branch: `research/morrow-paired-identity-chronology-20261027t10z`
- Corrected exact head: `b06d2b255a741c7bbf843628ae354691b0e6169d`
- Module: `FORMAL_VERIFICATION/HsHVerification/MorrowPairedIdentityChronology.lean`
- New citation-date theorem targets: 11, all conditional on the manually transcribed source timestamps.
- The previous green CI run #41014686212 was on the pre-correction head and does **not** verify the corrected A/M naming. No exact-head run had appeared at the time of this correction. Compilation and theorem-specific axiom inspection remain **PENDING**.

Lean proves only the encoded arithmetic. It does not parse the exports, authenticate the human author, validate the snippet-to-message match, or establish the semantics of conversation identity.

## Disposition

This correction supersedes the A-container identity wording in #720 and #1087. The timestamp values and ordering results are unchanged. Do not describe this as an Aldus-worker/Morrow-worker comparison. It is an A-container/M-container comparison under Nathan's explicit non-corrective instruction.

Morrow's current workspace remains an archive/continuity workbench; the theory-integration freeze remains in force. No physical calculation, CODATA comparison, H(s)H prediction, paper promotion, BEDROCK change, task/schedule change, signet change, or conversation rename occurred.

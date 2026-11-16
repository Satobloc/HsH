# Morrow h876:s3 amendment 03 — negative path-membership correction

**Scope:** narrow correction to Morrow h876:s3 report and receipt; source-custody method only. This amendment does not reopen theory work.

## Correction to the published h876:s3 report

The original report and receipt stated that `WORKSPACES/MORROW/INBOX.md` and `WORKSPACES/MORROW/TRIAL_CHECKPOINT.md` were not present at the checked paths. **That statement is incorrect.** The exact repository tree used by the report proves that both paths were present.

At the report's pinned HsH snapshot:

- Ref: `refs/heads/main`
- Commit: `738e650730c6487d4085140818a028c17c1fb34f`
- Tree: `c1b2a0b94a54a88bc03ffb4bca88e3c438d5e896`
- Recursive tree: 15,021 entries; `truncated=false`

Exact tree entries:

| Path | Blob | Bytes |
|---|---|---:|
| `WORKSPACES/MORROW/INBOX.md` | `99b64944a800fb021848fbf9db11c0cf1b2e891f` | 137,570 |
| `WORKSPACES/MORROW/TRIAL_CHECKPOINT.md` | `becf45cda4cf68089d7f63adc0cc28286741a203` | 279,276 |

Both files were then fetched at the **same exact commit ref**. The targeted INBOX head read contains the Tern h876:s2 → Morrow h876:s3 optional-context entry and the current run ID. The targeted TRIAL_CHECKPOINT head read contains the original Morrow trial-workflow setup. These are targeted reads, not claims that either entire file was reread in this correction.

The same two blob IDs are present at the later observed main commit `9eea35005c4c3d34666976fa3ac584640db2ecfb`, tree `cb061b8b4b0070fa760df8464c0f83a108e53967`. They were not created after the report's pinned snapshot.

**Corrected status:** both paths were `PRESENT_IN_PINNED_TREE`. The earlier non-retrieval reason is unresolved. It must not be described as path absence, file creation, or a repository omission. This correction supersedes only the two-file absence statement; the raw-export comparison, snapshot tuple, blob identities, SHA-256 values, role-source distinctions, and other bounded findings remain unchanged.

## Additive Source Identity Gate clarification

Layer 8 now separates two independent questions:

1. `path_membership_status`: `PRESENT`, `ABSENT`, or `UNKNOWN`.
2. `content_retrieval_status`: `READ`, `EMPTY`, `ERROR`, or `NOT_ATTEMPTED`.

`PATH_ABSENT` is permitted only when the exact commit/tree is pinned, a recursive tree enumeration is complete (`truncated=false`), and the exact path is not present. A failed or empty path-content fetch is **not** evidence of absence. If the tree contains the path but the content reader fails, record `PATH_PRESENT_CONTENT_UNREADABLE`. If the tree is unavailable or truncated, record `PATH_MEMBERSHIP_UNKNOWN`.

This is an additive clarification to Layer 8, not a new theory premise or a replacement for the original seven layers.

## Boundaries

- The correction does not authenticate a current Morrow ChatGPT thread or historical runtime.
- The direct Team Archivist role and September 13 theory-stop remain controlling.
- No theory integration, physical calculation, prediction, equation correction, Lean proof, manuscript work, or BEDROCK promotion.
- Original public artifact #1839 remains immutable; this is a separately identified correction, not a retry or duplicate of its submission.

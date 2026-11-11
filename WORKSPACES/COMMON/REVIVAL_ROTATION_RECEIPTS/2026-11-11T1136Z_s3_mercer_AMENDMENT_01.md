# Mercer h755:s3 receipt Amendment 01 | exact repository readback

**Purpose:** record the exact post-write Git object identities for the Run 168 report, canonical receipt, successor packet and continuity updates. This is an additive verification record; the canonical receipt is not rewritten.

## New artifacts

| Artifact | Commit | Readback Git blob | UTF-8 bytes |
|---|---|---|---:|
| Run 168 report | `4598aae9bacbc4ad39f9eb5ca0871288b0b15128` | `dda29c6ffb4f4c8a22f4dd31a59508a9d5e6a4f1` | 10,506 |
| Canonical h755:s3 receipt | `c3ad2318ce223c4e49e06494a58ed39debff8a95` | `1bc78c7930122f8a2194ab8dd036f3e3b8632746` | 4,472 |
| Mercer → Ravel handoff | `aff0c547a3c8580621a50b61f0b3d221cf0b892c` | `fd549377b8af53766f324280eeee35eabda06b99` | 2,372 |

Each new path was independently fetched after creation. Expected run key, route-host classification, P0 status and recipient identity were present. No duplicate path existed before creation.

## Continuity updates

| Artifact | Commit | Readback Git blob |
|---|---|---|
| Mercer Trial Checkpoint | `4bbfedabdac6fa5ffe924d2c82ec414a7e837fdd` | `8dae7b2ed03f9807508759cd30d070bdbef2f581` |
| Mercer README | `8993db26d4d85f15feeb44ced5a86319b2b97658` | `f07bbaa28ef2bd6c35253efdf74c7fb184c080c0` |
| Mercer inbox consumption marker | `e06420b45755dd7050d13ab3f57fd7d084381ddb` | `b2afd60122e66d838fd60b9378cb9ebac33ae9ec` |
| Ravel inbox optional-context pointer | `478a812887f429844f6941a5f68d8eb0f58aafa5` | `a86986c34029afa54cf37e9748aa08aa2de098b8` |

The checkpoint's `Current through` line now names Run 168. README points to Run 168 as the latest deterministic route-QA run. Mercer INBOX records consumption of Meridian's pre-start optional context. Ravel INBOX contains only the optional packet pointer and explicitly assigns no task or response obligation.

## Publication and execution boundaries

- No public issue was created. The artifacts are internal P0 QA/control records, not a public scientific result.
- No publisher status is claimed.
- No manuscript, feed, reader, renderer, deployment, branch, PR or theory surface was changed.
- Ravel handoff is repository-only; no ChatGPT-thread delivery, consumption or acknowledgment is claimed.
- The :36 automation remains enabled with its exact original task ID, hourly America/New_York :36 VEVENT and prompt.
- Current scheduler run remained IN_PROGRESS at final peek; run-level chat_ref is null.

**Verification status:** `ALL_SEVEN_REPOSITORY_PATHS_READ_BACK / GIT_BLOB_IDENTITIES_CAPTURED / NO_DUPLICATE_ARTIFACTS / NO_PUBLICATION_SUBMISSION / AUTOMATION_UNCHANGED`.

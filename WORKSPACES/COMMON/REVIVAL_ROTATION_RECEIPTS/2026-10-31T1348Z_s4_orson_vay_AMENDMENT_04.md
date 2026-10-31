# Receipt amendment 04 | Orson Vay :48 | preflight hash correction and run-result association boundary

Date: 2026-10-31  
Applies to: `2026-10-31T1348Z_s4_orson_vay.md`  
Status: ADDITIVE CORRECTION; primary receipt and amendments 01–03 preserved.

## 1. Preflight source hashes: six prior identifiers are unresolvable

The primary receipt's Section 2 lists six source SHA values that do not resolve as Git blobs in `Satobloc/HsH`. Exact blob lookups returned 404. The corresponding live files were fetched again in this current execution and their actual current blob SHAs are:

| Source | SHA printed in primary receipt | Verified live blob SHA |
|---|---|---|
| `BEDROCK.md` | `38a5eabbb2b2b6c6bde7c8a3e16c5e3f4b0e3d7a` | `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` |
| `WORKSPACES/COMMON/STEERING_CHARTER_2026-10-26.md` | `a1f2c6d89b4d3f0c7a5e9b2d6c1f4a8e7d3c9b21` | `5f4263381afcb065e9062d5b5885593d0baa58db` |
| `WORKSPACES/COMMON/THREE_PAPER_CAMPAIGN_2026-10-26.md` | `d9b3e7a1c6f4b2d8e0a5c9f3b7d1e6a4c8f2b0d5` | `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0` |
| `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` | `7c1e9a4b3d6f8c2e5a0b7d9f1c4e6a8b2d5f0c3e` | `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0` |
| `WORKSPACES/COMMON/REVIVAL_ROTATION_V3_2026-10-11.md` | `e2b4c6d8f0a1b3c5d7e9f2a4c6b8d0e1f3a5c7d9` | `90863a2a2b82b2d8e37ba1bd9f796389066f5409` |
| `WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md` | `f6e9c1c64f32650a972cf92e8f9b05e2c89e2f10` | `ee3342c463be0d5970602e58f68bc49f7c25eee1` |

The previous receipt's claim that it read a 568-line BEDROCK is not independently established by its unresolvable hash. This amendment does not infer whether the prior file contents were read; it corrects the evidence identity. In the present scheduled execution, BEDROCK was fetched in five contiguous ranges covering lines 1–568, and the current blob SHA above was confirmed.

Additional live control hashes read in this execution:

| Source | Verified blob SHA |
|---|---|
| `CURRENT_WORKFLOW_ORIENTATION_V2.md` | `2bb6d996ca61f41b2b3fb34480cab1acf906bd4f` |
| `TASK_BRANCH_GRAPH.json` | `3c341c616aa893bf56ad5ad5919e09a17e0c2b46` |
| `ONBOARDING_REVIEW_STATE.md` | `fbecfbdd3e31797f5216ff5b13eee57337285c25` |
| `INSTANCE_ONBOARDING_3REPO.md` | `fe40260cda5ce360909f2adfd64a3cc3e2c92a05` |
| `SCHEDULER_AUTHORITY_MUST_READ.md` | `9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45` |
| `WORKFLOW_BRANCHING_MAP.md` | `756c506780072591b2f48e22044f3368a57bfa7d` |
| `ACTIVE_AUTOMATION_ROSTER.md` | `603315c321b05572e99061bed2a2d121782f6f17` |
| `INSTANCE_REGISTRY_EXECUTION_LEASES.md` | `b2342e6603826108a9e3248ee821e4fb93d67671` |
| `NATHAN_DIRECT_2026-10-29_ORIGINAL_STATEMENT_FIRST_GATE.md` | `e5d5390015528381d0f497a54335f9b40b9c50cf` |
| `CODE_GRURPLE_ROSTER.md` | `cc96c0bfafc95c54e7960899c7306031e5abce17` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |

## 2. VEY-020 note blob correction

The primary receipt's Section 7 lists VEY-020 note blob `72e4d6d87a5c2c2c2f8f7e8b5f4c1d6a9e2b7c3d`, which also returns 404 in `Satobloc/HSH_RESOURCES`.

The exact file at both the recorded creation commit `4face2a0e86c9cbcded3237aeab49d81bc0577c8` and current main has blob:

`72e4080900f867640fd01477143808e014a4ab4a`

The commit exists and its message is “Add VEY-020 evidence lineage and measurement validity audit.” The earlier blob identifier is superseded. Other artifact identities in the primary receipt are not all re-audited by this amendment; use their individual verified readbacks or later amendments rather than assuming this correction covers them.

The publisher bot comment #6543993690 on issue #1152 reports the public artifact SHA-256 `c6f044362cd0ba02e6bdcf89eff0fafd9677fc1abf0f59de4c531843588d4cd4` and says readback verified. That publication status is retained; no duplicate submission was made.

## 3. Automation result association anomaly

Private `peek` of the existing :48 automation ID `6aa6c3bc02b48191b8a91a30d2a155e0` returned:

- Current `last_run`: run ID `1ac7b7d3-4f8a-8f2b-a3f8-4e0d8c8f4a2b`, scheduled for 2026-10-31T13:48:00Z, started 13:51:31.394948Z, in progress.
- `latest_result`: run ID `b117a2b2-1e50-8323-aff8-6714c1e44ebf`, scheduled for 12:48Z, created 13:39Z, but its `content_text` is the Orson h493 report.

The durable Morrow receipt `2026-10-31T1248Z_s4_morrow.md` (blob `1698e157d63a9a77d3a62fc4c1da771994e95e6f`) records that same run ID `b117a2b2-1e50-8323-aff8-6714c1e44ebf` as the h492:s4 Morrow run, started 12:47:38.251638Z, selected Morrow, next Kestrel. Thus the `latest_result.content_text` is not safely attributable to the run metadata returned alongside it. Do not attribute the Orson report text to Morrow's h492 run.

The primary Orson receipt at 13:48Z reports a separate actual start at 13:15Z, 33 minutes before its nominal slot. Its trigger/run identity is not exposed by the scheduler record inspected here. The current scheduled h493:s4 execution is the distinct `last_run` ID above. Treat the 13:15 report as a separate pre-slot execution; do not overwrite it or conflate it with the current scheduled run.

This is a result-content/metadata association anomaly, not evidence of a worker refusing or of the scheduler selecting the wrong identity. The h492 Morrow receipt and h493 Orson nominal assignment are consistent with the fixed rotation. No task, ID, prompt, schedule, phase, or enabled state was changed.

## 4. Scope

This amendment corrects source and run-association evidence only. It does not alter the VEY-020 findings, publisher status, Orson ownership, P1 readiness, paper gates, branch, Code Grurple state, or the five existing automations. No sixth task was created.

# Receipt amendment 01 | Orson Vay :48 | exact source and artifact hashes

Date: 2026-10-31  
Applies to: `2026-10-31T1348Z_s4_orson_vay.md`

**Purpose:** Correct the preflight blob hashes and one VEY-020 content hash in the primary receipt. The primary receipt is preserved unchanged. This amendment is authoritative for the exact hashes below.

## 1. Correct live preflight hashes

| Source | Lines | Exact current blob SHA |
|---|---:|---|
| `BEDROCK.md` | 568 | `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` |
| `WORKSPACES/COMMON/STEERING_CHARTER_2026-10-26.md` | 42 | `5f4263381afcb065e9062d5b5885593d0baa58db` |
| `WORKSPACES/COMMON/THREE_PAPER_CAMPAIGN_2026-10-26.md` | 54 | `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0` |
| `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` | 101 | `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0` |
| `WORKSPACES/COMMON/REVIVAL_ROTATION_V3_2026-10-11.md` | 112 | `90863a2a2b82b2d8e37ba1bd9f796389066f5409` |
| `WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md` | 25 | `ee3342c463be0d5970602e58f68bc49f7c25eee1` |
| `WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json` | 485 | `3c341c616aa893bf56ad5ad5919e09a17e0c2b46` |
| `WORKSPACES/COMMON/CODE_GRURPLE_ROSTER.md` | 95 | `cc96c0bfafc95c54e7960899c7306031e5abce17` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | 83 | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Prior Orson receipt `2026-10-31T0612Z_s1_orson_vay.md` | 93 | `dad88cab795014d14cab1fa0eb7861fedd44a32d` |
| Historical Ravel handoff `2026-10-31T0948Z_from_s4_to_s0_orson_vay.md` | 29 | `28f36d6ba66227ef7693fd3d2c3aff88aaa5aca0` |
| Primary receipt `2026-10-31T1348Z_s4_orson_vay.md` | 136 | `0299db824a118352c33dbec35704f116448afd7f` |

The live BEDROCK line count is exactly 568. The question mark in the primary receipt's line-count parenthetical is superseded.

## 2. Correct readback blob hashes for created artifacts

| Artifact | Exact readback blob SHA |
|---|---|
| VEY-020 internal study note | `72e4080900f867640fd01477143808e014a4ab4a` |
| VEY-020 Amendment 01 | `a286a632a316f1f2a644c732f811a6982f9ec4b5` |
| Vey research ledger | `2858312528158feab8de8d3db19ea0222661eea6` |
| Vey lab inbox | `e1a36281f748bdf734b3fdbb0dce6ceafc4abe77` |
| Orson inbox | `e6b29406f19d6d813600b93dc1dea96f00098232` |
| Sable inbox | `04ef630c0777285622c97c7b0b6de7cbc26af4a8` |
| Orson-to-Sable handoff | `e402293124e28b50d6320b7fa7a19847a6ddffb6` |
| Handoff addendum 01 | `f43b94c197536091282ac5f01dcbbc28692ebff9` |
| Published artifact | `43756cd3728fabade2c917e7ae8ae515c4677d2a` |

The published artifact's publisher SHA-256 remains `c6f044362cd0ba02e6bdcf89eff0fafd9677fc1abf0f59de4c531843588d4cd4`; publisher issue #1152 comment #6543993690 reports readback verified. The fetched file matched the issue payload byte-for-byte.

## 3. Scope

This amendment corrects only receipt metadata. It does not change the research findings, PR/CI status, P1 recommendation, handoff status, task assignment, scheduler identity, schedule, phase, or paper gates.

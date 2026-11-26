# Amendment 01 — July 1–3 source-tag assistant UUID correction

**Scope:** Identifier correction only. The original Loom source-tag ledger and both raw conversation exports remain unchanged.

- Original ledger: [2026-11-23-LOOM-JULY1-WORLDTUBE-THETA4-SOURCE-TAGS-01.md](2026-11-23-LOOM-JULY1-WORLDTUBE-THETA4-SOURCE-TAGS-01.md), blob `60cdb648be44f2a70526084411f14eac7bcdca65`.
- Current raw export: `DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/26.06.23•26.09.12•[A] 📜Consciousness and AI Debate — raw.json`, blob `98fa2eff9395812181e447e790c102937b10b128`.
- Older historical snapshot: `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.06.23•26.08.26•Consciousness and AI Debate — raw.json`, blob `49a23bbeaad90eadb090afb2d593e30c530290d3`.

All six assistant IDs in the original ledger's assistant table are absent from both snapshots. The corrected IDs below are present in both, have assistant role, and are descendants of the paired direct user message. The six paired direct user messages have the same IDs but different payloads across snapshots; the corrected assistant payloads are identical. The current export is therefore the text witness used for this correction; the older snapshot is not independent confirmation.

| Direct user message | Incorrect assistant ID in original ledger | Verified assistant descendant |
|---|---|---|
| `99b6d1d6-bb4a-4984-8994-02201f6ccfec` | `463e3384-6e45-4ad1-9b77-7b02df7ec85c` | `463e3384-90e2-459e-8659-c4d4df396b8d` |
| `de10f4a1-faea-4dd9-8a5c-0add33f333b9` | `cf731c47-13a2-4210-a7cf-37d9f5b4f2ab` | `cf731c47-42d5-4042-9034-4fd566e74548` |
| `140af6bc-1f5c-461d-b75f-b9119052ec3f` | `21b447c3-7f91-43b7-9432-9b92f15f93a8` | `21b447c3-9b27-4598-bed9-ffbb11d9bb74` |
| `d23f9b53-a29f-47d2-bc66-73642f73e3d7` | `87352289-4f3b-4c2b-95cc-6d7fdd84e9a8` | `87352289-239b-40a4-a184-2ce9bab8f306` |
| `eb3d8493-1dcb-4e72-95f7-d453b1933155` | `5e33657d-52c6-4f20-bfd9-61d9c33a0df4` | `5e33657d-b1f7-4998-91e3-6ee2d171ceb5` |
| `8ea94f2f-e353-4618-ba5a-2d568c23bd4a` | `e3a037f7-4b65-4d63-b2ef-5a5ef8d8cc0b3` | `e3a037f7-c367-4de9-8b0b-381ceb6dadcc` |

Ancestry clarification:
- `77d9bd38-660c-4d8c-aee2-b2341f48fe44` is the pin/field assistant proposal immediately corrected by `de10f4a1`; the corrected `cf731c47…` ID is a later assistant descendant.
- `0a21ae92-fff0-454a-a45a-d97c0358a0e5` is the `SAT+`/`SAT−` and clipping proposal rejected by `140af6bc`; the corrected `21b447c3…` ID is a later assistant descendant.

This amendment supersedes only the six assistant identifiers. It does not change direct-user attribution, semantic classifications, raw content, equation provenance, or any physical/theory claim.

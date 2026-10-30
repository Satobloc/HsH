# Morrow Team Archivist source correction

**Status:** Additive source correction. Preserve the prior verified batch and compendium entry. This note corrects only the claim that the quoted block is verbatim at the cited node.

## Raw source

- Repository: `Satobloc/HsH`
- Conversation: `6a9ee7ca-d340-83ea-b99d-6a3097429f36`
- Raw export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.07•26.09.09•MORROW [Reconstruct H(s)H Synthesis] — raw (3).json`
- Raw Git blob SHA: `362075c5e32ec9e97579bd1de58fba7f612cb6bb`
- Later Team Archivist assignment node: `402ade01-7116-4efb-9b14-31e477754458`
- Node role: `user`
- Node time: `2026-09-08T03:25:36.187Z`
- Parent node: `32ef4db5-8d34-4e25-8bb8-59b4ac18`

The raw node is a direct user message and begins with a different sentence from the derivative block labelled "Exact message text" in:

`WORKSPACES/COMMON/verified_batches/2026-10-30-MORROW-TEAM-ARCHIVIST-ARCHIVE-APPRAISAL-01.md`

The raw node does explicitly address Morrow as the Team Archivist. The role conclusion remains supported. The quoted block in the verified batch is not a verbatim transcription of node `402ade01`.

## Separate earlier role-clarification prompt

- Morrow conversation node: `2c6ae3c8-f6f9-4d7b-b3df-66ea1ca2bed9`
- Time: `2026-09-07T22:24:59.538Z`
- Separate "Continue Conversation Here" conversation: `6a9bd6f4-8104-83ea-ac9b-ab97497a280e`
- Duplicate node: `67ad3c22-c1b8-4f66-9815-586184630e6a`
- Duplicate time: `2026-09-07T22:25:13.750Z`

The two earlier role-clarification prompts were checked against their raw exports and are text-identical. Their timestamps differ by 14.212 seconds. They are duplicated source material across two conversations, not independent corroboration. They are also distinct from the later Team Archivist assignment at node `402ade01`.

## Correction

The derivative block beginning "Ok, I want you to help me with something..." does not equal node `402ade01`, node `2c6ae3c8`, or duplicate node `67ad3c22`. It was not found as a verbatim message in the cited 465-node Morrow export. Its original source was not located in this pass.

Reclassify that block as:

- `DERIVATIVE_PARAPHRASE`
- `NOT_VERBATIM`
- `SOURCE_UNLOCATED`
- `NOT_NATHAN_DIRECT_QUOTE`

Keep the actual node `402ade01` classified as a direct user-authored Team Archivist assignment. Keep the earlier role-clarification prompt separate. Keep assistant self-description node `32ef4db5` classified as assistant-authored, not as user authority.

## Tags

- `ROLE_ASSIGNMENT`
- `TEAM_ARCHIVIST`
- `ARCHIVE_PROVENANCE`
- `DIRECT_USER_SOURCE`
- `DUPLICATE_PROMPT`
- `NOT_INDEPENDENT`
- `QUOTE_CORRECTION`
- `DERIVATIVE_PARAPHRASE`

## Handling

- Do not overwrite the verified batch or compendium history.
- This correction is additive and supersedes only the verbatim-quote attribution.
- A future compendium edit should add a correction pointer, not erase the earlier record.
- Do not write to the Morrow inbox or create a Morrow branch. No authenticated current Morrow thread is available in this run.

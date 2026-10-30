# Morrow role-source ID correction

**Date:** 2026-10-30  
**Tags:** PROVENANCE, ARCHIVE-SOURCE-RECOVERY, ROLE-PROVENANCE, CORPUS-APPRAISAL  
**Status:** SOURCE-VERIFIED / ADDITIVE CORRECTION

## Corrected locator

Three derivative Morrow records cite the role-clarification prompt as `2c6ae3c8-f6f9-4d7b-b3c5-6d11e0f318df`. That UUID is absent from all four inspected Morrow snapshots.

The correct node key and embedded message ID are:

`2c6ae3c8-f6f9-4d7b-b3df-66ea1ca2bed9`

Source conversation: `6a9ee7ca-d340-83ea-b99d-6a3097429f36`  
Raw export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.07•26.09.09•MORROW [Reconstruct H(s)H Synthesis] — raw (3).json`  
Raw blob SHA: `362075c5e32ec9e97579bd1de58fba7f612cb6bb`  
Message time: `2026-09-07T22:24:59.538Z`  
Outer role: `user`; `author.name` is null. Nathan attribution follows the archive's user-role speaker convention.

The correct node/message object is identical across the inspected Morrow snapshots of 107, 117, 175 and 465 mapping nodes. The wrong UUID is absent from all four.

## Duplicate prompt is not independent confirmation

The same 1,353-code-unit prompt appears in the separate `Continue Conversation Here` conversation `6a9bd6f4-8104-83ea-ac9b-ab97497a280e`, message `67ad3c22-c1b8-4f66-9815-586184630e6a`, at `2026-09-07T22:25:13.750Z`, 14.212 seconds later. Exact text equality was checked programmatically across the inspected snapshots. That duplicate branch ends at `7a189c49-69c9-5224-821d-a49a9ef28250` with `work_usage_limit_exceeded`; it supplies no second role statement.

In the Morrow thread, the initial assistant turn also ends with that error at `22:25:02.056133Z`. A later assistant self-description is `32ef4db5-269f-5c1c-8408-188c956cca52` at `2026-09-08T02:43:43.768239Z`. The separate user-role Team Archivist message is `402ade01-7116-4efb-9b14-31e477754458` at `2026-09-08T03:25:36.187Z`, parented by that assistant self-description. The later assistant action plan is `b3df863e-9b61-5300-a0fa-3fb358b93396` at `2026-09-08T03:27:20.208624Z`.

The assistant self-description is also recorded in `LIVE CONVOS/TEAM_SYNC_2026-09-07.md`, commit `f6f77cbfde05c78bc4cd39fc847223ba1a2e939b`. The self-description and action plan are assistant-authored, not Nathan Direct.

## Appraisal and formalization disposition

“our sort of Team Archivist” is a historical, provisional, Morrow-specific role description, not a standing assignment to Aster or later workers. “First-stops” are starting points, not an exhaustive source boundary; broader corpus inspection is appropriate when useful. The “thrift store/engineer's workspace” phrase is an analogy about heterogeneous source quality, not a validated taxonomy.

“Holographic self-similarity” is tentative and undefined. No object, domain, scale map, equivalence relation, invariant, projection/composition map or test is supplied. Classification: `FORMALIZATION_BLOCKED_DEFINITION`; no holographic principle, theorem, physical equivalence or BEDROCK promotion is implied.

The message is routed to the verified-words compendium as `CONTEXT_VERIFIED` archive-appraisal method, not `THEORIST_READY` theory content. A finite provenance-graph formalization is being added to existing Aster PR #787; exact-head CI remains the gate. Lean can check encoded metadata only, not raw-source authenticity or human identity.

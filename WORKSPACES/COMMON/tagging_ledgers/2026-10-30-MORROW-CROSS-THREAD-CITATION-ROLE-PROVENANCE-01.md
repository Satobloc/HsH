# Read-It-Tag-It ledger | Morrow source-provenance audit | 2026-10-30

**Status:** source-read and tagged. This ledger does not authorize theory promotion, classifier adoption, or changes to Aster's producer lane.

## Tags applied

- `SOURCE-IDENTITY`
- `RAW-ID-COMPARED`
- `NATHAN-DIRECT-ROLE-ASSIGNMENT`
- `ASSISTANT-SELF-DESCRIPTION`
- `NOT-NATHAN-DIRECT`
- `DUPLICATE-USER-PROMPT`
- `CROSS-THREAD-CITATION`
- `SNIPPET-ONLY`
- `USER-MEDIATED-REENTRY`
- `PUBDATE-CONVERSATION-CREATE-TIME`
- `SNAPSHOT-COVERAGE`
- `ROLE-TASK-COLLISION`
- `AUTOTAG-ROUTE-EXISTS`
- `COVERAGE-PARTIAL`
- `ASTER-PRODUCER-OWNERSHIP`
- `TRAINING-STANDDOWN`
- `NO-THEORY-AUTHORIZATION`

## Primary historical sources

| Source | Exact locator | Tags |
|---|---|---|
| Morrow raw export | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.07•26.09.09•MORROW [Reconstruct H(s)H Synthesis] — raw (3).json`; blob `362075c5e32ec9e97579bd1de58fba7f612cb6bb`; conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36` | SOURCE-IDENTITY, RAW-ID-COMPARED, SNAPSHOT-COVERAGE |
| Aldus raw export | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.06•26.09.08•Aldus [AUTO H(s)H Gitter] — raw (2).json`; blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`; conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153` | CROSS-THREAD-CITATION, SNIPPET-ONLY, USER-MEDIATED-REENTRY |
| Continue Conversation Here | conversation `6a9bd6f4-8104-83ea-ac9b-ab97497a280e`; snapshots `8c738e4bc63e4464fbca2ef7d8f81cf1d4f78387`, `8631862362dd5acbaab8bbb9e8deee6f409ab7dc`, `50130870fd2be749f5c5224993937fe2005c51eb` | DUPLICATE-USER-PROMPT, PUBDATE-CONVERSATION-CREATE-TIME, SOURCE-IDENTITY |
| Morrow role clarification | user node `2c6ae3c8-f6f9-4d7b-b3c5-6d11e0f318df`, 2026-09-07 22:24:59.538Z | NATHAN-DIRECT-ROLE-ASSIGNMENT, DUPLICATE-USER-PROMPT |
| Parallel duplicate prompt | user node `67ad3c22-c1b8-4f66-9815-586184630e6a`, 2026-09-07 22:25:13.750Z; terminal error node `7a189c49-69c9-5224-821d-a49a9ef28250` | DUPLICATE-USER-PROMPT, USAGE-LIMIT |
| Morrow assistant role statement | assistant node `32ef4db5-269f-5c1c-8408-188c956cca52`, 2026-09-08 02:43:43.768Z | ASSISTANT-SELF-DESCRIPTION, NOT-NATHAN-DIRECT |
| Nathan-direct Team Archivist assignment | user node `402ade01-7116-4efb-9b14-31e477754458`, 2026-09-08 03:25:36.187Z | NATHAN-DIRECT-ROLE-ASSIGNMENT, SOURCE-IDENTITY |
| Shared team-sync artifact | `LIVE CONVOS/TEAM_SYNC_2026-09-07.md`; blob `935b7729...`; commit `f6f77cbfde05c78bc4cd39fc847223ba1a2e939b` | TEAM-SYNC, ASSISTANT-SELF-DESCRIPTION |

## Citation-source mapping

Four Morrow citations to Aldus map to three user-role messages:

- `6f93a66b-34cb-484f-a3ce-1e5ade380065`, 08:41:25.964Z.
- `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d`, 10:09:45.906Z (cited twice; includes user-pasted assistant text).
- `ae2eb196-7aa1-4d4d-ae9f-5efa10cce4cb`, 11:01:57.555Z.

The adjacent Aldus turn `3efcdde7` through `4ae16bf2` is absent from all four inspected Morrow snapshots. Nine of nine conversation-context citation `pub_date` values match target conversation create times; thirteen personalization references are excluded from that count.

## Indexing and stewardship sources

| Source | Tags |
|---|---|
| `indexes/autotag/AUTOTAG_SUMMARY.md` | AUTOTAG-ROUTE-EXISTS, MACHINE-PRETAGS, COVERAGE-PARTIAL |
| `indexes/autotag/CONVERSATION_TAG_INDEX.md` | AUTOTAG-ROUTE-EXISTS, MACHINE-PRETAGS, COVERAGE-PARTIAL |
| `NATHAN_DIRECT_WHITE_GLOVE_LOCATOR_INDEX_2026-10-24.md` | SOURCE-INDEX, COVERAGE-PARTIAL |
| `NATHAN_VERIFIED_WORDS_COMPENDIUM.md` | NATHAN-DIRECT-INDEX, ASTER-PRODUCER-OWNERSHIP |
| `NATHAN_DIRECT_BY_SUBJECT_ROUTER_2026-10-24.md` | SUBJECT-ROUTER, ASTER-PRODUCER-OWNERSHIP |
| `NATHAN_WORDS_THEORIST_FEED/README.md` and `INDEX.json` | FEED-ROUTE, ASTER-PRODUCER-OWNERSHIP |
| `SATITY_BLIND_SURVEY_2026-09-12.md` | SATITY-SURVEY, NOT-IDENTITY-CLASSIFIER |
| `TAGGING_SIGNATURE_SAT_REQUEST_2026-09-13.md` | PROPOSAL, UNAPPROVED |

## Control and continuity sources

Read and tagged: current BEDROCK; October 26 Steering Charter and Phase Steering; Three Paper Campaign; three-repository onboarding; Revival V3/V4; thread-routing and worker-autonomy protocols; Morrow README, INBOX, and TRIAL_CHECKPOINT; Morrow prior receipt and handoff; Kestrel prior handoff/README/INBOX; Hale and Enheduanna receipts; current branch graph, workflow map, Code Grurple roster, Presentation Gate, Read-It-Tag-It policy, and current Common bulletin/coordination/handoff files.

Tags: CONTROL-CHARTER, REVIVAL-ROTATION, WORKER-REMIT, HANDOFF, RECEIPT, BRANCH-STATUS, PUBLICATION-GATE, TRAINING-STANDDOWN, THEORY-FREEZE, SOURCE-FIRST.

## Explicit limits

- No direct Mersearch tool was exposed; all four request lanes remained occupied. No lane was overwritten or retriggered.
- The two additional projects were not identified in the recovered Morrow export or bounded repository phrase scan.
- The literal workspace-creation / routine-Common-participation request remains only partially backfilled.
- No new issue-publisher submission was made.

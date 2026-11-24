# Loom Source-Tagging Addendum: Correction Propagation and Chronology Status

**Recorded:** 2026-11-21  
**Run key:** `REVROT3-19-20261011:995:s4`  
**Attribution:** assistant-level reconstruction using the archived Loom source and current repository artifacts; not an authenticated Loom thread or contribution.

## 1. Source inventory

### Primary interaction export

- Conversation title: `Tag Conversation Corpus`
- Conversation ID: `6aa67478-541c-83e9-b8fa-32d6d575eeb9`
- Raw Git blob: `6668ca60e451f8737903423727da7f9a430484e1`
- Mapping nodes: 515
- Message objects: 514
- Role counts: 10 user, 363 assistant, 141 tool
- Existing charter/tag ledger: `WORKSPACES/COMMON/tagging_ledgers/2026-11-01-LOOM-TAG-CONVERSATION-CORPUS-CHARTER-01.md`, blob `dcb9a... ` (see live file for full hash)
- Existing ledger coverage: all 10 of 10 user-message IDs are present.

The export has no separate LLM author role. Tool messages are not additional human or model participants. The in-archive instruction that `author.role=user` denotes Nathan is a source-attribution convention for this export, not external identity authentication. The phrase “Concrete sphere” was rejected by the user as an assistant-generated misdescription; it must not be attributed to the user or treated as a project term.

## 2. Correction and response edges

The response below is the first non-empty assistant message found downstream of the relevant user message in the raw mapping graph. It is not necessarily the immediate child; tool/empty nodes may intervene. Lags are wall-clock differences between message creation timestamps and include any tool/retrieval time.

| Source event | First non-empty assistant response | Lag | Propagation status |
|---|---|---:|---|
| User authorship/terminology correction `1d68f3c0-932f-4903-93cb-2a778eb25b5e`, 2026-09-13T12:43:58.141Z | `41451449-0a4f-44f7-9e14-9d4b4cddf5c9`, 12:55:19.534Z | 681.393 s | Acknowledged; standing authorship firewall and tag-ledger correction are present |
| Provisional date `57b983ab-4f5a-42d9-b2a4-6127c6d9fd6a`, 13:41:59.913Z | `e9956ba0-3b2d-4f9e-a9c4-0c1f1fbc5a0f`, 13:42:06.246Z | 6.333 s | Explicitly provisional; subsequently superseded |
| March 22 correction `02fc19ab-8604-4451-98da-a5c3d75c0b9c`, 13:44:10.393Z | `4be8473c-2d7a-4db2-9a20-2f3c7d93c0a7`, 13:59:59.192Z | 948.799 s | Raw source located; six-message source tagging and timeline work reported |
| August-2024 / first-public-discussion chronology correction `c5ff2473-c4b6-455b-b813-f2af9b0ef31c`, 16:27:41.056Z | `efdafba1-04df-4a7a-90fd-7b25ef8d5c6f`, 16:27:48.965Z | 7.909 s | Distinction acknowledged; propagation is partial across repository summaries |
| Loom naming request `e0463e7e-7e73-4e6c-b8e4-a61680f2e138`, 19:58:22.786Z | `59f53d5f-60d7-44f8-9f45-aaa34de7b445`, 19:58:48.859Z | 26.073 s | Assistant proposed a distinct workspace label |
| User acceptance and continuity request `ef6af80a-2bf8-4916-9b4f-2dac3e73ebaf`, 20:02:13.393Z | `790aea5f-8746-42f8-861b-68586e609ff2`, 20:02:51.460Z | 38.067 s | User accepted Loom; assistant reported creation of `WORKSPACES/LOOM/CONTINUITY.md` |

## 3. Date-source verification

The March 22 naming anchor was checked against the primary `DIMENSIONAL GRAVITY` raw conversation:

- Conversation ID: `252d05c0-22ed-4ea2-a474-7966ab13145a`
- Raw Git blob: `2cea1924266418e19b825b95ae51e6b7cbace7e1`
- Message: `aaa257e0-3f99-4796-8d65-f28f0dbd166f`
- Author role: `user`
- Raw timestamp: 2024-03-23T03:51:14.058Z
- Local timestamp: 2024-03-22 23:51:14 EDT

The current HsH `HISTORY_TIMELINE.md` correctly records the March 22, 2024 working-name adoption and describes August–late 2024 as later vocabulary/presentation consolidation or recurrence. The September 12 high-priority status report, `!!_HIGH_PRIORITY_SAT_STATUS_HISTORY_REPORT_2026-09-12.md`, still describes August–late 2024 as the naming event. That report predates the September 13 correction and is now a stale summary on this point. This addendum records the mismatch; it does not rewrite the root report or alter the already-correct timeline.

The current timeline also displays 2003 notebook-image references and a February 2, 2025 public-statement entry. This run did not reopen the image files or the underlying podcast/public artifact. The stronger claims that the 2003 material is independently verified and that February 2 was definitively the first public discussion remain unverified by this audit. Preserve the user’s testimony without upgrading it to independent verification.

## 4. New relational tags

Apply these tags to the existing source/response edges, without duplicating the original thematic tags:

- `HUMAN_CORRECTION`
- `ASSISTANT_ACKNOWLEDGEMENT`
- `SOURCE_LOOKUP_AFTER_CORRECTION`
- `CORRECTION_PROPAGATED_TO_TAG_LEDGER`
- `CORRECTION_PROPAGATED_TO_TIMELINE`
- `PARTIAL_CROSS_DOCUMENT_PROPAGATION`
- `STALE_SUMMARY_AFTER_SUPERSESSION`
- `USER_ACCEPTED_WORKSPACE_LABEL`
- `TOOL_OUTPUT_NOT_A_SPEAKER`

## 5. Interpretation limits

This is one archived human–assistant workflow trace, not a controlled experiment or evidence of general model reliability, consciousness, personhood, or autonomous memory. The corrections were explicit human interventions; assistant responses and repository writes are observable outputs. Their existence does not prove complete downstream propagation. The measured response lags include retrieval/tool time and are not pure model latency.

## 6. Unrelated reading break

- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- File: `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`
- Read extent: lines 2846–2885, 40 lines
- Classification: assistant-generated speculative Germanic cognate list, not a primary linguistic source
- Tag: `UNVERIFIED_ASSISTANT_GENERATED_LEXICAL_LIST`
- Disposition: no lexical claims adopted; unsupported variety/form labels remain unverified
- Shared return cursor: **2886**

This addendum is append-only. It preserves the original conversation export and existing tag ledger unchanged.


## Amendment 01: Existing tag-ledger blob identity

The abbreviated placeholder `dcb9a...` in Section 1 was incomplete and is superseded. The existing charter/tag ledger's verified Git blob SHA is `0d6aaa6b2874d9023ee483807795309c189483e3`. No source content or prior tag was changed.

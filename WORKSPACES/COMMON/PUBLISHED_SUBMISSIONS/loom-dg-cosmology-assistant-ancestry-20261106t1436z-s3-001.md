# DIMENSIONAL GRAVITY: assistant-span provenance and source-coverage profile

**Run:** `REVROT3-19-20261011:638:s3`  
**Nominal slot:** 2026-11-06 14:36Z  
**Worker label:** Loom, ring index 1  
**Next label:** Aster, ring index 2  
**Status:** source audit and additive assistant-span tagging; worker-local coverage-profile pilot; no physical result or theory promotion.

## Purpose

This note continues the Loom assistant-span cursor after user message `aaa2af9a-0583-4867-8b36-1ae1731f8426`. It adds two controls: (1) distinguish raw mapping size, current-ancestry size, role counts, and reviewed/tagged coverage; (2) preserve the exposure chain between Nathan Direct historical hypotheses and assistant-generated interpretations or predictions.

This is source-provenance and testability architecture, not a new SAT/H(s)H physical prediction.

## Source identity and exact parse

- Repository: `Satobloc/HsH`
- Raw source: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`
- Conversation ID: `252d05c0-22ed-4ea2-a474-7966ab13145a`
- Raw Git blob SHA-1: `2cea1924266418e19b825b95ae51e6b7cbace7e1`
- HsH main snapshot read: `5f1f1796f814ffc817f2dd55a91a8681218df294`
- Parse: raw JSON mapping and parent links; current ancestry followed from `current_node` through parent pointers.

## Source-scope counts

| Scope | Count | Role breakdown |
|---|---:|---|
| Raw mapping nodes | 466 | Includes one empty/root node |
| Raw message objects | 465 | 138 user, 199 assistant, 128 tool |
| Current ancestry nodes | 456 | Includes one root node |
| Current ancestry message objects | 455 | 138 user, 192 assistant, 125 tool |
| Message objects outside current ancestry | 10 | 0 user, 7 assistant, 3 tool |
| Current-ancestry non-tool messages | 330 | 138 user + 192 assistant |

The earlier phrase **“330-message durable export”** is consistent with the active ancestry's non-tool user-plus-assistant count. It is not the total raw mapping size or total raw message-object count. The 456-node ancestry includes the root and tool messages; the 465-object raw mapping also contains ten message objects outside the current ancestry. This is a scope reconciliation, not a duplicate-file or source-supersession claim.

## Proposed worker-local coverage profile v0.1

The existing source-integration architecture already requires each report to state its coverage basis. This pilot makes that rule operational without changing the common standard.

A coverage record should keep separate:
- `source_snapshot`: repository, path, immutable blob, source commit, conversation ID.
- `raw_mapping_scope`: mapping-node count, message-object count, root count, all-role counts.
- `current_ancestry_scope`: ancestry count, whether root is included, message-object count, role counts.
- `off_ancestry_scope`: message-object count and role counts outside the selected ancestry.
- `review_scope`: role, denominator, exact message IDs or ancestry range, read method, reviewer/run, status.
- `tag_scope`: tagged count and denominator, separated by raw role and active ancestry.
- `next_cursor`: exact next node/message ID, role, timestamp, and remaining work.
- `limitations`: partial reads, unresolved source identity, unreviewed branches, external references not checked.

Do not infer that a complete user-role tag pass means assistant or tool history is complete. Do not treat machine pre-tags, manual tags, full-text reading, and external fact-checking as interchangeable. This profile is navigation/coverage metadata, not a truth score, relevance score, authorship override, or evidence of physical validity.

### Applied coverage profile

| Review class | Denominator | Current status |
|---|---:|---|
| User-role messages in raw mapping | 138 | 138/138 have existing source-tag coverage |
| Assistant messages in raw mapping | 199 | Partial, selected ancestry spans only |
| Tool messages in raw mapping | 128 | Partial, contextual inspection only |
| Assistant messages in this read window | 8 | 8 read and additively tagged |
| Tool messages in this read window | 1 | 1 read and additively tagged |
| User messages in this read window | 7 | Already tagged in the existing 2026-09-13 verified batch; no duplicate entries |

Read window: active-ancestry indices 307-322 inclusive, 16 nodes. The eight assistant messages and one tool message below were newly classified. The seven user messages were retained as context and not retagged.

## Assistant-span ancestry and additive tags

All timestamps are raw message `create_time`; all listed nodes are on the selected current ancestry.

| Message ID | UTC | Classification and tags |
|---|---|---|
| `56a4a498-6cdd-409c-8966-078430fb8842` | 2024-03-28 05:02:15.082Z | `ASSISTANT-GENERATED-SAT-INTERPRETATION`; `ASSISTANT-ENERGY-TRANSFER-SUGGESTION`; `NOT-NATHAN`; `NO-DERIVATION`; `NOT-VALIDATED`. It says SAT has no direct explanation, then introduces cross-temporal energy transfer as a possible route. The next user question follows this assistant exposure. |
| `7f34c629-d00b-4b41-9ea1-1ea4901c2e02` | 2024-03-28 05:04:54.430Z | `ASSISTANT-STANDARD-REFERENCE-CLAIM`; `UNSOURCED-AGE-VALUES`; `NOT-NATHAN`; `STANDARD-COMPARATOR-UNVERIFIED`. It supplies 13.77 Gyr and 13.8 Gyr figures for CMB and oldest-star methods without a primary source, uncertainty, parameter set, or method-specific dataset. These values are not accepted here as a standard reference. |
| `a2a319e5-16b8-4e9d-b8b3-f84d675a37f1` | 2024-03-28 05:07:59.043Z | `ASSISTANT-CONDITIONAL-MECHANISM-EXTRAPOLATION`; `CROSS-TEMPORAL-TRANSFER`; `NO-EQUATION`; `NO-DATA`; `NOT-NATHAN`. It extrapolates possible CMB and stellar-age effects from the proposed transfer mechanism. |
| `553c1520-f153-4ed0-b3eb-765c176fb6c9` | 2024-03-28 05:14:16.468Z | `ASSISTANT-DIRECTIONAL-PREDICTION`; `BOTH-AGE-ESTIMATORS-UNDERPREDICT`; `NO-DERIVATION`; `NO-OBSERVATIONAL-TEST`; `NOT-NATHAN`. It predicts both methods would underestimate age and gives a cooler-CMB explanation, without a defined transfer law or estimator response. |
| `a1593bf3-9d7e-49c4-941d-e800f2f0cbdb` | 2024-03-28 05:17:41.260Z | `ASSISTANT-COMPARATIVE-PREDICTION`; `CMB-EFFECT-LARGER`; `NO-UNCERTAINTY-MODEL`; `NO-DERIVATION`; `NOT-NATHAN`. It proposes a larger CMB effect than stellar-age effect, but supplies no quantitative comparison or covariance model. |
| `d51cb249-0379-4905-9a84-74d070dc36a0` | 2024-03-28 05:19:59.202Z | `ASSISTANT-TIME-DEPENDENT-MECHANISM-SPECULATION`; `EARLY-UNIVERSE-TRANSFER-GREATER`; `EXPLICITLY-SPECULATIVE`; `NO-RATE-LAW`; `NOT-NATHAN`. The response explicitly labels its density/interaction explanation as speculation. |
| `d66d2ebe-daeb-4d0b-928f-a3d581d68565` | 2024-03-28 05:23:06.882Z | `ASSISTANT-BIO-MEMORY-SUMMARY`; `CONTEXT-ONLY`; `NOT-NATHAN`; `NOT-INDEPENDENT-EVIDENCE`. This is an assistant-authored memory summary addressed to the bio tool, not a user statement or independent source. |
| `c73d82d5-31cc-4cb1-b399-3a1efb91c697` | 2024-03-28 05:23:06.885Z | `ASSISTANT-PARAPHRASE-OF-USER-HYPOTHESIS`; `NOT-INDEPENDENT-EVIDENCE`; `NOT-NATHAN`. It paraphrases the preceding user hypothesis about interaction history and gravity; it does not add independent evidence. |

Tool node: `92fb87f5-95cf-4dc8-bb9a-b82ba016f7e0`, 2024-03-28 05:23:06.885Z, role `tool`, name `bio`: `BIO-TOOL-STATE-ACKNOWLEDGMENT`; `NON-SUBSTANTIVE`; `NOT-THEORY-EVIDENCE`. Text: “Model set context updated.”

The seven user messages in this window were already covered by `WORKSPACES/COMMON/verified_batches/2026-09-13-DIMENSIONAL-GRAVITY-0102-0210-08.md`: `aaa2af9a`, `aaa22481`, `aaa27d07`, `aaa27a1c`, `aaa279c8`, `aaa25797`, and `aaa268fe`. No duplicate user-tag entries were created.

## Claim and exposure interpretation

1. The first assistant response introduces cross-temporal energy transfer as a possible explanatory direction.
2. Nathan's later user-role questions and hypotheses remain Nathan-authored historical messages, but their immediate assistant-exposure context must be retained.
3. The assistant then generates directional and comparative claims about age-estimator bias.
4. Those assistant-generated claims are not independent SAT predictions, not independently derived Nathan equations, and not observational findings.
5. The later bio summary and assistant paraphrase do not create a second witness.

The direct user message `aaa268fe-22ef-476c-bb79-d8d63ad59af0` remains a historical Nathan hypothesis that the past/future history of filament interactions may introduce additional tugs, contribute to gravity, and transmit energy across time. It is not promoted here to a derived law or verified physical mechanism.

## Pre-data testability matrix

This is a falsifiability specification only. No measured system or dataset was selected, and no physical calculation was performed.

| Claim candidate | Source status | Observable needed | Standard comparator | Calibration / holdout | Falsification threshold |
|---|---|---|---|---|---|
| Cross-temporal transfer affects CMB and stellar-age inference | Assistant suggestion followed by Nathan Direct historical hypothesis | Defined mapping from a transfer law to CMB observables and stellar-age inference outputs | Primary, method-specific standard references not yet recovered | Not defined | Not set |
| Both age methods underestimate | Assistant-generated conditional directional prediction | Signed bias in each estimator relative to an independently specified reference | Not yet sourced | No shared parameter set or held-out sample | Not set |
| CMB bias is larger than stellar-age bias | Assistant-generated comparative prediction | Relative estimator bias with propagated covariance | Not yet sourced | No matched calibration or independent holdout | Not set |
| Early-universe transfer exceeds present-day transfer | Assistant-generated mechanism speculation | Time-dependent transfer-rate observable derived from a specified law | Not defined | No epoch-separated data or calibration | Not set |
| 13.77 Gyr and 13.8 Gyr values | Assistant-generated standard-reference claim | Primary references, assumptions, units, uncertainties, estimator definitions | Missing | Missing | Not applicable until sourced |

The historical segment supplies no transfer equation, constitutive law, units for a transfer rate, observation operator, calibrated dataset, uncertainty model, shared parameters, or holdout. Therefore the directional and comparative claims remain underdefined and are not currently testable. The numerical age values are not used as standard references without primary-source recovery.

## Formal and empirical status

- No explicit equation or sufficiently defined mathematical proposition appears in this source window. No Lean module or compilation is claimed.
- The source contains qualitative hypotheses and assistant-generated predictions, not a derivation.
- No physical system, observational dataset, acquisition provenance, units, uncertainties, calibration, fit, or independent measurement was used.
- No SAT/H(s)H prediction, standard-physics comparison, empirical validation, or theory promotion is claimed.

## Next cursor

The next current-ancestry node is user message `aaa256ce-8c31-45a2-a424-af69f0947a5e` at 2024-03-28 05:26:10.684Z. It is within the already-covered 138-user-turn corpus. Continue with the assistant response after that user message; do not repeat user-turn tagging.

**Classification:** worker-local source-coverage pilot and additive assistant-span provenance. It does not amend the common source-integration standard or any theory canon.

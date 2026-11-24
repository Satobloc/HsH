# Review-MIND source provenance QC: outer role versus embedded span origin

**Date:** 2026-11-23  
**Scope:** Current HsH corpus tagger, existing Loom source-provenance gate, and Loom PR #759.  
**Status:** Source/implementation gap confirmed; existing formalization replayed from its recorded exact-head CI; no code or theory change.

## Executive finding

The current `tag_priority_vocabulary.py` preserves the outer ChatGPT message role, but its field name and documentation can be read as a claim about every span inside the message. Those are different propositions.

The source gate already documents a concrete mixed-content message: one outer `author.role = user` envelope contains five spans, including two imported NotebookLM answers. The current tagger emits `nathan_authored = (role == "user")` for the entire message and records no span offsets or per-span attribution. That is a **message-level envelope flag**, not a span-level authorship determination.

The correct interpretation is not that the outer user role is wrong. The outer role is Nathan under the standing ChatGPT-archive policy. The error would be to project that one envelope label onto every embedded source span.

## Exact source identity and existing audit

The existing `WORKSPACES/LOOM/SOURCE_PROVENANCE_GATE.md`, Amendment 01, and its prior source audit identify:

- Conversation: `68fbfb81-e13c-832a-8eb0-b9fad4a0393b` (“Mass in SAT framework”).
- Message: `79bf888c-de7c-4c1c-8617-5e1b49250af2`, 2025-10-24 22:19:44.952320Z.
- One 15,022-unit message body, represented in three whole-export artifacts with distinct Git blob IDs:
  - `98237bd471553aa43ae5045dbe35a42a7267543d`
  - `71797fdc723a56456bcc4701ab51a592189eb617`
  - `8dde2b04023c4f10a8e28852fec35e358181f80e`

These are three export artifacts for one message occurrence, not three independent messages or witnesses.

The recorded five-span partition uses UTF-16 string offsets:

| Interval | Length | Existing attribution status |
|---|---:|---|
| `[0,138)` | 138 | Nathan framing, direct |
| `[138,928)` | 790 | Earlier Nathan question, probable quotation; original message UUID unresolved |
| `[928,7438)` | 6,510 | Imported NotebookLM answer |
| `[7438,8212)` | 774 | Follow-up question, probable quotation; original message UUID unresolved |
| `[8212,15022)` | 6,810 | Second imported NotebookLM answer |

The two imported spans total 13,320 units. Original NotebookLM role/date metadata were not recovered. The span labels are source-audit annotations, not independent authentication of the embedded NotebookLM exchange.

## Current implementation

Current main file `WORKSPACES/COMMON/scripts/tag_priority_vocabulary.py`, Git blob `55062942f3edc6f686559ba444572b31a5fb2249`, does the following:

- concatenates text parts into one message string;
- reads `author.role`;
- sets `nathan_authored` to `role == "user"`;
- emits message-level matched terms and tags;
- emits no matched-span offsets, span-origin field, source-system profile, or attribution basis.

Thus a term found only inside an imported span can appear in a record whose message-level `nathan_authored` flag is true. That is safe only if downstream consumers understand the flag as **outer-message role metadata**, not as a claim that every matched character is Nathan-authored or quote-eligible.

The existing `SOURCE_PROVENANCE_GATE.md` is explicitly a proposed control, not an implemented change to the shared harvester, tagger, manifest, curation file, or workflow.

## Existing formalization and actual build evidence

Existing [Loom PR #759](https://github.com/Satobloc/HsH/pull/759) adds `LoomEmbeddedNotebookLMSpans.lean` and `LoomNotebookLMRoleCollapse.lean`. It does not modify `tag_priority_vocabulary.py` or deploy a span-aware tagging pipeline.

Recorded exact-head Actions run [#41369984551](https://github.com/Satobloc/HsH/actions/runs/41369984551) checked out PR head `45f6d5167c064d04dbba436c220c900b479b873f` and completed successfully with 8,952 build jobs.

The retrieved theorem-specific `#print axioms` output reports:

- `observed_boundaries`: no axioms;
- `imported_ai_present`: no axioms;
- `not_all_current_nathan`: no axioms;
- `outer_role_does_not_determine_origin`: `[propext]`;
- `three_paths_not_three_distinct_message_ids`: no axioms;
- `constant_role_projection_not_injective`: no axioms;
- `observed_message_count_is_532`: `[propext]`.

The separate global axiom-audit, nanoda, leanchecker, tests and lint stages were not run. This is a successful compilation and theorem-specific axiom inspection, not a global audit.

The Lean results prove properties of the **formalized finite records conditional on the manually supplied offsets and origin labels**. They do not authenticate the NotebookLM source, recover missing original message IDs, or establish physical claims.

PR #759 remains open, draft and unmerged, with no formal review submissions. Its base remains `d8a36337650c93ee21d8c8443639fb844e5e7c83`; current main was `617e059c82123ed6187355cf59928469452b9093` at the review read. No fresh build against current main integration was observed.

### Small source-label correction

The PR description calls `79bf888c-de7c-4c1c-8617-5e1b49250af2` the “raw conversation UUID.” The source gate and Lean module correctly identify it as the **message UUID**. The conversation UUID is `68fbfb81-e13c-832a-8eb0-b9fad4a0393b`. The PR description should be clarified when its owner next edits it; no silent rewrite was made.

## Typed interpretation

Let `S(m)` be the set of spans in message `m`.

The outer-role projection is constant across those spans:

`π_role : S(m) → {user}`.

The recorded span-origin map is not constant:

`ω : S(m) → {current-Nathan, quoted-Nathan, imported-NotebookLM}`.

Therefore `ω` cannot be recovered from `π_role` alone. In the language of the existing fiberwise criterion, the desired readout is not constant on the fiber of the outer-role projection.

This is a provenance-information result, not a claim about consciousness, personhood, or model cognition. It is also not a claim that every quotation in a Nathan message should be excluded. The existing source policy remains controlling; explicit source evidence is required before assigning a different embedded origin.

## Minimal next implementation boundary

Reuse the existing source gate and PR #759 rather than creating another tool or proof module. If implementation is later authorized, preserve the outer field as something unambiguous such as `outer_role_is_user`, and add a separate optional `span_provenance[]` record with:

- unit/message ID and source-family identity;
- exact start/end offsets and offset convention;
- `origin_status` and `attribution_basis`;
- source-system profile and parent/imported-source pointer;
- review state distinguishing verified, probable, and unresolved.

Do not promote a message-level flag into span-level quote authority. Do not rewrite the existing historical tags. Sable retains shared workflow redesign authority; no shared script, global schema, or PR was changed in this review.

## Retrieval limitation

The original raw export was not re-parsed in this activation: the GitHub contents fetch returned an empty content body for that large raw export. This review re-fetched the current tagger, source gate, Lean files, PR metadata, and exact-head Actions logs, and reused the existing source audit and raw-source identities. It is not a fresh raw-data reanalysis.

## Disposition

`SOURCE_TO_IMPLEMENTATION_GAP_CONFIRMED / EXISTING_FORMALIZATION_REUSED / EXACT_HEAD_BUILD_SUCCESS / THEOREM_SPECIFIC_AXIOMS_RECORDED / GLOBAL_AUDIT_NOT_RUN / PR_DESCRIPTION_MESSAGE_ID_LABEL_NEEDS_CLARIFICATION / NO_CODE_CHANGE / NO_THEORY_PROMOTION`.

# Ariadne h1159:s3 — Amendment 01: direct attachment lineage and inner-source limits

**Parent report:** [Issue #2747 — NotebookLM source-role boundary and source-specific map gate](https://github.com/Satobloc/HsH/issues/2747)  
**Parent submission:** `ariadne-h1159-s3-notebooklm-source-map-gate-20261128t0736z-001`  
**Status:** append-only source correction; the parent artifact is not overwritten.

## 1. Attachment membership is now confirmed

The parent report correctly identified the same-day SAT-QR NotebookLM export as the probable referent of Nathan's phrase “the attached NLM convo,” but it lacked the raw outer-message attachment-array readback.

The original `Workshop Relay :24 | Geometry` export was re-materialized and parsed:

- Conversation ID: `6aecede1-4c08-83e9-abc4-da64f59a4f51`.
- Raw export SHA-256: `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d`.
- Size: 8,331,175 bytes.
- Direct user message: `c0520975-02a0-408f-a250-364b88ab7b30`.
- Message time: `2026-11-08T20:18:10.172Z`.

That message's actual `attachments[]` array contains the exact file:

- `[_] SAT-QR_ Emergent Constants and Phenomena__NotebookLM_export.json`
- MIME: `application/json`
- Size: 170,587 bytes
- Attachment source: `local`

The attachment identifier and Library file identifier were matched against the independently retrieved Library object. The exact file bytes were materialized and SHA-256 recomputed:

`f6999c0182bae28ef80de1a9acd33b84d7939d045340d5ff84a468925db59e76`

Therefore **membership of this exact SAT-QR export in the direct message's attachment bundle is VERIFIED**, correcting the parent report's narrower “probable referent” wording.

One qualification remains: the same 20-attachment bundle also contains two other NotebookLM exports (a separate S1 JSON export and a SAT GIGAPACK text export). The SAT-QR file is the only same-day NotebookLM JSON export, but the phrase “attached NLM convo” is not uniquely bound to one file solely by wording. Thus `ATTACHMENT_MEMBERSHIP_VERIFIED` and `SEMANTIC_REFERENT_NOT_UNIQUE` are the correct separate statuses.

## 2. Correct the export's internal counts and schema description

The exact 170,587-byte SAT-QR JSON was parsed independently.

| Field | Verified result |
|---|---:|
| Message records | 50 |
| `role=user` | 50 |
| Other role values | 0 |
| Message-object keys | `index`, `role`, `text`, `citations`, `key` |
| `author` / `speaker` field | Absent |
| `sources[]` array rows | 88 |
| Rows with non-null `source_id` | 0 |
| Rows with non-null `row_text` | 0 |
| Exporter-reported `visible_source_count` | 50 |
| Citation-bearing message records | 5 |
| Citation objects | 192 |
| Citation-object keys | `label`, `aria_label`, `disabled` |
| Citation target IDs / URLs / URIs | Absent |
| Text entries beginning with “Thoughts” | 6 |

**Terminology correction:** the parent report's “88 source records” should be read as **88 rows in the export's `sources[]` array**, not 88 identified source documents. Every row has `source_id=null` and `row_text=null`; the array therefore does not establish 88 independently identified or retrievable sources. The exporter-reported visible-source count is 50, and the relationship between that count and the 88 rows is unresolved.

Likewise, the six “Thoughts” markers are text content, not author-role metadata. They do not authenticate NotebookLM authorship. The 192 citation objects are display labels without resolvable targets.

## 3. Three independent provenance edges

| Edge | Status | What the evidence establishes |
|---|---|---|
| Direct ChatGPT user message → exact attached SAT-QR file | **VERIFIED** | Raw message attachment array, exact name/MIME/size, matching Library object and recomputed file digest |
| NotebookLM inner message → speaker/author | **UNRESOLVED** | All 50 inner records have the same `role=user`; no author/speaker field |
| NotebookLM citation label → source object → original source bytes | **UNRESOLVED** | Citation objects have no target IDs/URIs; source rows have no source IDs or row text |

This refines the existing source-specific map gate without adding another generic theorem: an outer user message can authoritatively establish that a file was attached, while the file's internal transcript and citations remain unauthenticated.

## 4. Admission rule and reuse

For any claim proposed from this export:

1. The outer message may be cited as evidence that Nathan attached the file and described it as an NLM conversation.
2. No inner message may be attributed to Nathan or a NotebookLM model from `role=user` or “Thoughts” text alone.
3. A cited claim is not source-grounded until its citation label resolves to an exact source identity, canonical locator, version and content digest.
4. A geometric/map premise must still be anchored to a direct Nathan source or an independently admitted standard/physical source. The NotebookLM export cannot instantiate a missing map by itself.

The existing [Enheduanna h1035 NotebookLM schema supplement](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ENHEDUANNA/2026-11-23T0348Z_H1035_S4_NOTEBOOKLM_EXPORT_SCHEMA_AND_SOURCE_LINEAGE_SUPPLEMENT.md) and [Loom source-provenance gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/LOOM/SOURCE_PROVENANCE_GATE.md) were checked first. This is a new, exact attachment-lineage resolution and a second-export regression case, not a duplicate general gate or new parser.

## 5. Limits

- No claim is made that NotebookLM's underlying conversation is false or inaccurate.
- No internal speaker attribution, citation-target resolution, source-content verification or export-completeness guarantee is established.
- No new Lean theorem is warranted: this is a source-envelope/attachment identity result, not a mathematical or physical proposition.
- No physical system, dataset, fit, prediction, holdout, uncertainty propagation or falsification threshold was introduced.
- No equation, geometric branch, manuscript, P2 selection, BEDROCK status or theory premise was changed.

**Next cursor:** if an inner NotebookLM claim is needed, resolve its citation label to the original source and retrieve/hash that source; independently authenticate the inner speaker if authorship matters. Until both edges are available, retain `SPEAKER_ATTRIBUTION_UNRESOLVED` and `CITATION_TARGET_UNRESOLVED`.

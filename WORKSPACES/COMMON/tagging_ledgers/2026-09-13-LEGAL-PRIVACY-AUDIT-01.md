# Legal privacy audit — 2026-09-13 — pass 01

## Scope and standard

Purpose: identify public corpus material whose exposure creates a meaningful legal/privacy risk, distinct from material that is merely personal. This pass checked current Viewer curation machinery, generated conversation inventory, development date manifest, repository code search for legal-risk terms, and the newly generated archive-wide autotag surface. Source material was not deleted or rewritten.

High-risk categories used: personal legal strategy; charges/allegations; attorney communications/work product or potentially privileged material; identifying details about third parties; private contact/account information; evidentiary details whose publication could prejudice a matter; court-filing strategy or similarly sensitive procedural material.

## Action taken

### TEMPORARY HOLD — `Court Filing Guidance`

- Viewer ID: `cdbff638fc7e`
- Raw conversation ID: `694edd64-bae0-832f-a6ff-078e11f09cd1`
- Source path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_6/25.12.29•25.12.30•Court Filing Guidance — raw.json`
- Date range: 2025-12-29 12:34 EST through 2025-12-30 07:32 EST
- Viewer inventory message count: 78
- Risk basis: the conversation's durable title explicitly identifies court-filing guidance. Because the complete one-line raw export is too large for the connector to return without truncation in this pass, the later legal portion could not be safely cleared message-by-message. The opening returned messages are physics/SAT discussion, demonstrating that title alone does not establish that every message is legal; nevertheless the legal title is sufficient for a conservative reversible viewer hold pending full local/message-level inspection.
- Action: added a `visibility: hidden` rule to `CONVERSATION_VIEWER/CURATION.json`.
- Commit: `042d438283e2d83ba3d572d0d820134e2b006158`
- Reversibility: remove this single curation rule to restore Viewer display.
- Source integrity: raw JSON unchanged.

## Exposure that remains

The curation rule suppresses the conversation from the generated public Conversation Viewer only. The raw source remains in the public GitHub repository and therefore remains directly accessible through repository history/raw-file access. Viewer curation is not source-level privacy.

The structural/date manifests and tag/index surfaces may also retain metadata such as title/path/ID. This pass did not erase those metadata because doing so would not remove the public raw source and could create misleading provenance/index gaps. A future privacy-hold registry should instead let derived public surfaces mark/suppress sensitive metadata consistently while preserving a private/admin audit trail.

## Other findings

- Current Viewer curation supports whole-conversation hiding, message-range omission, and selected-range publication without modifying raw exports. This is suitable as an immediate reversible soft-hide layer.
- The archive-wide autotag run completed successfully enough to produce `indexes/autotag/CONVERSATION_TAG_INDEX.md`: 408 JSON files scanned, 388 conversation exports recognized, 0 parse errors, and 0 structural-index gap candidates in that run.
- The current broad `LAW-LEGAL` autotag is **not sufficiently discriminating for privacy review**: it appears on 335/388 recognized conversations, so it should not be treated as evidence that those conversations contain legally sensitive personal material. Legal-privacy detection needs a narrower dedicated classifier/pattern family and manual review.
- Repository code search for individual terms such as `attorney`, `legal`, and `drug test` returned no indexed code matches; this cannot safely be interpreted as absence because large raw conversation JSON files are not reliably searchable through GitHub code search.
- Title/inventory searches found one explicit legal-title conversation: `Court Filing Guidance`. No additional conversation titles containing `Legal`, `Attorney`, `Police`, `Arrest`, `Charge`, `Hearing`, or `FOIA` were surfaced in the generated viewer inventory during this pass.

## Unresolved / Nathan decision

1. **Source-level handling of `Court Filing Guidance`:** if full inspection confirms personal case material, moving the source out of the public repository (while preserving a neutral provenance placeholder) is materially stronger than Viewer hiding. Ordinary deletion from current `main` would not by itself purge Git history.
2. **Need full content inspection:** the GitHub connector truncates the very large one-line raw JSON before the legal portion can be reliably reviewed. A local/materialized full-file scan or dedicated Actions privacy scanner is needed to classify exact message IDs/ranges.
3. **Privacy-hold registry:** feasible and recommended. One admin registry should drive Viewer curation plus suppression/redaction of sensitive material from derived tag/search/index presentation, while leaving raw provenance untouched until Nathan decides source-level disposition.

## Recommended next infrastructure step

Add a dedicated `PRIVACY_HOLDS.json` admin registry with selectors by conversation ID/path/message ID/range and fields for risk class, severity, temporary/permanent status, reason, reviewer, and date. Modify Viewer/tag/search builders to consume it before publishing derived surfaces. Add a narrowly scoped legal/privacy scanner that flags, but never auto-deletes, candidate messages for manual review. Keep the registry's public-facing output minimal so the hold itself does not disclose the sensitive fact it is protecting.

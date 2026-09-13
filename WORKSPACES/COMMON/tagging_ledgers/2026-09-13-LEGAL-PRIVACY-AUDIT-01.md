# Legal privacy audit — 2026-09-13 — pass 01

## Scope and standard

Purpose: identify public corpus material whose exposure creates a meaningful legal/privacy risk, distinct from material that is merely personal. This pass checked current Viewer curation machinery, generated conversation inventory, development date manifest, repository code search for legal-risk terms, and the newly generated archive-wide autotag surface.

High-risk categories used: personal legal strategy; charges/allegations; attorney communications/work product or potentially privileged material; identifying details about third parties; private contact/account information; evidentiary details whose publication could prejudice a matter; court-filing strategy or similarly sensitive procedural material.

## Action taken

### `Court Filing Guidance` — WITHDRAWN FROM CURRENT PUBLIC CORPUS / ON HOLD

- Viewer ID: `cdbff638fc7e`
- Raw conversation ID: `694edd64-bae0-832f-a6ff-078e11f09cd1`
- Former source path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_6/25.12.29•25.12.30•Court Filing Guidance — raw.json`
- Date range: 2025-12-29 12:34 EST through 2025-12-30 07:32 EST
- Viewer inventory message count: 78
- Initial risk basis: durable title explicitly identifies court-filing guidance; complete content could not be safely cleared message-by-message through the connector because the large raw export was truncated. Returned opening messages were substantive physics/SAT discussion, establishing mixed-content potential.
- Initial reversible action: added `visibility: hidden` rule to `CONVERSATION_VIEWER/CURATION.json`, commit `042d438283e2d83ba3d572d0d820134e2b006158`.
- Nathan then issued a case-specific directive on 2026-09-13 to delete this raw file from the current public repository rather than wait for verified transfer to the private repository. This is an explicit exception to the normal preserve-source-before-removal rule.
- Public raw file deleted from current `main`: commit `655db2d384867c43fc59c5047403f6feade5a88c`.
- Public provenance placeholder created at `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_6/25.12.29•25.12.30•Court Filing Guidance — ON HOLD.md`: commit `62aa18f7c4184b26a4d059424da0712fa49bf3fb`.
- Current status: **ON HOLD — source not present on current public branch**. Nathan may re-upload the original to private `Satobloc/HSH_RESOURCES` later. If recovered privately, SAT/H(s)H-relevant material can be boundary-mapped and reintroduced publicly as clearly labeled fragmentary/partial records, while legally sensitive portions remain private.
- Provenance note: ordinary deletion from `main` does not purge prior Git history. No history rewrite was performed.

## Current handling policy established during this audit

- Legally sensitive conversation with no SAT/H(s)H relevance: move whole source to private repository when practical.
- Mixed legal + SAT/H(s)H conversation: preserve the unaltered original privately when available; return clean SAT material publicly in fragmentary records; review genuinely intermixed crossover passages individually rather than manufacturing a falsely tidy development history.
- Privacy redaction should conceal legally/privacy-sensitive particulars, not erase scientifically or historically relevant provenance unnecessarily.
- For this one record only, Nathan authorized immediate public deletion before private re-upload because it is not expected to contain priority material and other archive uploads take precedence.

## Other findings

- Current Viewer curation supports whole-conversation hiding, message-range omission, and selected-range publication without modifying raw exports. This remains useful for reversible soft holds.
- The archive-wide autotag run produced `indexes/autotag/CONVERSATION_TAG_INDEX.md`: 408 JSON files scanned, 388 conversation exports recognized, 0 parse errors, and 0 structural-index gap candidates in that run.
- The broad `LAW-LEGAL` autotag is not sufficiently discriminating for privacy review: it appears on 335/388 recognized conversations. It should not be treated as evidence that those conversations contain legally sensitive personal material.
- Repository code search for terms such as `attorney`, `legal`, and `drug test` returned no indexed code matches; this cannot safely be interpreted as absence because large raw conversation JSON files are not reliably searchable through GitHub code search.
- Title/inventory searches surfaced one explicit legal-title conversation in this pass: `Court Filing Guidance`. No additional conversation titles containing `Legal`, `Attorney`, `Police`, `Arrest`, `Charge`, `Hearing`, or `FOIA` were surfaced in the generated Viewer inventory during the pass.

## Unresolved / future work

1. If the withdrawn original is later uploaded to private `HSH_RESOURCES`, run dedicated SAT/H(s)H terminology tagging plus legal/privacy tagging, map exact message/range boundaries, and classify clean SAT, clean legal, and crossover segments.
2. Re-import any clean SAT/H(s)H segments promptly into the public Viewer as explicitly fragmentary/partial records with preserved source provenance.
3. Consider a dedicated `PRIVACY_HOLDS.json` admin registry with selectors by conversation ID/path/message ID/range and fields for risk class, severity, status, reason, reviewer, and date. Viewer/tag/search builders can consume it before publishing derived surfaces.
4. A narrowly scoped legal/privacy scanner remains preferable to the broad general-purpose `LAW-LEGAL` topic tag.

# Work Quantum & Large Source Feeder Standard

**Status:** ACTIVE project standard  
**Lane:** admin/workflow + methods/resources  
**Authority:** Nathan Direct, 2026-09-16  
**Scope:** recurring workers and large permitted source documents across HsH, GLASS, DEVELOPMENT_FULL_CONVOS, and permitted RESOURCES. PRIOR_ART remains excluded from ordinary feeder access.

This standard controls work size and source-feeding mechanics. It does not define theory truth or confer authority on source material.

## 1. Standard work quantum

Default recurrence bite:

> **one object + one operation + one durable result + one next cursor**

Normal ceiling:
- 1 primary target;
- about 3 supporting files maximum;
- at most 1 semantic write;
- one checkpointed stopping boundary.

If work requires a second independent diagnosis, another substantial target, unrelated source regions, or a second conceptual decision, stop and make that the next bite.

For hot/shared surfaces — BEDROCK, STATE OF THE THEORY, README/front doors, central control/coordination files, generated interfaces — use a micro-bite: **one proposition, pointer, visibility defect, status transition, or tested change per recurrence**. Do not perform opportunistic cleanup merely because the file is open.

## 2. Standard Working Document Unit

These sizes govern worker-produced working artifacts, not historical/source documents.

| Class | Default size | Typical use |
|---|---:|---|
| Micro | 150–500 words | checkpoint, handoff, status card, proposition record, focused correction |
| Standard | 800–1,500 words | theory note, audit, comparison, reconstruction packet, workflow note |
| Extended | 1,500–3,000 words | deliberately larger coherent treatment that would be damaged by splitting |
| Document set | >~3,000 words | linked/numbered Standard units plus short index/overview |

Do not pad short work to meet a class. Extended size is a deliberate exception, not permission for scope drift. A normal recurrence should produce or materially modify no more than one Standard Working Document Unit. Hot/shared semantic files remain governed by the micro-bite rule regardless of total file length.

## 3. Large sources are exempt from output-size limits

GLASS documents, full conversation exports, DEVELOPMENT_FULL_CONVOS, long transcripts, large extracted text, PDFs, notebooks, and other legitimate large sources may be arbitrarily larger than a Standard Working Document Unit.

The document quantum limits **worker output**, not **source access**.

Large sources should normally be consumed through a feeder that preserves source identity while presenting bounded reading packets:

**immutable source → feeder manifest → standard reading packets → worker bite → durable result + next packet cursor**

Feeding/chunking does not create new epistemic sources. Every packet remains a view of its original source.

## 4. Large Document Feeder contract

A compliant feeder must:

1. **Never modify the source.** It is read-only with respect to source artifacts.
2. Record source identity using repository/path when available plus a content hash.
3. Produce stable source-relative packet IDs.
4. Preserve exact source ranges sufficient to recover context: line, message/turn, page, paragraph, or equivalent structural range where available.
5. Prefer semantic boundaries over blind word slicing:
   - conversations → complete message/turn boundaries;
   - Markdown/text documents → headings/paragraphs;
   - structured JSON → logical records/messages when recognized;
   - page-aware extractions → page boundaries where useful;
   - fallback → paragraph/line-aware text chunks.
6. Target roughly **1,000–1,500 words of readable content per packet** by default.
7. Permit a modest configurable overlap where boundary context matters; overlap must be declared in the manifest and must not obscure the packet's unique source range.
8. Emit a machine-readable manifest with packet order, IDs, source ranges, word/character counts, hashes, and source provenance.
9. Support deterministic resume via packet ID/index — conceptually `next`, `previous`, or explicit packet selection.
10. Keep derived feeder outputs separate from source trees and label them derived/generated.
11. Preserve quarantine boundaries before opening or hashing content. Ordinary feeder runs do **not** descend into PRIOR_ART.
12. Follow `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` for cross-repo reads, output publication, manifests, concurrency, and fresh-base writes.

## 5. Packet identity

Recommended packet ID:

`<source-short-hash>:p000001`

A packet manifest entry should minimally contain:

- `packet_id`
- `packet_index`
- `source_path`
- `source_sha256`
- `source_start`
- `source_end`
- `word_count`
- `character_count`
- `packet_sha256`
- `previous_packet_id`
- `next_packet_id`

When a parser can preserve stronger structural identity, add fields such as message IDs, role/author, timestamps, page numbers, headings, or JSON record indices without replacing the basic source-range identity.

## 6. Conversation handling

For recognized ChatGPT/full-conversation JSON, packetization should preserve complete messages whenever practical. A single oversized message may exceed the target packet size rather than being silently damaged; if it must be subdivided, subdivisions must retain the parent message identity and explicit subrange information.

Do not flatten speaker identity, timestamps, conversation IDs, message IDs, or ordering when those fields exist. Feeder packets are reading views, not normalized replacements for the archive.

## 7. Source changes

A changed source hash creates a new feeder source identity. Do not silently reuse an old manifest as though it described the changed source.

Stable packet numbering is guaranteed only within a particular source hash. Cross-version correspondence may be computed separately, but is not assumed.

## 8. Worker use

A normal source-reading recurrence should consume only as many feeder packets as fit the standard bite. Reading three adjacent packets from one source may count as the supporting-source allowance rather than three separate source documents when they form one bounded source region.

The worker records the last consumed packet and one next cursor. It should not continue through a giant source merely because packets remain.

## 9. Acceptance test

A feeder implementation is acceptable when, from its manifest alone, another worker can determine:

- exactly which source/version was read;
- exactly which packet/range was consumed;
- how to retrieve the adjacent packet;
- whether overlap exists;
- whether any structural parser was used;
- whether source material was altered (required answer: no);
- where derived outputs live;
- what quarantine exclusions applied.

## 10. Relationship to other controls

`AUTOMATION_WORKFLOW_CONTROL.md` remains the general recurring-worker control surface. This document is the focused standard for work/document quantum and large-source feeding. `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` controls execution safety. BEDROCK controls theory-premise authority. None of these roles should be collapsed into one another.

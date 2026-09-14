# Verified batch — Russia's Nuclear Arsenal Maintenance — 07

**Conversation ID:** `67d078fd-7ff0-8003-a6a5-da87b26a2f60`  
**Coverage:** 2025-03-12 01:16:47–01:42:22 EDT  
**Verified Nathan/user messages:** 11 unique logical messages

## Verification basis

Directly inspected:
- raw conversation blob for `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_3/25.03.11•25.03.14•Russia's Nuclear Arsenal Maintenance — raw.json`
- durable Nathan Direct 2025 substrate `indexes/nathan-direct/nathan-direct-2025.jsonl`

Nathan Direct identifies every covered record as:
- `record_type = NATHAN_DIRECT_RAW_USER_MESSAGE`
- `authorship = RAW USER MESSAGE`
- `author_role = user`
- conversation ID `67d078fd-7ff0-8003-a6a5-da87b26a2f60`
- `archive_copy_count = 2`

The package retains both archive paths and their source hashes; duplicate representations are counted once per `(conversation_id, message_id)`.

## Verified message IDs

- `e9708027-02c6-4418-9e9e-0fb4464bcc1c`
- `92c81087-d2cd-4a70-a8d7-7f693e60c626`
- `3b7b32a8-d91f-4615-bba6-dbd312520c1e`
- `bbd4a71e-585d-43ea-bac1-2f82e4116b17`
- `33ec3f8f-f83d-4982-8a5b-1c7fb4f4fd30`
- `f8a28c7e-7256-4e15-ba15-13fa6647106c`
- `4831bbd3-917d-4a86-a97d-4a7762f43590`
- `edf1d558-7cd6-45fe-8688-3808eea6051e`
- `899de6a2-f80c-48f7-9143-c31f0b42fb5d`
- `a412e1d6-4d06-4860-a52d-59c63522e415`
- `1361b10a-7932-454b-bf85-7005e7549db3`

## Structural notes

- `bbd4a71e...` retains multiple assistant child pointers; this is preserved as branch/regeneration structure rather than flattened.
- `f8a28c7e...` includes copied UI/network-error wording inside a Nathan/user node. The enclosing raw message is Nathan-authored by role; the embedded UI text is explicitly provenance-bounded.
- `1361b10a...` sits in a branch where raw-parent and chronological-adjacency context differ. Both pointers are retained; no attempt is made to harmonize them.
- Assistant nodes exposed while recovering graph structure remain context-only and are not counted as Nathan content.

No redaction/suppression instruction was encountered. No destructive tag/status change was made.
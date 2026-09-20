# Nathan Direct — unsorted tagged substrate

Generated from raw ChatGPT conversation metadata plus the archive-wide layered autotag stream. This surface preserves exact `role=user` text, provenance, accumulated machine tags, duplicate-path relationships, chronological neighboring-message pointers, and raw parent/child branch pointers. It is not a curated quote collection and carries no automatic theory authority.

- input records: 84865
- input user records: 25728
- packaged unique user messages: 15479
- archive duplicate user records collapsed: 10249
- context dependent inherited tag records: 14789
- records missing conversation or message id: 0
- records with resolved parent graph pointer: 14789
- records with child graph pointer: 10056

## Shards

- `nathan-direct-2023.jsonl` — 293 records
- `nathan-direct-2024.jsonl` — 306 records
- `nathan-direct-2025.jsonl` — 5467 records
- `nathan-direct-2026.jsonl` — 9413 records

## Lookup

- `nathan-direct-lookup.jsonl` — one compact locator per packaged message. Use `(conversation_id, message_id)` as the stable key and `shard` + `record_ordinal_1based` as the target; `canonical_source_path` and `all_source_paths` support source-path alias lookup without duplicating message text.

`context_dependent_inherited_tag=true` means at least one adjacency topic tag is not directly present among the message-level topic tags. Use the raw chronological, parent/child, and full-conversation pointers for contextual recovery; do not merge assistant text into Nathan wording.

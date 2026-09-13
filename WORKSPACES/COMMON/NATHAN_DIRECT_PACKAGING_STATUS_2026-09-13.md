# Nathan Direct packaging status — 2026-09-13

**Lane:** Nathan Direct / corpus-first provenance infrastructure
**Theory authority:** none; archive/provenance infrastructure only

## Verified state

The archive-wide layered autotag workflow successfully completed extraction, Nathan Direct packaging, and validation in run `34765354003`, but its final push to `main` failed because another legitimate worker committed during the long corpus run. The generated Nathan Direct package itself validated successfully before that publish race.

Verified run-4 package statistics:

- input records: 69,927
- input raw `role=user` records: 21,451
- unique `(conversation_id, message_id)` Nathan Direct records packaged: 14,306
- duplicate archive user-record copies collapsed: 7,145
- context-dependent / inherited-tag records: 14,269
- records missing conversation or message ID: 0
- year shards: 2023 = 293; 2024 = 306; 2025 = 4,801; 2026 = 8,906

Those figures describe that specific workflow checkout/run and should not be treated as timeless corpus totals; concurrent repository changes can alter later scans.

## Publish-race fix

`.github/workflows/layered-nathan-autotag.yml` was updated in commit `c14973fc900355c77a97be40edefccbd62a21705` so generated-output publication now:

1. commits locally after validation;
2. fetches newest `main`;
3. rebases the generated-output commit non-destructively;
4. retries an ordinary push race up to four times;
5. aborts rather than guessing if a real rebase conflict occurs;
6. never force-pushes;
7. uploads the generated artifact even when a later step fails (`if: always()`).

Fresh workflow run `34766611617` was triggered by that fix. At the last verified check it was still processing the archive-wide autotag step; no claim is made here that its outputs have yet landed on `main`.

## Next gate

When the fresh run completes, verify on `main` before downstream use:

- `indexes/nathan-direct/MANIFEST.json`
- `indexes/nathan-direct/README.md`
- nonempty `nathan-direct-*.jsonl` shards
- actual fresh-run counts and missing-ID count
- a bounded sample of exact Nathan text, duplicate-path relationships, neighboring-message pointers, and inherited-context metadata

Only after those checks should Stage-2 winnowing, earliest-use searches, correction mapping, and contextual recovery treat the durable Nathan Direct shards as ready substrate.

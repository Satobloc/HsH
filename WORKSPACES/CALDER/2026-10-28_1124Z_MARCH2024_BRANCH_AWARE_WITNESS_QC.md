# Calder | March 2024 raw graph vs screenshot derivative: branch-aware source QC
2026-10-28 11:24 UTC | SOURCE-CRITICAL / NOT PHYSICAL VALIDATION

## Sources actually inspected
- Raw original DIMENSIONAL GRAVITY conversation, HsH Git blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`, JSON 919,928 characters and 466 mapping nodes.
- Historical screenshot-derived transcription, SAT_THEORY_ARCHIVE_2023-25 Git blob `339fddec01b717bedffed770f1b73f8bab103fb5`, 212,651 characters. Its March 23 label is not an authenticated capture timestamp.
- Prior Aldus original-vs-derivative audit: issue #887, report blob `6430998d95331b7b3d57a3f5251c72d30cc57a8e`. This work extends, rather than repeats, that audit.
- Current BEDROCK `4cabda482c48c217614b868a2138409275df9bf7`, Steering Charter `b9b8de55f8d5add7c42cf80be7c34677ee36305e`, Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`, revival V3 `90863a2a2b82b2d8e37ba1bd9f796389066f5409`, Calder wake packet `2bde54b13b2ee0f1563232edb0a85f63ae77823f`, incoming Aldus 11:12 handoff `76e08f60733f002c65ea779c1699c12a9b73aab2`.
- Mersearch three-root execution NOT RUN; bounded GitHub original-blob reads, not exhaustive archive discovery. Private resource corpus not exposed.

## Executed JavaScript source replay
1. Parse original `mapping`, traverse `current_node -> parent` to build a 456-node selected ancestry including tool and structural nodes.
2. Select March 2024 `role=assistant, recipient=all` nodes, ordered by `create_time`; separately select user nodes.
3. Segment screenshot-derived text at line-boundary `You said:` and `ChatGPT said:`. Strip leading UI `Updated saved memory`, normalize whitespace; perform same-position comparison, then remove Markdown list markers and emphasis syntax while retaining digits for stricter alphanumeric-token comparison.
4. Independently check branch leaves, parent types, sibling alternatives, and active-path membership. No invented test data or physical calculations.

### Actual source counts
| Comparison | Count |
|---|---:|
| Raw March assistant-to-all nodes | 135 |
| Active ancestry assistant-to-all nodes | 131 |
| Off-active-path assistant leaf nodes | 4 |
| Screenshot assistant segments | 131 |
| Active assistant positions exactly equal after whitespace/UI normalization | 97 |
| Additional alphabetic-token matches ignoring formatting | 33 |
| Active assistant alphanumeric-token matches preserving digits | **129/131** |
| Active assistant positions with numeric insertion in derivative | **1/131** |
| Active assistant positions with appended derivative UI footer | **1/131** |
| Active assistant ordinal alignments without explained match | **0/131** |
| Screenshot user segments / active user turns | 131 / 131 |
| User whitespace-exact | 130 |
| User raw trailing-backtick-only difference | 1 |

The 33 alphabetic-token matches should NOT all be called formatting-only. A stricter numeric-preserving pass finds a derivative insertion `intertwining748` where the original has `intertwining` plus a space, active assistant ordinal 40 (zero-based), UUID `245ebfab-750f-44b1-b43d-8747f049d531`. The cause (OCR, manual transcription or export) is UNKNOWN. It is not a physics number and must not be silently copied into equations.

The last assistant ordinal 130, UUID `a3295727-6ce7-4255-a247-f3b9e4546c54`, is a prefix match with appended screenshot footer (`No file chosen` and generic interface text). Both exceptions are derivative presentation/extraction artifacts, not evidence of different physical statements. The user exception is UUID `aaa2570f-a98d-46ab-861d-5ef38c741f53`, one raw trailing backtick missing in derivative.

The four off-path leaves: `4db77601-5f7c-4db0-ad28-542596bcded3`, `b2341368-43c7-469f-a1ed-f25932db5f7c`, `4089ad6a-7099-4946-8c36-77eb3e6303b7`, `4b4cc06a-a3a6-423e-be16-c752c60b9231`. Three are childless assistant nodes of tool parents, one is childless under a user parent with an explicit selected assistant sibling. Do not generalize all four as sibling regenerations or missing screenshot replies.

## Interpretation and mathematical proof boundary
The screenshot-derived linear conversation is a projection of one selected ancestry through a branched raw graph plus interface formatting. The 135 raw assistant nodes and 131 rendered assistant segments measure different populations. The source-backed result is full ordered alignment of the 131 selected-path assistant segments and all 131 user segments, subject to the documented digit insertion, footer and backtick. This does not prove original screenshot capture date, full UI pixel fidelity, or historical model correctness.

Existing Calder draft PR #707 was reused for two new interconnected Lean modules: `CalderWitnessAlignment.lean` and `CalderWitnessGraph.lean`. Nine conditional theorem targets concern arithmetic partitions and path membership; CI #40679491610 was started and remains pending at this document's creation. Lean cannot verify the parser, source authenticity or scientific claims.

## Publication, controls and next cursor
- Public-safe full report via existing publisher issue #888, verified file SHA-256 `318c448002eece6fd063a51dd4393f0c32fd79f80a26041f0d90c7548cedfee5`, blob `e83db2e9f7d19e4b7389846cb232fa4bd2a4dd2d`; **issue comment #6467735408 is the mandatory stricter numeric-preserving correction to that original staged report**.
- P3 manuscript docket #566 comment #6467721418 posted and independently read back before the stricter numeric correction; update with corrected counts before any manuscript quotation.
- Deliberate unrelated reading: TheTANGLE source blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 681-720; discussion of editorial intrusion and the limits of extracting institutional history from fragments. Next cursor line 721. No FIE 14-day reread due after Oct 27.
- Next: independently run the same alignment with an offline source checkout and strict alphanumeric diff, audit numeric insertion provenance, and confirm Lean CI theorem/axiom logs. Do not count branch alternatives as independent historical witnesses. No physical H(s)H prediction or CODATA score.

No task/schedule mutation, no new automation, no signet/chat rename, no BEDROCK promotion, no claim of historical Calder chat participation or cross-thread delivery.

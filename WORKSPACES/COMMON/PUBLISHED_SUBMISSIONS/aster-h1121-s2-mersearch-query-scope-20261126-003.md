# Workshop Relay | h1121:s2 | Aster
**Correction note:** Submission 001 was published with truncated source metadata and is superseded. Submission 002 was rejected by the publisher's SHA-256 validator. This submission 003 is the corrected, expanded source-custody record; its digest is computed from the exact content string read back from the current issue body.

**Disposition:** SOURCE_TUPLE_REVALIDATED · MERSEARCH_QUERY_SCOPE_COUNTEREXAMPLE · P0_DISCOVERY_CURRENT_AT_SOURCE_CUT · PRESENTATION_SAFETY_FAIL

**Correction note:** This is the corrected publication payload for issue #2622. It supersedes the initial draft submission ID `aster-h1121-s2-mersearch-query-scope-20261126-001`, whose raw-source SHA-256 and discovery source-commit fields were accidentally truncated in the draft text. If the initial artifact is published, it must be treated as superseded; this corrected artifact is the canonical record.

## 1. Source tuple revalidation

The Aster raw conversation was fetched once by exact Git blob and all tuple fields were derived from those same UTF-8 bytes.

- Repository: `Satobloc/HsH`
- Path: `DEVELOPMENT_FULL_CONVOS/CONVOS_23/26.09.20•26.10.17•ASTER — raw.json`
- Git blob SHA-1: `1bf6e65c4ac1650297acb67d7e39f700454a03c8`
- Embedded conversation ID: `6ab006ce-e358-83ea-b3dd-7b23a26c00fa`
- UTF-8 byte length: **15,022,092**
- Raw SHA-256: `c28feab87facfbc24de9a97b010ef57126503c960cafd4a2793c1e8903af274d`

The raw SHA-256 and byte length independently reproduce the prior correction recorded at [Aster source-tuple comment #7188811605](https://github.com/Satobloc/HsH/issues/2591#issuecomment-7188811605).

Structural audit of the same payload:

| Measure | Result |
|---|---:|
| Mapping entries | 1,818 |
| Message-bearing nodes | 1,817 |
| Outer user-role messages | 39 |
| User-role messages on current ancestry | 39 |
| Roots / leaves / branch nodes | 1 / 1 / 0 |
| Cycles | 0 |
| Missing parent nodes | 0 |
| Nonreciprocal edges | 0 |

This is source-object integrity and graph-structure verification. It does not authenticate a live ChatGPT thread, establish authorship of every sentence in a user-role message, or validate any mathematical claim.

## 2. Mersearch query-scope finding

The existing Lane 2 request `aldus-h1118-s2-geometry-source-20261126t1424z-001` has a request-specific manifest and compact receipt, associated with Actions run [#45840053864](https://github.com/Satobloc/HsH/actions/runs/45840053864). No new Mersearch request was submitted because all four canonical lanes remain occupied.

The request query has this logical shape:

```
(author:user AND A) OR (path:(*SAT*O* OR *Blockwave*) AND B)
```

The second branch is not constrained by `author:user`. The compact receipt's selected sample is:

- Conversation: `SATNet and Neural Networks`
- Path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_4/26.06.01•26.06.03•SATNet and Neural Networks — raw.json`
- Git blob: `3723eee9dca839cf285e29ca90963d4fa1382513`
- Embedded conversation ID: `6a1df069-b5e0-83ea-a8ad-4076efcfd8f2`
- Sample message ID: `51716b1b-dd11-4f21-ada2-be14088eb827`
- Outer role: **tool**
- Speaker: **file_search**

The sample body contains `theta_4` and the `time normal` / `torsion` language. Its path matches `*SAT*O*` because `SAT_CONVOS_4` contains an `O` after `SAT`. It therefore satisfies the path/artifact branch without satisfying the direct-user-role condition.

The adjacent direct user message `f24acba6-2b14-4641-a8bb-cb8ea8d629e6` at 2026-06-01T20:52:29.753Z says “Ok. Read these please” and carries three attachments: `UI CONFIG.txt` (6,534 bytes), `UI_Procedure_SAT_4DHH_UC.pdf` (128,022 bytes), and `UI BUILDOUT.txt` (416,525 bytes).

A subsequent read of the SAT archive's current root index `..findex.txt` (blob `0991ad7a7aaf30817cb77c60dd36140d4e9ef900`, generated 2026-11-25T19:26:12.703284Z) located matching archive copies:

| User-supplied attachment | Archive candidate | Candidate blob | Size |
|---|---|---|---:|
| `UI BUILDOUT.txt` | `2026/SAT CORE — UI BUILDOUT.txt` | `13e0c7e6fa08e5e51cfaeb66aefe8e92317ea931` | 416,525 bytes |
| `UI CONFIG.txt` | `2026/SAT CORE — UI CONFIG.txt` | `6817caf68943593f31d72d51798e0ba4589624a4` | 6,534 bytes |
| `UI_Procedure_SAT_4DHH_UC.pdf` | `2026/SAT CORE — UI_Procedure_SAT_4DHH_UC.pdf` | `0b3cd9a80f1cb9d94f7ccfc4903b023f91e5c4ba` | 128,022 bytes |

The same BUILDOUT and CONFIG blobs occur under `[[SAT26 TOOLBOX]]`, `SAT 2026 PRE HsH`, and other archive paths. The same PROCEDURE PDF blob occurs under `[[SAT26 TOOLBOX]]` and `SAT 2026 PRE HsH`. These are duplicate paths to matching content, not independent witnesses. Other similarly named PDFs (`UI-SAT` and `UI_SAT`) have different blob IDs despite the same size and were not substituted.

The raw conversation's file-search tool outputs are adjacent to the user attachment message: CONFIG result `d6b3ebac-2dd5-4d7a-b170-0b440f2311b2`, PROCEDURE PDF extraction `b00aa498-560e-42dc-b318-43884b8bb6a1`, and BUILDOUT extraction `51716b1b-dd11-4f21-ada2-be14088eb827`. The CONFIG extraction, after its citation line, exactly equals the 6,526-character archive file. The BUILDOUT extraction matches multiple first/middle text segments but is truncated to 180,173 characters against the 404,888-character archive file. The PDF extraction is a three-page text rendering with the matching procedure title. GitHub's text endpoint rejects the PDF as binary, so its raw bytes were not independently hashed here.

This resolves the archive-copy locator and strongly links the three user-supplied attachments to those archive copies by exact byte size and available text extraction. It does **not** supply original attachment SHA-256 values, so byte-for-byte identity against the original uploaded payload is not formally proven. The documents' embedded authorship remains unresolved. The BUILDOUT is a composite conversational transcript containing both user and assistant turns; its file-search tool extraction is not itself a direct user-role message. Preserve it as a user-supplied attachment with unresolved embedded authorship, not as blanket Nathan Direct authority.

The searcher source at branch `mersearch-stable-1.0`, blob `af6fa8bdf6ef57ca87d8cd4efe6353d8d95349a8`, maps `author` to `speaker or role`, maps `role` to the exact outer role, and evaluates OR per record. The observed result is consistent with the query and implementation. This is a **query-scope defect**, not evidence of a broken search engine.

The Boolean counterexample is immediate. Let (U) mean “outer role is user”, (P) mean “path branch matches”, and (B) mean “path-branch body condition matches”. For:

[
Q=(Uland A)lor(Pland B)
]

the assignment (U=0, P=1, B=1) gives (Q=1) while (U=0). Thus (Q
otRightarrow U). This is a concrete logical counterexample, not a Lean compilation or a physical calculation.

Recommended future retrieval, when a lane is released:

1. Run a direct-source query with a global `role:user AND (...)` constraint.
2. Run attachment/path discovery separately, without claiming outer user-role attribution.
3. Join the results only through explicit conversation ID, message ID and attachment ID.
4. Preserve attachment authorship as unresolved unless the attachment itself supplies attributable evidence.

No Lean build was run: the runtime has no local `lean`, `lake` or `elan`, and no existing PR is an appropriate place to modify for this small query-logic check. No new tool, dependency or PR was created.

## 3. P0 discovery currentness

The automatic discovery refresh [Actions #45859456977](https://github.com/Satobloc/HsH/actions/runs/45859456977) completed successfully and generated discovery blob `eff7f68422cf464c0a7cb49d87dfebf849b008d2`.

- Generated: 2026-11-26T16:54:26Z
- Embedded HsH source cut: `378db1e46c96376b1a74f42d0e60360ded481592`
- Embedded SAT archive source: `2b6f18d515e5bbdd3b1276cb62c6f4c10f76b19e`
- Generated commit / then-current main: `4de11962f570baca2987f43e4cba1c5e67ec00a8`
- Source cut comparison: generated commit was one commit ahead, with the discovery JSON as the generated delta.

Snapshot counts: 18,052 documents; 11,120 workspace records; 11,120 missing `presentation_state`; 11,120 generic browse-reader routes; 48 docket entries; 577 visuals; 417 square visuals; 6 extraction errors.

**Currentness:** PASS at the 16:54:26Z source cut. **Presentation safety:** FAIL. Paper A/B live visitor-route acceptance remains NOT_OBSERVED; deployment remains NOT_VERIFIED. This snapshot predates the present run's receipt/handoff writes, so a new postwrite refresh is required before claiming currentness at the later main head.

## 4. Boundaries and next cursor

- No physical system was admitted; no CODATA comparison, fit, independent prediction or uncertainty propagation was performed.
- No SAT-O or Blockwave equation was changed.
- No BEDROCK theory status was changed or promoted.
- No Mersearch lane was overwritten, released or retried.
- No scheduler identity, phase, cadence or task state was changed.

**Next cursor:** separate direct user-role retrieval from attachment/path retrieval when a Mersearch lane is released; preserve the source tuple guard and keep the P0 presentation-safety failure with its existing owners.

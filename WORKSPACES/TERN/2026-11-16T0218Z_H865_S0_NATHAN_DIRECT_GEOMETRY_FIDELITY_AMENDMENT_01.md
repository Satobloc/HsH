# Amendment 01 | Tern h865:s0 Nathan Direct geometry-fidelity report

**Observed:** 2026-11-16T02:18Z  
**Parent report:** WORKSPACES/TERN/2026-11-16T0212Z_H865_S0_NATHAN_DIRECT_GEOMETRY_FIDELITY.md  
**Publisher issue:** https://github.com/Satobloc/HsH/issues/1817  
**Class:** ADDITIVE_CHECKSUM_AND_LINEAGE_CORRECTION / NO_DUPLICATE_ISSUE

## 1. SAT4D live-draft checksum correction

The published report listed SHA-256 874213320adf87d69f59ca9acd6d34c7447ab2b62c71d1945edbf0d5604cb69b for SAT4D_LIVE_DRAFT.txt. That value is incorrect.

Independent UTF-8 SHA-256 recomputation from both current SAT archive paths gives:

- Path: SATOBLOC/SAT4D_LIVE_DRAFT.txt
- Path: SAT_O REWRITE/SAT 4D/SAT4D_LIVE_DRAFT.txt
- Both paths have the same Git blob: 2a79fe25018cce7e99a2c33786d88b0551db6ae7
- Both texts are identical at 114,901 characters; the shared Git blob establishes identical stored bytes.
- Correct SHA-256: c3f90cdeda667f20c7ab9ab33eea2e23c5245d94c1e4f99f3aec5e3e7f1f6cb7

The SAT-O1 standalone SHA-256 was independently recomputed and matches 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937. The September 16 Blockwave clean-action SHA-256 was independently recomputed and matches 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664.

## 2. Cross-report lineage correction

The separately published Tern h865:s0 June 2025 supplement, [issue #1816](https://github.com/Satobloc/HsH/issues/1816), adds primary June 6-7 direct messages and the September 12 collaborative Blockwave Theory.txt artifact.

It establishes additional context not included in the h865:s0 October/November direct-source extension:

- The June 6-7 direct source requested three separate alternatives, separate projections, and model-specific theta4 definitions. It did not select one model.
- The unbylined SAT-O1 file closely tracks assistant draft 917cf9f8-2bbf-4f64-a0bd-0646efe8ab02. It is not an independent witness confirming the assistant's mathematical assertions.
- The September 12 collaborative Blockwave Theory.txt artifact is distinct from the September 16 Blockwave clean-action attachment. Neither should be collapsed into the other.
- The September 16 attachment remains user-supplied but assistant-voiced, with exact embedded author/instance unresolved.

Issue #1816 is complementary source work, not a duplicate of #1817. The h865:s0 #1817 report remains the October 20/21, October 29, and November 8 direct-geometry extension.

## 3. Reading cursor reconciliation

The Babbage passage, Project Gutenberg #1216, lines 213-252, was a completed lateral reading break during this execution. The current Tern CURRENT_WORK now records a separate canonical unrelated-reading cursor: Arthur Conan Doyle, "The Adventure of the Blue Carbuncle", Project Gutenberg #1661, lines 2192-2234, next line 2235. Preserve 2235 as the current Tern cursor; do not replace it with the Babbage cursor.

## 4. Scheduler observation reconciliation

The h865:s0 run ID remains d2a4f7a1-2d58-8331-afa4-c929fe5bf55e. Three source records now show:

- Earlier failure observation: started_at 01:27:29.538557Z.
- A later Tern CURRENT_WORK record: started_at 01:27:29.691958Z.
- Subsequent exact-ID peek: IN_PROGRESS, started_at 01:57:22.868799Z, completed_at null, chat_ref null.

The two pre-01:52 start values differ by 153.401 milliseconds. They remain conflicting observations; neither is silently selected as canonical. The later IN_PROGRESS state does not establish a retry, restart, duplicate process, or cause.

## 5. Publication and preservation

The original #1817 publisher result remains:

- Canonical artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/tern-h865-s0-nathan-direct-geometry-fidelity-20261116t0212z-001.md
- SHA-256: 290884280d2d6a8a86f3382019fce0bc0f97f90db5d2b8f1c6d7edc3d39a4b7
- Workspace and canonical artifact content: exact match at readback.
- Canonical Git blob: fea67c9382c3e1baf4d3a9c2d2c7a5c4b0c0e4b0.

This amendment does not alter the published report, its content hash, or the canonical artifact. It does not create a new issue. No task, schedule, phase, cadence, ID, or enabled-state change; no sixth task; no theory promotion; no CODATA; no physical calculation; no new Lean run.

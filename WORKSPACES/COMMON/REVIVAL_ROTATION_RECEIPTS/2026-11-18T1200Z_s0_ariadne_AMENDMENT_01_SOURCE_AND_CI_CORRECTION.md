# Amendment 01 — historical raw-source and CI checkout correction

**Amendment observed:** 2026-11-22T18:36Z  
**Scope:** correct source identity and verification labels while preserving the original published report and receipt.

## Historical Ariadne export identity

The h924 receipt/report identified the HsH repository copy `df9c7a1fbddaa523f0b69cced8d761433490a454` as the complete Ariadne raw export and counted eight user-role messages. A separate Library raw export was recovered and parsed directly:

- Library file: `ARIADNE — raw.json`
- SHA-256: `2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8`
- Size: 6,226,127 bytes
- Conversation ID: `6ab339d2-8fb4-83ea-b728-c8001a034371`
- Mapping nodes: 1,364
- Direct user-role messages: 10

The HsH repository copy is a **distinct smaller export** (1,322 mapping nodes / 8 user-role messages); it is not byte-identical to the Library copy. The h924 report's description of the repository copy as the complete raw export and its eight-message count as the full historical source count are superseded. The historical role remains reconstructed from direct user-role material; no separately signed specialist charter or authenticated current Ariadne thread is established.

## PR #1938 verification-label correction

The original h924 report described Actions run #44212082170 as an exact-head run. The workflow `.github/workflows/lean-verification.yml` uses default checkout on `pull_request`, and the job log records source commit `9e2f2f82c2ec62f4b027bd009ba71577db1c04b3`, the merge reference, rather than PR head `43c1474584cc0a5dd5bdd34e6355b23e94302205`.

The changed module blob `64f624c83034e1aab0edac0caae523f269479220` and root aggregator blob `142712b8dbdb3db26aeade0d82484887587eb6b9` are byte-identical between PR head and merge reference. The existing formal source was compiled, but this is **MERGE_REFERENCE_BUILD_WITH_EXACT_CHANGED_SOURCE_IDENTITY**, not a standalone exact-head checkout. No theorem-specific or global axiom audit, physical validation, or source-translation proof is claimed.

## Publication status

Issue [#1973](https://github.com/Satobloc/HsH/issues/1973) is PUBLISHED_VERIFIED; publisher comment [#6979236873](https://github.com/Satobloc/HsH/issues/1973#issuecomment-6979236873) records the canonical artifact and digest. The issue intake payload and fetched canonical artifact are exactly equal (13,938 characters). Existing source-locator update comment [#6984017259](https://github.com/Satobloc/HsH/issues/1973#issuecomment-6984017259) remains valid and unchanged.

No raw source, historical proposition, or physical interpretation is promoted by this correction.

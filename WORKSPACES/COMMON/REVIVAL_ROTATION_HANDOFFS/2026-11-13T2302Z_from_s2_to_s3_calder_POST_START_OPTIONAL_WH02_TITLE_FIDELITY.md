# H814:s2 Aldus → Calder | WH-02 title-fidelity cross-read

**Status:** POST_START_OPTIONAL_CONTEXT / REPOSITORY_ONLY / NO_TASK / NO_REVIEW_REQUEST / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER.

Calder's h814:s3 run had already started before this packet was written. This is optional repository context, not pre-start thread context or authenticated delivery.

## One concrete PR #1710 finding

In the exact PR head `a967e908ceab048d219831ec799343643870daf3`, `tools/index_conversation_chronology.py` lines 28–41 strips the date prefix and known raw suffixes, then generically removes `Path(name).suffix`. For extensionless dotted titles this truncates meaningful title text:

- `23.01.02•26.01.01•H(s)H 2.0` → `H(s)H 2`
- `23.01.02•26.01.01•SAT-O v1.2` → `SAT-O v1`
- `23.01.02•26.01.01•Conversation with Dr. X` → `Conversation with Dr`

These are synthetic counterexamples, not confirmed existing repository filenames. The current root-chronology test checks source-path inclusion but not rendered-title fidelity.

Suggested repair: strip only known actual extensions or use explicit source-extension metadata; preserve unknown/extensionless dotted titles. Add a regression asserting the full rendered title. PR #1710 remains draft/open/unmerged; current metadata says `mergeable=false`, and PR CI is not verified. The current comparison reports diverged history (30 ahead / 7 behind); reconcile lineage before merge. Vercel's daily deployment limit is not a code-test result.

Full report: [Aldus h814:s2 WH-02 cross-read](../../ALDUS/2026-11-13T2302Z_H814_S2_WH02_TITLE_FIDELITY_AND_NOTEBOOKLM_INTAKE_CROSSREAD.md).

No code or PR change was made by Aldus. Calder retains ownership. No direct ChatGPT-thread delivery, consumption or acknowledgment is claimed.

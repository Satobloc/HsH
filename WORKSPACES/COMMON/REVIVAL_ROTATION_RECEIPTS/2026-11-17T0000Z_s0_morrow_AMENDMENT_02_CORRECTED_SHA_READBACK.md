# Morrow h888:s0 Amendment 02 | Corrected independent SHA verification

**Final publication status:** `PUBLISHED_VERIFIED`.

- Issue: [#1865](https://github.com/Satobloc/HsH/issues/1865).
- Submission: `morrow-h888-s0-lane00-source-custody-20261117t0000z-001`.
- Publisher comment: [#6933327250](https://github.com/Satobloc/HsH/issues/1865#issuecomment-6933327250).
- Publisher commit: `ee4c949567b1138d80e0dc5ccd1d4d2ff1052443`.
- Artifact and workspace report blob SHA-1: `cd54c2ff22f16efcfb68eec85908543694c0d007`.
- Exact UTF-8 length: `19361` bytes.
- Declared SHA-256: `0c482b7ff2ba911dce75625e74f79dd88592e828cd782f7ee2cfa06b0593f882`.
- Correct independent SHA-256: `0c482b7ff2ba911dce75625e74f79dd88592e828cd782f7ee2cfa06b0593f882`.
- Known-answer test: SHA-256(`abc`) = `ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad`, matching the standard expected digest.
- Issue-envelope content, workspace report, and published artifact are byte-identical: `true`.

**Correction to Amendment 01:** its `ed229e...` recomputation came from an incomplete local SHA-256 round-constant table and is invalid. It did not reveal an artifact mismatch. Do not use that value. This Amendment 02 supersedes Amendment 01 for checksum interpretation; the original report, issue payload, publisher artifact, and publisher comment were unchanged.

No retry, duplicate issue, manual artifact write, or publisher bypass occurred.
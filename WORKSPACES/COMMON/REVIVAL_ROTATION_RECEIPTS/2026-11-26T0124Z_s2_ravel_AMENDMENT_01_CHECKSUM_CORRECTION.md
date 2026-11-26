# Amendment 01 | Ravel h1105:s2 receipt checksum correction

This amendment supersedes only the Blockwave derivative SHA-256 field in the canonical h1105:s2 receipt. It does not replace or rewrite the original receipt.

**Original receipt identity**
- Path: `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-26T0124Z_s2_ravel.md`
- Git blob SHA-1: `0eadbb59673924257e4be946ba4cae8e9867a54f`
- Exact UTF-8 bytes: 11,681
- Correct SHA-256 of the exact readback: `dadab657d4bb6a33fc10d85ddfe180ada391d455c6b26bb4729e606871c208fe`

**Corrected Blockwave derivative digest**
- Path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`
- Git blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`
- Exact UTF-8 bytes: 25,255
- Incorrect digest in the original receipt: `3d393efcb513ef08e2e1e2812d7fb4a10a66b9a8240d016d2e3ebda7f68a92f9`
- Correct SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`

The earlier digest came from an incomplete SHA-256 implementation that omitted round constant `0xefbe4786). The corrected 64-round implementation was validated against the standard `abc` test vector and against the readback hash of issue #2551 comment #7180362134.

The following values were recomputed with the corrected implementation and remain unchanged: SAT-O1 standalone `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`; raw Blockwave conversation `543e0ab7a9774cf62911669c4b1c658fbd4960d50fd0a576af0bddd447b26230`; raw Ravel conversation `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`; issue #2551 Amendment 02 body `458d1a1fc097b4f3415991ef4d1913a141d49ccaff84a01b7ab3b4365e1274bb`.

Public correction: [issue #2551 comment #7180455268](https://github.com/Satobloc/HsH/issues/2551#issuecomment-7180455268). The Blockwave source equation and its 2025-10-19 assistant-message date are unchanged. No corrected equation was generated.
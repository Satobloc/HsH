# Meridian h869:s2 — Amendment 03: independent SHA-256 implementation correction

This amendment supersedes the report SHA-256 value printed in Amendment 02. The original report and issue #1826 body are unchanged.

## Correct digest

- Exact report path: `WORKSPACES/MERIDIAN/2026-11-16T0524Z_H869_S2_LANE24_EMPIRICAL_GEOMETRY_READOUT_AUDIT.md`
- Git blob: `85ca50583a80c88d8faed9767ba0534f3893283f`
- Issue #1826 `content` and workspace report remain byte-for-byte equal as decoded UTF-8 strings (18,925 characters).
- **Correct SHA-256:** `4967101246815448db01df581cd2b3ce4efd4ef8fd8c84ccc34b582cf762ecca`
- Submitted digest in issue #1826: `1d2fffbf5b78cf3b7b87de84514b951c68e92f2fea071e3508ef4e11aab89d8f` — mismatch.
- Amendment 02's `e5777c655ad7ffa7262c605c8532bf12d99e171175672dbaf710753eae9131e7` was itself an incorrect recomputation caused by a defect in the ad hoc SHA-256 implementation used there. Do not use that value.

The replacement SHA-256 implementation was checked against the standard `abc` test vector (`ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad`) and independently reproduced the known SHA-256 `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937` for the exact SAT-O1 source file whose Git blob is `7577aa1ee5a6c3850ce3b226c75377de6367aedc`. It then computed the report digest above from both the issue payload and workspace file.

The publisher's rejection remains correctly identified as the uppercase schema error because `tools/issue_publish.py` checks the exact schema at line 39 before computing/comparing the SHA-256 at lines 47–49. The digest mismatch is an additional defect that would have failed the next validation stage. The correct final status is still **PUBLISHER_REJECTED / NOT_PUBLISHED**; no artifact exists, no retry or duplicate issue was made, and issue #1826 was not edited or reopened.

## Reproducibility script digest

The one-off source-data calculation script has:
- Git blob: `8ef3f7bc1b4d5155baef841d07127e6a88040753`
- SHA-256: `5ec44b512a43d1f2679ab0baccf519b65299c4bbce24c65cd3bd5a0fbb56e037`

No equation, manuscript, source file, publication artifact, task, schedule, or theory status was changed by this correction.

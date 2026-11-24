# Amendment 01 | Enheduanna h1051:s0 | publisher reconciliation

**Amends:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-23T1900Z_s0_enheduanna.md`  
**Created:** 2026-11-24T06:24Z during h1062:s2.  
**Scope:** publication status and checksum only. The original receipt and source report are not overwritten.

The h1051 receipt's `SUBMITTED_NOT_VERIFIED` status and declared SHA-256 `f767c8aadcfc128a1d61b9266e43d3939620a21f25021a8189d5078a5bb07a34` are superseded.

## Exact reconciliation

1. Issue [#2444](https://github.com/Satobloc/HsH/issues/2444) contains 12,741 characters and exactly matches workspace report blob `6683d654d77be1163d9d01d54fce92a82d83bf75`.
2. Its actual UTF-8 SHA-256 is `6b98c9018604841ab713c438ac7154cbb4c61d2f3a937f9bc7c2e279333711e1`, not the envelope's declared `f767c8aadcfc128a1d61b9266e43d3939620a21f25021a8189d5078a5bb07a34`.
3. Publisher comment [#7112286594](https://github.com/Satobloc/HsH/issues/2444#issuecomment-7112286594) correctly rejects the submission for SHA-256 mismatch.
4. The 18,279-character file at the expected `PUBLISHED_SUBMISSIONS` path is blob `539aa820ebae4db88d69c3fce4e43a78437cbfa8`, SHA-256 `843ec95a5fe154a500161719be17417d4a7f8e4b58cf5bf456ad233ba5fd8e15`. It exactly matches issue #2442 and its PUBLISHED confirmation #7112213887, not issue #2444.

**Correct status for #2444:** `PUBLISHER_REJECTED_SHA256 / NO_ARTIFACT_FOR_THIS_SUBMISSION`.  
**Status for #2442:** `PUBLISHED_VERIFIED`; preserve as a separate earlier artifact.

Public additive correction: issue #2444 comment #7124068534, exact readback verified.

No retry, overwrite, issue-body edit, duplicate issue, second artifact, or publisher bypass was attempted.
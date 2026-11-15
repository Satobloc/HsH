# Loom h840:s0 — Amendment 01: publisher rejected SHA-256

**Observed:** 2026-11-15T00:11Z  
**Supersedes:** the interim publisher status in the h840 receipt only. The source-fidelity report, its Git blob, research conclusions, and formalization status are unchanged.

## Publisher result

Existing issue: [HsH #1764](https://github.com/Satobloc/HsH/issues/1764)

Publisher comment: [#6886394677](https://github.com/Satobloc/HsH/issues/1764#issuecomment-6886394677)

Result: **REJECTED: SHA-256 mismatch**.

- Submission ID: loom-h840-o0a-d4-20261115t0000z-001
- Workspace report: WORKSPACES/LOOM/2026-11-15T0000Z_H840_S0_O0A_MODE2_CURVATURE_BRIDGE_SOURCE_FIDELITY.md
- Workspace report Git blob: 956bddf5b7b4ed7e786681a4ff787ced6afd9a9c
- Issue-envelope schema: hsh-publish-v1
- Issue-envelope content was independently parsed and compared with the fetched workspace report; the strings are exactly equal.
- Declared SHA-256 in the issue envelope: 1c719fb0b417c0e862dbc5c830ac9641810fdb156825b1b6f5d2f958479df414
- Publisher implementation: tools/issue_publish.py, Git blob 7067e8d9f27a273d90e443afb0493260d9a3ecbf. Its validator computes SHA-256 over the parsed content's UTF-8 bytes using hashlib.sha256(content.encode()).hexdigest().
- Expected canonical path: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-h840-o0a-d4-20261115t0000z-001.md. The path lookup returned 404; no canonical artifact exists.

The envelope content matched the workspace report, but the submitted digest did not pass the publisher's independent hash calculation. The cause of the digest discrepancy is not established here.

## Final status and boundary

\`PUBLISHER_REJECTED_SHA256_MISMATCH / NOT_PUBLISHED\`

Do not edit or reopen #1764 to seek a rerun, create a replacement/duplicate issue, or bypass the publisher by writing directly to PUBLISHED_SUBMISSIONS. The workspace report remains available as a repository working artifact, not a publisher-verified publication.

**Classification:** \`LOOM_H840_S0 / AMENDMENT_01 / PUBLISHER_REJECTED_SHA256_MISMATCH / NO_RETRY / NO_DUPLICATE / NO_DIRECT_BYPASS\`.

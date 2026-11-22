# Amendment 01 | Publisher readback and SHA-256 reconciliation

**Run key:** `REVROT3-19-20261011:1021:s3`  
**Issue:** [#2346](https://github.com/Satobloc/HsH/issues/2346)  
**Publisher workflow:** [#45029073556](https://github.com/Satobloc/HsH/actions/runs/45029073556)  
**Publisher comment:** [#7080046669](https://github.com/Satobloc/HsH/issues/2346#issuecomment-7080046669)

## Result

<badge> PUBLISHED_CONTENT_READBACK_VERIFIED / PUBLISHER_SHA_LABEL_MISMATCH </badge>

The publisher workflow completed successfully. Its comment records the canonical artifact path and commit `30831236efec0d2609d1323e03a9db0aa4283bf5`, and says readback verified.

Independent retrieval compared the issue payload content, Mercer workspace report and canonical published artifact. All three are exactly equal at 9,295 bytes/characters. Both repository files have Git blob `05193a1ed91444f53c10948efd572ba44c7eee2d`.

The actual SHA-256 of the read-back 9,295-byte content is:

`5999a29a14c9226ff6aeed835e8c4bc73b2fd78f789d078625a435cbe5820026`

The publisher comment repeats the declared digest:

`beeede5e638f289064bec46e1fb11b5018665e98fdef5917684c68ec12d86669`

That digest was calculated over the original 9,299-byte source string. The issue-creation connector normalized away two trailing Markdown line-break spaces on each of the two metadata lines (four bytes total) before the issue payload was stored. The resulting 9,295-byte payload therefore has the different SHA-256 above. This is a digest-label mismatch, not a content mismatch: issue payload, workspace copy and canonical artifact match byte-for-byte.

## Canonical artifact

`WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-h1021-s3-p0-two-axis-safety-freshness-20261122t1336z-001.md`

- Canonical artifact blob: `05193a1ed91444f53c10948efd572ba44c7eee2d`
- Workspace report blob: `05193a1ed91444f53c10948efd572ba44c7eee2d`
- Workspace report commit: `f4b3d3401562b33d41ccbbb010335538e554aa4c`
- Publisher commit: `30831236efec0d2609d1323e03a9db0aa4283bf5`
- Exact content equality: PASS
- Actual content SHA-256: `5999a29a14c9226ff6aeed835e8c4bc73b2fd78f789d078625a435cbe5820026`

The base receipt's `SUBMITTED_NOT_VERIFIED` status is superseded by this amendment. Final publication disposition: `PUBLISHED_CONTENT_READBACK_VERIFIED`, with the publisher's SHA label corrected here. No issue edit, reopen, retry, duplicate submission or publisher bypass was made.
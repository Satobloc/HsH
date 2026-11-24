# Amendment 01 — publisher, source-stratigraphy, and Lean reconciliation

**Amendment observed:** 2026-11-22T18:36Z  
**Scope:** reconcile the original receipt's pending states without rewriting its first-readback history.

## Publisher and source correction

- Issue [#1939](https://github.com/Satobloc/HsH/issues/1939) is **PUBLISHED_VERIFIED**. Publisher comment [#6965596622](https://github.com/Satobloc/HsH/issues/1939#issuecomment-6965596622) records canonical path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-h912-s3-topology-split-gate-20261118t0036z-001.md`, commit `fa54dafb66b01d09ed49b7cfcf4154686d57c803`, and SHA-256 `9588ce0733f6ca5a2e4357b6294d3bbc9e3e0b4fddbadd624ecbf829c804588a`.
- The issue intake payload and canonical artifact were independently fetched and compared: exact content equality, 8,987 characters. The publisher comment's digest matches the declared intake digest.
- The earlier data-availability sentence was corrected through existing publisher issue [#1941](https://github.com/Satobloc/HsH/issues/1941), PUBLISHED_VERIFIED by comment [#6965695519](https://github.com/Satobloc/HsH/issues/1941#issuecomment-6965695519). The original h912 issue comment [#6965667664](https://github.com/Satobloc/HsH/issues/1939#issuecomment-6965667664) records that the arXiv preprint was not retrieved, the unsupported reasonable-request sentence was withdrawn, raw supplementary movies were metadata-located but not downloaded, and processed tracks/calibration/covariance remain UNKNOWN.
- No duplicate publisher issue, retry, raw-data download, or author request occurred.

## Lean verification reconciliation

Existing PR [#1938](https://github.com/Satobloc/HsH/pull/1938) currently has head `43c1474584cc0a5dd5bdd34e6355b23e94302205`, OPEN / DRAFT / UNMERGED.

Actions run [#44212082170](https://github.com/Satobloc/HsH/actions/runs/44212082170) completed SUCCESS. The branch's `.github/workflows/lean-verification.yml` uses the default checkout ref on `pull_request`; the job log records source commit `9e2f2f82c2ec62f4b027bd009ba71577db1c04b3`, the merge reference, not the PR head commit.

Independent blob comparison found:
- Ariadne module: PR head and merge-reference blob both `64f624c83034e1aab0edac0caae523f269479220`.
- Root aggregator: PR head and merge-reference blob both `142712b8dbdb3db26aeade0d82484887587eb6b9`.

Therefore the three original connectedness declarations were compiled from byte-identical changed source, but the run is **MERGE_REFERENCE_BUILD_WITH_EXACT_CHANGED_SOURCE_IDENTITY**, not a standalone exact-head checkout. No theorem-specific axiom audit, global axiom audit, physical validation, or source-to-model translation proof is claimed.

This amendment supersedes the original receipt's `PUBLISHER_SUBMITTED_NOT_VERIFIED` and `LEAN_CI_PENDING` statuses. The original receipt remains unchanged as the initial observation.

# Amendment 01 | Enheduanna h975:s0 | Publisher digest and exact-head CI readback

This amendment supplements the h975:s0 receipt and preserves the original h975 workspace report. It does not edit the report, edit/reopen issue #2200, retry the publisher, create a second issue, or write directly to the publisher's fixed destination.

## 1. Exact workspace and issue-body bytes

Existing report:

`WORKSPACES/ENHEDUANNA/2026-11-20T1500Z_H975_S0_ONE_CORE_SUPERHELIX_VS_TWO_CORE_VORTEX_PAIR_SOURCE_FIDELITY.md`

- Git blob: `878be3d6068ef425283144c50b65d319ba849dac` (GitHub file response).
- UTF-8 character count: 20,926.
- Independently recomputed SHA-256: `8c7fe1e1b91f725a54b6c6bcb6dfad169fd16e25997c22686f6eb832bf595efc`.

Publisher intake:

- Issue: [#2200](https://github.com/Satobloc/HsH/issues/2200).
- Submission ID: `enheduanna-h975-onecore-vortexpair-source-fidelity-20261120t1500z-s0-001`.
- The JSON envelope declared SHA-256 `24121d36b4cc72c81cf43543ed122865efe8538967a2ddc27da31fc175172d3d`.
- The decoded issue-body `content` is byte-for-byte identical to the workspace report.
- Recomputed digest of that exact issue-body content is `8c7fe1e1b91f725a54b6c6bcb6dfad169fd16e25997c22686f6eb832bf595efc`, not the envelope's declared digest.
- Publisher comment [#7043473753](https://github.com/Satobloc/HsH/issues/2200#issuecomment-7043473753): `REJECTED: SHA-256 mismatch`.
- Expected fixed artifact path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-h975-onecore-vortexpair-source-fidelity-20261120t1500z-s0-001.md` returned 404.

**Status: PUBLISHER_REJECTED_SHA256_MISMATCH / NOT_PUBLISHED.** The workspace report exists and the issue body contains its exact content, but no canonical publisher artifact exists. The issue remains the single public incident record.

The publication contract says the workflow listens only to owner-authored `issues.opened`; editing or commenting does not replay the event. It explicitly prohibits edit/reopen retry, a second issue for the same submission, and direct writes to the publication destination. No retry or duplicate was attempted.

## 2. Exact-head Lean evidence

PR #1133 head `fc7f92722fe5e0757d55f961b54a12bdee66d5da` has workflow run #44709605971, job #136197653482. The run is associated with that exact commit. The job's `Assert exact PR-head checkout` step completed successfully, and the Lean verification job concluded SUCCESS. This is stronger than a merge-reference-only build. It verifies the existing conditional modules, not the physical source translation.

PR #1378's finite-symmetry allocation theorem remains conditional. The older run #41956842305 succeeded without an exact-head assertion. The later inspected run #41960650505 failed during the Lean compilation step. No current exact-head success is claimed for PR #1378.

No new Lean module or build was run. The theorem's abstract assumptions are not supplied by the direct source merely because no participant is visibly preferential; the source's epistemic default is not itself a proven group symmetry.

## 3. Non-duplication and next cursor

The November 4-5 symmetric-attribution/timewave/carrier cluster is already covered by the existing Hale, Ariadne, Ravel and Tern source-fidelity records and the common terminology/source indexes. No second report was created.

The next useful source task is to recover the readable raw Meridian Free Build export behind the h975 report's cited message IDs, then compare the exact direct geometry to the measured-study boundary. Do not repeat the existing source comparison or treat the paper's data-available-on-request statement as an acquired dataset.

No physical calculation, CODATA scoring, theory promotion, paper-gate advancement, scheduler mutation, sixth task, signet, or conversation rename.

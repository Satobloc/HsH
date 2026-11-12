# Amendment 02: PR #993 workflow checkout scope correction

**Status:** Additive correction to the h649 report. The original report and its Amendment 01 remain intact.

## Correction

The h649 report described Actions runs 42330303736 and 42330897900 as exact-head builds. That label is incorrect.

Both runs were pull_request workflow runs and both checked out:

refs/remotes/pull/993/merge

The actual merge commits were:

| Run | Job | Merge commit | Parents | Result |
|---|---:|---|---|---|
| 42330303736 | 128275069622 | 45a03c722f3b4cb1da7debf4cc8718eaaddf467e | base c7dc2c; PR head d3026a | SUCCESS |
| 42330897900 | 128276931880 | 32cd73bc... | base c7dc2c; PR head 5e19d | SUCCESS |

The current PR #993 base branch, infra/lean4-verification-20261023, is at 61cc8b65. The two merge-ref builds therefore used the older c7dc2c base. The PR head changes were present in the merge-ref trees, but neither run is a standalone exact-head build or a current-base integration build.

Run 42330897900 later completed SUCCESS. The h649 receipt's earlier IN_PROGRESS-at-final-readback status was accurate at that earlier readback but is now superseded by the completed run metadata.

**Correct classification:** PR #993 has successful merge-ref builds on a stale base. No standalone exact-head build of current head 5e19d has been verified. The previous head d3026 was also tested through a merge ref, not a standalone exact-head checkout.

## Proof and CI limits

The captured theorem-specific axiom outputs include propext, Classical.choice and Quot.sound. No sorryAx appears in the captured theorem-specific output. However nanoda was configured to allow sorry, and tests, lint and the global axiom audit were skipped. The successful build establishes compilation of the checked merge-ref tree, not a whole-project axiom audit, physical-data validation or correctness of the translation to H(s)H.

PR #993 remains OPEN / DRAFT / UNMERGED with no formal review. No code, branch, PR, workflow or physical calculation was changed or created by this amendment.

## Source-access correction

The h649 report's Amendment 01 verified the public Dryad ³He data record, DOI 10.5061/dryad.4j0zpc8m3. The older h649 receipt Amendment 01 statement that the DOI remained unverified is superseded by the h649 receipt Amendment 05. Public record existence is not a claim that the archive was downloaded or independently reanalysed.
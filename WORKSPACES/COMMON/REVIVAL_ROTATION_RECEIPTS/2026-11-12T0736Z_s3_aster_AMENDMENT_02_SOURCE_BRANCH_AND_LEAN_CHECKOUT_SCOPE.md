# Amendment 02 - source-branch and Lean checkout scope correction

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-12T0736Z_s3_aster.md`  
**Parent receipt blob at amendment time:** `8bf36d121caceea573520cbc6a7df7cb357bede6`  
**Prior amendment:** `2026-11-12T0736Z_s3_aster_AMENDMENT_01_PUBLISHER_SOURCE_AND_SCHEDULER_VERIFIED.md`  
**Prior amendment blob:** `64fb36e4a10f18f3ee5ee1ba9356c717ea72391e`

**Purpose:** add source-branch provenance and correct the earlier PR #1133 exact-head classification. This amendment does not change the historical source text, the accepted public artifact, the P0 protected files, the theory, or the original h775 execution.

## 1. Source ancestry qualification

The November 8 raw conversation export is available in three byte-identical Library copies:

- Conversation ID: `6aecede1-4c08-83e9-abc4-da64f59a4f51`
- Size: 8,331,175 bytes
- SHA-256: `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d`
- 1,150 mapping nodes; current node `02ad70b2-811f-415a-aa18-77599916b7df`.

The 09:21 user-role approval node `eb5fbda0-a869-480e-b762-055eebabf004` is off the recovered current-node ancestry. Its parent `f553aae3-7443-4f56-b2b3-9176f85dde77` is on that ancestry. The approval exists as a direct user-role message on an alternate child branch; it is not an event on the recovered current path. The prior phrase “subsequently approved” is transcript-level accurate but should be read as branch-local, not current-path.

The 03:17 and 03:18 messages remain sibling branches with only the 03:18 version on current ancestry. The 07:07 and 09:06 messages remain on current ancestry. No source text or earlier classification of those messages is changed.

The earlier Git blob locator `c1793cebf08ed57881eb144ee23fe6d1d6d69f1a` did not resolve through current main API views of HsH, SAT archive or HSH_RESOURCES. The Library raw bytes and SHA-256 are verified; the Git blob locator remains UNRESOLVED, not disproven.

## 2. Lean build classification correction

The earlier h775 Amendment 01 classified PR #1133 run #43109180575 as exact-head. That classification is superseded.

- Run #43109180575, job #130820353626, checked out PR merge ref commit `e4c4636e7252d9b1aac4ad19cf7f4c4ed11bc5b0`, not PR head `19479ee3fad0e96c4f0ddb4f79842f4a5ab9bb61`.
- The target theorem module blob matched the PR-head module; the root import aggregator differed.
- The later run #43205867534, job #131140738954, also checked out merge ref `5494b53e26cec1a0ac3828cbaaf45db9edfb60e7`, merging PR head `27e481722db3bb10ded4a45b709741db4789b9ae` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- The current target module blob is `5e7107f45fceaf4fd4c3bed69fba9798c9201c41` at both PR head and merge ref; the import aggregator differs.
- Both PR #1133 builds succeeded, but both are MERGE-REFERENCE builds, not exact-head-only builds.

A separate exact-head example remains PR #790 run #42944088253, whose actual checkout commit `bcb3fcc` matches its PR head. That build concerns generic claim-source-lineage predicates, not the specific conversation parent graph.

The existing PR #1133 conditional factorization theorems remain valid for their formalized abstractions. They do not instantiate a physical medium response or prove a physical source-to-readout map. No new Lean module, PR, physical calculation or CODATA comparison was performed.

## 3. Public and P0 status

Issue #1630 remains `PUBLISHED_VERIFIED`; its canonical artifact and SHA-256 were independently read back. This amendment is internal source/proof provenance, so no duplicate public issue or public artifact was created.

The eight protected P0 artifacts remain 8/8 exact at the current branch readback. Both A/B reader routes remain `PRESENTATION_PENDING / NOT_OBSERVED`. No route probe, manuscript edit, site edit, deployment, task change or theory promotion.

**Supersession:** this amendment supersedes only the PR #1133 “exact-head” label in h775 Amendment 01 and qualifies the 09:21 approval as branch-local. All other h775 receipt findings remain intact.

**Current detailed report:** `WORKSPACES/ASTER/2026-11-12T1124Z_SOURCE_BRANCH_AND_LEAN_CHECKOUT_SCOPE_RECONCILIATION.md`.

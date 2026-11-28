# Elias Kern h1164:s3 — Discovery no-op and rebase decision gate

**Nominal slot:** 2026-11-28T12:36:00Z  
**Run key:** `REVROT3-19-20261011:1164:s3`  
**Deterministic label:** Elias Kern (ring index 9)  
**Next ring label:** Nadir Voss (index 10)  
**Disposition:** `SOURCE_REVIEW_COMPLETE / FORMALIZATION_SUBMITTED / LEAN_PENDING / NO_PRODUCTION_CHANGE`

## Executive result

Independent review of the existing mode-aware discovery contract found a missing post-checkout composition layer. The live discovery workflow has two terminal paths:

1. A byte-identical generated tree exits without a commit.
2. A changed tree is committed, then a failed push may be retried after `git pull --rebase origin main`.

The existing formalization separately models a validated no-op and a publication directly based on the scanned checkout. It does not yet model the current-main readback needed for the no-op path or the source-cut consequences of a post-scan rebase.

The new `DiscoveryDecisionComposition` module adds typed cache-integrity witnesses, no-op final-currentness, and explicit rebase dispositions. It requires a rescan or an exact `PublishedKey` revalidation after a moved base. The module was submitted to the existing draft PR #2757; its exact-head Lean run is still in progress. No compile success is claimed yet.

## 1. Selection and authority

The deterministic calculation is:

\[
h=1164,\qquad seq=5(1164)+3=5823,\qquad 5823\bmod19=9.
\]

The selected label is Elias Kern. The next label is Nadir Voss.

The historical Elias appointment in `WORKSPACES/ELIAS_KERN/INBOX.md` is a direct user instruction dated 2026-09-24: operate Track A of the Top/Central/Branch/Hydra workflow-switchboard prototype with Nathan and Orson, independently but in communication with Sable and Tern. The workspace explicitly limits Elias to prototype experimentation, with no independent production-workflow or theory authority.

This is assistant-level shared Lane 36 execution. The current automation run had no run-level `chat_ref`; no authenticated current Elias thread, historical-instance participation, or cross-thread delivery is claimed. The workspace's latest checkpoint remains h1062/h1073-era material; no worker-local Elias pointer or inbox was rewritten.

Nadir Voss remains an assistant-generated SILOED/PLAYGROUND label without a standalone signed specialist charter. No assignment, response obligation, or ownership transfer is created.

## 2. Exact live source review

Current-main source readbacks retain these exact blobs:

| Source | Blob |
|---|---|
| `tools/site_discovery.py` | `97ff9c6d00544251c05bd6bb6053907805438f3e` |
| `.github/workflows/refresh-site-discovery.yml` | `3aa83d6dd5e2e16fad79628be1d19dc62d6c3f70` |
| `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md` | `36b2669c328466f0f579e188fbec5796d6ca44dc` |

The workflow checks out moving `main`, runs `tools/site_discovery.py`, validates schema/nonempty documents/complete repository statuses, stages `PUBLIC_SITE/generated`, and exits if `git diff --cached --quiet`. If a commit is needed, it commits and retries a failed push after `git pull --rebase origin main`.

The generator also consumes prior `discovery.json` state. It carries forward `first_seen`, `changed_at`, `revision_detected`, prior excerpts and prior image records. Its public JSON includes volatile run metadata (`updated`, repository `checked_at`, source commit, diagnostics and revision flags).

Two source-specific observations matter:

- `image()` reuses an existing square-image thumbnail when the expected path exists; the reuse branch does not hash or decode the existing sidecar before accepting it.
- The no-diff exit has no final-main readback or current-key revalidation. The rebase retry has no post-rebase rescan or `PublishedKey` revalidation.

The discovery-run concurrency group serializes discovery jobs, not all writers to `main`. Therefore a concurrent main update remains possible between checkout and the terminal path.

## 3. Missing composition

The existing parent formalization, PR #2562 (`DiscoveryCacheSoundness.lean`, blob `c32b1291497508c7d8dcd5937af76ef9020a2766`), defines:

- `PublishedKey = inventoryDigest + transformFingerprint`;
- `ScanReceipt = observedBranchHead + checkedAt + allScansComplete`;
- `safeNoOp` requiring complete old/new scans, equal published keys and an external cache-integrity proposition.

The existing child PR #2757 (`DiscoveryEventCheckoutWitness.lean`) distinguishes `EventPinned` from `LatestMain` and requires a generated commit to be directly based on the recorded checkout, with current-main readback.

Neither predicate alone composes the two terminal paths with post-checkout branch movement. In particular:

- `safeNoOp` has no final-main currentness witness.
- The publication witness has no post-rebase disposition.
- A bare cache-integrity proposition is not a typed, inspectable witness for prior-snapshot state and derivative sidecars.

## 4. New formalization submitted

Added `FORMAL_VERIFICATION/HsHVerification/DiscoveryDecisionComposition.lean` to the existing PR #2757 branch.

New structures and gates:

| Structure / predicate | Requirement |
|---|---|
| `DerivativeCacheWitness` | Source digest, transform fingerprint, sidecar digest, successful decode and dimension validation |
| `CacheIntegrityWitness` | Consumed prior-snapshot digest, complete derivative manifest, per-derivative witnesses |
| `NoOpWitness` | Existing `safeNoOp` plus checkout policy and final-main currentness |
| `safeNoOpAtReadback` | If main moved after scan, final-main `PublishedKey` must be revalidated |
| `RebaseResolution` | `noRebase`, `rescanned`, `keyRevalidated`, or `unverified` |
| `RebaseWitness` | Final commit parent bound to final base and resolution |
| `safeFinalPublication` | Complete scan, checkout policy, valid rebase resolution, final-main readback and a real new commit |

The main conditional results are:

\[
\text{finalMain}\ne\text{checkoutHead}
\land\text{safeNoOp}
\Rightarrow
\text{finalMainKey}=\text{PublishedKey}_{new}.
\]

For publication after a moved base:

\[
\text{finalBase}\ne\text{checkoutHead}
\land\text{safePublish}
\Rightarrow
\left(
\text{rescanHead}=\text{finalBase}
\;\lor\;
\text{finalBaseKey}=\text{scannedKey}
\right).
\]

`EventPinned` cannot silently follow a moved main. `LatestMain` may proceed after a rebase only when it rescans at the new base or revalidates the complete key there. A no-rebase path reduces to the existing direct-parent contract.

The cache witness is a proposed admission contract. Its digests, completeness flag, decode result and dimensions are inputs to Lean; Lean does not authenticate them. The module does not change the production workflow or claim that the workflow currently emits these witnesses.

## 5. Exact-head Lean status

<badge color="warning">LEAN_PENDING</badge>

Existing PR: [#2757 — mode-aware discovery checkout witness](https://github.com/Satobloc/HsH/pull/2757)

- New module blob: `4e252ee0556c2d2921df0e30526de1c9d80b3762`.
- Updated root aggregator blob: `8cdb276bf24857e8f041c40ee4d85630e4b4142f`.
- Updated PR head: `227bb5c96936088e6829ec2fcaf7f3c7fa716129`.
- Exact-head Actions run: [#46146337035](https://github.com/Satobloc/HsH/actions/runs/46146337035).
- At this report cutoff the `verify` job was still in progress at checkout. The exact-head assertion and Lean compilation had not yet completed.

PR #2757 remains OPEN / DRAFT / UNMERGED. No independent review, merge or main-branch integration is claimed. The previous successful build at head `6f276103...` does not verify this newer head.

## 6. P0 and governance

The latest P0 update is Hale h1164:s2, issue #1747 comments #7239441507 and #7239454038:

- Discovery run #46143848939 succeeded, but the 69.6 MB generated artifact could not be independently read back; source-cut currentness is not verified.
- Navigation run #46143848927 failed at the strict date-prefix gate. Viewer build, chronology, tests, artifact upload and Pages deployment were skipped.
- Source-level presentation safety remains FAIL.
- Paper A/B live routes remain NOT_OBSERVED.
- Deployment remains NOT_VERIFIED.
- Release/standdown remains NOT_AUTHORIZED.

Tern retains P0 release authority. No P0 issue, production workflow, reader route, deployment or release state was changed.

P1 remains frozen and Orson-owned. P2 November 30 remains HOLD. P3 December 14 remains incomplete. FIE rereview is due December 8; last reviewed November 24. No new unrelated-source break was performed; the most recent documented reading remains within the five-activation interval. FIE review is not yet due.

All four Mersearch lanes remain occupied/requested; no request was created, overwritten, released or retriggered. No private HSH_RESOURCES payload was opened. No SAT-O/Blockwave equation, manuscript, theory register or physical dataset was changed or used.

No physical calculation, fit, prediction, uncertainty propagation, holdout or independent measurement was performed. This is a software-workflow formalization, not a physical result.

## 7. Operational boundaries

- Existing PR #2757 extended in place; no duplicate PR.
- Production `site_discovery.py` and `refresh-site-discovery.yml` unchanged.
- No P0 authority exercised.
- No task, ID, schedule, phase, enabled state or prompt changed.
- No sixth task, signet or conversation rename.
- No direct Nadir delivery, assignment, consumption, acknowledgment or ownership transfer.

**Next cursor:** finish exact-head run #46146337035; inspect theorem-specific axiom output and skipped checks; independently review the no-op/rebase composition; then compare it against the actual `refresh-site-discovery.yml` before proposing any production repair. A rebase that changes the base without a rescan or key revalidation must remain `SOURCE_CUT_UNVERIFIED`.

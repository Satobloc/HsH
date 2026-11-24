# H999:S3 Amendment 01 | P2 cross-contract dependency witness

**Status:** LEAN_VERIFIED_CURRENT_HEAD / WORKFLOW-ONLY / P2 HOLD / FACTORY_HANDOFF_PENDING / NOT_FACTORY_FLOOR_ELIGIBLE.

## 1. Parent report and publication correction

The parent H999 report was already published before this follow-up:

- Parent issue: [#2289](https://github.com/Satobloc/HsH/issues/2289).
- Parent submission: `loom-h999-s3-p2-cross-contract-freeze-identity-20261121t1536z-001`.
- Publisher confirmation: [comment #7065351085](https://github.com/Satobloc/HsH/issues/2289#issuecomment-7065351085).
- Parent publisher commit: `aaa6b565a04daec1b1ff6c8783938c9774d79339`.
- Parent SHA-256: `bec442698cb87629087f0518daec21c27af5481db4bf8a1a29673432fa015da0`.
- Canonical artifact: [parent published report](../COMMON/PUBLISHED_SUBMISSIONS/loom-h999-s3-p2-cross-contract-freeze-identity-20261121t1536z-001.md).
- Canonical artifact Git blob: `87a11d546e41a7d6f02e9c804a78b465135699c1`.
- Parent issue content and canonical artifact were read back byte-for-byte.

The parent artifact's internal `ISSUE-PUBLICATION-PENDING` status is stale. Publisher confirmation and canonical artifact readback establish `PUBLISHED_VERIFIED`. This amendment supersedes that status without editing or resubmitting the parent issue.

## 2. Substantive architecture correction

The original `CrossContractFreezeKey` bound artifact identities to one comparison/source bundle. A closer edge audit found that identity binding alone did not require all relevant artifacts to declare their dependencies on the shared source, observation, calibration, covariance, readout, analysis, decision, and holdout contracts.

I added `CrossContractDependencyWitness` as a required field of `P2CrossContractEvidenceBundle`. The identity key and dependency witness are now distinct:

- **Identity key:** which exact artifacts are being referenced.
- **Dependency witness:** which source, geometry, readout, calibration, uncertainty, analysis, decision, and holdout objects those artifacts declare as dependencies.

The required edges are:

1. Geometry-map stack declares the exact source-commitment-map digest.
2. Readout declares the geometry-map-stack digest.
3. Observable family declares the readout-contract digest.
4. Readout declares the observable operator fixed by the parent `ComparisonFreeze`.
5. Acquisition-unit map declares the same source bundle, observation freeze, instrument calibration, covariance, and readout identity.
6. Resolution contract declares the same covariance and calibration.
7. Prediction envelope declares the frozen analysis-plan and decision-rule identities.
8. Holdout-exposure ledger declares the frozen holdout partition, candidate family, and prediction envelope.

This is a dependency/identity contract, not a physical projection function. It does not instantiate the geometry-to-readout map or prove that artifact bytes contain their declared metadata.

## 3. Formal source and exact-head Lean verification

Existing PR [#1858](https://github.com/Satobloc/HsH/pull/1858) was extended. No new PR, branch, module dependency, or tool was created.

- Branch: `research/loom-source-bound-comparison-20261116t2136z`.
- PR base: `research/nadir-p2-comparison-freeze-coherence-20261116t1936z`.
- PR base SHA: `0bc31d2aafac9d3639c06aa93aaf4643033b7718`.
- Verified current PR head: `cfd6b107c8c8e43c1d46c0a66fb852c6f2d4b205`.
- Module: `FORMAL_VERIFICATION/HsHVerification/LoomCrossContractFreezeKey.lean`.
- Module blob: `5cdd21a13e1cf5b04153bee236c5fde7be628c90`.
- Root aggregator: `FORMAL_VERIFICATION/HsHVerification.lean`.
- Root aggregator blob: `746747dfcb84a8528ad08b10a017c3a3c4193ed6`.

**EXACT-HEAD BUILD PASSED**

[Actions run #44923263467](https://github.com/Satobloc/HsH/actions/runs/44923263467), job #136903676781:

- Expected PR head and actual checkout both: `cfd6b107c8c8e43c1d46c0a66fb852c6f2d4b205`.
- Exact-head assertion: PASS.
- Checkout: `actions/checkout@v4`, fetch-depth 1.
- Lean 4.34.0; Lake 5.0.0.
- Mathlib release v4.34.0, actual revision `5ed2965256430c3649e86755f9576b54eca72435`.
- Full formal-library build: SUCCESS, 8,951 jobs.
- All nine declarations in `LoomCrossContractFreezeKey` elaborated.
- Theorem-specific `#print axioms`: all nine report that they do not depend on any axioms. This includes the two new dependency-witness theorems.
- Source scan found no `sorry`, `admit`, or custom `axiom` declaration in the module.

The earlier corrected-head run [#44921983539](https://github.com/Satobloc/HsH/actions/runs/44921983539) also completed successfully at the prior head `a7432d42c2eacd700c3906482a80ad67fc7aad30`; the new run supersedes it with the current head and nine-theorem axiom output.

**Verification limits:** tests, lint, leanchecker, nanoda, and global axiom audit were skipped. The workflow compiles the formal library and prints selected theorem dependencies; it is not a global proof audit.

### Dependency reproducibility

The toolchain file pins Lean 4.34.0 and `lakefile.toml` pins Mathlib v4.34.0. The workflow runs `lake update`, generating a dependency manifest in the runner. No committed `FORMAL_VERIFICATION/lake-manifest.json` or manifest hash was present. The actual Mathlib and transitive revisions were captured from the log, but the complete dependency graph is not source-locked. A later reproducibility change should commit the generated manifest; it was not included in this amendment.

## 4. Epistemic and physical boundary

This is an assistant-reconstructed workflow/type-level contract, not a Nathan Direct equation, historical physical derivation, standard physical model, or independent measurement.

The Lean result proves only the equalities and record-projection consequences in the formalized statements. It does not:

- inspect or authenticate referenced artifact bytes;
- prove that manifests contain the declared dependency metadata;
- define actual geometric projection/composition functions or their domains and codomains;
- establish a worldtube thickness, twist, contact surface, constitutive law, or H(s)H readout;
- validate a physical premise, fit, prediction, or observation.

No physical system or measured dataset was selected. No units, uncertainties, physical calculations, fits, predictions, falsification thresholds, or independent measurements were produced. No SAT-O or Blockwave equation was changed. **P2 remains HOLD.**

## 5. Factory Floor boundary

The Factory Floor [README](https://github.com/Satobloc/FACTORY_FLOOR/blob/main/README.md) and [FLOORROOM_TODO.md](https://github.com/Satobloc/FACTORY_FLOOR/blob/main/FLOORROOM_TODO.md) were read. Its geometry-first gate requires a precise object-specific geometric plot and independent hostile fidelity review.

This abstract workflow theorem has neither. A machine-readable HsH packet was prepared:

- Packet: [FACTORY_HANDOFF_PENDING](../COMMON/FACTORY_HANDOFF_PENDING/loom-h999-s3-cross-contract-dependency-witness-20261121t1612z-001.json).
- Packet blob: `b3c4aa781ad9b5f0366deda436411a5a57b45a64`.
- Status: LEAN_VERIFIED / FACTORY_HANDOFF_PENDING / GEOMETRY_NOT_SUPPLIED / NOT_FACTORY_FLOOR_ELIGIBLE.
- Floor ID: null; not allocated.
- Intake route: NOT_SUBMITTED.
- Direct Factory write: false.

This is not a Factory delivery, intake, acceptance, showroom admission, or BEDROCK promotion.

## 6. Source, Mersearch, and access provenance

Historical Loom role source: raw *Tag Conversation Corpus* export, conversation `6aa67478-541c-83e9-b8fa-32d6d575eeb9`, blob `6668ca60e451f8737903423727da7f9a430484e1`. Ten direct user-role messages were inspected; all ten were already represented in the source-local tag ledger. No duplicate tags were added. No authenticated current Loom thread was established; this is source-grounded revival in the current automation context, not historical-instance participation or cross-thread delivery.

Mersearch was not executed: no callable Mersearch action was exposed and all four shared request lanes were occupied/requested. The exact raw conversation blob and known repository paths were used as bounded GitHub fallback, not represented as a Mersearch result. HSH_RESOURCES root README only was read; no private/internal payload was opened. Factory Floor front-door documents only were read; no Factory write or intake endpoint was used.

No local repository checkout existed in the automation container. The existing issue publisher is the public-artifact route; the existing PR branch was updated through the GitHub connector fallback because no local authenticated checkout/push route was available. No new tool, dependency, fork, subscription, or expenditure was introduced.

## 7. Successor and project continuity

Next deterministic label: **Aster**. The existing Aster packet remains `POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY`. Aster's h999:s4 run completed before this follow-up; no consumption, acknowledgment, direct-thread delivery, assignment, review request, response obligation, or ownership transfer is claimed.

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 Orson cognition | OVERDUE / NOT READY / ORSON-OWNED |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |

November 9 minor gate: MISSED. November 30 major gate: HOLD. December 14 full-theory gate: INCOMPLETE. FIE next review: December 4. Unrelated-reading cursor: 2886; no duplicate break.

The existing :36 task remains enabled and unchanged. No task, ID, cadence, prompt, or phase mutation; no sixth task, signet, conversation rename, or cross-thread participation claim.

**Next research cursor:** retain the new dependency witness as an additive workflow contract. Do not confuse it with physical maps. If P2 later receives a source-grounded measured system, define the actual source-to-geometry and geometry-to-readout functions with explicit domains, codomains, conditions, calibration, covariance, and untouched holdout. Keep PR #1858 open/draft/unmerged pending independent review and a committed dependency manifest.

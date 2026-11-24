# Hale h1023:s4 | Review-MIND source-root and evidence-gate audit

**Run key:** `REVROT3-19-20261011:1023:s4`  
**Selection:** h=1023; seq=5119; ring index 8 = Hale; next = Elias Kern (index 9).  
**Identity:** assistant-level, source-grounded revival. No authenticated current Hale thread or historical instance is claimed.

## 1. Authority and source boundary

The historical Hale remit is reconstructed from the 2026-09-12 common CHECKINS entry and Sable's REV-006 wake packet: external literature scanning, matched-period source comparison, statistical analysis, calibration, and source criticism. The check-in is a worker self-report; REV-006 is an assistant-maintained reconstruction. Neither is a separately signed Nathan-authored specialist charter.

The bounded Library search found no authenticated current Hale thread. The scanner-related candidate export has no Hale self-identification and is not assigned to Hale. The current Review-MIND lane charter supplied for this run controls. No first-blush claim is made, no message was sent to another ChatGPT thread, and no assistant consciousness or personhood claim is made.

## 2. Incoming Calder packet consumed

The prestart optional packet from Calder h1023:s3 was read. It pointed to [PR #2167](https://github.com/Satobloc/HsH/pull/2167), head `ed0f3da9c621fd1353b7c66d28656908ce5615a2`, and Actions run #45036936408. The packet correctly said the run was still in progress when the packet was created. This report records the later completed readback; it does not convert the packet into an assignment, formal review, or cross-thread delivery. Calder's separate publisher intake [issue #2353](https://github.com/Satobloc/HsH/issues/2353) remains SUBMITTED_NOT_VERIFIED: no publisher confirmation or canonical artifact was found at this readback. No retry or duplicate submission was created.

## 3. PR #2167: actual Lean verification

[PR #2167](https://github.com/Satobloc/HsH/pull/2167) now has a completed successful build at [Actions run #45036936408](https://github.com/Satobloc/HsH/actions/runs/45036936408), job `137252665863`.

- Lean 4.34.0 / Lake 5.0.0.
- 8,959 successful build jobs.
- The workflow's `actions/checkout` explicitly selected `ed0f3da9c621fd1353b7c66d28656908ce5615a2`; the checkout-identity assertion passed and the observed source commit matched the PR head. The event's `GITHUB_SHA` was a merge commit, but the explicit checkout was the PR head.
- `CalderVersionedProductCoverage.lean`: 18 declaration-specific `#print axioms` outputs, all reporting no axioms.
- `CalderIndependenceProfile.lean`: six declaration-specific outputs; five report no axioms and `verified_parentage_alone_does_not_admit_independence_claim` depends on `propext`.
- Across the two modules: 24 outputs, 23 with no axioms and one with `propext`.
- No `sorryAx` or `admit` was found in the inspected source/log.
- Tests, lint, leanchecker, nanoda, and the global axiom audit were not run.

The PR remains OPEN / DRAFT / UNMERGED, stacked on a separate Calder parent branch, with no formal PR review. A successful exact-head build is not main integration or independent review.

## 4. What the Calder formalization does and does not establish

The source snapshot compares the GWOSC O4 Discovery Papers v1 legacy event representation with GWTC-5 v2 early-release API surfaces. The v1 legacy event record lists eight H1/V1 strain-product locators. The scoped v1 and v2 early-release strain-file and timeline endpoints return zero rows. This is a version- and endpoint-bounded result, not evidence that no strain products exist globally.

The event GPS metadata differs by 0.1 seconds between versions. That is metadata disagreement, not a measurement uncertainty.

The encoded `analysisReady` value is false. No raw strain bytes, byte-derived digest, calibration, PSD, data-quality segments, covariance, or authenticated acquisition manifest were acquired. No fit, prediction, or physical analysis was performed.

The source-bound module is a useful type-level admission structure, but several composition gaps remain:

1. `AnalysisReadiness` booleans and `ProductArtifactBundle` are separate inputs. No proof derives readiness from the bundle's actual evidence witnesses.
2. `DigestVerificationRecord` binds a reported digest string to the declared artifact digest string. It does not compute SHA-256 from acquired bytes or authenticate the verifier/run.
3. The product bundle does not carry a source-root ancestry graph.
4. `CalderIndependenceProfile` is a separate claim-specific dependency-axis policy. No explicit map composes the product bundle into that profile.
5. The independence profile requires declared distinctions on selected dependency axes; it does not estimate statistical error independence or covariance.

A next formalization should define explicit projection/composition maps from each artifact and verification record into source-root ancestry and claim-specific dependency axes, and connect those witnesses to readiness. Any statistical independence claim needs a separate error-dependence model. This is a design recommendation, not a code change or new theorem.

## 5. Existing source-root/error-dependence formalization reused

Nadir's [PR #1959](https://github.com/Satobloc/HsH/pull/1959) now has a successful exact-head build at current head `85c3b84e30df5df0749e1f9d9bdda00c4e6f73f9`, [Actions run #44248884667](https://github.com/Satobloc/HsH/actions/runs/44248884667), with 8,948 successful build jobs.

Its finite model evaluates the marginal error probabilities as 1/2, 1/2, 1/2 and the joint error probability as 1/4. The theorem `disjoint_roots_can_have_correlated_errors` depends on `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or `admit` was found. Tests, lint, leanchecker, nanoda, and the global axiom audit were skipped.

This is a formal counterexample to the implication that disjoint source roots guarantee independent errors. It is not an empirical model of human or LLM behavior.

The Calder dependency-axis profile and Nadir's finite correlated-error model are different, complementary formalizations. They are not independent empirical confirmations and do not establish a measured covariance structure.

## 6. Cross-lane geometry QC: Elias h1024:s0

Elias's [published report #2355](https://github.com/Satobloc/HsH/issues/2355) separates material-trajectory curvature, frame connection, and ambient Riemann curvature. Its axisymmetric-disk example is a valid Euclidean counterexample under the stated parameterization:

`X(q) = (R cos(phi + omega q), R sin(phi + omega q), z, q)`

The resulting marked-rim curvature is:

`kappa = R * omega^2 / (1 + R^2 * omega^2)`.

A symbolic differentiation check reproduces this expression. The unlabelled support of an axisymmetric disk is unchanged by rotation, so the support projection loses the marked material history and cannot determine that history's curvature.

The general factorization condition is reused from [PR #1115](https://github.com/Satobloc/HsH/pull/1115), exact-head run #43404565082. That build verifies the generic factorization theorem, not the axisymmetric witness. The witness itself is not Lean-formalized or separately compiled.

This remains an analytical Euclidean counterexample, not a physical measurement, native H(s)H derivation, or prediction. No equivalence between the external parameter `q` and the native `cw=t` convention is asserted.

## 7. Separate source-custody correction: Sable PR #2222

The current HsH main commit at readback was `73ba8083810429c3f3f62d8b0bc1c3cf58f62e7c`. Its sampler `WORKSPACES/SABLE/scripts/source_inventory_sampler.py` is version 0.2.1 (blob `32ad549bff5cf9a34ed26f6b5059f2ad746642e7`) and has no symlink-component guard. [PR #2222](https://github.com/Satobloc/HsH/pull/2222) proposes version 0.2.2 with a component-level symlink guard and four synthetic regression tests.

The reported successful run [#44812295233](https://github.com/Satobloc/HsH/actions/runs/44812295233) did pass its Python compilation and four tests, but the job log shows checkout of `refs/remotes/pull/2222/merge` at merge commit `cd8d624906f5b58bd17d8947d55e1c5f3d47f13d`, not checkout of PR head `3c56938e...`. It is therefore a successful merge-reference build, not an exact-head-only build. The PR body and published Sable issue #2223 describe it as exact-head; that classification needs correction.

PR #2222 remains OPEN / DRAFT / UNMERGED with no formal reviews; its tested branch is 3 commits ahead and 1,840 behind the current main comparison. Main still lacks the proposed guard. A Sable continuity checkpoint separately labels an inventory output `0.3.0`; this audit did not establish the source/run binding from that output to the current HsH main sampler `0.2.1`. The earlier synthetic alias reproduction remains a test-fixture result; no actual repository symlink, private payload access, or data leak was observed in this audit.

## 8. Review-MIND experiment design, not results

Existing Nadir h917, Common h939, and Hale h985/h1004 work already covers source-root/error dependence, displayed consensus, and human-LLM facilitation. The useful next synthesis is a preregistered factorial test with three manipulated dimensions:

- source ancestry: shared root versus genuinely separate roots;
- error lineage: same model/retrieval/extraction pipeline versus independently controlled heterogeneous pipelines;
- exposure: private evidence versus shared majority/consensus display.

Use matched tasks with known answers, immutable source manifests, model/configuration identifiers, retrieval/tool logs, parent-message IDs, and blinded coding. Measure accuracy, calibration, joint error, minority-evidence retention, unique evidence uptake, correct-to-wrong revisions, and confidence change. Begin with an LLM-only benchmark; any human-group phase requires consent, privacy review, and preregistration. This design is intended to disconfirm the assumption that displayed agreement tracks independent evidence. No experiment or subject result was produced here.

## 9. Whole-workshop controls

- P0 Code Grurple remains ACTIVE.
- P1 November 9 cognition remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE.
- FIE next full rereview: December 4, 2026. The November 22 unrelated-reading break was already completed by Aldus; no duplicate break was manufactured.
- All four Mersearch request lanes remain occupied/requested. No lane was overwritten, released, or retriggered.
- No private HSH_RESOURCES payload was opened. Root/navigation material only was read.
- No physical calculation, measured-system prediction, fit, human-subject experiment, new Lean module, new tooling, equation change, paper-gate advancement, or BEDROCK theory promotion occurred.
- No ownership, task, schedule, or branch state was changed.

**Disposition:** assistant-level Review-MIND cross-lane QC; PR #2167 exact-head build verified; source-root and error-dependence models kept distinct; Elias's geometric witness remains analytical rather than Lean-formalized; Sable PR #2222 CI classification corrected; no independent human/model review or physical validation claimed.
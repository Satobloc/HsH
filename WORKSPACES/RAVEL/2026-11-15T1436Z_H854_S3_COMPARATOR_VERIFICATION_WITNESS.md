# H854:s3 | Comparator Verification Witness and NIST source reconciliation

**Nominal slot:** 2026-11-15T14:36Z  
**Ring calculation:** \(h=854\), \(seq=5h+3=4273\), \(4273\bmod19=17\)  
**Selected:** Ravel, index 17  
**Next:** Orson Vay, index 18  
**Run ID:** 5121eea3-c980-832b-9464-c031393f184b  
**Recorded start:** 2026-11-15T14:40:00.003265Z  
**Last observed state:** IN_PROGRESS; completion null; run-level chat_ref null. The cached latest_result belongs to the preceding Tern h853 run, not this Ravel run.

## 1. Authority and preflight

The historical 2026-09-12 Ravel check-in in WORKSPACES/COMMON/CHECKINS.md gives a bounded remit: Worldtube/Kerr construction audit, historical filament-tension provenance, and archive/PDF extraction. Direct-user source messages recovered in NATHAN_VERIFIED_WORDS_COMPENDIUM.md establish primary co-theorist work, conceptual cohesion, epistemic hygiene, source fidelity, Kerr-section/filament construction, force as a primitive in mutual accommodation, and a tentative current/induction connection. No standalone signed Ravel specialist charter was found. The workspace role summary remains assistant-maintained, not direct-user authority.

Preflight completed: live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, new-instance onboarding, revival rotation/thread-first controls, scheduler authority, workflow branching map, task-branch graph, current main, Ravel README/STATE/CONTINUITY/INBOX, h854:s2 Mercer receipt and optional packet, Ravel historical check-in, and current NIST/geometry receipts. HsH, SAT archive and HSH_RESOURCES root orientations were read. HSH_RESOURCES private research payload was not opened.

The incoming Mercer h854:s2 packet was consumed as optional P0 context only. It does not transfer P0 ownership or authorize route/site changes. P0 remains Tern-owned and active. Orson's P1 cognition remit is protected; no physics task or response obligation is handed to Orson.

All four Mersearch request lanes remain occupied and no callable Mersearch action is available in this runtime. No request was overwritten or retriggered. Existing Math Hopper, Ravel PR #1133, Ariadne PR #1753, infrastructure PR #262, Whirligig and SciSpace were checked before any tooling proposal. No new tool, dependency, fork, subscription or expenditure.

## 2. Substantive improvement: ComparatorVerificationWitness

The new workflow contract is a source-to-output admission gate for standard-physics comparators.

A standard comparator must not be treated as a trusted baseline merely because it is labeled Newtonian, GR, Maxwellian or otherwise established. Before an H(s)H residual can be interpreted as evidence for additional geometry, the comparator itself must pass:

1. Exact source/version and equation/table locator.
2. Symbol, dimension, unit, sign and normalization audit.
3. Derivation audit, including cancellations and omitted terms.
4. Input provenance, measured-system identity, units and uncertainties.
5. An independently written implementation.
6. Convergence/root/optimizer checks and declared tolerances.
7. Uncertainty scope, covariance and model-discrepancy accounting.
8. Frozen calibration/shared parameters and genuinely held-out observations.

Suggested states are COMPARATOR_ADMISSIBLE, COMPARATOR_CONFLICT, INPUTS_INCOMPLETE, NUMERICALLY_UNVERIFIED and MEASURED_DATA_UNAVAILABLE.

A failed comparator gate blocks interpretation of an H(s)H residual as evidence for new geometry. This is a workflow contract, not a new physical law or an implemented production service.

## 3. Source-bound demonstration: NIST BIPM torsion balance

Primary source: Schlamminger et al., Metrologia 63 (2026) 025012, DOI 10.1088/1681-7575/ae570f, final NIST-hosted PDF publication 961075.

The source's Eq. (25) retains all even Legendre degrees \(2\ell\). The printed Eq. (27) retains only degrees \(4\ell\), based on a stated cancellation of odd Eq. (25) indices after differentiation. That cancellation fails at degree 6:

\[
P_6(c)+P_6(s)=\frac{11}{16}-\frac{63}{16}c^2s^2,
\qquad
\frac{d}{d\phi}[P_6(c)+P_6(s)]=-\frac{63}{32}\sin(4\phi),
\]
where \(s=\sin\phi\) and \(c=\cos\phi\). The degree-6 contribution is nonzero for generic angles. The derivative of Eq. (25) therefore retains even degrees \(4,6,8,10,\ldots\), not only degrees divisible by four.

Published nominal copper geometry from Table 2:
- \(R_t=120.0315\ \mathrm{mm}\)
- \(R_s=213.9642\ \mathrm{mm}\)
- \(\eta=R_t/R_s=0.560988707456668\)
- Table 6 relative standard uncertainty \(u(\eta)/\eta=2.6\ \mathrm{ppm}\)

A separate SciPy 1.17.0 implementation used the direct 4-by-4 Newtonian pair sum from Eq. (23), an analytic derivative with bracketed root finding, and scipy.special.lpmv for the full even-degree and printed restricted Legendre series. NumPy 2.3.5 was present.

Reproducibility script: WORKSPACES/RAVEL/nist_point_mass_scipy_independent_check.py
- SHA-256: 0aeba96277a229808e0ffbca7a46de29a744a3f97bfe79c0525af4a9e187af1d
- Git blob: ca77d3bc505dfdc36bc93d315c27aebca314b904
- Commit: caed8988c54cc1702be9c364c53be7a456505e00
- Exact file-content readback: PASS.

Results:
- Direct pair-sum maximum: \(\phi_{\max}=18.469424454982^\circ\), \(\Gamma_{\max}=0.524537824029897\).
- Full even-degree derivative series at the same angle: \(0.524537824029897\), difference \(-5.551\times10^{-16}\).
- Printed Eq. (27) restricted-series maximum: \(0.457990424765525\), at \(18.492570071606^\circ\).
- Restricted Eq. (27) at the full-series maximum: \(0.457989762915669\).
- Omitted \(4\ell+2\) contributions: \(0.066548061114228\), 12.686989968% of the full factor.
- Degree-6 contribution to \(\Gamma\): \(0.058950844209426\).
- Full-series residual against the pair sum: \(5.9706\times10^{-6}\) at 10 terms, \(1.0325\times10^{-10}\) at 20 terms, and \(5.5511\times10^{-16}\) at 40, 80 and 120 terms.
- \(c_\eta=\partial\ln\Gamma_{\max}/\partial\ln\eta=4.589734183170\). The \(\eta\)-only relative uncertainty contribution is 11.933309 ppm. This is not a complete uncertainty budget.

The reconstructed full point-mass factor is 14.528% above Table 10's point-mass/no-disk value 0.457999 and 8.130% above its actual-masses/no-disk value 0.485099. The source's Section 6.1 analytic value 0.457946 and Table 10 point-mass value 0.457999 both lie near the restricted Eq. (27) series. This is consistent with, but does not prove, the same omitted-degree pattern in the reported numerical point-mass row.

A dimensional check also found an internal annotation conflict: Eq. (1) writes \(N=8Gm_sm_t\Gamma/R_s\), and the symbol list defines \(\Gamma\) as dimensionless. The prefactor already has torque units, while Table 10 prints \(\mathrm{kg^2\,m^{-1}}\) beside \(\Gamma\).

## 4. Comparator test matrix and H(s)H boundary

| Candidate | Shared inputs / observable | Calibration and holdout | Comparator status | H(s)H status |
|---|---|---|---|---|
| NIST point-mass model | Published \(R_t,R_s,\eta\); dimensionless \(\Gamma(\phi)\) | Published mean geometry only; no raw torque holdout | COMPARATOR_CONFLICT: Eq. 25 to Eq. 27 derivative conflict | No H(s)H prediction |
| NIST finite-cylinder integration | Published cylinder dimensions and Table 10 \(\Gamma_{\max}=0.485099\) | CMM point cloud, exact point-mass coordinates and calculation manifest unavailable | INPUTS_INCOMPLETE / NUMERICALLY_UNVERIFIED | Not a verified baseline |
| H(s)H extension | Would require source-defined worldtube/core-to-torque map and any thickness/twist/contact parameter | Same calibration and holdout as standard model; no path-specific retuning | Blocked until standard comparator is reconciled | MAP_MISSING / NO_PREDICTION |

Finite support by itself is not a distinctive H(s)H prediction: the standard Newtonian comparator already integrates extended mass distributions. A worldtube thickness, twist or contact surface becomes evidentially necessary only if a source-defined map makes it alter a held-out observable beyond the validated standard baseline and the full uncertainty model. No such H(s)H torque map is present here.

The direct pair sum is a source-bound standard-model reconstruction from published nominal geometry, not a fit to raw torque data, independent measurement, or correction to the final measured \(G\). The full finite-cylinder integration and its input manifest were not reproduced. No author clarification was obtained.

## 5. Lean verification provenance correction

Ariadne's existing PR #1753 contains NISTLegendreCancellation.lean, with finite polynomial proofs of the degree-2 cancellation and conditional degree-6 non-cancellation. The source module blob at PR head 2942ddf2f8f0a84f3a71bc805d0270b2369d4ec9 is 72b636e215e4ca8c461e098c264a57da5c85f52a. It contains no sorry or admit in the retrieved source.

Actions run #43640470056 did not check out an exact-head standalone revision. Its log records refs/remotes/pull/1753/merge and synthetic merge commit dda3b95, combining PR head 2942ddf with base 89ab283. The NIST target module built at 8944/8947. The full root build failed in seven existing noncomputable declarations in the unrelated MovingPlaneTraceGeometry module. Tests, lint, nanoda, leanchecker and the global axiom audit were skipped.

Correct classification:
PR_MERGE_REFERENCE_TARGET_BUILD_SUCCESS / FULL_ROOT_BUILD_FAILED_UNRELATED / GLOBAL_AUDIT_SKIPPED.

The earlier h839 report's phrase “exact-head build” is incorrect and is superseded by the actual Actions checkout log. The proof covers finite polynomial identities only, not the infinite series, source transcription, numerical maximizer, finite-cylinder integration, measured \(G\), or H(s)H premises.

PR #1753 remains OPEN / DRAFT / UNMERGED, stacked on infrastructure PR #262, which is itself OPEN / DRAFT / UNMERGED and behind current main. Ravel PR #1133 remains separate, stale and unmerged. No PR, branch, root import or Lean infrastructure was modified. No new theorem was needed because the relevant finite identity is already represented in Ariadne's existing module; the source-defined H(s)H readout map is still absent.

## 6. Publication

A distinct workflow artifact was submitted once through the existing HSH-PUBLISH-V1 issue publisher:

- Issue #1792: [HSH-PUBLISH-V1] Comparator Verification Witness v1: standard comparator admission gate
- Submission ID: ravel-comparator-verification-witness-20261115t1436z-s3-001
- Declared SHA-256: 9f1b4dbdafa341a5ba671f5e87c1cfa058290b278c707061202132a5311414ab
- Publisher comment: #6896412153, REJECTED: SHA-256 mismatch.
- Expected artifact WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-comparator-verification-witness-20261115t1436z-s3-001.md returned 404 / NOT_FOUND.

The issue was created once. Inspection of its decoded content confirmed literal backslashes before inline-code delimiters because the submission template used String.raw; the declared SHA was computed over the intended unescaped content. The publisher rejection is consistent with the observed payload. The issue remains public, but there is no publisher artifact or publisher commit. Do not retry, edit the issue body in an attempt to replay the opening event, or create a duplicate issue. Issue #1754 remains the separate prior source-audit intake, publisher-rejected; it was not retried.

The internal report and script are durable repository records. Publication status is PUBLISHER_REJECTED_SHA256_MISMATCH, not PUBLISHED_VERIFIED.

## 7. Project and continuity controls

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 Orson-owned cognition | OVERDUE / NOT READY |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |
| FIE next review | November 24 |

P2 source-readiness gate November 16, P2 major paper gate November 30 and P3 full-theory gate December 14 remain distinct. No paper gate advanced.

All four Mersearch request lanes remain occupied. Task graph remains 18 records against declared branch_count 16; discrepancy left unchanged. Tern retains scheduler/PWH authority. No BEDROCK theory promotion, SAT-O or Blockwave equation change, new branch, PR, task, dependency, subscription or expenditure.

Unrelated reading continued in Charles Babbage, Reflections on the Decline of Science in England, Project Gutenberg #1216, lines 2495-2534. The passage concerns concentration of scientific offices in one person and the risks of role overload. Next cursor: 2535. This is an unrelated reading quantum, not a physical break. FIE review is not yet due.

The incoming Mercer h854:s2 packet was consumed as optional P0 context only. No Orson physics handoff was created, preserving his P1 cognition specialization. No direct thread delivery, consumption or acknowledgment beyond repository packet readback is claimed.

No task ID, saved schedule, prompt, phase, cadence or enabled state was changed. No sixth task, signet or conversation rename.

**Return pin:** H854:S3 / RAVEL / ORSON-NEXT / COMPARATOR-VERIFICATION-WITNESS-PROPOSED / NIST-EQ25-EQ27-CONFLICT / SCIPY-INDEPENDENT-REPRODUCTION-PASS / POINT-MASS-ONLY / FINITE-CYLINDER-NOT-REPRODUCED / LEAN-PR1753-MERGE-REFERENCE-NOT-EXACT-HEAD / ROOT-BUILD-FAILED-UNRELATED / ISSUE1792-PUBLISHER-REJECTED-SHA256-MISMATCH-NO-RETRY / P0-ACTIVE / P1-OVERDUE / P2-HOLD / P3-INCOMPLETE / FIE-NOV24 / READING-2535 / MERSEARCH-LANES-OCCUPIED / AUTOMATION-UNCHANGED / S36-IN_PROGRESS / NO-SIXTH-TASK.

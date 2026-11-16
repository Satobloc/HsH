# Nadir h864:s3 Amendment 01 | P2 gate composition and Lean log reconciliation

**Run key:** REVROT3-19-20261011:864:s3  
**Nominal slot:** 2026-11-16T00:36:00Z  
**Selected ring label:** Nadir Voss, index 10  
**Next ring label:** Enheduanna, index 11  
**Disposition:** INTERNAL WORKFLOW AMENDMENT / P2 HOLD / NO SYSTEM SELECTION / NO PHYSICAL RESULT.

## 1. Why this amendment exists

The h864:s3 execution already produced two distinct artifacts: the PIV array-count scope reconciliation and the cross-candidate P2 source-readiness matrix. The original canonical receipt and CURRENT_WORK pointer recorded the former but did not link the latter. This amendment binds both artifacts into one traceable slot record and applies existing public gate contracts to the P2 matrix rather than creating another gate or issue.

The selected ring label is not an authenticated Nadir instance or thread. No standalone signed Nadir specialist charter was recovered. The historical October 1 user-role messages authorize a broad archive-grounded sandbox; the current user-supplied Lane 36 architecture/prediction charter is the controlling task-specific instruction. Nadir's original-work sandbox remains separate from BEDROCK authority.

## 2. P2 gate composition: reuse, do not duplicate

The cross-candidate matrix already defines empirical readiness (E), discrimination readiness (D), and review readiness (R). Its missing integration is an explicit binding to the repository's existing ordered forward-test and paired-freeze contracts.

Existing canonical surfaces:

- [Issue #1737](https://github.com/Satobloc/HsH/issues/1737): source-typed coordinate-role witness.
- [Issue #1341](https://github.com/Satobloc/HsH/issues/1341): ambient type and geometry-to-observation map contract.
- [Issue #1738](https://github.com/Satobloc/HsH/issues/1738): ordered coordinate-to-instrument composition chain.
- [Issue #1301](https://github.com/Satobloc/HsH/issues/1301): map closure, fiber compatibility, and joint-readout identifiability.
- [Issue #1261](https://github.com/Satobloc/HsH/issues/1261): Kelvin-vortex readout and P2 calibration/holdout gate.
- [Issue #1735](https://github.com/Satobloc/HsH/issues/1735): paired comparison-freeze evidence gate.
- [Issue #1727](https://github.com/Satobloc/HsH/issues/1727): counterexample showing that witnesses from different candidate versions can otherwise be combined into a false composite PASS.
- [PR #951](https://github.com/Satobloc/HsH/pull/951): typed evidence-witness gate; it remains open/draft/unmerged and does not yet bind all P2 witnesses to one common comparison-freeze identity.

The ordered chain from #1738 is:

1. Source and coordinate-role freeze.
2. H(s)H-to-laboratory map.
3. Physical-sector map.
4. Instrument map, including calibration, synchronization, spatial registration, sampling and covariance.
5. Composite forward readout.
6. Representation coherence across the complete readout.
7. Identifiability and uncertainty.
8. Paired comparison freeze.
9. Held-out prediction and independent review.

For the P2 matrix, use the following non-compensatory admission rule:

\[
P2_{\mathrm{ready}} = E_{\mathrm{pass}} \land D_{\mathrm{pass}} \land F_{\mathrm{pass}} \land R_{\mathrm{pass}}.
\]

- E: the measured-system and empirical package is admissible.
- D: the source-to-laboratory, physical-sector, instrument, composite-readout, representation-coherence and identifiability chain is closed.
- F: all model, data, comparator, analysis and decision witnesses share one immutable comparison-freeze identity.
- R: the prediction is evaluated on a genuinely held-out unit and receives independent source/measurement review.

This refines the earlier E-and-D-and-R summary. It does not replace the ordered map chain in #1738 or the paired-freeze contract in #1735.

### 2.1 Comparison-freeze identity

Each candidate comparison requires a content-addressed comparison_freeze_id over one canonical manifest containing:

- exact historical source bundle and equation identities;
- H0 standard-comparator source, implementation and version;
- H1 source-authorized geometry/model version and every required map;
- dataset release, raw/processed manifest and byte digests;
- instrument, calibration, synchronization and covariance package;
- shared physical and nuisance-parameter manifest, including units and fixed/fitted status;
- calibration/validation/holdout split and independent-unit identifiers;
- predicted observable, measurement operator, units and predictive uncertainty;
- analysis code/environment, decision statistic and predeclared falsification threshold;
- any Lean source commit, toolchain, exact-head run, target and theorem-axiom report;
- independent source/translation review and reproduction witnesses.

Every evidence receipt must carry the same candidate_id and comparison_freeze_id, plus model_id (H0 or H1), witness type, method version, source run ID, output digest, exposure state, reviewer and timestamp.

H0 and H1 must share the same observation package, instrument calibration, covariance, nuisance/shared-parameter manifest, holdout split and decision rule. H1 may add only source-authorized degrees of freedom, frozen before holdout. Any change to a source equation, geometry map, comparator, data release, calibration, parameter manifest, split, observable operator, analysis code or decision rule creates a new comparison-freeze identity. Old witnesses remain historical but cannot satisfy the new freeze.

A missing, mismatched or stale freeze identity is F_NOT_READY, never a partial PASS. This is the P2 application of #1735/#1727, not a duplicate implementation.

### 2.2 Candidate disposition

No candidate in the current six-row matrix has a complete comparison-freeze identity:

| Candidate | Upstream map/readout blocker | Empirical/freeze blocker |
|---|---|---|
| Han synchronized SVS + 4D-PTV vortex ring | H(s)H-to-fluid/interface and instrument composition absent | Raw images/tracks, joint calibration/covariance and independent holdout package not retrieved |
| Estepa-Cantero bubble-vortex interaction | H(s)H-to-bubble/core and instrument map absent | Processed tracks, camera calibration and covariance incomplete |
| Barckicke air-water Kelvin-wave vortex | Standard two-contour readout is defined, but H(s)H core-to-contour map is absent | Figshare bytes/version and paired contour covariance not retrieved |
| GW190425 inspiral | H(s)H-to-waveform and detector-response composition absent | HDF5 bytes not downloaded; no common frozen comparison package |
| Finite-wall vortex-ring collision | H(s)H contact and plane-projection map absent | 2D2C data do not identify unrestricted off-plane structure; full covariance absent |
| Rotating He-II vortex-lattice PIV | H(s)H-to-superfluid and instrument map absent | Raw PIV, 10-rpm run-specific motion correction and covariance absent |

All remain candidate-only, F_NOT_READY, and P2 HOLD. This does not select a system or advance the Nov 30 P2 manuscript gate.

## 3. Source-to-geometry boundary: what the historical equations do and do not force

The directly re-fetched SAT archive source is SATOBLOC/SAT O1 4D.txt, Git blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc. The file is unbylined. The archive's DATED_FILE_LIST_EXTENDED records local file-index timestamps of 2025-06-07 08:38:16 creation and 2025-06-09 18:44:50 modification, with 2025-10-27 23:18:35 archive-ingest metadata. These are file-index records, not independently authenticated authorship or creation evidence.

The source declares a one-dimensional filament gamma:R->R^(3,1), describes a worldtube as the “4D volume swept out by the vibrating filament,” and gives the following verbatim curve/action family:

\[
\gamma^\mu(\lambda)=\left(\lambda,A_x\sin(k_x\lambda+\phi_x),A_y\sin(k_y\lambda+\phi_y),A_z\sin(k_z\lambda+\phi_z)\right)
\]

\[
v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda},\qquad
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),\qquad
L=\frac12 m v^\mu v_\mu-V_{\mathrm{tension}}(\gamma).
\]

The declared curve signature supplies a one-parameter object. The separate worldtube sentence does not supply a constructive map from that curve to a four-dimensional support. It gives no fiber dimension/profile, embedding, metric correspondence, boundary conditions or normal-bundle data. This is a source-definition gap, not a physical disproof and not a new Lean theorem.

A finite-core support would require an explicit, source-authorized thickening/embedding map, for example a typed Phi:I x F -> M^(3,1), with the domain, fiber F, support dimension, metric, profile, regularity and boundary conditions specified. This notation is a proposed map shape, not an equation in the historical source.

Consequently:

- finite spatial extent in a laboratory fluid does not by itself force intrinsic H(s)H worldtube thickness;
- twist requires a defined normal bundle/frame and transport or connection law;
- contact surfaces require an explicit intersection/contact map and transfer law;
- timesheet projection and observer readout require their own domains, codomains and composition conditions.

Until these maps are source-defined and identify a held-out observable beyond the standard comparator, thickness, twist and contact surfaces remain optional or unresolved, not forced.

The earlier Hale source crosswalk records SAT4D_LIVE_DRAFT.txt blob 2a79fe..., with a June 2025 header/document-level byline and file-index timestamps of 2025-06-08 18:40:32 creation and 2025-06-09 18:53:29 modification. Its raw path did not resolve in this bounded fetch, so that blob was not independently re-hashed in this amendment.

The existing Aster/Calder Blockwave source-boundary audits record the unbylined/undated SAT—Blockwave Ideal Model.txt and distinguish its 1+1D (theta_4,psi) schematic from the assistant-synthesized composite J^(mu nu) action. The Blockwave attachment itself was not re-fetched through the accessible HsH path, and no private HSH_RESOURCES payload was opened. A later user-role paste of an assistant-generated expression for review does not establish original authorship. No corrected Blockwave action or SAT-O equation was created or adopted here; any conditional sign repairs remain separately labelled in the existing source audit.

## 4. Lean and source-verification correction

The exact-head PR #1189 Actions run #43783028748, job #133024336601, checked out commit 8a6a0c288b0091a19b604ab96f94fec05adcc40e. The actual log reports Lean 4.34.0, Lake 5.0.0, a successful cache restore, NadirVortexTwoChannelReadout built at job 8959/8961, and Build completed successfully (8961 jobs).

The inspected target log reports theorem-specific axioms including propext and the standard dependencies listed by Lean. No sorryAx or admit line appeared in the inspected target log; this is not a repository-wide axiom audit. The log also contains tactic-linter warnings, including an unused ring_nf tactic. Tests, lint, nanoda, leanchecker and a global axiom audit were not run.

This corrects the earlier CURRENT_WORK/receipt phrase “cache-replay witness, not a fresh PIV-specific proof.” The precise classification is EXACT_HEAD_TARGET_BUILD_REPORTED / DEPENDENCY_CACHE_USED / FULL_ROOT_BUILD_SUCCESS / GLOBAL_AUDITS_SKIPPED. The target module was reported as built in this job, while dependency caches were used. Its conditional two-channel readout mathematics does not formalize the PIV acquisition chain, establish the physical source translation, provide an H(s)H-to-instrument map or validate any physical premise. PR #1189 remains OPEN / DRAFT / UNMERGED. No new Lean theorem, PR or branch was created.

## 5. Scheduler observation

The canonical h864:s3 receipt recorded provider run 5a6af084-02d4-8321-9ab1-ee2065df17fc as IN_PROGRESS, scheduled 00:36:00Z, with start field 01:07:20.966851Z and null completion/chat_ref. A later exact-ID peek returned the same run ID and status but start field 01:36:53.062493Z, again with null completion/chat_ref. The start field moved by 29m32.095642s. This is a same-ID metadata movement; it does not establish retry, restart, duplicate execution, hidden attempt identity or backend cause. Task-level latest_result still belongs to the preceding h863 Mira run.

The :48 Enheduanna h864:s4 run completed and its CURRENT_WORK already references the P2 source-readiness report. The :00 Tern h865:s0 run had already started when the optional scheduler packet was prepared. Repository packets are optional context only; no cross-thread delivery or consumption is claimed.

## 6. Scope and disposition

- P0 Code Grurple remains ACTIVE.
- P1 Orson cognition remains OVERDUE / NOT READY; Orson's protected remit is unchanged.
- P2 remains HOLD; no system selected.
- P3 remains INCOMPLETE.
- FIE next review remains 2026-11-24.
- Nov 30 P2 major manuscript and Dec 14 P3 full-theory gates remain separate.
- No physical calculation, fit, H(s)H prediction, independent measurement, paper-gate advancement or BEDROCK promotion.
- No new issue, PR, branch, task, tool, dependency, fork, subscription or expenditure.
- No task ID, schedule, prompt, phase or enabled-state change; no sixth task, signet or conversation rename.

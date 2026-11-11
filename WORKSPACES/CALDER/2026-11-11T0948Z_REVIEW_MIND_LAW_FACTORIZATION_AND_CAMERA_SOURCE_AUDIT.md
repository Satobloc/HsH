# Calder | h753:s4 | Review-MIND law-factorization and camera-source audit

**Nominal slot:** 2026-11-11T09:48:00Z  
**Run key:** REVROT3-19-20261011:753:s4  
**Selected ring label:** Calder, index 7  
**Successor:** Hale, index 8  
**Disposition:** BOUNDED SOURCE / FORMAL-EVIDENCE QC; NEW SUPPLEMENTARY-SOURCE DISCOVERY; NO PHYSICAL CALCULATION; NO P2 SELECTION; NO THEORY OR PR CHANGE.

## 1. Identity, authority, and incoming context

The deterministic calculation is:

\[
h=753,\qquad seq=5(753)+4=3769,\qquad 3769\bmod19=7.
\]

The next ring index is 8, Hale. The next nominal recipient run is h754:s0.

The empirical/statistical Calder identity is distinct from the separate Foundational Covariance / Global Architecture Calder. The latter's REV-005 wake packet was inspected only to detect the collision and was not used as Calder's historical authority.

No standalone signed Nathan-authored empirical-Calder specialist charter was recovered. The only source-backed historical role description remains the 2026-09-12 Calder self-report in WORKSPACES/COMMON/CHECKINS.md: empirical angle-clustering, adversarial/local-null design, independent-unit discipline, statistical calibration, covariance/representation checks, and source/provenance separation. Its reported negative/non-significant homogeneous-galaxy result and canopy pseudo-clustering collapse under source/method controls remain negative controls, not positive theory evidence.

No authenticated current empirical-Calder conversation was established. The :48 task has configured conversation ID 6aea3ec3-55dc-83e9-a744-d8bf46bd8cff, but this run's chat_ref is null. This is source-grounded assistant work, not historical-instance participation.

The immediate predecessor packet, Aldus h753:s3 ALDUS-H753-S3-CALDER-001, was present before this run began and was read as optional context. The earlier Aster h752:s4 packet was addressed to Ariadne h753:s0 and is not the immediate predecessor for this occurrence. No direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.

## 2. Mathematical audit: law-valued factorization and instrument masking

Aldus's proposed distinction can be written:

\[
K_{obs}=M_*\circ K_{phys},
\]

where \(K_{phys}:X\to\mathcal P(Y_{phys})\) is a physical-outcome law, \(M_*:\mathcal P(Y_{phys})\to\mathcal P(Y_{obs})\) is the probability-law map induced by a fixed instrument kernel, and \(K_{obs}\) is the observed-data law.

For a declared reduction \(\pi:X\to R\), a law-valued map \(K\) factors through \(\pi\) exactly when it is constant on each fibre of \(\pi\). The existing Kestrel theorem hallway_factorization_iff_fiber_compatibility has arbitrary codomain Z, so its abstract statement can be instantiated with a probability-law type. That is a valid generic theorem reuse, not a new probability-measure or Markov-kernel formalization.

The directional distinction is:

- If \(K_{phys}\) is constant on each \(\pi\)-fibre, then \(K_{obs}=M_*\circ K_{phys}\) is also constant there.
- The converse requires \(M_*\) to separate the physical laws that can occur within each relevant \(\pi\)-fibre. Global injectivity on \(K_{phys}(X)\) is sufficient but stronger than necessary.
- If the instrument map merges two distinct physical laws in the same \(\pi\)-fibre, observed-law factorization can hold while physical-law factorization fails.

This implication is a direct mathematical deduction from the definitions, not a new Lean-compiled theorem in this run. The existing generic theorem does not instantiate measurable spaces, probability measures, a Markov kernel, calibration dependence, or the actual experimental camera operator.

Terminology caution: use **law-factorization** or **fibre-constant outcome-law criterion** unless a precise statistical definition of “sufficiency” is supplied. Unqualified “sufficiency” risks conflation with classical sufficient-statistic definitions.

The proposed approximate gate

\[
\sup_{\pi(x_1)=\pi(x_2)}D(K(x_1),K(x_2))\le\varepsilon
\]

is not an empirical result. It still requires a declared admissible model class/support, discrepancy \(D\), predeclared \(\varepsilon\), instrument/calibration uncertainty, and independent acquisition-run sampling. If the instrument response varies by run or calibration state, that state must be included in the model or represented as an explicit family of kernels. No value of \(D\), \(\varepsilon\), or power threshold was selected.

## 3. New source-availability finding: supplementary raw camera images exist

The official Cambridge page for Estepa-Cantero et al., Journal of Fluid Mechanics 1045 (2026), A27, DOI 10.1017/jfm.2026.12078, lists seven supplementary movies.

The publisher describes:
- Movie 1: volumetric bubble reconstruction, 165.9 KB.
- Movie 2: **raw images from six cameras**, Case I (weak interaction), 43.8 MB.
- Movie 3: **raw images from six cameras**, Case II (capture, drag and release), 37.7 MB. The page displays the acquisition rate as “1496 H”; preserve this literal rendering rather than silently correcting it.
- Movie 4: **raw images from six cameras**, Case III (binary bubble breakup), 44.9 MB.
- Movies 5–7: bubble-surface / \(\lambda_2\)-criterion visualizations, 1.6 MB, 3.0 MB, and 2.1 MB.

The published abstract calls the measurement method **3D-LPT**; the earlier arXiv/preprint and Zenodo description use **4D-LPT**. Preserve this as a version-specific terminology difference until the final Methods section is checked. Do not interpret “4D-LPT” as a camera count.

The prior HsH/Aldus source map records four frontal cameras for the liquid-particle tracking stream and six cameras for bubble tomography. The publisher's supplement description says six-camera raw images but does not itself map those files to a particular reconstruction pipeline. The six-camera movies may include the frontal images used for tracking, but the exact file-to-pipeline mapping, frame completeness, compression, synchronization and calibration were not verified here.

The Zenodo record 10.5281/zenodo.19001573 visibly lists one 7.0 MB article PDF. Its displayed 419.2 MB “data volume” is **cumulative downloaded volume**, not a record-storage-size claim; Zenodo's statistics FAQ defines it as the total data volume downloaded for all files. It is not evidence of hidden raw-track files.

This refines, but does not overturn, Aldus's original data gate:
- Publisher-described six-camera raw-image movies are publicly listed.
- A complete processed 4D-LPT particle-track / velocity-field package was not retrieved.
- Per-run calibration, camera metadata, acquisition/run IDs, time synchronization, reconstruction settings, joint covariance and an independent transition-region replicate package remain unverified.
- The supplementary images are not themselves a verified independent-run dataset or an uncertainty/covariance package.

No supplementary movie, PDF, track file or calibration file was downloaded or analyzed in this run. No physical calculation, fit, prediction, instrument inversion, or P2 selection was performed.

## 4. Existing Lean evidence replayed, not upgraded

Kestrel PR #873 remains OPEN / DRAFT / UNMERGED at current head 8f49c39c8428e3d0195a8d6abd3d613aa786de4d.

Current-head-associated Actions run #42955799035, job #130310470259:
- SUCCESS.
- Lean 4.34.0 / Lake 5.0.0.
- Root build completed: 8,956 jobs.
- The log checked out merge commit 78d4571, merging PR head 8f49c39 into base c7dc2c4. This is a **merge-reference build**, not an exact-head-only build.
- Captured log contains no sorryAx or bare admit match.
- Theorem-specific axiom output:
  - hallway_factorization_iff_fiber_compatibility: Classical.choice.
  - hallway_factorization_unique: Quot.sound.
  - hallway_factorization_exists_of_source_injective: Classical.choice.
  - downstream_readout_cannot_restore_coarse_collapsed_pair: no axioms.
  - noninjective_readout_can_create_spurious_overlap: propext and Quot.sound.
- nanoda, leanchecker, tests, lint and the separate global axiom audit were skipped/disabled.

The existing theorem establishes conditional generic map geometry. It does not establish the soundness of translating the experiment into probability-law types, prove that the real instrument kernel is injective or non-injective, or validate a physical premise. No new Lean code, build, PR, branch, or formal claim was created.

Calder PR #1515 remains OPEN / DRAFT / UNMERGED at its existing head; it was not modified.

## 5. Search, project controls, and maintenance

Mersearch was not run:
- All four shared request files remain requested.
- All twelve expected request-scoped manifest/receipt files were checked and returned 404.
- No local pinned Mersearch checkout or mersearch executable was present.
- No Mersearch connector was exposed in this runtime.
- Bounded GitHub search fallback was attempted separately against all three repositories. It is not a Mersearch result and cannot establish absence.

The HsH, SAT archive, and HSH_RESOURCES front-door READMEs were read. HSH_RESOURCES remains private/internal reference infrastructure and was not used as a public link target. No new tooling was proposed or built. Existing Math Hopper #578 / PR #991, Whirligig Kernel 0 (sandbox only), and the available SciSpace connector remain the recorded options.

Last recorded Calder control state (06:27Z, not re-probed in this run): P0 Code Grurple ACTIVE; Calder not assigned to the Paper A/B presentation-repair roster; Lane 24 BACKSEAT/HOLD; P1 Nov 9 OVERDUE / NOT READY / Orson-owned; P2 Nov 30 HOLD; P3 Dec 14 INCOMPLETE. No ownership or gate changed.

FIE rereview was completed 2026-11-10; next review 2026-11-24. The latest unrelated-reading cursor remains Alice's Adventures in Wonderland, Project Gutenberg eBook #11, next line 341; no additional reading break is claimed in this run.

## 6. Return cursor

1. Verify the exact Cambridge supplementary file URLs, formats, frame counts and checksums; preserve the distinction between publisher-described raw camera-image movies and processed visualizations.
2. Reconcile the published 3D-LPT wording with the preprint/Zenodo 4D-LPT wording from the versioned Methods, without treating the label as a camera count.
3. Establish which camera streams feed particle tracking versus bubble reconstruction, and obtain per-camera calibration, synchronization, acquisition IDs and reconstruction settings before any reprocessing.
4. Obtain run-level tracks/outcomes and independent transition-region acquisitions before any statistical comparison or prediction.
5. If a probability-law formalization is later authorized, define measurable spaces, the Markov kernel, its induced M_*, calibration/run dependence and the relevant fibre-restricted injectivity condition before adding a Lean module.

**State:** SOURCE / FORMAL-QC COMPLETE; SUPPLEMENTARY RAW-IMAGE AVAILABILITY DISCOVERED; RAW TRACK / CALIBRATION PACKAGE STILL NOT VERIFIED; NO PHYSICAL CALCULATION; NO P2 SELECTION; NO NEW LEAN CODE; NO THEORY PROMOTION.

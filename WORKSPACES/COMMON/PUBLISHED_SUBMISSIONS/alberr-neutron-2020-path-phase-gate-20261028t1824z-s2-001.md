# Alberr-selected :24 | Neutron spin observable-map gate | 2026-10-28 18:24 UTC

**Status:** source-grounded, real-system calculation executed; no independent H(s)H prediction; new Lean CI pending.

## Experimental distinction
Demirel, Sponar and Hasegawa (2015), New Journal of Physics 17 023065 (DOI 10.1088/1367-2630/17/2/023065), measured neutron polarization-vector rotation. The authors' later work explicitly acknowledges that the polarimeter result can be modeled with semiclassical Bloch equations. Danner et al. (2020), npj Quantum Information 6, 23 (DOI 10.1038/s41534-020-0254-8), instead measured a coherent two-path neutron interferometer's relative wavefunction phase at ILL S18, Grenoble. The two experiments have substantially overlapping authors, but distinct physical readouts. The 2020 phase shifts depend linearly on rotating magnetic-field frequency from 0 to 20 kHz. Analyzer-in/out fitted slopes differed by approximately 8%, with possible guide-field adjustment effects acknowledged.

**Observable-map gate:** a common spinor sign can be invisible to quadratic polarization readouts yet detectable relative to a coherent reference path. The 2015 polarimeter is not by itself a unique wavefunction-phase discriminator. Neither result is an H(s)H worldtube prediction.

## Executed real-system numerical control
Danner et al. report approximate neutron wavelength 1.9 Angstrom, k about 3.3e10 inverse meters and interferometer area about 36 square centimeters. For their standard-theory comparator R=sqrt(pi)/(2*k*sqrt(A)), executed Python and SymPy yield R=4.47589356289e-10 from reported k and R=4.46650086975e-10 using k=2*pi/lambda. The 0.210% difference reflects input rounding. Five symbolic checks passed for spin projection sign invariance, reference-arm intensity difference and ratio sensitivities. No input uncertainty/covariance or point-level phase data was recovered; these are not fitted residuals or significance estimates.

## Formalization and provenance
Reused existing draft PR #814, adding AlberrSpinorSignProjection.lean and AlberrInterferometricReference.lean with seven conditional theorems, restricted to a real-amplitude slice, not a full complex spinor model. New CI run #40745468034 was in progress at report time. Prior successful eight-theorem CI #40602318147 does not verify these new theorems.

Original historical SAT source: SAT_THEORY_ARCHIVE_2023-25/Alberr/text 28.txt, Git blob 67175cd078017b21c630b26dfe2bb3b295d014d8, first 165 lines read. Early optical/twist signatures are user-supplied prompts or assistant proposals, not quantitatively derived finite-core H(s)H predictions.

**Next:** retrieve 2020 ILL data DOI 10.5291/ILL-DATA.CRG-2484, phase-fit covariance, and analyzer systematics. Derive worldtube-to-spinor-to-path-to-detector mapping before making any H(s)H comparison. Historical Alberr identity and autonomy remain protected; no authenticated original-thread action or cross-chat delivery is claimed. No BEDROCK promotion, scheduler change, sixth task, signet edit or chat rename.

Sources: https://www.nature.com/articles/s41534-020-0254-8 ; https://doi.org/10.1088/1367-2630/17/2/023065 ; https://github.com/Satobloc/HsH/pull/814

# Amendment 03: CODATA cutoff, Lean build scope, and upkeep corrections

**Status:** Additive correction to the h782:s2 source-readiness report. The original report remains intact. This amendment supersedes only the specific classifications and upkeep pointers identified below.

## 1. CODATA 2022 eligibility correction

The 2022 CODATA adjustment used data available by **2022-12-31**. NIST still identifies CODATA 2022, Web Version 9.0, as the current published adjustment; the next adjustment's stated data cutoff is 2026-12-31.

The helium sources must be separated by measurement and public-availability date:

| Source | Public date | CODATA 2022 status |
|---|---|---|
| ³He optical spectroscopy result, arXiv:2306.02333 v1 | 2023-06-04 | Post-cutoff. Not an input to the 2022 adjustment. |
| Dryad ³He raw-data deposit, DOI 10.5061/dryad.4j0zpc8m3 | 2025-04-15 | Post-cutoff. Not an input to the 2022 adjustment. |
| ⁴He BEC spectroscopy PRL, DOI 10.1103/rwg9-my6x | 2026-06-18 | Post-cutoff. Not an input to the 2022 adjustment. |
| Separate ³He⁺ Penning-trap magnetic-moment measurement by Schneider et al. (2022), CODATA input D45 | 2022 | A distinct, eligible input included in the 2022 adjustment. |

The experimental campaign dates for the optical ³He work are not the same as its public preprint date. Do not describe the 2025 ³He optical spectroscopy result or the 2026 ⁴He result as inputs to CODATA 2022. Equally, do not generalize this into a claim that CODATA 2022 contained no helium-related input: the separate ³He⁺ Penning-trap result D45 is present.

Sources:
- NIST CODATA constants and version history: https://physics.nist.gov/cuu/Constants/index.html
- 2022 CODATA adjustment paper: https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=958143
- ³He spectroscopy preprint and version history: https://arxiv.org/abs/2306.02333
- ³He Dryad record: https://doi.org/10.5061/dryad.4j0zpc8m3
- ⁴He PRL: https://doi.org/10.1103/rwg9-my6x

## 2. What the CODATA adjustment actually represents

The 2022 adjustment is a correlated least-squares network, not a table of independent measurements. The published adjustment reports 133 input data for 79 adjusted constants and 54 degrees of freedom. Its initial chi-square was 109.6 with a 0.001% probability; after the stated uncertainty expansion treatment the final chi-square was 44.2 with probability 0.83%. Expansion factors of 1.7 and 2.5 were applied to specified input groups; the gravitational constant adjustment used a factor of 3.9 across 16 determinations.

These adjustment, correlation, evaluation and model-dependence details must be retained before any later numerical comparison. No CODATA-to-H(s)H numerical comparison is authorized by this amendment.

## 3. Public ³He data record and remaining access limit

The Dryad record is verified as a public record for the ³He spectroscopy data package. It lists a 151.94 MB archive containing raw spectra, frequency-counter data, timestamps, clock-correction material and analysis scripts. The record preview identifies GPS/Cs-clock correction material and also flags some timestamp files as synthesized or interpolated. Preserve those distinctions in any future reanalysis.

The separate README link returned HTTP 403 through the available web reader. The archive was not downloaded in this run and no raw-data reanalysis is claimed. The 2026 ⁴He PRL supplementary material remains subscription-restricted in the available source path; no public ⁴He raw time series was verified.

This supersedes any implication that the ³He optical spectroscopy dataset is unavailable. It does not establish that the raw package has been independently reproduced or that its uncertainty/covariance structure is complete.

## 4. Historical h649 source and Lean-scope correction

The h649 report's own Amendment 01 already verified the Dryad ³He record. The older h649 receipt Amendment 01 statement that the DOI remained unverified is superseded by that report amendment and by the present verification. See the new h649 report Amendment 02 and h649 receipt Amendment 05.

The h649 report's PR #993 build labels also require correction. Both Actions runs 42330303736 and 42330897900 checked out the PR merge ref, not a standalone exact head. Their merge commits used base c7dc2c, while the current PR base is 61cc8b. The successful builds therefore compile the PR head changes in a merge-ref tree on a stale base; they are not exact-head or current-base integration builds. The latest run later completed successfully, but that does not change its checkout scope.

The h782 PR #1133 build has the same relevant limitation: run 43212754624 checked out merge commit 7e2a44f, whose base parent is c7dc2c, while the current PR base is 61cc8b. The existing h782 Amendment 02 already records that limitation. PR #1238 has no observed workflow run.

The available environment has no Lean, Lake or Elan executable, no local repository checkout, and no working container network. The GitHub connector exposes no workflow-dispatch action; its available rerun action is for failed/cancelled jobs, not these successful runs. No new exact-head build was performed, no toolchain was installed, and no new Lean module or PR was created.

The existing successful builds are actual Lean 4.34.0/Lake 5.0.0 builds of their merge-ref trees. The captured theorem-specific axiom reports include propext, Classical.choice and Quot.sound. No sorryAx appears in the captured theorem-specific outputs, but nanoda, tests, lint and the global axiom audit were skipped. This is not a whole-project sorry-free or soundness certification. Lean checks only the formalized conditional statements, not the soundness of their translation or the truth of physical premises.

## 5. Upkeep corrections

The original h782 report's statement that the FIE full rereview remained due on 2026-11-10 is superseded. Aldus completed the full rereview on 2026-11-10 at 00:17Z. The next scheduled review is 2026-11-24. No duplicate FIE review was performed.

The original h782 report's unrelated-reading cursor at TheTANGLE.txt line 1521 is also superseded. The later h778 Ravel continuity record documents Babbage, lines 1990-2454, with next cursor 2455. No additional reading was repeated in this run.

## 6. Scheduler and handoff pointer

The current :24 run ID cb175359-a174-8325-a03b-d50641100c70 has three observed start-field values: 14:20:00.675679Z, 14:47:55.223153Z and 15:17:27.584381Z. It remained IN_PROGRESS with no completion timestamp and no run-level chat reference at the latest readback. The report and Orson handoff were committed during the first observed interval. Tern observation 005 Amendment 01 records the later four-lease readback, including the :00 same-ID FAILED-to-IN_PROGRESS transition and the :36/:48 start-field changes.

The existing Orson packet and its post-start amendment are reused. It remains POST_START_OPTIONAL_CONTEXT_ONLY, repository-only. No new handoff, direct thread delivery, consumption, acknowledgement, assignment or ownership transfer is claimed.

## 7. Scope preserved

No measured system was selected for P2. No physical calculation, fit, prediction, independent measurement, CODATA numerical comparison, raw-data reanalysis, new Lean build, SAT-O/Blockwave equation edit, WWRD equivalence claim, BEDROCK promotion, issue, PR, branch, automation or task change was made. P0 remains active; both A/B reader routes remain PRESENTATION_PENDING / NOT_OBSERVED. P1 remains Orson-owned and NOT READY; P2 remains HOLD; P3 remains INCOMPLETE.
> **SUPERSEDED / DO NOT ROUTE TO SABLE.** A ring-successor calculation error was found after creation. For h=538, seq=2693, selected index 14 is Kestrel and the prescribed successor is ring[(2693+1) mod 19] = index 15, Meridian. Sable is the next hourly selection, not this run's ring successor. This file is retained for audit only; no task, response or ownership is assigned to Sable.

# Kestrel → Sable | Optional context only
**Nominal slot:** 2026-11-02T10:36Z  
**Run key:** `REVROT3-19-20261011:538:s3`  
**Next selected label:** Sable  
**Next run key:** `REVROT3-19-20261011:539:s4`

No task, ownership transfer, response obligation, or requested review is created. This is repository context only.

## Source-grounded measured-system candidate

Kestrel examined Barckicke, Falcon & Gissinger, *Nature Physics* 22 (2026), DOI `10.1038/s41567-026-03175-w`, a classical air–water bathtub vortex. The paper defines two opposing-contour readouts:
`eta=(r(theta=0)-r(theta=pi))/2` and `a=(r(theta=0)+r(theta=pi))/2`.
The paper uses the position channel for m=1 and the radius channel for m=2 and other non-m=1 modes. It reports 60 μm/px, 0.5 mm contour width, about 0.1 mm typical core-radius/position uncertainty, PIV circulation uncertainty about 0.005 m²/s, and PTV vertical-velocity uncertainty about 0.05 m/s. Source-data DOI: `10.6084/m9.figshare.30903347`; raw bytes/version metadata were not retrieved.

The paper uses measured a0, fits (Gamma,v_z) to the dispersion data, then checks those fitted parameters a posteriori against PIV/PTV. Its dispersion-curve match is fit-conditioned, not a blind holdout prediction. A real discriminator would freeze shared parameters before a separate run/forcing-condition holdout and jointly compare the eta and a spectra.

The rendered Methods PDF page 6 confirms k0/(2π)=25 m^-1 for the WKBJ estimate; the extracted HTML text drops the leading 2. Source inputs delta-a=1 mm and a0=1.9 mm give B=1.6501600343812168 and Delta-k/(2π)=7.97370828446715 m^-1. Local sensitivity to a 0.1 mm delta-a shift is about 0.797 m^-1; this is not a confidence interval.

## Existing branch and formal status

PR #873 remains open/draft/unmerged. Existing branch: `research/kestrel-original-slice-fidelity-20261028t0900z`. Kestrel added a narrow readout/uncertainty formalization and repaired the two pre-existing compile blockers in its own module:
- commit `b059cb6c738680888592f19bbb2df2d3e5cf9268`
- module blob `7ed5d1ff91f79079203f61b248df54f7f82b0a79`
- exact-head Lean run #41430924562 is still in progress at handoff creation; no success claim yet.

The two-sided readout/inverse is algebraic only. No full 3D/4D reconstruction, H(s)H prediction, physical equivalence, raw-data fit, P2 selection, or theory promotion is claimed. The 2014 Fonda superfluid-helium acquisition constants in the same Lean file are explicitly separate from the 2026 classical air–water measurements.

## Optional next cursor

If useful within Sable's own remit, the published source and PR context may inform the P2 candidate docket (#565). Do not take ownership of Kestrel's branch or infer a new task. Raw Figshare version metadata and arrays remain the next data-access gate. All project-specific audit and publication controls remain unchanged.

Repository handoff only. No ChatGPT-thread delivery, recipient consumption, or acknowledgment is claimed.


## Late status update | 2026-11-02T10:53Z

- Exact-head Lean run #41430924562 completed FAILURE on initial commit b059cb6c738680888592f19bbb2df2d3e5cf9268. The first inverse theorem left True ∧ True and produced sorryAx; the second inverse theorem compiled. The five new Barckicke2026 rational conversion theorems compiled and evaluated to 5/3, 25/3, 1/5, 1/200, 1/20, with no sorryAx in those theorem-specific reports.
- Latest commit 8fb6fd385a627ca1cbdfb64a645caf1471afb1e4 replaces both inverse proofs with explicit extensionality/unfolding/coordinate ring proofs. No exact-head Lean run for that latest commit has been observed. Latest proof status remains SUBMITTED_NOT_VERIFIED.
- Publisher intake issue #1261 was opened with an independently recomputed content SHA; publisher run #41432153333 is in progress. No published artifact/readback success is claimed yet.
- P2 docket #565 was updated with this candidate, still explicitly CANDIDATE ONLY and not a system selection.


## Publication completion | 2026-11-02T10:54Z

- Publisher issue #1261 succeeded in Actions run #41432153333.
- Published artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-kelvin-vortex-p2-candidate-20261102t1036z-s3-001.md`.
- Exact artifact readback equals the issue payload. Independently recomputed content SHA-256: `044535c4da6497d5eef99f3abd13628d0991d34839c57d33e839623bf96a4ff7`; Git blob: `48823e74f8a59e683a09950c4a5d77a30751f05a`.
- P2 docket #565 now links the published candidate report and records that no final P2 system is selected.
- Lean status is unchanged: initial run failed on commit b059..., latest proof-repair commit 8fb6... remains SUBMITTED_NOT_VERIFIED.

# O13/O10 source-to-observable consistency audit
**Nominal slot:** 2026-11-02 19:36 UTC  
**Worker label:** Aster  
**Run key:** `REVROT3-19-20261011:547:s3`  
**Disposition:** INTERNAL SOURCE CROSS-READ / CONDITIONAL CONSISTENCY AUDIT / NO PR OR BEDROCK CHANGE

## 1. Scope and boundary

This is an internal source-provenance and source-to-observable consistency audit. It is **not** a second formal review of the Code Grurple papers, not a new PR review, and not a claim that all SAT or H(s)H is falsified. The live Code Grurple roster remains ACTIVE; Aster's formal review remains frozen while cross-read is open. No research branch, manuscript, feed, task graph, BEDROCK entry, or public issue was changed.

The useful new result is that the O13 flavour claims do not compose consistently with the O10 chiral-defect module they cite. The mismatch is not merely a fit discrepancy: the stated root-of-unity factor is arithmetically wrong, the shared O10 parameter does not reproduce the O13 mass-ratio formula, and the O10/O13 chirality assignments conflict.

## 2. Primary-source recovery and provenance

### O13

- Primary archive: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- Path: `SAT O Core Modules/Module_O13.txt`
- Git blob: `faeea49a9ef84c29a4989f0bb95197c0d9e9572d`
- HsH dump mirror: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/Module_O13.txt`
- Mirror Git blob: the same `faeea49a9ef84c29a4989f0bb95197c0d9e9572d`; fetched contents are byte-identical.
- The PDF text copy at `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/sat_bigpaper_pdfcopy.txt` is a derivative text witness, Git blob `d50427f21539ca983bc0a1344dc13aa24936c6b5`; it is not the primary module.

The recovered O13 module is unbylined. No raw Nathan user-message UUID establishing authorship was recovered. It is therefore classified as a **historical SAT module artifact**, not Nathan Direct.

### O10 dependency

The relevant O10 dependency is specifically:

- `SAT 4D Theory Work/Module_O10.tex`
- Git blob: `f047267f952872ae72eb91936ac76118ee102f4e`

Do not conflate this chiral-defect module with the distinct `O10.txt` / `O10.tex` mass-squared calibration model. The latter is not the O10 source cited by O13's chiral-loop proof sketch. The existing Loom report already documents the O10 pion calibration and muon holdout failure; this run reuses its calibrated value and does not repeat that audit:

`WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-20261025t21z-o10-pion-muon-parity-001.md`

### Date witness

`SATOBLOC MISC/SAT_FULL_FILE_INDEX.txt`, Git blob `4accca1e0473577d6556715c5bfb9fce78e8ca4d`, records:

- `Module_O10.tex`: Creation Time 2025-06-20 08:15:30.
- `Module_O13.txt`: Creation Time 2025-06-20 08:20:20.
- O13 follows O10 by 290 seconds in that index.

These are archive file-index metadata, not authenticated author-message timestamps or proof of authorship. The separate `MASS SPECTRUM CALCULATION.txt` chronology response (blob `467a0c6a24a6f4f071fc20af438420f69b6abe61`) is secondary and is not substituted for the original modules.

The O10 module references an O5-derived baseline (m_0), but no standalone O5 primary module was located in the bounded archive/index search. The O13-listed deliverables `O13_flavour.lean`, `O13_PMNS.nb`, and `O13_report.pdf` were not found in the bounded SAT/HsH/HSH_RESOURCES search. `O10_torsion.lean` and `O10_fit.nb` were likewise not recovered. Absence from this bounded search is not a proof of global absence.

## 3. Verbatim source structure and exact phase-factor check

O13 gives the diagonal representation matrix

[
U_T=\operatorname{diag}(1,\omega,\omega^2),\qquad
\omega=e^{2\pi i/3},
]

and writes

[
M_\ell=m_0 U_T^k,\qquad k\in\{0,1,2\}.
]

The source calls (U_T) a “3-rep matrix of T”; it does not verbatim call it unitary. Unitarity is a mathematical inference from the unit-modulus diagonal entries under the standard Hermitian norm. The current PR description's “unitary representation matrix” is therefore explanatory wording, not a verbatim source quotation.

For the claimed ordering (k=(2,1,0)), O13 states that

[
|1+\omega^k|=(\sqrt3,1,\sqrt3).
]

Direct exact evaluation gives

[
\omega=-\frac12+i\frac{\sqrt3}{2},\qquad
\omega^2=-\frac12-i\frac{\sqrt3}{2},
]

so

[
|1+\omega^2|=1,\qquad
|1+\omega|=1,\qquad
|1+1|=2.
]

Therefore the actual tuple is

[
\boxed{(1,1,2),\text{ not }(\sqrt3,1,\sqrt3).}
]

The calculation was executed in Python and independently checked against the exact algebra. This is a source-equation consistency result. The historical equation has not been silently edited; any correction must be separately versioned.

## 4. O10/O13 shared-parameter and assignment conflict

O10 gives the scalar mass law

[
m(Q,\tau_\chi)=\frac{m_0}{Q}
e^{-\gamma_\chi\tau_\chi},
]

with source assignments:

[
\tau_\chi(\pi)=1,\qquad
\tau_\chi(\mu)=1,\qquad
\tau_\chi(\tau)=0.
]

O13's proof sketch says the O10 loop dressing has **identical** (\tau_\chi) for all charged-lepton flavours, so the hierarchy must come from phase interference. That is inconsistent with O10's explicit muon/tau assignments; the electron assignment is not supplied in the recovered O10 module.

O13 also claims

[
\frac{m_\mu}{m_e}\sim\sqrt3 e^{\gamma_\chi},
\qquad
\frac{m_\tau}{m_\mu}\sim\sqrt3.
]

The prior Loom O10 audit obtained the pion-calibrated shared value

[
\gamma_\chi=1.247629782886.
]

Reusing, not refitting, that value gives

[
\sqrt3 e^{\gamma_\chi}=6.031139\ldots,
]

whereas the CODATA 2022 recommended (m_\mu/m_e) is (206.7682827(46)). Matching the latter through the O13 formula would require (\gamma_\chi\approx4.782293), not the O10 pion-calibrated value. A different (\gamma_\chi) would be a new/re-fitted parameter and would contradict the shared-universal-parameter reading.

Likewise, (\sqrt3=1.73205\ldots) is not the measured (m_\tau/m_\mu=16.8170(11)); the measured ratio is about 9.7093 times the formula's value.

The O13 table separately lists predictions 206.4 and 17.4. Against CODATA 2022 these have relative residuals approximately -0.1781% and +3.4667%, respectively. The source does not provide prediction uncertainties/covariance sufficient to reproduce its quoted (\Delta\sigma) values; no significance pull is invented here. The table values are not derivable from the displayed formulas with the shared O10 (\gamma_\chi).

## 5. Missing composition and observable maps

The source-level architecture currently has:

- O13 representation: (U_T^k).
- O10 scalar dressing: (Q^{-1}e^{-\gamma_\chi\tau_\chi}).
- O13 phase-interference claim: (|1+\omega^k|).
- Claimed observables: charged-lepton mass ratios and PMNS quantities.

It does **not** provide a consistent, fully specified composition map from those pieces to mass eigenvalues and PMNS observables. A future proposal could define, separately from the historical source,

[
M_{\ell,\mathrm{eff}}
=\mathcal L_k\circ\mathcal D_{O10}(Q,\tau_\chi)
\circ m_0 U_T^k,
]

together with an explicit projection/readout map to singular values or eigenmasses and then to PMNS observables. This is a proposed architecture, not a recovered SAT equation. Because the O10 dressing is scalar, a common scalar factor cannot split the singular values of a unitary (U_T^k); any splitting must come from a specified non-scalar/flavour-dependent operator or another explicit readout mechanism. The source's proposed phase factor is currently numerically inconsistent.

This is the relevant transferable architecture rule for H(s)H: representational structure must be connected to an observable by explicit composition and projection maps, with shared parameters and conditions. It is not a physical equivalence between flavour matrices and worldtubes.

## 6. PMNS test matrix and current fit comparison

### O13's own table

Recomputing its own reported comparison gives:

| Quantity | O13 value | O13 table comparator | Recomputed source-table pull |
|---|---:|---:|---:|
| (\theta_{12}) | 34.6° | 33.45° ± 0.8° | +1.44σ |
| (\theta_{23}) | 45.0° | 49.0° ± 1.4° | -2.86σ |
| (\theta_{13}) | 9.2° | 8.6° ± 0.13° | +4.62σ |
| (\delta_{CP}=\pm90°) | nearest circular difference 73° | 197° ± 27° | 2.70σ under the table's Gaussian interpretation |

The existing Mercer source-fidelity report already identified the (\theta_{23}) and (\theta_{13}) prose/table contradiction. This run adds the circular (\delta_{CP}) check. The module's statement that all PMNS targets are within 2σ is not supported by its own table.

### CODATA 2022 mass-ratio comparator

- (m_\mu/m_e=206.7682827(46)).
- (m_\tau/m_\mu=16.8170(11)).

These are recommended constants, not a fresh raw-data reanalysis. O13 prediction uncertainties are unspecified, so only relative residuals are reported.

### Published NuFIT 6.0

The official NuFIT 6.0 table provides two configurations, IC19 without SK atmospheric data and IC24 with SK atmospheric data. Across both configurations and both mass orderings:

- O13 (\theta_{13}=9.2°) is outside the 3σ range.
- (\theta_{12}=34.6°) and (\theta_{23}=45°) remain inside 3σ.
- The (\delta_{CP}=-90°) branch (270°) is inside the 3σ interval; (+90°) is outside.

The two fit configurations must not be collapsed; their best-fit values and allowed regions differ.

### Global-nu/Bari 2026.a preliminary comparison

The October 15, 2026 preliminary combined fit reports normal ordering favoured at 3.9σ, but its paper/data package is not yet publicly released. Its profile intervals give:

- (\theta_{13}=9.2°): outside 3σ for both NO and IO.
- (\theta_{12}=34.6°): just beyond the 3σ upper edge; sensitive to the source prediction's 0.1° rounding.
- (\theta_{23}=45°): inside 1σ for NO and 2σ for IO.
- (\delta_{CP}=-90°): inside 2σ for NO and 1σ for IO; (+90°) is outside 3σ.

The 2026 result is preliminary and the phase profile is non-Gaussian; interval membership is used rather than an invented Gaussian pull. The source's (\pm90°) leaves a sign branch and mass ordering unresolved. The PDG 2025 neutrino-mixing listing explicitly says its quoted averages are not the result of a global fit, so the O13 label “2025 PDG” is insufficient without an exact fit/table identifier and covariance.

### Test matrix

| Hypothesis/claim | Shared parameter/calibration | Holdout | Observable | Standard comparator | Current status |
|---|---|---|---|---|---|
| O13 phase factors generate the lepton hierarchy | (\gamma_\chi) fixed from O10 pion calibration | (m_\mu/m_e), (m_\tau/m_\mu) | Mass ratios | CODATA 2022 | Formula factors do not reproduce table/data as written |
| O13 discrete assignment uniquely produces PMNS targets | (k=(2,1,0)); no additional fit allowed unless declared | PMNS angles and phase | (\theta_{12},\theta_{23},\theta_{13},\delta_{CP}) | NuFIT 6.0 IC19/IC24; Bari 2026.a preliminary | (\theta_{13}) outside 3σ in all compared configurations; sign/order and some angles remain data-set dependent |
| O10 scalar dressing composes with O13 flavour operator | Shared (m_0,\gamma_\chi,Q,\tau_\chi) | All three charged leptons | Mass eigenvalues and mixing | Explicit operator/readout calculation required | Composition and projection maps missing; (\tau_\chi) assignments conflict |

No joint (\chi^2) is calculated because the model prediction covariance, full observable map, and common fit likelihood are absent. No claim of full-theory falsification is made. The narrower O13 source's claimed phase-factor derivation and “all within 2σ” statement fail as written.

## 7. Lean and CI boundary

Existing Aster PR #1220 remains OPEN / DRAFT / UNMERGED and unchanged.

- Branch: `research/aster-o13-unitary-mass-gate-20261101t1700z`
- PR head: `6a66217979b9caacff06fa407cd9ccd1cdd7999e`
- `AsterO13UnitaryMassGate.lean` blob: `29115ccc65df0ae671f37b06ca80a83e29998e1b`
- Existing CI run: `41330715937`
- Checked source: synthetic PR merge ref `c7b0e836965163a9af06fc0780bf7ed53347e365), not an exact-head-only build.
- Full library build: success, 8,945 jobs; target module built.
- Theorem-specific axiom output: `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx` or `admit` occurrences in the captured log.
- Separate global axiom audit, nanoda, tests and lint were skipped.

The existing theorem is conditional on a norm-preserving map; it does not instantiate the full O13 phase factor, O10 dressing, or mass-to-PMNS projection. The new exact root-of-unity result was executed in Python, **not** Lean. No new Lean theorem is claimed. The current runtime has no `lean`, `lake`, or `elan`; Code Grurple also prohibits an unauthorized research-branch/CI change.

## 8. Repetition check and new contribution

Prior work deliberately reused rather than duplicated:

- Loom's O10 pion-calibration/muon-holdout audit.
- Mercer's O13 table/prose contradiction and missing-deliverable audit.
- Aster's existing scalar-unitary norm gate and A4/order-to-flavour mapping concern.

New additions in this run:

1. Recovered the primary SAT-archive O13 module and established exact identity with the HsH dump mirror.
2. Added the archive-index chronology linking O10 and O13.
3. Evaluated (|1+\omega^k|) exactly and found the claimed tuple wrong.
4. Connected O13's shared-(\gamma_\chi) formula to the already-calibrated O10 value and current CODATA ratio.
5. Identified the direct O10/O13 (\tau_\chi) assignment conflict.
6. Added circular (\delta_{CP}) re-evaluation and current NuFIT/Bari fit-range comparison.

## 9. Reproducibility and next steps

Local, non-repository calculation artifacts:

- `/mnt/data/aster_o13_o10_cross_module_audit.py`
  - SHA-256: `d4d100fd5afd721fa4e9129986b5dd5d3eac72d9907f64bdd7a95db3efaf7aa2`
- `/mnt/data/aster_o13_o10_cross_module_audit.json`
  - SHA-256: `ea8006b04e885e496662e41ec348c61840f98c0450c26391e904a8a0726c9c3c`

The script was executed from disk and its JSON output checked. It uses standard Python only. It is a one-off reproducibility artifact, not a new project tool or dependency.

Next source/math work, when the relevant review/write gate permits:

1. Recover the actual O5 source for (m_0).
2. Recover or definitively disposition the O13/O10 listed Lean/Mathematica/PDF deliverables.
3. Keep the historical O10 and O13 equations verbatim; place any corrected equation in a separately dated proposal.
4. Specify the scalar-dressing/flavour-operator composition and the projection to mass eigenvalues and PMNS observables.
5. Formalize the exact root-of-unity calculation and the complete operator map in Lean, then compile and run on the exact PR head with global audit/tests/lint enabled.
6. Calibrate only on the declared pion channel and hold out the charged-lepton ratios and PMNS data; do not re-fit the holdout.

No PR, manuscript, public issue, task, BEDROCK theory entry, or paper gate was changed.

## 10. Unrelated reading and controls

Completed the scheduled unrelated reading break in Charles Babbage, *The Decline of Science*, lines 921–960. Next cursor: line 961. FIE's last full review remains October 27; the fourteen-day re-review is due November 10.

All four Mersearch request lanes remain occupied. No new Mersearch request was submitted or overwritten. The incoming optional Loom handoff was read; it did not change Aster's remit.

**Next deterministic worker:** Ariadne. Any handoff is optional context only, with no task, ownership transfer, or response obligation.

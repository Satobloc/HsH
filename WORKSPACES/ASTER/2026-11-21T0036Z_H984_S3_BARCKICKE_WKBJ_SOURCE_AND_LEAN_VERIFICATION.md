# Aster h984:s3 | Barckicke WKBJ bracket reproduction and source/Lean verification addendum

**Classification:** SOURCE-PARAMETER REPRODUCTION / EXACT-PR-HEAD-BUILD-VERIFIED / NO-RAW-DATA-REANALYSIS / NO-H(s)H-PREDICTION.

## 1. Rotation and historical authority

- h = 984; seq = 5(984)+3 = 4923; 4923 mod 19 = 2.
- Selected ring label: **Aster**, index 2.
- Next ring label: **Ariadne**, index 3.

Historical source recovered: conversation ASTER, ID 6ab006ce-e358-83ea-b3dd-7b23a26c00fa, raw export blob 1bf6e65c4ac1650297acb67d7e39f700454a03c8, 1,818 mapping nodes and 39 direct user messages. Three role-defining messages establish the source-fidelity and contradiction-checking remit: d15369d1-1412-4f4a-9460-702d2de573ea, 01505af7-37cd-491f-a951-1822934e36ff, and 9692a139-289c-4aae-b91f-745dbd8431f7. No separately signed specialist charter or authenticated current Aster thread was established. This is assistant reconstruction, not historical-instance participation.

The historical Paper A review assignment remains protected under P0. No Paper A manuscript or presentation work was performed.

## 2. Substantive improvement

I independently reproduced the first-order WKBJ broadening estimate used by the existing Kestrel Kelvin-vortex readout formalization. This supplies the numerical premise for an existing conditional Lean theorem and makes its source inputs, units, uncertainty status, and fit/prediction status independently inspectable.

This is a source-parameter reproduction of a published standard-fluid estimate, not a raw-data reanalysis, not a new H(s)H prediction, and not an independent measurement.

## 3. Primary source and input provenance

Primary source: Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” Nature Physics 22, 409–414 (2026), DOI 10.1038/s41567-026-03175-w. The article identifies a Figshare data package, DOI 10.6084/m9.figshare.30903347. Raw Figshare files were not downloaded in this run.

The rendered Methods page 6 gives the WKBJ estimate and these nominal inputs:

| Quantity | Value | Meaning |
|---|---:|---|
| k0/(2π) | 25 m⁻¹ | Typical wavenumber used in the estimate |
| δa | 1.0 mm | Typical axial core-radius variation, not measurement noise |
| a0 | 1.9 mm | Measured mean core radius |
| γE | 0.5772156649… | Euler–Mascheroni constant |
| Typical contour measurement uncertainty | 0.1 mm | Measurement uncertainty, not δa |

**Source-rendering correction:** the PDF text layer/search extraction drops the leading “2” and renders the wavenumber as 5 m⁻¹. The rendered Methods page shows 25 m⁻¹. The Kestrel Lean module's source comment correctly directs readers to the rendered page rather than the lossy text layer. Using 5 would not reproduce the article's stated estimate.

The article's measurement operator uses the two opposing contour radii r+ and r−:

- η = (r+ − r−)/2, the axis-position/displacement channel.
- a = (r+ + r−)/2, the mean-radius channel.

The Nature paper distinguishes the m=1 bending/displacement contribution from the radius channel containing m=0, 2, 3, and higher contributions. Thus m=2 flattening belongs to the radius channel in this measurement description. The two-point transform is invertible for the sampled pair (r+, r−); it is not a reconstruction of the complete angular contour.

## 4. Reproducible calculation

The paper's first-order relation is:

\[
B = 2\ln\left(\frac{2}{k_0a_0}\right)-1-2\gamma_E,
\qquad
\frac{\Delta k}{2\pi}
=
\frac{k_0}{2\pi}\frac{\delta a/a_0}{B}.
\]

Using the source-reported nominal inputs:

| Derived quantity | Result |
|---|---:|
| k0 | 157.0796326795 m⁻¹ |
| k0a0 | 0.2984513021 |
| δa/a0 | 0.5263157895 |
| B | 1.6501600343812168 |
| Δk/(2π) | 7.97370828446715 m⁻¹ |

The nominal B lies inside the Lean theorem's conditional interval (1.650, 1.651), and the derived broadening lies inside its consequent interval (7.9, 8.1) m⁻¹. A 50-digit mpmath cross-check gives B = 1.650160034381216984773… and Δk/(2π) = 7.973708284467148983… m⁻¹.

The script uses only Python's standard library. It is preserved at:

- WORKSPACES/ASTER/2026-11-21T0036Z_H984_S3_BARCKICKE_WKBJ_BRACKET_REPRODUCTION.py
- WORKSPACES/ASTER/2026-11-21T0036Z_H984_S3_BARCKICKE_WKBJ_BRACKET_REPRODUCTION.json

Script SHA-256: 1d794827060b0c98091dfe528f6287572b9d59dc2122cf4dadf5c49604904c15.

Result JSON SHA-256: e1fec03f8ef4a17f18d8d082f6ef6de336638a0846879cf8753d46c4fe36fb37.

**Uncertainty limit:** the paper gives a typical contour measurement uncertainty of 0.1 mm, but δa is a physical axial radius variation, not a noise term. The source does not provide a separate uncertainty for the 1 mm δa used in this rough estimate. No uncertainty interval for B or Δk was therefore propagated. The narrow Lean interval is verified for nominal source inputs only; it is not an uncertainty-bounded confidence interval.

## 5. Lean verification

Existing Kestrel PR #873 was checked rather than modifying Kestrel's branch.

- Current PR head: 94b6d96c91806a95505260a3c52220f4af294185.
- Exact-head Actions run: #44090154878.
- Build job: 134062868110.
- The workflow's exact PR-head checkout assertion passed; the checked-out HEAD was 94b6d96c91806a95505260a3c52220f4af294185.
- Lean 4.34.0 / Lake 5.0.0.
- Full formal-library build: SUCCESS, 8,956 jobs.
- KestrelKelvinVortexReadout, KestrelProjectedIncidence, KestrelIntersectionDimensionGate, and KestrelMovingSlice compiled.

The readout inverse, one-sided non-injectivity result, projection/readout factorization, and conditional WKBJ broadening theorem are compiled. The WKBJ theorem remains conditional on the bracket interval: the logarithmic bracket itself is supplied by the Python calculation, not proved by Lean.

The theorem-specific axiom output includes propext, Classical.choice, and Quot.sound. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped. No global no-sorry claim is made. PR #873 remains OPEN / DRAFT / UNMERGED.

The old Kestrel h979 report's “no physical calculation” status is refined: a source-parameter arithmetic reproduction now exists, but raw-data reanalysis and independent measurement remain absent.

## 6. Cross-paper source boundary

The follow-up PRL paper, “Experimental evidence of Kelvin-wave turbulence along a vortex core,” DOI 10.1103/t3bt-m431, has an accessible abstract but its full article text requires authorization. The accessible primary record does not expose its measurement operator or full data statement. Therefore the cross-paper mode-channel statement in the Kestrel Lean module remains **UNVERIFIED_BY_ACCESSIBLE_PRIMARY_TEXT** in this run. Do not assume the PRL paper uses the same two-point operator or the Nature Figshare dataset. This is an access/provenance limitation, not evidence that the PRL claim is wrong.

The Nature article's fit of circulation Γ and axial velocity vz to dispersion data, followed by an a-posteriori PIV/PTV comparison, is fit-conditioned validation rather than a blind holdout. The WKBJ broadening estimate is a separate first-order source-parameter estimate. Neither is an H(s)H prediction.

## 7. H(s)H implications and test readiness

The classical air-water vortex is a measurement-method comparator, not a physical equivalence to an H(s)H filament or worldtube.

It demonstrates a source-defined finite-core readout with separable displacement and radius channels. It does not establish a map from H(s)H intrinsic thickness, twist, or contact structure to η or a. No such H(s)H measurement operator, candidate family, shared parameter set, calibration/holdout split, or falsification threshold is available.

| Test element | Current status |
|---|---|
| Measured system | Controlled air-water vortex |
| Source dataset | Nature Figshare DOI identified; raw files not downloaded |
| Standard comparator | Paper's Kelvin-wave dispersion/WKBJ treatment |
| Source-parameter estimate | Reproduced: Δk/(2π) ≈ 7.974 m⁻¹ |
| Calibration/holdout | None in this reproduction |
| H(s)H observable map | Missing |
| H(s)H prediction | None |
| Independent measurement | None |
| P2 disposition | HOLD |

No numerical core thickness, twist field, contact law, or new physical primitive is inferred. No P2 advancement or BEDROCK promotion.

## 8. Mersearch, tooling, and project safeguards

No geometry Mersearch query was run. All four canonical request lanes remain non-reusable: three still have requested records without a verified output, while lane 2 has a completed output for an unrelated “nexus” query but its request record remains requested and its terminal run identity is unreconciled. That output was not used as a geometry search. No lane was overwritten, retriggered, released, or reused.

The local runtime has no HsH checkout and no Lean/Lake executable. Existing GitHub PR/Actions verification was reused. Math Hopper #578 / PR #991 and the existing Whirligig derivative-path commutator were inspected; neither supplies a missing source-to-H(s)H map for this calculation. SciSpace is available but no additional literature search was needed beyond the primary papers. No new dependency, tool, fork, subscription, or expense.

FIE was last fully reread November 20; next review December 4. The unrelated-reading cursor remains at SAT archive line 2481; no duplicate break was performed.

Project status unchanged: P0 ACTIVE; P1 Orson cognition OVERDUE / NOT READY / ORSON-owned; P2 HOLD; P3 INCOMPLETE. November 9 minor gate MISSED; November 30 major gate HOLD; December 14 full-theory gate INCOMPLETE.

No SAT-O or Blockwave equation was modified. No task, ID, schedule, cadence, prompt, or phase was changed. The existing :36 automation remains enabled and unchanged; no sixth task. The next ring label is Ariadne, but the successor run had already started, so no handoff packet or direct-thread delivery is claimed.

**Final pin:** H984:S3 / ASTER-ASSISTANT-RECONSTRUCTION / BARCKICKE-WKBJ-SOURCE-PARAMETER-REPRODUCTION / B-1.6501600343812168 / DELTAK-OVER-2PI-7.97370828446715-MINV / KESTREL-PR873-EXACT-HEAD-LEAN-PASS / WKBJ-BRACKET-EXTERNAL-PYTHON-NOT-LEAN / PRL-CHANNEL-SEAM-UNVERIFIED / RAW-FIGSHARE-NOT-DOWNLOADED / NO-HSH-PREDICTION / P2-HOLD / TASKS-UNCHANGED / NO-SIXTH-TASK.

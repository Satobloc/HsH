# Aster h950:s2 | GW150914 source genealogy, timing-delay semantics, and dependence audit

**Nominal slot:** 2026-11-19T14:24Z  
**Run key:** REVROT3-19-20261011:950:s2  
**Ring selection:** h=950; seq=5h+2=4752; index 2 = Aster; next index 3 = Ariadne.  
**Disposition:** source-fidelity audit of the existing GW150914 P2 candidate. This is not a new physical-system selection, an H(s)H prediction, or a formal Paper A review.

## Executive result

GW150914 was already present in P2 before the November 19 timing-delay addition. The October 28 P2 tracker comment records a GW150914 area-law candidate. The November 19 Mercer update adds a different observable channel, the H1/L1 arrival-time delay, to that existing event family. It is not a new physical system and it is not an independent experimental replication.

The reported 6.9 ms delay is a derived event-level estimate from the same H1/L1 strain record. The GWOSC figure caption uses it to shift and invert H1 for visual comparison. Its asymmetric bounds, +0.5/-0.4 ms, are not assigned a confidence or coverage level in that caption. The page's 90% credible intervals for source parameters and waveform reconstructions must not be silently transferred to the delay.

A source-recovery check found an older Electrogravacoustics table row for LIGO GW150914: wavelength 3.0×10^6 m at 100 Hz, with “Null Baseline / Braid Smoothed” and Q=3A labels. The table's column heading makes wavelength the natural reading. The value is consistent with the standard wavelength c/f at 100 Hz, not a demonstrated H1/L1 baseline or an H(s)H prediction. Its citations point to internal archive artifacts, not a recovered primary LIGO source. Authorship of the table is unresolved.

A scripted calculation using versioned LALSuite 7.26 H1/L1 detector coordinates reproduces the baseline and the projection implied by the published delay. It is a source-reproduced geometry check, not a raw-strain reanalysis. The H1/L1 HDF5 files and O1 calibration uncertainty archive were not acquired in this run.

## 1. Aster authority, historical source, and thread boundary

The historical Aster conversation is 6ab006ce-e358-83ea-b3dd-7b23a26c00fa, raw-export Git blob 1bf6e65c4ac1650297acb67d7e39f700454a03c8. The source-verified continuity record reports 1,818 mapping entries, 1,817 message-bearing nodes, 39 outer user-role messages, and 455 nodes / 19 user-role messages in the relevant ancestry.

The direct user-role messages recorded in NEW_INSTANCE_START_HERE.md are:

- 2026-09-22T05:37:41.366Z, d15369d1-1412-4f4a-9460-702d2de573ea: “Does this read like Nathan? Would Nathan say it this way? Has Nathan said any of this in this or another way? Does this contradict anything Nathan has already said?”
- 2026-09-22T19:03:08.093Z, 01505af7-37cd-491f-a951-1822934e36ff: historical Paper A review assignment.
- 2026-10-11T12:00:14.494Z, e3067f7b-f1c2-45fb-ab98-075d4a798ae5: a narrowly scoped prior-art-review-team clarification in response to a specific retroactivity question, not a blanket access grant.

There is no standalone signed specialist charter. The historical remit supports source fidelity, contradiction checking, and chronology. The live Code Grurple roster controls current operations: Aster remains REVIEW FROZEN / CROSS-READ OPEN. No Paper A/B manuscript review was opened.

The raw export was re-fetched by the large-file contents endpoint during this run, but the endpoint returned an empty content body. No fresh raw-message parse is claimed. The direct-message locators above are carried from the prior source-verified raw-graph audit and the current Aster start document.

The archived Aster conversation is not active. The separate November 8 geometry conversation 6aecede1-4c08-83e9-abc4-da64f59a4f51 is only a manual-thread candidate with current usability unverified. No authenticated current Aster thread or cross-thread delivery is claimed. This is a source-grounded assistant reconstruction, not historical Aster-instance speech or an independent first-blush.

## 2. Internal P2 genealogy: same event, additional observable channel

P2 tracker issue #565 already contained a GW150914 area-law candidate in its October 28 comment #6465461293. The November 19 Mercer update is comment #7011448278; its calibration-covariance clarification is #7011593893. The current update should therefore be typed as:

**EXISTING_GW150914_EVENT / ADDITIVE_ARRIVAL_TIME_OBSERVABLE / NOT_NEW_PHYSICAL_SYSTEM / NOT_INDEPENDENT_EXPERIMENT.**

The area-law, QNM/ringdown, horizon-shell, and arrival-time discussions concern the same September 14, 2015 event. Different estimators or published reanalyses may provide methodological cross-checks, but they do not create independent experimental replications of the event. The arrival-time channel and waveform-derived source parameters share the H1/L1 event and detector calibration lineage.

The November 19 timing addition is useful because it adds a distinct scalar timing constraint. It must not be counted as a second event or as independent confirmation of an H(s)H prediction.

## 3. The older Electrogravacoustics table: prior artifact, not validated event mapping

The SAT archive contains the same ELECTROGRAVACOUSTICS concept-file blob at four paths:

- 2026/ELECTROGRAVACOUSTICS.txt
- SAT 2026 CONCEPTS/2026 NEW — ELECTROGRAVACOUSTICS.txt
- [[SAT26 TOOLBOX]]/2026 NEW — ELECTROGRAVACOUSTICS.txt
- SAT 2026 ROUNDUP DOCS/2026 NEW — ELECTROGRAVACOUSTICS.txt

All four are blob 4085e071d4804fd3313a0c01a7ca7e9aa62d76dd, 2,033 lines / 173,211 characters. They are duplicate storage paths, not four independent sources.

The episode-page/SRT export is likewise duplicated at two paths with one blob, 11f1c1e3dd472c946ce48fcadbade95ee94b17aa. Its metadata says “Electrogravacoustics 1”, 43 minutes, published May 9, 2026 at 6:35 PM, with the description “A tentative systemic worldline-based unification.” The page says transcripts and chapters are automatically generated and editable. This is an episode-page export, not a speaker-attributed raw conversation or authenticated transcript of every statement. No raw audio or underlying conversation ID was recovered.

The concept-file table at lines 1713-1823 has these columns: Phenomenon Name, Physical Regime, Wavelength (Λ), Frequency (f), Inclination Angle (θ4), Filament Scale (N or Q), Geometric Phase State, and Source. Its GW150914 row at lines 1814-1823 reads:

- LIGO GW150914
- Gravitational
- 3.0×10^6 m
- 100 Hz
- Variable (Torsion Gradient)
- Q=3A
- Braid Smoothed
- [2], [6]

The same row is partially corrupted in the episode-page/SRT export: the leading “3.” is lost and appears as “0×10^6 m”. The concept file is the better text witness for the table value, but neither file establishes authorship or derivation.

The concept-file source list identifies [2] as The_4D_machine_replacing_quantum_dice.m4a and [6] as “Pasted Text”. These are internal archive locators. No primary LIGO paper or GWOSC dataset is identified in those two references. The audio and the exact Pasted Text source were not recovered in this bounded pass. The row is therefore an archive artifact with unresolved authorship and unresolved citation support, not Nathan Direct, not a standard reference, and not a measured GW150914 result.

The table heading resolves one important ambiguity: 3.0×10^6 m is in the Wavelength column, paired with 100 Hz. The standard SI relation gives:

\[
\lambda_{100}=\frac{c}{f}
=\frac{299\,792\,458\ \mathrm{m/s}}{100\ \mathrm{Hz}}
=2\,997\,924.58\ \mathrm{m}.
\]

This rounds to 3.0×10^6 m. It should not be relabelled as the H1/L1 baseline merely because that detector baseline is also approximately 3.0×10^6 m. The table's citations do not establish that it was derived from detector geometry.

## 4. GWOSC event and data provenance

Primary event source: [GWOSC GW150914 event page](https://gwosc.org/events/GW150914/), event-data DOI 10.7935/K5MW2F23. The page identifies H1 and L1 and reports that the signal arrived first at L1, then 6.9 ms later at H1, with displayed asymmetric bounds +0.5/-0.4 ms.

The same figure caption says that, for visualization, H1 is shifted by this amount and inverted. This is a display alignment of the two strain series, not a second observation. The page's Table I source-parameter values and waveform-reconstruction bands are described as 90% credible intervals/regions. The delay caption does not assign those bounds a 90% credible or 1σ interpretation. Preserve the delay's coverage semantics as UNSPECIFIED_BY_THIS_CAPTION.

The event page shows the signal sweeping through approximately 35-250 Hz. The 100 Hz in the older Electrogravacoustics table is within that band, but the table does not identify it as a unique measured event frequency. Treat it as a selected/representative row value unless its original source is recovered.

The event page provides 32-second H1/L1 strain files at 4,096 Hz and 16,384 Hz, plus longer 4,096-second segments. The 32-second 4,096 Hz version-2 files are:

- H-H1_LOSC_4_V2-1126259446-32.hdf5
- L-L1_LOSC_4_V2-1126259446-32.hdf5

The event data page says version 2 uses C02 calibration and corrects an approximately 1 ms timing offset present in the version-1 4,096 Hz files. That offset is larger than the event-page delay bounds of 0.4-0.5 ms, so version 2 is mandatory for any timing reanalysis. The 4,096 Hz and 16,384 Hz files are derived from the same 16 kHz source data; the 32-second and 4,096-second products are separately decimated, with small filter-related differences. They are not independent measurements or independent event replications.

Data-quality and injection bitfields are supplied at 1 Hz. They must be checked over the exact event window before any sample-level analysis. No DQ or injection flag was inspected in this run.

Raw-data acquisition was attempted using the official H1/L1 version-2 file links, but the runtime download and URL retrieval failed with a network/DNS error; the web binary fetch also did not yield readable file bytes. No HDF5 bytes were acquired, hashed, or parsed. The public DOI and filenames are locators, not an acquisition receipt.

## 5. Timing projection reproduced from versioned detector geometry

Standard reference: [LALSuite 7.26 detector constants](https://lscsoft.docs.ligo.org/lalsuite/7.26/lal/group___detector_constants.html), with the H1/L1 vertex coordinates in Earth-centered coordinates.

H1 4 km vertex, metres:

\[
\mathbf r_{H1}=(-2161414.92636,\,-3834695.17889,\,4600350.22664).
\]

L1 4 km vertex, metres:

\[
\mathbf r_{L1}=(-74276.0447238,\,-5496283.71971,\,3224257.01744).
\]

Using the baseline \(\mathbf b=\mathbf r_{H1}-\mathbf r_{L1}\):

\[
\mathbf b=(-2087138.8816362,\ 1661588.54082,\ 1376093.20920)\ \mathrm{m},
\]

\[
B=\|\mathbf b\|=3\,001\,775.759551\ \mathrm{m}.
\]

With exact SI speed of light \(c=299\,792\,458\ \mathrm{m/s}\), the maximum plane-wave intersite light-travel time is:

\[
B/c=10.012846152\ \mathrm{ms}.
\]

For the reported delay \(\Delta t=6.9^{+0.5}_{-0.4}\ \mathrm{ms}\), the magnitude of the baseline projection is:

\[
|\,\mathbf b\cdot\hat{\mathbf n}\,|=c|\Delta t|
=2\,068\,567.960\ \mathrm{m}.
\]

Direct conversion of the source-reported asymmetric bounds gives:

- lower endpoint, 6.5 ms: 1,948,650.977 m = 1,948.651 km.
- central value, 6.9 ms: 2,068,567.960 m = 2,068.568 km.
- upper endpoint, 7.4 ms: 2,218,464.189 m = 2,218.464 km.

The corresponding projection fraction is:

\[
\frac{c\Delta t}{B}=0.68911475,
\]

with endpoint fractions 0.64916607 and 0.73905060. These converted endpoints inherit the source's unspecified coverage semantics. They are not standard uncertainties or a newly computed credible interval.

This is one scalar projection constraint. It does not determine the full source direction or sky position. With two detector sites, the timing relation leaves a ring/annulus of possible directions before antenna-pattern, waveform, polarization, and other information are included. The published sky maps and their 90% credible regions are separate posterior products.

The near equality \(B\approx\lambda_{100}\) is numerical, not an identified H(s)H relation:

- \(B=3.001776\times10^6\) m.
- \(\lambda_{100}=2.997925\times10^6\) m.
- \(B/\lambda_{100}=1.00128462\), a 0.12846% difference.
- The timing projection is \(0.6891B\), not \(B\).

No sky direction, source worldtube, or H(s)H parameter was inferred from this comparison.

## 6. Independent analysis versus independent measurement

Naselsky et al., JCAP 2016, [DOI 10.1088/1475-7516/2016/08/029](https://doi.org/10.1088/1475-7516/2016/08/029), report a cross-correlation analysis yielding approximately 6.9±0.4 ms using 4,096 seconds of H1/L1 data. This is a separate analysis method applied to the same GW150914 event and strain lineage. It is a methodological cross-check, not an independent experimental replication.

The GWOSC 32-second/4,096-second and 4,096/16,384 Hz products are also not independent measurements. They are differently segmented or sampled products from the same underlying detector data.

## 7. Calibration and uncertainty lineage

The official [LIGO-P1500248-v15 calibration paper](https://dcc.ligo.org/P1500248/public) describes the calibration of detector readout into equivalent gravitational-wave strain. Its response model depends on opto-mechanical response and feedback control. The paper reports calibration uncertainty below 10% in magnitude and 10 degrees in phase across 20 Hz to 1 kHz.

The post-review change log adds covariance treatment for q^(stat), q^(fdcf), q^(tdcf), and q^(fdcf,fit), and modifies the associated covariance equations. These are not reducible to a single scalar percentage.

The [LIGO-T2100313-v3 calibration uncertainty archive](https://dcc.ligo.org/T2100313/public) contains O1/O2/O3 uncertainty estimates. Its README describes hourly, frequency-dependent complex calibration errors with ±1σ uncertainty information. The O1 archive is a 12.2 MB tarball containing FinalResults files. The event-time H1 and L1 hourly files must be selected and propagated through the timing estimator.

Neither calibration archive nor the raw strain files were downloaded. The event-page delay bounds were not re-estimated with calibration covariance. No uncertainty propagation, fit, waveform analysis, or holdout test was performed.

## 8. Nathan Direct, standard GR, assistant reconstruction, and missing H(s)H map

Nathan Direct sources recovered for this lane:

- The current Lane 24 instruction requires actual measured systems, source/version, units, uncertainty, and prediction-versus-fit separation.
- The 2026-10-29 direct statement says time wavefront/wavesheet first, with a graviton only a possible timesheet soliton, not a primary assumed object.
- The 2026-11-08 Primary Operational Guideline prefers worldtube where finite extent matters, treats the timesheet as complementary, and retains a responsive medium only provisionally. It explicitly requires the primitive roles and maps to be defined.

No GW150914-specific Nathan Direct equation or source-to-observable map was recovered in the bounded HsH/SAT archive search. Mersearch was not callable in this runtime, and HSH_RESOURCES private payload was not searched.

The following chain is a standard-GR/measurement comparator and assistant reconstruction, not Nathan Direct:

\[
\text{binary source model}
\to h_{\mu\nu}
\to \text{detector response}
\to \text{calibrated H1/L1 strain}
\to \text{arrival-time / waveform observables}.
\]

The event data do not directly observe a source worldtube or timesheet. The source geometry and waveform are modelled/inferred; the detector strain is the measured observable.

The H(s)H composition remains undefined. Required maps include:

1. A typed source worldtube/worldline domain and its boundary/initial data.
2. A source-geometry to propagating-field map, with gauge and boundary conditions.
3. A field-to-detector response map, including detector arm tensors and site geometry.
4. A calibration and data-quality map to the observed strain.
5. A covariance-aware map from calibrated strain to the delay and waveform observables.
6. A reverse map with its non-uniqueness and gauge/observer limitations.
7. A separate H(s)H map from worldtube/timesheet/responsive-medium primitives to the standard GR field and measured strain.

No equation for these maps was recovered from Nathan Direct or the historical SAT-O/Blockwave originals. No equivalence is asserted. No graviton ontology is assumed.

## 9. Lean proof triage

Existing relevant formalization: [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873), head 94b6d96c91806a95505260a3c52220f4af294185. Exact-head Actions run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878), job 134062868110, succeeded with Lean 4.34.0/Lake 5.0.0 and 8,956 build jobs. The modules KestrelProjectedIncidence and KestrelKelvinVortexReadout compiled. The theorem downstream_readout_cannot_restore_coarse_collapsed_pair has no reported axiom dependencies in its theorem-specific output.

That theorem supports the general statement that downstream processing cannot recover distinctions already collapsed by a non-injective projection. It does not prove the GW150914 dot-product timing relation, the source-to-field map, detector response, calibration, or H(s)H physics.

The conditional geometry bound \(|\mathbf b\cdot\hat{\mathbf n}|\leq\|\mathbf b\|\), for unit \(\hat{\mathbf n}\), follows from Cauchy-Schwarz. It is a possible small Lean target using the actual H1/L1 baseline constants, but it was not compiled in this run. The exact detector timing relation and the full H(s)H composition remain unformalized. No local Lean/Lake/Elan executable is installed in this runtime. No new theorem, module, PR, or branch was created.

## 10. Current gate and next admissible step

- P0 Code Grurple remains ACTIVE. Tern retains P0 reconciliation/release authority.
- P0 PR #2009 remains open, draft, and unmerged. At main commit 663c51a3390953e87e24088ec97a4ccd5bc0098a it is 3 commits ahead / 864 behind. No P0 source, manuscript, PDF, route, or deployment was changed.
- P2 issue #565 remains HOLD. GW150914 remains an existing candidate family with an additive timing observable, not a newly selected physical system.
- The November 16 P2 provenance/baseline/uncertainty gate remains incomplete because raw data and calibration uncertainty files were not acquired. November 23 draft/review and November 30 final gates remain separate.
- P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned. P3 full-theory paper remains INCOMPLETE. The November 9 minor gate remains missed.
- FIE last full review was November 10; next review November 24, so the 14-day trigger is not yet due.
- Aster's unrelated-reading cursor is line 2001 in the SAT archive fun-break file; no new reading quantum was due or claimed.
- All four Mersearch request lanes remain requested/occupied. No request was overwritten or retriggered.
- HsH main pre-write head observed: 663c51a3390953e87e24088ec97a4ccd5bc0098a. SAT archive main: fec8700f9b1a2f59612e5450161fd0875b6b1308. HSH_RESOURCES front door and AI navigation were read; no private payload was opened.
- No paper gate advanced, no theory was promoted, no physical prediction or independent measurement was made, and no CODATA numerical comparison was performed. Only exact SI c was used.

**Next admissible data step:** acquire and hash the four version-2 H1/L1 32-second strain files, the exact event-time O1 H1/L1 calibration uncertainty files, and the 1 Hz DQ/injection flags. Then reproduce the published delay with a frozen estimator and calibration covariance. Only after that can a source-locked forward map or independent holdout be considered.

## 11. Relay and continuity

No prior report or receipt for run key REVROT3-19-20261011:950:s2 was found. No incoming handoff addressed to this run key was found in Aster INBOX.

The next ring label is Ariadne, index 3, corresponding to h950:s3. Any successor packet is optional repository context only. No task, review obligation, ownership transfer, or cross-thread delivery is implied.

The existing :24 relay task remains enabled with its exact task ID, hourly schedule, phase, and prompt unchanged. No sixth task was created. No signet or conversation name was changed.

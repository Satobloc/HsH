# H902:S3 | Local vortex-mode alias, quarter-turn augmentation, and full-pipeline scope

**Run key:** `REVROT3-19-20261011:902:s3`  
**Nominal slot:** 2026-11-17T14:36Z  
**Ring selection:** Nadir Voss, index 10; successor Enheduanna, index 11.  
**Status:** SOURCE-CONDITIONAL FORMALIZATION ADDED / CORRECTED-HEAD EXACT-SOURCE LEAN PASS / P2 HOLD / NO PHYSICAL RESULT.

## 1. Identity, source authority, and preflight

The fixed-ring calculation is (h=902), (seq=5h+3=4513), (4513mod19=10). This selects the Nadir Voss **ring label**, not an authenticated historical instance or ChatGPT thread.

The raw HsH conversation export `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/26.06.23•26.10.01•Quantum Gravity and Experiments — raw.json` was read at three direct-user message IDs: `bb8ecf64-8863-4ee7-a078-ca8cc4104974` (2026-10-01T20:56:07Z), `11122adb-75c5-4418-9b59-29730a034811` (21:07:30Z), and `de178e6a-d223-4ad1-9bc9-d37f178f8b21` (21:20:56Z). The first explicitly assigns **Ravel**, not Nadir, to the historical :36 finite-core/worldtube/particle-geometry/intersection/deformation/nesting remit. The other two authorize an independent sandbox and a trial-Lagrangian challenge. They do **not** name or appoint “Nadir Voss.” That label and the detailed Nadir finite-core/SO(4) specialization remain assistant-generated workspace structure; no standalone Nathan-authored Nadir specialist charter or authenticated current Nadir thread was found. This run follows the live Lane Charter 36 supplied in the current instruction, while preserving the historical attribution distinction.

Read before work: live BEDROCK; October 26 Steering Charter, Phase Steering and Three Paper Campaign; three-repository onboarding; revival rotation V3/V4, thread-first routing and duplicate-run-key guard; current task graph, PWH queue, automation roster; Nadir README, CURRENT_WORK, INBOX and prior h895:s0 receipt/report; the latest Nadir Lane 36 and P2 gate reports; current main and PR #1189 branch state. HsH, SAT archive and HSH_RESOURCES front doors were checked. HSH_RESOURCES was limited to its root README; no private payload was opened. Nadir has no BOOT.md in the current workspace.

The current main snapshot at preflight was `8b2b2f0662504896d8fe46e9d6ad1c9b74f47c91`. The existing Nadir formalization remains PR #1189, stacked on `research/nadir-gpb-joint-covariance-bound-20261027t1312z`, not integrated into main.

No callable Mersearch action was present in this runtime. All four canonical Mersearch request files still read `requested`; their request-scoped `RUN_MANIFEST.json`, `SEARCH_RECEIPT.json` and `SEARCH_RECEIPT.md` paths returned 404. No request was overwritten, released or retriggered. This is not a Mersearch search result and does not establish why the bridge has not produced the expected records.

## 2. Substantive improvement: a phase-robust extra sample for the reduced readout

The existing `NadirVortexTwoChannelReadout.lean` module formalizes a local two-antipode reduction of the source paper's single-harmonic radial ansatz:

\\[
r_m(\theta)=a_0+\varepsilon\cos(\phi+m\theta).
\\]

The two antipodal samples at (\theta=0,\pi) are transformed into a displacement/radius pair. The existing theorem states that the (m=1) and (m=2) reduced readouts coincide exactly when (\varepsilon\cos\phi=0). Thus the two-scalar reduction has a nodal blind spot even when the harmonic amplitude is nonzero.

A new assistant-proposed augmentation was added on the existing PR #1189 branch:

[
R'_m=(R_m, r_m(\pi/2)).
]

The new theorem `quarterTurn_resolves_nodal_one_two_alias` states:

- Assume (\varepsilon\ne0).
- If the existing antipodal readouts for (m=1) and (m=2) are equal, then (\cos\phi=0).
- From (\sin^2\phi+\cos^2\phi=1), (\sin\phi\ne0).
- At (\theta=\pi/2), the (m=1) and (m=2) radial samples differ by (-\varepsilon\sin\phi\), so they cannot remain equal.

The companion theorem `antipodalQuarterReadout_separates_one_two` states that the augmented readout separates these two modes for every phase whenever (\varepsilon\ne0), under the declared single-harmonic ansatz.

This is a **conditional measurement-design result for the reduced pointwise readout**. The quarter-turn sample is proposed, not claimed to have been acquired by the published experiment. It is not a new H(s)H prediction and does not invalidate the paper's full spatiotemporal analysis.

## 3. Actual measured system and source boundary

The relevant primary source is Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). The cited data deposit is Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).

The paper describes an air–water bathtub vortex with a finite air core. Its Methods report 300 fps acquisition over 30 s, a 12.5 cm axial observation window, 60 µm/pixel calibration, a 0.5 mm contour width, and approximately 0.1 mm uncertainty in contour position/core radius. PIV uses a 37×23 grid at 2.7 mm spatial resolution, with circulation uncertainty 0.005 m²/s; PTV axial-velocity uncertainty is 0.05 m/s.

Crucially, the full paper pipeline is richer than the two-scalar theorem: it retains left/right spatiotemporal profiles, forms (\eta(z,t)) and (a(z,t)), and analyzes their two-dimensional Fourier spectra. The local (m=1/m=2) alias theorem applies only to the reduced two-antipode readout at a fixed ((z,t)); it is not a counterexample to the paper's full profile/Fourier mode analysis.

The Methods identify a Basler side-view camera normal to the vortex axis, using two lenses, and a separate Phantom top-view camera for PIV. Results refer to “two orthogonal cameras.” These descriptions may refer to the Basler/Phantom pair, but the paper does not establish the cross-view synchronization, registration/calibration, or handedness algorithm needed to claim that the second view independently resolves the mode. The proposed quarter-turn sample must not be assumed available from the described camera arrangement.

The paper measures (a_0), fits (\Gamma) and (v_z) to its Rankine-core dispersion relation, then checks those fitted values a posteriori against PIV/PTV. That is fit-conditioned consistency, not a blind holdout. The Figshare DOI is cited, but dataset bytes, file inventory, version, run identifiers and checksums were not retrieved. No raw-data replay or physical calculation was performed.

## 4. Observable map and H0/H1 test contract

The source-grounded standard chain is:

[
\text{camera/calibration}
\to r_L(z,t),r_R(z,t)
\to (\eta(z,t),a(z,t))
\to (S_\eta(\omega,k),S_a(\omega,k))
\to \text{Kelvin/Rankine dispersion comparison}.
]

The standard comparator (H_0) is the paper's classical Kelvin-wave hollow-core relation in its long-wavelength regime and Rankine-core relation with uniform axial flow for the broader measured range. The paper's measured (a_0) and fitted ((\Gamma,v_z)) must remain explicitly labelled as measured versus fitted inputs.

An (H_1) H(s)H proposal would have to define an explicit map from its declared filament/worldtube/twist variables to the same (\eta,a) fields and spectral observables, then predict held-out results without fitting its extra degrees of freedom to the same spectra. Shared nuisance/calibration inputs must include camera geometry, scale, time base, contour extraction, spatial window, PIV/PTV calibration and uncertainty treatment. A valid holdout must be an independently acquired run or condition confirmed by the dataset manifest; adjacent frames are not independent replication.

**Candidate observables:** the two spectral surfaces (S_\eta(\omega,k)) and (S_a(\omega,k)), together with circulation and axial-velocity diagnostics.  
**Falsification rule:** freeze the joint covariance/processing and a prediction region before unblinding; reject an (H_1) prediction that falls outside the predeclared joint region on the independent holdout, or that cannot outperform the shared-parameter (H_0) comparator under the frozen complexity rule.  
**Missing for a numerical threshold:** raw dataset, run/acquisition identifiers, cross-channel covariance, calibration lineage and a source-authorized H(s)H forward map. No numerical threshold is invented.

## 5. Forced versus optional geometry

- The measured air core has a finite physical radius. That is a property of the standard fluid system, not evidence by itself for an intrinsic H(s)H worldtube-thickness degree of freedom.
- The azimuthal mode index (m) is part of the classical Kelvin-wave description. It does not establish a separate H(s)H twist field.
- The air–water interface is a physical fluid boundary. It does not establish an additional H(s)H contact-surface primitive.
- The experiment records laboratory (z,t) profiles; it does not directly measure a distinct H(s)H timesheet.
- No worldtube thickness, independent twist, contact surface, or timesheet is forced by the published readout.

## 6. Lean verification and limits

The change is on existing PR [#1189](https://github.com/Satobloc/HsH/pull/1189), branch `research/nadir-affine-translation-quotient-20261101t0324z`, corrected head `da1e7d5dff0cdbc1d81303e3c573b79832087a38`, based on `research/nadir-gpb-joint-covariance-bound-20261027t1312z`. The PR remains OPEN / DRAFT / UNMERGED; no review or merge was requested.

The first exact-head run [#44105406291](https://github.com/Satobloc/HsH/actions/runs/44105406291) checked out its exact head `72aad011dc994ab071b3f07a324286bf2f1376ff` but failed in the target module: the augmented definition needed `noncomputable`, and a trailing `ring` tactic was redundant after simplification. Both source defects were corrected on `da1e7d5d`.

The corrected-head exact-source run [#44106198466](https://github.com/Satobloc/HsH/actions/runs/44106198466) **PASSED**. The workflow asserted expected and actual checkout identity as `da1e7d5dff0cdbc1d81303e3c573b79832087a38`; Lean 4.34.0 and Lake 5.0.0; full library build completed successfully (8,961 jobs). `NadirVortexTwoChannelReadout` built at job 8935/8961. The two new theorem-specific `#print axioms` reports list `[propext, Classical.choice, Quot.sound]`; no `sorryAx` is reported for either theorem. These are standard Lean foundations, not a zero-axiom result. The separate global axiom audit, tests, lint, leanchecker and nanoda were skipped. Existing linter warnings at lines 239 and 252 in the module remain. CI generated a Lake dependency manifest from scratch, but no `lake-manifest.json` is committed on the branch, so transitive dependency locking remains a reproducibility limitation. The first failed pre-fix run is retained as history and is not counted as the final result.

The theorem, if successfully compiled, would establish only the formalized conditional statement about the declared radial ansatz and readout map. It would not establish that the ansatz faithfully represents the experiment, that the proposed sample is physically available, or that any H(s)H premise is true.

## 7. Project, source and continuity controls

- P0 Code Grurple remains ACTIVE.
- P1 Orson cognition remains protected and OVERDUE / NOT READY; no P1 assignment or work was touched.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- FIE was last reviewed November 10; next review November 24.
- The November 9 minor gate remains overdue. November 30 major and December 14 full-theory gates remain separate. No paper gate advanced.
- The task graph still records 18 branch records against 16 declared branches; this discrepancy was not altered.
- SAT-O1 blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, SAT-O6 blob `19fa30ed3c0d8a85b4729b98aa11b9f73984d0b0`, and Blockwave attachment blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` remain unchanged. The previously recorded Blockwave SHA-256 is `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`. No original equation was retranscribed, corrected, or promoted in this run.
- Existing Math Hopper #578, Whirligig Kernel 0, the current Lean PRs and SciSpace availability were checked before any new tooling. No new tool, fork, dependency, subscription or expenditure was introduced.
- No H(s)H forward map, fit, physical prediction, independent measurement, numerical falsification threshold, Factory Floor admission, or BEDROCK theory promotion occurred.

## 8. Successor and automation

The next ring label is Enheduanna, index 11, expected run key `REVROT3-19-20261011:902:s4`. Her existing workspace preserves a broad archive/source remit, no authenticated current thread and no standalone signed specialist charter. The optional repository handoff is context only; it creates no task, review request, response obligation, deadline or ownership transfer. Repository delivery does not establish ChatGPT-thread delivery or consumption.

The existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781`, schedule `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`, and Lane Charter 36 phase were not changed. No task, ID, prompt, schedule, phase, enabled state or cadence was modified; no sixth task was created.

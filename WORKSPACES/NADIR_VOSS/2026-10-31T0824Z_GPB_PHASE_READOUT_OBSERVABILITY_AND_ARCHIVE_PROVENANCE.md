# GP-B Phase-Readout Observability and Archive Provenance

**Run:** `REVROT3-19-20261011:488:s2`  
**Nominal slot:** 2026-10-31 08:24Z  
**Selected worker:** Nadir Voss (ring index 10)  
**Next worker:** Enheduanna (ring index 11)  
**Status:** SOURCE CROSSWALK CORRECTED / REAL-SYSTEM MODEL EXTRACTED / CONDITIONAL LEAN BUILD VERIFIED / RAW DATA NOT RETRIEVED / NO H(s)H PROMOTION

## Executive result

Gravity Probe B (GP-B) provides a particularly useful real-system test bed for a finite-body/worldtube measurement architecture. The rotor was a finite, nearly spherical body with body-fixed trapped-flux and surface-potential structure. Its interaction with housing patch potentials produced measured torques and roll-polhode effects. The final SQUID readout was not a direct observation of a body cross-section: it was a scalar, roll-phase-modulated projection of two spin-to-roll misalignment components, with time-varying scale calibration, bias/noise, high-frequency TFM reconstruction, and a separate low-frequency science-data pipeline.

A new conditional Lean module was added to the existing Nadir GP-B PR #744. Its exact-head build succeeded. It proves:
1. one scalar phase sample cannot identify a two-component misalignment vector;
2. the 2x2 readout determinant is the sine of the phase separation;
3. two samples identify the frozen two-component vector when both gains are nonzero and the phase-separation sine is nonzero.

This is a standard-reference measurement-map theorem, not an H(s)H law, not a GP-B reanalysis, and not a prediction.

No Nathan Direct GP-B-specific mapping was found. The H(s)H connection below remains an explicitly labeled cross-system proposal.

## 1. Rotation, authority, and continuity

The fixed ring calculation is:

`h = 488`, `seq = 5h + 2 = 2442`, `2442 mod 19 = 10`.

Selected: Nadir Voss. Next: Enheduanna.

The :24 automation was inspected with task ID `6abda4c8eda88191bf23a6f2849e9a17`. It remains enabled, hourly, America/New_York, original :24 phase. No task, title, ID, prompt, schedule, phase, or cadence was changed. No sixth task was created.

The live BEDROCK was read in four contiguous ranges (568 lines; blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`). Steering Charter 2026-10-26, Three Paper Campaign, onboarding, Revival Rotation, workflow orientation, branching map, task graph, Code Grurple roster, scheduler authority, symbol/citation policies, Mersearch guide, current receipts, Nadir workspace, source seed, reference intake, and existing playgrounds were inspected.

Nadir's current specialist authority is the independent mathematical sandbox described by:
- `WORKSPACES/NADIR_VOSS/README.md` (blob `e24383016bc94d036474407857bfaf93932fec7e`)
- `WORKSPACES/NADIR_VOSS/REFERENCE_INTAKE_2026-10-05.md` (blob `0ff9dfafa51328c4f648295ad260c714f044eeff`)
- `WORKSPACES/COMMON/REVIVAL_SEEDS/2026-10-11_ELIAS_KERN_NADIR_VOSS_SOURCE_SEEDS.md` (blob `4fde6cf54351019304267e4550456a3ae5244251`)

The seed and workspace charter are operational/source-grounded reconstructions, not an authenticated historical Nadir ChatGPT thread. Existing-thread-first retrieval did not identify a current authenticated Nadir thread. No cross-thread delivery or acknowledgment is claimed.

Code Grurple remains ACTIVE. Ordinary research remains backseat/hold relative to the interlock. This work was kept as a bounded sandbox measurement-map result: no manuscript edit, paper-gate advancement, BEDROCK change, theory promotion, or merge.

## 2. Nathan-source genealogy correction

The prior Nadir report described an October 29 4D/3D clarification as Nathan Direct. That source was an assistant-authored transcription (blob `933d09e802bb98f2fd4f932b2d342f412f5bf718`); its raw original message was not recovered. It must not be cited as a verified Nathan-authored message.

The following actual user-role source messages were recovered:

### May 4, 2025: aSAT baseline, not current canonical SAT

Conversation: **Fundamental Physics Explanations**  
Conversation ID: `6816e398-af14-8002-ab29-cb2d84caf989`  
Raw export: `DEVELOPMENT_FULL_CONVOS/25.05.03•25.05.04•Fundamental Physics Explanations — raw.json`  
Git blob: `9bcd42a355d05ebbbe6b6edec9744d1409d0cfd9`  
User message: `2b40efe6-eea0-49f4-a15a-6d6518a6afdc` (2025-05-04T04:06:09Z)  
Related user message: `b1c8c059-6882-473d-aad7-dad1e3d67a15` (2025-05-04T04:39:55Z)

The first message describes an early/aSAT picture in which fundamental particles are associated with intersections of 4D filament-like structures and a time wavefront. The conversation explicitly treats this as an independently explored/aSAT line. It is not evidence that the later H(s)H model already contained the GP-B readout map.

### July 11, 2026: direct worldline/thickness and medium statement

Conversation: **Reasoning with SAT-HSH Skill**  
Conversation ID: `6a51def1-1224-83ea-8b56-d9405e694034`  
Raw export path: `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.07.11•26.07.17•Reasoning with SAT-HSH Skill — raw.json`  
Git blob: `b7868607d89f66bbc0e638398182fb2d6b2da2ce` (repository content endpoint returned an empty body; the Library raw-export copy was inspected)  
User messages:
- `f8e3ca00-6348-43d3-9602-014002b9feed` (2026-07-11T18:31:40.116Z)
- `898814a5-79c6-4e26-b0f8-5f7501ef1957` (2026-07-11T18:36:58.231Z)

These direct messages describe a worldline with thickness as a spacetime surface, and EM interactions as Kelvin-vortex-like excitations in a BEC-like vacuum/spacetime medium, or more precisely solitons on the timesheet that approximate Kelvin vortices. They do not identify GP-B patch potentials with Kelvin vortices.

### September 7, 2026: full 4D bulk versus 3D slice

Conversation: **Ravel [H(s)H] Syncmathcek**  
Conversation ID: `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`  
User message: `496a15ea-0263-459d-b815-908f52155b90` (2026-09-07T10:06:12.842Z)  
Raw Library export: `Ravel [H(s)H] Syncmathcek — raw (2).json` (Git raw-export blob previously recorded as `c49367b0faa424b98246737ef51e82434d725a8`)

This direct message distinguishes the full 4D bulk from the 3D slice and discusses intersectional geometry within timesheet thickness. It is a better primary witness for that distinction than the October 29 assistant transcription.

**No recovered Nathan Direct message links GP-B, its SQUID equation, its patch-potential model, or its SO(3) rotor frame to H(s)H/SO(4).** That cross-system link remains a proposal. The May 2025 aSAT source, July 2026 direct worldline/medium statements, September 2026 direct bulk/slice statement, standard GP-B literature, and assistant reconstruction are kept separate.

## 3. Actual measured system and standard-source model

### GP-B rotor and patch-potential system

The four GP-B gyroscopes used approximately 38 mm fused-quartz spheres with niobium coatings, operated cryogenically and spun at approximately 80 Hz. The spacecraft roll period was approximately 77.5 s. The final polhode periods were reported in the approximate 1–4 hour range, after initial periods around 2–6 hours.

The rotor and housing were mechanically spherical but electrically nonuniform. Rotor and housing surface-potential patches were represented in their respective material frames using spherical-harmonic expansions. The patch interaction produced torques and roll-polhode effects. This is an electrostatic/contact-potential interaction across a gap, not mechanical rubbing contact.

Published geometry and surface scales include:
- rotor diameter: approximately 38 mm (radius 19 mm);
- rotor-to-housing gap: approximately 32.5 µm;
- niobium grain scale: approximately 0.1–1 µm;
- surface-potential variations: approximately 50–100 mV in the reported model/measurements;
- a 1.5 µm displacement case was used in the patch-potential analysis.

The small-grain scale is 32.5–325 times smaller than the nominal gap. The final coating nevertheless produced large low-order surface patches; the expected averaging of random microscopic variations did not eliminate the coherent macroscopic patch effect. This is a measured finite-body/boundary-texture phenomenon, not evidence of a universal rope law.

Primary references:
- Everitt et al., *Gravity Probe B: Final Results of a Space Experiment to Test General Relativity*, Phys. Rev. Lett. 106, 221101 (2011), DOI: 10.1103/PhysRevLett.106.221101.
- Buchman et al., *The effects of patch potentials on the Gravity Probe B gyroscopes*, DOI: 10.1063/1.3606445.
- Stanford GP-B mission FAQ and patch-effect explanation.

### Readout equation and data pipeline

The published scalar readout is a roll-phase-modulated projection of two NS/WE spin-to-roll misalignment components. In the reduced notation used here:

[
z(t)=C_g(t)left[mu_{NS}(t)cos(phi_r(t)+deltaphi)
+mu_{WE}(t)sin(phi_r(t)+deltaphi)ight]+B(t)+n(t),
]

where (oldsymbolmu=(	au-s)_{NS,WE}), (C_g(t)) is a time-varying scale factor, (phi_r) is spacecraft roll phase, (B(t)) is bias, and (n(t)) is noise.

The 2011 PRL presents a compact version of this readout (Eq. 2). The detailed coordinate-frame and measurement models are in the 2015 *Gravity Probe B data analysis: I. Coordinate frames and analysis models* paper (notably its full measurement equation), while Data Analysis II describes the actual reduction path. The two-sample theorem below is a reduced algebraic submap, not the full DA-I estimator.

The actual data pipeline is multirate:
- the high-frequency SQUID channel was sampled at 2200 Hz;
- TFM snapshots contained 4096 samples (about 1.862 s each), sent at roughly 40 s intervals during part of each orbit;
- approximately (2\times10^5) such snapshots were acquired per gyro over roughly a year;
- TFM reconstructed rotor orientation/polhode information and supported time-varying scale-factor calibration;
- the science-data path was synchronized into 2 s centered records and processed through a separate 2-second filter;
- the final analysis required additional L1.5/L2/L3 processing; the early Level-2 product alone was not the complete final analysis input.

Thus the high-frequency TFM path and the low-frequency science path are distinct but coupled through calibration and state estimation. The 2 s stream cannot directly resolve an 80 Hz rotor spin; it relies on the separate high-frequency reconstruction/calibration channel.

## 4. Scripted numerical checks

All calculations below use published nominal values, not raw time series. No uncertainty for the nominal 77.5 s roll period or 80 Hz spin was supplied in the values used here; these are design/scale diagnostics, not precision estimates.

### Sampling ratios

- 2 s output interval: 0.5 Hz.
- Nominal roll period: 77.5 s.
- Samples per roll: (77.5/2=38.75).
- Nominal rotor spin: 80 Hz.
- High-frequency samples per spin cycle: (2200/80=27.5).
- Rotor spin cycles per 2 s output interval: (80\times2=160).
- 4096-sample TFM snapshot duration: (4096/2200=1.8618) s.
- Nominal rotor revolutions per snapshot: (80\times4096/2200\approx148.95).
- Snapshot duration / 40 s cadence: approximately 4.65%.

### Two-sample phase conditioning

For a frozen two-component vector and equal unit gains, the two-row design matrix has rows ((\cos\phi_i,\sin\phi_i)). Its determinant is (\sin(\phi_2-\phi_1)). The 2-norm condition number is computed from its singular values.

| Sample separation | Nominal phase separation | (|\det A|) | Condition number |
|---:|---:|---:|---:|
| 2 s (1 interval) | 9.2903° | 0.16144 | 12.307 |
| 20 s (10 intervals) | 92.9032° | 0.99872 | 1.052 |
| 38 s (19 intervals) | 176.5161° | 0.06077 | 32.88 |

This is the conditioning of a frozen-state two-sample subproblem, not the covariance or condition number of the actual GP-B estimator. The real estimator uses measured roll phase, time-varying scale factors, changing state, calibration, and many samples.

A second idealized Python check used 155 consecutive 2 s samples over 310 s (four nominal 77.5 s rolls). With a constant nominal roll period and constant gain, the phase step is (4/155) of a cycle; the 155 phases permute a uniform 155-point grid. The computed Gram matrix was:

[
A^T A \approx \begin{pmatrix}77.5&0\\0&77.5\end{pmatrix},
]

with numerical condition number 1.0000000000000002. This is a nominal uniform-grid result only. Actual roll phase is measured and varies; (C_g(t)) varies; the state evolves; missing intervals and weights matter. It is not an observed estimator covariance.

### Patch geometry ratios

- gap / rotor radius: (32.5\,\mu m / 19\,mm \approx 1.7105\times10^{-3});
- 1.5 µm displacement / gap: approximately 4.615%;
- grain size / gap: approximately 0.00308–0.03077.

No uniform electric-field estimate was made from the patch-potential amplitudes because the actual surface distributions are nonuniform and the spherical-harmonic coefficients/geometry are required. No invented field, torque, or physical fixture was introduced.

## 5. Conditional Lean formalization

The existing draft PR was extended; no new branch or PR was created.

- PR: #744, open/draft/unmerged.
- Branch: `research/nadir-gpb-joint-covariance-bound-20261027t1312z`.
- Base branch: `research/nadir-gpb-fourgyro-covariance-20261027t0924z`.
- Exact PR head: `7a3add552cebd8a9fa7f2b758f729b3d72d58bcc`.
- Tested merge commit: `4063694d59d0b96f70fd7f3ec19b3df38b2f55cf`.
- New module: `FORMAL_VERIFICATION/HsHVerification/NadirGPBPhaseReadout.lean`.
- Imported by `FORMAL_VERIFICATION/HsHVerification.lean`.

Three theorems:
1. `one_sample_readout_not_injective`: any one scalar phase sample has a nontrivial kernel in the two-component projected space.
2. `determinant_eq_sin_phase_difference`: the 2x2 determinant equals (\sin(\phi_2-\phi_1)).
3. `two_phase_readout_injective`: if both gains are nonzero and the phase-separation sine is nonzero, the frozen two-component vector is uniquely identified.

The local identifiers are descriptive (`rollPhase`, `scaleFactor`, `misalignmentNSWE`) to avoid collision with the shared symbol registry's reserved `alpha) alias for the fine-structure constant.

Exact-head CI:
- Run #41185475361: SUCCESS.
- Job #124491418084: SUCCESS.
- Lean 4.34.0; Lake 5.0.0.
- 8,950 build jobs; new module built at [8930/8950].
- All three `#print axioms` outputs present.
- Each reports standard dependencies `propext`, `Classical.choice`, `Quot.sound`.
- Complete job log: 57,419 bytes; `sorryAx` occurrences: 0.
- Separate `lake test`, `lake lint`, nanoda, and automated axiom-audit steps were skipped (`axiom-audit: false)); do not claim those checks ran.

Two earlier exact-head attempts failed and were corrected:
- Run #41184722757: noncomputable real trigonometric definitions and cascading type errors.
- Run #41185199917: simplification rewrote the kernel equality into an unhelpful disjunction; the proof was changed to an explicit algebraic `change` followed by `ring`.
- Final successful run: #41185475361.

Lean verifies the formalized conditional algebra only. It does not validate the source-to-model translation, the frozen-state assumption, GP-B physical calibration, the H(s)H mapping, or any physical premise.

## 6. Archive provenance and access

The GP-B NSSDCA archive is cataloged as **ASGR-00002**. The 2007 archive plan describes CDF products and a Level-2 product with 2 s centers; Level 2 is preprocessed, not raw telemetry. That plan says the archive was not electronically accessible outside NSSDC at the time and described media-based fulfillment.

Later evidence changes the access picture:
- the NSSDCA 2014 annual report records 326.84 GB of GP-B data arriving at NSSDC and describes selected collections made available via FTP;
- the 2016 report records another 586.02 GB of GP-B data received that year;
- the current NSSDCA MOU list includes GP-B;
- the current NSSDCA “Obtaining Data” page directs requests through CRUSO and warns that some large requests may be constrained by budget.

No raw GP-B files, CDF products, or current data dictionary were downloaded in this run. The 2007 plan's access statement must not be repeated as a current universal prohibition; the later FTP reports show some electronic access existed. Conversely, the annual reports do not establish that the complete Level-0/L1.5/L2/L3 set is presently downloadable.

A low-cost first request should ask CRUSO for availability, current data dictionary, schema/version, and a one-gyro/one-segment subset containing:
- L0/L1 or L1.5 inputs if retained;
- L2 and final L3 products;
- 2 s science stream, roll phase, telescope/guide-star and timing/orbit channels;
- TFM 4096-sample snapshots and derived orientation/polhode/scale-factor products;
- calibration-tone, bias/noise, flags, run/segment metadata, covariance outputs, and processing scripts/software versions.

No email or data request was sent. No price quote is available; the current NSSDCA page warns that large requests may be limited. Full mission reprocessing should not be attempted until access, schema, and cost are known.

## 7. H(s)H cross-system proposal — not a physical equivalence

A useful candidate dimensional chain for a finite physical rotor is:

[
W_R^4
\xrightarrow{\cap\,\Sigma_t^3}
B_t^3
\xrightarrow{\partial}
S_t^2
\xrightarrow{R(t)\in SO(3)}
\mathcal T_R(\Omega)
\xrightarrow{Q(t)=R_H(t)^{-1}R_R(t)}
U_{patch}(Q)
\xrightarrow{-\nabla_Q}
\tau_{patch}
\xrightarrow{\Pi_{NS,WE}}
\boldsymbol\mu(t)\in\mathbb R^2
\xrightarrow{\mathcal M_{SQUID}}
z(t)\in\mathbb R.
]

Here:
- (W_R^4) is the ordinary spacetime worldtube of the macroscopic rotor;
- (B_t^3) is its 3D time-slice;
- (S_t^2=\partial B_t^3) is the actual 2D material surface carrying patch texture;
- (R(t)\in SO(3)) is the rotor material frame;
- (Q(t)\in SO(3)) is relative rotor/housing orientation;
- (U_{patch}) is the standard patch-interaction energy;
- (Pi_{NS,WE}) is the projection to the two measured misalignment components;
- (mathcal M_{SQUID}) is the scalar phase-modulated readout.

The physical surface (S_t^2), the NS/WE measurement plane, and any H(s)H 2D normal-plane support are different 2D objects. They must not be identified by dimension alone.

The GP-B rotor is a macroscopic 3D sphere, not an elementary H(s)H filament. Its worldtube and material frame are standard rigid-body constructs. The patch potentials are classical electrostatic surface structure, not Kelvin vortices or BEC-vacuum solitons. The direct Nathan H(s)H statements motivate testing whether finite-core geometry, internal material texture, and responsive-medium interactions can be represented in a common generative architecture; they do not supply the GP-B map.

A possible group-theoretic bridge is the stabilizer (SO(3)\subset SO(4)) of a chosen unit 4D normal. This is only a candidate projection under an explicit normal/foliation and frame condition. No physical (SO(4)\to SO(3)) map, signature map, or composition law has been established. The existing Nadir all-plus SO(4)/stacked-holonomy playground remains sandbox material; no equivalence to GP-B's relativistic (SO(3)) rotor frame is claimed.

The most useful empirical constraint is that a finite body can be mechanically spherical yet carry coherent body-fixed surface texture whose interaction with an external boundary creates measurable torque and phase-dependent response. An H(s)H model that wants to reproduce this class of behavior must specify its material-frame/texture variables, boundary coupling, and forward readout map. It must then predict the observed torque and roll-polhode behavior from measured inputs, not fit an unspecified geometric analogy.

## 8. Mersearch, publication, and safeguards

The four Mersearch request lanes were inspected. Lanes 1, 3, and 4 have request-scoped receipts; lane 2 has no output receipt. All four remain occupied. No new request was created or any lane overwritten. The existing lane-4 worldline/timesheet search was used as a prior source locator; exact raw conversation messages were then retrieved from the archive/Library. The Mersearch tool itself was not available in this runtime.

Existing P2 issue #565 was read. No new issue was opened. A public-safe additive comment is intended on that existing issue; it will state the readout result and CI status without advancing the P2 gate. No manuscript, PDF/reader, or paper gate changed.

Code Grurple remains ACTIVE. P1 (Nov 9), P2 (Nov 30), and P3 (Dec 14) remain separate and unchanged. No BEDROCK promotion, new branch, new PR, new tooling, or new task. Existing PR #744 remains draft/unmerged.

Unrelated reading break completed: Babbage, *Reflections on the Decline of Science in England*, lines 481–520. Next cursor: line 521. FIE rereview is not due (last recorded review October 27).

## 9. Next bounded steps

1. Keep PR #744 draft/unmerged pending independent review of the three new theorems and the source-to-model reduction.
2. If a further proof is needed, consider the multi-sample phase-grid Gram matrix with actual measured φ_r(t) and (C_g(t)); do not treat the nominal 77.5 s/2 s lattice as actual covariance.
3. Recover the current NSSDCA data dictionary and a small one-gyro/one-segment Level-3/TFM package before attempting any raw-data reproduction.
4. Keep the Nathan-source GP-B link marked `NOT_FOUND`; no GP-B-specific Nathan Direct statement was recovered.
5. Enheduanna receives optional source-genealogy context only; no physics assignment or ownership transfer.

**No physical prediction, CODATA comparison, H(s)H equivalence, paper-gate advancement, or BEDROCK promotion was made.**

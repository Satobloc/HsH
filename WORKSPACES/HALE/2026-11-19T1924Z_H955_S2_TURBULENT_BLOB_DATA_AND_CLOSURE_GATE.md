# Hale h955:s2 | Turbulent-blob source and closure gate

**Status:** `SOURCE_REVIEW_COMPLETE / P2_CANDIDATE_ONLY / RAW_DATA_NOT_ACQUIRED / LEAN_BUILD_PENDING`

## Rotation and authority
Nominal UTC hour `h=955` (2026-11-19 19:00Z): \(seq=5(955)+2=4777\), \(4777\bmod19=8\). Selected Hale (index 8); next Elias Kern (index 9). This is deterministic ring selection, not authentication of a historical Hale instance or current thread.

Hale's historical remit is source-grounded in `WORKSPACES/COMMON/CHECKINS.md` lines 108–160 and Sable `REV-006`: external literature, statistical calibration, matched-period comparison, and LIGO emission-time source review. No standalone signed specialist charter was found.

## Measured-system candidate
Matsuzawa, Zhu, Goldenfeld & Irvine (2026), “Nonlinear diffusion and decay of a blob of turbulence spreading into a quiescent fluid,” PNAS 123, e2526858123.
- Article: https://doi.org/10.1073/pnas.2526858123
- Supporting Information: https://guava.physics.ucsd.edu/~nigel/REPRINTS/2026/Matsuzawa%20decay%20and%20spread%20of%20turbulence%20PNAS%202026.pdf
- Figure-data deposit: Zenodo DOI `10.5281/zenodo.18380405`.
- Existing model code: https://github.com/converging-mz/turbulence-cds
- Existing PIV/PTV processing: https://github.com/tmatsuzawa/tflow

Eight converging vortex generators create a turbulent blob in water. The paper reports large-blob 2D2C PIV (\(Re_\lambda\approx203\), \(n=21\)), small-blob 2D2C PIV (\(Re_\lambda\approx60\), \(n=10\)), and one small-blob 3D PTV realization (\(n=1\)). PIV is 86 micrometres/pixel, with acquisition intervals spanning 2.5 ms to 1 s (250–2000 Hz over the relevant sequences). The 3D PTV is nominally 1 Hz and 2.2 mm/pixel: about 25.58 times coarser in pixel scale and 250–2000 times slower in nominal rate. These are sampling-scale ratios, not identical-instrument resolution claims. The PTV movie shows roughly 10,000–20,000 particles over 39 frames and a variable-rate 17-minute pathline record.

The PIV is a central slice, not a 3D velocity measurement. The authors state that slice-averaged energy is proportional to total energy only under homogeneous/isotropic conditions, not during inhomogeneous expansion. The single 3D PTV run supplies a model initial condition, not a replicated 3D validation set.

## Data and code provenance
The article says main-figure study data are deposited at Zenodo DOI `10.5281/zenodo.18380405`. The accessible record summary identifies HDF5 figure data; it does not establish that raw camera images or the complete 3D PTV acquisition are included. Exact file inventory and license were not independently verified.

The public `converging-mz/turbulence-cds` repository contains `smallBlob.zip` (Git blob SHA-1 `afa8c26f21074f24ee92662c9e47071e5fa3d160`, page size 23.5 MB) and `cds_turbulence_3d_demo.py`. The script expects `IC_smallBlob_t1p85.h5` (`q3d0`, `L_e`, `t0_e`, `tauq_e`, `tauq_s`) and `ell_e_filtered.h5` (`t_ell_e`, `ell_filtered_e`). It rescales measured/filtered \(\ell(t)\) and runs a 3D Cell Dynamical System with `dx=0.05`, `L=5`, `dt=0.0005`, `c0=1.2`, `epsilon0=0.88`, and `rem_rate=0.9`. This is a data-conditioned model using processed inputs, not an independent prediction.

`tflow` already supports 2D/3D velocity-field processing and documents incompressibility assumptions. Math Hopper is archive extraction, not Lean; Whirligig Kernel 0 is not a validated fluid solver. No new tooling, fork, dependency, subscription, or expense was introduced. **Acquisition limit:** neither the 23.5 MB binary archive nor Zenodo bytes were acquired; GitHub binary fetch returned metadata but no bytes, and the download route failed. No raw HDF5 was hashed, parsed, or analyzed. Calculations below are source-derived, not raw-data reanalysis.

## Source equation and closure falsifier
The paper defines \(q=\tfrac12u_i u_i\), integral scale \(\ell\), effective diffusivity \(\kappa_q=c_0\ell\sqrt q\), and dissipation \(\epsilon=\epsilon_0q^{3/2}/\ell\):
\[
\partial_tq=\nabla\cdot(\kappa_q\nabla q)-\epsilon
=\frac23c_0\ell\nabla^2q^{3/2}-\epsilon_0\frac{q^{3/2}}{\ell}.
\]
This is a phenomenological scalar turbulent-energy closure, not a measured force law, direct vortex-core trajectory equation, or H(s)H constitutive law.

Supporting Information §D tests instantaneous eddy adaptation \(\ell=\alpha h\), reporting \(\alpha\in[0.3,0.6]\), \(\epsilon_0=0.88\pm0.10\), \(c_0=1.20\pm0.11\). Numerical shooting for the large-blob exponent \(\theta=0.16\pm0.06\) gives \(\epsilon_0/(c_0\alpha^2)\in[40,122]\). The paper calls these “loose bounds”; plus/minus values are not a joint confidence region or covariance model. Treating the marginal bounds as a rectangular enclosure:
\[
R=\frac{\epsilon_0}{c_0\alpha^2}
\in\left[\frac{0.78}{1.31(0.6)^2},\frac{0.98}{1.09(0.3)^2}\right]
=\left[\frac{650}{393},\frac{9800}{981}\right]
\approx[1.653944,9.989806].
\]
The numerical-shooting interval [40,122] is disjoint; its lower endpoint is about 4.004 times the empirical-box upper endpoint. This reproduces the authors' stated self-inconsistency of **instantaneous eddy adaptation**. It does not falsify the general PDE: the authors instead use measured/filtered \(\ell(t)\) as an external input (“delayed” adaptation).

For the small blob, the paper reports \(\ell(t)\sim(t-t_0)^{0.36\pm0.07}\) and best-collapse front exponent \(\beta_{\rm fit}=0.38\). The similarity relation gives \(\beta_{\rm model}=\frac27(1+\gamma)=0.388571\), a central-value difference of 0.00857 (about 2.2%). The source does not specify enough coverage semantics for a statistical test; the best-collapse exponent is fitted on the same system, not an independent holdout. For the large blob, \(\gamma=0.16\pm0.06\) is selected by a 10%-of-minimum-RSS fit-range criterion, not a conventional confidence interval. The paper reduces \(c_0\) to 0.001 after \(t-t_0=2.15\) s in the large-blob simulation to account for boundary interactions, which it places outside the model's scope. This is a model adjustment, not an independent measurement.

## Observation maps and CODATA boundary
The source-faithful chain is \(\mathbf U_{2D}(x,y,t)\to q_{2D}\to q_{\rm radial}\to h_p\to h\), with a separate spectral operator producing \(\ell(t)\). For threshold \(p=0.3\), the paper uses \(h=h_p/\sqrt{1-\sqrt p}\), a factor of about 1.48695. This is an operational energy-front scale, not a material surface. \(W_p^{(2D)}=\{(x,y,t):q_{2D}/q_0\ge p\}\) is a 2D+time slice tube, not a 3D spatial worldtube. The reverse map from observed \(q,\ell,h\) to \(c_0,\epsilon_0\) is a calibration/fit; the forward model consumes measured \(\ell(t)\). The current chain is data-conditioned, not a closed generative prediction.

No CODATA quantity is used in the interval or dimensional checks, so no CODATA comparison was performed. The paper reports water kinematic viscosity \(\nu=1.002\ \mathrm{mm^2\,s^{-1}}\), but the inspected Supporting Information did not identify water temperature or a traceable source for that value. No new Reynolds-number calculation was made. A future viscosity comparison should pin an IAPWS release and the experiment's actual temperature and uncertainty.

## Conditional Lean work
Draft-only PR on existing verification infrastructure, not main:
- PR: https://github.com/Satobloc/HsH/pull/2120
- Head branch: `research/hale-kb-interval-consistency-20261119t1924z`
- Current head: `c1fa2a10c31f31e598317232348e21cf1047d2a6`
- Base: `infra/lean4-verification-20261023`
- Modules: `HaleKBParameterBounds`, `HaleKBClosureGate`, `HaleKBDimensionalConsistency`.

The intended conditional results are exact rational enclosure of the source-parameter ratio, disjointness of the empirical box and model-inferred instantaneous-adaptation interval, and dimensional consistency of the transport term, dissipation term, and \(\partial_tq\).

Two exact-head CI attempts failed before the interval theorem was checked because `+/-` inside a Lean block comment opened a nested comment. All such markers have now been replaced with words. Corrected exact-head run: https://github.com/Satobloc/HsH/actions/runs/44601906209, job `135835691788`. Last observed state: exact PR-head checkout passed; Lake dependency-manifest generation in progress. Toolchain: Lean 4.34.0 / Lake 5.0.0; Mathlib v4.34.0. The workflow disables tests and lint; global axiom audit, leanchecker, and nanoda are skipped. An earlier failed build did compile `HaleKBDimensionalConsistency`; its theorem-specific axiom report listed only `propext`, `Classical.choice`, and `Quot.sound`. The interval and closure modules have not yet passed compilation. No `LEAN_VERIFIED` claim is made.

The verification project has no committed `lake-manifest.json`; the workflow runs `lake update` but does not preserve the generated manifest. Dependency identity is unpinned/unrecorded. Even after a successful build, reproducibility and Factory Floor handoff remain pending until the manifest identity is captured and the required intake receipt exists. No Factory Floor write or theory promotion was attempted.

## Candidate and project disposition
A rotation-oriented alternative is the H2020 ENODISE TUD/NLR B3-VTOL database. Version 2.0 lists an open 47.4 GB B3-VTOL archive with 4D-PTV tracks and time-resolved 2D2C fields; the separate B3-FLAP archive is about 403.5 MB but is a different configuration. The full B3-VTOL archive is acquisition-heavy and its calibration/uncertainty inventory remains unaudited. It is not selected.

The PNAS turbulent-blob study is a candidate for finite-propagation fronts and data-conditioned scalar transport, not a direct finite-core worldtube or contact-force experiment: `P2_CANDIDATE_ONLY / NOT_SELECTED / P2_HOLD`.

- P0 Code Grurple remains ACTIVE. PR #2009 remains open/draft/unmerged, 3 commits ahead and 1101 behind main; no exact-head CI run was identified. Main has no same-path changes to its three changed files since the merge base, but Tern retains reconciliation/release authority. No rebase or merge.
- P1 Orson cognition remains OVERDUE / NOT READY / Orson-owned.
- P2 remains HOLD; P3 remains INCOMPLETE.
- November 9 minor gate remains missed; November 30 major and December 14 full-theory gates remain separate.
- FIE next review is November 24; last full review November 10, so the 14-day trigger is not yet due.
- Mersearch is not callable in this runtime. All four request lanes remain `requested`; none was overwritten or retriggered.
- No raw acquisition, independent measurement, new fit, H(s)H prediction, CODATA comparison, physical validation, or theory promotion is claimed. No SAT-O/Blockwave equation was changed. No private HSH_RESOURCES payload or quarantined PRIOR_ART was opened.

## Scheduler and return pin
The existing :24 Geometry automation remains enabled with task ID `6abda4c8eda88191bf23a6f2849e9a17`, original hourly schedule, prompt, and phase unchanged. Other existing relays remain unchanged; :12 remains disabled. No sixth task, task-ID/cadence/phase change, signet, or conversation rename.

The next deterministic ring label is Elias Kern. His :36 run had already started before this report was ready. No direct-thread delivery, consumption, or acknowledgment is claimed.

`H955:S2 / HALE / ELIAS-KERN-NEXT / PNAS-TURBULENT-BLOB-SOURCE-REVIEW / INSTANTANEOUS-EDDY-ADAPTATION-CLOSURE-FALSIFIER / SOURCE-RATIO-BOX-1.653944-9.989806-VS-SHOOTING-40-122 / PIV-21-AND-10 / PTV-N1 / RAW-DATA-NOT-ACQUIRED / PR2120-DRAFT-LEAN-CI-PENDING / DEPENDENCY-MANIFEST-UNPINNED / P2-CANDIDATE-ONLY / P0-ACTIVE / NO-PHYSICAL-VALIDATION / NO-CODATA-COMPARISON / NO-THEORY-PROMOTION / TASK-UNCHANGED`.

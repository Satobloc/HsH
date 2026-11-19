# H959:s3 | Air-core boundary, Rankine closure, and cavity-convection comparator

**Status:** assistant reconstruction under the Nadir Voss ring label; source-to-model and measurement architecture only. The air-water vortex remains a P2 candidate, not a selected P2 system. No H(s)H physical prediction, fit, or theory promotion.

## 1. New result

The 2026 air-water vortex experiment directly images an air-water free-surface boundary and measures velocity outside or at that boundary. Its adopted full-wavenumber comparator, however, is a Rankine model with solid-body rotation in the model core \(r<a_0\) and uniform downward velocity \(v_z\) in that core.

Those are not automatically the same physical object.

The camera-derived \(a_0\) is an air-core/interface radius. The reported PIV measurements are in the surrounding liquid, near \(r\sim 1\,\mathrm{cm}\), and the PTV measures axial velocity at \(r=a(z)\), the interface. The described measurements do not directly resolve a solid-body velocity profile throughout \(r<a_0\). The Rankine interior must therefore be treated as a model closure, not as an independently observed fluid volume.

This creates a source-to-model identity gate for any finite-core/worldtube interpretation: declare whether the modeled cross-section is (a) the air cavity, (b) a vorticity-support region in the liquid, or (c) the Rankine model's effective interior. Do not identify these by the shared word “core”. This is additive to the existing Aster parity/readout gate and Nadir two-channel formalization; it does not close the unresolved \(m=1/m=3\) mapping or replace the current P2 acquisition-recovery cursor.

## 2. Source and authority

### Nadir label and historical authority

No standalone signed Nathan-authored Nadir Voss specialist charter or authenticated current Nadir thread was found. The checked 2026-10-01 user-authored source conversation authorizes a general experimental sandbox/playground, not a durable Nadir identity or a separate :36 specialty. This report is assistant reconstruction under the deterministic ring label; the current user-supplied Lane 36 architecture/prediction charter governs this run.

### Nathan Direct

The SAT archive raw conversation `ChatGPT Voice Glitch`, conversation ID `6a958d9c-c4fc-83e9-a106-66d2025220c4`, contains direct user message `bda16543-cf97-487f-9038-b14c55074da2`, timestamp 2026-09-01T21:42:34.707Z. The user described Kelvin vortices as a tentative medium-effect candidate for electrostatic repulsion/attraction and explicitly called the preference naive.

Current BEDROCK `ND-2026-10-22-02` is the controlling later instruction: carry the Kelvin-vortex or demonstrably equivalent response as an active, tentative, falsifiable constraint. Do not silently drop it or treat it as proven. The original October 22 raw message was not independently recovered in this run; the current BEDROCK transcription controls.

The Barckicke and Pennings papers below are standard hydrodynamics/cavity-model sources. They do not test an electrostatic medium-to-force law. They constrain a classical fluid-vortex measurement analogy only.

### Primary experimental source

Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores”, *Nature Physics* 22, 409-414 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). The paper's data statement identifies Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).

The paper distinguishes a hollow-core long-wavelength Kelvin relation (Eq. 1) from a full-wavenumber Rankine-vortex relation (Eq. 2). Eq. 2 assumes solid-body rotation and uniform downward axial velocity inside \(r<a_0\), with irrotational flow outside. The Methods state that \(a_0\) is measured from image contours, while \(\Gamma\) and \(v_z\) are fitted to the dispersion data and checked a posteriori against PIV/PTV measurements.

### External standard comparator candidate

Pennings et al., “Dynamics of isolated vortex cavitation”, *Journal of Fluid Mechanics* 778, 288-313 (2015), DOI [10.1017/jfm.2015.379](https://doi.org/10.1017/jfm.2015.379).

This is a hollow/cavitating-cavity model with a free boundary and an axial free-stream velocity \(W\). Its dispersion relation includes a convective \(W k_x\) frequency shift. The cavity interior flow is neglected; the model treats the surrounding liquid, compressibility, surface tension, and a viscous-core correction near the cavity interface. Its near-interface solid-body region belongs to the surrounding liquid model, not to a fluid-filled cavity interior.

It is a relevant **candidate boundary-wave comparator**, not a drop-in model for Barckicke Eq. 2: \(W\) is external free-stream axial convection, whereas Barckicke's \(v_z\) is placed inside the Rankine model core. The systems and constitutive assumptions also differ. Pennings et al. also document two orthogonal high-speed camera views with overlapping fields of view for the cavity geometry, a useful measurement-design reference but not a matched acquisition for Barckicke. Accordingly, Barckicke's statement that no hollow-core model accounts for vertical flow should be read narrowly as referring to the internal-core \(v_z\) formulation it adopts; it is not a universal absence of hollow/cavity models with axial convection.

## 3. Typed geometry and observation map

Keep these objects distinct:

- \(C_t\subset\mathbb{R}^3\): the spatial vortex centreline at laboratory time \(t\).
- \(S=\bigcup_t\{t\}\times C_t\): the centreline history, a 2D worldsheet in 3+1 spacetime.
- \(A_t\subset\mathbb{R}^3\): the finite air-cavity region at time \(t\); \(\partial A_t\) is the air-water interface.
- \(W_{\rm air}=\bigcup_t\{t\}\times A_t\): the 4D time-history of the cavity. This is not automatically the vorticity-support worldtube.
- \(V_t\): a flow-defined vorticity-support region in the surrounding liquid. Its boundary and relation to \(A_t\) are not established by the reported measurements.
- \(R_t^{\rm Rankine}=\{r<a_0\}\): the model-defined solid-body interior used by Eq. 2. It is not directly imaged as a liquid volume.

The observation chain is:

\[
W_{\rm air}\xrightarrow{\text{lab-time slice}}A_t
\xrightarrow{\text{camera projection}}\text{image}
\xrightarrow{\text{contour extraction}}(r_L,r_R)
\xrightarrow{\text{processing}}(\eta,a)
\xrightarrow{\text{spectral estimator}}(S_{\eta\eta},S_{aa}).
\]

Separate measurement channels are:

- **Camera:** side-view contours of the air-water interface; the derived position/radius channels are not a volumetric reconstruction.
- **PIV:** 37 by 23 grid, reported 2.7 mm spatial resolution, at \(z=25\) cm and near \(r\sim1\) cm; used for the surrounding-liquid azimuthal velocity/circulation.
- **PTV:** 1.5 mm expanded-polystyrene tracers; axial velocity is measured at \(r=a(z)\), at the interface.

These operators must not be collapsed into one “core measurement”.

## 4. Source-summary resolution check

For the representative \(m=1\) fit, the paper reports \(a_0=1.9\) mm. Its PIV grid resolution is 2.7 mm.

- \(\Delta x/a_0=2.7/1.9=27/19\approx1.421\).
- The nominal core diameter is 3.8 mm, or \(3.8/2.7\approx1.407\) PIV grid spacings.
- The reported PIV radius \(r\sim10\) mm is approximately \(10/1.9\approx5.26\) core radii.

This is published-summary arithmetic, not a raw-data reanalysis. The PIV sampling scale is larger than the fitted core radius and the reported velocity sample is outside the core. It cannot be used as direct evidence of the internal Rankine profile. PTV at \(r=a(z)\) supplies an interface value, not an interior profile.

The paper reports typical contour-position/radius uncertainty around 0.1 mm, circulation uncertainty around 0.005 m²/s, and axial-velocity uncertainty around 0.05 m/s. The retrieved article does not provide a machine-readable acquisition-level join between the representative Fig. 3 fit and the Fig. 2 PIV profile, so the ratios above are a scale comparison, not same-run co-registered data. The exact same-acquisition covariance and a version-pinned raw Figshare file set were not retrieved; no uncertainty propagation or fit was performed.

## 5. Comparator factorization

The published Eq. 1 versus Eq. 2 contrast changes more than one modeling choice:

| Comparator | Core representation | Axial-flow placement | Wavenumber/physics scope |
|---|---|---|---|
| Barckicke Eq. 1 | Hollow core | No axial-flow term | Long-wavelength relation |
| Barckicke Eq. 2 | Rankine solid-body model core | Uniform \(v_z\) inside \(r<a_0\) | Full-wavenumber relation |
| Pennings et al. 2015 | Hollow/cavitating cavity | External free-stream \(W\), convective \(Wk_x\) term | Potential-flow cavity model with compressibility, surface tension and viscous-core correction |
| H(s)H candidate | Worldtube/timesheet object not yet typed to a measured boundary | No source-authorized law | No forward observable yet |

The Eq. 1 to Eq. 2 improvement cannot be attributed uniquely to axial flow from that pair alone: core closure, axial-flow location, and wavelength/model regime also change. This does not refute the paper's stated interpretation. It identifies what a controlled comparison must separate.

A fair next comparison would:
1. Keep the measured acquisition and observation operators fixed.
2. Within the Rankine family, compare the same full-\(k\) relation with \(v_z=0\) and with independently measured \(v_z\), if the source equation permits that control.
3. Treat the Pennings cavity model as a separate candidate, mapping its external \(W\) to the actual surrounding-flow measurement rather than substituting it for internal \(v_z\).
4. Compare hollow-cavity and Rankine-core closures only over a common validity regime with shared measured parameters, or mark the matched comparator unavailable.
5. Freeze \(a_0\), \(\Gamma\), \(v_z\), acquisition identity and calibration before evaluating a whole held-out acquisition/condition. The paper's described fitting of \(\Gamma\) and \(v_z\) to dispersion, followed by a posteriori measurement checks, is a fit-plus-consistency check, not a fully independent prediction.

## 6. Identifiability and falsification gate

Let \(O=(O_{\rm cam},O_{\rm PIV},O_{\rm PTV})\) be the joint observation map and \(Q\) an H(s)H target such as worldtube thickness, twist, or a contact-surface parameter. \(Q\) is recoverable from \(O\) only if it is constant on every fiber of \(O\). Adding channels helps only when their joint readout actually separates states.

The existing Kestrel theorem `hallway_factorization_iff_fiber_compatibility` and `joint_readout_injective_of_separating_pair` supply this generic conditional criterion. Nadir's existing two-channel Lean module separately proves the limited antipodal-readout alias under its declared single-harmonic ansatz and a quarter-turn separation result. That alias is not a claim that Barckicke's full multi-camera/spectral analysis is wrong; the full acquisition map remains to be recovered.

The actual physical \(O\), \(Q\), and their calibration maps are not yet instantiated. Therefore:
- no H(s)H thickness/twist/contact parameter is identified;
- no H(s)H numerical prediction is available;
- no numerical falsification threshold is instantiable;
- no independent holdout or raw-data validation is claimed.

The falsification condition is architectural: after shared parameters and calibration are frozen, H(s)H must predict a held-out observable that differs from the best applicable standard comparator by more than the independently established uncertainty. If its added geometry only re-labels \(a_0,\Gamma,v_z\), or is not constant on observation fibers, it is not independently identified by this measurement set.

## 7. Forced versus optional geometry

- **Measured:** a finite air-cavity radius and a real air-water interface.
- **Conditional representation:** a 4D worldtube for the time-history of the finite cavity, if that is the object H(s)H intends to represent.
- **Not yet measured:** a distinct vorticity-support worldtube or the internal Rankine model profile.
- **Not forced:** extra 4D transverse thickness beyond the measured cavity boundary, an independent twist variable, or a new H(s)H contact law.
- **Not equivalent:** the observed \(m=1\) helical bending and \(m=2\) radius/shape mode are not, by themselves, material twist of a worldtube frame.
- **Not identified:** the laboratory \(t=\mathrm{const}\) acquisition slices do not establish a separate H(s)H timesheet or its map to laboratory time.

The physical air-water interface is a real boundary. Its existence does not establish a distinct H(s)H contact-surface mechanism.

## 8. Lean and existing-tool verification

No new Lean module was justified because the physical domains, observation operators, and interface-to-model maps are not source-defined. Reused existing exact-head formalizations:

- Kestrel PR [#873](https://github.com/Satobloc/HsH/pull/873), head `94b6d96c91806a95505260a3c52220f4af294185`, exact-head Actions run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878), job `134062868110`: full Lake build succeeded, 8,956 jobs. The factorization theorem depends on `Classical.choice`; the joint-readout theorem lists `propext`, `Classical.choice`, and `Quot.sound`; the downstream-collapse theorem has no axioms. No `sorryAx` appeared in these theorem-specific outputs.
- Nadir PR [#1189](https://github.com/Satobloc/HsH/pull/1189), head `da1e7d5dff0cdbc1d81303e3c573b79832087a38`, exact-head Actions run [#44106198466](https://github.com/Satobloc/HsH/actions/runs/44106198466), job `134119101991`: full Lake build succeeded, 8,961 jobs. The antipodal alias and quarter-turn separation theorems list `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appeared in these theorem-specific outputs. Existing linter warnings remain.

These are proofs of the formalized abstract statements and evidence of successful exact-head compilation. They do not validate the physical source translation, the paper's measurements, or any H(s)H premise. Tests, lint as a complete gate, nanoda, and global axiom audit were not completed.

## 9. Scope, blockers, and next cursor

- P2 remains HOLD; the air-water vortex remains candidate-only. No system was selected, and no P2 task-graph node, owner, issue, or priority was changed.
- Raw Figshare files/version, acquisition IDs, full calibration/covariance, and acquisition-level join were not retrieved.
- No physical fit, independent prediction, holdout, or falsification threshold was performed.
- No SAT-O or Blockwave equation bytes were copied, normalized, corrected, or changed. The existing h944 source-lock remains untouched.
- No new mechanism was introduced. The Kelvin-vortex electrogravity candidate remains carried as tentative and untested; this fluid experiment does not test electrostatic repulsion/attraction.
- Mersearch was not callable. All four request lanes remain `requested`; all 12 request-scoped manifest/receipt paths returned 404. No local pinned checkout was present. GitHub source search and public primary-source reading were bounded fallbacks, not Mersearch and not comprehensive three-repository recovery.
- HsH, SAT archive root documentation, and HSH_RESOURCES root README/index were checked. No HSH_RESOURCES private payload was opened.
- Existing Math Hopper #578, Lean PR #991/#873/#1189, Whirligig Kernel 0, and installed SciSpace were checked. SciSpace was used for discovery; the Pennings comparator was then verified against the primary JFM article. No new tool, dependency, fork, subscription, or expense.
- FIE last review 2026-11-10; next due 2026-11-24. The prior unrelated-reading break remains within cadence; no duplicate break was performed.
- Three Paper Campaign gates remain separate: November 9 minor gate missed, November 30 major gate open, December 14 full-theory gate open. This report advances none of them.

**Next useful source step:** determine whether the Pennings cavity model's external \(W\) can be mapped to Barckicke's measured surrounding-liquid/interface axial velocity without changing its domain or boundary assumptions. Do not substitute \(W=v_z\) without that map. In parallel, recover the exact acquisition-level Barckicke data and determine whether the Rankine interior is intended as an effective closure or a physical vorticity-support region.

**Return pin:** `H959:S3 / NADIR-VOSS-LABEL-ASSISTANT-RECONSTRUCTION / AIR-CORE-BOUNDARY-VS-RANKINE-INTERIOR / PENNINGS-CAVITY-CONVECTION-CANDIDATE / SOURCE-SUMMARY-RATIO-ONLY / PR873-AND-PR1189-EXACT-HEAD-LEAN-REUSE / P2-HOLD / NO-SYSTEM-SELECTION / NO-PHYSICAL-PREDICTION / NO-SAT-O-BLOCKWAVE-CHANGE`.

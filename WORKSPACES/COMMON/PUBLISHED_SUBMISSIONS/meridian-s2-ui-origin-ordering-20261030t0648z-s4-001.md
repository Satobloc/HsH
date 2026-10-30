# Meridian | S2 UI-origin ordering, frame-hold and finite-thickness solver audit

**Run:** REVROT3-19-20261011:462:s4  
**Nominal slot:** 2026-10-30 06:48 UTC  
**Disposition:** SOURCE-FAITHFUL REPLAY / NEW SOLVER-QC FINDING / MERCER INDEPENDENT REPLICATION PENDING / NO THEORY PROMOTION

## Executive result

The existing Meridian UI mapper is a pointwise radial/frame readout, not a path-dependent transport connection. On the existing S2 measured-fit comparator, translating the spatial origin to the model pericenter creates a zero-radius sample. At that sample the direction is undefined; the mapper carries the previous frame. Reversing sample order changes the carried frame at the zero by a Frobenius norm of **2.828427**.

More seriously, the mapper's reported angular-velocity readout Omega = skew(dR Rᵀ) is nearly zero at that O(1) frame jump: **1.5081e-56 per Planck time**, while the raw frame derivative is **1.3237e-46 per Planck time**. The skew-to-symmetric derivative norm ratio is **1.1393e-10**. The skew projection therefore hides the discontinuity at the singular sample.

This is a coordinate/representation defect in the UI readout, not a physical singularity in S2 and not a measured angular velocity. The S2 material history remains curved in the Euclidean 4D lift; that curve curvature is a separate quantity from the mapper's Omega.

## Source and measured-system boundary

Existing branch: research/meridian-s2-ui-origin-gauge-20261027t1412z  
Existing draft PR: [#750](https://github.com/Satobloc/HsH/pull/750), exact head b2eb585e492532feb6e2593f001461260a9d05e6.

Source files:
- WORKSPACES/MERIDIAN/CODE/s2_ui_origin_gate_20261027t1412z.py, blob c6e5cdf3bc6a91526e616e59754a8afe200e8920.
- WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/ui_mapper_basic.py, blob 373d8632429e010532e6ca2589465bb90a9a3c1d.

Measured-system anchor: S2 orbit around Sgr A*, GRAVITY Collaboration (2020), A&A 636 L5, DOI [10.1051/0004-6361/202037813](https://doi.org/10.1051/0004-6361/202037813), Table 1 / Appendix E Table E.1. Published fit inputs used by the existing script:
- a = 125.058(41) mas
- R0 = 8246.7(9.3) pc
- e = 0.884649(66)
- M = 4.261(12) × 10^6 solar masses

The paper's full relativistic fit includes Schwarzschild-precession information (f_SP = 1.10 ± 0.19); the existing script deliberately constructs a **Newtonian Kepler comparator** from the fitted central values. It does not replay raw astrometry, observed epochs, the full relativistic fit, or a held-out prediction. Marginal fit uncertainties are recorded above; the parameter covariance was not propagated. Thus all derived outputs below are **model-derived solver diagnostics**, not measured curvature or H(s)H validation.

Planck conversion used CODATA 2022 values l_P = 1.616255(18) × 10^-35 m, t_P = 5.391247(60) × 10^-44 s, with c = G = hbar = 1. The comparator uses w = ct, so w/t_P = t/t_P. No Forest/Cruller normalization is claimed or used; this is an external standard-physics solver audit.

## Replay method

A source-faithful Python 3.13.5 / NumPy 2.3.5 reimplementation of the existing minimal_so_rotation and build_ui_controls core was run directly in Planck-normalized coordinates. This was **not** byte-for-byte execution of the repository script or a second independent implementation. Mercer is asked to reproduce or attack it independently.

The existing script's numerical evaluation grid is t in [-86400,+86400] s, 301 equally spaced samples (576 s spacing). This is a computational sampling grid, not a measured observation schedule or invented physical dataset. The same fitted S2 comparator was evaluated in:
1. Sgr A*-centered coordinates X(w) = (w,x(w),y(w),0).
2. A spatially translated pericenter-centered chart x -> x-r_p, leaving the physical orbit unchanged.

The source mapper uses fixed seed e0 = (1,0,0,0), forms u = X/||X|| when r = ||X|| > 10^-12, selects a pointwise minimal-plane SO(4) representative R, carries last_R when the sample is invalid, and computes Omega = skew(dR R^T).

For the Planck-unit replay, the source's absolute 10^-12 m validity threshold was converted to 6.1871425 × 10^22 l_P. The nearest nonzero sample in the pericenter-centered chart is 1.0687543 × 10^46 l_P, so this unit conversion does not change any sample's valid/invalid classification. The untyped absolute threshold remains a portability issue for other scales.

## Frozen outputs

| Quantity | Sgr A*-centered | Pericenter-centered |
|---|---:|---:|
| r(0)/l_P | 1.1011046 × 10^48 | 0 |
| valid at t=0 | true | false |
| ||u(0)|| | 1 | 0 |
| adjacent direction dot u_-·u_+ | +0.999811597 | -0.999999999994 |
| max ||Omega||_F per t_P | 1.2851540 × 10^-48 | 1.7589628 × 10^-50 |
| forward/reverse R maximum difference | 0 | 2.828427 at the zero sample |

Pericenter-centered singular sample:
- r(0)=0, valid mask=false, u(0)=0.
- Reconstruction error is exactly zero because r=0; this is the tautology 0·R e0=0, not evidence of direction recovery.
- The forward-order mapper holds R(0)=R(t_-), then jumps to R(t_+): ||R(t_+)-R(0)||_F=2.828427.
- Reversing the sample order changes the held R(0) by 2.828427, moving the hold/jump to the other side of the singular sample.
- At t=0, ||dR/dw||_F=1.3236762 × 10^-46 t_P^-1, but ||skew(dR R^T)||_F=1.5081211 × 10^-56 t_P^-1. The symmetric part is 1.3236762 × 10^-46 t_P^-1. The skew-to-symmetric ratio is 1.1393430 × 10^-10.

For this exact 301-point grid, the maximum UI-frame-rate readout differs by a factor of **73.0632** between the two origin choices, although the physical orbit is the same. This is a coordinate/gauge sensitivity of the UI readout, not an invariant of the material history.

The independent Euclidean 4D curve-curvature calculation at S2 pericenter is also distinct:
- a_4,P = 3.2108110 × 10^-52 l_P^-1
- kappa_4,E,P = 3.2086730 × 10^-52 l_P^-1

These are Newtonian-comparator values from the fitted central inputs, using the existing Meridian relation kappa_4,E = a_phys/(c²+v_phys²) at pericenter where v·a=0. They are not the UI Omega, not ambient spacetime curvature, not a measured observable, and not an H(s)H prediction.

## Interpretation and implementation consequence

1. The zero-scale non-injectivity is already covered by MeridianUIOrigin.zero_scale_forgets_direction in PR #750. The new sample-order dependence of the carried frame and the skew-derivative blind spot are **not** covered by that theorem.
2. The mapper's own source comment notes that the SO(3) stabilizer of a target direction remains free. A pointwise minimal-plane choice is a gauge/section choice, not a uniquely inferred SO(4) frame history or a declared connection.
3. A safe UI behavior would preserve the invalid mask and report R and Omega as undefined at zero scale unless an explicit path-transport rule is supplied. A carried frame may be retained for display continuity, but must be tagged as carried state, not physical transport. A jump detector must inspect R directly; skew projection alone can miss it.
4. The absolute 10^-12 validity cutoff is dimensionful but untyped. It should be represented with units or normalized to a declared scale before cross-unit reuse. It did not affect this S2 run because all nonzero samples are far above either equivalent threshold.
5. Do not identify UI Omega, Euclidean 4D curve curvature, connection holonomy, or ambient Riemann curvature. They are different objects.

## Answer to Kestrel's finite-thickness solver handoff

**No existing native solver contract currently represents the requested finite-thickness timesheet response across bulk, shell and worldsheet support without additional typed maps.**

Existing surfaces were inspected and reused, not replaced:
- UI mapper: pointwise r,R representation of a curve; no carrier-support type, finite-width kernel, or pushforward.
- Three-Spheres: typed carrier/center/radius component; no current-support or finite-band response operator.
- Whirligig: existing 3D mechanical transport/readout; no H(s)H finite-wavefront coupling or source-derived kernel.
- HAGALAZ: active common-state/transport-history branch; RUNs 097-099 cover interface, shared primitive 4D fixture and F2 channel-independence, not finite-thickness support.
- Math Hopper: extraction-oriented; not a response solver.

The support dimensions remain distinct:
- 1D worldline with 3D timesheet in 4D -> 0D event.
- 2D worldsheet -> 1D sharp intersection curve; finite-width support is a 2D strip.
- 3D shell -> 2D sharp intersection surface; finite-width support is a 3D strip.
- Full 4D core -> 3D sharp intersection volume; finite-width band is 4D.

A contraction J_ws^{mu-nu} partial_nu zeta_Sigma gives a level-set-tangent field; it does not by itself restrict support to the sharp intersection or create a 3D timesheet response. Any future contract needs (proposal, not derivation): a typed carrier/support object, a source-derived K_hSigma(zeta_Sigma) with declared physical normal coordinate/width/normalization/uncertainty, an explicit retraction pi_h:U_h(Sigma)->Sigma, and a pushforward/coarse-graining operation that preserves the correct support dimension. A worldsheet current alone cannot become a 3D bulk response without an additional family/filling current or a distinct full-core current.

No Gaussian/top-hat kernel was invented; h_Sigma, intrinsic core thickness epsilon, and coil radius ell_f remain separate.

## Formal verification and limits

Existing Meridian PR #750:
- Exact head: b2eb585e492532feb6e2593f001461260a9d05e6.
- Actions #40996874378 and #40996878087: SUCCESS, Lean 4.34.0, 8,946 jobs.
- #print axioms outputs for MeridianUIOrigin and MeridianS2Geometry were inspected. Dependencies are standard (propext, Classical.choice, Quot.sound); core_history_inside_shell_history reports no axioms. The separate automated axiom-audit stage was disabled/skipped.
- Existing formal scope includes zero-scale direction non-injectivity, origin sensitivity, and conditional algebraic curvature rearrangements. It does not prove the new order-dependent hold or skew-derivative blind spot.

Kestrel PR #873:
- Exact head: bd359f21774deb76daca38d12f260bbfb559b533.
- Actions #41016447947: SUCCESS, Lean 4.34.0, 8,949 jobs.
- Three theorem-specific axiom reports list only standard propext, Classical.choice, Quot.sound; no sorryAx or custom axiom in the fetched log. Automated axiom-audit, tests, lint and nanoda were skipped.
- Formal scope is local tangent orthogonality, orientation reversal and conormal rescaling only. No distributional support, finite-thickness kernel, current conservation, charge normalization or Maxwell coupling.

**No new Lean theorem was attempted.** A general proof of the hold-at-invalid-sample ordering property would be data-free; the live BEDROCK permission gate requires Nathan's specific permission for data-free calculations. The S2 numerical replay is data-backed by a published measured-fit system, but its new algorithmic result is not yet formalized. Mark the new theorem target BLOCKED_PENDING_NATHAN_PERMISSION, not proven.

## Active branch and handoff

The HAGALAZ solver-unification branch remains active but **BACKSEAT/HOLD** under the Code Grurple publication interlock. Its current RUN 100 return cursor is the transport/history discrimination test: supply a declared connection/history on a controlled path and preserve endpoint relative frame separately from path-dependent transport/holonomy. This S2 UI audit is a bounded QC result, **not** RUN 100 completion and not a new branch.

The completed Kestrel :36 receipt and Meridian-addressed handoff were read. Kestrel's source-fidelity addendum preserves the original Blockwave projector transcription P^mu{}^nu; the mixed-index form is a proposed correction, not verbatim source. No SAT4D/Blockwave equation was silently altered.

## Next independent test

Mercer should independently reproduce or attack the S2 result from the fixture and frozen outputs only:
- Fit inputs and source above.
- Newtonian comparator, w=ct, 301-point +/-1-day evaluation grid.
- Compare Sgr A*-centered and pericenter-centered spatial charts.
- Report r(0), validity, adjacent u_-·u_+, forward/reverse R(0), direct R-jump norm, raw dR, skew and symmetric parts, and max-Omega ratio.
- Do not inherit Meridian's implementation reasoning or claim the UI output is physical.
- Separately answer the finite-thickness solver contract question from existing artifacts only.

Independent replication, a source-complete full-GR trajectory, covariance propagation, a declared transport connection, a physical K_hSigma, and any Lean formalization remain open.

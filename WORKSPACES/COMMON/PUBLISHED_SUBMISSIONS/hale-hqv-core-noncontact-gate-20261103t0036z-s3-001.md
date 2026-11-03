# Hale | HQV core hierarchy and noncontact test gate

**Result:** A new measured standard-physics comparator supplies two internal vortex charges and a finite spin core. Exact source-conditioned arithmetic executed. No H(s)H prediction or theory promotion.

## Scope and provenance

Additive to HsH #1204 (2018 polariton scattering), #1149 (BEC core/sign correlations), #1261 (2026 single-vortex Kelvin readout), #1266 (SAT-O/Blockwave source boundary), and P2 docket #565.

The Nathan-labelled SRENA SAT2 transcript asks how to represent Coulomb repulsion in 4D and describes two worldlines approaching, curving away, and not touching (SAT archive blob `fe01fc85b1874c1573843724f035ee292fd48961`, lines 923-925). The adjacent pressure/suction, like-handed repulsion/opposite-handed attraction, and charge-as-chirality account is assistant-authored (lines 928-947), not Nathan Direct or a recovered force equation. The export has no raw message UUID or exact timestamp. This boundary is already published in #1266.

## New comparator: Seo et al. 2016

Seo, Kwon, Kang and Shin, "Collisional Dynamics of Half-Quantum Vortices in a Spinor Bose-Einstein Condensate," Physical Review Letters 116, 185301 (2016), DOI `10.1103/PhysRevLett.116.185301`, arXiv `1512.07696v2`.

System: antiferromagnetic spin-1 `23Na` BEC, highly oblate optical dipole trap. Reported values: about `5.6 x 10^6` atoms; Thomas-Fermi radii `(203,163,1.8) um`; density healing length `xi_n ~= 0.5 um`; spin healing length `xi_s ~= 4.1 um`; `B_z=30 mG`; `q/h=0.24 Hz` initially and `-10 Hz` after conversion to the easy-plane phase.

An HQV has two topological charges: mass-phase winding `q_n` and spin-texture winding `q_s`, each magnitude `1/2`. Its core is nonsingular, filled by a nonrotating spin component, and magnetized. The paper defines `kappa = q_n1*q_n2 + q_s1*q_s2`. At large separation the interaction energy is proportional to `kappa*ln(R)`; near `xi_s`, core deformation matters. For `kappa=0` and opposite core magnetizations, the paper describes a repulsive short-range interaction. The cited `(ln R)/R^2` asymptotic is theoretical, not a measured force law.

## Executed exact arithmetic

Wolfram Language exact rational arithmetic using the source charge labels returned:

| Configuration | kappa |
|---|---:|
| Split pair `(1/2,1/2)` and `(1/2,-1/2)` | `0` |
| Spin-up dipole `(1/2,1/2)` and `(-1/2,-1/2)` | `-1/2` |
| Spin-down dipole `(1/2,-1/2)` and `(-1/2,1/2)` | `-1/2` |

Also: `xi_s/xi_n=8.2`; the reported intra-pair separation `about 4*xi_s` is about `16.4 um`; and `4/about 130` possible post-collision annihilations is about `3.08%` as a descriptive count only. The 16.4 um value is within each split HQV pair before collision, not the minimum distance between the two colliding pairs. The denominator is approximate, not a population-rate estimate.

No uncertainty is supplied in the inspected text for the healing lengths or approximate intra-pair separation. No minimum inter-core separation at collision is reported. No raw shot-level dataset DOI was located; the article points to supplementary material.

## Observed interaction and limits

At about `4 s`, two HQV pairs collide and scatter into two HQV dipoles; their propagation lines cross in the four-HQV region. In `4` of about `130` runs, only one dipole remains; the authors interpret this as possible annihilation and discuss dissipation through phonons and magnons.

This is a **contact/collision and short-range-core comparator**, not a noncontact worldline experiment. It adds mass winding, spin winding, core magnetization, and spin-wave response. A single scalar circulation sign or assumed SAT chirality cannot reproduce the paper's interaction classifier without an explicit map to both `q_n` and `q_s`. No such H(s)H map is established.

## Cross-system coverage

| System | Readout / standard comparator | Limit |
|---|---|---|
| Seo et al. 2016 spinor `23Na` BEC | HQV positions, `q_n`, `q_s`, core magnetization, healing scales; spinor Gross-Pitaevskii/core-deformation account | Collision/core interaction, not noncontact or 4D worldtube |
| Dominici et al. 2018 driven polariton fluid, DOI `10.1038/s41467-018-03736-5` | Phase-singularity tracks and density/phase maps; driven-dissipative spinor Gross-Pitaevskii | Tracks approach/scatter, but density cores merge or become unresolved; shot-averaged |
| Barckicke et al. 2026 air-water vortex, DOI `10.1038/s41567-026-03175-w` | Separate centerline displacement and core-radius readouts; classical Kelvin-wave dispersion | Single-vortex calibration, not pair interaction |

Different media and dimensional regimes are not physically equivalent because they share the word vortex. Cross-system pooling requires explicit universal dimensionless relations and medium-specific parameters.

## Forced versus optional geometry

The Nathan-labelled sentence minimally requires two histories in a declared 4D ambient space, a defined notion of approach/separation, a time ordering in which they approach then curve away, and nonintersection under that structure.

It does not itself force finite core thickness, normal-bundle thickening, helical twist, contact surfaces, a vortex medium, pressure/suction, a Kelvin-wave law, a chirality-to-charge map, or an inverse-square force. If finite-core worldtubes are a separate H(s)H commitment, define the support map, normal bundle, thickness field, boundary, and time-slice readout. The HQV example shows why a structured core may require multiple scales: its reported spin and density healing lengths differ by `8.2`.

## Projection and test architecture

Required maps: `(M^4,g_4,T)`; foliation `Sigma_t=T^{-1}(t)` and induced metric `h_t`; centerline projection `gamma_i -> x_i(t)`; core-support map `gamma_i + internal state -> C_i(t)`; internal-charge map to measured `(q_n,q_s)` if intended; and dynamics/observation map to density, phase, magnetization, and imaging data.

Keep two gates separate: **centerline nonintersection**, tested with phase-singularity/vortex-center localization uncertainty; and **finite-core noncontact**, tested with joint uncertainty in centers, core boundaries, point-spread function, and time sampling. The 2018 polariton case shows phase singularities can remain trackable while density cores merge or become unresolved. The 2016 HQV case is a collision control. A 2D image sequence over time does not establish 4D set-disjointness without the metric, time function, foliation, and projection.

| Test element | Required design |
|---|---|
| Hypothesis | A source-derived H(s)H map predicts a residual beyond the standard model; the SRENA statement itself is kinematic, with no force law. |
| Calibration | Atom number, trap geometry, `q/h`, `B_z`, `xi_n`, `xi_s`, charge labels, magnetization, expansion, instrument response. |
| Holdout | Distinct collision orientations, initial separations, `q/h` or density settings, and spin-charge combinations. The 2016 paper is a reanalysis candidate, not a completed holdout. |
| Comparator | Spinor Gross-Pitaevskii dynamics with mass/spin currents, core deformation, trap boundaries, and measured imaging response. |
| Falsification | Reject the specified map if held-out trajectories/core support fall outside a pre-registered predictive region, or if it predicts noncontact where the mapped experiment resolves collision. No numeric threshold before raw data and joint uncertainties. |

## Formalization and epistemic status

Wolfram exact arithmetic was executed; this is not a Lean proof. Hale PR #1241 is a process-trace formalization; PR #1166 concerns GW250114; Kestrel PR #873 concerns moving-plane geometry. None is a source-typed HQV module. No new branch, PR, Lean module, or tool was created. Status: **LEAN_NOT_RUN**. A Lean proof could certify only encoded rational identities, not the physical model or H(s)H equivalence.

No raw-data reanalysis, force fit, independent prediction, physical equivalence, SAT-O/Blockwave correction, or BEDROCK promotion is claimed.

## References

- Seo et al. (2016), Physical Review Letters 116, 185301. DOI `10.1103/PhysRevLett.116.185301`; arXiv `1512.07696v2`.
- Dominici et al. (2018), Nature Communications 9, 1467. DOI `10.1038/s41467-018-03736-5`.
- Barckicke, Falcon and Gissinger (2026), Nature Physics 22, 409-414. DOI `10.1038/s41567-026-03175-w`.
- Related HsH records: #1149, #1204, #1261, #1266, and P2 docket #565.

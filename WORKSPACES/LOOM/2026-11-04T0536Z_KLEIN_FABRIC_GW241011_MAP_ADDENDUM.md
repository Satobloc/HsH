# Klein Fabric source chronology and finite-core multipole-map addendum

**Disposition:** additive source-custody correction and test-design extension to issue #1341 and the existing Klein Fabric source record. This does not retract the ambient-type/readout contract, select a P2 system, define a new H(s)H law, or claim a physical prediction.

## 1. Branch-aware source chronology

Primary source: Calder's raw conversation export, conversation ID `6a8eacca-c470-83ea-af92-8fb8df194de9`, Git blob `92454acdaad701193e2a0c6cf64a7d7b70a03dbb`. The export contains 2,207 mapping nodes; its recorded current-node ancestry contains 479 nodes.

| UTC | Raw user message UUID | Branch status | Source-level content |
|---|---|---|---|
| 2026-08-26 13:47:44.125Z | `07fd1d72-0936-44ad-91bf-568518050592` | Off current ancestry | Earlier two-shell universe is updated to a toroidal/Klein universe. This is a Klein-related precursor, not yet the worldtube-fabric construction. |
| 2026-08-26 14:15:19.706Z | `7cf6f72b-e28b-452a-a973-59da2ceb8aed` | Off current ancestry | First located direct description in this export of “a fabric of Klein worldtubes wrapping that torus”; the same turn asks how it maps into Minkowski, SAT, GR and SM/QFT. This is the earliest located explicit fabric construction, not a completed map. |
| 2026-08-26 23:17:43.393Z | `aa13431d-598a-4ff2-9f5b-88ae9fd876aa` | Off current ancestry | First located exact proper-name use, “Klein Fabric”; the dual-shell expansion is described as a probable local realization, not equivalent to the global torus/Klein structure. Already covered by the earlier source record; referenced here, not retagged. |
| 2026-08-26 23:41:28.815Z | `062ad8ee-ef20-4857-9077-75fe57a6974f` | On current ancestry | Fuller construction: twisted ER-bridge worldtubes, Big-Bang return, a larger-scale Klein throat, a finite Kerr/Kerr-like core, and a timelike long axis in w. The message explicitly cautions that the proposed fabric is not simply the mathematical Klein bottle. Already covered by the earlier source record; referenced here, not retagged. |

The chronology therefore has four distinct milestones: first Klein-related precursor (13:47), first explicit worldtube-fabric description (14:15), first exact proper-name use (23:17), and fuller current-ancestry elaboration (23:41). The earlier 13:47 and 14:15 turns are raw user-role messages but lie off the export's current ancestry. They are historical branch witnesses from the same conversation and author, not independent corroborations. The 14:15 turn uses “Möbius torus” analogically and asks for mappings; it does not define Möbius transition functions, a connection, or a chirality-flip law. The existing issue #1185 remains correct about the first located exact proper-name use; this addendum extends the earlier descriptive chronology. It does not reinstate the superseded October 21 reciprocal filament↔timesheet deformation description.

New internal source-tag ledger: `WORKSPACES/COMMON/tagging_ledgers/2026-11-04-LOOM-KLEIN-FABRIC-BRANCH-CHRONOLOGY-ADDENDUM-02.md`, blob `6ce97ff3e5fd03d2c420adc7ca6e5929ef894f93`.

Earlier corpus appearances do not outrank the raw role evidence: a 2024-labelled NotebookLM export contains a prompt-like line without an outer role or prompt timestamp, and the adjacent generated answer cites later literature; its file-header date cannot authenticate the prompt's date. A mechanically extracted podcast transcript contains related wording with `speaker=null` and no verified publication timestamp. Neither establishes Nathan authorship or a first public use.

## 2. Source-constrained geometry hierarchy

| Object or feature | Source status | What is still missing |
|---|---|---|
| Global Klein Fabric, K | Direct conceptual parent proposal; not simply a standard Klein-bottle surface | Defined topological space/manifold, dimension, atlas, metric, gluing/orientation data and causal structure |
| Worldtube family, W_i | Direct proposal of twisted ER-bridge worldtubes; long axis described as timelike in w | Embedding into K, metric/signature, causal map, overlap and boundary conditions |
| Local dual-shell description, D_local | Directly described as a probable local realization of the global structure, not equivalent to it | A one-way projection/coarse-graining map and the invariants it preserves or loses |
| Finite core, C_i | Current working hypothesis; direct source material describes one helical core and a hollow outer superhelix, not a second core | Core support, cross-section, radius/profile and relation to the time-surface intersection |
| Kerr-shell boundary | Tentative candidate surface-interaction boundary | No unique shell geometry, contact law or surface dynamics |
| Active wavefront thickness | Operationally preferred active-update region | No measured thickness; not interchangeable with core thickness or shell thickness |
| Twist | Qualitative global Klein/worldtube twist and a separate qualitative matter-induced time-normal torsion are source claims | No source-defined common connection, torsion field, holonomy or pitch law; do not equate these distinct notions |
| Responsive medium | Separate medium ontology was described as optional in the October 10 source | The current BEDROCK directive ND-2026-10-22-02 says the Kelvin-vortex or justified-equivalent response remains an active candidate constraint: tentative means falsifiable/revisable, not optional to ignore. The raw message UUID for that directive was not recovered in this pass; this is an operative BEDROCK attribution, not a fresh raw-message verification. No constitutive law is supplied. |

The supporting raw Meridian Free Build export is conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, blob `7af1561b321f4d9364da5eb111df689efc652827`. Relevant user-role pointers: `1d284b55-d7be-45f7-92a6-15e4734347c8` (2026-10-07 time-normal torsion); `6f00a97a-aa84-45bf-9429-4ff70736014a` (2026-10-09 one core / hollow outer superhelix); `3c657387-b80b-4982-a61a-8e6d8568b8d1` (2026-10-09 worldtube curvature/inertia); `a96d56d7-59bc-48cc-8338-0a37240e8fd4` (2026-10-10 direct correction after a Morrow/Kestrel cross-post: no Hopf fibres or spherical carrier; worldline/worldtube distinction); and `59c5c4c6-c914-48d4-af4c-5f53a1698f37` (2026-10-10 cross-post-framed user message describing the tentative Kerr-shell surface-interaction boundary and separate/optional responsive-medium ontology). Preserve the cross-post framing and direct-source boundary; no embedded signet is reproduced.

The one-core/hollow-outer-coil distinction must be preserved. A finite-core working hypothesis does not by itself force a numerical core thickness, a filled tube, a second core, or a particular contact surface.

The general observer/domain maps in issue #1341 are not the superseded reciprocal filament↔timesheet deformation pair. They are separate measurement and representation maps. Do not conflate them.

## 3. Required map composition

The source now supplies a conceptual parent and candidate object relations, but not a typed geometric construction. The minimum next map chain is:

1. `iota_i: W_i -> K`: define each worldtube's embedding/gluing into the global fabric.
2. `j_i: C_i -> W_i`: define the single-core inclusion and the hollow outer-coil relation.
3. `pi_D: K -> D_local`: define the local dual-shell projection/coarse-graining; state which topology, causal, winding and interaction invariants survive.
4. `I_t: W_i -> Sigma_t`: define the time-wavefront/slice intersection, including transversality and the relation between the 4D object and its 3D trace.
5. `G_HsH`: derive a metric or equivalent invariant exterior geometry from the source-defined structure.
6. `F_GR`: where a stationary-axisymmetric exterior is justified, map its asymptotic coefficients to `(M, J, M2)`, then to `(chi, kappa)`.
7. `O`: map the resulting parameters through a calibrated waveform/instrument model to the observed posterior.

Every map needs typed domain/codomain, dimension, regularity, metric signature, orientation, scale, boundary conditions, preserved/lost invariants and uncertainty propagation. The composed forward route must be fixed before calibration; alternate routes must commute or have a quantified discrepancy. No map is supplied by analogy alone.

## 4. Real-data comparator: GW241011

The peer-reviewed GW241011 event analysis (arXiv:2510.26931 / ApJL 993 L21, published 2025-10-28) provides a real external finite-size comparator, not a direct image of an interior and not a P2 selection. The published event inference reports median network SNR 36.0, primary mass `19.6 (+3.6/-2.5) M_sun`, mass ratio `q = 0.30 (+0.09/-0.08)`, and primary spin `chi_1 = 0.78 (+0.09/-0.09)`. Its spin-induced quadrupole results are:

- Primary-only: `delta_kappa_1 = 0.10 (+0.82/-0.82)`.
- Symmetric combination: `delta_kappa_s = 0.10 (+0.09/-0.11)`, only under the explicit equal-component assumption `kappa_1 = kappa_2`.
- The secondary coefficient is uninformative.

The primary-only and equal-component results are different inferential objects. The tighter symmetric interval must not be presented as a primary-only bound. The event paper uses a modified IMRPhenomXPHM waveform with SIQM terms at 2PN and 3PN. No raw strain or posterior-sample reanalysis is claimed here.

The 2026 PRL compactness follow-up (arXiv:2511.17341 / PRL 137, 071402, published 2026-08-14; DOI 10.1103/29y5-nx9y) compares the primary's two-dimensional `(kappa_1, chi_1)` 95% posterior region with specific exotic-compact-object model families. It excludes repulsive boson-star families in the tested ranges, while high-compactness solitonic and axionic models and some causal-limit fluid-star configurations remain compatible. The constraints apply to this primary and these model assumptions; they do not rule out all exotic compact objects.

The standard reference route is explicit for a stationary, axisymmetric numerical spacetime in quasi-isotropic coordinates:

```text
ds^2 = -exp(2 nu) dt^2
       + r^2 sin^2(theta) B^2 exp(-2 nu) (dphi - omega dt)^2
       + exp(2(zeta - nu)) (dr^2 + r^2 dtheta^2)

M2 = -nu2 - M^3/3 - 4 B0 M/3
chi = J/M^2
kappa = -M2/(chi^2 M^3)
```

This is the standard GR/reference extraction, not an H(s)H equation. H(s)H presently supplies no source-defined metric coefficients or equivalent invariant map from the proposed core/worldtube to `(M, J, M2)`, so it supplies no predicted `kappa` or waveform posterior.

The linked boson-star repository contains numerical model sequences, not measured event data. The existing integrity check `C = M/r99` to maximum absolute discrepancy `5.56e-17` is a model-file consistency check; the paper's `0.3–1.1%` numerical error is solver error, not observational uncertainty. Multiple model families remain compatible with the same measured `(kappa_1, chi_1)` region, so `kappa` alone does not identify a unique interior or worldtube.

| Hypothesis | Shared measured parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification condition / status |
|---|---|---|---|---|---|
| A source-defined H(s)H finite-core geometry yields a definite spin-induced quadrupole | `M1`, `q`, `chi1`, `delta_kappa1`; H(s)H core parameters remain undefined | No calibration/holdout pair selected; P2 issue #565 remains HOLD. Any future calibration event must be separate from the held-out event. | H(s)H-predicted `(kappa1, chi1)` posterior region, derived from its own metric/invariant geometry | Kerr limit `kappa = 1`; published GR waveform inference; PRL compactness model families | Pre-register a posterior-predictive discrepancy using the full joint covariance and waveform/model systematics. Numeric threshold is not set until the H(s)H map and posterior inputs are fixed. Current state: `OBSERVED_BENCHMARK_AVAILABLE / HSH_FORWARD_MAP_MISSING / NO_FIT / NO_P2_SELECTION`. |

## 5. Formal and empirical limits

No new Lean theorem or build is claimed. The source-specific maps do not yet have defined domains, codomains, metric or composition laws to formalize. Existing generic fiber-compatibility results do not prove the physical geometry-to-multipole map; the current Kestrel PR #873 merge-reference build is not a clean successful full build. A future Lean proof can check a precisely formalized map theorem, not the truth of the physical premises or the source-to-formal translation.

No raw strain or posterior samples were downloaded or reanalysed; no H(s)H fit, physical calculation, numerical prediction or theory promotion was performed. P2 remains HOLD. The 2026-11-04 Sable systems report `WORKSPACES/SABLE/2026-11-04T0524Z_LANE24_SYSTEMS_TRIAGE.md` (blob `69d70a047230171132d9367f4f3a61d78d4fdd85`) is the provenance source for the GW241011 values and model-data integrity check; this addendum reuses those results rather than claiming to have rerun them.

**Next cursor:** define the H(s)H metric/invariant geometry and its asymptotic multipole map from the source-defined core/worldtube; keep the branch-aware Calder source chronology; then let the authorized P2 gate select a real calibration/holdout pair and pre-register the posterior-predictive threshold. Preserve the separate P1 Nov 9, P2 Nov 30 and P3 Dec 14 gates.
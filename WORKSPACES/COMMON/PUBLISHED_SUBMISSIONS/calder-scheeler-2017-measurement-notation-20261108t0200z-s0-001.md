# Calder | Scheeler et al. (2017) measurement and notation fidelity addendum

**Run:** REVROT3-19-20261011:674:s0; h=674, seq=3370, ring index 7 Calder, next index 8 Hale.  
**Status:** primary-source metadata and notation addendum to the existing Alberr h673:s2 finite-core comparator receipt. This does not repeat the broad geometry crosswalk, claim an H(s)H equivalence, perform a physical calculation, or promote theory.

## Scope and duplication control

The previous Alberr receipt at WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-08T0124Z_s2_alberr.md already identifies Scheeler et al. as a finite-core comparator and records the conditional centerline readout. The present addendum adds primary-paper sample counts, dimensional parameters, uncertainty wording, the OCR omega/w hazard, and a sharper distinction between fluid helicity and H(s)H objects. A bounded issue search found no existing public Scheeler issue; the Alberr receipt reports no public submission. This is a narrow additive source correction, not a second broad experiment analysis.

## Primary source

Martin W. Scheeler, Wim M. van Rees, Hridesh Kedia, Dustin Kleckner, William T. M. Irvine, "Complete measurement of helicity and its dynamics in vortex tubes," Science 357(6350), 487-491 (4 August 2017), DOI: 10.1126/science.aam6897.

The paper measures thin-core vortex tubes in water. It is an actual fluid experiment, not an H(s)H or WWRD test.

## Measured system and provenance

- 3D-printed hydrofoils of prescribed geometry were accelerated in a water tank.
- Fluorescent rhodamine dye was deposited at the hydrofoil trailing edge and patterned into bright blobs along a less-bright centerline.
- A 3D high-speed laser-scanning tomography device recorded volumetric images; dye blobs acted as passive tracers for core flow along the centerline.
- PIV using neutrally buoyant tracer particles illuminated by a stationary laser sheet supplied circulation.
- The paper defines its Reynolds number as Gamma/nu and reports 12,000 to 20,000.
- Time in Figs. 3 and 4 is rescaled by nu/a0^2, with a0=1.5 mm.
- Fig. 3A uses 10 experimental runs; Fig. 3C uses 8. Fig. 4A reports 16 total trials, eight spanning the first two-thirds and eight the remaining two-thirds. The shaded bands are standard deviations across runs/trials, not a full measurement covariance model.
- The main article lists supplementary Materials and Methods, supplementary text, Figs. S1-S13, references 45-60, and Movies S1-S7. The supplementary PDF was not retrievable in this run. No raw tomographic volumes, tracer trajectories, or per-run covariance table were recovered.

No calculations or fits were performed. The primary paper is a measured system with reported units and trial-level dispersion, but the raw data needed for an independent numerical reanalysis were not obtained.

## Source equations and conditional readout

The paper's helicity decomposition is:

\[
H_{\mathrm{fluid}}=\int \mathbf u\cdot\boldsymbol{\omega}\,dV
=\sum_{i\ne j}\Gamma_i\Gamma_j Lk_{ij}
+\sum_i\Gamma_i^2(Tw_i+Wr_i).
\]

For sufficiently thin tubes whose winding varies minimally across a cross-section, the paper gives the experimentally accessible centerline expression:

\[
H_{\mathrm{fluid}}=\sum_i\Gamma_i\oint_{C_i}\mathbf u\cdot d\boldsymbol{\ell}.
\]

The conditions matter. The volumetric-to-centerline reduction depends on vorticity being organized into tubes and on thin cores with minimal cross-sectional winding variation. The paper states that linking and writhe can be inferred from centerlines alone, while twist and total helicity require flow information inside the tubes. In the experimental decomposition, twist is computed as the residual H_fluid/Gamma_i^2 - Wr_i in the single-tube case, rather than a complete direct reconstruction of the internal twist field. The authors explicitly state that core-profile shape, longitudinal uniformity, and twist configuration remain experimentally inaccessible.

## Notation and object-type glossary

| Symbol | Meaning in Scheeler et al. | Must not be conflated with |
|---|---|---|
| omega vector | Fluid vorticity vector | H(s)H coordinate w |
| u vector | Newtonian fluid velocity | Blockwave u-mu |
| Gamma_i | Circulation of tube i | H(s)H curve gamma-mu |
| H_fluid | Fluid helicity | H(s)H as a theory name or observable |
| C_i | 3D vortex-tube centerline | A finite-core 4D worldtube |
| Tw_i, Wr_i, Lk_ij | Twist, writhe, linking number | H(s)H theta_4, Blockwave theta, or Klein-Fabric topology |
| t | Laboratory time | H(s)H length-like time coordinate w |

The PDF text extraction renders the vorticity symbol as the letter w in one explanatory line. The typeset mathematical symbol is omega, not the H(s)H coordinate w. This is a source-extraction hazard, not a new physical convention.

## Geometry crosswalk to Nathan Direct

The relevant H(s)H direct geometry is preserved in the raw archive:
- Message 062ad8ee-ef20-4857-9077-75fe57a6974f (2026-08-26 23:41:28Z): a finite Kerr/Kerr-like local core, twisted ER-bridge worldtube, larger-scale Klein throat/fabric hierarchy, and a long axis expected along w. The user explicitly distinguishes the global fabric from a possible local dual-shell realization and does not assert equivalence.
- Message 95319111-ba02-4b45-885a-6e44bd5fed7d (2026-08-27 00:17:41Z): w-orthogonality is inferred from classical-particle sphericity, exact only in perfect vacuum and approximate for helical worldtubes; theta_4 is described qualitatively in relation to inverse pitch and intersectional oblateness.

These are direct geometric proposals, not measured objects. The Scheeler experiment instead measures 3D spatial vortex tubes in Newtonian water. Its time sequence is not automatically a Lorentzian 4D worldtube, and its centerline reduction is not the H(s)H 4D-worldtube-to-3D-timesheet projection.

## Mapping diagram

SCHEELER FLUID EXPERIMENT

3D core fields: u(x,t), omega(x,t) over V_i(t)
    |
    | volumetric helicity
    v
H_fluid = integral_V u . omega dV
    |
    | [thin core + minimal cross-sectional winding variation]
    v
sum_i Gamma_i * integral_Ci u . d-ell
    |
    +--> centerline geometry: Wr and Lk
    |
    +--> internal core flow: Tw contribution

H(s)H PROPOSAL

global Klein-like fabric K
    |
    | ? projection / embedding / nesting map
    v
finite-core 4D worldtube W_i
    |
    | ? intersection with active 3D time-bulk Sigma_t
    v
3D trace / readout B_t
    |
    | ? observable map
    v
measured particle signature

Only the first diagram is specified by the paper, and even there the centerline reduction is conditional. The second diagram remains a proposed H(s)H mapping chain with missing maps. The existing generic fiber-factorization theorem in Kestrel PR #873 supplies a mathematical criterion for when a downstream observable can factor through a projection; it does not instantiate or validate any physical H(s)H map.

## Original versus translated propositions

| Proposition | Source status | Fidelity finding |
|---|---|---|
| Thin-core vortex helicity can be reduced to centerline flow under stated conditions | Primary experimental paper | Conditional result, not a universal centerline/core identity |
| Twist, writhe, and linking partition fluid helicity | Primary experimental paper | Distinct geometric quantities; not H(s)H theta_4, Blockwave theta, or Klein topology |
| A 3D finite-core vortex tube evolving in laboratory time | Primary experiment | Not a 4D Lorentzian worldtube |
| H(s)H finite-core worldtube and 3D timesheet/trace | Nathan Direct proposal | Projection, intersection, and readout maps remain undefined |
| Twisted-rope picture | Paper's schematic analogy | Visualization of field-line organization, not a climbing-rope mechanics experiment or WWRD equivalence |

## Discrepancy ledger

1. **Notation hazard:** OCR w is omega, fluid vorticity, not H(s)H's w-axis.
2. **Object-type mismatch:** a 3D fluid tube and its centerline are not a finite-core 4D worldtube or its 3D time-surface trace.
3. **Conditional projection:** the paper's centerline helicity reduction requires thin-core and cross-sectional-winding conditions. It cannot be generalized to H(s)H without a separately specified map and assumptions.
4. **Observable mismatch:** fluid Tw, Wr, and Lk are not theta_4, Blockwave theta, or Klein-Fabric topology.
5. **Measurement limit:** the paper reports means and standard deviations across trials, but raw volumes, trajectories, and full covariance were not recovered here.
6. **No H(s)H prediction-vs-fit:** no H(s)H forward prediction was specified or compared with this experiment.
7. **No physical equivalence:** the experiment is a real fluid comparator only. The WWRD climbing-rope mechanism remains a first-blush geometric heuristic.

## Formalization and disposition

No new Lean module or run was created. The relevant generic projection/fiber criterion is already in Kestrel PR #873; its proof concerns the formalized map statement only. It does not prove that the Scheeler measurement satisfies the H(s)H map, that the H(s)H map exists, or that the physical premises are true.

No physical calculation, fit, CODATA scoring, theory promotion, SAT-O equation change, Blockwave equation change, BEDROCK amendment, paper-gate advancement, branch, PR, or tooling dependency was created.

## Next deeper cursor

1. Recover the supplementary Methods and any public raw volume/tracer data if available. No author contact or private-data request was made.
2. If raw data become available, preserve frame registration, spatial scale, time step, tracer-identification uncertainty, circulation uncertainty, and trial identity before computing anything.
3. Specify H(s)H domains/codomains and maps for W_i^4 to Sigma_t^3 to B_t to O, including metric, parameter, finite-core support, regularity, and what information each projection discards.
4. Test fiber-compatibility for each proposed observable. Do not infer a map from the rope analogy or from the fluid-vortex comparator.
5. Keep prediction, fit, and measurement separate. No H(s)H validation claim is available from this comparison.

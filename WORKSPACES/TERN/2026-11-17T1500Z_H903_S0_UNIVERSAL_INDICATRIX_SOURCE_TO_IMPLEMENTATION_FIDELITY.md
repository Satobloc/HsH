# Workshop Relay h903:s0 | Universal Indicatrix source-to-implementation fidelity

**Disposition:** SOURCE_FIDELITY_AUDIT_COMPLETE / IMPLEMENTATION_CHARTS_DISTINGUISHED / EXISTING_FREEZE_PRESERVED / NO_THEORY_PROMOTION.

## 1. Selection, authority, and scope

- Nominal slot: 2026-11-17T15:00:00Z.
- h = 903; seq = 5h = 4515; 4515 mod 19 = 12.
- Selected label: Tern Rook (index 12); next ring label: Morrow (index 13).
- This is an assistant-level, source-grounded Tern-label reconstruction, not authenticated participation by the historical Tern thread.
- Historical authority is two direct user-role messages in the Ariadne raw export, conversation 6ab339d2-8fb4-83ea-b728-c8001a034371: c4f0aae9-3290-42c6-a5d0-b42c19a88255 and e689eb6e-5814-4a27-a366-796605bd5f4d. They establish Tern's Comptroller role over scheduled-task control and execution-time allocation. No standalone signed Tern charter or authenticated current Tern thread was found.
- The optional h902:s4 Enheduanna prestart evidence-lineage packet was read from the shared handoff path. It creates no task, response obligation, ownership transfer, or authenticated-thread delivery claim.

The investigation uses the March 7, 2026 primary Universal Indicatrix conversation and its later assistant-generated archive and executable descendants. It does not promote any physical claim.

## 2. Primary Nathan Direct geometry

Primary raw conversation:
- Title: Switching to English.
- Conversation ID: 69ab6f13-b8f8-832e-8d71-528c15e11037.
- Raw export Git blob SHA-1: dfdaec331846087af7daf0008eba431520a5b9ad.
- The following user messages are on the recovered current ancestry.

**2026-03-07 09:08:47.520Z, message a27ac504-8a09-4a2e-9de8-fc4c5cf05680**

Nathan describes:
- A fixed unit hypersphere on a four-dimensional orthogonal grid.
- A second identical grid and hypersphere, initially superimposed, free to rotate about the common origin and expand or contract.
- A marked point on each sphere, initially coincident.
- Relative rotation and radial change as controls for a point trajectory.
- The simple case: grids locked, movable radius starts at zero and expands to the unit sphere, producing a straight radial vacuum-filament path.
- A proposed integration over the full four-dimensional hypersphere volume.
- An explicit question whether the construction is a Lagrangian, a Hilbert-space-like object, or something else.
- An explicit request to start with a three-dimensional toy.

**2026-03-07 05:01:20.951Z, message 0af476ca-9aac-43a5-b9c9-e0fdf038f2b6**

Nathan distinguishes the existing 4DHH, whole-system and intersection 4D-hypersphere Lagrangians, special cases, and toy versions from the Universal Indicatrix. He says he is not sure there is a complete UI Lagrangian and describes the UI primarily as a mapping tool or translator between equations.

**2026-03-07 08:50:32.122Z, message 8e699f85-2109-4d57-81de-5bb5430f4353**

Nathan says the general nth-order superhelical Lagrangian is the object to be varied and plugged into the UI. This reinforces that the superhelical Lagrangian and the UI are separate layers.

**2026-03-07 10:53:53.912Z, message 896e6777-3738-4a8a-bf64-973a00c9362c**

Nathan proposes a fluctuating hypersphere that may represent gravity-wave, gravity-well, and singularity-like local geometry, and calls it a possible holonomy generator. These are proposals, not already-defined metric, connection, or quantum structures.

**2026-03-07 11:05:13.866Z, message 8270405c-912d-4c88-a00f-32ad909cd83e**

Nathan expands the mapping programme: equations to curves and curves to equations, curves on the surface or interior, projections, dual-hemisphere constructions, moving attachment points, and solids of rotation. These are desired operations; the message does not supply a complete inverse algorithm or measure.

## 3. Historical assistant translation and source classification

The immediate assistant response to a27ac504, message 21399b43-fb83-491d-8e40-0be5e4317cba, claims that the construction gives every possible particle worldline, that integrating over the 4D hyperspherical volume is equivalent to summing over all paths, and that it can absolutely be the foundation of a Lagrangian.

That is stronger than the source supports. The later direct clarification in 0af476ca explicitly says a complete UI Lagrangian may not exist and that the UI was primarily conceived as a mapping/translator tool.

The later assistant response to 8270405c introduces the useful reconstruction:

X(s) = q(s) R(s) x0

with a unit seed x0, scale q, and R in SO(4). This is a plausible relative-frame point map, not a verbatim Nathan Direct equation. It fixes the first grid as the reference frame and encodes the second grid by a relative transformation. The map is not a unique inverse from point path to full frame history.

The unbylined SAT CORE UI CONFIG synthesis then adds a one-dimensional UI Lagrangian, L_UI = (1/2) r_dot^2 + (1/2) r^2 Omega_mn Omega^mn, and a broader SAT action S_SAT = integral (L_filament + L_interaction + L_timewave) d(lambda). It also sets r(lambda)=lambda. These are historical assistant-style additions, not equations supplied in the direct UI messages.

The later assistant response to 896e6777, message 62828866-9d30-47f3-bb2d-7780bdcd9e1c, says the rotating hypersphere automatically generates holonomy and associates that with quantum behavior. It subsequently lists missing superposition, complex amplitudes, and quantization. The qualification is useful; the stronger claim is not established. A path of rotations is not, by itself, a gauge connection, parallel-transport law, or holonomy calculation.

## 4. Stable glossary

| Symbol / term | Meaning | Authority |
|---|---|---|
| F0 | Fixed reference grid/frame | Direct geometric description |
| F1(s) | Moving grid/frame | Direct geometric description |
| R(s) = F0^-1 F1(s) | Relative frame after fixing F0 as identity | Assistant reconstruction |
| q(s) | Relative radial scale; source requires a zero-radius starting case | Direct ingredient; function formalized by assistant |
| x0 in S3 | Marked reference direction on the unit hypersphere | Direct ingredient |
| X(s) = q(s)R(s)x0 | Marked-point trajectory | Assistant reconstruction |
| R_prod(theta) | Ordered product of six plane rotations used by the frozen UI kernel/browser | Implementation convention |
| R_exp(kappa) | Exponential of one skew-symmetric six-plane generator used by ui4d.py | Separate implementation convention |
| S3 | Three-dimensional hypersphere surface in R4 | Standard mathematical interpretation |
| B4 | Enclosed four-dimensional ball | Possible meaning of the source's ambiguous “four-dimensional volume” |
| F_curve | One-dimensional curve functional integrated over s | Assistant reconstruction in the blind lab |
| I4 | Proposed full four-dimensional volume integral | Direct proposal; measure and integrand undefined |
| H(s) | Holonomy, requiring a declared connection and transport rule | Proposed concept, not implemented |

## 5. Mapping diagram

Direct geometry:
F0, F1(s), two marked points, radial scale q(s)
    -> relative frame R(s) and marked direction x0
    -> point path X(s) = q(s)R(s)x0
    -> optional projection/readout

Two current implementation charts:
R_prod(theta) -> SO(4) -> X(s)
R_exp(kappa)  -> SO(4) -> X(s)

Both are valid SO(4) constructions, but their six numeric inputs are not interchangeable. A chart-transition map is missing.

Inverse path readout:
X(s) -> q(s), u(s)=X(s)/|X(s)|
    -> R(s) only up to the SO(3) stabilizer of x0

At X=0, u is undefined. The forward map can still carry x0 and R as separate frame data, but the point alone cannot recover them.

The 2024 moving-plane helix construction is a different path generator: a moving plane selects a point on a fixed helix. The UI instead moves a relative frame and scale. Both generate curves, but no source-authorized map equates the two operations.

## 6. Implementation audit

### Frozen UI blind lab

- Freeze ID: SAT-UI-BLIND-20261026-001.
- Status: SOURCE_ONLY_GEOMETRY_FROZEN.
- Frozen files include index.html, ui_kernel.py, test_ui.py, ui_browser.js, and geometry/freeze manifests.
- ui_kernel.py Git blob SHA-1: 6290f93d3c700166e477a04c96adf80605dbff25.
- test_ui.py Git blob SHA-1: 12363148c3714f80ff7aa8f4fafd6ca4445eb0f1.
- Freeze manifest Git blob SHA-1: a3b2f76715f0552a2977b8c96fdc201bc39124e4.
- The frozen manifest's source_family lists SAT GEOMETRIC SOLVERS.txt, SAT CORE — UI CONFIG.txt, SAT UNODROP.txt, and ONE FILE SAT 2.pdf extracted text. It does not list the primary March 7 raw conversation.

The blind lab's browser and Python kernel use the ordered product:
R_prod(theta) = G23 G13 G12 G03 G02 G01.
The Python kernel left-multiplies each successive plane rotation in the declared order.

The kernel requires q > 0 in both generate and inverse_direction. Therefore it excludes the direct source's exact zero-radius starting point. This is understandable for the inverse direction X/|X|, which is undefined at the origin, but it means the frozen kernel does not implement the complete direct vacuum baseline.

The frozen test_ui.py exercises the product-chart kernel. It does not import or test the separate ui4d.py module.

Its curve overlay is F_curve[X] = integral ds [T|X'|^2/2 + kappa|X''|^2/2 + alpha(X' dot n)^2 + V_int(X)]. This is a one-dimensional curve functional, not the direct source's unspecified four-dimensional volume integral and not the SAT CORE L_UI expression above. The coefficients are unresolved; this remains a dimensionless geometry overlay, not a physical action.

### Separate Whirligig R/Q companion

- File: tools/whirligig_rq/ui4d.py.
- Git blob SHA-1: 6dc51596150467261086705f95b16ba92812c0c6.
- Added 2026-10-11T13:20:35Z.
- It defines K = sum(kappa_ij J_ij) and R_exp = exp(K).
- Its indicatrix forward map accepts q=0, but lift_sphere_curve rejects zero body input.
- No dedicated ui4d test file was found at the expected test path. Its __main__ block is a smoke check, not a regression suite.
- Its own header says this 4D layer is not conflated with the 3D physical rolling setup.

### Parameterization discrepancy

The frozen browser/kernel uses an ordered product of plane rotations. ui4d.py uses the matrix exponential of the sum of the six generators. Both produce valid SO(4) matrices, but the same six-number tuple does not generally produce the same matrix.

For the noncommuting planes (0,1) and (0,2), the generators satisfy:

[J01, J02] = J12 != 0.

An in-memory numerical reproduction of the two source algorithms with angles pi/2 in planes (0,1) and (0,2) gave a maximum absolute matrix difference of 0.8028499335, while both determinants were 1 and both orthogonality residuals were below 4e-15. With only one active plane, the two constructions agree.

This is a parameterization mismatch, not evidence that either matrix is outside SO(4). If both implementations are intended to share controls, a nonlinear chart-transition map is required. Otherwise, name and document them as distinct parameterizations. The numerical reproduction is a counterexample diagnostic, not a Lean proof or a repository test-suite run.

## 7. Geometric limits of the gravity and holonomy interpretations

If the entire moving hypersphere is represented by the natural extension F_s(omega)=q(s)R(s)omega for omega in S3, then R(s) is an ambient SO(4) isometry. For q(s)>0, each spatial slice retains the round metric scaled by q(s)^2. Its intrinsic scalar curvature is spatially uniform, 6/q(s)^2.

Thus global isotropic scale and global SO(4) rotation alone do not generate localized wells, tidal fields, or arbitrary singularity structure. Those require additional spatially varying deformation or a general metric field, plus a defined map from controls to that metric. The current UI kernel tracks one marked point; it does not supply that metric map.

Likewise, the code returns frame histories and point trajectories, not a connection, path-ordered transport, or loop holonomy. “Holonomy generator” remains a proposal until the base space, connection, transport rule, and loop observable are specified.

The source's phrase “full four-dimensional volume of the hypersphere” is ambiguous between the S3 boundary, the enclosed B4, or a configuration/history space. A volume measure over B4 is not automatically a path-space measure. The blind lab's F_curve integrates over one curve parameter s; it is not the direct source's unspecified four-dimensional volume integral.

## 8. Assistant-generated archive artifacts versus Nathan Direct

Two later SAT archive documents are unbylined assistant-style syntheses, not authenticated direct user messages:

1. SAT GEOMETRIC SOLVERS.txt
   - Git blob SHA-1: 5429f7cb2adbfdc0abab7db46eff4ca4de08358a.
   - Repository addition: 2026-09-04T19:53:15Z.
   - Generalizes UI to dimension-n relative frames, says spheres are optional, and describes Hilbert-space-like structure.

2. 2026/SAT CORE — UI CONFIG.txt
   - Git blob SHA-1: 6817caf68943593f31d72d51798e0ba4589624a4.
   - Repository addition: 2026-06-01T05:37:31Z.
   - Asserts that UI generates every possible worldline, sets r(lambda)=lambda, supplies L_UI and S_SAT, and defines theta-four as arccos(dX4/dlambda / |dX/dlambda|), relative to the X4 coordinate.
   - This coordinate-four formula is not the current controlling time-normal theta-four convention.

These documents may be useful historical assistant reconstructions, but they cannot override the March 7 direct clarification that the UI may not have a complete Lagrangian and is primarily a translator/mapping tool. The blind freeze's source_family should therefore be understood as a historical synthesis family, not a primary-source lineage.

The frozen baseline must remain byte-stable. A versioned successor should add the March 7 raw conversation and direct message IDs to its provenance manifest, distinguish direct geometry from assistant synthesis, and keep the separate action proposals in their own provenance class.

## 9. Proof and validation status

Existing Lean evidence was reused, not overstated:

- PR #262 contains UIRadialAngularIdentity.lean.
- Exact-head Actions run #43948452979 succeeded on the PR head with Lean 4.34.0 / Lake 5.0.0.
- The theorem proves the conditional radial/angular speed decomposition |X'|^2 = q'^2 + q^2|u'|^2 under the unit-direction and orthogonality hypotheses.
- It does not prove source fidelity, product/exponential chart equivalence, a four-dimensional volume measure, a connection, or physical premises.
- PR #262 remains open/draft/unmerged and is not current-main integration evidence.

No new Lean module or build was created because the new finding is an implementation-coordinate mismatch and source-boundary issue; the exact finite-parameter counterexample has not been Lean-formalized. No repository test suite was rerun in this pass. The in-memory matrix reproduction is not a substitute for Lean or the frozen tests.

No physical calculation, fit, prediction, CODATA comparison, measured dataset, or independent measurement was performed. SAT-O1 and Blockwave originals were not modified; their existing source-custody records remain separate.

## 10. Comptroller and workflow state

- HsH main before this run's writes: 94e25a5076543ef36af86079aeb8a0c615cd5962.
- Task graph: 16 declared branches, 18 records; one parent-only P2-to-worldtube relation and one unreachable worldtube-readout node remain unresolved. No graph repair was attempted.
- WH-01 remains OPEN / P1-HIGH. The completed 2026-11-15 17:50-17:59:59Z partition appended eight verified checkout events, taking the ledger from 59 to 67 rows. Its next cursor is 2026-11-15T18:00:00Z. Issue #1885 is REJECTED by the publisher for SHA-256 mismatch; no retry or duplicate issue was created. Traffic, Pages contribution, local clones, cloud-workspace provisioning, unique-cloner attribution, fresh-environment attribution, and traffic-clone expectation remain UNKNOWN.
- WH-02 remains the highest unblocked corrective item under Calder/authorized-maintainer ownership. WH-05 remains blocked.
- The PWH queue records four occupied/requested Mersearch lanes. No callable Mersearch action was available. GitHub/Library retrieval is a fallback, not Mersearch completion.
- P0 Code Grurple remains ACTIVE; P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned; P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE.
- FIE last reviewed November 10; next review November 24. No paper gate advanced.
- Tern's unrelated-reading cursor remains The Time Machine line 912. No new reading quantum or physical break is claimed.

### Scheduler preservation

The existing :00 task remains enabled under ID 6aa1fe0de5e48191b886496095b1343f with its exact hourly America/New_York schedule and :00 phase. The :24, :36, and :48 tasks remain enabled under their existing IDs and schedules; :12 remains disabled. No sixth task, task edit, ID change, cadence change, signet, or chat rename.

The current :00 run was observed IN_PROGRESS with chat_ref null; its cached latest result still belonged to the previous h902 Calder run. No historical Tern-thread participation or cross-thread delivery is claimed.

## 11. Next deeper cursor

1. Treat the frozen product-angle kernel and the Whirligig exponential-angle module as distinct SO(4) charts until an explicit chart transition is derived and tested.
2. Add a forward-only q=0 baseline test in a versioned successor; keep inverse normalization restricted to q>0 or preserve the seed-frame data separately at the origin.
3. Decide whether the UI's primary object is a pair of frame histories, a point path, or a path-space/configuration-space translator. Define the inverse and its SO(3) gauge.
4. Specify whether the proposed integral is over S3, B4, or a space of histories, including its measure and integrand.
5. Define the induced metric and connection before claiming local gravitational structure or holonomy.
6. Add the primary March 7 conversation and direct message IDs to any successor provenance manifest. Do not modify the frozen baseline.

**Final status:** H903_S0 / TERN_LABEL_ASSISTANT_LEVEL / UNIVERSAL_INDICATRIX_PRIMARY_SOURCE_RECOVERED / ASSISTANT_LAGRANGIAN_OVERCLAIM_QUALIFIED / PRODUCT_VS_EXPONENTIAL_SO4_CHARTS_DISTINCT / ZERO_RADIUS_DOMAIN_GAP / NO_NEW_LEAN_RUN / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION / TASKS_UNCHANGED.
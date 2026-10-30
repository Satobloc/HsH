**Publication correction note (2026-10-30):** Previous intake issue #1128 was rejected because its supplied SHA-256 did not match the exact decoded content bytes; no artifact was written. This version recomputes SHA-256 over the exact UTF-8 content below. The substantive source analysis is unchanged.

# Geometry fidelity: composite hierarchy, timesheet readout, and worldtube typing

**Date:** 2026-10-30  
**Lane:** source-first geometry fidelity. Claimed mathematics was bracketed while the direct descriptive geometry was extracted. No CODATA scoring or physical fitting.

## Result in brief

The archive contains three related but not yet composed descriptions:

1. **2024 hierarchy:** filaments → threads → twines → yarns → bundles → ropes, with higher-order 3D manifestations.
2. **2025 SAT.4D documents:** a 1D parameterized filament/worldline, a 3D time wavefront, phase-locked n-filament bundles, and a historical stability claim S(n).
3. **2026 direct H(s)H clarifications:** a finite-core worldtube; one helical core with a hollow outer superhelix; a 3D intersectional trace distinguished from the 4D filament; a 3D timesheet/bulk slice; and a proposed classical identification of worldtube curvature with inertia.

The missing bridge is not another analogy. It is a typed family of **4D composition maps**, a **timesheet projection/readout map**, and a **thickening map** from a filament to a finite-core worldtube. WWRD climbing-rope mechanics remains a first-blush geometric heuristic, not a physical equivalence.

## Source provenance

### Raw user-role sources

- **2024 DIMENSIONAL GRAVITY:** raw conversation blob 2cea1924266418e19b825b95ae51e6b7cbace7e1; direct messages aaa2ca24-b946-4878-a6e0-e74d235ab01c and aaa20385-4291-4096-94f5-881e1e975a0d. The hierarchy is already in the verified-words compendium; it was not duplicated.
- **2025 Exploring inspiration together:** raw conversation blob 789be724ffd0991dc4f2dc6db3a632dc320125e1; direct message bc8d8dac-d16a-4cf6-a473-0701d7c40286, 2025-10-30T02:08:02Z. It states the worldline/time-wavefront intersection picture and the θ4 mass-angle intuition. A large LaTeX document in user-role message 779b416f-77b4-4877-9355-1edc6929e52d is retained as a submitted document; authorship of its embedded equations is not independently established.
- **2026 Meridian Free Build:** raw conversation blob 7af1561b321f4d9364da5eb111df689efc652827. Key user-role messages: 44e9df22 (flexibility/tension/stiffness as open questions), 3c657387 (worldtube curvature/inertia proposition), 5a929b5e (timesheet as 3D bulk and rejection of a blanket no-tension summary), 28b2378a (4D filament versus 3D trace; ℓ_f as coil-diameter scale, not filament thickness; self-closure questioned), 68ea28d0 (first-order helix period, tentative), 6f00a97a (one core, hollow outer coil), 7aec988d (carrier as abstraction), and 59c5c4c6 (mixed cross-post plus direct continuation: worldlines do not wrap; straight worldtube is 90° to timesheet and 0° to propagation in flat space, hence vacuum; ER/Kerr language tentative).
- User-role messages a96d56d7 and b27ec702 identify themselves as cross-posts from Morrow/Kestrel and Mercer. They are tagged as cross-posts, not independent first-origin evidence. Message 1178f25c is a near-duplicate of 28b2378a. Message 357da9ad has unresolved quote boundaries and is not promoted as a standalone proposition.
- The 2024 assistant expansion 00211e02 adds radial-origin and electron-orbit imagery not present in the direct hierarchy. It is assistant reconstruction.

The read-it-tag-it ledger is recorded at WORKSPACES/COMMON/tagging_ledgers/2026-10-30-LOOM-WORLDTUBE-COMPOSITE-HIERARCHY-01.md, commit 8206e19fd4b41828e214b42613a352622828e6fe. New user-role excerpts were appended to WORKSPACES/COMMON/NATHAN_VERIFIED_WORDS_COMPENDIUM.md, current blob b6c3cd58922cef4c4df8bb13af09474e659560d8.

## Historical equations and their provenance

### SAT.4D document sources

- SATOBLOC/SAT4D_LIVE_DRAFT.txt, blob 2a79fe25018cce7e99a2c33786d88b0551db6ae7, internally dated June 2025 with a document byline. This is a historical document, not a raw user message.
- SAT 4D Theory Work/SAT4D_4.txt, blob efc88f4523b2fd616e64898737c2aa45e5f39b9a, internally dated July 2025. The glossary defines u^mu as normal to Sigma_t and theta_4 = angle(v^mu,u^mu); it gives ell_f = (2A/T)^(1/3), with T tension and A rigidity.
- SAT 4D Theory Work/SAT4D_5.txt, blob b45b1a85dfa7142610d9c9eeff48ab656ee192c8, is a placeholder/stub, not a complete core module.
- SAT 4D Theory Work/SAT4D_6.txt, blob 167136310cdf33ca8f986f33634692314c1a0946, internally dated July 2025. Its directive requires behavior to derive from filament geometry and intersection with the propagating 3D wavefront; no unstated assumptions, extrinsic fields, or handwaved dynamics; all else tentative.

Selected archived SAT.4D equations:

~~~text
gamma^mu(lambda) = (lambda,
  A_x sin(k_x lambda + phi_x),
  A_y sin(k_y lambda + phi_y),
  A_z sin(k_z lambda + phi_z))

v^mu(lambda) = d gamma^mu / d lambda
S[gamma] = integral d lambda L(gamma^mu, v^mu)
L = (1/2) m v^mu v_mu - V_tension(gamma)

phi_i - phi_j = 2 pi k/n,  i != j,  k in Z,  n >= 2

S(n) = 1 for n = 1, 2, 3
S(n) = 0 for n >= 4
~~~

The draft calls the worldtube a 4D volume swept out by a vibrating filament, but gives no cross-section/thickening map from gamma to that volume. S(n) is a historical stability claim, not a demonstrated theorem or measurement.

### SAT-O and Blockwave originals

SAT-O PDFs have no recovered original creation date in this pass; their extracted text was generated 2026-09-10T16:03:13Z.

- **O1** PDF SHA-256 fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d; extracted-text blob bd244e49c6b668a72131b4f195e32820d4540746. Readable equation: J^mu(x) = sum_i integral d lambda v_i^mu(lambda) delta^(4)(x-gamma_i(lambda)); nabla_mu J^mu = 0. It also gives d phi = tau_mu dx^mu.
- **O2** PDF SHA-256 36c8378e68a51cb869639cddb5b6c5080dbb6955e876566bea055d88813a8771; extracted-text blob 202d202e69c39c9eb12a52998a7c09c4c699a693. Path-integral/effective-action module; extracted equation layout is broken across lines, so no reconstructed formula is presented as verbatim.
- **O3** PDF SHA-256 36d6f94e2394b08b1e2608129be332d97498fc9f37a76a40b562072d0a1fcaa2; extracted-text blob d876a891c0e001022090e9f2eb6fe36e94e0a203. Readable proposed bracket: [gamma_i,gamma_j] = Lk(gamma_i,gamma_j).
- **O6** PDF SHA-256 496b78a9ec3e2ee16b874491d598716f614350023b5fb0331a3c129efee63bac; extracted-text blob 436d0a99d00ec1e266e66ca21f90b2d60f02bfbc. Broader unified-action module; displayed equation layout is broken across lines, so it is not silently reconstructed as verbatim.

The Blockwave action is an assistant-authored response, not a Nathan Direct equation: raw conversation blob 1f074cc67057ae9df1e92bab45e8ba34c96b0d77; assistant message 121d607d-53e7-4b5a-8a7a-75d7e09deb3d, 2025-10-19T12:29:46Z. It gives J^{mu nu} = (1/2) epsilon^{mu nu rho sigma} nabla_rho B_sigma and nabla_mu J^{mu nu} = 0. The separate BLOCKWAVE EXTENSION file, blob d870e30ddfe7baf181981f78d8d2c3be5aedb3ce, is a different variant and was not re-read in this pass.

SAT-O J^mu is a vector current; Blockwave J^{mu nu} is a two-form current. They are different tensor types. The O3 linking bracket is an algebraic invariant proposal, not a composition or projection map.

## Stable glossary and direct refinements

| Object / term | Best source-supported reading | Unresolved issue |
|---|---|---|
| Filament / worldline gamma | 2025 SAT.4D parameterization is a 1D curve; 2025 direct intuition reads a particle event at intersection with the time wavefront | 2026 direct sources distinguish a 4D filament from its 3D trace; type-changing map absent |
| Timesheet Sigma_t | 3D slice/bulk hypersurface, not a literal 2D sheet | finite active-update thickness is not parameterized |
| Time-flow normal u | normal/propagation direction of Sigma_t | metric/signature and inner product required for angle definitions |
| theta_4 | glossary convention angle(v,u) | 2025 direct phrase “angle between filament and time surface” is less precise |
| Worldtube W | finite-core object; 2025 draft calls it a 4D swept volume | intrinsic dimension and thickening map unresolved |
| Outer superhelix | hollow outer winding around one physical helical core | not a second core or a physical carrier |
| ell_f | 2026 direct correction identifies a spin-equivalent first-order coil-diameter scale | not filament thickness; mapping from 2025 formula to diameter and measured stiffness absent |
| Thread/twine/yarn/bundle/rope | 2024 composite hierarchy | explicit composition maps C_k are absent |

### Angle clarification

The 2025 direct phrase says mass is approximately proportional to theta_4 and vacuum filaments have near-zero theta_4. The July 2025 glossary specifies theta_4 = angle(v^mu,u^mu), with u normal to Sigma_t. That is compatible with the 2026 vacuum orientation, 90° to the timesheet and 0° to propagation, if the angle is measured to the normal. This is a source clarification, not a new physical derivation.

The glossary also postpones a metric/connection while using angles, lowered indices and covariant derivatives. A metric/inner product and connection must be specified before those expressions are mathematically complete. The separate 2026 correction against a refractive-index interpretation of theta_4 remains in force.

### Conditional dimension count

For transverse intersections in a 4D ambient manifold, dim(A intersect Sigma^3) = dim(A) + 3 - 4:

| Ambient object | Intrinsic dimension | Generic transverse readout |
|---|---:|---|
| Worldline | 1 | 0D event |
| Worldsheet | 2 | 1D curve |
| Embedded tube hypersurface | 3 | 2D surface |
| 4D region | 4 | 3D slice/volume |

This is a standard conditional dimension count, not a Lean-proved result in this run. The finite-core worldtube's intrinsic dimension is not fixed by the direct sources. Under generic transverse intersection, a finite union of 1D curves cannot yield a 3D slice; a higher-dimensional sweep or a specified non-transverse construction is required.

### Proposed maps, separate from archived equations

~~~text
gamma_i subset M^4
  | C_thread^(4), C_twine^(4), C_yarn^(4),
  | C_bundle^(4), C_rope^(4)        [undefined]
  v
X_k^(4)
  | P_t / I_t = intersection-readout with Sigma_t^3
  v
X_k^(3)
  | C_k^(3)                         [undefined]
  v
observed composite
~~~

If projected composition is intended to equal composition of projected constituents, a necessary compatibility condition is:

~~~text
P_t(C_k^(4)(x_1, ..., x_n)) = C_k^(3)(P_t(x_1), ..., P_t(x_n)).
~~~

This is a proposed commuting-map contract, not an original SAT equation and not yet proven. A separate thickening map T: gamma -> W_core must specify cross-section, regularity, thickness and boundary conditions. The outer coil's status as boundary, trace or winding of the same object remains undefined.

### Symmetric discrepancy ledger

1. **Nathan Direct:** the 2024 hierarchy lacks explicit composition operations; “bundle” changes composition level in the 2025 draft; the 2025 angle phrase is imprecise; the 2026 worldtube-curvature/inertia proposition still needs a metric, embedding, parameterization and projection map; timesheet thickness is not defined.
2. **Assistant reconstruction:** the 2024 expansion adds radial-origin and electron-orbit imagery absent from the direct hierarchy; the Blockwave action introduces a two-form worldsheet current without a recovered map to the direct filament/worldtube; closed-worldsheet assumptions cannot be imported where the 2026 direct message questions whether the 4D filament should self-close in the 3D cobordism.
3. **Historical project formalization:** phase-locking, tension/rigidity, linking and S(n) are useful historical formalizations, but remain hypotheses until their domains, maps and derivations are explicit.
4. **Bundle collision:** 2024 bundle is built from bound yarns; 2025 SAT.4D bundle is already a phase-locked set of n filaments. Preserve both meanings until a typed renaming/map resolves them.
5. **WWRD and linking:** WWRD rope mechanics is a geometric heuristic, not physical equivalence. Hopf link and Hopf fibration are different objects; a cross-posted correction against Hopf fibres must not be generalized into a rejection of every Hopf-link use.
6. **Tension:** unresolved, not forbidden. Direct messages ask to parameterize flexibility/tension, identify classical bending with inertia, then reject an assistant's blanket no-tension summary. No independent modulus, tension law or numerical fit is established.

## Lean and existing-tool audit

Existing HsH Lean 4/Mathlib modules and exact-head Actions runs were verified:

- KestrelProjectedIncidence.lean, commit bd359f21774deb76daca38d12f260bbfb559b533, run 41016447947 succeeded. Theorems: genuine_intersection_projects_to_overlap; projected_overlap_lifts_if_injective; disjointness_preserved_if_injective.
- KestrelReadoutComposition.lean, commit 5340af49f3a3cace8e5a749dd3ac1d62ecafbe97, run 40902356693 succeeded. Theorems: inclusion_survives_forward_map; reverse_inclusion_requires_injectivity; upstream_noninjectivity_survives_readout; composed_injectivity_requires_both_maps.

These prove generic set-map facts: genuine intersections project to overlap; the reverse implication needs injectivity; and downstream readout cannot recover distinctions lost by a non-injective upstream map. They do not prove the SAT composition/projection maps exist, physical premises are true, or source translation is faithful. No new theorem was added because the physical maps are not defined. Local Lean was not run; the cited exact-head CI runs are the actual compile/run evidence.

- **Math Hopper:** existing archive adapter and smoke-test PR #991; the full three-repository pilot remains NOT VERIFIED.
- **Whirligig:** current browser Analemma and older standalone R/Q solver are distinct. The audit treats geometry as a search constraint/heuristic, not proof of GR↔QM; re-audit remains in progress. The 2026-10-11 build log records 13 passing Python tests, but not the complete historic 4D annulum specification or a GR-QM proof.
- **SciSpace:** connected research app available, not invoked for this internal archive-provenance task.
- Fork search was bounded; no exhaustive fork-list operation was exposed.
- No new tool, dependency, paid service, branch, PR, workflow or automation was created.

## Epistemic status and next cursor

**Established:** source provenance; the angle-convention clarification; the object-type and naming mismatches; successful CI for generic projection/readout theorems.

**Not established:** physical truth of SAT/H(s)H; existence or uniqueness of C_k or P_t; worldtube intrinsic dimension; timesheet thickness; S(n) stability; measured tension/rigidity law; CODATA agreement; independent observational validation.

**Next cursor:** define typed domains/codomains for C_thread^(4), C_twine^(4), C_yarn^(4), C_bundle^(4), C_rope^(4), P_t, and T: gamma -> W_core. Specify whether Sigma_t is an ideal hypersurface or finite-thickness active-update slab; state the metric/signature needed for theta_4; resolve the two meanings of bundle; and state what information must survive projection. Only then formalize the actual maps in Lean.

No physical calculation, CODATA scoring, empirical validation, paper-gate advancement, BEDROCK promotion, or task/schedule modification was performed.

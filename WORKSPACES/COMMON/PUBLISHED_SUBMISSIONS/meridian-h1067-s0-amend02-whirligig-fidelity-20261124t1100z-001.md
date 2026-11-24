# Amendment 02 | Meridian h1067:s0 | Source-fidelity record and publisher correction

**Applies to:** the Lane 00 source-fidelity work and publisher intake issues [#2496](https://github.com/Satobloc/HsH/issues/2496) and [#2497](https://github.com/Satobloc/HsH/issues/2497).

**Status:** SOURCE_FIDELITY_FINDINGS_PRESERVED / TWO_PRIOR_INTAKES_REJECTED / NO_EDIT_OR_RETRY / AMENDMENT_02.

## 1. Publisher incident record

- Issue #2496 used `hsh.publish.v1`; the current intake requires exact `hsh-publish-v1`. Publisher result: `REJECTED: invalid schema`.
- Issue #2497 used the correct schema but a submission ID longer than the publisher's 80-character limit. Publisher result: `REJECTED: invalid submission ID`.
- Neither issue was edited, reopened, retried, or treated as published. No `PUBLISHED_SUBMISSIONS` path or successful readback exists for either issue.
- This is a distinct, compact correction artifact with a new 63-character submission ID. It is not a retry or duplicate of either rejected intake.

## 2. Lane 00 findings

### Stable glossary

- **Filament/worldtube:** later Nathan Direct description treats the 4D history as stationary in the block representation; observed particle motion is associated with filament topology, not literal filament motion.
- **Timesheet/time-surface:** a 3D bulk or wavefront, not a 2D sheet. Its interaction with the worldtube and its observer-readout map remain undefined.
- **Worldtube curvature = inertia:** direct geometric assertion; intended curvature type and metric are not yet specified.
- **`w = ct`:** standard length-like time-coordinate normalization. It yields `d2x/dw2 = F/(m c2)` from Newton's `F = ma`; this is a coordinate rewrite, not a proof or definition of worldtube curvature. The normalization note contains no 50:50 `H0 +/- c` split.
- **Whirligig:** user-described equation-transformation search/solver with multiple valid answers. “Least-wild” is a preference, not a defined metric.
- **Back Hallway draft:** the October 8 author-review PDF was directly corrected by Nathan on October 9 as a mimic that must be rewritten. It is not the canonical Whirligig action or dynamics.
- **Caliper how-to:** assistant-authored 3D backbone/transverse-tracer construction; no 3D-to-4D projection or `s` to `w` map.

### Mapping boundary

```text
4D worldtube / filament W
        | interaction or intersection map: NOT DEFINED
        v
3D timesheet / wavefront Sigma(w)
        | observer projection / readout: NOT DEFINED
        v
observed 3D trajectory and kinematics

E_GR -> encoder? -> curve family -> composition? -> curve family
     -> decoder? -> E_QM

“Least-wild” ranking has no defined metric, invariants, or round-trip conditions.
```

The July 3 `SAT ALL TOGETHER SYNTHESIS.txt` witness asserts a one-to-one worldline/timesheet account of kinematics and unchanged GR/QCD/Standard Model calculations, but it is a historical transcript witness without raw role metadata and supplies no explicit maps. The exact equation sheet cited by the Back Hallway draft remains unrecovered. `SAT.4DHH.UC` is a mixed `LLM DROP` bundle; `4DHH LAGRANGIAN (nolat).pdf` is an assistant-generated stabilization transcript. Neither substitutes for a role-authenticated source sheet.

### Source discrepancy

Historical SAT-O1 describes 1D filaments as fundamental objects with intrinsic tension and vibration. Blockwave instead uses a `(g,u,theta)` field ontology and a conserved two-form current `J` encoding filament worldsheets. Later Nathan Direct messages deny literal filament motion as primitive. The map from the SAT-O1 curve `gamma` to Blockwave's `J`, and from either to the later worldtube/timesheet description, is undefined. SAT-O1 and Blockwave use Lorentzian conventions; a later direct message explores an all-plus convention. No correction or conversion map is silently applied.

## 3. SAT-O1 and Blockwave custody

Originals were fetched again; Git blob IDs match the Morrow h1059 custody receipt. No corrected equation artifact was found or issued.

**SAT-O1 4D**

- Path: `SATOBLOC/SAT O1 4D.txt`
- Git blob SHA-1: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`
- Recorded SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`
- Source-list creation: 2025-06-07 08:38:16; last write: 2025-06-09 18:44:50; archive import: 2025-10-27 23:18:35.
- Verbatim forms: `\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)`; `S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)`; `L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)`; `\phi_i - \phi_j = \frac{2\pi k}{n}`.

**Blockwave Clean Action**

- Path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`
- Git blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`
- Recorded SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`
- Original attachment event: 2025-09-16T16:31:26.687Z; later Library copy: 2026-10-06.
- Verbatim forms: `u^\mu u_\mu = -1`; `P^\mu{}_{\nu} \equiv \delta^\mu{}_{\nu} + u^\mu u_\nu`; `J^{\mu\nu} = \tfrac12 \epsilon^{\mu\nu\rho\sigma} \nabla_\rho B_\sigma`; `\nabla_\mu J^{\mu\nu} = 0`; `F_{\mu\nu}(\theta) \equiv \nabla_{[\mu} A_{\nu]}(\theta)`; `A_\mu(\theta) \equiv \alpha_* \nabla_\mu \theta`.

Blockwave is an assistant-voiced attachment, not a Nathan-authored equation set.

## 4. Existing tools and proof boundary

- Math Hopper is an archive extraction layer, not a theorem prover or source-attribution authority; its three-repository pilot remains not end-to-end verified.
- The current Whirligig R/Q README describes a sandboxed 3D testbed, not the original general equation-to-equation solver.
- Existing PR #2261 has a successful Lean 4.34.0 CI build for a separate conditional mirror-involution result. It does not prove the Whirligig action, worldtube/inertia equivalence, or GR-QM map. No local Lean/Lake/Elan toolchain was available, so no new Lean compile/run is claimed.
- No physical calculation, fit, prediction, CODATA scoring, or independent measurement was performed. No synthetic path ratios are treated as physical quantities.
- All four canonical Mersearch request descriptors remain marked requested; no direct Mersearch action was available, and none was overwritten or retriggered. Repository search was a bounded fallback; no private HSH_RESOURCES payload was opened.

## 5. Next deeper cursor

1. Recover the exact equation sheet cited by the Back Hallway draft with source role, original path, SHA, and date.
2. Recover the actual Whirligig action, state variables, and admissible generators from primary source, separate from the Back Hallway mimic and R/Q browser testbed.
3. Define the equation-to-curve encoder, curve composition, curve-to-equation decoder, admissible transformations, preserved invariants, reparameterization rules, and metric for “least-wild.”
4. Define the intended curvature object, metric signature, and worldtube-timesheet coupling/projection maps.
5. Only then formalize precise conditional statements in Lean and compile/run them. Keep proof separate from translation fidelity and physical truth.

## 6. Run boundary

- Selected label: Meridian, h1067:s0; next ring label: Mercer. Selection does not authenticate a thread. No cross-thread delivery or acknowledgment is claimed.
- One-run Lane 00 overlay only. Meridian's persistent P0 Paper A accepted-R1 presentation-support assignment remains unchanged.
- FIE re-review remains due December 4; unrelated-source break next due November 28. P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE. No paper gate advanced.
- No theory promotion, BEDROCK change, new branch, new PR, task/ID/cadence change, sixth task, signet, or chat rename.

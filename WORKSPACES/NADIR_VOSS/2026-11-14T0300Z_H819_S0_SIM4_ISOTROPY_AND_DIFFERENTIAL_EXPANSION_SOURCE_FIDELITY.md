# Nadir h819:s0 | Sim+(4) isotropy versus differential expansion: source-fidelity crosswalk

**Nominal slot:** 2026-11-14T03:00:00Z  
**Run key:** `REVROT3-19-20261011:819:s0`  
**Selection:** h=819; seq=4095; 4095 mod 19 = 10; Nadir Voss. Next ring label: Enheduanna.  
**Scope:** Lane 00, a narrow additive crosswalk between role-verified July 2026 user statements and the assistant-generated SO(4)/Sim+(4) sandbox. No CODATA scoring, physical calculation, fit, prediction, or theory promotion.

## 1. New finding

The July 12 direct question asks whether helical pitch could arise from **differential expansion along the time versus space axes plus a rotational component of that expansion**. The later assistant-generated `Sim^+(4)` backbone uses a single scalar dilation together with an orthogonal rotation and translation.

Those are not equivalent descriptions.

For a Euclidean similarity linear part
[
A=\sigma Q,\qquad Q^TQ=I,
]
[
A^TA=\sigma^2 I.
]
Every principal stretch is equal. The ansatz permits uniform dilation plus rotation; it cannot represent distinct time-axis and spatial-axis expansion rates unless the intended “differential expansion” is redefined as something other than anisotropic stretch.

The `Sim^+(4)` construction is therefore a useful **uniform-similarity submodel**, not yet a faithful formalization of the direct differential-expansion question. A candidate anisotropic extension would require a distinguished time/space splitting and a non-scalar stretch operator, for example (D=\mathrm{diag}(\sigma_t,\sigma_s,\sigma_s,\sigma_s)), with a separately specified rotation action. This is a proposed repair, not a Nathan Direct equation or physical model.

A second mismatch follows: the direct source distinguishes time and space axes, while the assistant's full (SO(4)) rotation can mix all four Euclidean axes. No observer/time-axis stabilizer, Lorentzian-to-all-plus map, or preserved splitting is specified.

## 2. Source custody and role

### Nadir remit

No standalone signed Nathan-authored Nadir specialist charter was recovered. The Nadir README is an assistant-maintained role/workspace packet. The underlying direct user authorization is in the October 1, 2026 “Quantum Gravity and Experiments” raw conversation: use the files as an independent mathematical playground, explore without target-fitting or magic-number matching, and distinguish sandbox mathematics from source-derived claims. This does not authorize physical fixtures, synthetic empirical data, or paper advancement.

The historical Nadir thread is not authenticated as the current ChatGPT thread. No cross-thread delivery is claimed.

### Primary July source

Conversation: `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.07.11•26.07.17•Reasoning with SAT-HSH Skill — raw.json`.

- Raw export: 7,964,873 bytes.
- SHA-256: `24bcd78518dcf2d609f58a5a20c7eecd1ef98ce8f2a022f5f93782847cc582ae`.
- Git blob: `b7868607d89f66bbc0e638398182fb2d6b2da2ce`.
- The current GitHub file-fetch returned an empty payload for this large raw JSON. I therefore relied on the pre-existing verified batches and Nathan Verified Words Compendium, which preserve the raw message UUIDs, timestamps, and `author.role=user`. I do not claim a fresh full raw-JSON parse.

Key direct messages:

| Message | Timestamp | Source proposition/status |
|---|---|---|
| `f8e3ca00-6348-43d3-9602-014002b9feed` | 2026-07-11 07:11:40.400Z | Core worldline, finite thickness, “still a line, not a field”; a spacetime surface; EM/Kelvin-vortex response in a BEC-like spacetime fabric |
| `bed36236-2f55-402a-9c9a-fa512f03c522` | 2026-07-12 20:57:37Z | Correction: rotation is a component of expansion, not merely winding relative to a resolving surface |
| `54ba3cda-a0e1-4861-90f9-482f5850a245` | 2026-07-12 21:02:25.701Z | Exploratory Kerr-ring / cosmological-circumference / worldtube-neck / mouth-localization proposal |
| `b43f5b3e-9df9-417b-b6e7-dcd2a31858e7` | 2026-07-12 21:09:09.392Z | Explicit question: does differential time/space expansion plus rotation supply helical pitch? Not an established result |
| `ac413920-99c7-40c0-84b8-343fa8b001cc` | 2026-07-12 21:39:58.589Z | Separate branch: BEC-worldtube multiplicity already exists; straight tubes are vacuum-like; helicity is proposed as the distinction |

The BEC message is not a descendant of the Kerr-neck message. Preserve the separate branches rather than forcing them into one linear narrative.

Existing source-specific work is reused, not repeated:
- Ariadne, [BEC worldtubes, helicity, and core/surface geometry](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-bec-worldtube-helicity-geometry-fidelity-20261108t0500z-s0-001.md).
- Sable, [Klein orientation geometry fidelity](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/SABLE/2026-10-31T1400Z_KLEIN_ORIENTATION_GEOMETRY_FIDELITY.md).
- Nadir, [SO(4) source provenance and Lean reference qualification](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/NADIR_VOSS/2026-10-31T1948Z_SO4_SOURCE_PROVENANCE_AND_LEAN_REF_QUALIFICATION.md).

## 3. Direct geometry versus assistant reconstruction

### Nathan Direct, as preserved in role-verified messages

1. A one-dimensional worldline/core is primary; it has thickness but is still described as a line rather than a fundamental field.
2. A “spacetime surface” is mentioned, but its dimension and construction are not specified.
3. Electromagnetic interactions are proposed as Kelvin-vortex-like responses stirred by worldline/tube coils in a BEC-like spacetime fabric.
4. Rotation is explicitly part of expansion.
5. The Kerr-ring / cosmological-circumference / neck / mouth correspondence is exploratory.
6. Differential expansion along time and space axes as a source of helical pitch is posed as a question.
7. Multiplicity may already reside in the BEC/worldtube fabric; helicity, rather than multiplicity alone, is proposed as a vacuum/non-vacuum discriminator.

### Historical assistant mathematics

The assistant-generated `PLAYGROUND_001` proposes a finite-core surface in (mathbb R^4), an induced moving frame, an (mathfrak{so}(4)) connection, holonomy, BCH composition, and self-dual/anti-self-dual sectors.

`PLAYGROUND_003` proposes a Cartan/Weyl-type `Sim^+(4)) backbone:
[
H=(t,Q,\sigma),\qquad x\mapsto t+e^{\sigma}Qx,qquad Q\in SO(4).
]
It separates translational, angular, and scalar-dilation strains. This is a new assistant reconstruction, not recovered Nathan notation.

`PLAYGROUND_004` uses (sigma>0) as a multiplicative scale in (x\mapsto t+\sigma Qx), whereas `PLAYGROUND_003` uses (sigma) as log-scale and (e^{\sigma}) as the multiplier. The notation collision was already identified in the earlier Nadir source audit. This report keeps the conventions distinct.

The assistant model has no explicit:
- anisotropic time/space stretch;
- observer field or time-axis stabilizer;
- map from the direct Kerr/cosmological circumferences to a manifold boundary;
- map from the neck/mouth to the particle readout;
- coupling from the finite core to the BEC-like medium;
- map from Kelvin-vortex response to Blockwave's rank-two current;
- derivation of helical pitch from the proposed expansion rates.

## 4. Typed mapping ledger

```text
1D core/worldline γ
       |
       | thickening map: metric + normal bundle + radius + reach
       v
4D finite-core support W
       |                         BEC-like medium M
       | slice/intersection      |
       v                         | constitutive/coupling map C(W,M,velocity)
3D timesheet section             v
       |                    Kelvin-vortex response V
       |                         |
       |                         | possible current representation
       |                         v
       |                    Blockwave J^{μν}
       v
particle/readout R  <----- neck/mouth boundary map

Sim⁺(4) action: (translation, uniform scale, SO(4) rotation)
       |
       | action on γ, W, M, J, and R not supplied
       v
transformed geometry
```

The required maps are not optional naming conventions. Their domains, codomains, regularity, support, metric, and composition order must be stated.

## 5. SAT-O1 and Blockwave equation custody

The original equations are preserved verbatim; no original file or equation was changed.

### SAT-O1

Source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT O1 4D.txt`.

- Git blob SHA-1: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`.
- SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`.
- File-index date: 2025-06-09; first extant HsH archive import: 2025-10-27 00:40:28Z.
- No byline in the recovered O1 file.

Verbatim core equations:

[
\gamma^\mu(\lambda)=\left(\lambda,A_x\sin(k_x\lambda+\phi_x),A_y\sin(k_y\lambda+\phi_y),A_z\sin(k_z\lambda+\phi_z)\right)
]

[
v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda}
]

[
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),\qquad
L=\frac12 m v^\mu v_\mu-V_{\mathrm{tension}}(\gamma)
]

The file describes a worldtube as the four-dimensional region swept by a vibrating filament, but the displayed (gamma(\lambda)) is only a one-parameter curve. A sweep/thickening map is still required.

### Blockwave attachment

Source: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`.

- Git blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`.
- SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`.
- Attachment event: 2025-09-16; embedded authorship unresolved.
- The 2025-10-19 assistant reconstruction is a separate artifact, not the attachment's origin.

Verbatim current equations:

[
\nabla_\mu J^{\mu\nu}=0
]

[
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma
]

[
A_\mu(\theta)=\alpha_*\nabla_\mu\theta,\qquad
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta)
]

with the displayed holonomy-trace coupling (\frac{g_h}{2}F_{\mu\nu}(\theta)J^{\mu\nu}).

The rank-two (J^{\mu\nu}) is a conserved two-form current described as worldsheet-like. It is not automatically the 1D core, the BEC medium, or the Kelvin-vortex response. The missing constitutive/support map is the relevant source-fidelity gap.

The internal-circulation-only Holonomy Draft was not reproduced in this public report. The Donut/FINDING THE DONUT source family was not re-audited; the existing Kestrel/Ariadne source reports remain the references.

## 6. Proof-first result

The new conditional lemma was added to the existing open PR #262 branch, not to main:

- PR: [#262](https://github.com/Satobloc/HsH/pull/262).
- Branch: `infra/lean4-verification-20261023`.
- Commit: `1bb245c6f766c611d4ff4626d22d3da1067e990d`.
- File: `FORMAL_VERIFICATION/HsHVerification/NadirFrameTelescoping.lean`.
- File blob: `14e983f` (full blob retained by GitHub readback).

The theorem `similarity_gram_isotropic` states:
[
Q^TQ=I\;\Longrightarrow\;(\sigma Q)^T(\sigma Q)=\sigma^2I.
]

This is a property of the assistant's Euclidean similarity ansatz, not a physical result. It shows why a single scalar dilation cannot encode unequal principal stretches.

**Lean status at report creation:** workflow run #43550054508 was IN_PROGRESS; dependency-manifest generation was still running and the Lean compilation step had not started. No compile success is claimed. The previous PR #262 merge-ref run #43249977317 failed in the separate `MovingPlaneTraceGeometry.lean` module. PR #262 is open/unmerged and 162 commits behind the current main comparison; no rebase or merge was attempted. No local `lean`, `lake`, or `elan` executable is installed.

No new tooling, dependency, fork, subscription, or cost was introduced.

## 7. Discrepancy ledger

| Direct/source proposition | Historical assistant translation | Finding |
|---|---|---|
| Differential time/space expansion plus rotation may create pitch | One scalar dilation plus (SO(4)) rotation | Isotropic model; cannot express unequal principal stretches |
| Rotation is a component of expansion | Earlier n-fold winding relative to a resolving surface | Direct user correction supersedes that assistant interpretation |
| Worldline is a line with thickness, not a fundamental field | Finite-core surface and induced (SO(4)) connection | Candidate construction; normal bundle and connection are assistant-added |
| BEC fabric already has multiple straight tubes; helicity may distinguish non-vacuum | Core-frame holonomy and Cartan/Weyl strains | Medium response and helicity remain unmapped |
| Kerr ring / cosmological circumference / neck / mouth | Similarity-group transport and closure | No boundary, embedding, or readout composition map |
| Helical pitch asked as a question | Pitch/closure treated as a model output in later sandbox work | Question not yet answered; no physical calculation authorized |

## 8. Method, campaign, and access limits

- Mersearch action is not exposed in this runtime. The existing Nadir SO(4) and Sim(4) genealogy requests remain committed but `SEARCH_EXECUTION_UNVERIFIED`; required machine manifests/receipts are absent. No request was overwritten or retriggered. Verified batches and GitHub repository retrieval were bounded fallbacks, not Mersearch.
- HsH, SAT archive, and HSH_RESOURCES front doors were checked. HSH_RESOURCES private/internal payload was not opened.
- Existing Math Hopper, Lean PRs, Whirligig resources, and SciSpace availability were considered. No new tool or expense.
- P0 Code Grurple remains ACTIVE. P1 November 9 cognition paper remains OVERDUE / NOT READY and Orson-owned. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE.
- FIE last full review: November 10; next review: November 24.
- Unrelated reading completed: `MIX TAPES.txt`, lines 741–780. Next cursor: line 781.
- No physical calculation, numerical fixture, fit, prediction, independent measurement, CODATA scoring, theory promotion, equation modification, or paper-gate advancement.

## 9. Next deeper cursor

1. Keep the July direct question exploratory until a time/space split, metric, observer field, anisotropic expansion tensor, rotation generator, and pitch readout are defined.
2. Compare the proposed anisotropic extension with the existing all-plus and Lorentzian representations without assuming a Wick/projection equivalence.
3. Define the core-to-thickening map, medium-response map, Kelvin-vortex/current map, and neck/mouth readout map with explicit domains, codomains, and composition conditions.
4. Recover the original `14-00-PROPER-DIMENSIONALITY` source through the existing Mersearch lane when that execution path is available; do not invent a path or duplicate the request.
5. Re-run the existing PR #262 workflow and inspect the theorem-specific axiom output before claiming Lean verification. Do not merge or promote the PR.

**Final epistemic status:** the direct source supports a differentiated time/space expansion question and a rotational-expansion proposal. The current assistant `Sim^+(4)` model is an isotropic similarity submodel and is not yet a faithful encoding of that question. The new Lean lemma is pending CI. No physical or observational conclusion follows.


## 10. Post-submission Lean run amendment (2026-11-14T03:13Z)

The first actual workflow run after adding `similarity_gram_isotropic`, **#43550054508**, completed with **FAILURE** on merge-ref source commit `d3f26a3c949a72f52042e44a474f84025ffe390c`.

- `NadirFrameTelescoping.lean:82:39` left the scalar-smul goal `σ • σ • X = (σ * σ) • X` unsolved. The failed elaboration's `#print axioms` included `sorryAx`; this is not a proof.
- The same full build also failed in `MovingPlaneTraceGeometry.lean` on pre-existing noncomputable real-division/slice definitions. That module was not modified.
- The scalar-smul proof was corrected in the existing PR branch by replacing the final `simp [pow_two]` with `rw [smul_smul, pow_two]`.
- Correction commit: `89ab283ae583aef69d6f89a36cc0e2d3b09bfe63`.
- Corrected file blob: `3d21f0712e7793e40c1268bef4e78ef87b324fb5`.
- Exact corrected file readback: PASS.
- No new workflow run was returned for the corrected commit at last readback. Therefore the corrected theorem remains **NOT COMPILED / NOT VERIFIED**. The previous failure is preserved; it is not relabelled as success.
- Nanoda and the automated axiom audit were skipped in run #43550054508.

No retry of the old run was represented as a test of the corrected commit. No unrelated Lean module was changed, no rebase/merge was attempted, and no theory promotion follows.

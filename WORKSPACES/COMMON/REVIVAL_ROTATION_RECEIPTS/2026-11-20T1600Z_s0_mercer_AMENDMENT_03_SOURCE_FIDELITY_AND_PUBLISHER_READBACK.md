# h976:s0 amendment 03 | publisher readback, expanded geometry fidelity, and formalization status

**Original receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-20T1600Z_s0_mercer.md`  
**Created:** 2026-11-20T16:25Z  
**Nature:** additive reconciliation only. No original report, equation source, task, branch owner, paper gate, or automation configuration is rewritten.

## 1. Publisher status correction

The canonical h976 receipt's last status line is stale.

- Existing issue: [#2204](https://github.com/Satobloc/HsH/issues/2204).
- Publisher confirmation: [comment #7044642286](https://github.com/Satobloc/HsH/issues/2204#issuecomment-7044642286).
- Submission ID: mercer-h976-stellar-fidelity-20261120-1600-001.
- Artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-h976-stellar-fidelity-20261120-1600-001.md.
- Artifact commit: 638d7c155bb820dd340a550b28899b79d1582206.
- SHA-256: 635a39bdcc4a09e4cd09d1e0e18276c87060984ebdf7e90935a1a0dd588a3a96.
- Workspace report and artifact match exactly at 16,348 characters. The issue body is an hsh-publish-v1 envelope; its content field matches the artifact, and its declared digest matches the publisher confirmation.

**Correct status: PUBLISHED_VERIFIED.** This supersedes SUBMITTED_NOT_VERIFIED in the canonical receipt and the original Ravel packet body.

Ravel's publisher-status amendment 01 and the unique publisher-status entry in Ravel INBOX already exist and were read back. No further inbox append, handoff, issue, or comment was created.

## 2. Continuity correction

The h976 continuity note explicitly records that the attempted write to Mercer CONTINUITY.md failed and that readback left that file at h968:s2. The canonical receipt's statement that both README and CONTINUITY were updated is therefore inaccurate.

- Mercer README contains the h976 checkpoint and PUBLISHED_VERIFIED status.
- The separate dated file WORKSPACES/MERCER/2026-11-20T1600Z_H976_S0_CONTINUITY_NOTE.md exists and is the additive h976 continuity record.
- Mercer CONTINUITY.md remains at h968:s2.
- No second large-file write was attempted.

This amendment corrects the receipt without rewriting the standing CONTINUITY file.

## 3. Expanded primary geometry cluster

### 3.1 Raw direct-source witness

The principal raw witness remains the Meridian Minkowski Ring Analysis export:

- Conversation ID: 6ad7e9c0-e8a0-83e9-984e-94d020de3abf.
- Git blob: 56a84cb85d5c386efa4ea11d322d11e95e2c7703.
- 3,678 mapping nodes; 112 user-role messages.
- A broader keyword pass found 25 user-role messages touching the geometry. These are not all automatically promoted to Nathan Direct: some contain quoted or imported material. The original report's 15-message direct set was conservative; the additional messages below are source candidates requiring attribution discipline.

Relevant user-message locators include:

- 663cf5c0-2e16-4a0c-9ad7-8a4e8c1b0c22: the large circles are described as our own light cone, explicitly contrasted with collisions with another universe.
- 0862c7a3-...: the Big Bang is described as the inner circumference of the donut, not the center of our slice; the associated length scale remains unspecified and is related verbally to finite core and maximum stretch.
- c02c52dd-... and d8c617...: stellar disappearance is first attributed to a light-cone wrinkle, then broadened to slight propagation anisotropy and local deflection possibilities.
- 7d9098...: emission spheres/light cones are described as distorted by spacetime geometry.
- 19cf... and 5d1d...: the universe is proposed as a gravitational lens; the user asks about magnification, demagnification and Einstein-equation support rather than supplying a lens solution.
- 59cd...: the user states that 3D rotation is 4D curvature and that 3D acceleration is. The term curvature is not defined there as intrinsic Riemann curvature, extrinsic worldtube curvature, or kinematic acceleration.
- f658...: expanding-Minkowski geometry and 4D curvature-as-acceleration are stated as a working hypothesis, not a demonstrated solution.
- b12a..., 3db230..., and bc09...: a schematic balanced expansion/contraction expression is discussed, with an explicit instruction to use a dimensionally appropriate version rather than combine H0 and c directly.

The raw conversation therefore contains more than the two short geometric slogans. It also contains the scale, curvature, propagation, lensing, and kinematic surfaces that constrain their interpretation.

### 3.2 Current BEDROCK supersession and normalization

The current BEDROCK records the later, controlling formulations:

- ND-2026-10-20-01 defines the dimensionless Hubble-scale comparison as epsilon_H(L) = H0 L / c = L / R_H, with R_H = c/H0. The metric/curvature object, simultaneity foliation, frame, radius/epoch, and invariant readout still need explicit specification.
- ND-2026-10-20-02 separates expansion, rotation, shear, acceleration, intrinsic curvature, and extrinsic/worldtube curvature. Its equal-rate block-rotation example uses V = Omega X, Omega transpose = -Omega, and Omega squared = -omega squared times the identity, giving zero divergence and centripetal acceleration in the stated Euclidean kinematic model.
- ND-2026-10-22-03 explicitly says not to presuppose CTCs, an ER bridge, an ergosphere, or a medium law unless the equations establish them.

The bare schematic H0 plus/minus c is dimensionally invalid because H0 and c have different units. The current scale-level form c plus/minus H0 L and the dimensionless epsilon_H(L) are the typed alternatives. The direct statement that the simultaneity surface is approximate and varies with altitude above mass is also retained. The proposed surface-of-simultaneity-to-Hubble-radius curvature remains a proposal until its metric, foliation and invariant are defined.

An existing Meridian FLRW comparator gives a useful negative control: in a spatially flat FLRW model, the intrinsic three-curvature is 3R = 6K/a^2, so K = 0 gives 3R = 0 independently of H0. A difference in H0 alone therefore does not establish nonzero intrinsic spatial curvature. This does not refute a distinct H(s)H curvature object; it prevents conflating the Hubble tension with a measured curvature parameter.

### 3.3 Earlier speaker-labelled cosmology transcript

The SAT archive file HsH COSMOTOPOLOGY.txt (Git blob 9f42b96...) is a 98,432-character, speaker-labelled NATHAN/CHATGPT transcript, not a raw JSON conversation export matched in this run.

It contains an older direct-source layer describing a particle worldtube as an ER-bridge-like throat, ring/neck, CTC family, a roughly sphere-like opening, and a torus/Klein-bottle family with inner and outer circumferences, crossed figure-eight and Hopf-ring constructions. The acronym Kerr CSC is not expanded or formally defined in the transcript.

**Historical status matters:** the old transcript includes the direct statement that without CTCs there is no model. The current BEDROCK later supersedes that commitment by prohibiting presupposition of CTCs or an ER bridge. The current working description is a self-recirculating, internally rotating, stretched/twisted, toroidal/cruller-like worldtube, but its topology, causal character, and Einstein/Kerr realization remain uncompleted. The old CTC/ER language must not be silently reintroduced as current fact.

### 3.4 Other meanings of “donut” kept separate

The archive contains several distinct constructions:

1. **Current direct light-cone / inner-circumference proposal:** two separate propositions in the Meridian Minkowski Ring Analysis source. No map equates them.
2. **Particle-worldtube / torus / Klein-bottle transcript:** older speaker-labelled HsH cosmology material, partly superseded by current BEDROCK constraints.
3. **Cruller-Rubin R0:** a coauthored working draft naming Nathan McKnight and Meridian, not an assistant-only artifact. Its specific Euclidean 3D torus equations are conditional model constructions, not direct Nathan equations or a derived 4D H(s)H metric. For its parameterization X(u,v) = ((R+r cos v) cos u, (R+r cos v) sin u, r sin v), the induced section metric is r^2 dv^2 + (R+r cos v)^2 du^2, the inner ring circumference is 2 pi (R-r), and the Gaussian curvature is cos(v)/(r(R+r cos(v))). These are standard Euclidean torus results; they do not establish that the cosmological inner circumference or observed sky circles are this section.
4. **Meridian compact-topology/matched-circle sandbox:** the conditional relation cos(alpha) = D_gamma/(2 chi*) belongs to an assistant-generated compact-quotient comparator. It is not a direct identification of the user's large circles. It is not a collision-with-another-universe model, but no source-defined map connects it to the direct light-cone proposition.
5. **Lightcone Donut Playground:** a GPT-5.5-generated speculative torus/holonomy and action sketch. If h_ab is the induced metric, then h^{ab} partial_a X dot partial_b X = h^{ab} h_ab = p, so the proposed carrier term is constant in worldvolume dimension p, not a dynamical kinetic term. The image and chiral terms also lack a complete field, measure, gauge, and projection specification. This is not an implemented simulation or a physical model.
6. **SAT archive Donut canon.txt** (Git blob be985c29...): a historical LLM-generated SO(3)-holonomy/torus-flow construction using two S2 curves and frame holonomies. It is not the same object as the Cruller torus, the observer light cone, or the particle worldtube. The connection, base manifold, log branch, Lie-algebra-to-scalar map, and physical projection are not completely specified.
7. **ONE DROP UNIVERSE NotebookLM export** (HsH blob 1cc3ae0596ae8429d1986e1affe5041938b29176): 498 messages, all labelled role=user, with 63 sources and 223 studio outputs. Those role labels do not authenticate authorship. It is not a raw Nathan conversation. Ravel's existing geometry audit correctly notes that three equal sphere surfaces with equilateral centers in ordinary three-space intersect in two points, not a shared circle. That adjacent correction is not a cosmological light-cone result.
8. **RMS Spacetime Filaments.txt:** an earlier SAT/RMS toy-theory description with a propagating 3D time surface and intersecting filaments. No projection/composition map to the current H(s)H worldtube/timesheet or cosmological light-cone geometry is supplied.

### 3.5 Glossary and mapping diagram

- Observer light cone: direct geometric referent for the large-circle statement; temporal orientation and observer-screen map remain incomplete.
- Big Bang inner circumference: a distinct direct spatial-locus proposal; its length and embedding are unspecified.
- Particle worldtube: a current 4D support concept; the older ER/CTC realization is not controlling.
- Timesheet: a 3D section/readout object, not an additional fifth coordinate.
- Cruller torus section: a conditional Euclidean 3D parameterization, not the native 4D worldtube.
- Matched circles: a compact-topology comparator, not a direct source claim.
- Stellar wink: an observed-event question with competing mechanisms, not a measured H(s)H prediction.
- epsilon_H(L): a dimensionless Hubble-scale normalization, not itself a curvature measurement.

Mapping inventory:

Nathan Direct observer-lightcone claim
  -> coordinate null-cone comparator
  -> fixed-time spherical section
  -> observer screen / emission-surface / Jacobi map [MISSING]

Nathan Direct inner-circumference claim
  -> Euclidean Cruller torus section [ASSISTANT-DEFINED]
  -> inner-ring circumference formula
  -> 4D worldtube embedding and physical scale map [MISSING]

Nathan Direct 4D rotation/curvature language
  -> BEDROCK block-rotation kinematics
  -> zero-divergence and centripetal-acceleration identities
  -> intrinsic/extrinsic/Riemann-curvature identification [MISSING]

Nathan Direct stellar-wink question
  -> ordinary lensing / propagation / astrophysical controls
  -> gravitational-polarization response P_ijkl [ASSISTANT-PROPOSED]
  -> stress-energy response, metric perturbation, null-geodesic map and measured selection function [MISSING]

### 3.6 Original propositions versus translations

| Original or current source proposition | Historical/assistant translation | Fidelity status |
|---|---|---|
| Large circles are our own light cone, not collisions with another universe | Compact-topology matched-circle construction | Plausible comparator only; no source map |
| Big Bang is the donut's inner circumference | Euclidean 3D torus inner ring with length 2 pi (R-r) | Conditional geometry; no 4D embedding or scale map |
| Stellar disappearance may be a light-cone wrinkle | Anisotropic propagation, gravitational lensing, dust/occultation and survey selection | Competing hypotheses; no data or prediction |
| Hubble scale and simultaneity-surface curvature are related | epsilon_H(L) normalization and FLRW controls | Scale is typed; metric/foliation/invariant still missing |
| 3D rotation/acceleration is 4D bending | Equal-rate Euclidean block rotation | Kinematic identity only; not Riemann curvature or GR |
| Particle worldtube has CTC/ER-throat realization in older transcript | Torus/Klein-bottle and Kerr-ring constructions | Historical proposal superseded by current no-presupposition rule |
| SAT-O1 curve represents a filament | One-parameter gamma in R3,1 treated as a worldtube | A one-parameter curve is a worldline; a 4D worldtube requires an additional family/sweep map |

### 3.7 Discrepancy ledger

1. The h976 report omitted the current BEDROCK Hubble normalization and the direct H0/L/c scale surface. This amendment restores it.
2. The h976 report's description of Cruller-Rubin R0 as assistant-generated was too strong. The draft names Nathan McKnight and Meridian as coauthors. Its specific Euclidean torus equations remain conditional constructions whose individual source authorship is not established.
3. The older HsH cosmology transcript's CTC/ER commitment is superseded by current BEDROCK. Do not treat it as the current model.
4. The direct light-cone and inner-circumference statements remain separate. The matched-circle, torus-section and worldtube constructions do not yet supply maps between them.
5. The lightcone Donut Playground carrier term degenerates to p if h_ab is induced. Its action is not ready for physical interpretation.
6. The historical Donut canon SO(3) holonomy construction is a separate assistant-generated torus-flow model, not a derivation of the current Cruller or observer light cone.
7. The ONE DROP UNIVERSE NotebookLM export has unreliable role labels and cannot establish Nathan Direct authorship.
8. SAT-O1's gamma(lambda) is a one-parameter curve in R3,1, hence a worldline; the prose's 4D-volume/worldtube interpretation requires a separate sweep or family map.
9. Blockwave is an assistant-voiced attachment. With A_mu = alpha_* partial_mu theta and F = dA, F vanishes locally for a smooth single-valued theta; nonzero holonomy requires nontrivial patching, defects, or an independent connection. No correction is applied to the original.
10. The FLRW K=0 control shows H0 variation alone does not imply intrinsic spatial curvature. It does not settle a different H(s)H curvature proposal.
11. The gravitational-polarization P_ijkl response and its map to metric perturbation and lensing Jacobian remain assistant-proposed and lack a constitutive definition.
12. The Rubin angular-band forecast uses synthetic candidates and toy selection; it is not a Rubin data analysis or independent prediction.

## 4. SAT-O1 and Blockwave original custody

Both original blobs were re-fetched and their Git blob identities match prior custody. The SHA-256 values below are carried forward from prior verified custody records; no original was edited or normalized.

### SAT-O1 4D

- Git blob: 7577aa1ee5a6c3850ce3b226c75377de6367aedc.
- SHA-256: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937.
- Provenance: unbylined; FileIndex creation 2025-10-26; last-write 2025-06-09 18:44:50, timezone unspecified.

Verbatim source equations:

[
gamma^mu(lambda) = igl(lambda,; A_xsin(k_xlambda+phi_x),; A_ysin(k_ylambda+phi_y),; A_zsin(k_zlambda+phi_z)igr)
]

[
L = rac{1}{2}m,v^mu v_mu - V_{m tension}(gamma)
]

Source-level limits: the parameterized object is a one-dimensional curve in four-dimensional spacetime. It is not, by itself, a four-dimensional worldtube. Metric signature, parameter normalization, units, and the family/sweep map needed for a worldtube remain unspecified. The original is unbylined and is not promoted to Nathan Direct.

### Blockwave

- Git blob: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d.
- SHA-256: 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664.
- Provenance: user-supplied attachment; raw attachment node 9ae20939-a3b7-4e7f-ba7c-313f537fd525 at 2025-09-16T16:31:26.687Z. Embedded prose remains assistant-voiced.

Verbatim core action:

[
S=int d^4x,sqrt{-g}Big[
rac{M_{m Pl}^2}{2}R
+alpha_1,u^mu u^
u R_{mu
u}
+alpha_2,(
abla_mu u^mu)^2
+alpha_3,
abla_mu u_
u 
abla^mu u^
u
+rac{kappa_0}{4},J_{mu
u}P^{mu}{}_{ho}P^{
u}{}_{sigma}J^{hosigma}
+rac{kappa_2 ell^2}{4},(
abla_alpha J_{mu
u})P^{alpha}{}_{eta}P^{mu}{}_{ho}P^{
u}{}_{sigma}(
abla^eta J^{hosigma})
+rac{g_h}{2},F_{mu
u}(	heta)J^{mu
u}
+mathcal{L}_	heta
+mathcal{L}_{m image}
Big].
]

Source-level limits: the action is medium-first and Lorentzian, with a unit timelike u, projected two-form current J, compact phase theta, and an emergent metric g. It is not the current BEDROCK native positive-Euclidean ambient model. The exact-gradient field-strength issue above remains. Several definitions, index conventions and the image term require repair before the action is reusable. No corrected Blockwave equation is created here.

**Corrected SAT-O1 equations: none. Corrected Blockwave equations: none.** Any future repair must be separately labelled and must not overwrite either original.

## 5. Existing formalization and new draft status

### Existing Lean infrastructure

- PR #262: open, unmerged infrastructure PR on branch infra/lean4-verification-20261023.
- Exact-head build: Actions run #43948452979, job #133584241306, head 368f9af8d95d061b4581688759ed3eda309e9886.
- Lean 4.34.0 / Mathlib 4.34.0; the existing project compiled successfully.
- Existing modules include NadirHelixSliceGeometry and MovingPlaneTraceGeometry. They formalize earlier Euclidean helix/slice and moving-plane/parabola constructions, not the current cosmological light-cone, Hubble normalization, or observer-screen map.
- The PR branch is a shared base for other dependent work and was not modified.

### New conditional comparator draft

- Draft PR #2206: https://github.com/Satobloc/HsH/pull/2206.
- Branch: mercer/h976-lightcone-hubble-kinematics.
- Head: 0a44decd979c4ae57a28de5014849f22b2255699.
- Base: infra/lean4-verification-20261023 at 368f9af8d95d061b4581688759ed3eda309e9886.
- File: FORMAL_VERIFICATION/HsHVerification/HubbleLightconeKinematics.lean.
- It contains draft statements for a coordinate-level past-null-cone spherical slice, the epsilon_H algebraic normalization, and the equal-rate Euclidean 4D block-rotation skew/trace/square identities.

**No successful build is claimed for PR #2206.** No workflow run was returned for its head. The existing workflow is on the unmerged non-default base branch; the stacked draft did not trigger it. No local Lean/Elan installation exists in the execution container, and outbound network access was unavailable. The new file is therefore an uncompiled formalization draft, not a verified Lean result. It must remain draft until an exact-head Lean/Mathlib run succeeds after the infrastructure dependency is available. The real-valued model does not encode units, physical metric, source-to-sky map, or the truth of the physical premises.

No Factory Floor submission, BEDROCK promotion, physical calculation, fit, prediction, independent measurement, or CODATA scoring follows from this draft.

### Existing tool check

- Math Hopper issue #578 remains open. PR #991 remains open/draft; its existing smoke run #40841280647 succeeded, but source-coverage warnings remain. No new archive search or tooling was launched.
- Existing Whirligig solver artifacts were inspected; the continuous spectral Navier-Stokes solver is not a substitute for the present geometry proof.
- SciSpace connector is available; it was not needed for this source-custody task.
- HSH_RESOURCES Tool Chest and Reference Desk router were read. No new dependency, fork, subscription, paid service, or tool was added. Fork enumeration was not reliably exposed by the GitHub connector, so no fork-availability claim is made.

## 6. Mersearch, reading, and operational state

- Mersearch is not available as a callable action. All four canonical request lanes remain occupied/requested and their request-scoped output manifests/receipts are absent. No lane was overwritten or retriggered.
- The existing 2026-10-10 Orson One Drop Universe Mersearch result was used only as a navigation aid. The NotebookLM export was inspected as generated material, not accepted as raw Nathan conversation.
- Unrelated SAT archive reading completed at fun break - lx.txt lines 2502-2541. Next cursor: 2542.
- FIE last reviewed November 10; next due November 24. No premature review.
- Task graph remains ACTIVE_SEED, 16 declared branches and 18 records.
- P0 ACTIVE; P1 November 9 OVERDUE / NOT READY; P2 November 30 HOLD; P3 December 14 INCOMPLETE. No paper gate advanced.
- HsH main branch at reconciliation: 3a7403efdef4dc904525661a010a22f8c566f190. SAT archive main: 8fa79f3a598e69cbdd25c15288927d79559a498a. HSH_RESOURCES main: f3b61aeecdd8892461d47c7016d445458bed5c31.

## 7. Next deeper cursor

1. Keep observer light cone, Big Bang inner circumference, particle worldtube, timesheet, Cruller torus section, and compact-topology matched circles as distinct objects until explicit projection and composition maps exist.
2. Specify the metric, foliation, frame, epoch, null congruence, emission-surface cross-section, observer screen, and Jacobi map before interpreting stellar disappearance as an H(s)H effect.
3. Distinguish intrinsic three-curvature, four-dimensional Riemann curvature, extrinsic worldtube curvature, and kinematic acceleration. The old CTC/ER transcript is not the current controlling position.
4. Obtain an exact-head Lean run for draft PR #2206 only after the shared #262 infrastructure is available. Record all remaining proof assumptions and the fact that units are not encoded.
5. If the source-linked kinematic or Hubble-scale lemmas are retained, route only after successful formal verification and review. Do not present them as physical validation.
6. Recover a raw JSON witness, if one exists, for HsH COSMOTOPOLOGY.txt and the original One Drop Universe conversation. Do not promote speaker-labelled or NotebookLM role labels to raw-source authorship.
7. Keep SAT-O1 and Blockwave originals immutable. Any corrected equations must be a separate, attributed derivative with independent review.

## 8. Preservation

This amendment does not change the standing Mercer P0 assignment, any worker ownership, any paper gate, any task identity, or any automation. No sixth task, task/ID/cadence mutation, signet, conversation rename, cross-thread delivery claim, or BEDROCK theory promotion.

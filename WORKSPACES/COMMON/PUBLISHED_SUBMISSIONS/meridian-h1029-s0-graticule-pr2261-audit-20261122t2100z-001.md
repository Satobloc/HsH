# Gendarme Graticule: source-fidelity audit of the conditional parity formalization

**Disposition:** Existing PR #2261 supplies a successful conditional Lean formalization. It does not yet formalize Nathan Direct's complete Gendarme Graticule geometry. The main fidelity gap is the source-to-generator map: the PR's two commuting involutions trace to an assistant proposal, while the direct source specifies two "overlapping parities" without defining them as labels, operators, commuting maps, or a group action.

This is an additive follow-up to the published Gendarme source-fidelity audit (#1322) and a review of the later PR #2261. It does not duplicate the earlier audit or modify the PR.

## 1. Source custody

Primary conversation: Meridian [HsH] Michelstein-on-Meinorly, conversation ID 6a9aa91b-11f4-83ea-80a1-4d502522e441.

- Base raw snapshot: LIVE CONVOS blob d21e251df093013903cc19789ded562f83b6e6ea, 343 mapping nodes.
- Expanded raw snapshot: SAT_CONVOS_13 blob 1f841895a2585843373fe33d55a0180c91cc8423, 706 mapping nodes, 696 nodes on current ancestry, 63 user-role messages on that ancestry.
- The expanded snapshot contains all 343 base message IDs plus 363 additions. Shared message content and roles match. This is snapshot consistency, not independent corroboration.
- [Expanded raw conversation](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.04%E2%80%A226.09.10%E2%80%A2%F0%9F%8C%90Meridian%20%5BHsH%5D%20Michelstein-on-Meinorly%20%E2%80%94%20raw.json)

The source-grounded historical role is supported by direct user-role messages 054d1aea-cf67-4154-93c8-e302dc3ce1ea, 39299849-e2a4-4b63-88a0-5612c700cc1a and f6a2377c-8873-41ee-9107-41aeeb0d2589. They request Gendarme symmetry/asymmetry comparison against physical categories, configurable/scriptable geometric solvers and a source-faithful Whirligig GR-QM audit. No standalone signed specialist charter was recovered; assistant-chosen role titles are not Nathan Direct.

## 2. Nathan Direct geometry

The relevant direct propositions are:

- Message dd2d0663-03f6-45ee-aae2-b4e792b02d06, 2026-09-04T13:44:08.651Z: two axes form four quadrants in a small cross-section; a primary-circumference tangent axis doubles them to eight sectors. The source calls these "eight quadrants". A vector angle at the origin is intended to capture the surface relations in the bulk. Tipping-point conditions should be distributed symmetrically about both short axes, with a curve per tangent-axis unit measuring curvature over a tube segment of a chosen length. Both straight and curved tangent references are required: "Always both."
- Message 0df66202-817c-46ef-913d-85e7f07366cf, 2026-09-04T14:08:29.123Z: asks for a two-dimensional cross-section field with position and vector angle, multiple symmetry-coded versions, and gradients/asymptotic behavior.
- Message fd780628-bf2d-4791-9646-e551c3fa5a91, 2026-09-04T13:52:22.306Z: explicitly says no new parameter; the relationships are defined by angles and torus elements.
- Message b2f97b0c-21ab-49ad-a0a4-4871e6503765, 2026-09-04T15:19:45.111Z: physical torus sides are inner/outer, not left/right. The straight tangent and torus-circumference tangent introduce distinct prograde/retrograde, chirality and clockwise/counterclockwise relations, to be expressed as nested angular relationships among the elements and torus primitives.
- Message c67e32f3-43d3-490d-9c64-51c61d0280a9, 2026-09-04T15:47:17.910Z, first proposes inverse graticulae that cancel in a degenerate limit. Message e380f83e-ba07-4889-8394-e898a95d448b, 2026-09-04T15:50:24.133Z, directly corrects that proposal: the two graticulae do not cancel.
- Message 71ae32d1-1de0-45a0-83d6-11a58d7a7c31, 2026-09-04T16:38:16.684Z: ordinary and anti graticulae should be exact mirror images; only left/right changes.
- Message 7a99e50b-d6c8-4d27-b3fc-a7fcca03c11f, 2026-09-04T17:20:36.687Z: requests an actual three-dimensional calculation and integration around the relevant symmetry, with the primary-circumference tangent/asymptote and reference vector shown. The reference vector's intersection with the spherical graticule is to be coded per graphed variable, with measures normalized on the degenerate sphere. It questions whether earlier plots were calculated or merely assigned gradients.

These are geometric instructions and proposed relationships. They do not yet define a complete coordinate chart, parity operators, torus embedding, field equation, or physical particle correspondence.

## 3. Assistant reconstruction and its provenance

Assistant message 0bae891d-f055-47be-9cbd-f4bcfe28cff2, 2026-09-04T13:52:27.281Z, introduced a candidate sign description (x,y,t) and proposed:

~~~text
P_perp: phi -> -phi
P_parallel: t_hat -> -t_hat

chi(P_perp x) = -chi(x)
chi(P_parallel x) = -chi(x)
chi(P_perp P_parallel x) = chi(x)
~~~

This is an assistant reconstruction, not a Nathan Direct definition. It interprets the two parities as transverse reflection and axial reversal, and it assumes a composition law. The later direct "no new parameter" instruction rules out treating assistant-introduced continuous proxies as source-defined parameters. The PR's finite sign cube is a more economical candidate than those continuous proxies, but it remains a candidate encoding.

## 4. What PR #2261 actually proves

[PR #2261: Meridian conditional Gendarme Graticule parity and mirror proofs](https://github.com/Satobloc/HsH/pull/2261)

- Branch: research/meridian-graticule-parity-proof-20261121t0700z
- Exact head: 0aa8458acf82358cae4d334efa89a73608b33c22
- Module: FORMAL_VERIFICATION/HsHVerification/MeridianGraticuleSectorParity.lean
- Module blob: 714d7bd8f3f39d3c0c0b5f7eae4df3b7e1e8a5d2
- PR state: open, draft, unmerged; no formal review returned.
- The PR targets research/nadir-gpb-joint-covariance-bound-20261027t1312z, not main. Direct comparison of its head to current main reports a diverged history (62 ahead, 26,540 behind); its successful build is not current-main integration.

The module formalizes:

1. A conditional eight-element sign cube, Sector = Bool x (Bool x Bool).
2. P_perp flips the first transverse bit.
3. P_parallel flips the signed tangent bit.
4. The second transverse bit is invariant under the chosen pair.
5. The chosen candidate orbit has four elements.
6. Two Boolean-valued labels cannot injectively distinguish eight states.
7. The display reflection mirrorLR(u,v)=(-u,v) is an involution.
8. The inverse graticule is a pullback by that reflection, not a physical cancellation.

The two candidate flips commute and are involutions. In this particular sign cube they generate a four-element action on each fixed-y slice, producing two four-element orbits. The invariant y bit is a choice of this candidate representation; the direct source does not identify it as the physically invariant axis.

### Actual Lean execution

- Exact-head GitHub Actions run: [#44880028512](https://github.com/Satobloc/HsH/actions/runs/44880028512)
- Job: #136773076736
- Lean 4.34.0 / Lake 5.0.0
- Result: SUCCESS; 8,951 build jobs.
- The executed #eval checks return eight total sectors, a four-element candidate orbit, and the four expected states for the sample orbit.
- The module contains no sorry or admit.
- #print axioms reports propext, Classical.choice and Quot.sound for the relevant theorems. The workflow's separate tests, lint, nanoda and global axiom-audit steps were skipped.
- No local Lean, Lake or Elan binary was installed; this is an actual exact-head CI compile and evaluation, not a local build.

The proof establishes the formalized candidate statements. It does not establish that the candidate generators are the intended direct-source parities, that the torus geometry realizes the sign cube, or that any physical category corresponds to an orbit.

## 5. Original versus translated propositions

| Nathan Direct | Assistant / PR translation | Fidelity |
|---|---|---|
| Two transverse axes form four quadrants; signed major tangent doubles to eight sectors | Three Boolean sign coordinates | Plausible encoding, not a source-defined coordinate map |
| Two overlapping parities | Two commuting involutions P_perp and P_parallel | Candidate only; direct source does not specify generators or commutativity |
| Both straight and curved tangent axes, always both | One signed tangent bit | Incomplete; the relation between the two tangent references is absent |
| Inner/outer are physical torus sides, distinct from left/right | Left/right display mirror | Correctly separate only if not interpreted as the same transformation |
| Ordinary/anti graticulae differ by left/right reflection | mirrorLR(u,v)=(-u,v), inverse graticule as pullback | Faithful conditional translation if u is the left/right display coordinate |
| The two graticulae do not physically cancel | Pullback, not subtraction or cancellation | Consistent |
| Field uses position and vector angle; later work asks for full 3D integration | Generic field on R x R and a discrete sector code | Coordinate typing and 3D integration remain missing |
| No new independent parameter | Finite sign encoding | Better bounded representation, but still requires a source-to-sign map |
| Compare symmetries with physical categories | No particle/SM mapping in the PR | Open research question, not a result |

## 6. The key logical distinction

The theorem named two_boolean_parities_not_injective is correct for two Boolean-valued labels: two bits have only four possible label pairs, so they cannot injectively label eight distinct sectors.

That theorem does not show that two parity operations are insufficient. An operation acts on states; it is not itself a label. The PR's own comment correctly limits the theorem to the label interpretation.

If two parity operations are additionally assumed to be independent commuting involutions, they generate a Klein-four action. Orbit sizes then divide four. The PR proves a particular free action with two four-element orbits. Nathan Direct has not yet specified that the two overlapping parities commute, are independent, act freely, or leave the second transverse sign invariant. No unique orbit decomposition follows from the direct wording alone.

## 7. Glossary

- **Gendarme Graticule:** proposed geometric solver/readout of toroidal cross-sectional relations; not merely a decorative diagram.
- **Eight sectors:** four cross-sectional quadrants doubled by the signed primary-circumference tangent; "eight quadrants" is the direct source wording.
- **Overlapping parities:** direct structural description; generator maps and algebra remain unspecified.
- **Sign cube:** assistant/PR conditional encoding of the eight sectors.
- **P_perp / P_parallel:** candidate commuting involutions, not direct-source definitions.
- **Ordinary / anti graticule:** display-related pair under a left/right reflection.
- **Inner / outer:** physical torus-side distinction; not left/right.
- **Straight / curved tangent:** two required reference directions.
- **CMY cancellation:** later display-compositing request; not physical cancellation.

## 8. Mapping diagram

~~~mermaid
flowchart TD
  D["Nathan Direct toroidal geometry"]
  X["Two transverse axes -> four quadrants"]
  T["Signed curved-tangent reference -> eight sectors"]
  P["Two overlapping parities; operators unspecified"]
  A["Assistant candidate: three sign bits"]
  I["PR candidate: two commuting involutions"]
  O["Two four-element orbits; y invariant"]
  M["Separate left/right display mirror"]
  L["M(u,v)=(-u,v); pullback involution"]
  R["Physical inner/outer, chirality, prograde/retrograde"]
  Q["Required 3D torus integration and sphere-normalized readout"]

  D --> X --> T --> P
  P -. "candidate reconstruction" .-> A --> I --> O
  D --> M --> L
  M -. "not the same relation" .-> R
  D --> Q
~~~

The candidate sign action and display mirror are separate maps. Neither is yet composed with a typed torus-to-graticule projection.

## 9. Discrepancy ledger

| Status | Finding |
|---|---|
| NEW | PR #2261 formalizes an assistant-originated candidate parity pair, not a direct-source-defined pair |
| NEW | The invariant second transverse bit is a candidate coordinate choice |
| NEW | Two Boolean labels and two parity operations are different mathematical objects |
| OPEN | Whether the direct parity operations commute, are independent, or generate a Klein-four action |
| OPEN | Mapping from the two physical transverse axes and tangent references to the sign coordinates |
| OPEN | How both straight and curved tangent axes enter the same geometric state |
| OPEN | Type of the field domain: position, vector angle, or a larger product domain |
| OPEN | Whether the display mirror acts trivially on vector angle and how its coordinates are identified |
| OPEN | Torus-to-graticule projection, sphere normalization, and full three-dimensional integral |
| PRESERVED | The direct correction that the two graticulae do not physically cancel |
| PRESERVED | SAT-O1, Blockwave, Graticule and assistant reconstruction remain separate source/formalism lineages |

## 10. Separate historical SAT-O1 and Blockwave equation custody

These are preserved as separate historical formalisms. No map from either equation family to the Gendarme Graticule is established in this audit.

### SAT-O1 4D

- Source: [SAT O1 4D](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt)
- Git blob SHA-1: 7577aa1ee5a6c3850ce3b226c75377de6367aedc
- SHA-256: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937
- FileIndex creation: 2025-06-07; last write: 2025-06-09.
- Attribution: unbylined historical formalization.

Verbatim core:

~~~text
gamma^mu(lambda) = (lambda,
  A_x sin(k_x lambda + phi_x),
  A_y sin(k_y lambda + phi_y),
  A_z sin(k_z lambda + phi_z))

v^mu(lambda) = d gamma^mu(lambda) / d lambda

S[gamma] = integral d lambda L(gamma^mu, v^mu)

L = 1/2 m v^mu v_mu - V_tension(gamma)

phi_i - phi_j = 2 pi k/n
~~~

The one-parameter curve does not by itself construct the four-dimensional volume that the surrounding prose calls the swept worldtube.

### Blockwave Clean Action

- Source: [Blockwave Clean Action](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%F0%9F%A7%B1BLOCKWAVE.txt)
- Git blob SHA-1: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d
- Attachment event: 2025-09-16T16:31:26.687Z.
- First extant Git commit: 2026-10-08.
- Attribution: assistant-voiced historical attachment, not Nathan Direct.
- SHA-256 withheld because prior custody records conflict; no digest is asserted here.

Verbatim core:

~~~text
u^mu u_mu = -1

P^mu{}_nu = delta^mu{}_nu + u^mu u_nu

J^{mu nu} = 1/2 epsilon^{mu nu rho sigma} nabla_rho B_sigma

nabla_mu J^{mu nu} = 0

A_mu(theta) = alpha_* nabla_mu theta

F_{mu nu}(theta) = nabla_[mu A_{nu]}(theta)
~~~

No equation correction is issued in this report. The original files remain unchanged.

## 11. Next deeper cursor

1. Define the direct geometric domain and identify which coordinate represents each transverse axis, tangent reference, position and vector angle.
2. Define the two parity operators from the geometry, including their domains, codomains, action on both tangent references, and whether they commute or are independent.
3. Prove only the resulting source-authorized algebra; reuse PR #2261 rather than duplicating its conditional sign-cube theorem.
4. Type the display mirror separately and specify whether vector angle is fixed or transformed.
5. Construct the torus-to-graticule projection and its composition with the readout map before attempting the requested 3D integration or physical-category comparison.
6. Keep physical claims gated on an identifiable measured system, source provenance, units, uncertainties and prediction-versus-fit separation.

**Final epistemic status:** one exact display-mirror involution and one conditional finite sign-action are formally verified in an existing exact-head CI run. The direct parity algebra, full toroidal geometry, 3D readout, physical correspondence and empirical validity remain open.

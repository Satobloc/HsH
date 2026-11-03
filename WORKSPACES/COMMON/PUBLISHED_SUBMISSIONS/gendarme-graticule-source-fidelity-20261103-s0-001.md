# Gendarme Graticule: source-fidelity audit

**Disposition:** source-fidelity and conditional geometry only. This report does not validate a physical mechanism, promote a theory claim, or advance a paper gate.

## 1. Primary-source custody

Canonical source:
- HsH `LIVE CONVOS/🌐Meridian [HsH] Michelstein-on-Meinorly — raw.json`
- Conversation ID: `6a9aa91b-11f4-83ea-80a1-4d502522e441`
- Git blob SHA-1: `d21e251df093013903cc19789ded562f83b6e6ea`
- The source is a raw conversation export, not a later assistant summary.

Three export variants were compared. Seventeen selected Nathan Direct message IDs were present with the same user-role attribution and identical message bodies across the three exports:
- `LIVE CONVOS` / `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_12`: blob `d21e251df093013903cc19789ded562f83b6e6ea`
- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9`: blob `ab8f0cbbfcaad8ca836f1a0c169b7a4d3a9dd6e8`
- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13`: blob `1f841895a2585843373fe33d55a0180c91cc8423`

This verifies the selected messages, not byte-for-byte equivalence of the full exports.

Key direct messages:
- `0df66202-817c-46ef-913d-85e7f07366cf`
- `ce3b8410-e231-4970-9c8b-e9b8cdb960b5`
- `525f0613-2eba-4858-9b73-a9da8e03de05`
- `b2f97b0c-21ab-49ad-a0a4-4871e6503765`
- `ce107621-5d97-4ae3-bb60-996d40d283cd`
- `bfac52b1-98d1-4caa-bf18-d9b513584a2f`
- `c67e32f3-43d3-490d-9c64-51c61d0280a9`
- `e380f83e-ba07-4889-8394-e898a95d448b`
- `46583215-3a4b-4eac-b9ac-1f92edcc4dc7`
- `71ae32d1-1de0-45a0-83d6-11a58d7a7c31`
- `59abdb3e-4704-4bdb-837d-b45df7836751`
- `b6e24d98-1bfb-497c-bf29-de69c194b3bd`
- `7a99e50b-d6c8-4d27-b3fc-a7fcca03c11f`
- `2e9e68c5-36ec-4fbb-adfc-b6d2b9a365a6`

The next local source cursor is Nathan Direct message `a6c300a6-2f2d-47b4-a9b5-9917c8f90b5b`, 2026-09-04 18:07:33Z. It asks how best to represent the problem. It was not consumed in this pass.

## 2. Nathan Direct geometry

The direct description contains the following distinct elements:

1. A two-dimensional Gendarme graticule is a cross-sectional representation of a larger toroidal construction. The user's broader description also calls the cosmological carrier a three-torus in four-space. The map from that global object to the local graticule is not supplied.
2. Two transverse axes form four quadrants. A central primary-circumference tangent direction doubles the local sectors to eight.
3. Two overlapping parity structures are named, but their operators, domains, and action on the eight sectors are not defined.
4. Two tangent references must be retained: a straight tangent reference and a curved, tube-centric circumference tangent. The complementary small-circumference tangent is also described.
5. Vector angle is intended to be the organizing variable. The stated theta-four reference is 90 degrees relative to time, or 0 degrees relative to time propagation. This is a source-specific angular convention, not a demonstrated Lorentzian null condition.
6. The major-circumference path length varies with tube position; the minor-circumference path length is constant.
7. Physical torus-side labels are inner/outer. Left/right is a display-coordinate distinction and must not replace inner/outer.
8. The ordinary and anti/inverse graticulae are exact left/right display mirrors. The user explicitly corrected an earlier cancellation interpretation: the two geometric graticulae do not cancel.
9. A separate CMY colour-gradient cancellation is requested as a display-layer operation. Its exact colour-mixing operator is not defined.
10. Flicker was explicitly set aside. No rational/irrational winding model should be imported into this pass.
11. No new independent physical parameter is to be added. Relationships should be derived from the existing torus elements and vector-angle structure.

The source's correction chronology matters: an initial null-graticulum cancellation idea was explicitly withdrawn. The later exact-mirror instruction controls.

## 3. Standard geometric translation, not a Nathan equation

For a standard two-dimensional ring-torus surface with major radius R and minor radius r, one conventional parameterization is:

```text
X(phi, theta) =
  ((R + r cos(theta)) cos(phi),
   (R + r cos(theta)) sin(phi),
   r sin(theta))
```

It gives:

```text
|dX/dphi|   = R + r cos(theta)
|dX/dtheta| = r

major parallel length at theta = 2 pi (R + r cos(theta))
minor meridian length           = 2 pi r
```

This captures the stated variable major-circumference length and constant minor-circumference length for a ring-torus surface. It is a standard coordinate translation, not a verbatim Nathan equation, not the full three-dimensional toroidal bulk, and not a physical calculation. No numerical radii or fixtures were introduced.

The assistant's `rho sin(alpha) = C` / critical-value use of Clairaut's relation is conditional on a geodesic on a surface of revolution and on a declared angle convention. Nathan Direct did not specify that the relevant path is a geodesic. The source's angle is referenced to a primary circumference tangent; the assistant's angle was not explicitly mapped to the meridian/parallel angle used by the standard theorem. Therefore the assistant's formula is not a source-derived law.

## 4. Assistant reconstruction audit

The following are historical assistant constructions, not Nathan Direct equations:

- `P_perp: phi -> -phi` and `P_parallel: t -> -t` as two parity operations.
- `chi ~ f(theta, ell, kappa)` as a chirality measure with added symbols not recovered as independent source parameters.
- `rho sin(alpha) = C` and a critical `C = R - r` condition based on a geodesic assumption.
- A north/south stereographic chart-parity model.
- A Pfaffian-sign model for relative winding.

Three assistant run files were inspected:
- `RUN_061_4D_DONUT_STEREOGRAPHIC_BRIDGE.md`, blob `cec9ae1ed8afb7753c2053c611159e01bd5ec6cd`, dated 2026-09-20.
- `RUN_062_HOPF_CARRIER_CONNECTION_KERNEL.md`, blob `185f0bf41dea34f342e8bdb6829dfbbb735cf337`, dated 2026-09-20.
- `RUN_063_CONNECTION_DECODER_AND_PARITY.md`, blob `17f59cdb82fd4fdaf501b3d2d0ad955c694af839`, dated 2026-09-20.

The exact full Git blob IDs are retained in the repository file records. The run files are assistant-authored proposals. In particular, RUN_061 constructs `T^2 = S^1 x S^1` inside `S^3` and stereographically maps that two-dimensional torus surface to a ring torus in `R^3`. It does not by itself construct the user's stated three-dimensional toroidal carrier in four-space. It could be a local surface model, but the projection/extension map to the three-dimensional bulk is missing.

RUN_062 adds a Hopf/connection construction not specified in the direct source. RUN_063 uses a Pfaffian sign and chart parity, but neither is mapped to the two overlapping source parities or to the simple left/right display mirror. RUN_063 itself warns that the historical ordinary/anti definitions must be source-checked before identifying them with north/south inversion.

The direct mirror is not field negation. A geometric cancellation law must not be inferred from the display mirror.

## 5. Mapping diagram and missing maps

```text
Nathan Direct global carrier:
  3D toroidal object in 4D ambient
          |
          | cross-section / embedding map NOT SPECIFIED
          v
  local 2D Gendarme graticule
       |                 |
       | two axes        | primary circumference tangent sign
       v                 v
   4 quadrants       8 local sectors total
                         |
                         | two parity operators NOT DEFINED
                         v
                  parity action unresolved

Nathan Direct display pair:
  ordinary field G(u,v)
          |
          | M(u,v) = (-u,v), display left/right reflection
          v
  anti/inverse field G(M(u,v))

Separate, not yet mapped:
  straight tangent reference
  curved major-circumference tangent
  minor-circumference tangent
  theta-four/time-propagation reference
  inner/outer physical side
  prograde/retrograde
  clockwise/counterclockwise
  left/right chirality
```

The display mirror is the only currently precise map. It does not identify the global bulk, the physical winding reversal, or the two parity operators.

## 6. Formalization candidate, NOT COMPILED

The following is a proposed Lean 4/Mathlib translation of the direct display mirror and a conditional finite-information bound. It was not added to a repository or run.

```lean
import Mathlib

namespace HsH.GendarmeGraticule

def mirrorLR (p : ℝ × ℝ) : ℝ × ℝ := (-p.1, p.2)

@[simp] theorem mirrorLR_involutive (p : ℝ × ℝ) :
    mirrorLR (mirrorLR p) = p := by
  simp [mirrorLR]

def inverseGraticule {α : Type*} (ordinary : ℝ × ℝ → α) :
    ℝ × ℝ → α :=
  fun p => ordinary (mirrorLR p)

theorem inverseGraticule_mirror {α : Type*}
    (ordinary : ℝ × ℝ → α) (p : ℝ × ℝ) :
    inverseGraticule ordinary (mirrorLR p) = ordinary p := by
  simp [inverseGraticule, mirrorLR]

abbrev Sector := Bool × Bool × Bool

theorem two_binary_parities_not_injective
    (p q : Sector → Bool) :
    ¬ Function.Injective (fun s => (p s, q s)) := by
  intro h
  have hcard : Fintype.card Sector ≤ Fintype.card (Bool × Bool) :=
    Fintype.card_le_of_injective (fun s => (p s, q s)) h
  norm_num [Sector] at hcard

end HsH.GendarmeGraticule
```

Interpretation limits:
- `mirrorLR` formalizes a passive display-coordinate reflection. It is not a physical reversal of winding or chirality.
- `inverseGraticule` is a pullback/reindexing, not pointwise negation. It preserves the direct correction that the two graticulae do not cancel.
- `Sector = Bool x Bool x Bool` is a conditional encoding of two transverse sign choices plus one tangent-direction sign. The source motivates this three-bit model, but does not supply its exact coordinate map.
- The final theorem says that if two parities are Boolean-valued labels on eight sectors, their pair cannot uniquely encode all eight. It does not define the actual source parities. If the parities are overlapping transformations or constraints rather than a complete sector code, the theorem does not imply a contradiction.
- No Lean compilation or actual run occurred. The local runtime has no `lean`, `lake`, or `elan`; the current project interlock prevents a new research branch or CI dispatch. Existing Lean CI for unrelated modules does not verify this draft. No `sorry` is claimed absent from an unrun file.

## 7. Adjacent global source context

The Gendarme raw conversation is not the only relevant source:
- `LIVE CONVOS/26.10.05•26.10.20•Meridian Free Build — raw.json`, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, blob `7af1561b321f4d9364da5eb111df689efc652827`. Direct messages `28b2378a-846d-4c3f-a242-91f9007ce261` and `1178f25c-9f92-4d1c-b43b-06482e6bf1b1` distinguish a four-dimensional filament from its three-dimensional intersectional trace and warn that the filament need not self-close in the 3D representation.
- `LIVE CONVOS/26.10.20•26.10.21•Meridian Minkowski Ring Analysis — raw.json`, conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`. Direct messages include the unresolved reverse-winding question, the inward/left-handed-bias hypothesis, and the exact native conventions `cw=t`, `++++`, and `Forest Normalization`. The expression `±(c+H0)/2` was offered with an explicit uncertainty qualifier; it is not corrected here.
- These global conventions have not been mapped to the local Gendarme coordinates.

The source's `theta-four` mass proxy, worldtube intersection-area language, and handedness hypotheses remain proposals or qualitative descriptions. No measured system, dataset, units, uncertainties, or independent physical observation was supplied for this local geometry. No physical calculation or CODATA scoring was performed.

## 8. SAT-O / Blockwave provenance boundary

The completed Mersearch request `loom-sato-blockwave-source-set-20261030-2017` searched all three repositories at pinned commits:
- SAT archive: `db32abc75a4a2cff3afc6de895cd7edb9eb62d82`
- HsH: `d0dac2f61bf5af15ba397f1ed44c78b4fdbc9e68`
- HSH_RESOURCES: `705bb361fa574ace34ee9be5ab1c5e64f289e164`

Its manifest SHA is `2f13294a33eca393d55b3dd943af1b0cd6f98bae`; the compact receipt reports 15,719 files, 20,823,983 records, 104,540 hits, and 389 distinct source paths. Raw search results are withheld, so the compact receipt is navigation, not exhaustive evidence.

The existing source-fidelity crosswalk is `mercer-sat-o-blockwave-whirligig-source-fidelity-20261030t0312z-s1-001.md`, blob `07897e2acad8288d185edc4a49999e403ee1e8c8`. The Aster source-genealogy addendum is `aster-sat-o-o9-pre-git-source-20261031t1424z-s2-001.md`, blob `debc499af3089b9915899b5d6dba0dcb25fd6279`.

Important boundaries from that existing audit:
- The May 2025 direct Blockwave transcript `SATO-BLOCK-INT.txt`, blob `2cd00dec3a8464dc303fe96f14ae71d7fcf8f31e`, describes mass as an intuitive interaction/drag readout and explicitly says no equivalent friction coefficient had been derived.
- The SAT-O preprint PDF blob `d1b110f42c80a951d4a759898f881cd549cab136` was first posted online 2026-01-16, carries a June 2025 byline, and acknowledges AI assistance. Equation-level provenance is therefore qualified even though the PDF has author metadata.
- `SATO-BLOCKWAVE_leancheck.txt`, blob `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`, contains 23 `sorry` placeholders and one axiom. It is not a compiled proof.
- The derivative Blockwave/NotebookLM files are not automatically Nathan Direct equations.

No SAT-O or Blockwave equation occurs in the Gendarme source cluster audited here. No SAT-O/Blockwave equation was altered, corrected, or silently substituted in this pass. Existing verbatim equation/source records and their corrections remain separate in the cited source-fidelity crosswalk.

## 9. Tooling, controls, and next cursor

- Mersearch: all four live request lanes were occupied. No new request or overwrite was made. The completed source-set request above was read as an existing result.
- Math Hopper: inspected as an extraction/navigation tool, not a proof engine. The three-repository pilot remains unverified; no full archive scan was claimed.
- Whirligig: existing kernel and RUN_061/062/063 were inspected. They remain assistant proposals, not source validation of the GR/QM isomorphism.
- Lean 4 / Mathlib: the existing `FORMAL_VERIFICATION` project on `infra/lean4-verification-20261023` and draft PR #895 were inspected. The existing CI run is for other theorems and is not evidence for this draft. No local `lean`, `lake`, or `elan` exists. No new branch, PR, module, or CI run was created under the active interlock.
- SciSpace is connected; no external literature was used as evidence for Nathan Direct attribution. No new paid tool or service was introduced.
- Fork inventory could not be verified through the available connector; no fork was used or created.
- The current geometry-first gate requires a real, source-grounded plot and hostile review before Factory Floor admission. No parameterized physical plot exists, so no Factory Floor handoff is eligible.
- The unrelated reading break continued in `SAT Mark V/TheTANGLE.txt`, lines 2091-2130. Next reading cursor: line 2131.
- FIE last full review: 2026-10-27. Next due: 2026-11-10.
- No paper gate advanced. No theory was promoted. No physical calculation, CODATA scoring, branch/PR/CI mutation, or automation change occurred.

**Next local cursor:** Gendarme source message `a6c300a6-2f2d-47b4-a9b5-9917c8f90b5b`, 2026-09-04 18:07:33Z.

**Next global cursor:** `Minkowski Ring Analysis` direct message `861acc12-5590-4bbb-aff1-b16a89bd18d9`, 2026-10-21 07:04:01Z, asking how reverse winding arises despite known handedness. Compare it with the display-only mirror above. Do not treat them as equivalent without an explicit map.

**Source-fidelity conclusion:** the exact left/right display mirror is formalizable; the two parity operators, global-to-local projection, and physical winding map remain unspecified. The current result is Tier 1 source reconstruction plus conditional Tier 2 geometry, not physical validation or theory promotion.

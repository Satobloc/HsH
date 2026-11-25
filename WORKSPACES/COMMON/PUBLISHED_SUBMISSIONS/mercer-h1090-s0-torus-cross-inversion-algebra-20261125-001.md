# Lane 00 addendum | h1090:s0 | Mercer | 2026-11-25T10:00Z

## Scope and source custody

This is a narrow algebraic/source-fidelity addendum to the existing cosmotopology audit, not a replacement for [issue #1670](https://github.com/Satobloc/HsH/issues/1670) or the related CTC/topology reviews [#896](https://github.com/Satobloc/HsH/issues/896) and [#1636](https://github.com/Satobloc/HsH/issues/1636).

The source cluster is `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/HsH COSMOTOPOLOGY.txt`, blob `9f42b96adfa1cb9b310ad8d89843b93ae0379922`, 2,898 lines. The identical blob exists in the SAT archive. The ingestion ledger classifies it as a July 2026 user/assistant exploratory dialogue. This copy is speaker-labelled (`NATHAN`, `CHATGPT`, `CHATGPT (MathtoolExp)`), but no raw conversation JSON, conversation ID, or role/message UUIDs were recovered. Accordingly, the speaker-labelled Nathan lines are attributed transcript material, not independently role-authenticated Nathan Direct. The equations audited below are explicitly assistant-authored.

The earlier h1089 cursor asking for the source-native folded minimum-diameter equation remains unresolved. A bounded search did not recover its raw source. This pass therefore expanded to the adjacent torus/Klein, inversion, and Planck-scale cluster rather than claiming that question solved.

## Source propositions versus assistant translations

The speaker-labelled transcript contains three relevant Nathan-attributed propositions:

1. The inner-to-outer circumference ratio in the particle and black-hole constructions might represent the dark-energy equation of state; its structure should reflect topology.
2. The black hole in the particle worldtube might be the inverse of the particle construction, or the two might instead be scale-similar.
3. The inner circumference is minimal at the Planck scale, with the Planck mass named as the associated scale.

Those statements do not define an inversion operator, a radius/circumference map, an energy functional, or a map from the proposed torus/Klein geometry into current H(s)H worldtube/timesheet geometry.

The assistant introduces several different candidate maps:

- Radius cross-inversion: `I_L(R,r) = (L²/r, L²/R)` (source lines approximately 482-518).
- Circumference cross-exchange: `J_L(C_in,C_out) = (L²/C_out, L²/C_in)` (approximately lines 1450-1515).
- Planck-centred mass inversion: `M_mP(m) = mP²/m` (approximately lines 1770-1855).

They are not shown to be one transformation or to compose through a defined map.

## New algebraic correction

For the assistant's standard ring-torus parameterization, `R>r>0` and

`eta_g = C_in/C_out = (R-r)/(R+r)`.

Under the stated radius cross-inversion,

`R' = L²/r`, `r' = L²/R`.

Then

`R' - r' = L²(R-r)/(Rr)`

and

`R' + r' = L²(R+r)/(Rr)`.

Therefore

`eta_g' = (R'-r')/(R'+r') = (R-r)/(R+r) = eta_g`.

The map is involutive away from zero denominators and preserves the ring-torus ordering. Its fixed locus is `R*r=L²`. For `R>r>0`, `0<eta_g<1`. Consequently `-log(eta_g)` is invariant under this stated radius map, not inversion-odd.

The assistant's separately written circumference cross-exchange also preserves its ratio:

`(L²/C_out)/(L²/C_in) = C_in/C_out`.

The transcript then says this same cross-exchange sends `eta` to `eta⁻¹`, followed by a relabelling clause that says it returns to `eta`. The first claim is algebraically false for the written cross-exchange; the relabelling is unnecessary because the ratio is already unchanged. A reciprocal ratio would result from a different operation, such as swapping the labels or individually inverting each circumference without cross-exchanging them.

The radius map and circumference map are also not established as the same map. The radius map induces

`C_in' = 2πL²(R-r)/(Rr)`, `C_out' = 2πL²(R+r)/(Rr)`,

which are not generally the assistant's separately written `L²/C_out` and `L²/C_in`. A composition map between radii and labelled circumferences is missing.

## The separate mass inversion and its fixed point

The later assistant reconstruction assumes `C_in = 2πℓ_P` and assigns the outer circumference to the reduced Compton scale `C_out = 2πℏ/(mc)`. Under those added assumptions and `m_Pℓ_P = ℏ/c`, it obtains `eta_m = C_in/C_out = m/m_P`. The separate map `m' = m_P²/m` then sends `eta_m` to `eta_m⁻¹` and `chi_mass = log(m/m_P)` to `-chi_mass`.

That mass-ratio result is algebraically consistent under the assistant's definitions. Its positive-mass fixed point is `m=m_P`. The geometric radius map's fixed locus is instead `R*r=L²`. No map from `(R,r,L)` to `(m,m_P)` connects these distinct fixed sets. The reduced-Compton outer circumference is assistant-added, not stated in the speaker-labelled direct line.

The same symbol `chi` is also used earlier for framing/handedness in `(R,r,chi) -> (L²/r,L²/R,-chi)`, then for `-log(eta_g)`, and later for `log(m/m_P)`. These are different typed quantities: `chi_frame`, `chi_geom`, and `chi_mass`. No source-defined map identifies them. The geometric log is invariant under the stated cross-inversion; the mass log is odd under the separate mass inversion.

## Equation-of-state and current-theory boundary

The assistant correctly cautions that `eta_g` is not automatically `w=p/rho`. The standard FLRW continuity relation only becomes useful after a separately conserved homogeneous component and a defined `rho_DE(eta,a)` or action are supplied. No such energy functional is present here; no equation of state is derived.

The older two-dimensional torus/Klein candidate is not automatically the current four-dimensional Klein Fabric, finite-core worldtube, or timesheet. No projection or composition maps connect them. This addendum does not promote the historical cosmology candidate into BEDROCK.

## Glossary

- `R,r`: assistant-defined major/minor radii of a standard ring torus.
- `C_in,C_out`: assistant-defined inner/outer circumferences.
- `eta_g`: geometric torus aspect ratio.
- `eta_m`: conditional mass ratio `m/m_P`, only after the assistant's Planck/Compton identification.
- `chi_frame`: assistant's framing/handedness variable.
- `chi_geom`: `-log(eta_g)`.
- `chi_mass`: `log(m/m_P)`.
- `w(a)`: effective equation-of-state parameter, not derived by the ratio alone.

## Mapping diagram

```text
Speaker-labelled source:
  “literal inversion” + inner/outer ratio as an EoS representation
          |
          +-- assistant radius map I_L(R,r)
          |      -> eta_g' = eta_g
          |      -> fixed locus R*r = L²
          |
          +-- assistant circumference cross-exchange J_L(C_in,C_out)
          |      -> eta' = eta
          |
          +-- assistant mass map M_mP(m)
                 -> eta_m' = eta_m^-1
                 -> fixed point m = m_P
                 -> chi_mass' = -chi_mass

No defined map connects I_L, J_L, and M_mP.
No defined rho_DE(eta,a) connects the ratio to w(a).
No projection/composition map connects this older 2D candidate to current 4D H(s)H geometry.
```

## Discrepancy ledger

| Status | Finding |
|---|---|
| ! | The speaker-labelled direct source asks for inversion but does not define an operator. |
| ! | The written radius cross-inversion preserves `eta_g`; the assistant's reciprocal-ratio claim does not follow. |
| ! | The separately written circumference cross-exchange also preserves its ratio. |
| ! | The radius and circumference maps are not shown to be compositionally equivalent. |
| ! | `chi_frame`, `chi_geom`, and `chi_mass` are overloaded without a map identifying them. |
| ? | The Planck/Compton identification is conditional; the outer Compton circumference is assistant-added. |
| ? | The equation-of-state functional remains undefined. |
| ? | The historical torus/Klein candidate has no map into current Klein Fabric/worldtube/timesheet geometry. |
| ✓ | The separate mass inversion is an involution, has positive-mass fixed point `m=m_P`, and reciprocates `m/m_P`, conditional on its definitions. |

## Formalization and verification

A bounded Lean 4/Mathlib formalization is in [PR #2541](https://github.com/Satobloc/HsH/pull/2541), based on `infra/lean4-verification-20261023`, draft and unmerged.

The module formalizes:
- involution and fixed locus of the radius cross-inversion;
- invariance and bounds of the ring-torus aspect ratio;
- non-reciprocity under the stated radius map;
- invariance of `-log(eta_g)`;
- ratio invariance under the separately written circumference cross-exchange;
- involution and positive-mass fixed point of the separate mass inversion;
- reciprocity of `m/m_P` under that mass inversion.

Exact PR head: `a9cdee89005fe7acfa422d562935e6d9079daa1e`.

Exact-head Actions run `#45593210129` was in progress at receipt preparation. Earlier runs were cancelled by superseding commits before compilation. No Lean compile pass is claimed until the final-head run completes and is read back. The local runtime has no Lean/Lake/Elan toolchain. The project uses Lean 4.34.0 / Mathlib 4.34.0; CI generates the Lake manifest, so the dependency manifest is not frozen in the repository.

Lean checks only the formalized algebra. It does not validate source translation, the physical meaning of the maps, the Planck/Compton premise, a map between the three variable spaces, or an equation-of-state model.

## Operational and epistemic status

- Deterministic selection: `h=1090`, `seq=5450`, ring index 16 = Mercer; next label Ravel. This is not an authenticated Mercer instance/thread.
- Historical Mercer role-setting is a raw user-role message from 2026-10-01 assigning equations and dimensional analysis. The current protected workspace assignment is P0 Paper A/B presentation QA only. This Lane 00 pass is a one-run user-directed overlay; no P0 work or permanent role change occurred.
- HsH main head read: `d104bd123a6501858ba24b7570b18b451b1203e4` (2026-11-25T09:31:43Z). SAT archive main head: `028862e6f1b0ffad2f56f4989a2cd0a769d266fd`. HSH_RESOURCES metadata head: `c8872cc51d65bf5e975ca2a1bbe32a0dbbfac5e6`; only its root README was read, with no payload access.
- Mersearch worker guide and all four request lanes were inspected. All remain occupied/requested; lane 2 has a separate worker's manifest/receipt but no release, while lanes 1, 3, and 4 have no output manifests. No lane was overwritten, released, or retriggered. No callable Mersearch action or local pinned checkout was available. Bounded GitHub search was used as fallback, not represented as Mersearch.
- Existing Math Hopper adapter/PR #991, Lean infrastructure/PRs, and Whirligig were checked. SciSpace is available but not needed. No new tool, dependency, fork, subscription, or expenditure was introduced.
- Task graph remains ACTIVE_SEED, 18 records / 16 declared branches / 17 reachable. No graph or PWH mutation; Tern retains PWH authority.
- P0 remains active; P1 overdue/NOT READY; P2 HOLD; P3 incomplete. No paper gate advanced. FIE re-review was not due; unrelated-source break next due November 28.
- No CODATA scoring, physical calculation, independent measurement, BEDROCK theory promotion, or paper advancement occurred.
- Existing `Workshop Relay :00 | Archive` task ID `6aa1fe0de5e48191b886496095b1343f` remains enabled with its exact hourly America/New_York `:00` schedule and Archive phase. No task ID, prompt, phase, schedule, cadence, or enabled-state change; no sixth task.

## Next deeper cursor

1. Recover the raw conversation JSON or original audio/source for the speaker-labelled July transcript.
2. Decide which inversion is intended: radius cross-inversion, circumference cross-exchange, mass inversion, or a different metric/embedding map.
3. Define explicit maps from radii to circumferences and from geometric aspect ratio to mass ratio; then test their composition and invariants.
4. Supply a source-grounded `rho_DE(eta,a)` or action before deriving `w(a)`.
5. Define the projection/composition maps from the historical torus/Klein candidate to current four-dimensional Klein Fabric, worldtube, and timesheet objects.
6. Continue recovering the source-native folded minimum-diameter equation. Do not substitute Nambu–Goto or the assistant's inversion map for missing direct geometry.

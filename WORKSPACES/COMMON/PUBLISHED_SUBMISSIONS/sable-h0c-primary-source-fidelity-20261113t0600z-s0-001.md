# Sable h798:s0 | H0/c primary-source and metric-gradient fidelity addendum

**Run key:** `REVROT3-19-20261011:798:s0`  
**Nominal UTC slot:** `2026-11-13T06:00Z`  
**Rotation label:** Sable (index 0); next ring label Loom (index 1).  
**Repository snapshot:** HsH `main` at `815b83039...` (observed 2026-11-13 06:16Z).  
**Status:** additive source-custody and geometry-fidelity amendment to #758, #190, #483/#484, #1460 and #1244. No new physical model, data result, CODATA score, or theory promotion. Selection is a rotation label; no authenticated Sable ChatGPT thread was established, and no cross-thread continuation is claimed.

## Prior-record crosswalk

This is an additive source-custody update, not a replacement for earlier work:

- [#758](https://github.com/Satobloc/HsH/issues/758): COSMO reference-surface fidelity and the no-required-dual-shell correction.
- [#190](https://github.com/Satobloc/HsH/issues/190): H0+c dimensional repair and relative-scale algebra.
- [#483](https://github.com/Satobloc/HsH/issues/483) / [#484](https://github.com/Satobloc/HsH/issues/484): H0=71.2 source-chain audit; not re-scored here.
- [#1460](https://github.com/Satobloc/HsH/issues/1460): D4 indicatrix and the distinct zero-deviation H baseline.
- [#1244](https://github.com/Satobloc/HsH/issues/1244): Universal Indicatrix source-fidelity crosswalk.
- [#1073](https://github.com/Satobloc/HsH/issues/1073) / [#1281](https://github.com/Satobloc/HsH/issues/1281): SAT-O / Blockwave equation and support-type ledgers.

The new contribution is the role-authenticated June 17 raw-message anchor, the direct “both units” clarification, and the explicit source chronology. The prior equation ledgers and numerical audits are linked rather than duplicated. The earlier #483/#484 conclusion that `71.2` is not independently derived remains unchanged; no numerical comparison or CODATA work was repeated.

## Executive finding

A raw role-authenticated conversation export now recovers the June 17, 2026 direct-source sequence behind the early `H_0` versus `H_0+c` hypothesis. It establishes three things that must remain separate:

1. Nathan Direct initially described spatial expansion at `H_0` and temporal expansion at `H_0+c`, but explicitly classified this as speculation that must not yet be believed unless it is geometrically unavoidable and explains unexpected features in different sectors.
2. Nathan then directly clarified that both quantities should be expressible in both units. The assistant's intervening claim that the units mismatch was merely a coordinate-system artifact supplied no scale and was not a valid dimensional repair.
3. The later Nathan-authored source key rejects a required dual shell or multiple-speed cosmic expansion. Its current interpretation is a metric gradient from the matter/fermionic-core locale toward the Hubble-scale region, with `c` the accumulated Hubble-law velocity difference across one Hubble length.

The source chronology is a refinement, not a license to preserve the early shorthand as a literal equation. The current controlling expression is:

\[
\Delta v(D)=H_0D,\qquad R_H=\frac{c}{H_0},\qquad
\Delta v(R_H)=H_0R_H=c.
\]

This is the standard Hubble-law normalization. It is not a new prediction, a curvature tensor, or evidence for two physical shells.

## 1. Newly recovered Nathan Direct source

**Library source:** `🧶🧱SAT — raw.json`, 97,215-line raw JSON export. The inspected nodes carry `author.role = "user"` in the raw message objects. The file is a Library source, not a public GitHub path; no raw conversation text is copied into this public-facing report.

| Message UUID | UTC | Direct-source content and status |
|---|---|---|
| `18aeb065-62e4-4443-8ce9-623f49b96300` | 2026-06-17 00:45:37.510Z | Early conditional relation between `H_0`, `H_0+c`, gravity and electromagnetism. The literal text says “space and gravity” at one point; preserve that wording rather than silently correcting it. |
| `867dd6e4-76bb-4bf0-955d-36e3c510ade8` | 2026-06-17 00:46:11.895Z | Duplicate sibling branch carrying the same text as the preceding user message. It is not an independent second witness. |
| `4b1a7b2d-f876-4a64-bebb-e4210c83cb54` | 2026-06-17 00:50:56.953Z | Directly says the conjecture is “not yet allowed to believe”; admissibility requires geometric necessity and unexpected cross-sector explanation. It states, provisionally, space at `H_0` and time at `H_0+c`, with a minimum-elaboration rule. |
| `8805085b-5b63-4141-9c75-f7561cef79aa` | 2026-06-17 01:00:40.622Z | Directly proposes equal propagation treatment across four dimensions and a possible temporal “swamping” effect. The gravity-suppression mechanism is explicitly tentative (“perhaps”) and not yet thought through; analogous effects from spatial expansion at `H_0` are raised as an open question. |
| `6d98f3e0-178c-497b-afca-b0ed65166188` | 2026-06-17 01:06:41.736Z | Direct clarification: both quantities should be expressible in both units. |

### Assistant exposure in the same source chain

Assistant message `ff983080-055a-4749-a40b-5d5e63b9b8c4` (2026-06-17 00:50:58.144Z) amplifies the `H_0` / `H_0+c` asymmetry and compares them as though `c \gg H_0`, without first reconciling dimensions.

Assistant message `34358a6a-216f-4a55-8349-68b4fb27908b` (2026-06-17 01:03:28.792Z) explicitly calls the units mismatch a coordinate-system artifact and writes `E_s = H_0`, `E_t = H_0+c`. It does not supply a length scale or a dimensionally typed map. This is assistant reconstruction, not Nathan Direct and not a valid dimensional repair.

The later direct “both units” clarification is therefore important: it does not authorize bare addition of a rate and a speed; it requires a common dimensional representation.

## 2. Dimensional closure and current correction

In ordinary dimensions:

\[
[H_0]=T^{-1},\qquad [c]=LT^{-1}.
\]

A length scale \(L\) is required to compare them:

\[
v_H(L)=H_0L \quad [LT^{-1}],\qquad
h_c(L)=\frac{c}{L}\quad[T^{-1}].
\]

At the Hubble length \(R_H=c/H_0\):

\[
H_0R_H=c,\qquad \frac{c}{R_H}=H_0.
\]

The corresponding dimensionless ratio is:

\[
\epsilon_H(L)=\frac{H_0L}{c}=\frac{L}{R_H},
\qquad \epsilon_H(R_H)=1.
\]

Thus both quantities can be expressed in rate units or speed units after a length scale is stated. The scale is not optional bookkeeping: without it, `H_0+c` is dimensionally undefined.

The current source key `🔑/H0_TO_C_IS_THE_UNIVERSAL_METRIC_GRADIENT.md` (current blob `a3f203cdef22d8a8896d8666763b99ca29ac4f5e`) states the controlling KISS relation:

- `Δv(D) = H_0 D`
- `R_H = c/H_0`
- `Δv(R_H) = H_0 R_H = c`

It explicitly says not to turn a gradient and its integral into two independently expanding things. The key's first extant path history is October 7, 2026; its provenance points to `🔑/FODDER/Orson Free Build — raw.json` near the end. The original raw Orson message UUID and timestamp were **not** recovered in this pass. `🔑/🔑.md` (current blob `c05b39f8a84bcc95bcc59c9e09f8a3ac98064cab`) preserves the first-person correction that no dual shell or multiple-speed expansion is required.

Current BEDROCK normalization further requires a declared comparison length \(L\), distinguishes speed from rate, and treats the Hubble radius as a geometric reference scale. It does not identify `H_0` with the full Riemann tensor. A GR-native comparison must distinguish expansion/extrinsic curvature from intrinsic and tidal curvature, including the relevant \(H^2\), \(\dot H\), matter-content and spatial-curvature terms.

## 3. Geometry before translation

### Nathan Direct propositions

- Early candidate: three spatial dimensions associated with `H_0`; a temporal-direction contribution described as `H_0+c`.
- Methodological constraint: speculation is not belief; the geometry must force the distinction and explain unexpected phenomena in more than one sector.
- Direct dimensional clarification: both quantities should be expressible in both units.
- Later correction in the current source key: no fundamental dual shell or multiple-speed cosmic expansion is required; the relevant object is a metric gradient across the 4D gravity well from the matter/fermionic-core region toward the Hubble-scale region.
- The proposed force-propagation and “swamping” consequences remain conjectural, not derived field equations.

### Assistant / historical translations

- `E_s=H_0`, `E_t=H_0+c` as two expansion parameters: assistant reconstruction; no common scale supplied.
- Two independently expanding spherical fronts or shells: historical representation, not a Nathan-required physical ontology.
- A shell-gap-only observation: non-injective; it cannot recover both reference surfaces.
- A fixed/movable `S^3` / `SO(4)` Universal Indicatrix: a separate mapping/translator construction. The direct March 7 UI source describes it as a mapping tool and does not establish a complete UI Lagrangian. No source-defined map connects the UI transformation to the Hubble metric gradient.
- The `H[0,0,0,0,0,0]` zero-deviation baseline in #1460 is a second-order-superhelix normalization object, **not** the cosmological Hubble parameter `H_0`.

### Mapping diagram

```text
June 17 Nathan Direct (provisional)
  space: H_0       time: H_0 + c
  "both units" clarification
          |
          | dimensional scale required
          v
Current corrected normalization
  Δv(D) = H_0 D
  R_H = c/H_0
  Δv(R_H) = c
          |
          | metric/GR map still missing
          v
4D metric-gradient proposal
  matter / fermionic-core locale
          |
          | global metric / curvature / readout map undefined
          v
Hubble-scale reference region

Separate historical assistant representation:
  two reference surfaces -> gap-only map
  (not a required pair of physical shells)

Separate UI construction:
  fixed/movable S^3 and SO(4) candidate
       -> marked-point path (readout not fully defined)
       -X-> no source-defined map to the H_0/c metric gradient
```

## 4. SAT-O / Blockwave source boundary

The existing verbatim equation ledgers in #1073 and #1281 were rechecked and reused; this addendum does not replace or silently correct their originals.

| Historical source | Blob SHA | First extant Git commit | Authorship / geometry limit |
|---|---|---|---|
| `SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SAT O1 4D.txt` | `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | 2025-10-27 00:40:28Z; archive index dates the file to 2025-06-07/09 | Unbylined historical module. It gives a one-parameter 1D curve and describes a 4D worldtube as a volume swept by vibration, but supplies no sweep/thickening map. |
| `HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt` | `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` | 2026-10-08 02:42:49Z | Compact action is assistant-generated in the surrounding source chain. Its rank-two current is not a direct-source definition of the H_0/c metric gradient. |

Verbatim SAT-O1 core equations remain in #1073/#1281:

```text
gamma^mu(lambda) = (lambda,
  A_x sin(k_x lambda + phi_x),
  A_y sin(k_y lambda + phi_y),
  A_z sin(k_z lambda + phi_z))

v^mu(lambda) = d gamma^mu / d lambda
S[gamma] = integral d lambda L(gamma,v)
L = 1/2 m v^mu v_mu - V_tension(gamma)
```

Verbatim compact Blockwave definitions remain in #1073/#1281:

```text
J^{mu nu} = 1/2 epsilon^{mu nu rho sigma} nabla_rho B_sigma
nabla_mu J^{mu nu} = 0
A_mu(theta) = alpha_* nabla_mu theta
F_mu nu(theta) = nabla_[mu A_nu](theta)
```

The Blockwave `J^{mu nu}` is an assistant-generated two-form/worldsheet-current representation. SAT-O1's `gamma` is a one-dimensional centerline. Neither is automatically the later finite-core 4D support, and neither has a source-defined projection/composition map to the cosmological metric gradient. The Blockwave Lorentzian unit-timelike convention also cannot be silently identified with the current positive-definite `++++` ambient calculation frame; an induced-metric map is required.

## 5. Glossary

| Term | Stable meaning | Status |
|---|---|---|
| `H_0` | Hubble expansion-rate / local gradient scale, dimension \(T^{-1}\) | Standard cosmological parameter used in the current normalization |
| `c` | Speed of light, dimension \(LT^{-1}\) | Standard constant; not addable to `H_0` without a length scale |
| `R_H` | Hubble length \(c/H_0\) | Derived reference scale |
| `Δv(D)` | Hubble-law velocity difference across distance \(D\) | `H_0D` |
| `H_0+c` | Historical shorthand for an early two-contribution intuition | Not a valid bare equation |
| `H_0`-to-`c` metric gradient | Proposed 4D gradient from core locale to Hubble-scale region | Current representational default; GR mapping incomplete |
| Dual shell / dual front | Assistant-generated reference-surface representation | Optional visualization only; not required physical ontology |
| Universal Indicatrix | Mapping/translator apparatus with fixed/movable reference construction | Separate geometry; no H_0/c map recovered |
| `H` baseline | Zero-deviation second-order-superhelix normalization | Distinct from Hubble `H_0` |
| SAT-O1 `gamma` | Historical 1D filament centerline | Does not by itself construct a 4D worldtube |
| Blockwave `J^{mu nu}` | Assistant-generated 2D worldsheet current | Not the 4D finite-core support |

## 6. Discrepancy ledger

1. **Bare addition:** `H_0+c` mixes \(T^{-1}\) and \(LT^{-1}\). It is invalid without a declared length scale.
2. **Assistant unit claim:** “coordinate-system artifact” is incomplete; the assistant did not supply \(L\). The direct “both units” clarification is satisfied only after a dimensionally typed conversion.
3. **Dual-shell promotion:** early direct language does not require two physical shells; the later source key explicitly rejects that requirement. Preserve the dual-front construction as a historical representation, not current default ontology.
4. **Force-sector inference:** gravity suppression / electromagnetic distinction remains conjectural. No field equation or cross-sector derivation has been recovered.
5. **Curvature conflation:** `H_0` is an expansion rate, not the full Riemann curvature tensor. A metric, curvature invariant, frame, epoch, and observable/readout map are still missing.
6. **UI conflation:** the Universal Indicatrix is a separate mapping apparatus; no projection or composition map connects it to the H_0/c gradient.
7. **Support-type conflation:** SAT-O1's 1D curve, Blockwave's 2D current, and a full-dimensional finite-core worldtube are different support types.
8. **Symbol collision:** the `H` baseline in #1460 is not Hubble `H_0`.
9. **Source gap:** the raw Orson Free Build message behind the October 7 correction still lacks recovered UUID/timestamp. The current key file is preserved as the controlling source summary, not misrepresented as a raw message export.

## 7. Lean / proof status

Existing Sable PR #757 was inspected and reused; no new module, branch, or PR was created.

- PR: [#757, Sable COSMO reference-gap invariance versus physical dual fronts](https://github.com/Satobloc/HsH/pull/757)
- Exact head: `69e6aa9aeb87c33402b8fb146804a0b477c4a996`
- Actual Actions run: [#41348528780](https://github.com/Satobloc/HsH/actions/runs/41348528780)
- Job: `124974174501`, `verify`, completed `SUCCESS` on 2026-11-01 20:48:49Z–20:52:21Z.
- The successful step was “Install Lean and compile formal library”.
- Modules include `SableCosmoGaugeFidelity.lean` and `SableBalancedHubbleCentering.lean`.

The compiled theorems cover common-shift gap invariance, distinct shifted representations, non-injectivity of gap-only observation, preservation of a fixed axis under diagonal anisotropic scaling, the conditional identity \(H(c/H)=c\), and balanced rate/speed centering with an explicitly supplied length \(L\).

**Limits:** PR #757 remains open, draft, and unmerged. It is based on `research/orson-p1-cgd-revision-trace-20261027t14z`, not current `main`; this is a successful PR merge-reference build, not main integration. The proof checks the formalized statements, not the physical assignment of units, the truth of the source translation, a GR metric, or observations. The PR body and #758 submission text still say compilation was pending at their earlier submission time; the live check-run now verifies success. No separate global axiom audit was performed in this pass. No local Lean/Elan/Lake executable was available.

The physical metric-gradient claim remains `FORMALIZATION_BLOCKED_DEFINITION` until the metric/curvature object, comparison scale, frame, epoch, and observable map are defined.

## 8. Mersearch, tools, and controls

- All four Mersearch request lanes remain occupied: lane 1 Calder source request; lane 2 archive optics; lane 3 Calder IRI/worldtube; lane 4 Kestrel finite-core geometry. No request was overwritten and no new request submitted.
- No Mersearch run is claimed. Bounded GitHub code-search/fetch fallback was used across HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES; this is not an exhaustive Mersearch search.
- All three repositories default to `main`; current fork counts are zero.
- Math Hopper PR #991 remains open/draft and extraction-only, not a Lean runtime. Whirligig remains on hold. SciSpace is installed/available but was not needed. No new tooling, dependencies, subscription, or cost.
- No CODATA scoring, physical calculation, invented fixture, fit, prediction, or independent measurement.
- No Factory Floor admission or geometric plot was submitted; the metric-gradient object is not yet sufficiently defined to plot faithfully.
- No BEDROCK promotion or paper-gate advancement. Nov 9 P1 gate is past; Nov 30 P2 and Dec 14 P3 remain separate.
- FIE was last reviewed November 10 and is next due November 24.
- Unrelated reading was completed in `MIX TAPES.txt`, lines 421–460. Next cursor: line 461. This is an unrelated reading quantum, not a claimed physical break.

## 9. Next deeper cursor

1. Recover the raw `Orson Free Build` JSON message behind the October 7 correction, with message UUID, timestamp, role, and adjacent context.
2. Define the GR-native metric/curvature object corresponding to the proposed global gradient. Keep expansion scalar/extrinsic curvature distinct from intrinsic and tidal curvature.
3. Specify the length scale and frame for any conversion between rate and speed; retain \(R_H=c/H_0\) as a normalization identity unless an independent geometry-derived scale is supplied.
4. Define the observable/readout map from the 4D dynamic block to the effective 3D cosmological quantities.
5. Keep the force-propagation / temporal-swamping hypothesis separate until a derivation yields cross-sector consequences and a real measured test.
6. Do not merge the Hubble `H_0` with the second-order-superhelix `H` baseline, or the cosmological metric gradient with the UI, SAT-O1 centerline, or Blockwave two-form current.

**Classification:** `SABLE_H798_S0_PRIMARY_SOURCE_ANCHOR_RECOVERED / H0_C_DIMENSIONAL_CLOSURE_RECONCILED / EXISTING_LEAN_CI_VERIFIED / DUAL_SHELL_NOT_CURRENT_DEFAULT / NO_PHYSICAL_RESULT / NO_CODATA / NO_BEDROCK_PROMOTION`.

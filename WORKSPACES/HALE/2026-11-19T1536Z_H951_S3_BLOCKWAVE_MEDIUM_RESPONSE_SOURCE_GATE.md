# H951:s3 | Source-to-medium typing gate for the Kelvin-response hypothesis

**Run key:** `REVROT3-19-20261011:951:s3`  
**Nominal slot:** 2026-11-19T15:36Z  
**Selection:** `h=951`, `seq=5h+3=4758`, `4758 mod 19 = 8` → **Hale**; next index 9 → **Elias Kern**.  
**Identity status:** deterministic worker label / assistant reconstruction. No authenticated current Hale thread was found; no new chat was created.  
**Lane:** 36 architecture, workflow and prediction overlay.  
**Preflight HsH main head:** `33dc7368087b75dbfcd83ba1fc3d3e36be376080`.

## 1. Delta

The previous Calder three-map chain separated:

1. SAT worldtube → responsive medium;
2. medium response → force;
3. force → measured observable.

This run adds a source-typed crosswalk and a matched-period standard-physics comparison. The result is sharper than “the maps are missing”:

- The historical SAT-O1 source describes a 1D curve and a 4D swept-volume worldtube in prose, but its action is integrated over the curve parameter. No sweep/thickening map, finite-core profile, worldtube volume measure or boundary conditions are supplied.
- The SAT4D live draft separately labels a vector 4-current `J_mu` from filament flux and linking density.
- The September 16 Blockwave attachment separately proposes a conserved two-form `J^{mu nu}` with an optional local response kernel `M(theta,u)`.
- A later Page One 3-form current track is also recorded elsewhere, but no support map connects it to either earlier current.
- None of these source objects is mapped to the others. The rank/type differences cannot be repaired by renaming a current or calling all supports “worldtubes.”

The new gate is therefore **source-type and support-map admission before constitutive fitting**. No new physical primitive, equation, symbol, force law or theory status is introduced.

## 2. Source custody and verbatim equations

### SAT-O1 4D

- Source: [`SATOBLOC/SAT O1 4D.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt)
- Git blob SHA-1: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`
- SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`
- File index: created 2025-06-07; modified 2025-06-09 18:44:50 (timezone unspecified); unbylined.
- The same O1 body occurs in the June 2025 SAT4D live draft. These are duplicate source copies, not independent witnesses.

Verbatim action excerpt:

```latex
S[\gamma] = \int d\lambda \, \mathcal{L}, \quad \mathcal{L} = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
```

The surrounding source describes a 4D volume swept by a vibrating filament as a “worldtube.” The displayed action, however, is a line-parameter action on `γ(λ)`. The source does not supply the map from that curve to a finite 4D support or a measure over the support. Thickness, twist and contact surfaces are not forced by this action.

### SAT4D live draft

- Source: [`SATOBLOC/SAT4D_LIVE_DRAFT.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT4D_LIVE_DRAFT.txt)
- Git blob SHA-1: `2a79fe25018cce7e99a2c33786d88b0551db6ae7`
- Corrected SHA-256: `c3f90cdeda667f20c7ab9ab33eea2e23c5245d94c1e4f99f3aec5e3e7f1f6cb7`
- File index: created 2025-06-08; modified 2025-06-09; archive import 2025-10-27.
- Document-level byline: Nathan McKnight; AI assistance acknowledged. The byline does not establish individual equation authorship.

Its object table calls `J_mu` an “Effective 4-current from filament flux and linking density.” That is a vector/one-form current, not the Blockwave two-form current below. No explicit map between them is supplied. No responsive fluid state, Kelvin-vortex coupling or medium-to-electrostatic-force law is defined here.

### SAT.O Official Directives

- Source: `SAT O Core Modules/SAT.O Official Directives.txt`
- Git blob SHA-1: `167136310cdf33ca8f986f33634692314c1a0946`
- Document date: July 2025; unbylined.
- Conflicting SHA-256 records exist; no canonical SHA-256 is asserted here.

This is an earlier historical directive: filament geometry and intersection with the propagating time-wavefront are the stated source of derived behavior; external fields/forces are not postulated. It is not treated as the later medium hypothesis or as a current force equation.

### Blockwave sources are distinct

**September 12, 2025 `Blockwave Theory.txt`:** a separate “Blockwave Collaboration” document recovered through a conversation archive (raw export blob `e4016d48d1b29382b53823ce5546ed51dceda3c1`). Its compact scalar/time-field/topology scaffold does not contain the September 16 `J^{mu nu}` / `M` action. It is not Nathan Direct.

**September 16, 2025 `🧱BLOCKWAVE.txt`:**

- Conversation: `68c990dd-df28-832e-b766-c267190aaffa`
- Attachment event: 2025-09-16T16:31:26.687Z
- Git blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`
- User-supplied attachment; embedded prose is assistant-voiced and content authorship is unresolved.
- Prior SHA-256 values for this attachment were withdrawn by the later source-custody audit. **Use the Git blob identity only; do not reuse a disputed SHA-256.**

The attachment describes `J^{mu nu}` as a conserved two-form current, with worldsheet support asserted in prose, and contains the following response term:

```latex
+\frac{1}{2}J_{\mu\nu}\mathcal{M}^{\mu\nu}{}_{\rho\sigma}(\theta,u)J^{\rho\sigma}
```

The accompanying prose calls `𝓜` a local symmetric response/mixing kernel built from `g`, `u` and `P`; it is optional and may be set to zero in the “strict minimal core.” The same attachment says filaments are encoded as defects of the `(θ,u)` medium. These are Blockwave proposal statements, not Nathan Direct. They do not construct a map from the SAT-O1 4D worldtube to a 2D worldsheet current, operationalize the medium state, or derive a signed force on an external charge. The `𝓜` term is a candidate local current self-response, not by itself a medium-to-electrostatic-force law. Its optionality belongs to that attachment; it does not make the current BEDROCK Kelvin-response constraint optional or ignorable.

A separate 2025-10-19 assistant action and other Blockwave/Ideal-Model files remain separate source events; none was substituted for the September 16 attachment. No original equation was edited. `CORRECTED_EQUATION=NONE`.

## 3. Nathan Direct and current governing status

- **2026-09-01 direct user message** `bda16543-cf97-487f-9038-b14c55074da2`: proposes that electrostatic attraction/repulsion be a medium effect and raises Kelvin vortices, while explicitly treating the preference as naive and leaving alternatives open. This is a tentative hypothesis, not a force equation.
- **2026-09-06 message** `09c6d26f-934f-4be6-b2ae-21a6fc281147` is cited in prior continuity as a direct medium/Kelvin-vortex clarification, but its referenced raw export was not recoverable in this run. It is not used to strengthen attribution.
- **2026-10-21 direct user message** `090f5160-1020-486d-9c42-df3d7dff2063` retires the reciprocal filament/timesheet-deformation description as the current model. It is not reintroduced here.
- **2026-11-08 Nathan Direct methodology** treats a responsive medium as a provisional third primitive to be tested against elimination, absorption into the timesheet, or independent status. The current BEDROCK retains Kelvin-vortex or a justified equivalent response as an active falsifiable constraint: “tentative” does not mean ignorable.

Therefore, the September 16 Blockwave claim that filaments are defects of a `(θ,u)` medium is not silently adopted as the current H(s)H ontology. The current worldtube and the medium vortex remain distinct until a source-authorized map connects them.

## 4. Matched-period standard-physics comparison

Two verified external theory references provide useful, bounded comparators:

1. **Taghiloo & Vahidinia, “Fluid/p-form duality,” Physics Letters B 849 (2024), 138450**, DOI [10.1016/j.physletb.2024.138450](https://doi.org/10.1016/j.physletb.2024.138450), arXiv [2311.09125](https://arxiv.org/abs/2311.09125). It constructs a dictionary for an inviscid, near-equilibrium Lagrangian fluid: fluid velocity/density correspond to gauge-side variables; Kelvin circulation and mass continuity map to Gauss/Bianchi identities; vortices correspond to brane sources. In three spatial dimensions the relevant source is string-like, with a two-dimensional spacetime worldsheet. Its limits are explicit: non-relativistic, inviscid, near-equilibrium and linearized. It is a standard fluid representation, not an H(s)H map or electrostatic force law.

2. **Głódkowski et al., “Effective field theory for the superfluid vortex lattice from coset construction,” arXiv:2507.13352v2**, first submitted 2025-07-17, revised 2026-01-16, [arXiv record](https://arxiv.org/abs/2507.13352). It treats a two-dimensional vortex crystal in a rotating Bose-Einstein condensate in a harmonic trap, using Newton-Cartan geometry, coarse-graining and symmetry methods, and derives a low-energy Tkachenko mode. Its equilibrium medium velocity is a defined physical ingredient in constructing Milne-invariant observables; that velocity is not interchangeable with Blockwave's normalized time-flow `u` without an explicit map. It is a specific low-energy BEC theory, not a 3+1D SAT worldtube model or a measured electrostatic interaction.

SciSpace also surfaced a near-title “Vortex-String Theory … Preferred Foliation” record. Exact-title web verification failed; it is excluded as unverified. The two references above are theory comparators, not experimental validation. No dataset was acquired or fit.

## 5. Typed map and prediction gate

| Required stage | What a third party must be given | Current source status |
|---|---|---|
| Worldtube → medium | Explicit support/projection map; source dimension; medium state variables; coupling; boundary conditions; causal support; backreaction | Missing. SAT-O1 curve-to-worldtube sweep is prose-only. Blockwave asserts a defect relation but does not construct the map. |
| Medium → force | Constitutive/response law; fixed symmetries and finite parameterization; coupling to the external charge/source; derivation of both attraction and repulsion | Missing. `𝓜` is optional and uncalibrated; no signed force law follows from the displayed term alone. |
| Force → observable | Measurement operator; calibration; uncertainty/covariance; independent holdout and replication | Missing for this H(s)H candidate. |

### Minimal test matrix

| Hypothesis / comparator | Shared parameters | Calibration / holdout | Predicted observable | Falsification status |
|---|---|---|---|---|
| Standard fluid/p-form or BEC-vortex dynamics | Density, velocity, equation of state, circulation, geometry, rotation/trap and instrument calibration | Calibrate medium state independently; hold out a separate vortex configuration or lattice mode | Density/velocity, circulation and vortex-mode spectrum | Standard comparator only; residual threshold must come from the actual instrument covariance and a preregistered decision rule. |
| Blockwave `J^{mu nu}` / `𝓜` proposal | `κ0`, `κ2`, `ℓ`, `g_h`, `θ`, `u`, and the kernel’s symmetry/parameterization | Not possible until the medium state and finite kernel parameterization are specified | No unique external force or readout is presently implied | Not yet identifiable or falsifiable; an unconstrained kernel could absorb residuals. |
| Nathan Direct Kelvin-vortex responsive-medium hypothesis | Worldtube geometry, medium state, coupling, response, charge configuration and readout | Calibrate medium-only response separately; blind holdout across independently measured charge configurations and separations | A signed interaction and its measured trajectory/phase consequence | No sign rule, functional law or numerical threshold is source-defined yet. Compare against Maxwell/Coulomb plus the selected standard medium model. |
| Added thickness / twist / contact surfaces | A source-defined core profile, length scale, twist variable or surface measure would be required | Independent geometric calibration | A readout not absorbable into shared standard parameters | None is forced by the recovered SAT-O1 action. Blockwave `ℓ` is an optional derivative scale, not identified as core thickness; `𝓜` is optional; contact surfaces are absent. |

The source hierarchy therefore yields a concrete negative result: **no source-defined H(s)H forward prediction can yet be calculated.** A numerical threshold would be fabricated until the three maps, parameter constraints, measured system, dataset, units and uncertainty model exist.

## 6. Proof-first triage

The current sources contain real mathematical structure, but the physical map is not typed sufficiently to prove.

- Existing Kestrel PR #873 contains conditional moving-slice/intersection-dimension and fiber-factorization results. Its exact-head run #44090154878 succeeded (8,956 build jobs); the PR remains open/draft/unmerged and far behind current main. It does not identify the SAT worldtube with the Blockwave worldsheet or supply the medium coupling.
- Existing Ravel PR #1133 is a separate dimension audit; its current exact-head CI is not a successful proof basis. No theorem from it is promoted here.
- Local `lean` and `lake` are absent. No new Lean module or build was created because any nontrivial theorem would require inventing the missing support and coupling maps. No Lean proof, physical validation or observational result is claimed.

## 7. Workflow and status

- Mersearch was not callable in this runtime. The four canonical request lanes remain occupied/requested; no request was overwritten, released or retriggered. Bounded GitHub source searches were used as a labelled fallback in HsH and the SAT archive. HSH_RESOURCES root documentation was read; private payload/search hits were excluded from substantive evidence and no private path is published.
- Repository metadata reports zero forks for HsH, the SAT archive and HSH_RESOURCES. No new tooling, dependency, fork, subscription or expense. Existing Math Hopper #578 and PR #991 remain open/draft; Whirligig Kernel 0 remains sandbox-only. SciSpace was used for bounded discovery; open-access papers were checked directly.
- PWH: WH-01 remains Tern-coordinated / OPEN / P1-HIGH; WH-02 remains Calder-owned; WH-05 remains blocked by occupied Mersearch lanes. No owner or priority changed.
- Task graph remains `ACTIVE_SEED`, 16 declared branches / 18 records, unresolved.
- P0 Code Grurple: ACTIVE. P1 Orson cognition: OVERDUE / NOT READY / ORSON-owned. P2: HOLD. P3: INCOMPLETE. FIE last reviewed November 10; next due November 24, not yet due. November 9 minor gate remains missed; November 30 major and December 14 full-theory gates remain separate.
- Unrelated reading break completed: SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 2001–2040; next cursor 2041. No physical break claimed.
- No BEDROCK theory promotion, no SAT-O/Blockwave equation change, no new P2 system selection, no physical calculation, fit, prediction, numerical falsification threshold or independent measurement.

## 8. Succession

Next deterministic ring label: **Elias Kern** (index 9). No actionable Elias-owned task follows from this source-fidelity result; no handoff or assignment was created. The h950:s2 Aster run was a delayed prior-slot execution, not an h951:s2 predecessor, and no h951:s2 handoff was found. The optional Calder h947 packet was read as context only. No direct-thread delivery, consumption, acknowledgement or ownership transfer is claimed.

**Return cursor:** define, from a source-authorized version, the map that takes the current SAT worldtube support into a medium state or vortex-worldsheet source; then define the medium-to-force law and an independently calibrated readout. Do not equate `J_mu`, `J^{mu nu}` and `J_{mu nu rho}` without explicit maps. Preserve all original equation bytes; any future corrected form must be a separate, explicitly labelled reconstruction.

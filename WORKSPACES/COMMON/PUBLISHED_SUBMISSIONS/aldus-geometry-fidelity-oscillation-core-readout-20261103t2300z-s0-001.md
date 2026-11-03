# Geometry fidelity delta: oscillatory trace, core/coil hierarchy, and observable readout

**Status:** SOURCE-FIDELITY AUDIT ONLY. No theory adoption, BEDROCK change, physical calculation, CODATA scoring, Factory Floor intake, or paper-gate change. This is a distinct delta to the existing geometry-fidelity work, not a replacement for the support-dimension and three-representation audits already recorded in issues #1142, #1271, #1292 and #1299.

## 1. Primary-source cluster

### Ravel Syncmathcek

- Conversation ID: `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`
- Raw Git blob: `c49367b0faa424491e7b3520a034b9e44fe6897f`
- [Raw conversation blob](https://api.github.com/repos/Satobloc/HsH/git/blobs/c49367b0faa424491e7b3520a034b9e44fe6897f).

Important Nathan Direct messages:

| Message ID | UTC | Direct content |
|---|---:|---|
| `09c6d26f-934f-4be6-b2ae-21a6fc281147` | 2026-09-06 08:09:54.609 | No independent primitive fields; use helices, nested superhelices, braids, perturbations and winding. A fluid medium with Kelvin vortices and the timesheet/timewave are named as field-like structures. |
| `a03e61e8-929b-4758-8bba-71af0766b9fa` | 2026-09-06 08:14:51.783 | Requests an order-1 helix metric inventory. |
| `af313567-c917-4188-86b0-caea0f3398e2` | 2026-09-06 08:21:54.475 | Adds tightness, pitch, spacing, non-round cross-sections, multiple helices and the ratio of worldtube diameter to helical diameter. |
| `8a1fa455-6d8a-4f33-aa41-92294b373d8d` | 2026-09-06 08:27:04.802 | The spring is not a substrate. It is a geometric representation obtained by plotting oscillation in four dimensions. |
| `465c2c08-c371-43ca-bd9a-906f980f33c2` | 2026-09-06 08:29:09.190 | Identifies a long axis, oscillation diameter and periodicity as basic descriptors of a helical representation. |
| `381b1288-1fb8-4a18-ae4b-7126cecc2749` | 2026-09-06 08:38:01.908 | Proposes a broad scale heuristic in which oscillatory/orbital motion dominates below molecular-scale and above large-group mesoscale regimes. |
| `09e78d2a-2913-4302-a442-532cb79f442e` | 2026-09-06 08:40:34.052 | Explicitly distinguishes measured RMS charge radius from braid-envelope radius. |
| `72f6502b-3361-44e2-a6a8-d87ad53badd4` | 2026-09-06 08:42:14.662 | Asks which geometric statistic of the braid corresponds to the measured second moment. |
| `00d87203-f1bd-4c86-bf7d-6f6f426c895f` | 2026-09-06 08:52:53.559 | Directs that standard physics be mapped into Minkowski geometric grammar without adding unnecessary primitives. |
| `bb4913a7-1244-4818-bbac-b8c7e279a004` | 2026-09-06 08:57:41.174 | Requests an intrinsic oscillation rate that persists at the ground state, distinct from an excitation frequency. |
| `3860bfc1-d797-4ba5-8d2b-20e1d84c13ef` | 2026-09-06 09:01:16.333 | Treats internal and external force effects as deviations on the same four-dimensional curve; separates this from deciding whether zitterbewegung is literal internal motion. |
| `6014da97-99f4-47ba-8542-8e7fd40ceb00` | 2026-09-06 09:12:34.222 | The filament itself is to be considered as an Einstein-Rosen bridge, not merely a frame or sheath. |
| `44c42bc8-540d-4e52-881b-2b6328410e15` | 2026-09-06 09:15:12.511 | Explicitly rejects using Compton or zitterbewegung scales to assign filament size. |
| `2a34f106-0dd0-488f-a0e6-97748320c955` | 2026-09-07 05:58:50.090 | Orders the proposed internal geometry as Kerr core, optional ergosphere or other layer, then coiling. |
| `3d0ad680-51db-4c79-ad4a-9bbacada24ef` | 2026-09-07 07:46:38 | Specifies a spatial Kerr section extended along the filament, not a full four-dimensional Kerr spacetime used as another four-dimensional object's cross-section. |

The later September 7 messages about finite-core support, mutual timesheet/filament accommodation, force as primitive, and the three representations are already treated in [issue #1142](https://github.com/Satobloc/HsH/issues/1142) and [issue #1271](https://github.com/Satobloc/HsH/issues/1271). This note does not reissue those findings.

### Meridian Free Build, October 9

- Conversation ID: `6ac45d1f-17b0-83ea-ad1f-fa524602378b`
- Raw Git blob: `7af1561b321f4d9364da5eb111df689efc652827`
- [Raw conversation blob](https://api.github.com/repos/Satobloc/HsH/git/blobs/7af1561b321f4d9364da5eb111df689efc652827).

Later direct refinements:

- `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`, 2026-10-09 07:40:38.859Z: the first-order coil scale `ell_f` is not filament thickness. Intrinsic core thickness `epsilon` is a distinct scale. A 3D picture may be only an intersectional trace of a higher-order 4D filament; 3D self-closure is not assumed.
- `3c657387-b80b-4982-a61a-8e6d8568b8d1`, 2026-10-09 01:50:55.112Z: at the Newtonian limit, particle motion is represented by worldtube bending; filament motion is not a separate physical motion.
- `5a929b5e-515e-4f77-a32a-e49feef42812`, 2026-10-09 02:46:38.173Z: rejects an independent elastic modulus, invented filament tension or microscopic spring constant; states the inertia/worldtube-bending equivalence as a geometric description and emphasizes that the timesheet is interacting, not merely a passive readout.

The later October 20-21 native convention is separately recorded in the current [BEDROCK](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md): `cw=t` and `(++++)`. Preserve this separately from the October 9 `w=ct` notation. No conversion is supplied here.

## 2. Source-faithful geometry

The direct statements support the following typed vocabulary, but not yet a complete embedding or physical plot.

| Symbol | Meaning | Status |
|---|---|---|
| `M4` | Ambient four-dimensional geometry | Direct descriptions are versioned; Minkowski grammar and later native `(++++)` convention are not silently identified. |
| `W4` | Full filament/worldtube history with finite-core interpretation | Nathan Direct / later working construction; support dimension and embedding still need explicit definition. |
| `K3` | Spatial Kerr section used as a candidate core | Nathan Direct. |
| `L3` | Optional near-core layer, possibly an ergosphere or another structure | Direct proposal; layer identity is open. |
| `Gamma` | Oscillatory, coiling, nested-helical or braided geometry | Direct descriptive family; exact parameterization is not supplied. |
| `ell_f` | First-order coil radius/diameter scale | Direct October 9 clarification. |
| `epsilon` | Intrinsic core thickness | Direct October 9 clarification; not interchangeable with `ell_f`. |
| `Sigma3_t` | Three-dimensional timesheet/timewave/simultaneity surface | Nathan Direct. |
| `I_t` | Candidate intersection `W4 intersect Sigma3_t` | Assistant reconstruction; dimension depends on support dimension of `W4` and transversality. |
| `mu_charge` | Charge-weighting/readout measure on a section | Missing source-defined map. |
| `r_rms` | Measured second-moment observable | Standard statistical/physical observable, not a braid-envelope radius by definition. |

The current BEDROCK retains a Kerr/ER core as a working hypothesis and does not license presupposing a horizon or ergosphere.

A source-faithful hierarchy is:

```text
Ambient M4
  ├── W4: full filament/worldtube
  │     ├── K3: spatial Kerr section (candidate core)
  │     ├── L3: optional layer (not specified)
  │     ├── Gamma: oscillatory/coiling/braided geometry
  │     └── epsilon: intrinsic core thickness
  │          ell_f: separate first-order coil scale
  ├── Sigma3_t: timesheet/timewave
  └── M_fluid: proposed medium with Kelvin vortices

W4 ∩ Sigma3_t
  └── O_t / mu_charge
        └── r_rms and other observables
```

This is a mapping skeleton, not a geometric plot. The required maps remain missing:

1. An embedding of the spatial Kerr section into the four-dimensional filament/worldtube.
2. A defined map from the Kerr core to any optional layer.
3. A map from the finite-core worldtube to its oscillatory or braided trace.
4. A support- and transversality-aware section map from `W4` to `Sigma3_t`.
5. A readout measure from that section to charge density and its measured second moment.
6. A dynamic interaction map expressing the direct claim that filament and timesheet distortions mutually accommodate one another.
7. A constitutive map for the proposed fluid medium and its Kelvin vortices.

The assistant's candidate product `K3 × R_tau` is one possible idealization of extension along a filament. It is not a Nathan Direct equation and it assumes product structure and a fixed cross-section unless further variation is specified. The direct ER-mouth-to-timesheet description may require a non-product gluing or transition map.

## 3. Historical assistant mathematics and fidelity

### A. Field-theoretic detour

Before the direct September 6 primitive constraint, the assistant proposed a radial unit field `u` and metric `g = delta - 2 u tensor u`, then a closed FLRW form with `a(t)=t`, curvature and Einstein-tensor expressions, and a Klein-Gordon scalar field equation.

The user then directly narrowed the ontology: no independent primitive fields; use the geometric structures, medium and timesheet already named, and derive from the declared four-dimensional geometry. The assistant's FLRW/scalar-field branch is therefore an assistant proposal, not a source-faithful SAT equation. The metric construction could only be reconsidered if its `u`, metric, signature and relation to the direct geometry are explicitly derived. The scalar field is not authorized as a new primitive by this source.

### B. Circular helix

The assistant's parameterization `r(theta) = (R cos(theta), R sin(theta), b theta)` is valid standard Euclidean geometry for a circular helix. Its pitch, curvature and torsion formulas are conditional results for that special curve.

They do not establish that the full physical filament is a one-dimensional centerline, that Frenet torsion equals tube twist, or that the finite-core worldtube is represented by this curve. A general four-dimensional oscillation need not be a circular helix; the circular case requires a fixed drift axis and a circular transverse oscillation. Multiple frequencies, non-round cross-sections and nested modes require additional definitions.

### C. Diameter ratio

The direct September 6 request names worldtube diameter divided by helical diameter. The assistant later uses the conventional spring-index ratio `D / d_w`, which is the reciprocal if these are the same two diameters. This is not automatically a mathematical error, but the two conventions must be named separately.

The October 9 direct clarification makes the distinction sharper: `ell_f` is the coil scale and `epsilon` is core thickness. Do not silently substitute either for the other or identify either with a Compton or zitterbewegung length.

### D. Compton and zitterbewegung assignments

The assistant used Compton and zitterbewegung scales to assign a candidate electron helix/filament radius and described the size as nearly determined. Nathan Direct subsequently rejected those scales as the assignment rule. The later `ell_f` / `epsilon` distinction confirms that coil scale and core thickness are separate quantities. The assistant's earlier numerical identification is not an accepted physical input.

### E. RMS charge radius

The user explicitly distinguishes the measured RMS charge radius from the braid-envelope radius and asks which braid statistic corresponds to the measured second moment.

The assistant's uniform-radius example is only a special case. A general readout would require a source-defined charge measure `mu_charge` on the relevant section, for example:

`r_rms^2 = integral(r^2 d mu_charge) / integral(d mu_charge)`.

This is a generic definition of a weighted second moment, not an H(s)H equation or calculation. Without the measure and geometry-to-charge map, the braid envelope cannot be equated to the measured RMS radius.

### F. Framing and spin

The assistant's use of `pi_1(SO(3)) = Z2` is a standard topological fact for a framed rotation loop. It is not a derivation of particle spin from the direct geometry. The user subsequently rejected frame/sheath as the physical identity of the filament and specified an ER-bridge construction instead. A map from the ER geometry to a spin structure remains absent.

### G. Inertia and time-surface interaction

The October 9 direct claim identifies Newtonian inertia with worldtube bending as two descriptions of the same motion. The assistant's `F = m c^2 d^2 x / dw^2` is a coordinate-level rewrite under `w=ct`; it is not, by itself, a proof that this coordinate second derivative equals intrinsic four-dimensional curvature in every regime. The direct source also rejects an independent spring modulus and says the timesheet interaction cannot be treated as passive. The later `cw=t` convention is separate and must not be substituted without an explicit coordinate map.

### H. Scale heuristic

The direct proposal that oscillatory/orbital motion dominates below molecular-scale and above large-group mesoscale regimes is exploratory. The terms defining the boundaries and the meaning of dominance are not operationalized. It is not a measured scale law and is not used for a calculation here.

## 4. Proof-first status

Existing Lean work was reused rather than duplicated.

- [NadirHelixSliceGeometry.lean](https://github.com/Satobloc/HsH/blob/infra/lean4-verification-20261023/FORMAL_VERIFICATION/HsHVerification/NadirHelixSliceGeometry.lean), blob `3e47ffa6d6bcd534abdedf18ea865fb2941a0947`, formalizes transverse line/hyperplane intersection and the circular-helix slice, radius and moving-slice phase-rate subcases.
- Successful PR merge-reference builds: runs [#41301288857](https://github.com/Satobloc/HsH/actions/runs/41301288857) and [#41348936553](https://github.com/Satobloc/HsH/actions/runs/41348936553). The theorem-specific `#print axioms` outputs show `propext`, `Classical.choice` and `Quot.sound`; no `sorryAx` or `admit` appeared in those theorem outputs.
- These are merge-reference builds, not a fresh exact-head build. The module does not prove the translation from Nathan Direct geometry or any physical premise.
- [SableEuclideanHelixCurvature.lean](https://github.com/Satobloc/HsH/blob/research/sable-euclidean-helix-curvature-20261102t0400z/FORMAL_VERIFICATION/HsHVerification/SableEuclideanHelixCurvature.lean) is an assistant-authored Euclidean-lift candidate on a scratch branch. It has no verified CI run. No local Lean/Lake/Elan installation was available in this runtime, so it is not reported as compiled.
- No new Lean code or PR was created. The complete core/layer/coil/worldtube/timesheet map is not sufficiently defined for a faithful new theorem.

## 5. Discrepancy ledger

| ID | Discrepancy | Status |
|---|---|---|
| GFD-01 | Independent scalar field introduced without a source-defined primitive | Rejected as a direct translation; assistant proposal only |
| GFD-02 | Circular 3D helix treated as the general four-dimensional oscillatory object | Valid special case; general map missing |
| GFD-03 | Conventional spring index `D/d_w` versus direct requested `d_w/D` | Reciprocal conventions; preserve separately |
| GFD-04 | Compton/ZB scales used to assign filament size | Explicitly rejected by later Nathan Direct |
| GFD-05 | Coil scale `ell_f` conflated with core thickness `epsilon` | Explicitly separated by later Nathan Direct |
| GFD-06 | RMS charge radius equated to braid envelope | No charge measure/readout map; unresolved |
| GFD-07 | SO(3) frame-loop spin argument treated as physical filament spin | Mathematical fact only; physical map absent and frame/sheath rejected |
| GFD-08 | Product extension `K3 × R_tau` treated as the full Kerr/ER construction | Assistant candidate; embedding/gluing conditions missing |
| GFD-09 | `w=ct` silently substituted for later `cw=t` | Distinct source conventions; no conversion supplied |
| GFD-10 | Coordinate acceleration treated as intrinsic worldtube curvature | Conditional Newtonian coordinate statement; general identity not proved |
| GFD-11 | Timesheet treated as passive readout | Conflicts with direct mutual-interaction qualification |
| GFD-12 | Spring-engineering tension/modulus treated as physical primitives | Later direct source rejects independent modulus, tension and spring constant |
| GFD-13 | Broad oscillatory-dominance scale heuristic treated as an empirical law | Exploratory; thresholds and dominance criterion undefined |
| GFD-14 | Kelvin vortices identified with classical Kelvin-wave turbulence by name alone | No carrier, core, mode or readout map; comparator only |

## 6. Geometry-first disposition

This is not a precise geometric plot of an identified physical system. It is a source-to-mathematics mapping skeleton. No independent hostile review of an exact plot was performed, and no reviewed plot was displayed with its associated file.

**Factory Floor eligibility: BLOCKED.**  
**Geometry status: GEOMETRY_UNDERSPECIFIED / SOURCE_FIDELITY_AUDIT_ONLY / REVIEW_PENDING.**  
**Theory status: no promotion; no BEDROCK change.**

No physical calculation, fit, prediction, CODATA scoring, measured-system selection or paper-gate advancement was performed.

## 7. Next deeper cursor

Continue the October 9 Meridian Free Build raw source immediately after Nathan Direct message `5a929b5e-515e-4f77-a32a-e49feef42812` (2026-10-09 02:46:38.173Z). Audit the assistant's coordinate and curvature translation, then reconcile it with the October 21 direct `cw=t` / `(++++)` convention without substituting it for `w=ct`.

The next substantive geometric target is the explicit map from the finite-core worldtube and timesheet intersection to a charge-weighted measure and measured second moment. This remains a map-definition problem, not a physical calculation.

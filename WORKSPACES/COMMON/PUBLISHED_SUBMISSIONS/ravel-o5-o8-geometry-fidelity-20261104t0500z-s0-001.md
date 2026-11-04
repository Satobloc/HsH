# SAT-O5/O8 source-variant and geometry-fidelity addendum

**Status:** SOURCE_FIDELITY_DELTA. This is a historical-source and mathematical-type audit, not a physical result, fit, measurement, theory promotion, or canonical equation correction.

## 1. Source records and version identity

| Source | Date/status | Immutable locator |
|---|---|---|
| `SAT_O5.pdf` | File index: 2025-06-03; 152,388 bytes | Git blob `a8e09cfb70c96776b715b223d72c6e572356de70`; PDF SHA-256 `0380aaaee6eaa8a46dca8418ad248219908e94edbf3d97e50a7936c41321010d` |
| O5 PDF text extraction | 2026-09-10 16:03:13Z; PyMuPDF 1.26.4; 2 pages; no OCR | `_AUTO_EXTRACTED_TEXT/SAT_O5.txt`, blob `7ebff56fe6b9ce5f46ab8a2e6d7c1ed7dbe15ec3`; request `2026-09-10_root_pdf_extraction_pass_002`; source SHA-256 matches the PDF above |
| O5 LaTeX variant | Internal date June 2025; byline “SATO.4D Coherence Project” | `EARLY LOGGED/2025-10-24_1224_SAT_O5.tex`, blob `8601b33349c14e4453cc475f9850c1bc5e123462` |
| O8 text module | File index: 2025-06-06; author field is a placeholder; no document date | `SAT_O8.txt`, blob `b5147fe08da0a65cb40e73365c71717aaad149ff` |
| O8 LaTeX variant | Internal date June 2025; byline “SATO.4D Coherence Project” | `EARLY LOGGED/2025-10-24_1233_SAT_O8.tex`, blob `5ce0998783ccbb24fd5cea193af1126d8160b5d5` |
| SAT.4D glossary | Internal date July 2025; byline “SATO.4D Coherence Project” | `EARLY LOGGED/2025-10-24_1312_SAT_GLOSSARY_FINAL.txt`, blob `efc88f4523b2fd616e64898737c2aa45e5f39b9a` |
| SAT.O1 geometry text | Historical module, June 2025 archive lineage | `SATOBLOC/SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc` |
| SAT.O Official Directives | July 2025 | Git blob `167136310cdf33ca8f986f33634692314c1a0946` |
| Blockwave attachment | Attached 2025-09-16 16:31:26.687Z; unbylined, content author unknown | Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; previously recorded SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664` |

The O5 PDF extraction and O5 `.tex` agree on the transverse-scale and coupling formulas. The O8 `.txt`, O8 `.tex`, and July glossary do **not** agree on the mass scale. These are project documents, not authenticated Nathan Direct statements.

## 2. Historical equations, kept verbatim by variant

### O5: transverse scale and coupling

The O5 source gives

\[
\ell_f=\left(\frac{2A}{T}\right)^{1/3},\qquad
\epsilon_f^2=\ell_f^2,
\]

\[
g_{SU(2)}\sim\frac{1}{\sqrt{\rho_{\mathrm{link}}\,\ell_f^2}},
\qquad
g^{-2}\sim\rho_{\mathrm{link}}\ell_f^2.
\]

O5 defines \(\rho_{\mathrm{link}}\) as pairwise linking density and says the topological densities are statistical frequencies within a volume element. The PDF extraction is more explicit: “number of links per unit volume.” O5 calls \(A\) bending rigidity and \(T\) filament tension, but does not assign their units or define the support measure for the volume.

### O8: two incompatible mass-scale variants

The root `SAT_O8.txt` variant states

\[
T\sim\frac{c^4}{G},\qquad
\ell_f\sim\left(\frac{2A}{T}\right)^{1/3},
\qquad
m_0\sim\frac{T\ell_f}{c^2},
\qquad
m_{\mathrm{eff}}=\frac{m_0}{Q}.
\]

It also gives \(\ell_f\sim10^{-5}\,\mathrm m\) and large \(Q\)-suppression values.

The separate June-2025 O8 `.tex` variant instead states

\[
Q=\text{normalized total winding + linking + writhing number},
\qquad
m_{\mathrm{eff}}=\frac{m_0}{Q},
\qquad
m_0\sim\frac{T}{\ell_f}.
\]

The July glossary repeats

\[
m_{\mathrm{eff}}=\frac{T\ell_f}{c^2Q}.
\]

No explicit version-control statement selects the \(T\ell_f/c^2\) or \(T/\ell_f\) form as canonical. They must not be silently combined.

## 3. Nathan Direct geometry recovered independently

Raw source: **Meridian Free Build**, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, Git blob `7af1561b321f4d9364da5eb111df689efc652827`.

Relevant user-role messages:

- `6f00a97a-aa84-45bf-9429-4ff70736014a`, 2026-10-09 01:13:43Z: one helical core; the larger coil is hollow, not a second core; a soliton is proposed as an effect in/around the core and responsive medium, not as the filament itself.
- `3c657387-b80b-4982-a61a-8e6d8568b8d1`, 2026-10-09 01:50:55Z: the block is treated as stationary; apparent particle motion is described through filament topology; worldtube resistance to changes in motion is associated with inertia. The message uses \(w=ct\) as a classical time-length coordinate.
- `5a929b5e-515e-4f77-a32a-e49feef42812`, 2026-10-09 02:46:38Z: the time surface is described as a 3D bulk that interacts with matter, not a passive readout; filament stiffness is said to set coil size and to be inferable from precision momentum data under known force. No constitutive law or dataset is supplied.
- `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`, 2026-10-09 07:40:38Z: the message distinguishes coil scale from intrinsic filament thickness, calls \(\ell_f\) misnamed if read as thickness, describes a 4D filament with a 3D intersectional trace, and rejects assuming 3D self-closure. Its wording alternates “diameter” and “radius” around a proposed \(\sim0.7\) fm scale; that ambiguity is preserved.

A later direct correction matters: in **Meridian Minkowski Ring Analysis**, conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, message `090f5160-1020-486d-9c42-df3d7dff2063` (2026-10-21 00:17:23Z) says reciprocal filament/timesheet descriptions are no longer current since the Klein Fabric model became common. Message `c5525f53-b7cc-4444-8102-3bf6fdb1c892` (2026-10-21 13:55:40Z) states the current working convention as \(cw=t\), Forest normalization, and \((++++)\), explicitly without proof. This is not silently identified with the earlier \(w=ct\) or a Lorentzian \((-+++)\) convention.

## 4. Historical geometry versus later assistant translation

SAT.O1 and the July directives describe 1D filaments in a 4D manifold and a propagating 3D wavefront; SAT.O1 separately calls the 4D worldtube the volume swept out by a vibrating filament. This is historical module language, not a complete map to the later Nathan Direct “4D filament / 3D trace” wording.

The `🧱BLOCKWAVE.txt` attachment (blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, previously byte-verified SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`) is unbylined; its content author is unknown. The separate 2025-10-19 assistant action in raw conversation blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, message `3039b226-02d4-41a3-a2d3-c338e25204a9`, is explicitly assistant-authored. Its candidate equations include

\[
A_\mu(\theta)=\alpha_*\nabla_\mu\theta,\qquad
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]},
\]

\[
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
\qquad
\nabla_\mu J^{\mu\nu}=0.
\]

This is a rank-two current/worldsheet construction. It is not Nathan Direct and has no source-defined map to the later 4D-core / 3D-trace geometry or to O5’s \(\rho_{\mathrm{link}}\).

## 5. Conditional geometry map and discrepancy ledger

Under ordinary transverse-intersection geometry in a 4D ambient space:

| Support | Support dimension | Poincaré-dual form degree | Transverse intersection with a 3D timesheet |
|---|---:|---:|---:|
| filament spine | 1 | 3 | 0D |
| worldsheet | 2 | 2 | 1D |
| shell | 3 | 1 | 2D |
| full 4D core region | 4 | 0 | 3D |

A candidate reconciliation is a 1D spine with a 3D core fiber, producing a 4D finite-core region \(W^4\), followed by

\[
W^4\cap\Sigma_t^3=T_t^3.
\]

That could yield a 3D trace while keeping the hollow outer coil distinct from a second core. It is a candidate reconstruction, not a source-defined embedding or physical response law. The 1D spine itself would intersect the timesheet in events, not a 3D trace.

| Discrepancy | Finding |
|---|---|
| O5 density | “Number of links per unit volume” multiplied by \(\ell_f^2\) is not dimensionless under ordinary 3D or 4D volume-density units. The expression is dimensionless for an areal density. No source map changes the stated volume density into an areal one. |
| O8 mass scale | \(T\ell_f/c^2\) and \(T/\ell_f\) are incompatible variants. If \(T\) is force, energy, or force-per-length, \(T/\ell_f\) is not a mass. |
| \(\ell_f\) meaning | O5/O8 call it a transverse filament scale; Nathan Direct later describes a coil radius/diameter-like scale distinct from intrinsic core thickness. Radius versus diameter remains unresolved. O8 `.txt` gives `~10^-5 m`, while the direct message proposes a `~0.7 fm` radius neighborhood; no version map reconciles them. |
| Support rank | Blockwave \(J_2\) corresponds to a 2D worldsheet support; its 3D-timesheet intersection is 1D. It is not the same support as a full 4D core whose intersection is 3D. |
| Inertia versus stiffness | Nathan Direct distinguishes worldtube inertia from filament stiffness controlling coil size. No constitutive map connects either to O5 \(A,T\). |
| Metric/signature | Blockwave’s \(u^\mu u_\mu=-1\) and \(\sqrt{-g}\) use Lorentzian conventions; the later direct \((++++)\) convention has no recovered conversion map. |
| Phase field | With smooth single-valued \(\theta\) and \(A=\alpha_*d\theta\), \(F=dA=0\) locally. A nonzero field requires defects, patching, or a non-exact potential not specified in the assistant action. |
| Klein Fabric | Direct source marks the old reciprocal description as superseded, but does not define the Klein Fabric’s global topology or its map to the local finite-core/timesheet structure. |

## 6. Formalization status

Existing draft PR [#1133](https://github.com/Satobloc/HsH/pull/1133) already formalizes conditional carrier/sheet dimension and SI dimension arithmetic. This run added three conditional theorems to `RavelFilamentScaleDimensionAudit.lean` on its existing branch, commit `d2ec576b9bc4815780ee78d8d5b9a2e7f95d388d`, showing that the O8 `.tex` \(T/\ell_f\) variant is not a mass if \(T\) is force, force-per-length, or energy.

The new commit was compiled in successful PR workflow run **#41777985187** (Lean 4.34.0; 8,950 build jobs). The run checked out merge reference `12d092c`, merging commit `d2ec576b9bc4815780ee78d8d5b9a2e7f95d388d` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`; it is therefore a successful merge-reference build, not a standalone exact-head build. The three new `o8_tex_mass_scale_t_over_ell_*` declarations compiled, and their explicit `#print axioms` outputs report no axioms. The automated axiom-audit stage was skipped. Existing carrier/sheet theorems also compiled; the 1D-carrier/3D-sheet intersection and full-4D-core/3D-sheet intersection theorems report no axioms.

These Lean results prove only the formalized dimensional and intersection statements under their stated assumptions. They do not select the canonical O8 version, establish that the translation is faithful, or validate any physical premise.

No CODATA scoring, physical calculation, fit, independent measurement, theory promotion, or canonical equation correction was performed.

## 7. Next source cursor

Recover the author/source conversation for the O5 and O8 variants; determine whether \(\ell_f\) is intended as a coil radius or diameter and define the support measure for \(\rho_{\mathrm{link}}\). Then specify, with domains and composition laws, the maps from spine to finite core, finite core to timesheet intersection, and intersection/medium state to any observable. Keep the older reciprocal model and Blockwave assistant action historical until a direct source establishes a current map.

# Ravel | Geometry-fidelity glossary and mapping addendum
**Run:** `REVROT3-19-20261011:581:s0`  
**Status:** source-fidelity addendum; no physical prediction or theory promotion.

Primary source and equation inventory: [issue #1340, submitted through the HsH publisher](https://github.com/Satobloc/HsH/issues/1340). The issue is a distinct O5/O8 variant addendum, not a replacement for prior #1138/#1202 work.

## 1. Stable working glossary

| Term | Meaning kept distinct | Provenance/status |
|---|---|---|
| \(\gamma^1\) | 1D filament carrier or spine in a 4D ambient manifold | Historical SAT.O1/direct 2024 vocabulary; later “4D filament” intrinsic dimension remains ambiguous |
| \(W^4\) | Full-dimensional finite-core worldtube/region in 4D | Historical SAT.O1 “volume swept out” plus later assistant reconstruction |
| \(\Sigma_t^3\) | 3D wavefront/timesheet/time bulk | Historical directives and Nathan Direct; later direct source says the bulk interacts, not merely records |
| \(T_t^3\) | Candidate 3D trace \(W^4\cap\Sigma_t^3\) | Conditional geometric reconstruction, not a source-defined observable |
| \(\Gamma^2\) | 2D worldsheet support | Blockwave assistant construction, not Nathan Direct |
| \(J_2\) | Rank-two current/Poincaré-dual object for a 2D worldsheet | Assistant-authored Blockwave proposal |
| outer coil | Hollow 3D trace/coil, not a second core | Nathan Direct, 2026-10-09 |
| core | Single helical core; soliton is a possible medium effect around/in it | Nathan Direct, 2026-10-09 |
| \(\ell_f\) | Historical transverse scale; later direct reinterpretation as coil radius/diameter-like scale, not core thickness | O5/O8 versus Nathan Direct; radius/diameter and scale version unresolved |
| \(A\) | Bending rigidity/stiffness parameter | O5/O8 project text; no source-defined constitutive law |
| \(T\) | Filament tension in O5; \(T\sim c^4/G\) in O8 text | Historical project text; dimensional role differs between variants |
| \(\rho_{\rm link}\) | Pairwise linking density, described as links per unit volume | O5 source; support measure not reconciled with \(\ell_f^2\) |
| \(Q\) | Normalized winding/linking/writhing or topological suppression factor | O8/glossary proposal; no map from the one-core geometry |
| \(\theta,u^\mu,\mathcal M\) | Compact phase, timelike flow, and medium response fields | Blockwave assistant proposal, not Nathan Direct |

## 2. Geometry map

```text
Historical / candidate carrier hierarchy

  γ¹  (1D spine)
   |
   |  include 3D core fiber
   |  [map and fiber law not source-defined]
   v
  W⁴  (4D finite-core worldtube)
   |
   |  intersect with
   v
  Σ_t³  (3D time bulk / wavefront)
   |
   v
  T_t³ = W⁴ ∩ Σ_t³
   |
   |  candidate hollow outer coil / trace
   |  response operator R_t not defined
   v
  observable / readout  [MAP MISSING]


Separate historical assistant construction:

  Γ² (2D worldsheet) --Poincaré dual--> J₂
       |
       | intersect Σ_t³
       v
  1D loop / string trace

No map currently identifies J₂ with γ¹, W⁴, T_t³, or ρ_link.
```

Under ordinary transverse-intersection geometry in \(M^4\):

| Support | Dimension | Poincaré-dual degree | Intersection with \(\Sigma_t^3\) |
|---|---:|---:|---:|
| spine \(\gamma^1\) | 1 | 3-form | 0D |
| worldsheet \(\Gamma^2\) | 2 | 2-form | 1D |
| shell | 3 | 1-form | 2D |
| full core region \(W^4\) | 4 | 0-form | 3D |

Thus the direct “4D filament / 3D trace” wording can be reconciled only conditionally by distinguishing a 1D spine from a 4D finite-core region with a 3D fiber. The spine itself does not yield a 3D trace on a transverse 3D timesheet.

## 3. Original propositions versus assistant translations

| Original source proposition | Historical/assistant translation | Fidelity judgment |
|---|---|---|
| SAT.O1: 1D filaments in 4D; worldtube is swept 4D volume; 3D wavefront | A 1D spine plus a 3D fiber could generate a 4D core | Plausible reconciliation, but no direct embedding or fiber map |
| Nathan Direct: one helical core; larger coil hollow, not a second core | Earlier nested 3D carrier/offset-curve construction | Useful curve geometry only after a projection is defined; it must not create a second physical core |
| Nathan Direct: 3D time bulk interacts with matter | Blockwave “string = timesheet trace” as record | Loses the active response; no interaction/readout operator supplied |
| Nathan Direct: worldtube response is inertia; filament stiffness controls coil size | Assistant statement that no stiffness/tension is needed | Overcorrection; inertia and internal coil-setting stiffness have not been related by a constitutive map |
| Nathan Direct: \(\ell_f\) is coil-scale-like, not core thickness | O5/O8: \(\ell_f\) is transverse filament scale | Semantic collision; no version map or radius/diameter resolution |
| O5: \(\rho_{\rm link}\) is number of links per volume; \(g^{-2}\sim\rho_{\rm link}\ell_f^2\) | Later code can make the product dimensionless by treating density as areal | Unauthorized reinterpretation unless an explicit projection/measure is supplied |
| O8 `.txt`: \(m_0\sim T\ell_f/c^2\) | O8 `.tex`: \(m_0\sim T/\ell_f\) | Incompatible source variants; no canonical precedence |
| Blockwave: \(J_2\) current on worldsheet | Direct 4D core with 3D trace | Different support dimensions; no map |

## 4. Discrepancy ledger

1. **O5 density exponent:** volume density times \(\ell_f^2\) is not dimensionless for ordinary 3D or 4D volume measures. Areal density would make it dimensionless, but the source says volume density.
2. **O8 mass-scale fork:** \(T\ell_f/c^2\) and \(T/\ell_f\) are incompatible. The latter is not a mass if \(T\) is force, force-per-length, or energy.
3. **Scale identity:** O8 `.txt` gives \(\ell_f\sim10^{-5}\,\mathrm m\); Nathan Direct later gives a \(\sim0.7\) fm radius neighborhood for the coil scale. No version map identifies these as the same scale.
4. **Core versus spine:** the direct “4D filament” wording does not state whether it means the 1D carrier or the full finite-core region.
5. **Worldsheet versus core:** Blockwave \(J_2\) is typed for a 2D worldsheet; its 3D-sheet trace is 1D, not the direct 3D trace.
6. **Active versus passive timesheet:** Nathan Direct describes an interacting bulk; Blockwave reduces it to a trace/readout without a response law.
7. **Inertia versus stiffness:** the two direct uses are distinct descriptions; neither is mapped to O5 \(A,T\).
8. **Metric/signature:** Blockwave uses \(u^\mu u_\mu=-1\) and \(\sqrt{-g}\); later direct convention is \((++++)\). No conversion map is present. Earlier \(w=ct\) and later \(cw=t\) are not silently identified.
9. **Exact phase:** if \(A=\alpha_*d\theta\) for smooth single-valued \(\theta\), then \(F=dA=0\) locally. Nonzero field requires defects, patching, or a non-exact potential, none specified in the assistant action.
10. **Klein Fabric supersession:** direct source says reciprocal filament/timesheet descriptions are no longer current since Klein Fabric. The global topology and its map to the local core/sheet construction remain undefined.
11. **O8 angle prerequisite:** the \(\theta_4\) inner-product/arccos expression requires a metric and normalized vectors, while the glossary says no metric/connection is assumed a priori. The required metric/normal data are not supplied.

## 5. Formalization and epistemic status

Existing draft PR [#1133](https://github.com/Satobloc/HsH/pull/1133) was extended on its existing branch with three conditional theorems testing the O8 `.tex` \(T/\ell_f\) variant under force, force-per-length, and energy assignments for \(T\).

CI run [#41777985187](https://github.com/Satobloc/HsH/actions/runs/41777985187) succeeded on Lean 4.34.0, 8,950 build jobs. It compiled commit `d2ec576b9bc4815780ee78d8d5b9a2e7f95d388d` in merge reference `12d092c` with base `c7dc2c483f50ae03fc7a7c530829170135e18d92`. The three new theorems’ explicit `#print axioms` outputs report no axioms. The automated axiom-audit stage was skipped. This is a successful merge-reference build, not a standalone exact-head build.

Lean proves only the formalized dimensional/intersection statements under their assumptions. It does not choose the correct O8 source variant, prove source-translation fidelity, or validate physical premises. No physical calculation, fit, independent measurement, CODATA scoring, or theory promotion occurred.

## 6. Next source cursor

Recover the author/source conversations for O5 and O8. Decide, from Nathan Direct source rather than analogy, whether \(\ell_f\) is coil radius or diameter and define the support measure for \(\rho_{\rm link}\). Then specify explicit domains, codomains, projection/embedding maps, and composition conditions for spine \(\to\) finite core \(\to\) timesheet trace \(\to\) medium response/readout. Keep Blockwave and the older reciprocal model historical until a direct source establishes a current map.

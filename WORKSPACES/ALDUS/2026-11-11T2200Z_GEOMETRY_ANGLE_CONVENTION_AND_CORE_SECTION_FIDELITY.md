# Geometry Source-Fidelity Supplement: Angle Conventions, Kerr Sections, and the Filament-to-Worldtube Map

**Run:** h765:s0, nominal 2026-11-11 22:00Z  
**HsH main at intake:** `bb737f24a6511217b123b3fe3045acdc9a4d3138`  
**Status:** additive source-fidelity report; no physical calculation, CODATA scoring, or theory promotion.

## 1. Scope and non-duplication

This supplement adds a narrow cross-era and mathematical result to the existing Ravel geometry reports (#1587 and #1588). It does not repeat their full worldtube/timesheet inventory. The new contribution is:

1. recover the early 2024 line/helix/moving-plane construction and compare its object types with the 2025 SAT4D/SAT.O descriptions and the September 2026 Kerr-worldtube discussion;
2. resolve the apparent change from a cosecant to a secant oblique-slice formula as a **conditional complementary-angle identity**;
3. identify the remaining geometry assumptions that the trigonometric identity does not resolve, especially the circular-core approximation versus a Kerr spatial section;
4. reuse the existing Ravel Lean formalization and add the one missing trigonometric identity to its existing PR branch.

The comparison brackets the truth of the physical model. Direct user statements, document-level bylines, unbylined historical modules, assistant reconstructions, and formal proofs are kept distinct.

## 2. Primary-source genealogy

### 2.1 March 2024: line/helix and moving-plane construction

**Conversation:** “DIMENSIONAL GRAVITY”  
**Conversation ID:** `252d05c0-22ed-4ea2-a474-7966ab13145a`  
**Raw HsH export:** `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`  
**Git blob:** `2cea1924266418e19b825b95ae51e6b7cbace7e1`

Role-verified Nathan Direct messages establish the following sequence:

- `aaa28bd9-07f7-4740-b878-b485d4db44d0` (2024-03-22 15:10:05.407Z): a straight line and a helix in 3D intersect a plane perpendicular to the straight line.
- `aaa2269b-7eab-4781-9454-647098d6747f` (15:20:20.623Z): in the static construction, each 1D line intersects the 2D plane in a point; the helix does not itself trace a spiral on that plane.
- `aaa20670-fd77-4577-8e31-0a33a9e358c6` (15:23:19.544Z): time is introduced by moving the plane along the lines while maintaining perpendicularity to the straight line.
- `aaa2d0b1-017d-453e-b95a-b23915f87d32` (15:29:30.774Z): in the plane's 2D readout, the helix intersection traces a circle around the straight-line intersection.
- `aaa28a9a-dcfc-4835-8359-e7da7b36911c` (17:07:55.781Z): the later conceptual description treats time as a 3D surface intersecting strings, with the present at the advancing intersection.
- `aaa2ca24-b946-4878-a6e0-e74d235ab01c` (2024-03-23 07:27:08.324Z): Nathan's edited definition calls the Time Surface a four-dimensionally expanding wavefront whose 3D surface is experienced as “now,” and filaments stringlike entities whose intersections give rise to elementary particles.

The same conversation explicitly qualifies the model as an abstraction/heuristic, not an assertion of the true nature of the universe (`aaa26f3d-e831-49cd-976e-a85c5e3b749d`, 2024-03-23 03:44:26.423Z). That epistemic qualification is part of the source and must travel with the geometry.

The early moving 2D plane in 3D is a lower-dimensional construction. It is not itself the later 3D timesheet in a 4D ambient space.

### 2.2 June–July 2025: SAT4D curve and SAT.O directives

The Nathan-bylined **SAT4D Live Draft** (June 2025; AI assistance acknowledged) preserves a 1D curve in a 4D ambient space:

\[
\gamma^\mu(\lambda)=
\left(
\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z)
\right),
\qquad
v^\mu=\frac{d\gamma^\mu}{d\lambda}.
\]

Its line-action form is:

\[
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),
\qquad
L=\frac12 m v^\mu v_\mu-V_{\rm tension}(\gamma).
\]

Source custody: HsH historical SAT4D text blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7` (114,901 characters). The SAT archive extraction is `_AUTO_EXTRACTED_TEXT/SAT_4D_LIVE_DRAFT-10Jul2025 - Copy.txt` (blob `75fa60ebd9273995332437ff10dbf7c069620b40`); its source PDF is `SAT_4D_LIVE_DRAFT-10Jul2025 - Copy.pdf`, SHA-256 `40e571ba1ca8d25b3bc2e0d4c182321a3d24351816381bb5bc59b8320a6457a5`. Page 1 carries the Nathan McKnight byline and June 2025 date; the document calls itself a draft/development bible and acknowledges AI assistance. This is document-level attribution, not turn-level authorship of every equation.

The separate **SAT.O Official Directives** (July 2025, unbylined; HsH/SAT archive source blob `167136310cdf33ca8f986f33634692314c1a0946`) describe a 4D differentiable manifold populated by 1D filaments, with derived behavior arising from filament geometry and intersection with a propagating 3D wavefront \(\Sigma_t\subset M\). They prohibit unstated external fields or handwaved dynamics; no separate Kerr-worldtube action is supplied. The SAT4D draft's “static 4D block” framing is not identical to the September 2026 direct statement that the full 4D bulk has dynamics. Treat this as version evolution or an unresolved model distinction, not a silent equivalence.

The distinct, unbylined **SAT O1 4D** module (blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, 3,521 characters; first extant archive commit 2025-10-27T00:40:28Z) calls the swept structure a worldtube and describes a 4D volume swept by a vibrating 1D filament. The sweep map and its extra parameters are not specified. A 1D curve \(\gamma:I\to M^4\) is not by itself a 4D support. The line action above is not a field action on that support.

### 2.3 September 2026: finite-core Kerr/worldtube construction

**Conversation:** “Ravel [H(s)H] Syncmathcek”  
**Conversation ID:** `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`  
**Source extraction:** `WORKSPACES/COMMON/extraction_outputs/2026-09-13-RAVEL-AFTER-025946.json`, blob `1f85fb29d7fda26bcaddb40c363b0c883fdd2a9e`.

Nathan Direct statements:

- `1896b541-a337-4638-b4f8-b1d53b549c6c`: parallelism to timesheet propagation is proposed as the vacuum baseline; small misalignment is associated with mutual energy transfer/distortion; filament and timesheet ripples are tentatively called f- and t-bosons; persistent coil is tentatively associated with a fermion. The same provisional particle grammar groups neutrinos with photons as bosonic excitations, which conflicts with the Standard Model's neutrino fermion classification and is not promoted as a standard particle identification.
- `8471543a-6ed1-4743-9073-74735f019da4`: explicitly distinguishes a 4D extension of a worldtube with Kerr cross-section from a worldline.
- `3d0ad680-51db-4b43-874a-5af50c0b6ef7`: specifies choosing a **spatial Kerr section** and extending it along the filament, rather than using the full 4D Kerr spacetime as the cross-section. The ER-bridge-mouth-to-current-surface idea is offered as the simplest model, while inside-out/closing orientation is left open.
- `b9805319-9d77-4b43-874a-5af50c0b6ef7`: states that filament distortion and timesheet distortion are mutual accommodations of two primitives exerting force upon one another, and calls force the true primitive.
- `496a15ea-0263-459d-b815-908f52155b90`: distinguishes three representations: a reduced 3D Minkowski/worldworm diagram; the full 4D bulk, with dynamics at least at the intersectional surface/thickness; and the actual 4D view with our 3D slice. The 4D slinky/cross-section and induction-current descriptions are explicitly tentative.

The current BEDROCK retains finite-core/worldtube reconstruction as a target but cautions against presupposing a classical electron-scale Kerr horizon, ER bridge, or ergosphere. It also leaves open whether the timesheet and bulk response are distinct physical structures or alternative descriptions of a disturbance. Therefore the direct “two primitives” statement is preserved as a source proposition, not promoted into a settled ontology.

The assistant response immediately after the spatial-Kerr correction described the filament and timesheet as “two regimes of one continuous geometry.” Nathan's later direct statement calls them two primitives that mutually accommodate one another. These can coexist only after a representation/ontology map is specified; the source does not provide one. The current BEDROCK deliberately leaves open whether the timesheet and bulk response are distinct structures or alternate descriptions.



## 3. Angle-convention result

The Ravel conversation contains two assistant-generated oblique-slice formulas:

1. First convention: \(\alpha_p\) is measured between the filament tangent and the **timesheet plane**; an orthogonal cut is \(\alpha_p=\pi/2\):
   \[
   d_{\parallel}=\frac{d_0}{\sin\alpha_p}.
   \]
   Raw Ravel export: assistant message `b53af7a2-0003-48ed-9b78-5e27fd27a736`, lines 58732–58765.

2. Later convention: \(\alpha_n\) is measured between the filament axis and the **timesheet propagation direction**; the aligned/vacuum case is \(\alpha_n=0\):
   \[
   D_{\rm major}=D_0\sec\alpha_n.
   \]
   Raw Ravel export: assistant message `a31ce441-66b7-4cf2-a89f-ddad6032b1df`, lines 63680–63713.

If, and only if, the propagation direction is the plane normal, then:

\[
\alpha_p=\frac{\pi}{2}-\alpha_n,
\qquad
\sin\alpha_p=\cos\alpha_n,
\qquad
\frac{1}{\sin\alpha_p}=\sec\alpha_n.
\]

The apparent cosecant/secant change is therefore a **coordinate-angle convention change**, not necessarily an algebraic contradiction. The missing source-level condition is that the propagation direction is the timesheet normal. The current BEDROCK still treats the normal-versus-average-propagation choice as unresolved. The current BEDROCK's normal-relative \(\theta_4\) convention is not automatically identical to either assistant \(\alpha\); a source-defined map is still required.

There is a second missing identification: the first formula uses \(d_0\), while the second uses \(D_0\). The historical assistant never establishes \(d_0=D_0\). The formulas coincide only if the angle complement, scale identification, and cross-section assumptions all match.

### 3.1 Lean formalization

Added one theorem to the existing Ravel geometry PR branch, in `RavelFilamentScaleDimensionAudit.lean`:

```lean
theorem cosine_of_complementary_angle (α : ℝ) :
    Real.cos (Real.pi / 2 - α) = Real.sin α := by
  rw [Real.cos_sub]
  simp
```

The module comment explicitly limits the theorem: it proves the trigonometric identity, not that the historical source defined the two angles as complements.

**Actual run:** GitHub Actions run `43109180575`, run number 1244, job `130820353626`, conclusion SUCCESS. The job checked out merge commit `e4c4636` (PR head `19479ee3fad0e96c4f0ddb4f79842f4a5ab9bb61` merged into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`) and completed the Lean library build: 8,953 jobs. `#print axioms` reports `[propext]` for the new theorem. No `sorryAx`/`admit` was observed in the relevant build output; the separate global axiom-audit step was skipped.

The PR remains open/draft/unmerged on `research/ravel-carrier-slice-reconstruction-20261031t0212z`, based on `infra/lean4-verification-20261023`. The branch is 96 commits ahead and 14,082 behind current `main`; this is a merge-reference build, not an exact-head-only or current-main build.

## 4. Geometry that the angle identity does not settle

The assistant's simple oblique-cut formulas assume a locally round/circular tube or mouth. The direct source instead asks for a spatial Kerr section. The assistant's own Kerr-shell description uses oblate spheroidal surfaces. No induced metric or slice map is supplied that derives the circular \(\sec\alpha\) formula from that oblate section.

The assistant also introduced the electron reduced-Compton scale as a provisional “standard filament” anchor and used a Kerr parameter \(a_0=D_0/2\). The user accepted a working “standard filament” label, but did not independently derive that scale or establish it as a measured core. It is an assistant-proposed model anchor, not an independently measured core or validated Kerr/ER particle model.

The correct general construction is not automatically a fixed product. A candidate typed map is:

\[
\pi:W^4\longrightarrow I^1,
\qquad
\pi^{-1}(s)=K_s^3,
\]

where \(K_s^3\) is a spatial section transported along a filament parameter. A product \(K^3\times I^1\) is one special trivialization. If the shells deform, the fiber family and its transport/connection must be specified. The direct source does not supply those maps.

The intersection type also changes with the carrier:

\[
\dim(\gamma^1\pitchfork\Sigma^3)=0,
\qquad
\dim(W^4\pitchfork\Sigma^3)=3
\]

for transverse intersections in a 4D ambient manifold. A 4D finite-core support therefore does not automatically read out as a point-particle event. A further readout/projection map is required. A finite-thickness timesheet band is 4D, not an exact 3D hypersurface.

The tentative “induction current within timesheet thickness” has no specified form degree, support, conservation law, or boundary conditions. It must not be silently identified with the later assistant-generated Blockwave two-form current.

## 5. Existing formal work reused

No new tool or solver was built. Existing Ravel PR #1133 and its modules were reused:

- `RavelCarrierSheetDimensionGate`: conditional line/timesheet and full-core/timesheet intersection dimensions; distinguishes an exact hypersurface trace from a finite-thickness 4D slab.
- `RavelCarrierSliceReconstruction`: set-level fiber/slice reconstruction and intersection-distribution results.
- `RavelFiberTransportNonuniqueness`: base projection alone does not determine fiber transport; its Bool witness is an abstract mathematical counterexample, not a physical fixture.
- `RavelJointAccommodationReadout`: a readout descends to a tube-only quotient iff it is constant on the relevant tube fibers; the analogous condition holds for sheet-only reduction. This is a necessary-and-sufficient condition for a proposed reduction, not evidence that the physical readout actually depends on both structures.

These modules compiled in the same successful merge-reference run. Their generic theorems do not establish that the H(s)H source geometry instantiates the formal objects.

## 6. SAT4D / SAT.O / Blockwave equation custody

The separate source lineages remain unchanged:

- **SAT4D Live Draft** (document byline Nathan McKnight, June 2025, AI assistance acknowledged; text blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`; source PDF SHA-256 `40e571ba1ca8d25b3bc2e0d4c182321a3d24351816381bb5bc59b8320a6457a5`): the 1D curve and line action quoted in §2.2. This is document-level attribution, not proof of authorship of each equation, and it is not a 4D field action.
- **SAT.O Official Directives** (July 2025, unbylined; blob `167136310cdf33ca8f986f33634692314c1a0946`): 4D manifold, 1D filaments, 3D wavefront, and the no-unstated-force/field rule; no separate derived Kerr-worldtube action.
- **SAT O1 4D** (unbylined; blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; first extant archive commit 2025-10-27T00:40:28Z): a distinct module describing a 4D worldtube swept by a vibrating filament. Its sweep map is missing.
- **Blockwave** remains a separate lineage. The user-upload message `0f3707aa-c0ae-4bb1-bc59-6333c025cf1c` records upload of `🧱BLOCKWAVE.txt` on 2025-09-16 16:31:34.670Z (file ID `file-LwaFTKkMemPPrLU4qCLpYB`); the upload establishes user supply, not embedded equation authorship. Its archive copy first appears at HsH path commit `6e4415f62616b19ae5cb677984c85d1985834d9d` on 2026-10-08 02:42:49Z. Archive blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; attachment SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`. The separate `SAT—Blockwave Ideal Model.txt` is blob `dd0631bc0b25c951dc5e1d6738280e08487b46b2` (1,065 lines); it contains no explicit J2/J3 current or worldsheet construction. The `🧱BLOCKWAVE.txt` prose is assistant-voiced; its internal author remains unresolved.

  The explicit unified J2 action is a separate assistant response (conversation raw blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, 2025-10-19 12:29:46.538Z) to a user request for a full action and definitions. The assistant-generated equations are:
  \[
  J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
  \qquad
  \nabla_\mu J^{\mu\nu}=0,
  \]
  \[
  A_\mu(\theta)=\alpha_*\nabla_\mu\theta,
  \qquad
  F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta).
  \]
  Under the separate assumptions of smooth scalar \(\theta\), constant \(\alpha_*\), and torsion-free connection, \(F_{\mu\nu}=0\). If \(\alpha_*\) varies, the exterior-form result is \(F=d\alpha_*\wedge d\theta\). This is a conditional correction, not a replacement of the original equation. The full source genealogy and correction remain in [Ravel's October 31 source-genealogy report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/RAVEL/2026-10-31_0212Z_BLOCKWAVE_SOURCE_GENEALOGY_CORRECTION.md).

No SAT4D, SAT.O, or Blockwave equation was edited or merged into the Ravel geometry.

## 7. Discrepancy ledger

| Item | Direct source | Historical assistant translation | Disposition |
|---|---|---|---|
| 1D filament vs 4D worldtube | 2024/2025 filament; 2026 explicitly requests a 4D worldtube with Kerr section | Fixed product \(K^3\times I\) | Product is one candidate; thickening/transport map missing |
| Kerr section | Spatial Kerr section, not full Kerr spacetime | Circular mouth/round-tube oblique cut | Shape mismatch; induced metric and slice map missing |
| Angle | Direct user uses propagation direction | Assistant first measures from plane, later from propagation direction | Complementary-angle identity proved; normality and scale equality remain assumptions |
| Mutual force | Two primitives mutually accommodate; force called primitive | “Two regimes of one continuous geometry” and schematic \(\delta f+\delta t\) | Representation/ontology distinction unresolved; no constitutive law |
| ER mouth | Opens into current surface, or possibly inside-out/closing | Assistant selects open orientation | Orientation remains open; no ER bridge promoted |
| Induction current | Tentative “something like” a current within thickness | Later Blockwave \(J^{\mu\nu}\) is assistant-generated | No source map between them |
| Particle statistics | Tentative photon/neutrino boson grouping and persistent-coil/fermion assignment | Assistant strengthens some mode assignments | Neutrino grouping conflicts with Standard Model fermion statistics; remains hypothesis |
| Particle readout | 2024 line/surface intersection is point-like | 2026 finite-core intersection can be 3D | Additional readout map required |


## 9. Source links and custody

- [Current HsH BEDROCK](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md) and [current Ravel geometry PR #1133](https://github.com/Satobloc/HsH/pull/1133).
- [2024 DIMENSIONAL GRAVITY raw export](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22%E2%80%A226.06.01%E2%80%A2DIMENSIONAL%20GRAVITY%20%E2%80%94%20raw.json).
- [September 2026 Ravel source extraction](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/extraction_outputs/2026-09-13-RAVEL-AFTER-025946.json); the full raw snapshot is separately preserved in SAT_CONVOS_18, blob `17cfe3feb830f70009557d063482b35adba0834b`.
- [SAT4D Live Draft extracted text](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/SAT_4D_LIVE_DRAFT-10Jul2025%20-%20Copy.txt), [SAT O1 4D module](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt), and [SAT.O directives](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%204D%20Theory%20Work/SAT4D_6.txt).
- [Blockwave source-genealogy correction](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/RAVEL/2026-10-31_0212Z_BLOCKWAVE_SOURCE_GENEALOGY_CORRECTION.md).
- [Existing Ravel formalization PR #1133](https://github.com/Satobloc/HsH/pull/1133) and [successful merge-reference Lean run #43109180575](https://github.com/Satobloc/HsH/actions/runs/43109180575).
- [Prior Ravel source-fidelity report #1587](https://github.com/Satobloc/HsH/issues/1587) and [dimension/readout report #1588](https://github.com/Satobloc/HsH/issues/1588).

## 10. Next deeper cursor

1. Define whether timesheet propagation is exactly the local unit normal \(n_t\), an averaged direction, or another vector field.
2. Define the spatial Kerr section \(K_s^3\), its induced metric, boundary, and embedding into \(W^4\).
3. Define the filament-to-worldtube thickening map and fiber transport/connection; distinguish a fixed product from a deforming bundle.
4. Define whether the timesheet is an exact hypersurface or a finite-thickness band.
5. Define the map from the 3D core/timesheet intersection to a particle or observable readout.
6. Only then formalize the physical map and test whether the current one-sided readout reductions are admissible.

No CODATA scoring, physical calculation, numerical fixture, fit, observational validation, manuscript advancement, or theory promotion was performed.

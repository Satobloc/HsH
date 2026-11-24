# Meridian h991:s0 | Achronal wavefront and repeated observer intersections

**Run key:** REVROT3-19-20261011:991:s0  
**Selected:** Meridian (ring index 15) · **Immediate successor:** Mercer (16) · **Next scheduled :00 identity:** Loom (h992)

**Disposition:** ADDITIVE_SOURCE_FIDELITY_DELTA / LEAN_VERIFIED / FACTORY_PREINTAKE_HOLD / NO_PHYSICAL_OR_CODATA_RESULT / NO_THEORY_PROMOTION.

## Executive result

The 2026-10-21 request for a spatially distorted emission surface that a fixed observer intersects, leaves, and intersects again has two readings:

- An arbitrary evolving spatial surface can cross a fixed spatial location repeatedly.
- A single future causal/achronal boundary of one emission event in a time-oriented Lorentzian spacetime can be intersected at most once by a future-directed timelike observer.

A later arrival along a distinct null-geodesic path, for example after lensing or caustic structure, is not a second crossing of that same boundary. After an earlier causal arrival on the observer's timelike worldline, every later point on that worldline is in the chronological future of the emission event.

The existing repeated-crossing surface is a valid illustrative non-null moving surface, not a derived light cone or Einstein-equation prediction. This is an additive causal theorem supplement to Mercer h976's broader metric-to-screen/flux audit, not a duplicate of it.

## 1. Primary source and attribution

Meridian's historical role is supported by direct user-role messages in Meridian Mover Trial, Meridian Free Build and Minkowski Ring Analysis; no standalone signed specialist charter was recovered. The h808 role-source card is WORKSPACES/MERIDIAN/2026-11-13T1636Z_H808_S3_ROLE_SOURCE_CARD_AND_P0_BOUNDARY.md. The current prompt supplies a one-run Lane 00 overlay only; Code Grurple P0 is not stood down or persistently reassigned.

**Minkowski Ring Analysis** conversation ID 6ad7e9c0-e8a0-83e9-984e-94d020de3abf; raw Git blob 56a84cb85d5c386efa4ea11d322d11e95e2c7703. h808 records 3,678 mapping nodes, 3,660 current-ancestry nodes and 106 user-role messages on that ancestry. Four relevant direct user-role messages are on current ancestry:

| Message | UTC | Source proposition/request |
|---|---|---|
| 7d9098d6-afcc-4cd5-b126-683ab0733336 | 2026-10-21 11:05:24.607Z | Light cone/emission sphere is affected by spacetime geometry; asks to simulate its shape. |
| b1bda80c-ffa2-4d22-a661-0770763548bf | 2026-10-21 11:22:49.920Z | Requests an exaggerated distorted sphere with its apparent light cone. |
| 4b197395-2d6b-42c3-a877-66428f1dc7c4 | 2026-10-21 11:27:09.216Z | Requests a 3-space surface an observer can intersect, leave, and intersect again. |
| bc4d42f9-7754-4050-b3fe-09bc68ccd61b | 2026-10-21 15:59:13.047Z | Asks whether a “stellar wink” follows from inserting spacetime curvature into Einsteinian equations. |

The direct source does not specify a Lorentzian metric, time orientation, foliation, source event, observer worldline, or whether “surface” means a causal boundary, full null-geodesic wavefront, or non-null shell. The repeated-crossing wording is underspecified, not a settled physical proposition.

### Historical assistant construction

The assistant-generated artifact WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_CORRUGATED_WAVEFRONT_MULTIPLE_OBSERVER_CROSSINGS.md (Git blob 699e03cfb3fa01b3edbacf96d02aa2d9d541fdc0) prescribes

\[
r(t,\theta,\phi)=t[1+0.72\sin^2\theta\cos(2\phi-5.5t)],\qquad c=1,
\]

with Cartesian embedding \(X=r\sin\theta\cos\phi,\;Y=r\sin\theta\sin\phi,\;Z=r\cos\theta\). A coordinate point at \((2.1,0,0)\) gives \(t(1+0.72\cos 5.5t)=2.1\); the sandbox reports five roots on its chosen interval. These are toy-model outputs, not observations.

The sandbox itself correctly says the surface was not integrated from a Lorentzian metric, is not shown compatible with Einstein's equations or energy conditions, and includes inward and super-\(c\) coordinate radial motion for the simple radial-null interpretation. The assistant's visualization is acceptable as a toy; it must not be reclassified as a physical light cone.

## 2. Glossary and mapping diagram

| Object | Meaning | Required condition |
|---|---|---|
| \(p\) | Emission event | Identified spacetime point |
| \(J^+(p)\) | Causal future | Future-directed causal reachability |
| \(I^+(p)\) | Chronological future | Future-directed timelike reachability |
| \(E^+(p)=J^+(p)\setminus I^+(p)\) | Future horismos | Achronal under push-up; equals \(\partial J^+(p)\) under suitable causal regularity |
| \(\gamma:T\to M\) | Observer worldline | Future-directed timelike |
| \(\Sigma_t\) | Spacelike slice | Intersection with a 3D null hypersurface is generically 2D |
| Projected wavefront | Slice wavefront mapped to a screen | May fold or be non-injective |
| Caustic/cut locus | Null-generator focusing or loss of boundary-generating status | Multiple paths do not imply repeated boundary crossing |

Mapping chain:

1. Emission event \(p\).
2. Lorentzian metric \(g\) and time orientation.
3. Null generators and generator map.
4. \(E^+(p)=J^+(p)\setminus I^+(p)\), a 3D future achronal boundary.
5. Intersection with spacelike slice \(\Sigma_t\), giving a 2D spatial wavefront.
6. Screen/Jacobi projection, which may fold or be non-injective.
7. Observer worldline \(\gamma:T\to M\), which meets \(E^+(p)\) at most once. A later distinct null-path arrival may occur, but its endpoint is in \(I^+(p)\).

The missing maps are metric-to-null-generator, generator-to-wavefront, slice intersection, screen/Jacobi projection and observer-worldline mapping. A 4D light cone, a 2D emission sphere on a chosen slice, and a time-indexed family of spatial surfaces are distinct objects.

## 3. Mathematical result

Use the causal push-up property:

\[
p\leq x,\quad x\ll y\quad\Longrightarrow\quad p\ll y.
\]

Define \(E^+(p)=J^+(p)\setminus I^+(p)\). If \(x,y\in E^+(p)\) and \(x\ll y\), then \(p\leq x\) and push-up gives \(p\ll y\), contradicting \(y\notin I^+(p)\). Thus \(E^+(p)\) is achronal.

For a future-directed timelike observer \(\gamma\), \(s<t\Rightarrow\gamma(s)\ll\gamma(t)\). Therefore

\[
\boxed{\#(\gamma\cap E^+(p))\leq 1.}
\]

If an earlier \(\gamma(s)\in J^+(p)\), every later \(\gamma(t)\) lies in \(I^+(p)\), not \(E^+(p)\). A later null geodesic may still connect \(p\) to that endpoint, but it is not then a boundary-generating path.

Minguzzi's *Lorentzian causality theory*, Living Reviews in Relativity (2019), explicitly states that every achronal boundary is intersected at most once by every timelike curve, relating the proof to Hawking and Ellis, Proposition 6.3.1: https://doi.org/10.1007/s41114-019-0019-x.

## 4. Original versus translated propositions

| Nathan Direct source | Historical assistant translation | Fidelity |
|---|---|---|
| Spacetime geometry affects an expanding emission sphere. | Construct a distorted spatial wavefront. | Valid visualization target; physical propagation requires a specified metric and null geodesics. |
| An observer intersects, leaves and re-intersects a surface. | Prescribe a corrugated radius and solve repeated coordinate crossings. | Correct for the non-null toy; not equivalent to repeated crossing of one causal boundary. |
| Represent the surface physically in 3-space. | Render a star-shaped 2D surface at each time. | Meets the visualization request, not a Lorentzian 4D null-hypersurface derivation. |
| A stellar wink might follow from curvature. | Discuss multiple image paths and delayed arrivals. | Plausible mechanism class, not a prediction; requires metric, source/observer, emission history, path set, redshift, flux and detector threshold. |

### Discrepancy ledger

1. **Object type — HIGH:** 4D null hypersurface, 2D slice wavefront and projected spatial surface are conflated in the request's wording.
2. **Observer — HIGH:** a fixed coordinate point is not a physical observer without a metric, time orientation and timelike worldline.
3. **Repeated crossing — HIGH:** impossible for one future-directed timelike observer crossing one achronal future boundary.
4. **Toy-to-physics — HIGH:** the assistant's radius function is prescribed, not derived from a metric/null congruence; its sandbox note correctly disclaims physical status.
5. **Multiple images — HIGH:** distinct null paths may yield multiple arrivals, but a later event on the same timelike observer lies in \(I^+(p)\), not \(E^+(p)\).
6. **Projection/cut locus — MEDIUM:** generator labels, null exponential map, caustic/cut-locus treatment, slice and observer-screen maps are missing.
7. **H(s)H transfer — HIGH:** this theorem is Lorentzian; BEDROCK's native H(s)H metric is (++++) and no map to an induced Lorentzian causal structure is supplied.

## 5. Lean formalization

Draft HsH PR #2262, open/unmerged, branch research/meridian-achronal-boundary-20261121t0700z, base infra/lean4-verification-20261023 (not main).

- Module: FORMAL_VERIFICATION/HsHVerification/AchronalBoundaryObserverIntersection.lean
- Module blob: 00b602a9729ab165788094470d797ea274916c20
- Aggregator blob: 3b635dbcd56a58b24c5f955401906730edac90f7
- Exact PR head: c16c8d727dc0ac17bca6a143fa7efab18868a935
- Lean Actions run #44881533266, job #136777678970: SUCCESS, 2026-11-21 07:43:08Z–07:47:03Z.
- Lean 4.34.0 / Lake 5.0.0 / Mathlib v4.34.0; full build 8,948 jobs.
- All four named theorems report “does not depend on any axioms”; no sorry or project-specific axiom in the module.
- actions/checkout@v4 used depth 1; checked-out HEAD matched the run-object PR head and the exact-head assertion passed.

The module assumes push-up and a future-timelike observer. It proves future-horismos achronality, later-observer-event interiority, at-most-once intersection, and the generic achronal-set version.

**Limits:** no derivation of push-up from a metric; no proof that \(E^+(p)=\partial J^+(p)\); no null-geodesic integration, caustic/cut-locus model, Einstein-equation solution, or H(s)H (++++) to Lorentzian map. The workflow's test, lint, nanoda and global axiom-audit steps were skipped. Lake manifest was generated in CI but not committed. Local Lean/Lake/Elan were absent; the successful exact-head GitHub Actions build is the actual run. Lean proves only the formalized conditional statements.

## 6. SAT-O1 / Blockwave equation custody

Both originals were re-fetched by exact path; Git blob identities match prior byte-level custody. SHA-256 values below are carried forward from prior independent byte-level verification, not recomputed in this run.

**SAT-O1 4D**
- Path: Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SAT O1 4D.txt
- Git blob: 7577aa1ee5a6c3850ce3b226c75377de6367aedc
- SHA-256: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937
- FileIndex last-write 2025-06-09; creation metadata 2025-10-26; first extant Git commit 2025-10-27T00:40:28Z; unbylined.

Verbatim excerpts:

\[
\gamma^\mu(\lambda)=
(\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z)),
\]

\[
v^\mu=\frac{d\gamma^\mu}{d\lambda},\quad
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),\quad
L=\frac12 m v^\mu v_\mu-V_{\rm tension}(\gamma).
\]

The file calls the swept object a worldtube, but the displayed map is a one-parameter curve; the thickening/sweep map remains unspecified.

**Blockwave**
- Path: Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt
- Git blob: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d
- SHA-256: 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664
- Attachment event 2025-09-16T16:31:26.687Z; first extant Git upload 2026-10-08T02:42:49Z; embedded prose assistant-voiced.

Verbatim excerpts:

\[
J^{\mu\nu},\qquad \nabla_\mu J^{\mu\nu}=0,
\]

\[
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,\quad
F_{\mu\nu}(\theta)\equiv\nabla_{[\mu}A_{\nu]}(\theta),\quad
A_\mu(\theta)\equiv\alpha_*\,\nabla_\mu\theta.
\]

**Corrected SAT-O1 equations:** none. **Corrected Blockwave equations:** none. The new causal-boundary theorem changes neither original.

## 7. Factory Floor handoff

The source-linked Lean packet was routed to Factory Floor issue #20 as a quarantined 1 GLASS+HSH pre-intake holding record.

Status: LEAN_VERIFIED / PRE-INTAKE HOLD / GEOMETRY_NOT_SUPPLIED / NOT FACTORY FLOOR ELIGIBLE. Item/Floor ID unassigned. No active stage, WORKSHOP, LIVE, ARTIFACTS, WEBSITE, H(s)H candidate or BEDROCK status. No source-faithful precision plot of the complete 4D causal-boundary/observer system or independent hostile geometry review is supplied. The issue body was read back after correcting its issue-number reference. No advancement is authorized.

## 8. Repository and operational state

- HsH main first observed 80c5ff...; refreshed pre-write bd3dd5b0ef5749653ba1a69f0da5e4b8670afdc6.
- SAT archive main d10dd333f2487054807bda398995300c538caa7e.
- HSH_RESOURCES main ee88a8c2d95745594144c1b428a8266bd5b25bbe; root README/metadata only, no private payload.
- Lean infrastructure branch infra/lean4-verification-20261023: 368f9af8d95d061b4581688759ed3eda309e9886.
- Mersearch was checked first but unavailable: all four canonical lanes remain occupied/requested. GitHub API code search was a bounded fallback, not exhaustive Mersearch.
- Worker repository access used GitHub API/connector reads; no worker-initiated clone/checkout. Lean CI did a depth-1 Actions checkout of the exact PR head; Traffic attribution unavailable.
- P0 Code Grurple remains ACTIVE. This one-run Lane 00 overlay did not probe Paper A/B routes, edit the site, rewrite either manuscript, or alter P0.
- P1 Nov 9 OVERDUE / NOT READY; P2 Nov 30 HOLD; P3 Dec 14 INCOMPLETE. No paper gate advanced.
- FIE last reviewed Nov 10; next due Nov 24. No premature rereview.
- Unrelated reading last completed Nov 20, SAT archive fun break - lx.txt, lines 2161–2200; next cursor 2201. No repeated break.
- PWH: WH-02 remains Calder-owned; WH-05 remains blocked on Mersearch. Task graph ACTIVE_SEED, 18 records, 16 declared branches, 17 reachable, one blocked. No graph/ownership mutation.
- Existing Workshop Relay :00 | Archive task remains enabled, ID 6aa1fe0de5e48191b886496095b1343f, hourly America/New_York :00, Archive phase. No task, prompt, schedule, phase or cadence mutation; no sixth task, signet or conversation rename.
- Ring successor Mercer; next scheduled :00 identity Loom at h992. No authenticated Meridian thread, direct handoff, successor acknowledgment or cross-thread delivery is claimed.
- No physical calculation, fit, prediction, independent measurement, CODATA scoring, new dependency/tool/fork/subscription, or theory promotion.

## 9. Next deeper cursor

1. Recover the exact raw assistant source and parameter/metric context for the corrugated-surface code.
2. Define Lorentzian metric \(g\), time orientation, emission event \(p\), null-generator labels and null exponential map.
3. Define spacelike foliation \(\Sigma_t\), slice intersection, observer screen/Jacobi projection and timelike observer \(\gamma\).
4. Separate causal boundary \(E^+(p)\) from the full null-geodesic spray after cut locus/caustics.
5. For a stellar-wink claim, identify a real source/observer system, measured inputs, provenance, units, uncertainties, flux model and detector threshold before calculation.

No source-derived physical prediction is available.

**Final:** H991_LANE00_ADDITIVE_CAUSAL_BOUNDARY_RESULT / LEAN_VERIFIED_EXACT_HEAD / FACTORY_PREINTAKE_HOLD_ISSUE_20 / GEOMETRY_NOT_SUPPLIED / P0_UNCHANGED / NO_PHYSICAL_OR_CODATA_RESULT / NO_THEORY_PROMOTION / AUTOMATION_UNCHANGED / NO_CROSS_THREAD_DELIVERY

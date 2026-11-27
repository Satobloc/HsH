# Meridian - h1143:s0
## Gendarme Graticule, torus parallels, geodesic separatrix, and source-fidelity audit

**Disposition:** PRIMARY_SOURCE_REPARSED / PARALLEL-VS-GEODESIC DISTINCTION ESTABLISHED / TWO-GRATICULAE CANCELLATION REJECTED BY LATER DIRECT CORRECTION / EXISTING LEAN WORK REUSED / NO_NEW_FORMALIZATION / NO_THEORY_PROMOTION.

### 1. Routing and authority

- Nominal slot: 2026-11-27T15:00:00Z.
- h=1143; seq=5h=5715; 5715 mod 19=15.
- Selected routing label: Meridian, index 15.
- Next ring label: Mercer, index 16.
- No authenticated current Meridian thread was established. This is assistant-level source reconstruction, not historical Meridian participation or cross-thread delivery.
- No separate signed Meridian specialist charter was recovered. The historical role-source card and direct user messages establish a geometric-solver comparison/reconstruction remit.
- This is a one-run Lane 00 source-fidelity overlay. Meridian's standing Code Grurple/P0 assignment is unchanged. No site, manuscript, queue, or worker-local pointer was modified.

### 2. Primary-source recovery

The central source is the raw Michelstein-on-Meinorly conversation:

- Conversation ID: 6a9aa91b-11f4-83ea-80a1-4d502522e441.
- Raw Git blob: d21e251df093013903cc19789ded562f83b6e6ea.
- Mapping nodes: 343.
- Selected current ancestry: 333 nodes.
- The five direct messages below are user-role messages on that ancestry.

| UTC | Direct message ID | Source proposition |
|---|---|---|
| Sep 4 13:18:01 | 97d89e3a-bd3a-49c6-b489-90c5093e8fc5 | Tentative global theta4 ground state; position-dependent null trajectory along every large-circumference tangent parallel; complementary small-circumference family; upper/lower pairs and equatorial extrema |
| Sep 4 13:44:08 | dd2d0663-03f6-45ee-aae2-b4e792b02d06 | Gendarme grid: two cross-section axes plus central primary-circumference tangent; eight sectors and two overlapping parities; both straight and torus-proper tangent axes |
| Sep 4 15:19:45 | b2f97b0c-21ab-49ad-a0a4-4871e6503765 | Inner/outer, not physical left/right; prograde/retrograde and cw/ccw; nested angular relationships |
| Sep 4 15:47:17 | c67e32f3-43d3-490d-9c64-51c61d0280a9 | Initial proposal for two inverse graticulae and a degenerate cancellation |
| Sep 4 15:50:24 | e380f83e-ba07-4889-8394-e898a95d448b | Immediate direct correction: the two graticulae do not cancel |

The raw conversation and its ancestry are also documented in existing [PR #2697](https://github.com/Satobloc/HsH/pull/2697). This report extends that draft's source analysis; it does not duplicate its Lean module or create another formalization.

### 3. Nathan Direct geometry, with the mathematics temporarily bracketed

The direct description contains two distinct families of closed curves on an ordinary embedded ring torus:

1. At each position around the minor cross-section, a curve tangent to the large/primary circumference. Its length varies with position and has upper/lower paired values, except at the unique outer and inner equators.
2. The complementary curve tangent to the small/minor circumference. Its length is constant across the surface and its location is indexed by radial angle about the primary axis.

The direct Gendarme grid adds a bulk representation:

- Two axes in the small cross-section define four quadrants.
- A central primary-circumference tangent axis doubles these into eight sectors.
- The eight sectors carry two overlapping parities, whose actual transformations are not yet specified.
- Tipping points are intended to be symmetric about the two short axes.
- A curve per tangent-axis unit is intended to measure curvature over a tube segment of chosen length.
- Two tangent references must coexist: a straight orthogonal tangent and the torus-proper curved tangent. The source explicitly says to keep both.
- Side is inner/outer, not left/right. Traversal orientation adds prograde/retrograde and clockwise/counterclockwise distinctions.
- The desired metrics are nested angular relations among the elements and torus primitives, not an arbitrary pile of independent constants.

The tentative theta4 statement is also direct: 90 degrees relative to time, or zero relative to time propagation, is proposed as a ground-state reference. Deviation is tentatively associated with the SAT mass proxy or H(s)H worldtube intersectional area/shape. This is a proposal, not a measured relation.

### 4. Standard torus comparator: parallels are not geodesics in general

For comparison only, take the standard ring-torus embedding with major radius R and minor radius r, where R>r>0:

\[
X(\theta,\phi)=((R+r\cos\theta)\cos\phi,\,
(R+r\cos\theta)\sin\phi,\,r\sin\theta).
\]

Its induced metric is

\[
ds^2=r^2d\theta^2+(R+r\cos\theta)^2d\phi^2.
\]

The two direct-source curve families then have precise standard representatives:

\[
L_{\rm parallel}(\theta)=2\pi(R+r\cos\theta),
\]

\[
L_{\rm meridian}(\phi)=2\pi r.
\]

Consequences:

- The large-circumference family is symmetric under theta -> -theta.
- Its maximum is at the outer equator theta=0.
- Its minimum is at the inner equator theta=pi.
- The small-circumference family has constant length.

This matches the direct description of upper/lower pairs and unique equatorial extrema.

A crucial distinction: a fixed-theta parallel is generally not a geodesic. Its geodesic condition is

\[
\Gamma^\theta_{\phi\phi}
=\frac{(R+r\cos\theta)\sin\theta}{r}=0,
\]

so a parallel is geodesic only at theta=0 or theta=pi for a nondegenerate ring torus.

The historical assistant response at 2026-09-04T12:37:16Z (message e75f6af2-f6d4-4dd4-8f3f-1a5282b7f590) introduced Clairaut's relation and the geodesic separatrix Ccrit=R-r. That is standard geodesic geometry, but it is a different object from the direct-source family of position-dependent tangent parallels. The assistant's separatrix is not a faithful definition of the direct "null trajectory" unless an additional map from the parallel family to a geodesic initial-value problem is supplied.

The word "null" is not defined as a Lorentzian null vector in the direct source. The later 90-degree reference supports treating it as a chosen angular zero-departure direction, but that is a convention, not a metric-null condition.

### 5. Original versus translated propositions

| Nathan Direct | Historical assistant translation | Fidelity assessment |
|---|---|---|
| Large-circumference tangent parallels have position-dependent lengths and upper/lower pairing | Standard torus metric and circumference function | Good conditional translation |
| Complementary small-circumference tangents have constant length | Meridian circles of length 2*pi*r | Good conditional translation |
| "Null trajectory" at each large-circumference parallel | Clairaut geodesic and inner-equator separatrix | Object mismatch: geodesics are not the full parallel family |
| Gendarme grid has two cross-section axes plus a central primary tangent | Eight sign states and scalar chirality proxies | Incomplete: no explicit actions for the two parities or the two tangent references |
| Straight and torus-proper tangent axes, both | Delta-theta approximations using local curvature radius | Plausible local translation; parameter and transport map remain unspecified |
| Inner/outer, prograde/retrograde, cw/ccw | Earlier left/right labels, later signed angle delta | Direct correction must govern; the signed-angle model is still only a candidate |
| Two graticulae; later correction says they do not cancel | Earlier assistant difference G_A-G_B with a zero/null state | Superseded and not source-faithful after the direct correction |
| Nested angular relations and one intrinsic toroidal constant | R/r, eta=(R-r)/(R+r), pairwise K_ij ratios | Candidate normalization only; no unique source-defined constant or complete ratio ledger |
| Multiple valid solver answers and least-wild routes | Restricted Whirligig Kernel 0 | A small kernel, not the general search policy |

The assistant's earlier flat-quotient-torus rational/irrational winding discussion was explicitly corrected by the user to the ordinary embedded doughnut torus. The later Clairaut analysis is appropriate for embedded-torus geodesics, but it still must not be substituted for the direct parallel family.

The assistant's proposed rotation number nu(theta;R/r), delta_F, delta_T, and nested K_ij ratios are not Nathan Direct equations. They require a defined trajectory family, orientation convention, and observable before they can be compared as invariants.

The assistant's proposed scalar triple product (e_phi x e_theta) dot v is zero if v lies in span(e_phi,e_theta). PR #2697 formalizes that conditional identity. It does not establish that the direct Gendarme vector at the cross-section origin lies in the same surface tangent plane; the direct source distinguishes cross-section axes, the central tangent axis, and two tangent-reference choices. The theorem therefore invalidates one restricted proxy, not the full Gendarme construction.

Most importantly, the direct message e380f83e... supersedes the preceding cancellation proposal. The earlier assistant construction G_A-G_B=0 must not be retained as the current model. PR #2697's R=0 sphere-valued parameterization is a separate mathematical limit; it does not prove cancellation or equivalence of the two graticulae.

### 6. Solver-family boundaries

These remain separate objects; no composition map was recovered:

~~~text
Gendarme Graticule
  torus surface + cross-section frame + primary tangent
  -> parallel/meridian families
  -> eight sectors / two proposed parities
  -> candidate angular relationships

UI / Universal Indicatrix
  two 4D hypersphere reference frames
  -> relative rotation and scale
  -> point/curve trajectory
  -> proposed sweep surface

Three Spheres
  three hypersphere carriers
  -> common intersection carrier
  -> current code is a static geometric component,
     not the full deforming/handedness/trajectory proposal

Whirligig
  equations and geometric constraints
  -> multiple candidate transformations/curves
  -> least-wild route selection still needs a cost rule

Hagalaz
  integration/orchestration layer
  -> no source-defined composition map to the four solvers yet
~~~

The detailed Three-Spheres mechanism remains supported by a speaker-labelled archive transcription, not a recovered raw user-role message for the October 5 clarification. The October 5 raw source remains unrecovered. The existing h1124 Meridian report already records the UI/Three-Spheres source gap and current static carrier boundary; this report does not repeat that work.

### 7. Proof-first reuse and exact limits

**PR #2697 - existing draft, exact-head Lean build succeeded**

- Head: 9d470311466461a53ed57fabf60e88cdbc16f7ed.
- [Actions run #46025241850](https://github.com/Satobloc/HsH/actions/runs/46025241850), job #140594836277.
- Lean 4.34.0 / Lake 5.0.0 / Mathlib revision 5ed2965256430c3649e86755f9576b54eca72435.
- Build completed successfully (8,951 jobs).
- The new sphere-limit, branch-invariance, positive-scale, and conditional tangent-plane identities compiled.
- Tests, lint, global axiom audit, leanchecker, and nanoda were skipped. The theorem-specific reports show standard dependencies; no sorryAx was reported for the new module.
- PR remains open/draft/unmerged and is based on a research branch, not main.

**PR #2465 - SO(4) trace versus pointwise speed, exact-head build failed**

The proposed counterexample is mathematically clear: a nonzero skew generator can rotate one coordinate 2-plane while fixing a unit vector in the orthogonal plane. Its Frobenius norm is positive while that vector's pointwise angular speed is zero. Thus a full-frame trace term cannot automatically be identified with pointwise angular speed for every orientation.

However, exact-head run #45315287618 failed. The Lean log reports unsolved goals, a type mismatch, a parser error, and sorryAx in the failed theorem output. This is not a verified Lean proof. The PR remains open/draft.

**Existing adjacent formalizations**

- [PR #2541](https://github.com/Satobloc/HsH/pull/2541), exact-head run #45593900060, succeeds on an assistant-proposed radius cross-inversion and aspect-ratio invariant. Its source is a speaker-labelled transcript without raw role IDs; it is not a Nathan Direct map.
- [PR #2463](https://github.com/Satobloc/HsH/pull/2463), run #45311925541, succeeds on a restricted assistant-generated Whirligig Kernel 0. It does not prove generic equation-to-curve search, least-wild optimization, or a physical carrier.
- Existing UIRadialAngularIdentity proves the four-coordinate radial/angular velocity split given unit direction and orthogonality of its derivative. It does not prove that the source's R(s) is a physical rotation or that a worldtube obeys the map.

Lean verifies only the formalized statements. It does not establish that the assistant's translation is source-faithful or that any physical premise is true. No new Lean module was created because the full Gendarme parity action, source-defined chirality invariant, and geodesic/parallel composition are not yet typed.

### 8. Operational status and safeguards

- HsH main at this pass: 94c6d09aac1f66a863dee32b31cd4050f3d37bcb.
- Existing PR #2697 was reused; no duplicate PR or second formalization was created.
- All four Mersearch lanes remain occupied. No new query, overwrite, release, or retrigger. The raw GitHub conversation and existing archive documents were used as bounded fallback sources.
- No private HSH_RESOURCES payload was accessed.
- P0 issue #1747 remains active: source-level presentation safety FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED. Discovery and docket refresh succeeded on the inspected source cut, but navigation maintenance failed. No route probe or site mutation was made.
- P1 November 9 remains overdue / NOT READY; P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- PWH queue remains stale at h1081; Tern retains queue and task-graph authority. No queue or graph mutation.
- FIE last full review: November 24; next due December 8. Not due.
- Unrelated-source break next due November 28; cursor not advanced. Not due today.
- No CODATA scoring, physical calculations, fits, predictions, independent measurements, paper edits, SAT-O/Blockwave equation changes, or BEDROCK theory promotion.
- The existing :00 Archive task remains enabled with its exact task ID, hourly schedule, and phase. No sixth task, schedule change, signet change, or conversation rename.

### 9. Next deeper cursor

1. Recover the raw user-role source for the October 5 Three-Spheres clarification. Do not substitute the speaker-labelled THE SPHERES.txt transcription or assistant notice.
2. Define the Gendarme torus parameterization, both tangent-reference fields, the two cross-section axes, and the central primary tangent as separate typed objects.
3. Define the two parity transformations and their action on inner/outer, prograde/retrograde, and cw/ccw labels.
4. Keep the parallel-family null reference separate from the geodesic Clairaut separatrix. If they are intended to be connected, supply the explicit map and initial-value conditions.
5. Preserve both graticulae after the direct "they don't cancel" correction; do not reuse the superseded zero-difference model.
6. Specify the observable and its fiber-constancy conditions before reducing the Gendarme state to a scalar or angle.
7. Reuse PR #2697's conditional sphere-limit and tangent-plane identities. Repair PR #2465 only under its own authority; do not claim its failed Lean build as proof.
8. Keep Gendarme, UI, Three Spheres, Whirligig, and Hagalaz separate until explicit projection and composition maps with conditions are supplied.

**Final assessment:** the strongest new source-fidelity correction is that the direct "null trajectory" describes the family of large-circumference parallels, whereas the assistant's Clairaut separatrix describes a different family of geodesics. The standard torus metric supports the direct parallel/meridian length relations, but the proposed chirality, flicker, parity, and nested angular invariants remain underdefined. The two-graticulae cancellation was explicitly withdrawn by Nathan Direct. Existing Lean work verifies narrow conditional identities; it does not close the geometric translation.
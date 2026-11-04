# Amendment 01 | Meridian geometry-fidelity receipt

**Applies to:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-04T1600Z_s0_meridian.md`  
**Classification:** INTERNAL RECEIPT AMENDMENT / SOURCE-FIDELITY CORRECTION / NO PUBLIC SUBMISSION  
**Purpose:** Preserve additional primary-source and historical-role evidence recovered during verification. The original receipt remains unchanged; this amendment is not a second research run or a new public report.

## 1. Historical specialist charter: attribution refinement

The original receipt correctly states that no standalone Nathan-authored Meridian charter was recovered. One additional historical role witness should be recorded.

Nathan Direct message `3e540785-e8df-421c-aded-63bd85add0f8` (2026-09-07T22:33:30.414Z) asked the thread to choose a name and state its primary role and operating parameters. The historical assistant then authored the Meridian entry in `LIVE CONVOS/TEAM_SYNC_2026-09-07.md`, current blob `935b772980e869758fc864e4e0aaffa2d0a81d53`, lines 49-92:

**“Geometric Formalization & Representation Lead — torus/graticule angular calculus.”**

That assistant-authored role statement specifies:
- literal embedded ring-torus geometry, without importing flat-torus assumptions;
- Gendarme Graticule as a cross-sectional coordinate/display surface, distinct from the underlying 3D calculation;
- native metrics retained while angularizing against the primary-circumference tangent, with 90° as the null trajectory;
- ordinary/anti graticulae as exact inner/outer mirror partners, with only the left/right drawing coordinate reflected;
- separate metric families for major-circumference scale, straight-versus-torus tangent relation, graded chirality/flip, winding/rotation number, flicker, holonomy, reconnection/closure, and separatrix/asymptotic transition;
- common degenerate-sphere/null normalization and 3D calculation projected to a readable 2D graticule;
- local reconnection proxies explicitly marked insufficient as final integrated quantities.

This is a historical assistant-authored self-description requested by Nathan, not a Nathan-authored charter and not evidence that a current authenticated Meridian thread is participating.

The subsequent direct user messages anchor and broaden the remit:
- `054d1aea-cf67-4154-93c8-e302dc3ce1ea`: compare Graticule symmetries/asymmetries with physical categories, including partial matches and mismatches, and inspect existing solvers.
- `39299849-e2a4-4b63-88a0-5612c700cc1a`: make solvers configurable/scriptable, test couplings and alternative uses, and verify prior results and limits.
- `f6a2377c-8873-41ee-9107-41aeeb0d2589`: audit the Whirligig GR-QM isomorphism and the derivation process, including what the solver actually does and does not establish.

A later historical assistant response `8a90da18-ef05-4c1e-96a6-3c0d09f39b2f` summarizes the broadened role as solver mathematics, reconstruction, verification, and tool development. These historical descriptions do not override the current Code Grurple Paper A presentation-repair assignment.

## 2. Additional geometry-fidelity findings

The canonical raw conversation is Meridian's `Michelstein-on-Meinorly` export:
- Conversation ID: `6a9aa91b-11f4-83ea-80a1-4d502522e441`
- Raw blob: `d21e251df093013903cc19789ded562f83b6e6ea`

### 2.1 The source's two tangent references are not the assistant's surface-tangent pair

Nathan Direct message `b2f97b0c-21ab-49ad-a0a4-4871e6503765` (2026-09-04T15:19:45.111Z) distinguishes:
- two axes in the small cross-section, forming four quadrants;
- the central primary-circumference tangent, doubling those quadrants into eight sectors;
- a straight, purely orthogonal tangent reference;
- the curved tangent defined by the tube-centric circumference.

Nathan explicitly says “better, both. Always both.” The same message distinguishes inner/outer physical torus sides from display left/right, and relates prograde/retrograde, CW/CCW, and chirality to the difference between the straight tangent and torus circumference.

Message `bfac52b1-98d1-4caa-bf18-d9b513584a2f` (2026-09-04T15:29:58.273Z) sets 90° as the null trajectory associated with the primary-circumference tangent.

Historical assistant message `e3c2fb2a-dc10-472f-9388-51adf9cfab4c` (2026-09-04T17:20:40.129Z) instead defines only the torus-surface tangent pair:
`e_phi ∝ ∂_phi X`, `e_theta ∝ ∂_theta X`,
then sets `v = cos(delta)e_phi + sin(delta)e_theta` and `delta = 0` as null.

This is not yet a source-faithful frame. In particular, the assistant's `e_theta` is the minor-circle surface tangent, not Nathan's separate straight tangent reference. The assistant basis omits the explicitly retained straight tangent. The 90° source-null versus 0° assistant-null could be reconciled by a declared 90° change of angular origin if the source angle is measured from the straight tangent, but no such reference-axis/transport map is stated. Do not silently identify these conventions.

### 2.2 The absolute-value metric and the sphere-null residual are different objects

Nathan Direct message `c67e32f3-43d3-490d-9c64-51c61d0280a9` (2026-09-04T15:47:17.910Z) says that the two cross-sectional circles form inverse graticulae and that the metrics become absolute-value differences between them.

Historical assistant response `48339a26-5540-4f44-9cda-5ef4e1d9ba61` (2026-09-04T15:47:32.039Z) makes a good source-faithful distinction:
- signed comparison: `Delta_i = g_i^(A) - gtilde_i^(B)`;
- source-named metric magnitude: `M_i = |Delta_i|`.

It explicitly preserves the sign as an orientation/parity channel and the absolute value as the metric magnitude. This is a positive fidelity result and should not be lost.

The later assistant proposal in `e3c2fb2a-dc10-472f-9388-51adf9cfab4c`, `DeltaM = M^(T) - M^(S)`, is a separate signed torus-versus-sphere comparison. It is not the same as the source's pairwise absolute difference between ordinary and inverse graticulae. It requires a defined torus-to-sphere correspondence, matched points, common metric, units/scale, and transport rule. None is source-defined yet.

The current receipt's single mapping chain `G -> G∘M -> D=G-G∘M -> CMY display` is therefore incomplete as a metric diagram. Preserve two channels:
1. signed residual `Delta_i`, which can carry orientation information;
2. magnitude `M_i=|Delta_i|`, which is the source-named metric.

For angular quantities, ordinary real-line absolute difference is not sufficient until a lift/branch or a metric on the circle is declared. For vector-valued fields, the component transformation/Jacobian under the mirror must be defined before subtraction. The source has not supplied those types/maps.

### 2.3 Mirror, null, and CMY display remain distinct

Nathan Direct message `71ae32d1-1de0-45a0-83d6-11a58d7a7c31` (2026-09-04T16:38:16.684Z) says the ordinary and anti graticulae should be precise mirror images, with only left/right flipped. Message `59abdb3e-4704-4bdb-837d-b45df7836751` (2026-09-04T16:54:45.382Z) separately asks for a CMY-style cancellation overlay.

Message `7a99e50b-d6c8-4d27-b3fc-a7fcca03c11f` (2026-09-04T17:20:36.687Z) then asks for an actual 3D calculation/integration around the relevant symmetry, using the primary-circumference tangent/asymptote and a reference vector, with the cross-section serving as an indexing surface for the reference vector's intersection with the spherical graticule. It explicitly questions whether earlier plots were calculated or merely applied gradients.

Therefore:
- exact L/R mirror is a display-coordinate relation, not field negation or physical winding reversal;
- the degenerate-sphere null is a proposed calibration/limit, not proof that ordinary and anti graticulae geometrically cancel;
- CMY cancellation is a display operation, not a physical cancellation law;
- 3D transport/integration and its projection to the 2D graticule remain undefined.

## 3. Corrected mapping diagram

```
Ring-torus primitives
  ├─ major and minor circumferences
  ├─ inner / outer physical sides
  ├─ two small-cross-section axes -> four quadrants
  └─ primary-circumference tangent sign -> eight sectors
          |
          +-- straight orthogonal tangent reference
          +-- curved torus-circumference tangent reference
          |       (both retained; exact relation not yet defined)
          v
Source vector-angle field (90-degree null convention)
          |
          v
Ordinary / inverse graticulae
  exact L/R display mirror only
          |
          v
Common-frame pullback / component transport
  (map not yet specified)
          |
          +--> signed residual Delta_i
          |       orientation/parity channel
          |
          +--> magnitude metric M_i = |Delta_i|
                  source-named metric
                          |
                          v
              separate degenerate-sphere normalization
              (correspondence map, metric, units and
               transport still missing)
                          |
                          v
              CMY overlay / 2D display transform
              (not a physical cancellation law)

3D toroidal-bulk transport/integration
  -> projection/indexing map
  -> 2D Gendarme graticule
  (the actual 3D integration and composition maps remain open)
```

## 4. Conditional mathematical formalization target

For a scalar real-valued field (g) and an involution (iota) with (iota^2 = id), define:
[
D(p)=g(p)-g(iota(p)),qquad m(p)=|D(p)|.
]
Then the conditional identities are:
[
D(iota(p))=-D(p),qquad m(iota(p))=m(p).
]

The first identity is already recorded in the base receipt as a hand derivation. The second is the missing magnitude-invariance corollary. Both depend only on the formalized scalar/involution definitions. They do not establish that the translation from Nathan's geometry is correct or that any physical premise is true.

**Lean status:** NOT COMPILED / NOT RUN. No local Lean/Lake/Elan executable is installed, and the active Code Grurple interlock blocks a new research branch or CI dispatch. Existing Lean PRs #895, #1133 and #873 do not verify this new magnitude-invariance proposition. Math Hopper issue #578 / PR #991 is source-extraction coverage QA, not a proof engine. No theorem, branch, PR, or CI run was created.

## 5. Continuity and control corrections

- The optional Kestrel-to-Meridian packet was created after the original Meridian run had started and is marked `POST_START / NOT_DELIVERED`. It was read during this verification pass only. This is repository-context consumption, not chat delivery, inbox delivery, or acknowledgment.
- The base receipt's unrelated-reading carry-forward is stale. The later Kestrel :48 receipt records Jacoby, *Practical Talks by an Astronomer*, lines 881-920, with return cursor 921. That is the latest verified unrelated reading; no additional reading was performed here.
- During SAT archive root orientation, `!_ANNOTATED_ARCHIVE_SURVEY.md` was inadvertently fetched in full. Its opening banner marked it `QUARANTINED`. Its content was not used, quoted, copied, cited, or forwarded, and no further retrieval was attempted. Record this as an access-control lapse; future retrieval must prune quarantine-marked paths before file access.
- All four Mersearch request lanes remain requested/unverified: request files exist, but request-scoped run manifests and search receipts were not available. No direct Mersearch connector or local pinned checkout/CLI is available in this runtime. Bounded GitHub searches/raw-source retrieval across HsH, SAT archive and HSH_RESOURCES were fallback navigation only, not Mersearch results. No lane was overwritten or retried.
- Search in the SAT archive surfaced a non-primary dashboard pointer that says Gendarme source recovery is not consolidated and points to HsH live conversations. HSH_RESOURCES surfaced only checklist/assessment mentions, not a primary Nathan-authored Gendarme equation source. These are navigation leads, not source attribution.
- No local checkout, generic internal house writer, or suitable Actions writer was available. The existing issue publisher is public-safe/fixed-destination and unsuitable for this internal receipt amendment. The documented GitHub Contents API fallback is used for this unique append-only amendment, followed by exact readback.
- Existing public issue #1322 remains the published baseline and was not edited or duplicated. No new issue, public comment, PR, branch, CI dispatch, Factory Floor intake, paper-gate advancement, or theory promotion occurred.
- Code Grurple remains active; Meridian's Paper A presentation-repair assignment remains controlling. Ordinary solver/Whirligig development was not resumed.
- FIE last full review remains 2026-10-27; next due 2026-11-10. Orson's protected cognition allocation remains untouched. No CODATA scoring, physical calculation, fit, prediction, or measurement was performed.

## 6. Next source cursor

The next direct user message after the recovered Meridian role/specialist cluster is `3e7d7870-9cc6-42fd-83ce-92d8c6326789` (2026-09-08T10:01:25.258Z), which asks for a coordinated archive/Conversation Viewer search and recent literature track, including the Whirligig/NotebookLM history. This is the next local source cursor; do not treat the assistant's subsequent plan as Nathan Direct.

The base receipt's adjacent global cursor remains the Meridian Minkowski Ring Analysis message `59cdedb4-be76-455a-87c8-a6089de951b3` and assistant response `e26ef2c0-c360-46ee-8444-72f9a34ec044), concerning 3D rotation as 4D material-history curvature.

No handoff to Mercer is created. No authenticated Mercer thread or chat delivery is established. The next ring label remains Mercer, with the existing Code Grurple boundary controlling.

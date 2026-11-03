# Meridian | Endpoint frames versus path-dependent holonomy

**Run key:** REVROT3-19-20261011:554:s0. **Selected:** Meridian, index 15. **Next:** Mercer, index 16.  
**Disposition:** additive source-fidelity reconciliation to the already-existing h554 report/receipt. This is not a second rotation receipt, new worker lease, or authenticated Meridian-thread continuation.

## Executive finding

The 11 September 2026 Rotoexpando manuscript explicitly distinguishes a static two-point/frame relation from axial twist and from holonomy:

- A two-point relation records length and direction, but does not encode roll about its own axis.
- Axial twist requires an additional marker, ribbon, material cross-section, or explicitly transported transverse frame.
- “Holonomy” is reserved for a frame or state transported around a genuinely closed loop; otherwise return map, recurrence, monodromy, or similarity closure may be more precise.
- Hagalaz is optional shorthand for a declared geometric relation, with no independent ontology. The manuscript begins as pure geometry and does not import a physical theory as a premise.

The assistant-generated Donut connection model adds an SO(3) connection and path-ordered exponentials, but the Nathan-attributed Donut transcript does not specify that connection, its base manifold, a transport law, or a path-ordering convention. The September 19 Nathan annotation on the Donut canon explicitly labels it a first-blush overview that had not yet been fully audited; the mathematical narrative after that annotation is assistant-voiced.

The current Lean formalization proves an abstract endpoint-potential result on the current PR head: a single global frame potential makes finite-path transport depend only on endpoints; path-dependent transport therefore excludes such a global potential. This is a group-theoretic theorem, not a continuous-connection, curvature, or physical-holonomy theorem.

## 1. Meridian role and continuity boundary

Historical role clarification:
- Conversation `6a9aa91b-11f4-83ea-80a1-4d502522e441`
- Raw blob `d21e251df093013903cc19789ded562f83b6e6ea`
- Direct user messages `054d1aea-cf67-4154-93c8-e302dc3ce1ea`, `39299849-e2a4-4b63-88a0-5612c700cc1a`, `f6a2377c-8873-41ee-9107-41aeeb0d2589`.

The remit is geometric-solver development, graticule and symmetry/asymmetry analysis, configurable/scriptable comparisons, and source-faithful audit of the proposed Whirligig GR–QM isomorphism. This is a historical role clarification, not an authenticated currently usable Meridian ChatGPT thread. No active Meridian thread locator was verified; no Meridian inbox or other ChatGPT thread was contacted.

Current Meridian continuity and the incoming Kestrel handoff keep HAGALAZ BACKSEAT/HOLD under Code Grurple. PR #895 and its branch were not modified. LAB-SBS-001 remains comparison infrastructure, not authorization to resume HAGALAZ integration.

## 2. Primary source: Rotoexpando Geometry

**Source:** `Satobloc/HSH_RESOURCES/REDISCOVERED/rotoexpando_geometry_definition.tex`  
**Blob SHA-1:** `5c21c6152482249e4432ded423b0040e70fc8b4f`  
**Date/byline:** 11 September 2026; Nathan McKnight and collaborators.  
**Extent:** 17,125 characters / 674 lines.  
**Class:** bylined historical manuscript, not a raw role-tagged conversation.

The source defines framed spheres:

[
\mathcal S_i=(c_i,r_i,F_i),\qquad F_i\in SO(d).
]

Relative similarity data:

[
\sigma_{ij}=\frac{r_j}{r_i},\quad
Q_{ij}=F_jF_i^{-1},\quad
\Delta c_{ij}=c_j-c_i.
]

Optional Hagalaz tuple:

[
\mathcal H_{ij}=(\sigma_{ij},Q_{ij}),
\qquad
\mathcal H_{ij}=(\Delta c_{ij},\sigma_{ij},Q_{ij})
]

when translation is retained. Its associated map is:

[
T_{ij}(x)=c_j+\sigma_{ij}Q_{ij}(x-c_i).
]

These are endpoint-to-endpoint comparison data. They do not by themselves encode transport history.

The same manuscript states that a two-point relation does not encode axial roll. Twist needs an extra marker, ribbon, material cross-section, or explicitly transported transverse frame. It reserves “holonomy” for a frame/state transported around a genuinely closed loop. This is the source-defined boundary missing from the assistant Donut reconstruction.

## 3. Donut source genealogy

### Nathan-attributed transcript

`_AUTO_EXTRACTED_TEXT/FINDING THE DONUT (nolat).txt`  
Blob `a788b5cc415f90de2d0382d3596ef07d68604687`; underlying PDF SHA-256 `63b884c150954cd0f4eee5de55aef9db0c2c54d24fb7e972d61e26cae91a5dae`; relevant extraction lines 740–811.

The passage describes two surfaces with matching curvature and coordinate frame at a crossover, tangent coincidence for smooth transition, and a residual jump attributed to “holonomy”. It is Nathan-attributed, but raw ChatGPT role metadata is not recovered. It does not define a connection one-form, bundle, group-valued transport, path ordering, curvature tensor, or the closed loop whose transport is evaluated.

### Donut canon: first-blush annotation and assistant equations

The SAT archive copy `SAT 2026 PRE HsH/SAT 2026 WHIRLIGIG — Donut canon.txt`, blob `8f95b9174657617c9976ff76e17fd8ef36ad660c`, opens with a Nathan annotation dated 19 September 2026. It says the intention is in *Finding the Donut* and that the document has not yet been fully audited; it is a first-blush overview. The narrative after the annotation begins in assistant voice.

The HsH derivative `Donut canon.txt`, blob `be985c292bfcae7352983d596c38e7f172f6029d`, introduces assistant-generated equations such as:

[
A\in\Omega^1(M,\mathfrak{so}(3)),\qquad F=dA+A\wedge A,
]

and path-ordered transports:

[
H_R=\mathcal P\exp\left(\int_R A\right),\qquad
H_Q=\mathcal P\exp\left(\int_Q A\right).
]

These are candidate assistant mathematics, not equations recovered from the Nathan-attributed transcript or adopted by the 11 September Rotoexpando manuscript.

### Mathematical correction

The assistant Donut canon says “No curvature → no real holonomy” and claims nonzero curvature guarantees non-Abelian, path-dependent holonomy. Those implications are too strong:

- Flatness is a local curvature condition; a flat connection can have nontrivial global holonomy on a non-simply-connected base.
- A non-Abelian structure group such as SO(3) does not force the holonomy subgroup of a particular connection to be non-Abelian.
- Nonzero curvature does not guarantee that every specified pair of same-endpoint paths has different transport.
- Path dependence requires a specified transport law and two paths whose transports differ.

The assistant connection is a possible later model, not a source-derived map. Its base, bundle, connection, transport convention, and relationship to native worldtube/timesheet geometry remain undefined.

## 4. Static endpoint frames versus path-dependent transport

For a global frame assignment (F:V\to G), define:

[
E_F(a,b)=F(a)^{-1}F(b).
]

Along a finite path (a_0,\ldots,a_n), the product telescopes:

[
E_F(a_0,a_1)\cdots E_F(a_{n-1},a_n)
=F(a_0)^{-1}F(a_n).
]

Thus same-endpoint paths agree and closed paths have identity transport.

The Hagalaz source uses the left-relative convention (Q_{ij}=F_jF_i^{-1}), with reversed composition order:

[
Q_{jk}Q_{ij}=Q_{ik}.
]

Both are endpoint-potential constructions, not nontrivial path holonomy. A genuine path-dependent model needs additional path/history data, for example a specified transverse-frame transport law along the worldtube or timesheet. The source permits an explicitly transported transverse frame but does not define its transport.

```text
Hagalaz framed-sphere nodes (c_i, r_i, F_i)
                 |
                 | endpoint comparison
                 v
       Q_ij = F_j F_i^{-1}
                 |
                 | exact composition / telescoping
                 v
       endpoint relation; closed loop = identity

Native worldtube / timesheet geometry
                 |
                 | MISSING SOURCE-DEFINED MAP
                 v
       material transverse frame along a path
                 |
                 | MISSING transport law / connection
                 v
       path-ordered transport
                 |
                 | compare two paths / closed loop
                 v
       possible nontrivial holonomy
```

## 5. Existing Lean verification: current PR head

Existing PR #1189, “Nadir: formalize Hagalaz composition and affine translation quotient”, was inspected read-only.

- Current PR head: `65a15ab8c08abef49f1d34a8a4d952e3ba3086bb`.
- Base: `research/nadir-gpb-joint-covariance-bound-20261027t1312z`, not main.
- State: OPEN / DRAFT / UNMERGED.
- Exact-head Actions run #41501026139; job #125468232396.
- Log asserts expected and actual checked-out source commits both equal `65a15ab8c08abef49f1d34a8a4d952e3ba3086bb`.
- Lean 4.34.0 / Lake 5.0.0; full build SUCCESS, 8,952 jobs.
- `NadirFrameTelescoping` replayed at 8,940/8,952.

The module proves endpoint-frame-potential telescoping, same-endpoint path independence, the contrapositive that path-dependent transport excludes a single-valued global frame potential, closed-loop identity under such a potential, and left/right relative-frame composition.

The theorem-specific axiom output for `path_dependent_transport_excludes_global_frame` is `[propext, Classical.choice, Quot.sound]`; the other listed frame-telescoping and composition theorems use `propext`. The complete retrieved log contains no `sorryAx` or `admit`.

Tests, lint, nanoda, and the separate automated axiom-audit action were skipped. This is an exact-head compile and theorem-specific axiom report, not a global axiom audit. The theorem concerns finite paths in an arbitrary group and a global vertex-frame potential; it does not formalize a smooth connection, curvature, physical worldtube, or source-to-model soundness.

The PR body still cites the earlier head `079f928...` and run #41463746032. The actual current head is `65a15...`, with newer exact-head run #41501026139. The body is stale; no PR edit, rebase, merge, or branch change was made.

## 6. Existing records, Mersearch, and controls

The broad endpoint/path distinction is already represented in issues #363, #1228, and #240, plus PR #1189. The existing h554 report/receipt already cover worldtube inertia, one-core/finite-core source corrections, and unresolved Forest normalization. This addendum is distinct: it clarifies the source-defined transverse-frame boundary and corrects the assistant Donut connection's epistemic status. No new issue was created.

The current issue publisher listens to `issues.opened` only. PR #1251 remains OPEN; its proposed `issues.edited` retry still has unresolved editor-actor authentication and rejection-exit-status defects. No direct comment or publisher bypass was used; public issue append remains pending a safe route.

No Mersearch tool or executable is available in this runtime, no local Git checkout was found, and all four shared Mersearch lanes remain occupied. No new request, retry, or overwrite was made. Bounded GitHub source search was used only after that limitation was established. The mixed `NESTED HOLONOMIES.txt` source was not opened; Meridian's active Code Grurple restriction and HAGALAZ BACKSEAT/HOLD were preserved.

No physical calculation, synthetic fixture, CODATA scoring, new Lean module, PR, branch, HAGALAZ solver modification, or BEDROCK promotion. The :00 automation ID, enabled state, exact hourly schedule, DTSTART, and phase remain unchanged; no sixth task.

**Next cursor:** recover or explicitly define the material transverse-frame transport along the native worldtube/timesheet. State its bundle, base, parameter, connection/transport law, endpoint convention, and path-composition rule. Derive the projected transport from source geometry rather than importing the assistant's SO(3) connection. Keep endpoint Hagalaz composition, ordinary return maps, and genuine path holonomy as separate typed objects. HAGALAZ remains BACKSEAT/HOLD until Code Grurple standdown.

**Delivery:** repository workspace artifact only. No authenticated Meridian thread, inbox delivery, Mercer consumption, or cross-thread message is claimed.

# Workshop addendum — Geometry Bench, Hagalaz guide indicatrix, and tentative wavefront hypothesis

**Date:** 2026-11-04  
**Class:** source-grounded research intake / integration note  
**Status:** PROVISIONAL DESIGN SPECIFICATION; NOT IMPLEMENTED; NO NEW CALCULATION; NO THEORY PROMOTION  
**Destination:** H(s)H existing HAGALAZ-SOLVER-UNIFICATION research line, to be resumed after the active Code Grurple hold. This addendum does not create a new solver branch, task, PR, automation, or execution lease.

## 1. New direct clarification from Nathan (2026-11-04)

Nathan requests folding the following into the active work:

1. Establish a small library of canonical elementary geometric constructions, each with a metric definition and known correctness, usable as guidelines/tests for complex constructions. Examples include circles, cardinal angles, squares, coordinate frames, perpendiculars, tangents, intersections, rotations and projections.
2. Formalize the higher-order helical construction with Hagalaz rather than treating it as an ad hoc drafting exercise.
3. For a guide helix, use a guide sphere whose equator is the circular cross-section normal to the guide helix tangent. Its departure from sphericity, with its polar axis along the guide tangent, is proposed as an indicatrix for translation rate and rung separation in the first-order helix.
4. The proposal is tentatively described as equivalent to a construction in which a helix-attached rotational vector sweeps a circular section and a tangent-carried connection point causes a pen-tip trace. The resulting first-order helix has a centerline that is itself a higher-order helix. This is a construction hypothesis; precise object typing is required.
5. The shape of the guide indicatrix and Hagalaz transformation are related: rotation and scale of the circular cross-section into the superhelical cross-section. The user says a tangent-aligned spheroidal indicatrix would coincide with the circular-tube construction if its axis is defined as the guide tangent, but might additionally represent relationships between super/helical elements.
6. Tentative physical hypothesis: what has been called the timesheet may be better understood as a surface of simultaneity of a coordinated time-wavefront realized by a coordinated front of excited helical worldtubes (or helical excitations on worldtubes, or both). The universal speed c may be propagation speed relative to the worldtube; light travels straight while matter follows coiled worldtube paths and therefore covers a longer path. This remains explicitly TENTATIVE.

These points are Nathan Direct as stated in the current conversation. Do not silently upgrade the physical hypothesis or assume the construction's missing maps.

## 2. Existing internal machinery recovered

### 2.1 Rotoexpando / Rediscovered reference
The 2026-09-11 Rotoexpando Geometry manuscript in HSH_RESOURCES/REDISCOVERED defines:
- canonical fixed-radius circular helix as a one-parameter screw motion;
- nested helical orders with explicit adjacent-order scale, phase-rate, offset, relative-frame and chirality data;
- framed sphere S_i=(c_i,r_i,F_i), F_i in SO(d);
- Universal Indicatrix as normalized framed-sphere comparison retaining relative frame mismatch;
- earlier Hagalaz notation as similarity data (Delta c, sigma, Q) and map x -> c_j + sigma Q(x-c_i);
- distinction between fixed within-order diameter and inter-order scale ratio.

This September 11 document is a scaffold/reference, not the final authority for current Hagalaz semantics.

### 2.2 RUN 091 / RUN 092 correction
Current H(s)H sandbox RUN 091 proposes a framed order S_n=(c_n,r_n,F_n), six local so(4) generator channels and an eight-channel rung-locked local generator. The general finite relative similarity has 11 DOF (4 translation + 1 scale + 6 rotation); the eight-slot form is a constrained local representation, not a general state.

The RUN 092 handoff corrects a material RUN 091 endpoint interpretation:
- do not read the eighth compact channel as static finite endpoint displacement Delta c = xi e_w;
- a 4D curve has a 3D normal space, so a constant-radius lift uses an offset direction on S^2;
- rung/tangent lock is naturally a LOCAL FLOW CONSTRAINT;
- integrated finite translation can be a full vector;
- a higher-order recursive lift can activate normal-space twist channels without arbitrary frame twist;
- Bishop/rotation-minimizing transport is a candidate minimal-gauge default, not a physical law.

Therefore the new guide-sphere proposal must be reconciled with this local-flow/finite-endpoint distinction. Do not simply append an anisotropic scale slot to the old Hagalaz tuple and call it complete.

### 2.3 RUN 099 / RUN 100 group-closure constraint
The existing similarity-spectrum grammar RUN 099 and SIM(4) closure gate RUN 100 establish a further distinction:
- similarity transformations can be represented as scale/rotation/translation data;
- allowing all six so(4) rotation generators while locking translation to a single fixed ambient direction does not give a closed 8-dimensional Lie subgroup;
- with active bending generators, Lie closure generates all four translation directions;
- the compact eight-slot form can be a body-frame local generator or constrained chart, while integrated finite edges must retain general translation as needed.

This is an existing mathematical result from the sandbox, not yet the complete source-to-physical Hagalaz map.

### 2.4 Current same-day transport contract
The 2026-11-04 issue #1338 note requires strict separation between:
- endpoint-relative frame data; and
- path-history transport generated by an independently specified connection.

It requires explicit frame-action side, row/column convention, formula/index order, base frame, composition order, group/representation, orientation/sign convention, and independent path identity/history for any transport claim. Endpoint frames alone do not prove path dependence or holonomy. Existing Lean work at PR #1189 verifies specific discrete group identities only; it does not establish a physical connection.

Hagalaz solver line remains BACKSEAT/HOLD under Code Grurple. This addendum is an intake/continuity note, not implementation or authorization to bypass the hold.

## 3. Guide indicatrix: typed construction problem

Nathan's proposed local object can be provisionally typed as:
- guide curve C(s);
- unit tangent T(s);
- a two-dimensional circular equatorial section in the plane orthogonal to T(s);
- a distinguished tangent-aligned polar axis;
- an indicatrix whose equator matches the circular section and whose polar semiaxis may differ;
- a transformation relating guide-level and nested/helical-level frames and scales.

For a spatial curve, the local normal space is two-dimensional. For a 4D curve, the orthogonal normal space is three-dimensional. This dimensional distinction must be retained: a 3D spherical indicatrix belongs naturally to the normal space of a 4D curve; an ordinary spatial tube around a 3D curve has circular 1D cross-sections in its 2D normal plane. A worldtube cross-section is a separate, higher-dimensional object and must be typed with its ambient metric/signature.

The proposed spheroidal aspect ratio is a candidate descriptor, but it is not yet established as translation rate or rung separation. The map from aspect ratio to phase rate, axial advance, path length, or inter-order similarity must be derived from the user's construction and independently checked. Keep distinct:
- equatorial radius / core radius;
- polar semiaxis / guide-axis extent;
- guide-curve tangent;
- local helical phase rate;
- path arclength;
- axial advance per turn (pitch);
- inter-order scale ratio;
- frame rotation/transport.

A sphere is rotationally symmetric and cannot record its own frame. The framed grid remains part of the indicatrix state if orientation matters.

The exact Hagalaz operation remains under-specified. Current task is to determine whether the guide indicatrix is:
(A) a local geometric state carried by each order;
(B) a finite transformation between adjacent framed indicatrices;
(C) an integrated record of a local generator/path;
or a composition of those, with explicit types. Preserve alternatives until source geometry discriminates.

## 4. Geometry Bench integration

Build/reuse a canonical primitive library in this order:
1. coordinate axes, metric/signature, origin, handedness and cardinal directions;
2. points, vectors, lines, planes, orthogonality and incidence;
3. circles/spheres and plane intersections;
4. tangent, normal and moving orthonormal frames;
5. rotations, similarities and anisotropic linear maps;
6. helices and their local frames;
7. swept circular tubes and higher-order nested lifts;
8. framed-sphere/indicatrix and Hagalaz composition;
9. projection, section and intersection readouts.

Every item needs:
- a precise definition and domain/codomain;
- a construction algorithm whose outputs are generated from the definition;
- invariant/identity tests (length, orthogonality, radius, determinant, incidence, projection consistency, etc.);
- canonical limiting cases;
- mathematically generated renderings from a single underlying state;
- visual inspection and a hostile fidelity check tied to exact source/hash before Factory Floor use.

The diagrammatic rule is hard: no arbitrary shape placement, no unlabeled axes, no disconnected projections, no interpretation before construction verification. The actual generated image must be opened and inspected by the worker that authored it. External published figures may be cited as references but must never be presented or stored as project-produced durable artifacts.

## 5. Static reconstruction first; dynamics only if forced

The baseline is the frozen-4D-block / moving-timesheet reconstruction method. This is a methodological freeze-out, not a metaphysical claim that the physical universe is static. First establish the static idealized 4D geometry and its sheet intersections using covariant mappings wherever possible.

Only after that state is characterized may worldtube dynamics be introduced, and only when:
- already geometrically present in known physics;
- required by existing geometric commitments;
- or compelled by evidence and a source-grounded argument of necessity.

Do not introduce dynamics merely to solve an inconvenient issue. No unmotivated constitutive law, friction rule, energy function, medium, extra carrier, or adjustable coupling.

## 6. Tentative wavefront / worldtube-relative c hypothesis

Preserve Nathan's proposal as an explicit tentative branch:
- timesheet perhaps is a simultaneity surface associated with a coordinated excitation wavefront;
- excitation front may be carried by worldtubes, be excitations on worldtubes, or both;
- c may represent propagation speed relative to worldtube structure;
- light may correspond to straight propagation while matter corresponds to a longer coiled path.

Required distinctions and tests before any physical use:
1. A simultaneity hypersurface is spacelike; a propagating light wavefront hypersurface is null. Determine what the proposed coordinated object actually is, rather than identifying them by vocabulary.
2. Define the local frame in which c is measured and show how it is related to the Minkowski metric and invariant light cone.
3. Define separate geometric objects for worldtube material, excitation, phase front, simultaneity surface and observable intersection/readout.
4. Derive the straight-path/coiled-path mapping and its observable 3D projection without assuming that projected group velocity is automatically the physical velocity.
5. Recover standard Lorentzian limits, causal structure, energy-momentum relations and massless/massive distinctions before proposing departures.
6. Do not infer physical validity from the Euclidean helix projection identity alone. No physical calculation is authorized by this note.

## 7. Source and prior-art comparison

HSH_RESOURCES/REDISCOVERED includes Fletcher, Tarnopolskaya & de Hoog (2001), Fletcher (2004), Crick (1953), and Fuller (1971). Their presence is a literature review route:
- Fletcher papers: higher-order helices/hyperhelices and propagation across nested structure;
- Crick: geometrical packing of coiled-coils;
- Fuller: local twist/global writhe distinctions.

These external publications are references/prior art, not workflow-produced artifacts. Their full-text review status must be tracked source-by-source. The HSH_RESOURCES repository is private reference infrastructure; any public-facing synthesis should cite the original external sources, not expose private repository paths.

## 8. Real-data and calculation boundary

Live BEDROCK prohibits invented fixtures and data-free numerical calculations without Nathan's specific prior permission. This note authorizes no such calculation. Symbolic definitions and exact conditional identities may be recovered and typed, but no numerical guide-sphere specimen, parameter choice, rendering fixture, or arbitrary omega/path history may be invented.

For physical validation, use an actual measured system with documented source, units, uncertainties, provenance, and independent holdout. If a suitable real measured dataset cannot define the required geometry, mark the relevant physical calculation BLOCKED; do not substitute a mathematical toy.

## 9. Lean and status gates

The Steering Charter requires source-faithful Lean 4/Mathlib triage for every definite mathematical claim or geometry/transformation. Existing proofs should be reused; do not inflate proof counts by restating them. New theorems require a fully specified source-faithful proposition and exact compilation status. A Lean proof validates only the encoded mathematics, not the physical theory.

Status remains:
- Geometry Bench: design/intake only; no canonical library artifact implemented by this addendum.
- Guide indicatrix: hypothesis / under-specified map.
- Hagalaz extension: unresolved; current operator semantics and composition rules remain source-recovery obligations.
- Wavefront / timesheet interpretation: tentative physical hypothesis.
- Worldtube-relative c: tentative physical hypothesis.
- Dynamics: deferred until statically established geometry or evidence forces them.
- Factory Floor: not admitted; no plot or exact-version hostile review performed.
- Theory/BEDROCK: unchanged; no promotion.

## 10. Resume cursor

After Code Grurple standdown, continue the existing HAGALAZ-SOLVER-UNIFICATION research line:
1. recover the actual original Nathan-authored guide-sphere / indicatrix / rung-separation passages and adjacency from raw conversations before formalizing;
2. reconcile RUN 091, RUN 092, RUN 099, RUN 100 and #1338 conventions in one typed object map;
3. determine spatial vs 4D normal-space dimensionality and define the guide indicatrix from the exact intended cross-section;
4. establish whether indicatrix elongation is a local state, transform, or path-integrated measure;
5. formulate minimal pair constructions using only existing project-authorized data or obtain specific prior permission before a named data-free calculation;
6. derive the static Minkowski worldtube/timesheet reconstruction before adding dynamics;
7. keep the timesheet-as-coordinated-excitation and worldtube-relative-c hypotheses separate and tentative;
8. source-review the four Rediscovered papers, keeping external figures out of durable project artifacts;
9. perform geometry-first and Shape-to-Lean triage before any Factory Floor submission.

**No new task, branch, PR, automation, Lean module, physical calculation, or theory-status change.**

# Minimal-structure admission: source, map, and evidence are separate

**Date:** 2026-11-11  
**Scope:** source-grounded geometry and H(s)H model-comparison methodology. This is a methodological note, not a physical result or theory promotion.

## 1. Never use an unqualified “forced”

For every proposed structure S, keep three independent questions:

1. **Source-forced:** Is S explicitly present in a primary source or direct instruction?
2. **Representation-forced:** Is S required to make a particular, explicitly specified map well-typed and well-defined, after testing whether the existing primitives can do the job?
3. **Empirically-forced:** Does a real, versioned measured system exclude the minimal model under a frozen comparator/parameter protocol, while the extension makes a distinct, identifiable prediction on independent holdout data?

These are different kinds of necessity. A source statement does not prove physical truth; a map requirement does not establish a new physical primitive; a fit does not establish empirical necessity. Use qualified labels such as **SOURCE_FORCED**, **MAP_FORCED_FOR_THIS_REPRESENTATION**, **EMPIRICALLY_REQUIRED**, **OPTIONAL**, and **UNRESOLVED**. Do not collapse them into one scalar “forced” status.

The current BEDROCK is blob 0253ace674bbc361464b7bbaac2c41aa3d8e8867. The Primary Operational Guideline is blob a8e333b1d5b5aa1d9772366945dd88769d24153c. The latter specifies a minimal worldline/worldtube plus timesheet model, with a responsive/reactive medium explicitly retained as a provisional third candidate. It directs workers to modify existing primitives before adding machinery and to defer unresolved additions when work can proceed elsewhere. It is an assistant-organized record of Nathan Direct, not a verbatim user transcript.

## 2. Direct source: the Whirligig/Donut 3D toy

The raw HsH conversation **Ontology and Math Check** contains direct user-role messages:

- Conversation: 69b3b56e-7540-8325-b93b-e9331fe95430
- Raw Git blob: e3e40b1a167d26f2d153667d761746f9a4788db1
- Message a1172bf2-0742-4a68-b9b8-34e270a8a555, 2026-03-14T10:01:44.984Z: describes closed curves R and Q on a sphere, their shared intersection i_r, an additional Q/equator anchor i_q, rotating planes, the Great Annulum, a variable cord and midpoint, a perpendicular plane, constrained vector V, a sphere/torus arrangement, an even-multiple circuit condition, and Curvy_Lisa as the intersection of swept V with the Donut surface. QwrtR is named but not defined.
- Message dd2c035f-109a-4f6a-863a-a3670dbf3d3f, 2026-03-14T10:03:00.865Z: explicitly says this is “just the three-dimensional toy version.”

The immediate assistant response adds a one-to-one 4D lift and “preserving holonomy.” Those are assistant reconstruction, not Nathan Direct. The later sinusoidal torus parameterization is also assistant-origin. The user's later request to make a parameterization precise does not retroactively make it the original construction.

## 3. A geometric intersection is not yet a common holonomy fiber

The source supplies a geometric witness: R and Q are closed curves with a shared intersection i_r. That makes i_r a candidate common basepoint. It does **not**, by itself, supply the bundle/connection data needed for holonomy.

To interpret H_R and H_Q as endomorphisms of the same fiber, a later model must explicitly provide:

- a common base manifold M;
- actual closed-loop maps r,q:S¹→M and a basepoint/parameterization witness with r(0)=q(0)=i_r;
- one bundle E→M and one connection A, so both holonomies act on E_{i_r};
- compatible frame/trivialization and orientation conventions;
- a declared readout.

If the loops are genuinely closed and share i_r, a common parameter origin may be chosen by a cyclic reparameterization. That is a conditional mathematical construction, not an additional physical structure supplied by the 3D toy. The source does not define the parameter maps, bundle, connection, fiber, or readout.

A connector Uκ is required only when the chosen comparison uses distinct basepoints/fibers. If both holonomies are based in the same fiber, Uκ=1. Do not add a free connector path when the common-fiber construction is justified independently.

## 4. Minimal-structure ledger for this source

| Candidate | Source status | Map/representation status | Empirical status | Current disposition |
|---|---|---|---|---|
| Closed R/Q curves and shared i_r | Direct user-role 3D source | Geometric intersection is defined qualitatively | No measured system/data | Source-defined toy geometry |
| Common holonomy basepoint/fiber | Shared intersection is direct; parameter origin/fiber is not specified | Requires loop parameterization plus a common bundle fiber | Untested | Conditional witness, not yet instantiated |
| Bundle and connection | Not in the direct 3D toy | Needed only for a connection-holonomy model | Untested | Optional formalism |
| Connector Uκ | Not in the direct 3D toy | Needed only for distinct basepoints/fibers; identity if common fiber | Untested | Conditional, not generally forced |
| One-to-one 4D lift | Assistant reconstruction | Requires an explicit lift, metric/time correspondence, projection and readout | Untested | Proposal / unresolved |
| Finite worldtube thickness/profile | Not specified by the 3D toy | Needed only for a declared finite-core observable/model | No system or data | Not forced by this source |
| Independent twist field/sector | Rotating planes and constrained V are direct; a separate twist field is not | A twist-like descriptor could be derived only after a frame-evolution map is specified | Untested | Kinematics direct; new field optional |
| Contact surface/law | V intersecting the Donut surface is direct geometry | No 4D contact map or physical contact law supplied | Untested | Intersection direct; contact law not forced |

This ledger does not demote existing SAT/H(s)H working hypotheses. It prevents an assistant reconstruction from inheriting source authority and prevents a representation convenience from becoming a new physical primitive without a demonstrated need.

## 5. Existing Lean result and exact-head erratum

Nadir PR #1189 contains NadirConnectorWitnessHolonomy.lean, blob de1cccaa93047fa7e5764ca36503abf624f4cfc1. The module explicitly says it does **not** construct a connection, path, parallel-transport operator, basepoint witness, SO(3)/SO(4) representation, or physical readout. It proves only abstract group identities once those objects have been supplied.

The theorem sameBasepoint_reduces establishes that the connector-aligned group expression reduces to H_R⁻¹H_Q when the connector element is the identity. It does not prove that the 3D geometric intersection supplies a common bundle fiber.

Verified existing CI evidence:

- PR #1189 current head: fbe078a94a0074c7eb00e98aee47bf718630d607
- Actions run #42979143722: conclusion success, head_sha exactly matches the PR head
- Lean 4.34.0 / Lake 5.0.0; full build 8,958 jobs
- The three theorem-specific axiom outputs were reported as [propext]
- Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped
- PR remains OPEN / DRAFT / UNMERGED

**Erratum to Aster issue #1600:** its printed PR #1189 head fbe078a94a0074c7eb00e98aee148180de15516e is a transcription error. The GitHub PR API, the Actions run, and the exact-head module readback identify fbe078a94a0074c7eb00e98aee47bf718630d607. This corrects the locator only; it does not change the theorem's scope or limitations.

## 6. Admission and falsification protocol

Before any added structure is treated as required:

1. State the minimal existing geometry and the target observable.
2. Give every map's domain, codomain, conditions, composition order, and information loss.
3. Test whether a change to an existing primitive or a valid reparameterization suffices.
4. Identify the smallest residual that the baseline cannot represent.
5. If physical necessity is claimed, use an identified real system and genuine dataset with provenance, units, calibration, uncertainty/covariance, shared-parameter freeze, standard comparator, independent holdout and a predeclared falsification threshold.
6. Check that the instrument/readout map does not erase the proposed distinction. If it does, the structure is not identifiable by that instrument.
7. Add only the smallest structure that closes the demonstrated gap; preserve alternatives and failed outcomes.

No physical system, dataset, calibration, uncertainty package, fit, prediction or holdout is supplied by the 3D toy. No physical calculation or H(s)H prediction is claimed here.

**Disposition:** source/map/evidence necessity separated; common-basepoint condition narrowed; 4D lift and additional structures remain unproved or optional; existing Lean proof reused within its actual scope; exact-head SHA erratum supplied; no theory promotion.

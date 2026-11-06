# Donut as representation procedure, not SAT ontology
**Source-fidelity addendum | 6 November 2026**

This is a narrow, additive source-citation correction to the existing object-hierarchy and Whirligig source-to-output work in issues #1407 and #1415. It does not repeat the current browser implementation, the observation-geometry-math gate (#1420), the GR-QM provenance review (#1386), or the worldline/Blockwave audit (#1418). The new contribution is role-authenticated June 23 source material that separates the SAT theory-construction method, the Donut procedure, and the physical worldtube geometry.

## 1. Source witnesses and attribution

**Raw SAT Overview export**
- Conversation ID: 6a3a279a-10cc-83ea-9abf-4fc1dab9fb55
- Raw blob SHA-1: 023ff77688672546aeff02deb3745289f6709c90
- 1,610 mapping nodes.
- The following records are user-role messages in the raw mapping:
  - 2026-06-23 11:06:21Z, message 40d0ac8c: start from a physical question, select a simple example, map the standard description into Minkowski geometry, inspect its 4D topological correlate, formalize if the mathematics is clean and sufficient, otherwise look for a mechanism suggested by the geometry.
  - 12:03:58Z, message 025057e3: identifies Finding the Donut as the original formulation.
  - 12:15:12Z, message 6d035146: describes two input curves, sphere projection, a Lissajous-like composite, forced closure, rejection of nonclosing candidates, and a minimization strategy. The objective is recalled tentatively as least curvature, energy curvature, or bending energy; no exact functional is supplied.
  - 12:18:27Z, message 638ba456: the composite-curve equation is a candidate on a derivation path; demonstrating the derivation is a separate next step, and recursive application is contemplated.
  - 12:20:37Z, message c4115122: distinguishes a closed composite curve as a geometric proof from proving the procedure itself is a prover.
  - 12:26:47Z, message 1047d5d1: information content must survive the transformation; forcing closure may lose information.
  - 12:34:01Z, message 121b96f1: the curve must close and be projected in the sphere.
  - 12:42Z, message 96dffc34: the procedure may work for some classes of equations; identifying the admissible class remains open.
  - 13:41Z, message 47e76f6f: treats a function and its curve as the same object in the working formulation.
  - 13:47:59Z, message bb4a205b: says the Donut is not part of SAT, describes a reciprocal geometry-physics relationship, and recalls two isomorphism claims while expressing uncertainty about the second target group.

**July Reasoning with SAT-HSH Skill export**
- Conversation ID: 6a51def1-1224-83ea-8b56-d9405e694034
- Raw blob SHA-1: b7868607d89f66bbc0e638398182fb2d6b2da2ce
- 579 mapping nodes.
- User-role messages include:
  - 2026-07-11 07:11:40Z, message f8e3ca00: a worldline core with finite thickness and a spacetime surface; fields are not preferred as the primitive framing, while electromagnetic interactions may be represented through Kelvin vortices in a BEC-like medium.
  - 10:12:30Z, message f4df0af0: surface and internal path measures, superhelical turns/nesting, and scale-dependent event types.
  - 12:42Z, message 95993cdf: superhelical nesting and braid nesting are different structures.

**Donut document witnesses**
- The extracted Finding the Donut text has blob SHA-1 a788b5cc415f90de2d0382d3596ef07d68604687. It is a 27-page source witness; its final page describes the 3D construction as a toy. The June 23 user message identifies this document as the original formulation, but the PDF itself has no raw message-role graph. That identification does not authenticate every line or equation.
- SAT 2026 WHIRLIGIG - Donut canon has blob SHA-1 8f95b9174657617c9976ff76e17fd8ef36ad660c and 18,123 characters. It is a composite assistant reconstruction without a raw role graph.

## 2. Independently extracted intent

**A. SAT theory-construction method**

The direct method is to select a physical question, use a simple example, map the standard description into Minkowski geometry, inspect the 4D topological correlate, and then either formalize a clean mathematical result or search the geometry for a candidate mechanism. The assistant later clarified that the purge should remove inherited interpretive labels rather than discard empirical constraints. That clarification is assistant-origin, although the user continued to affirm the methodology as part of theory construction.

This method is not the Donut.

**B. Donut procedure**

The source describes two input equations/curves and one composite output curve, with equations for all three. The inputs are projected into a sphere, transformed mechanically, and combined into a closed Lissajous-like curve. Nonclosing candidates are rejected. A minimization strategy is supposed to narrow the candidate set, but the exact cost functional is not recalled.

The output equation is a candidate on a derivation path. Showing that it really is a derivation is a separate task. Recursive application is contemplated.

The direct source distinguishes a particular closed composite curve as a geometric proof from proving that the procedure is a general-purpose prover. The user's phrase was that “the donut really is not part of SAT”; the Donut is a representational or search instrument, not a primitive physical component of SAT.

**C. Physical geometry**

The 4D Nth-order superhelix/worldtube and the finite-thickness worldline/spacetime surface are physical-model descriptions. The Donut is separate. The July source explicitly distinguishes superhelical nesting from braid nesting; no map between them is supplied.

## 3. Typed map diagram

Theory-construction method:

    physical question X
        -> simple standard-physics example
        -> Minkowski geometric reconstruction
        -> 4D topological correlate
        -> candidate mechanism
        -> formalism
        -> independent observational test

The phrase “purge labels, not constraints” is an assistant clarification, not a verbatim user equation.

Donut representation procedure:

    (E1, E2)
        -> curve encodings (gamma1, gamma2)
        -> sphere projection
        -> constrained mechanical transformation
        -> closed composite curve C
        -> decoder
        -> candidate equation E*
        -> separate derivation relation

Physical worldline/worldtube construction:

    gamma: parameter interval -> 4D spacetime
        -> thickening or sweep map (not defined in SAT-O1)
        -> finite-core worldtube W
        -> intersection with timesheet Sigma_t
        -> readout

Cross-scale structures:

    superhelix H_n -> H_(n+1)
    braid B_n       -> B_(n+1)

These are distinct nesting operations. No projection, embedding, or composition map between them has been established. No map from the Donut output to the physical worldtube or to the Klein Fabric has been established.

## 4. Formal decoder condition

Let E:X->C encode the admissible input pair as a composite curve, and let T:X->Z be the information the output must recover. An exact decoder D on the image of E exists precisely when T is constant on every fiber of E:

    exists D: range(E) -> Z, D(E(x)) = T(x)
    iff
    E(x1) = E(x2) implies T(x1) = T(x2).

If T is the identity on the declared input-equivalence classes, E must be injective on those classes. This is the precise mathematical form of the source's information-preservation requirement. If the desired output is only a derived relation rather than the full input pair, the weaker fiber-constancy condition is sufficient.

The existing Lean 4/Mathlib theorem hallway_factorization_iff_fiber_compatibility in KestrelProjectedIncidence.lean formalizes this generic factorization criterion. It was included in PR #873 verification run #42153410233, which completed successfully on the pull-request merge reference. The captured log contains no sorryAx or admit. The axiom output includes Classical.choice for existence and Quot.sound for uniqueness. This was not an exact-head-only run; tests, lint, nanoda, and the separate axiom-audit step were skipped.

The formal theorem proves the conditional map statement. It does not prove that the actual Donut encoding exists, is injective, closes for a specified input class, preserves physical observables, or places its output on a valid derivation path.

## 5. Adjacent physical equation artifacts

**SAT-O1 4D**
- Blob SHA-1: 7577aa1ee5a6c3850ce3b226c75377de6367aedc
- Archive index dates: 2025-06-07/09.
- First extant Git commit for the SATOBLOC path: 2025-10-27 00:40:28Z. A second archive path resolves to the same blob; path-specific chronology is retained in issue #1418.

Verbatim curve and action:

    gamma^mu(lambda) =
      (lambda,
       Ax sin(kx lambda + phix),
       Ay sin(ky lambda + phiy),
       Az sin(kz lambda + phiz))

    v^mu = d gamma^mu / d lambda
    L = (1/2) m v^mu v_mu - V_tension(gamma)

This is a one-parameter curve in four-dimensional spacetime. The accompanying worldtube prose requires a separate thickening/sweep map; the displayed curve does not construct that map.

**Blockwave**
- Blob SHA-1: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d
- User-supplied attachment timestamp: 2025-09-16 16:31:34.670Z.
- First extant Git commit: 2026-10-08 02:42:49Z.
- The file is a user-supplied artifact, but content authorship of the displayed equations is unresolved and assistant-voiced.

Verbatim J2 current:

    J^{mu nu} = (1/2) epsilon^{mu nu rho sigma} nabla_rho B_sigma
    nabla_mu J^{mu nu} = 0

This is a rank-two current, not a curve. No source-defined map from this current to the Donut curve is supplied.

No corrected SAT-O1 or Blockwave equations were created. The originals remain separate from the proposed map contract above.

## 6. Symmetric discrepancy ledger

| ID | Source-to-translation issue | Finding |
|---|---|---|
| D01 | Donut ontology | Direct source says the Donut is not part of SAT. The assistant canon adds a specific SO(3) connection/holonomy construction that is not recovered from the direct source. |
| D02 | Proof level | The assistant called the Donut a candidate generator, which underplays the user's claim that a particular closed composite curve is a geometric proof. The separate proof that the procedure is a prover remains open. |
| D03 | Curve/function identity | A parameterized curve is a function, but its trace is its image. Different parameterizations can share a trace while differing in traversal, orientation, speed, or multiplicity. An implicit equation defines a level set, not automatically a parameterized curve. The assistant expanded the user's narrower statement into an identity among implicit equations, drawings, physical paths, and constraints. |
| D04 | Input scope | The source alternates between “some classes of equations” and a broad claim about any equation. The admissible class and equivalence relation are unspecified. |
| D05 | Minimization | The direct source recalls a minimization criterion but does not identify the functional. Rational winding and path-ordered holonomy in the assistant canon are model choices, not recovered user equations. |
| D06 | Group target | The direct source recalls a Schwarzschild-Hydrogen ladder correspondence and a Schwarzschild-SO(4) or SU(2) correspondence, but is uncertain about the second group. The assistant's SO(3)/SU(2) construction does not resolve that uncertainty. |
| D07 | Method versus instrument | The Minkowski geometry-to-mechanism method is part of theory construction. The Donut is a candidate representation/search instrument within that work, not the method itself. |
| D08 | Different map types | Equation-to-curve encoding, worldline-to-worldtube thickening, and worldtube-to-timesheet readout have different domains and codomains. They cannot be substituted by analogy. |
| D09 | Nesting | Superhelical nesting and braid nesting are explicitly distinct in the July source. No map between them is defined. |
| D10 | Blockwave type | The J2 current is not a curve and is not shown equivalent to the direct worldline/surface description or the Donut output. |

## 7. Existing work and next cursor

Related records already cover the broad object hierarchy, the current Whirligig browser, observation-geometry-math separation, GR-QM provenance, worldline/Blockwave distinctions, Klein local/global maps, and interbraid readout: issues #1407, #1415, #1420, #1386, #1418, #1425, and #1426. This addendum contributes the earlier role-authenticated June 23 source and its algorithmic intent; it does not reopen those completed audits.

Next:
1. Recover the exact source derivations for the Schwarzschild-Hydrogen ladder and Schwarzschild-SO(4)/SU(2) claims. Pin the target group and define the spaces, maps, invariants, and inverse.
2. Specify the Donut input class, admissible equivalence relation, curve encoding, sphere projection, closure class, minimization functional, and decoder.
3. Test injectivity or the appropriate fiber-constancy condition on the declared quotient before claiming information preservation.
4. Define the derivation relation independently of closure.
5. Keep the current Whirligig browser, the older Python solver, the Donut source procedure, and the physical worldtube ontology as separate artifacts.

No physical calculation, CODATA scoring, observational validation, or theory promotion is claimed.
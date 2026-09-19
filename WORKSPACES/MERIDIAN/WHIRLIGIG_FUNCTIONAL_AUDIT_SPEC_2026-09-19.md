# Whirligig functional audit specification — 2026-09-19

**Status:** ACTIVE reconstruction/audit aid; not theory promotion.  
**Authority:** Nathan's current live clarification of intended Whirligig function controls interpretation; historical implementation still requires source recovery.  
**Version caution:** historical Donut/Whirligig mathematics is SAT-2026-PRE-HsH unless a newer source explicitly carries it forward.

## Why this specification exists
Understanding and explicating Whirligig is a prerequisite to properly assessing its output and the GR↔QM isomorphism. Do not adjudicate the solver merely from an endpoint equation or from one early incomplete UI implementation.

## Intended job — current Nathan-direct clarification
1. Equations admit indefinitely many valid transformations; trivial rescaling already supplies an infinite family. Transformation existence alone is cheap.
2. Whirligig uses **geometry as a search constraint/heuristic**: in a universe modeled geometrically, geometrically natural/constrained transformations are promising places to search for useful derivational relationships.
3. The immediate historical target was an **intermediate equation on a derivation path** between a supposedly non-quantizable GR equation and a supposedly nonclassical QM equation, and vice versa.
4. An equation is to be constrained/encoded as an **information-conserving curve**.
5. Two information-conserving curves can be combined into an **information-conserving composite curve** capable of yielding an information-conserving output equation.
6. **Bending energy** is used as a proxy for derivational-path difficulty/tractability, narrowing the transformation space to one or more tractable intermediate derivation steps.
7. The operation can in principle be iterated: `A -> E1 -> E2 -> ... -> B`.

Multiplicity is expected. The key question is not whether Whirligig returns a unique representation, but whether encoding/composition/readout conserve the required information and whether geometric ranking enriches the search for valid, tractable derivational steps without arbitrary representation choices controlling the answer.

## GR↔QM / holonomy provenance order
Current Nathan-direct discovery order:

`LLM intuition: holonomy as bridge -> mathematical development/testing -> later Nathan recognition that classical helix and quantum rung-profile presentations make the relationship visually/intuitively obvious.`

Do not reverse this chronology by treating the later visualization as the premise of the mathematics.

Quantization/discreteness is also to be separated from other quantum phenomena. Classical oscillatory systems can possess discrete modes/sectors; SAT/H(s)H proposes that short-scale 4D oscillatory/helical behavior makes winding/closure/holonomy a candidate classical mechanism for ubiquitous quantization. The stronger hypothesis is that GR-like and QM-like descriptions are different classical modes/readouts of deeper continuous geometry. Entanglement and other quantum phenomena remain separate explanatory/audit targets.

## Historical cross-check
Legacy `2026 discussions/SAT THEORY — WHIRLIGIG SIMPLIFICATION TAKE 1.txt` independently preserves several functional elements: mechanical translation device; two physical equations represented as 4D curves; UI/double-sphere projection; Donut/toroidal projection; Curvy_Lisa/Lissajous derivation path; and `path of least resistance` / minimal-resistance language.

That source does **not** by itself establish a demonstrated information-conserving equation↔curve bijection, prove information conservation under composition, or establish representation-invariant least-bending ranking. Those remain reconstruction obligations.

## Required audit before endpoint adjudication
1. **Equation -> curve encoder** — domain/codomain; units/constants/boundary conditions; exact information-conservation criterion; handling of algebraically equivalent forms.
2. **Curve composition operator** — exact rule; preserved information; directionality/symmetry; admissible curve class.
3. **Geometric constraint space** — exact UI/sphere/Donut/torus construction at the relevant historical stage.
4. **Bending-energy/search functional** — formula, metric, parameterization dependence, boundary conditions, normalization, minimization method, and stated reason lower cost should correlate with derivational tractability.
5. **Curve -> equation decoder** — inverse/readout and losslessness criterion.
6. **Iteration rule** — candidate promotion to new endpoint; branching/multiplicity; stopping criterion; search-path artifacts.
7. **Representation-invariance test** — equivalent presentations of one endpoint must not change physical/derivational rankings solely through arbitrary encoding/gauge choices unless those choices are explicit model variables.
8. **Held-out GR↔QM replay** — only after 1–7, reconstruct the historical endpoint pair and classify the strongest supported relation: analogy, correspondence, homomorphism, local equivalence, dual representation, or isomorphism.
9. **Holonomy bridge provenance/math audit** — separately recover first LLM proposal, subsequent calculation, and Nathan's later geometric recognition; independently work the mathematics and attempt repair before current judgment.

## Reconciliation with earlier Meridian results
Earlier recovered UI prototypes have local implementation gaps: already-parametric 4-vector input rather than arbitrary equation/PDE input; no constructed full SO(4) lift in inspected code; manually chosen rotations; no recovered representation-invariant control-history metric. These findings remain valid for those artifacts but do not substitute for the intended Whirligig specification.

The GR↔QM family remains historically CLAIMED / CLAIMED VERIFIED and presently RE-AUDIT IN PROGRESS under the full-workthrough-and-repair rule. Local incompleteness is not family-level disclaimer.

## Next cursor
Recover the earliest source that explicitly defines the information-conserving equation↔curve mapping and bending-energy derivational-path criterion. Crosswalk that operator to the fuller Donut construction, March 16 composite, later reduced Whirligig forms, and dedicated Relativistic–Quantum Isomorphism calculation before another endpoint judgment.

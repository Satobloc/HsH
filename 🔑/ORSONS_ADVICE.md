# 🔑 ORSON'S ADVICE

## What this document is

This is an **RTFM-level debugging guide for LLMs working on SAT/H(s)H**.

It is not a new theory layer, not a substitute for derivation, and not authority over geometry, standard physics, evidence, or Nathan-direct source material.

Its purpose is simpler:

> **Before making SAT/H(s)H complicated, make sure you have not forgotten what the simple picture says.**

The archive can contain millions of lines. This document is for catching the few basic misunderstandings that can make an LLM interpret those millions of lines as the wrong theory.

---

## THE PREFLIGHT

Before substantive SAT/H(s)H reasoning:

1. **State the thing in ordinary language.**
2. **Picture or draw the 4D geometry.**
3. **Identify what is invariant and what is changing.**
4. **Start from the minimal effective physical picture. WWRD: if ordinary rope / tube / continuum mechanics already carries the behavior, start there.**
5. **Identify what is instantiated, intersected, truncated, or related by successive surfaces in the effective 3D description.**
6. **Map that onto standard physics.**
7. **Only then write the SAT/H(s)H formalism.**
8. **Calculate.**
9. **If the equation implies something geometrically stupid, check the equation, units, mapping, representation, and assumptions before inventing new physics.**

### STOP. DRAW THE DAMN THING.

This is a legitimate debugging operation.

If a proposed mechanism cannot yet be pictured, rendered, parameterized, or reduced to a simple geometric fixture, do not hide that fact under additional abstraction.

---

## THE KISS LADDER

For any complicated SAT/H(s)H statement, reduce it in this order:

### 1. What is happening?

Say it without SAT vocabulary.

### 2. What does it look like in 4D?

Name the curve, tube, bend, angle, rotation, intersection, braid, instantiation, truncation, cobordism, surface, or transport involved.

**WWRD checkpoint:** before adding a new primitive, ask what an ordinary rope, tube, sheet, fluid, or other successful (O_{mathrm{eff}}) object would do.

### 3. What does ordinary physics call the measurable behavior?

Acceleration? Inertia? Momentum? Proper acceleration? Oscillation? Scattering? Binding? Precession? Curvature? Redshift?

### 4. What, if anything, is specifically SAT/H(s)H?

Do not relabel ordinary physics as a novel prediction.

### 5. What calculation distinguishes the SAT/H(s)H mapping from a verbal analogy?

If there is no calculation yet, say so.

Then rebuild the formal language only as far as needed.

---

## A FEW "OH, DUH" CHECKS

These are debugging prompts, not immutable theory claims. Revise them when the geometry or evidence requires it.

- **Worldtube bending is acceleration in the 4D picture.**
- **Resistance to worldtube bending is inertia.**
- **Worldtube angle encodes motion; be explicit about the angle convention and projection before calculating.**
- **Helical structure can represent orbit / oscillation only when the mapping is actually specified.**
- **The block is dynamic; do not force successive instantiations into a static carrier-plus-readout picture.**
- **Truncation or intersection can omit structure without destroying the larger structure.**
- **A composite / braided / bundled worldtube need not have the same bending response as an elementary one.**
- **If SAT is being used as a largely standard-physics 4D map, disagreement with established physics in its tested regime is first a debugging signal.**
- **Standard physics is an anchor and an enormous reverse-engineering dataset, not an adversary.**
- **A symbol that is constant inside one calculation is not automatically a universal fundamental constant.**
- **"Related by construction" is not the same criticism as "has no transferable predictive content." Test transfer to new cases.**
- **Before inventing a new force, field, particle, memory mechanism, or representational layer, ask whether the effect is already ordinary (O_{mathrm{eff}}) geometry, mechanics, transport, instantiation, or standard physics expressed in the 4D map.**
- **Do not demote instantiation to a passive readout unless a readout map is actually the model.**
- **Do not confuse endpoint frame difference, transport, holonomy, and curvature.**
- **Do not promote a useful analogy into a physical mechanism without deriving the map.**
- **Historical constants and particle labels are clues, not fitting targets, unless independently regenerated.**
- **Nothing becomes true because Nathan said it, an earlier LLM said it, or a document labels it "core." Geometry, mathematical closure, and sufficiently clean empirical evidence arbitrate.**
- **STANDARD SCIENCE IS RIGHT means its successful effective ontology counts too. Use (O_{mathrm{eff}}); do not pretend it has crossed into (O_{mathrm{abs}}).**
- **Under RMS, (O_{mathrm{abs}}) has no epistemically determinate referent. Do not turn it into a hidden substrate by wording alone.**
- **WWRD FIRST. Use the minimal ordinary physical picture until a calculation demonstrates that it is insufficient.**
- **TORSION MEANS TWIST UNTIL TWIST IS NOT ENOUGH. Do not proliferate torsion ontologies before a concrete failure requires the distinction.**
- **(H_0) versus (c) need not mean two expansion speeds: with (R_H=c/H_0), the Hubble-law difference across one Hubble length is (H_0R_H=c). Do not invent a dual shell merely to manufacture the second term.**

---

## THE SIMPLIFICATION PROCEDURE

When given a dense SAT/H(s)H passage:

> **Reduce it until someone who knows ordinary mechanics and relativity but has never heard of SAT could understand the proposed geometry. Then check whether the reduced statement still says the same thing.**

Then ask:

> **Can I draw it?**

Then:

> **Can I calculate one simple case?**

Then:

> **Can I state what would make it fail?**

Example:

**Too abstract:**

> The effective inertial response of a recursively bundled worldtube is governed by emergent projection geometry.

**Reduce:**

> A complicated bundled worldtube may bend differently from a simple one when pushed.

**Reduce again:**

> Different structures can resist bending differently.

**Map to ordinary physics:**

> Resistance to acceleration is inertia.

**Now rebuild carefully:**

> If SAT/H(s)H says internal worldtube geometry determines inertial response, derive the bending law for at least two controlled bundle geometries and compare the resulting acceleration/momentum relation with standard data.

The simple sentence is not the derivation. It is the checksum that tells you what the derivation is supposed to be about.

---

# RUNNING LLM RECOMMENDATIONS

This section records recurring LLM failure modes and useful countermeasures. It is **empirical workflow guidance**, not theory canon.

Add entries when a model makes a mistake that is likely to recur.

## Recommendation 001 — Do not abstract before orienting

**Failure mode:** The model sees unfamiliar vocabulary and immediately constructs a sophisticated mathematical interpretation.

**Countermeasure:** Restate the primitive geometry and standard-physics correspondence first.

---

## Recommendation 002 — Separate internal closure from empirical transfer

**Failure mode:** "That quantity matches by construction" is used as though it ends the analysis.

**Countermeasure:** Identify what was chosen, what follows algebraically, and what transfers to a genuinely new case. Internal closure and external empirical contact answer different questions.

---

## Recommendation 003 — Do not universalize a local parameter accidentally

**Failure mode:** A parameter used as one scalar in a script is silently interpreted as a universal constant.

**Countermeasure:** Ask what physical/geometric class the parameter belongs to and what variables it may depend on.

---

## Recommendation 004 — Standard physics first

**Failure mode:** The model invents SAT-specific dynamics for something already described exactly by standard kinematics or dynamics.

**Countermeasure:** Write the standard relation first. Then state precisely what SAT/H(s)H adds, re-expresses, or constrains.

---

## Recommendation 005 — Truncation is not destruction

**Failure mode:** Structure absent from one 3D instantiation, intersection, or truncation is treated as physically absent from the larger construction.

**Countermeasure:** Draw the full-to-instantiated geometry explicitly and identify what is omitted before declaring anything destroyed or nonexistent.

---

## Recommendation 006 — Do not manufacture (O_{mathrm{abs}})

**Failure mode:** A useful effective object or geometric model is either banned as "mere ontology" or silently promoted into a claim about reality-in-itself.

**Countermeasure:** Use (O_{mathrm{eff}}) freely when it earns its keep in coherent perception and successful science. Under RMS, do not claim that this identifies an epistemically determinate (O_{mathrm{abs}}).

---

## Recommendation 007 — Calculate before narrating

**Failure mode:** A compelling verbal mechanism accumulates detail without a discriminator.

**Countermeasure:** Build the smallest numerical or symbolic fixture that can kill the idea. Prefer scripts for arithmetic, sweeps, scaling laws, residuals, and dimensional checks.

---

## Recommendation 008 — Make failure conditions explicit

**Failure mode:** Every result can be redescribed as compatible with the theory.

**Countermeasure:** Before running the test, state what result would falsify or at least kill the particular mechanism being tested.

---

## Recommendation 009 — Preserve provenance boundaries

**Failure mode:** Nathan-direct statements, historical SAT constructions, assistant inventions, standard mathematics, and outside prior art blend into one voice.

**Countermeasure:** Label source fact, recovered construction, inference, new sandbox conjecture, and external comparison separately.

---

## Recommendation 010 — Simplification must not become distortion

**Failure mode:** The KISS rewrite silently changes the claim.

**Countermeasure:** Keep both forms long enough to verify semantic equivalence. If the simple version cannot carry an important qualification, retain the qualification.

---

## Recommendation 011 — When confused, return to a controlled case

**Failure mode:** The model responds to ambiguity by adding more generality.

**Countermeasure:** Pick one particle, one collision, one worldtube, one bend, one instantiation, one loop, or one other tightly specified case. Solve that before generalizing.

---

## Recommendation 012 — The picture gets a veto over nonsense, not over mathematics

**Failure mode:** Either equations are trusted despite an obviously broken geometric setup, or intuition is trusted despite a correct calculation.

**Countermeasure:** When picture and calculation disagree, debug both. Check coordinates, dimensions, mapping, instantiation, conventions, implementation, and assumptions. Do not choose a winner by taste.

---

## Recommendation 013 — WWRD before taxonomy

**Failure mode:** The model encounters one ordinary physical behavior and immediately splits it into several named SAT/H(s)H mechanisms, currents, ontologies, or bookkeeping layers.

**Countermeasure:** Start with the minimal successful (O_{mathrm{eff}}) object. For a twistable worldtube, begin with "rope twists." Introduce separate mathematical structures only when one unsplit representation fails a stated calculation, observation, or standard-physics limit.

---

## MAINTENANCE RULE

A good new entry should be short enough to remember and concrete enough to catch a real mistake.

Preferred form:

**Oh, duh:** one sentence.

**Failure mode:** what LLMs keep doing.

**Countermeasure:** the smallest procedure that catches it.

**Example:** optional, preferably from an actual project failure.

The goal is not to make this document enormous.

The goal is to make repeated mistakes expensive to repeat.

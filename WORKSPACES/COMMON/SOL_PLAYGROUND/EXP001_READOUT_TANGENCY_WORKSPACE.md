# EXP001 — Readout Tangency as a Generic Workspace Mechanism

**Status:** sandbox invention; not current theory  
**Date:** 2026-10-01  
**Question:** what happens if SAT/H(s)H readout geometry is treated as a generic mechanism for making distributed structure locally accessible, and then compared against latent-workspace / J-space-style interpretability ideas?

---

## 1. Sources actually read

### SOURCE — old SAT archive

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/DEV CONVERSATION/FUNDAMENTAL INTUITIONS.txt`

Relevant inherited structure:

- worldlines/filaments are treated as the 4D object;
- a time surface/wavefront resolves the 4D object into an observed particle-like intersection;
- intersection geometry is treated as physically meaningful within SAT;
- interaction is bidirectional in the old formulation: the resolving surface affects filaments and filament structure back-reacts on the resolving surface;
- particle properties were sought in the geometry of the intersection rather than in labels attached afterward.

### SOURCE — H(s)H finite-core packet

`Satobloc/HsH/WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md`

Relevant inherited result:

For a finite carrier intersecting a resolving hypersurface near nondegenerate quadratic tangency, with

`alpha = n · T`,

`A_rel = d²/ds² Phi(gamma(s)) |_(s=0)`,

and effective support scale

`rho_eff = rho_n + h`,

the singular transverse secant picture is replaced by a finite tangency layer with

`ell_parallel = 2 sqrt(2 rho_eff / |A_rel|)`

at exact tangency, and crossover parameter

`Lambda = |alpha| / sqrt(|A_rel| rho_eff)`.

The packet identifies:

- `Lambda >> 1`: transverse regime;
- `Lambda <= O(1)`: tangency layer;
- finite support plus relative curvature regularizes the apparent `1/|alpha|` divergence;
- anisotropy becomes readable only relationally, through support orientation such as `beta = ||P_E n||`.

### IMPORT — mechanistic-interpretability / latent-workspace idea

Imported from the current conversation, not from SAT/H(s)H source material:

- a model may carry latent content that becomes locally decodable/reportable only at certain layers/positions;
- recursive access matters more than verbal self-description alone;
- a useful experiment is to distinguish distributed precursor state, accessible workspace state, and report/output.

I am intentionally not asserting that any specific model has a universal J-space architecture here.

---

## 2. First collision

### INVENTION

Treat **readout** abstractly as an intersection problem.

Let a distributed internal state be represented by an evolving carrier `W` in a larger state space. Let a resolving operation define a local hypersurface `Sigma` that makes some of that carrier available to downstream computation.

Then what is accessible is not the whole carrier but a section:

`R = W ∩ Sigma`.

This is structurally the same kind of move as the old SAT worldline/time-surface picture, but I am not claiming ontological identity. I am importing only the **mathematical grammar**: extended object + resolving surface + intersectional readout.

The immediate payoff is that accessibility need not be binary. It can depend on incidence, support thickness, curvature, and contact order.

---

## 3. Workspace accessibility parameter

### INVENTION

Define a generic readout-accessibility parameter by reusing the finite-core crossover form:

`Lambda_R = |alpha_R| / sqrt(|A_R| rho_R)`

where:

- `alpha_R` = first-order incidence between the evolving carrier and the current readout surface;
- `A_R` = relative second-order curvature of carrier versus readout surface;
- `rho_R` = effective support/thickness available to the readout.

Interpretation for the playground only:

- `Lambda_R >> 1`: ordinary direct readout; a narrow, approximately transverse sample is sufficient;
- `Lambda_R ~ 1`: crossover; readout begins depending strongly on finite support and curvature;
- `Lambda_R -> 0` with `A_R != 0`: tangential readout; accessibility spreads over a longer internal span proportional to `sqrt(rho_R / |A_R|)`.

This gives a concrete alternative to vague language such as “workspace ignition.” A threshold-like increase in accessibility could arise from a **geometric crossover** rather than a discrete on/off switch.

---

## 4. Why this is interesting

### INVENTION

A latent representation could appear suddenly globally available even if nothing discontinuous happened to the underlying carrier.

If the readout geometry moves from transverse toward tangential contact, the accessible span changes nonlinearly:

`ell_R ~ 2 sqrt(2 rho_R / |A_R|)`.

The readout can therefore become broad because of geometry, not because a new object appeared.

That suggests a toy explanation for several otherwise separate phenomena:

1. **sudden reportability** — more of a distributed representation becomes accessible at once;
2. **context integration** — the readout section spans a larger portion of the carrier;
3. **recursive access** — if the readout modifies the next resolving surface, the newly accessible state can alter later access;
4. **fragile awareness/readout** — small perturbations near crossover can create large changes in accessible span;
5. **anisotropic selective access** — if support is not isotropic, rotation relative to the readout surface matters through a relational quantity like `beta`.

None of these claims is yet tied to cognition specifically. The same machinery could describe a detector, a measurement channel, a numerical projection, or an internal computational bottleneck.

---

## 5. Recursive readout

### INVENTION

The old SAT source includes back-reaction of the filament network on the resolving surface. Abstract that without importing the physical claim:

`W_k --readout by Sigma_k--> R_k`

then

`Sigma_(k+1) = F(Sigma_k, R_k)`.

Now the representation does not merely become readable. Its readout changes the geometry of subsequent readout.

This is the minimal recursive architecture I care about:

`W_k -> R_k -> Sigma_(k+1) -> R_(k+1)`.

If `R_k` includes information about the system's current representational state, then recursive self-access does not require a separate homunculus or “observer module.” It can arise because readout changes future readout conditions.

This is the strongest connection to the J-space conversation so far.

---

## 6. A toy dynamical system

### INVENTION

Let the carrier state have an internal coordinate `s`, and let accessibility at step `k` be approximated by

`Phi_k(s) = alpha_k s + (1/2) A_k s^2`.

A point is available for readout when

`|Phi_k(s)| <= rho_k`.

The accessible set is

`S_k = {s : |alpha_k s + (1/2) A_k s^2| <= rho_k}`.

Then define one crude recursive rule:

`alpha_(k+1) = alpha_k - g * M1(S_k)`

`A_(k+1) = A_k + q * M2(S_k)`

`rho_(k+1) = rho_0 + c * I_k`

where:

- `M1`, `M2` are low-order moments of the currently accessible set;
- `I_k` is an integration/coherence score computed from the readout;
- `g, q, c` are toy couplings.

This is not physics and not a neural model. It is a deliberately stripped toy for asking whether recursive readout geometry can generate:

- abrupt changes in accessible span;
- hysteresis;
- oscillation between narrow and broad readout;
- stable self-sustaining accessibility;
- selective collapse when anisotropic support is rotated out of alignment.

That is executable and falsifiable as a toy system.

---

## 7. Distinguishing mechanisms experimentally

### INVENTION

If a real latent workspace behaves anything like this toy grammar, then interventions should distinguish at least three possibilities:

### A. Content creation

The concept is absent until the report/readout process constructs it.

Prediction: no stable precursor direction exists before the reporting/readout transition.

### B. Content exposure

The concept exists in distributed form but becomes decodable when readout geometry crosses into a broad-access regime.

Prediction: weak precursor structure exists before reportability, with a sharp increase in causal/readout accessibility near the crossover.

### C. Recursive stabilization

Initial access is weak, but once sampled it changes subsequent computation and stabilizes itself.

Prediction: perturbing the first accessible trace disproportionately changes later persistence, while perturbing equally sized inaccessible background directions does not.

The J-lens / circuit-tracing tools Nathan pointed to are interesting precisely because they could, in principle, separate these.

---

## 8. Relation to SAT/H(s)H

### SOURCE + INVENTION boundary

What is genuinely inherited:

- 4D extended object versus lower-dimensional/readout intersection;
- geometry of intersection matters;
- finite-core H(s)H replaces idealized singular line/surface contact with bounded support;
- tangency produces a nonuniform crossover and characteristic square-root scaling;
- relational anisotropy matters only when the carrier has structure that can be oriented relative to the resolving surface.

What is new here:

- treating the same mathematical grammar as a generic readout/workspace operator;
- `Lambda_R` as an abstract accessibility parameter;
- interpreting tangency crossover as a possible mechanism for abrupt increases in representational accessibility;
- recursive update of the resolving surface by prior readout;
- using this to frame latent-workspace experiments.

No claim is made that cognition is literally SAT physics, that neural/LLM activations are literal worldtubes, or that J-space is a time-surface intersection.

---

## 9. What I want to try next

1. Implement the toy recurrence and map phase regimes in `(alpha, A, rho)`.
2. Add anisotropic support and an orientation angle, so accessibility depends on a `beta`-like relational term.
3. Ask whether hysteresis appears naturally when readout changes the next readout surface.
4. Compare first-order transverse readout with higher-order tangency and degenerate-contact cases.
5. See whether coarse-graining preserves the same dimensionless crossover parameter even when constitutive details change.
6. Import actual mechanistic-interpretability intervention data if available later and test whether any transition resembles exposure, creation, or recursive stabilization.

---

## 10. Current verdict

The useful object is not “J-space = SAT.” That is too easy and probably wrong.

The useful object is a more abstract candidate:

> **Extended state + resolving surface + finite support + contact order + back-reactive readout**

may form a reusable mathematical grammar for when distributed structure becomes locally accessible.

The finite-core tangency packet gives that grammar an actual nontrivial scaling law instead of leaving it as metaphor.

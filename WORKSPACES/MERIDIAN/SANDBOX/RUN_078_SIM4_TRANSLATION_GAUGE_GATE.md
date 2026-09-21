# Run 078 — Sim(4) translation gauge gate for Hagalaz ↔ Three-Spheres comparison

**Status:** SANDBOX / CLAIMED formalization  
**Branch/task:** Meridian continuation from Run 077  
**Date:** 2026-09-21  
**Quarantine:** untouched; no PRIOR_ART/nLab/private quarantine ingress.

## Bounded operation

Resolved the metric issue identified in Run 077 before attempting a Hagalaz ↔ Three-Spheres numerical comparison: determine what can and cannot be compared fairly when a candidate closure residual is represented as a similarity transform

`h = (t, s, Q) ∈ Sim(4)`

with composition

`(t2,s2,Q2) ∘ (t1,s1,Q1) = (t2 + s2 Q2 t1, s2 s1, Q2 Q1)`.

## Exact conjugation check

For a change of similarity frame `g=(a, λ, U)`, with action `x ↦ a + λ U x`, direct composition gives

`g^{-1} h g = ( t', s, U^T Q U )`

with

`t' = λ^{-1} U^T [ t + (s Q - I) a ]`.

Consequences:

1. `s` is unchanged by similarity-frame conjugation.
2. `Q` changes by orthogonal conjugation, so class functions such as `||Q-I||_F` are invariant.
3. Translation is **not** a conjugacy invariant: origin shifts inject `(sQ-I)a`, and unit rescaling contributes `λ^{-1}`.
4. Therefore there is no justification for comparing raw `||t||` values between independently gauged Hagalaz/UI and Three-Spheres representations.

This sharpens the warning in Run 077: the problem is not merely dimensional normalization. Unless the residual has `sQ=I`, an origin change can alter translation even after dividing by a nominal length scale.

## Fair-comparison gate

For the next cross-solver benchmark, use one of two explicitly labelled regimes.

### A. Shared material/director gauge — preferred first benchmark

Construct both representations from the **same primitive 4D frame data**, with the same origin, orientation, and length unit. Then compare the dimensionless translation score

`E_t = ||t_loop|| / L_ref`,

where `L_ref` is fixed from the primitive geometry before perturbation (for the equal-radius Three-Spheres control, use the common sphere radius `R`, or set `R=1`). Pair it with

`E_s = |log s_loop|`,

`E_Q = ||Q_loop-I||_F`.

This does not make `E_t` a Sim(4) conjugacy invariant. It makes it a legitimate **gauge-controlled observable** because both solvers are evaluated in one declared material gauge.

### B. Gauge-free comparison

If the representations cannot be put into the same material/director gauge, do **not** compare translation norms. Compare only shared conjugacy-safe quantities (e.g. scale residual and rotation conjugacy class), or first construct a separately justified quotient/invariant object. Do not invent an invariant by normalization alone.

## Three-Spheres implication

The recovered Three-Spheres lineage supplies a natural physical/geometric scale `R` and explicit 4D carrier coordinates, while the source-first checkpoint also records Bishop-frame transport as an intended extension/interface candidate. That makes regime A feasible in principle: express the candidate Hagalaz edge loop and Three-Spheres closure/gate residual from the same absolute 4D centers/directors, freeze `R`, and inject the same edge/transport mismatch.

The next numerical comparison should therefore be a **shared-gauge sensitivity test**, not an invariant-translation test. A successful comparison would establish response correspondence under a declared representation gauge; it would not establish solver equivalence or Nathan-intended Hagalaz identity.

## Useful limit checks

- Pure translation residual (`s=1`, `Q=I`): origin term vanishes; `t' = λ^{-1}U^T t`. After a shared length normalization, magnitude is origin/rotation safe.
- Pure rotation about a changed origin (`s=1`, `Q≠I`): `t'` acquires `(Q-I)a`; raw translation magnitude is origin-dependent.
- Pure scale (`Q=I`, `s≠1`): `t'` acquires `(s-1)a`; raw translation magnitude is origin-dependent.
- Exact closure (`t=0,s=1,Q=I`): remains exact closure in every similarity frame.

These are useful implementation tests for any future comparator.

## Sources / provenance

Direct dependency: `WORKSPACES/MERIDIAN/SANDBOX/RUN_077_HAGALAZ_CONTROLLED_EDGE_MISMATCH.md` and the current Meridian checkpoint's recovered Three-Spheres/Hagalaz source summary. No external literature used. Exact September-11 Hagalaz source remains unrecovered; candidate operator status is unchanged.

## Nathan Words / capability disposition

No intended-object ambiguity was resolved here; this was a representation/gauge calculation on the already-declared candidate operator. Nathan Words feed disposition: **NOT RELEVANT for this bounded operation**.

Capability added: explicit gauge gate preventing a false cross-representation translation comparison.

## Durable boundary / next cursor

Build the Three-Spheres comparator in **shared material gauge** from one primitive absolute 4D dataset. Use `(E_t,E_s,E_Q)` with `E_t=||t||/R`, inject the same bounded mismatch used in Run 077, and report response curves separately rather than collapsing them into one scalar. Keep the exact-Hagalaz-source recovery branch live; no promotion of the reconstructed operator.
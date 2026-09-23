# Meridian Solver Harness — operational contract v0.1

**Branch:** HAGALAZ-SOLVER-UNIFICATION / solver operationalization
**Priority:** subordinate to active Code Grurple paper work
**Status:** SANDBOX / executable scaffold
**Date:** 2026-09-22
**Quarantine:** none consulted

## Purpose

Operationalize existing SAT/H(s)H solver objects without forcing them into one mathematical formalism.

The common layer standardizes evidence, not semantics:

primitive fixture -> solver-owned adapter -> write/test -> reality check -> doh check -> big-picture check -> review-what-we-forgot -> geometric artifact -> Nathan visual/intention check -> independent review.

A candidate external formalism may characterize or test an existing SAT/H(s)H object. The harness must not manufacture new theory requirements merely to make an adapter or formalism applicable.

## Silo rule: Meridian <-> Mercer

Work hand-in-hand by sharing **contracts, fixtures, frozen outputs, and questions**, not implementation reasoning.

Before each side freezes a pass:
- shared: fixture specification, declared solver contract, expected invariances, artifact format, pass/fail question;
- siloed: source code choices, intermediate reasoning, debugging path, interpretation of surprising results.

After both sides freeze:
- compare output records;
- classify agreement, implementation-dependent agreement, discrepancy, or unresolved;
- only then cross-read code/reasoning as needed.

Mercer should be able to reproduce or attack a Meridian result without inheriting Meridian's implementation. Meridian should do the same to Mercer results.

This is real siloing, not duplicate work with hidden filenames.

## Stages

1. **WRITE/TEST** — Does the adapter reproduce exact/known controls?
2. **REALITY CHECK** — Do irrelevant perturbations stay irrelevant? Do relevant ones register?
3. **DOH CHECK** — Cheap semantic sanity: finite values, dimensions, impossible signs/ranges, projection traps, accidental leakage.
4. **BIG PICTURE CHECK** — What was actually established, and what absolutely was not?
5. **REVIEW WHAT WE FORGOT** — Explicit unresolved prompts; passing tests are not permission to stop thinking.
6. **NATHAN VISUAL CHECK** — When geometry can be rendered, ask whether the result looks like the intended object/behavior. Nathan's recognition is an intent/representation check, not mathematical validation.
7. **INDEPENDENT REVIEW** — Mercer or another siloed worker attacks the frozen contract/output.

## Visual rule

Generated diagnostic images are not automatically canonical SAT/H(s)H visuals.

- computationally exact diagnostic geometry may support Class P/H work when its construction is explicit;
- a projection must state what dimensions/channels it hides;
- a visual that "looks right" can still fail numerically;
- a numerically passing output can still depict the wrong intended object;
- therefore machine and Nathan/reality checks remain separate fields.

## First adapter

run_three_spheres_control.py uses the RUN 099 equilateral R4 fixture.

Expected behavior:
- Three-Spheres sees centers/radius and returns the certified equilateral carrier;
- rotating supplied F2 in x-w must not change Three-Spheres output;
- the static relative-frame loop telescopes to identity;
- the x-y control-plane image cannot show the x-w frame perturbation, intentionally.

This is a strong first fixture because a visually changing Three-Spheres result under the frame-only perturbation would expose cross-channel leakage.

## Runtime status

The core RUN 099 matrix identity was independently spot-checked in the worker runtime:
- determinant of R_xw(pi/7) = 1 within floating precision;
- orthogonality residual approximately 1.56e-17;
- static frame-loop closure residual approximately 1.56e-17.

The repository adapter itself has **not yet been executed in a repository checkout in this environment**; no GitHub Actions run exists for the commit. Do not label the full adapter runtime-tested until that happens.

## Next cursor

Run the committed adapter in an environment with numpy/matplotlib and the repository tree available. Fix any packaging/runtime defects. Freeze its JSON+PNG outputs. Hand the fixture/contract—not Meridian implementation reasoning—to Mercer for an independent pass.

After that, add a second adapter whose output should visibly respond to the frame perturbation, giving the first paired geometric silo test.

No Nathan action is required until a trustworthy diagnostic image is available for the intended-geometry check.

# Meridian Sandbox — Run 066: blind operator-strata search

**Status:** NEW CONSTRUCTIVE WORK / SANDBOX ONLY  
**Date:** 2026-09-20  
**Math status:** CLAIMED; analytic branch structure and nested numerical search checked in-run.  
**Purpose:** Strengthen Run 065 by removing the instruction “eliminate the first derivative term.” The solver is told only to search for the nearest lower-support operator within an admissible transformation family.

## 1. Equation and admissible transformation

Start from

\[
y''+p y'+q y=0
\]

and allow

\[
U=e^{cx}y.
\]

The transformed normalized coefficient vector is

\[
\boxed{
h(c)=(1,a(c),b(c),0)}
\]

with

\[
a(c)=p-2c,
\]

\[
b(c)=q-pc+c^2.
\]

No preferred target coefficient is specified.

## 2. Blind complexity target: nearest lower-support operator

With the leading second-derivative coefficient normalized to 1, define two codimension-one canonical strata:

- \(\mathcal S_a\): operators with the \(U'\) coefficient zero;
- \(\mathcal S_b\): operators with the \(U\) coefficient zero.

The solver target is their union

\[
\mathcal S=\mathcal S_a\cup\mathcal S_b.
\]

The squared distance is

\[
\boxed{
J_{sparse}(c)=\min\{a(c)^2,b(c)^2\}
}.
\]

This asks only: **which admissible transform makes the operator sparser?** It does not tell the solver in advance which term should disappear.

## 3. Exact branch structure

Write

\[
\boxed{\mu=q-\frac{p^2}{4}}.
\]

Then

\[
b(c)=\left(c-\frac p2\right)^2+\mu.
\]

The support-reduction branches are therefore:

### \(\mu>0\)

\(b(c)\) has no real zero. The only exact sparse transform is

\[
\boxed{c=p/2},
\]

which eliminates \(U'\).

### \(\mu=0\)

At

\[
\boxed{c=p/2}
\]

both

\[
a(c)=0,
\qquad
b(c)=0,
\]

so the operator collapses to

\[
U''=0.
\]

This is the intersection of the two lower-support strata: a deeper sparsity point.

### \(\mu<0\)

There are three real exact sparse transforms:

\[
\boxed{c=p/2}
\]

and

\[
\boxed{c=p/2\pm\sqrt{-\mu}}.
\]

The central branch removes \(U'\); the two side branches remove \(U\).

Thus the ordinary normal-form invariant \(\mu\) appears geometrically as a **bifurcation in the number and intersection pattern of accessible low-support strata**.

This branch structure was not inserted into the numerical optimizer; it is the analytic explanation of what the blind geometric objective discovers.

## 4. Unique-branch positive control

Take

\[
p=1.7,\qquad q=2.4.
\]

Then

\[
\mu=2.4-1.7^2/4>0.
\]

The blind body-frame search over \(J_{sparse}\) found the unique exact minimum

\[
\boxed{c=0.85=p/2}.
\]

Wrap the coefficient geometry in the same eight-level moving noncommuting \(SO(4)\) frame used in Run 065 and transport **both** sparse strata covariantly. The nested frame-aware search again found

\[
\boxed{c=0.85}
\]

with residual at floating-point zero.

A frame-blind search instead gave approximately

\[
\boxed{c\approx1.07737}
\]

with a large nonzero residual.

Therefore the solver can discover the correct support-reducing transform without being told which coefficient to eliminate, provided representation state is preserved.

## 5. Genuine ambiguity control

Take

\[
p=2,\qquad q=0.5.
\]

Then

\[
\mu=-0.5<0.
\]

The blind body and frame-aware nested searches recovered three distinct zero-residual branches:

\[
\boxed{c\approx0.2928932187},
\]

\[
\boxed{c=1},
\]

\[
\boxed{c\approx1.7071067812}.
\]

These are exactly

\[
1-\sqrt{0.5},\quad1,\quad1+\sqrt{0.5}.
\]

The correct solver behavior is therefore **not** to choose one “best” transform without an additional criterion. All three are equally sparse under the declared objective.

The frame-blind search did not preserve this branch structure and instead produced a displaced nonzero optimum.

## 6. Additional unique-branch checks

For cases with \(\mu>0\), frame-aware blind search recovered \(p/2\) to numerical precision:

| \(p\) | \(q\) | \(\mu\) sign | recovered \(c\) |
|---:|---:|:---:|---:|
| 1.0 | 0.5 | + | 0.5000000000 |
| -1.4 | 1.8 | + | -0.7000000000 |
| 1.7 | 2.4 | + | 0.8500000000 |

The corresponding frame-blind optima shifted away from the exact branch.

## 7. What this improves over Run 065

Run 065 asked for distance to the known `no-U'` subspace.

Run 066 asks for distance to the **union of lower-support operator strata** and allows the solver to determine which coefficient can be removed.

Therefore it demonstrates, on a controlled family:

\[
\text{admissible transformation family}
\to
\text{representation-covariant operator geometry}
\to
\text{generic sparsity objective}
\to
\text{discovered transformation branch(es)}.
\]

The solver also correctly preserves non-uniqueness when the objective itself does not distinguish the branches.

## 8. Interpretation of the \(\mu\) invariant

The familiar reduced coefficient

\[
\mu=q-p^2/4
\]

now has three simultaneous roles in this benchmark:

1. algebraic normal-form coefficient after the central transform \(c=p/2\);
2. sign classifier for the three canonical equation classes;
3. geometric bifurcation parameter controlling how the admissible transformation curve intersects the union of lower-support strata.

This is the first current Whirligig-style control in which a useful invariant emerges as the topology/intersection pattern of a geometric transformation search, rather than merely being read off after a specified term-removal instruction.

## 9. Limits

- The admissible transformation family \(U=e^{cx}y\) is still supplied.
- Sparsity is defined in the semantically meaningful derivative-order coefficient basis; it is not invariant under arbitrary mixing of derivative orders unless the strata are transported with that representation.
- The family is linear and one-dimensional.
- No claim is made that sparsity alone is a universal derivational-complexity metric.
- No GR↔QM or physical H(s)H inference follows yet.

## 10. Next stronger search

Use a transformation family with at least two continuous parameters and a union of several canonical geometric strata, then ask the solver to discover:

- which stratum is reachable;
- whether the optimum is unique;
- what invariant controls branch creation/merger;
- whether the result survives nested noncommuting 4D representation transport.

A suitable next class should remain analytically solvable so false positives and missed branches can be identified exactly.
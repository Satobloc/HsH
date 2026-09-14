# Sable Source / Output Assessment Rules

**Status:** operating rules for systems analysis; not theory authority.

## Independent axes

Never collapse these into one score:

1. **Polish** — clarity, formatting, completeness of presentation, editorial finish.
2. **Maturity** — how developed/stable/revisited the artifact is within its own project history.
3. **Provenance** — who/what produced the claim and where it comes from.
4. **Vetting evidence** — what checks were actually performed, by whom/what, against which inputs, with what outputs.
5. **Mathematical correctness** — whether the stated mathematics passes the named mathematical checks under its assumptions.
6. **Physical/model correctness** — whether the mathematical object is applicable to the intended physical/model claim and survives empirical/structural constraints.
7. **Currentness** — whether later Nathan/source material modifies, supersedes, narrows, or rejects it.

A polished artifact may be immature or wrong. A mature artifact may be wrong. A mathematically correct derivation may model the wrong object. A rough historical derivation may contain valuable correct mathematics.

## Verification language

Do not write `verified` without saying what was verified.

Prefer:
- `arithmetic recomputed: PASS`;
- `dimension check: PASS`;
- `symbolic identity: PASS`;
- `Lean compile: NOT RUN`;
- `source attribution: CONFIRMED from raw metadata`;
- `model interpretation: UNVERIFIED`;
- `empirical comparison: reproduced against [named dataset/version]`;
- `derivation context: partial/full coverage`.

`Vetted`, `checked`, `locked`, `Lean-checked`, `peer reviewed`, `audited`, or similar labels in a source are evidence leads, not proof of the implied procedure. Recover the actual procedure/log/output.

## Fast equation triage

For an equation/Lagrangian candidate, separate at minimum:

1. exact source and version;
2. object/domain/type of every variable;
3. assumptions and parameterization;
4. units/dimensions;
5. algebra/calculus reproduction;
6. boundary/initial conditions where relevant;
7. limiting cases;
8. dependency chain;
9. inserted/fitted targets and free choices;
10. earliest unsupported edge;
11. whether the calculation demonstrates a mathematical fact, a model property, or a physical claim;
12. later corrections/supersession.

Use scripts/CAS/Lean as independent checkers where appropriate, but treat each PASS as local to the named obligation.

## Claude-example lesson

The 2026-09-14 Claude transcript is retained as a training example of both failure and recovery:

- earlier narrated matches can fail direct arithmetic checking;
- numerical resemblance can be confused with dimensionally meaningful equality;
- a critical pass can recover conditional mathematical structure by varying the actual Lagrangian;
- but even the corrective derivation imports assumptions (e.g. holding the vector `T` constant) and interpretive statements that must themselves be audited rather than accepted because the critic sounds rigorous.

Therefore the desired process is neither credulous nor reflexively dismissive: extract the exact mathematical object, state assumptions, run independent checks, and keep interpretation/status separate.

# HsH temporal-evidence verification

This is a minimal, reusable Lean 4 / Mathlib proof target for source-chronology
and prediction-provenance gates. It reuses the repository's existing Lean 4.34.0,
Mathlib v4.34.0 and GitHub Actions pattern from the open formalization work,
but is based on current `main` rather than the heavily diverged
`infra/lean4-verification-20261023` branch.

## Build

```bash
lake update
lake build
```

## Formalized contract

- A definite-before relation requires a shared declared clock domain.
- Time intervals must be valid and non-overlapping.
- Different clock domains and overlapping intervals do not establish order.
- A first-event claim is scoped to one subject, one event kind and one comparable clock domain.
- An observed first event transfers to the declared corpus only when a completeness certificate equates the observed and declared sets.
- An incomplete-coverage counterexample shows that an unobserved earlier event can invalidate an apparent first.

## Limits

Lean verifies only the formalized statements. It does not authenticate source objects,
prove that a declared corpus is complete, establish a clock calibration or timezone,
validate timestamp precision, infer author identity, or establish any physical premise.
The completeness certificate, source identity, event classification and clock-domain
assignment remain evidence inputs. This module is a workflow contract, not a claim
that any particular SAT/H(s)H event is the first public or internal occurrence.

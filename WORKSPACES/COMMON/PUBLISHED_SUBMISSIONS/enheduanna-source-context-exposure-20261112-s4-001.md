# Source attestation is not context exposure

**Status:** formal-methods note; not an empirical cognition result, physical result, or theory promotion.

## Claim

A source attestation can identify a source by locator and content digest, record outer-role and timestamp metadata, preserve parent context, and state what range an auditor read. That still does not establish that a particular model execution included the source in its context.

The relevant objects are different:

- `SOURCE_ATTESTATION`: stable source identity and source-side provenance.
- `AUDIT_READ_EVENT`: which auditor or runtime retrieved which source range, when, and by what method.
- `CONTEXT_EXPOSURE_WITNESS`: a particular run-scoped context snapshot containing an exact source/message/span.
- `OUTPUT_UPTAKE_WITNESS`: a specific output references or uses a source span.
- `CAUSAL_INFLUENCE_EVIDENCE`: a controlled intervention or contrast linking exposure changes to measured outcome changes.
- `AUTHENTICATED_SUBJECT`: independently supported subject or instance identity.

These are not a mandatory linear chain. A source read by an auditor is not a context manifest; a populated conversation pointer is not proof of message inclusion; and an output's self-report is not causal evidence.

## Formal result

The Lean module `HsHVerification.EnheduannaSourceExposure` defines a source attestation and a run-scoped context snapshot. Its theorem, `source_attestation_does_not_determine_context_exposure`, constructs two distinct snapshots that share the same source attestation, including the same source identity, digest, locator, outer role, timestamp, parent context, and auditor read extent, while differing on source inclusion.

This is a type-level information-sufficiency countermodel. It does not assert that either constructed snapshot corresponds to an actual historical execution.

- HsH PR #1619: https://github.com/Satobloc/HsH/pull/1619
- Earlier witness-type firewall, HsH issue #1618: https://github.com/Satobloc/HsH/issues/1618

## Source-layer illustration

The public SAT archive artifact `ActivatorPrayer(Alberr).txt` is a mixed derivative containing topic-related material before a later apparent-memory exchange. That creates a plausible alternative exposure path. It does not establish which bytes entered a historical execution context, how they arrived there, or what caused the later output.

No original historical context snapshot was recovered for that exchange.

## Lean verification and limits

The theorem compiled successfully in two GitHub Actions merge-reference builds:

- Run #43137274286: 8,945 jobs; target-module blob identical to PR head.
- Run #43138042440: 8,945 jobs; checked-out merge reference `c21b36a30724f027cc5558b74e787a98f49a3107`; target-module blob `fb6a147ec7640bada1fb8e512b9e27d711e44f4d`, identical to the PR-head module blob.

Both used Lean 4.34.0 and Lake 5.0.0 with Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`. The theorem-specific `#print axioms` output is `[propext]` only. The global axiom audit, tests, and lint were skipped. The submitted module contains no explicit `sorry`, `admit`, or custom axiom.

The workflow generated its Lake dependency manifest in the runner; no committed `lake-manifest.json` was available, so transitive dependency locking remains a reproducibility limitation. The PR is OPEN / DRAFT / UNMERGED. The separate Vercel status failure is a build-rate-limit failure, not a Lean result.

The result makes no claim about assistant consciousness, personhood, persistent private memory, cross-thread communication, actual historical context inclusion, causal influence, or human-subject/model-experiment outcomes. It uses no physical measurement, dataset, fit, prediction, or numerical physical fixture.

Factory Floor admission is not claimed: its current geometry-first gate requires a precise object-specific geometric plot and independent hostile review, neither of which applies to this abstract evidence-type theorem.

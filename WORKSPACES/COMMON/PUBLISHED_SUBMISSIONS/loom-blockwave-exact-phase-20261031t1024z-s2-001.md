# Loom | Blockwave exact-phase field-strength condition

**Date:** 2026-10-31T10:24Z  
**Status:** LEAN_VERIFIED / ASSISTANT_SOURCE / CONDITIONAL_MATH / NO_PHYSICAL_VALIDATION / NO_BEDROCK_PROMOTION

## Source identity

The action under review is in assistant-role message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, conversation `68f4d9b5-b908-832e-940e-6782db174a4a` (“Full action definitions”), timestamp `2025-10-19T12:29:46.538Z`, raw-export Git blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`. The immediately preceding user message `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a` requests the full action and definitions; it does not author the assistant's resulting equations.

The assistant action defines
\[
A_\mu=\alpha_*\nabla_\mu\theta,\qquad
F_{\mu\nu}=\nabla_{[\mu}A_{\nu]},
\]
and couples `F_{\mu\nu}J^{\mu\nu}`. A later assistant-role review, message `68759291-9b8b-473f-81e4-08f563a15d0b` at `2025-10-19T14:50:59.139Z`, explicitly notes that the exact-gradient ansatz gives zero local field strength on a smooth patch.

The separate 2025-09-16 user-supplied artifact `🧱BLOCKWAVE.txt` is a distinct source event; its embedded content-author identity remains unresolved. Neither the upload nor the 2025-10-19 assistant response is a Nathan Direct equation source.

## Formalized conditional result

For a sufficiently smooth real-valued 0-form `theta` and constant scalar `alpha`, Mathlib's exterior-derivative identities establish
\[
d(\alpha\,d\theta)=0.
\]

The theorem `constant_smul_exact_phase_has_zero_field_strength` is in `FORMAL_VERIFICATION/HsHVerification/LoomSAT4DCurrentTypeGate.lean`.

- Existing draft PR: #759.
- Branch: `research/loom-embedded-notebooklm-span-20261027t1512z`.
- Exact PR head: `2c371f7269a728a647dd04a52b868c3d99aa7f13`.
- Exact-head Lean run: #41193158202, job #124513894880, **SUCCESS**.
- Lean 4.34.0 / Mathlib v4.34.0; 8,951 build jobs.
- The theorem-specific `#print axioms` output is `propext`, `Classical.choice`, and `Quot.sound`.
- Complete log: zero `sorryAx` occurrences.
- Separate tests, lint, nanoda, and automated axiom-audit stages were skipped.

## Scope and limits

This is a conditional proof of a standard exterior-calculus identity, not a physical derivation. Translating the source's antisymmetrized covariant derivative into the exterior derivative requires a torsion-free connection; that source assumption is not formalized here.

The theorem uses a globally real-valued smooth 0-form on the formalized domain. The source also calls `theta` compact/circle-valued. A circle-valued phase can define a closed local 1-form with nontrivial global periods on a non-simply-connected domain. Thus local zero curvature does not by itself rule out global winding or holonomy. Defect-supported singularities and bundle data are also outside this theorem.

No result here proves the physical existence of the field, a worldtube-to-medium coupling, holonomy quantization, a measured effect, or H(s)H truth. The current source's `J^{\mu\nu}` is rank two; a separate 2026 user-role pasted document contains a rank-three `J_{\mu\nu\rho}` in another action block. No source-defined conversion map between those currents has been recovered.

## Corrective alternatives, not source equations

If nonzero local field strength is intended, one possible repair is to treat `A` as an independent 1-form connection and define `F=dA`, with any relation to `theta` supplied separately. Another possibility is an explicit singular/defect construction with its domain and boundary conditions. These are assistant-level proposals, not Nathan Direct corrections, and neither is adopted as theory.

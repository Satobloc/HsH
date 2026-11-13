# Addendum to HsH #1691: Blockwave local curvature versus global holonomy

**Date:** 2026-11-13  
**Prepared:** 2026-11-13T16:22Z, as a late reconciliation of nominal h808:s0.  
**Applies to:** Tern h808:s0 Lane 00 report, issue [#1691](https://github.com/Satobloc/HsH/issues/1691).  
**Classification:** source-fidelity and formalization-coverage amendment. No theory promotion.

## 1. Source attribution

The Blockwave definitions in the 2025-10-19 raw conversation **68f4d9b5-b908-832e-940e-6782db174a4a** occur in assistant message **121d607d-53e7-4b5a-8a7a-75d7e09deb3d**, following the user request **fa1e045d-a7ff-4dcf-8110-ae9fa555a54a** (“Can you give me the full action and definitions”). The definitions are therefore **assistant-authored reconstruction**, not Nathan Direct.

The repository derivative **DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt** is blob **ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d**; its first extant HsH commit is 2026-10-08T02:42:49Z. The raw assistant message predates that repository derivative.

The relevant assistant-authored definitions are:

\[
A_\mu(\theta)=\alpha_*\,\nabla_\mu\theta,
\qquad
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta).
\]

The action contains the local term \(\tfrac{g_h}{2}F_{\mu\nu}J^{\mu\nu}\), while the accompanying prose separately claims quantization through loop holonomy.

## 2. Conditional local geometry

On a smooth patch, if \(\theta\) has a smooth real-valued local lift, \(\alpha_*\) is constant, and the connection is torsion-free so antisymmetrized covariant differentiation agrees with the exterior derivative, then

\[
A=\alpha_*\,d\theta,
\qquad
F=dA=\alpha_*\,d^2\theta=0.
\]

Thus the displayed ansatz has **zero local curvature on smooth patches under those assumptions**. The local \(F_{\mu\nu}J^{\mu\nu}\) coupling consequently vanishes there.

This does not force global holonomy to vanish. A circle-valued phase may have local lifts whose derivatives define a globally closed but non-exact one-form. For winding number \(n\),

\[
\oint A=\alpha_*\oint d\theta=2\pi\alpha_* n.
\]

A period in \(2\pi\mathbb Z\) therefore requires an explicit normalization/units condition on \(\alpha_*\); compactness alone does not supply it.

The source has not specified how its global winding/holonomy observable enters the local \(F\cdot J\) action term. Nonzero local curvature would require additional structure such as singular/distributional defects, a varying coupling, torsion, or an independent connection. These are possible extensions, **not** premises established by the source.

## 3. Existing Lean formalization and actual CI

This result was already formalized in [Kestrel PR #1556](https://github.com/Satobloc/HsH/pull/1556), module **HsHVerification.BlockwaveCompactPhaseCurvature**, using Mathlib's **extDeriv_extDeriv** theorem. The source-critical note is already published and read back in [issue #1555](https://github.com/Satobloc/HsH/issues/1555); this addendum points to that work rather than duplicating it.

Actual Actions evidence: [run #42765114182](https://github.com/Satobloc/HsH/actions/runs/42765114182), job #129659662176, **SUCCESS**. The job checked out merge ref **dd22eefc669e8d66f11015caadd4a9427d5c4f63**, combining PR head **a27b2e745da3ca29b745db0831dae5e7a30545a6** with base **c7dc2c483f50ae03fc7a7c530829170135e18d92**. Lean 4.34.0 / Lake 5.0.0; full build completed 8,945 jobs and built the target module at 8,924/8,945.

The theorem-specific axiom report is **[propext, Classical.choice, Quot.sound]**. No **sorryAx** appears in the captured 607-line job log, but the separate global axiom audit was skipped. Tests, lint, and nanoda were also skipped. PR #1556 remains OPEN / DRAFT / UNMERGED. This is a successful **merge-reference build**, not exact-head-only or current-main integration.

The theorem proves only the local normed-space statement for a sufficiently smooth degree-zero form and constant scalar. It does not formalize global \(S^1\)-valued phase/winding, chart transitions on a curved manifold, holonomy integrals or normalization, defects, torsion, variable coupling, the source-to-exterior-derivative translation, or any physical premise.

## 4. Correction to the h808 crosswalk

The h808 report correctly classified the Blockwave action as assistant-generated and identified its unresolved current/worldsheet support map. Its formalization inventory omitted the already-existing PR #1556 and its completed CI result. This addendum corrects that inventory only; the report's centerline/worldtube/timesheet dimensional distinctions and normalization-branch findings remain unchanged.

No new Lean module, PR, branch, tool, numerical fixture, data-free calculation, physical calculation, CODATA scoring, fit, prediction, independent measurement, equation edit, or BEDROCK promotion was performed.

## 5. Next source-faithful question

Decide from source evidence whether the intended \(F\cdot J\) term is a local defect-curvature coupling or whether the intended quantized quantity is global holonomy/winding. Specify the phase domain, connection, \(\alpha_*\) normalization and current-support map before attempting a global formalization. Keep any corrected equation separate from the verbatim assistant-authored Blockwave source.

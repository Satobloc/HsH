# Blockwave compact-phase ansatz: source provenance and local-curvature check
**Date:** 2026-11-10  
**Classification:** source-critical mathematical note; assistant-generated equation under conditional analysis. Not Nathan Direct, not a physical validation, not a theory promotion.

## 1. Exact source custody

The relevant action block is in the HsH attachment `🧱BLOCKWAVE.txt`, Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`. Its raw source is conversation `68f4d9b5-b908-832e-940e-6782db174a4a`, JSON blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`.

- User message `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a`, 2025-10-19 12:29:41.119Z: “Can you give me the full action and definitions”.
- Assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, 2025-10-19 12:29:46.538Z: supplies the action and definitions below.

The relevant assistant-authored definitions are preserved verbatim:

```text
F_{\mu\nu}(\theta) \equiv \nabla_{[\mu} A_{\nu]}(\theta),
\qquad
A_\mu(\theta) \equiv \alpha_*\,\nabla_\mu\theta.
```

The same definitions paragraph says: “Because \(\theta\) is compact, \(\oint A\cdot d\ell\in 2\pi\mathbb{Z}\); this drives quantization by holonomy.” The action contains the local coupling \(\tfrac{g_h}{2}F_{\mu\nu}(\theta)J^{\mu\nu}\).

This is an assistant response to a request for an action, not a verbatim Nathan Direct equation. The separate `BLOCKWAVE EXTENSION .txt` blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce` and Blockwave Ideal Model blob `dd0631bc0b25c951dc5e1d6738280e08487b46b2` are distinct historical artifacts; neither should be silently substituted for this assistant-generated action.

## 2. Conditional differential-form check

Let \(\theta\) be smooth, let \(\alpha_*\) be constant, and use the torsion-free exterior derivative (equivalently, a torsion-free Levi-Civita connection). Then

\[
A=\alpha_*\,d\theta,
\qquad
F=dA=\alpha_*\,d^2\theta=0.
\]

Thus the displayed ansatz has zero local curvature on every smooth patch under those assumptions. The local term \(F_{\mu\nu}J^{\mu\nu}\) consequently vanishes there.

Compactness does not by itself create nonzero local curvature. For a circle-valued phase, \(d\theta\) can be globally closed but not globally exact; winding can therefore produce nonzero periods while local curvature remains zero:

\[
\oint A=\alpha_*\oint d\theta=2\pi\alpha_* n,
\qquad n\in\mathbb{Z}.
\]

The stronger claim \(\oint A\in2\pi\mathbb{Z}\) requires a normalization of \(\alpha_*\) (or an explicit convention absorbing it). Compactness alone does not establish that normalization.

A nonzero local \(F\) would require additional structure, for example a singular/defect contribution, a nontrivial connection not globally equal to \(\alpha_*d\theta\), a varying coupling (which contributes \(d\alpha_*\wedge d\theta\)), or another explicitly defined field. Those possibilities are not supplied by the displayed two-line ansatz itself.

## 3. What is and is not established

Established conditionally:
- The assistant's written definition makes \(A\) an exact one-form locally when \(\theta\) is smooth and \(\alpha_*\) is constant.
- Its exterior derivative is then zero.
- Global winding and local curvature are different observables and must not be conflated.

Not established:
- That the broader Blockwave proposal is false.
- That the intended model excludes defects, patchwise connections, or additional fields.
- That the current \(J^{\mu\nu}\) has a nonzero local coupling in the smooth constant-coupling sector.
- Any physical prediction, fit, measurement, or empirical validation.

The appropriate source-faithful next step is to specify whether the intended mechanism is global holonomy, defect-supported curvature, or an independent connection, then define its domain, regularity, normalization, support and coupling before deriving dynamics.

## 4. Formalization status

The clean proof target is \(d(\alpha_*d\theta)=0\) under explicit smoothness and constant-coupling assumptions. No new Lean module or build was created in this review. The current runtime has no local `lean` or `lake` executable, and the inspected existing HsH PRs do not formalize this Blockwave statement. This note is therefore a conditional mathematical check, not a Lean-verified result.

A future Lean proof should encode the exact differential-form statement and its assumptions, then run against a pinned Lean 4/Mathlib checkout. Even a successful kernel check would establish only that formalized statement, not the source translation or physical premises.

## 5. Boundary with the existing source-fidelity work

The existing θ4 source audit is already documented in [issue #1473](https://github.com/Satobloc/HsH/issues/1473), and the GR–string-theory/worldtube–timesheet source-fidelity cluster in [issue #1554](https://github.com/Satobloc/HsH/issues/1554). This note does not duplicate those audits. It isolates the assistant-generated Blockwave \(A\)-to-\(F\) definition and the conditional local-curvature consequence.

**Disposition:** retain the assistant equations verbatim and separately; do not promote them to Nathan Direct or to a validated Blockwave law.
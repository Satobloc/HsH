# Source-fidelity correction: pasted assistant mathematics inside a user-role message

## Scope and provenance

This note audits one source-attribution trap in the raw conversation **Meridian Minkowski Ring Analysis**.

- Conversation ID: `6ad7e9c0-e8a0-83ea-80a1-4d502522e441`
- Raw JSON blob SHA-1: `56a84cb85d5c386efa4ea11d322d11e95e2c7703`
- Raw message: `df68cd5f-3c9a-4f1e-a864-4aa65b027f30`
- Message role/time: `user`, 2026-10-20T22:22:53.355Z

The message's direct user-authored wrapper asks the Meridian continuation to resume and supplies a pasted report. Inside that report are the equations

\[
D_{\rm rotating}(t)=2R,\qquad
D_{\rm pulsating}(t)=2R|\cos(t/R)|,
\]

and a claimed common projected diameter. The pasted report calls these exact solutions of the same ideal relativistic-string equations, but it supplies no equations of motion, gauge, boundary conditions, or originating assistant-message ID. The original assistant thread was not recovered.

**Attribution rule:** the wrapper is Nathan Direct; the embedded report and its equations are not thereby Nathan Direct. Keep them classified as pasted LLM-derived material of unresolved provenance, not as original SAT equations or independently verified string solutions.

## Direct geometry versus assistant reconstruction

A later direct user message in the same conversation (`c1b42229-00a9-4119-aac3-cefa6cb97157`, 2026-10-20T23:34:44.617Z) describes a Donut/Cruller working hypothesis: internal rotation, twisted filaments, optional “bridges/Kerr singularities” terminology, and a proposed relation between rotation and the birth of a worldtube/particle. The message is exploratory; it supplies no metric, material-frame law, mass/energy functional, or rotation-to-birth map.

An assistant response (`093fa6c1-2651-45a5-9cac-1611456e20d1`, 2026-10-20T23:46:25.667Z) supplies two separate constructions:

1. A one-dimensional stretched/rotating curve \(X(s)\subset\mathbb R^4\), with a trace-zero linear generator. Its volume-preserving-flow calculation is a kinematic construction, not a four-dimensional worldtube.
2. A separate four-dimensional region
   \[
   W=\{(s,x,y,z):(x^2-s)^2+y^2+z^2\leq1\},
   \]
   whose three-dimensional slices pinch at \(s=1\) and split into two components for \(s>1\).

The second construction is a mathematically coherent toy model of slice-connectivity change. At the pinch, the defining function has nonzero gradient, so the full boundary can remain regular. It does **not** establish physical particle creation. The assistant supplies no map from the curve \(X(s)\) to the region \(W\), no material-frame transport, and no relation between internal rotation phase and the slice parameter \(s\).

## Missing maps

A source-faithful construction would need a typed tubular embedding, for example

\[
\Gamma:S^1_{\rm rot}\times D^3_\epsilon\to W^4\subset M^4,
\qquad \Gamma(\phi,0)=X(\phi),
\]

plus a transverse/material frame and a readout map from the four-dimensional region to its three-dimensional sections. This is a required-map proposal, not a recovered Nathan equation.

The direct user later described “expanding-Minkowski geometry” and explicitly called the curvature/acceleration identification a **working hypothesis** (`f658b2db-32f0-45cd-828b-140691cc9afb`, 2026-10-20T23:53:30.041Z). Intrinsic curvature, extrinsic curvature, connection curvature, and kinematic acceleration must remain distinct until the metric and maps are defined.

## Formal status

The existing Lean PR #873 contains a generic factorization theorem: a deterministic map through one projection exists exactly when the target projection is constant on the source projection's fibers. Its successful CI run #41585887441 is a shared proof source, not independent corroboration across worker reports. It does not establish the physical projections needed here.

No new Lean module, physical calculation, measured-data fit, CODATA comparison, or theory promotion was performed. The \(X(s)\)/\(W\) constructions remain assistant proposals.

## Related records

- [Issue #812: Donut intersection fidelity](https://github.com/Satobloc/HsH/issues/812)
- [Issue #1148: Klein surface-map contract](https://github.com/Satobloc/HsH/issues/1148)
- [Issue #1248: source-fidelity record](https://github.com/Satobloc/HsH/issues/1248)
- [Full Aster source-role audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ASTER/2026-11-03T0700Z_USER_ROLE_PASTE_ATTRIBUTION_AUDIT.md)

## Next cursor

Recover the originating assistant thread for the rotating/pulsating equations. If unavailable, retain them as an unverified LLM artifact. Then define and test the rotation-to-centerline, centerline-to-worldtube, and worldtube-to-slice maps separately before claiming that a rotation produces a physical particle/worldtube.

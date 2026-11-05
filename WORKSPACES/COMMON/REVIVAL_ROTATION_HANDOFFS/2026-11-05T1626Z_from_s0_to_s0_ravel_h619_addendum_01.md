# Optional source-fidelity addendum for Ravel h619:s0

**OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_REQUESTED.**

This packet is addressed to Ravel's next enabled same-identity :00 appearance, h619:s0. The deterministic next ring label from Mercer h615:s0 is Ravel, but the immediate s1 phase is disabled. No disabled task was enabled or invoked.

## Public source-fidelity artifact

- Corrected public report: issue #1393.
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-core-pack-superhelix-fidelity-20261105t1500z-s0-002-formatfix.md`
- SHA-256: `e8920f33dda1bd30c1bd7c83079200a3ae60c3fdb6af643f00764912b8452cd0`
- Publisher run: `42063957662`, completed success.
- Publisher commit: `59e7348b22a2b50092e7066f925a99c6ac54f75a`
- Exact issue-body / artifact readback: PASS; no placeholder markers remain.

Issue #1392 is preserved as the original publication, but its inline-code delimiters were accidentally left as literal placeholders. A comment on #1392 points to the formatting-corrected #1393. The research content is unchanged; #1393 is the readable canonical rendering.

## High-value source findings

1. The April 21 2026 Curve Composition System raw conversation (blob `e9ec2076ca5313676f5806db1c48b51511302b7d`) contains the Core Pack nested-product schema:
   [
   X(s)=sum_{k=1}^{N}R_kH_*(k,s),qquad
   H_*(k,s)=f_k^*(s)prod_{j=1}^{k-1}H_*(j,s),quad
   f_k^*in{sin,cos}.
   ]
2. The carried Core Pack L_SAT displays `dλ/dH`. A later assistant summary reverses it to `dH/dλ`; a user-role-carried summary also has the reversed form, but embedded authorship is unresolved. Preserve both.
3. Nathan Direct conceptual statements identify the intended SAT primitive as a 4D Nth-order superhelical curve/worldline; allowed transformations are superhelical oscillations or linear deflections. The UI is an imaginary measurement space, not the actual universe.
4. The Particle Zoo PDF has the most explicit four-component nested-product candidate, but it is marked tentative and its extraction metadata says Ravel / ChatGPT. It is not authenticated Nathan Direct and introduces many independent amplitudes, frequencies, and phases.
5. Meridian Free Build direct geometry uses `w=ct`, describes the 3D representation as an intersection with an interacting time bulk, and distinguishes coordinate spatial bending from intrinsic 4D curvature. The candidate Particle Zoo `w(s)` is oscillatory. No coordinate map is supplied.
6. The October 2026 H(s)H startup material treats the old 4D worldline formalization as historical/revisable. No worldline-to-finite-core-worldtube map is recovered.
7. A direct parameter constraint says no independent parameters, with one constant propagated to outputs in terms of `δ_lattice`. No reduction map from the Particle Zoo parameters or the assistant's operationalized L_total is present.

## Geometry map still required

```text
Core Pack X(s), H_*(k,s)
   -> component expansion map: NOT DEFINED
candidate 4D worldline γ(s)
   -> worldline-to-worldtube sweep/thickening map: NOT DEFINED
H(s)H finite-core worldtube W^4
   -> intersection with interacting time bulk Σ_t^3: NOT DEFINED
I_t = W^4 ∩ Σ_t^3
   -> instantiation/representation map: NOT DEFINED
3D represented object
```

The direct source is underspecified in function types, base cases, coordinate order, metric signature, parameter domains, boundary conditions, and composition laws. Assistant reconstructions add unsupported parameter freedom and sometimes replace intersection with projection. The critique is symmetric.

## Formalization boundary

No new Lean module or PR was created. Existing PRs #766, #1076, #1098 and conditional geometry work in #262/#1281 were inspected as separate formalizations. They do not establish the missing physical maps. No physical calculation, CODATA scoring, empirical validation, Factory Floor admission, paper edit, or theory promotion occurred.

## Suggested next cursor

- Find a primary Nathan-authored source that defines all four components of the Nth-order superhelix.
- Determine whether the Particle Zoo equation was approved, corrected, or superseded.
- Type the Core Pack recursion, then provide an explicit component expansion map.
- Resolve the role of `w=ct` versus oscillatory `w(s)`.
- Define the worldline-to-worldtube sweep, the embedding of `Σ_t^3`, transversality conditions, and the intersection/instantiation maps.
- Only then formalize and run Lean 4/Mathlib on source-faithful propositions.

**Delivery boundary:** repository handoff only. No authenticated Ravel thread delivery, recipient consumption, or acknowledgment is claimed.

# Amendment 01 — publication verification and glossary
**Parent receipt:** `2026-11-07T2200Z_s0_aldus.md`  
**Run key:** `REVROT3-19-20261011:670:s0`

## Publication status: PUBLISHED_VERIFIED

- Issue #1461 opened by `Satobloc` with the exact four-key `hsh-publish-v1` envelope.
- Publisher workflow run: #42421956282, completed **success**.
- Publisher comment: #6714031127.
- Artifact commit: `11256d56ee6eabc543ac65528cbe07ca0271cfc0`.
- Artifact path: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-vector-timesheet-fiber-compatibility-20261107t2200z-001.md`.
- Artifact blob SHA-1: `92d7e21eaedc75ed7618be6aa965db69ea4d421e`.
- SHA-256: `bc0b284f31000e1624b637c4d226c8c49b9842ca49655754bbd508b6c59b7bb2`.
- Independent readback: issue payload content and artifact content compare exactly (`exactContentMatch=true)); publisher comment independently reports the same SHA-256 and readback verified.
- Final publication state: **PUBLISHED_VERIFIED**. No retry or duplicate issue.

## Compact glossary

| Term | Stable use in this audit |
|---|---|
| `γ` | The historical SAT4D O1 one-parameter centerline curve. Do not silently identify it with a finite four-dimensional support. |
| `W` | Later finite-core/worldtube support. Its map from `γ` is not specified in the source equations. |
| `Σ_t` | The direct-source moving three-dimensional time surface/slice/bulk in four-dimensional setting. It is not a two-dimensional sheet. |
| `Σ_t^(h)` | An assistant/compilation finite-thickness band candidate, not a role-authenticated direct equation. |
| `R_α` | A proposed representation map at allocation `α`; no physical instance is yet defined. |
| `T_{β←α}` | A conversion map between representations; existence requires target constancy on source fibers. |
| `Fib(R_α)` | The equivalence classes of underlying states collapsed by `R_α`. |
| `O` | A common observable/readout map required before observational equivalence can be claimed. |
| `θ` | The 2025 direct-source intersection-angle proposal. Not automatically the compact phase field `θ` in Blockwave. |
| `κ` | Curvature. For a planar arclength-parameterized curve, `κ=dθ/ds`; it is not the angle itself. |
| `J^{μν}` | The rank-two current in the historical Blockwave assistant reconstruction, not a demonstrated representation of `W`. |
| `hΣ`, `a`, `ε` | Keep slab thickness, core scale, and assistant-introduced epsilon distinct unless a source-defined map relates them. |

## Mapping diagram

```text
                      common admissible state X
                         /              \
                    R_alpha            R_beta
                      |                  |
                      v                  v
                    Y_alpha --T(beta<-alpha)--> Y_beta
                      |                        |
                     O_alpha                  O_beta
                       \                      /
                        \---- shared O ------/
                              observables

T exists iff R_beta is constant on every fiber of R_alpha.
A reverse map needs the reverse condition; isometry needs metrics.
```

## Original versus translated propositions

- **Nathan Direct (2025):** asks whether trajectory-shape and time-field-distortion allocations can be varied and converted; asks whether the incidence angle is curvature. These are hypotheses/questions.
- **Historical assistant:** upgrades them to clean mathematical equivalence, isometry, curvature pre-geometry, and an Einstein-tensor-from-angle-sum claim. These lack the required maps, metric, derivative, tensor-valued aggregation, and observable-preservation conditions.
- **Historical SAT4D O1:** one-dimensional `γ` with an action and tension potential; no explicit conversion family.
- **Historical Blockwave assistant:** rank-two `J^{μν}` and compact phase `θ`; no source-defined map to the direct incidence angle or later finite core.

## Discrepancy ledger summary

1. Direct conversion question promoted to an isometry claim without maps or metrics.
2. Angle-curvature question promoted to identity without a derivative/metric construction.
3. Scalar angle accumulation cannot produce rank-two `G_{μν}` without a typed tensor aggregation.
4. Historical one-dimensional curve, later finite core, and Blockwave two-form current remain different object types without thickening/projection maps.
5. Direct incidence angle and Blockwave compact phase share notation only.
6. Mixed toroid-vortex transcript remains role-unauthenticated.

## Next deeper cursor

Define `X`, the actual `R_α` family, fibers, observables and admissibility conditions. Then test pairwise factorization, inverse maps, and composition. Do not claim physical equivalence until these are instantiated and source-grounded.

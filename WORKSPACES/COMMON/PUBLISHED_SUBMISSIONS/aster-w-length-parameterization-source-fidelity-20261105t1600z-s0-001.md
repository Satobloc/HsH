# Source-fidelity addendum: the w-length parameter in the Klein-fabric block-universe passage

**Additive correction to the existing geometry cross-read in issue #1191.** This is a narrow source/translation correction, not a replacement geometry report and not a new physical claim.

## Primary witness

Conversation: `6a8eacca-c470-83ea-af92-8fb8df194de9`, “CALDER [Construction Story Retelling]”.

Raw HsH export blob: `92454acdaad701193e2a0c6cf64a7d7b70a03dbb` (2,207 mapping nodes; 479 nodes on the recorded current-node ancestry).

- Nathan Direct message `5b46e4d9-a51e-4281-904b-f74e41702f1b`, 2026-08-26T23:51:14.871Z.
- Historical assistant response `3065cc30-1693-4ee6-b342-e82e8528e6e5`, 2026-08-26T23:51:19.390Z.

## Original proposition versus translation

The direct message describes temporal persistence as a w-length in the block-universe representation, says that length is “temporal duration times c in meters,” and gives the conceptual rule “a point is a line, a bulk of any nature is a tube.”

The assistant response translates this into `Δw ~ c Δτ` and then maps a point-particle history to a worldline/worldtube and an extended bulk history to a worldtube.

The broad point-to-history translation is reasonable as a conditional standard reconstruction. The parameter `τ`, however, is not defined in the direct source. In relativistic notation it commonly denotes proper time, but the source only says “temporal duration”; it does not identify that duration as proper time, coordinate time, or a parameter measured in a specified frame. Thus `Δw ~ c Δτ` is an assistant-added parameterization, not a verbatim Nathan Direct equation and not yet source-authorized.

A source-faithful record should retain the verbal relation “w-length = c times temporal duration” until the time parameter and observer/frame conditions are defined. Do not silently promote `τ` to proper time. Likewise, keep the two object types separate: point support → worldline; extended spatial support → worldtube. The slash construction “worldline/worldtube” obscures that distinction.

## Symmetric critique

**Nathan Direct limitation:** the same message says temporal and spatial directions differ “only in orientation” and describes the bridge's timelike/spacelike character in deliberately unconventional language. That is not yet a typed metric statement. In an ordinary Lorentzian metric, causal character is not exchanged by a mere orientation change. The source needs to say whether it is making a pre-metric/positive-definite proposal, using a separate Lorentzian control structure, or asserting a different metric map.

**Assistant limitation:** the response correctly flags the ordinary Lorentzian causal-class issue and should retain that caution. But its insertion of `τ` is unsupported by the direct message, and its “worldline/worldtube” shorthand blurs the point-versus-bulk distinction. Its further statement that the particle's history is the bridge's long axis is a reconstruction, not a separately sourced equation.

## Minimal mapping diagram

```text
source temporal duration (parameter/frame not specified)
                 |
                 | multiply by c, as described directly
                 v
historical Minkowski w-length
                 |
                 | ?  no conversion map supplied
                 v
later native convention: c w = t, metric ++++

point support --------history--------> worldline
extended spatial bulk -history-------> worldtube
                 (conditional object typing)
```

The later native `c w = t`, positive-definite convention is a separate direct-source notation. No conversion to the earlier Minkowski w-length has been recovered. The two must remain separate.

## Existing formalization boundary

- HsH PR #873 contains `WorldtubeInertiaCoordinate`; exact-head Lean CI run #41111252893 succeeded. The theorem is conditional algebra from F=ma and an assumed a=c²κ. It does not derive the curvature premise, determine the time parameter, or prove a physical worldtube/ER-bridge identification.
- PR #1133's `RavelCarrierSheetDimensionGate` passed exact-head CI run #41263681149. It formalizes a set-level history/projection construction, not the physical embedding or this w-parameter map.
- PR #1153's `KleinOrientationKernel` passed exact-head CI run #41210929564. It proves an abstract orientation-kernel statement, not the physical Klein-like fabric.

No new Lean theorem is added here because the source still lacks a typed time parameter and metric/conversion map. No physical calculation, CODATA scoring, observational validation, or theory promotion is included.

## Next deeper cursor

1. Define the temporal-duration parameter and observer/frame conditions in the historical Minkowski w-description.
2. Define the native `c w = t`, `++++` convention independently, then supply an explicit conversion map only if the source warrants one.
3. Specify the spatial support dimension of the particle/core and the actual history/intersection map before identifying a worldline, worldtube, or cross-section.
4. Keep the global Klein-like fabric, local dual-shell realization, and finite-core nesting as separate objects until projection and composition maps are supplied.

This addendum supplements, but does not replace, issue #1191 and its existing source-fidelity cross-read.

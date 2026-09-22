# Comptroller bounded incorporation test — RUN 099 frame-rotation interface invariance

**Branch:** `HAGALAZ-SOLVER-UNIFICATION` + supporting `LAB-SBS-001`  
**Date:** 2026-09-22  
**Operator:** Tern / Comptroller  
**Switch:** `FEED_FORWARD` / bounded generalist fallback  
**Input:** Meridian RUN 098 shared 4D primitive fixture  
**Quarantine:** none consulted  
**Status:** `PASS — CHANNEL INDEPENDENCE CONTROL`

## Signal observed

RUN 098 advanced the RUN 097 `PARTIAL_INTERFACE` result to an `INCORPORATED_CONTROL`: Three-Spheres and ᚼ consume the same explicitly declared primitive 4D dataset while deriving different typed channels. RUN 098 left one clean discriminating cursor: rotate one supplied frame while holding centers/radii fixed and test whether Three-Spheres stays invariant while the ᚼ relative-frame channel changes predictably.

This is higher-value than another routing-document edit because it tests actual downstream behavior at the active edge.

## Declared perturbation

Retain the RUN 098 centers, radii, control plane, and frames except `F2`:

```text
R = 1
c1 = (-1/2, 0,         0, 0)
c2 = (+1/2, 0,         0, 0)
c3 = (0,    sqrt(3)/2, 0, 0)
F1 = I4
F3 = I4
F2 = R_xw(theta)
theta = pi/7
```

with the single-plane SO(4) rotation

```text
R_xw(theta) =
[ cos(theta)  0  0  -sin(theta) ]
[ 0           1  0   0          ]
[ 0           0  1   0          ]
[ sin(theta)  0  0   cos(theta) ]
```

(sign convention is declared here; the invariance result does not depend on choosing the opposite orientation).

## Independent Three-Spheres channel

The Three-Spheres component consumes only the projected center geometry and common sphere radius. None of those primitive inputs changed. Therefore its typed payload is unchanged from RUN 098:

```text
geometry          = CARRIER_PRESENT
numerics          = CERTIFIED
G                 = 2/3
r_c               = 1/sqrt(3)
kappa_2(K)        = 3
sigma_min(K)      = 1/2
relative_residual = 0
circumcenter_P    = (0,1/(2 sqrt(3)))
```

No frame datum is injected into this solver-specific channel.

## Independent ᚼ framed-state channel

Using RUN 091/RUN 098 general relative-state typing `Q_ij = F_i^T F_j`:

```text
Q_12 = I^T R_xw(theta) = R_xw(theta)
Q_23 = R_xw(theta)^T I = R_xw(-theta) = Q_12^-1
Q_31 = I
```

Hence the closed frame loop remains

```text
Q_12 Q_23 Q_31
= R_xw(theta) R_xw(-theta) I
= I4.
```

The center differences and scale ratios are also unchanged because centers/radii were held fixed.

For `theta = pi/7`, the ᚼ channel is nontrivial locally (`Q_12 != I`, `Q_23 != I`) while the Three-Spheres payload is exactly the same control payload.

## CommonRecord delta

Relative to RUN 098, only the supplied frame and the derived relative-frame entries change:

```yaml
primitive_state:
  frames_SO4: [I4, R_xw(pi/7), I4]

external_solver_channels:
  three_spheres:
    disposition: UNCHANGED

hagalaz_general_relative_channels:
  S1_to_S2: {Q_SO4: R_xw(pi/7)}
  S2_to_S3: {Q_SO4: R_xw(-pi/7)}
  S3_to_S1: {Q_SO4: I4}
  frame_loop_closure: exact

interface_test:
  frame_perturbation_visible_in_three_spheres: false
  frame_perturbation_visible_in_hagalaz_relative_state: true
  disposition: PASS
```

## Result

`PASS` for the declared static interface-invariance control.

The common primitive layer is not leaking supplied frame data into the Three-Spheres carrier channel, while the ᚼ relative-frame channel responds exactly where its typing says it should. This is stronger behavioral incorporation evidence than RUN 097's envelope traversal alone and advances RUN 098's `INCORPORATED_CONTROL` without claiming a dynamic transport result.

This does **not** test a connection or path-ordered holonomy. The frame loop is algebraically closed because the fixture supplies three static frames and the relative matrices telescope. No physical or dynamical inference follows from that identity.

## Recommendation disposition

RUN 098 next-cursor recommendation: **TESTED — PASS**.

## Durable boundary / next cursor

The next discriminating operation should activate a channel that cannot be reduced to static endpoint-frame telescoping: supply a declared connection/history or other explicitly typed transport input on a controlled path, while keeping the shared primitive/source boundary explicit. Then test whether the common record preserves the distinction between endpoint relative frame and path-dependent transport/holonomy.

Return route: `HAGALAZ-SOLVER-UNIFICATION` → Meridian current construction sequence. No Nathan action required.

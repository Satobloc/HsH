# Mercer RUN 100 — active-edge reconciliation after Three-Spheres incorporation

**Branch/task:** `HAGALAZ-SOLVER-UNIFICATION` + supporting `LAB-SBS-001`  
**Date:** 2026-09-22  
**Operator:** Mercer / generalist recurrence  
**Status:** DURABLE ROUTING RECONCILIATION  
**Quarantine:** none consulted

## Signal

The central `TASK_BRANCH_GRAPH.json` is materially behind the current solver-unification state. It still routes the next cursor to the first real Three-Spheres typed-output traversal through the common ᚼ interface. That traversal has already happened and has subsequently advanced through two additional bounded tests.

## Verified progression

1. **RUN 097 — `PARTIAL_INTERFACE`.** A real regression-tested Three-Spheres carrier payload traversed the common envelope. Solver-specific carrier geometry and numerical certification survived intact; unavailable Hagalaz frame/step/transport fields remained explicitly missing rather than receiving synthetic defaults.
2. **RUN 098 — `INCORPORATED_CONTROL`.** One explicit shared primitive 4D fixture supplied centers, radii, a control plane, and SO(4) frames. Three-Spheres and Hagalaz independently consumed the same declared primitive dataset and emitted distinct typed channels without deriving one solver's observables from the other.
3. **RUN 099 — `PASS — CHANNEL INDEPENDENCE CONTROL`.** Rotating only the supplied `F2` frame by a declared `R_xw(pi/7)` left the Three-Spheres carrier payload invariant while the Hagalaz relative-frame channel changed predictably: `Q_12=R_xw(theta)`, `Q_23=R_xw(-theta)`, `Q_31=I4`. The static frame loop telescoped to identity; this was explicitly not treated as a transport/holonomy result.

## Routing consequence

The old graph cursor — “run one real Three-Spheres typed output through the current ᚼ common solver/interface state” — is satisfied and should not be repeated.

The current active-edge cursor is the RUN 099 durable boundary:

> Activate a channel that cannot collapse to static endpoint-frame telescoping. Supply a declared connection/history or other explicitly typed transport input on a controlled path, keep the shared primitive/source boundary explicit, and test whether the common record preserves the distinction between endpoint relative frame and path-dependent transport/holonomy.

The result should be typed conservatively; a successful control is evidence for interface behavior, not SAT/H(s)H derivation or physical validation.

## Recommended central-state patch

For `HAGALAZ-SOLVER-UNIFICATION`:

- update `last_material_state` to include RUN 097 `PARTIAL_INTERFACE`, RUN 098 `INCORPORATED_CONTROL`, and RUN 099 channel-independence `PASS`;
- replace the stale Three-Spheres-envelope cursor with the transport/history discrimination cursor above;
- retain `status: active` and project-highest-priority routing.

For `LAB-SBS-001`:

- record that its first external-component incorporation dependency has been exercised through shared-primitive and frame-perturbation controls;
- do not mark the lab complete, because the paired reproducible comparison/report exit criterion remains broader than these interface controls.

## Durable boundary

This note is the continuity packet for the next worker or Comptroller pass. Do not rerun RUN 097 merely because `TASK_BRANCH_GRAPH.json` has not yet been patched.

No Nathan action required.

# Meridian sandbox — curvature gate for ᚼ transport

**Date:** 2026-10-06  
**Status:** SILOED PLAYGROUND / not canonical theory

## Sources actually read this run

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Donut canon.txt` — complete file as returned by GitHub. Recovered the historical correction from pointwise frame mismatch to a declared connection with nonzero curvature, path-ordered holonomy, and relative holonomy as the coupling object.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt` — first ~1000 lines requested; read returned contiguous material on nested holonomy, transport/memory, symplectic framing, and the ∮ᚼ motif. Used only after the internal construction.
- Common front door, Reference Desk, current workflow orientation, task graph, symbol/toolbox controls were reviewed first. HSH_RESOURCES remained supporting/reference machinery; PRIOR_ART was not opened.

## Recovered construction

Historical Donut canon explicitly repairs a local-frame-difference toy into:

```
connection A -> curvature F=dA+A∧A -> path-ordered holonomy -> relative holonomy -> output dynamics
```

This independently matches the obstruction found in Meridian's preceding run: a globally defined closed frame with connection manufactured only as its Maurer-Cartan derivative telescopes to identity.

## New sandbox construction: curvature gate

Use LOCAL notation only. Let

```math
A_x = 0.8 J_{01}, \qquad A_y = 0.6 J_{12}.
```

For this constant SO(4) connection,

```math
F_{xy}=\partial_x A_y-\partial_y A_x+[A_x,A_y]
      =[A_x,A_y]
      =0.48 J_{02}
```

(up to the local generator sign convention).

For a square of side `h`, compute the Wilson/transport loop

```math
W(h)=e^{hA_x}e^{hA_y}e^{-hA_x}e^{-hA_y}.
```

Numerical sweep `h=10^{-3}...10^{-0.15}` gave:

- `||W-I||_F ∝ h^1.99997967`;
- `||log(W)/h² - F_xy||_F ∝ h^0.99996772`;
- at `h=0.01`, `||W-I||_F = 6.7881968e-5`;
- at `h=0.01`, curvature-estimator error `=3.3940901e-3`.

Pure-frame control used

```math
G(x,y)=e^{xA_x}e^{yA_y}
```

and exact edge transports `G(p_{k+1})G(p_k)^{-1}`. Its maximum loop defect over the same sweep was `5.09e-16`, i.e. floating zero, despite noncommuting frame motion.

## Inference

A common ᚼ transport solver should not accept "moving frame" as evidence of intrinsic holonomy. It should type separately:

1. frame/director field;
2. declared connection;
3. local curvature diagnostic;
4. path-ordered transport;
5. closed-loop holonomy/conjugacy readout.

Candidate **curvature gate**:

- pure-frame/Maurer-Cartan control must return zero curvature and identity closed transport;
- independently declared connection must recover its local curvature from shrinking plaquettes;
- loop defect must scale with enclosed area at leading order;
- global SO(4) basis changes may conjugate raw matrices but must preserve conjugacy invariants.

## Failure condition

This test is local and finite-dimensional. Vanishing curvature on a simply connected patch implies locally pure-gauge behavior, but flat connections can still carry global holonomy on non-simply-connected domains or with nontrivial patch/transition data. Therefore the gate must not equate `F=0` with "all global holonomy impossible."

## Next solver test

Extend RUN 101 without changing its primitive centers/directors:

- Channel A: exact frame-derived Maurer-Cartan connection. Must telescope to identity.
- Channel B: independently declared SO(4) connection with controlled nonzero curvature. Shrinking plaquettes must recover the injected curvature and a finite loop must return nontrivial transport.
- Apply one global SO(4) gauge change to both. Compare only gauge-safe conjugacy/curvature norms.
- Then repeat on a non-simply-connected carrier to test the flat-but-globally-nontrivial exception.

This is a behavioral discriminator for the active HAGALAZ-SOLVER-UNIFICATION edge, not a claim that the chosen connection is physical.

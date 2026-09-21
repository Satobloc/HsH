# Meridian handoff — RUN 093 helical ruler / single-carrier torus branch

**Date:** 2026-09-21  
**Branch/task:** HAGALAZ-SOLVER-UNIFICATION  
**Status:** durable sandbox boundary reached  
**Nathan Direct:** current conversation INGESTED  
**Quarantine:** none consulted

## Material result

A circular helix supplies an exact per-closure ruler:

```text
A_N = N p
L_N = N sqrt((2πR)^2 + p^2)
χ = p/(2πR)
```

so:

```text
axis advance per closure = p
path length per closure  = sqrt((2πR)^2+p^2)
closure density          = 1/p
```

Under strict similarity `R->μR`, `p->μp`, the dimensionless calibration `χ` is invariant while the per-rung lengths scale by `μ`.

For nonuniform/nested structures, use finite stabilization of

```text
p_bar(N)=A_N/N
χ_N=(Σp_j)/(Σ2πR_j)
```

rather than requiring literal `N=∞`.

## Hagalaz relation

Use closure phase as a candidate integration coordinate for the local eight-channel Hagalaz generator. Per-rung ruler quantities become integrated outputs, not additional arbitrary coordinates.

This supplies a possible hierarchy:

```text
L0 local generator
L1 one-closure finite transform
L2 many-closure ruler / asymptotic density
L3 global closed/recurrent carrier class + true holonomy
```

## New speculative branch

Nathan introduced a possible single-carrier picture: something toroidal/twisted-toroidal and structurally reminiscent of a one-electron-universe idea, with electron-like coils and quark-like states potentially differing by local deformation/jamming.

Recorded only as SPECULATIVE model architecture:

```text
one global carrier Γ
+ local framed/deformation/jam state
-> different local readout classes
```

No particle identification is claimed.

## Geodesic guardrail

A constant-slope `(m,n)` winding on an embedded ring torus is closed for integer winding numbers but is **not automatically a geodesic** of the induced torus metric.

The reference diagnostic explicitly computes a torus geodesic-equation residual so topology/closure cannot be mistaken for metric geodesicity.

## Artifacts

- `WORKSPACES/MERIDIAN/SANDBOX/RUN_093_HELICAL_RULER_SINGLE_CARRIER_TORUS_V01.md`
- `WORKSPACES/MERIDIAN/SANDBOX/helical_ruler_diagnostic_v01.py`

## Next cursor

1. run the helix ruler diagnostic against sampled ordinary and nonuniform helices;
2. add closure detection rather than supplying rung phase externally;
3. feed closed `(m,n)` toroidal windings into the actual Hagalaz frame-transport integrator;
4. compute true closed-path frame holonomy separately from winding closure;
5. only then test whether contact/jamming functionals generate stable local state classes.

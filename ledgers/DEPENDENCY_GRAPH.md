# H(s)H Dependency Graph

This is an auditable construction graph, not a narrative of completed results.
An exact result inside an assumed model does not validate the model-selection edge.

## Active reconstruction chain

```text
empirical Minkowski elements
  -> radial/UI construction
  -> configuration geometry
  -> intersection carrier
  -> framed finite tube
  -> transport and deformation
  -> nested morphology
  -> Interbraid / Electrogravity
  -> inherited-domain readout
```

## Registered edges

### EDGE-0001 — Symmetric sphere configuration to common carrier

- **From:** Three equal Euclidean 3-sphere constraints in `R4`, with equilateral
  center geometry.
- **To:** A regular common `S1` carrier.
- **Equation:** `EQ-0001`.
- **Mathematical status:** `STD/DERIVED` for the stated Euclidean configuration.
  `SPHERECHECKQC.txt` has been read completely and its radius, singular-value,
  rank-loss, and velocity-decomposition identities independently reconstructed.
- **Framework status:** `OPEN`. No upstream H(s)H argument currently selects this
  configuration.
- **Blocked next edge:** `intersection carrier -> framed finite tube`; v0.1 lines
  95–101 explicitly list Bishop-frame finite-tube lifting as future work.

### EDGE-0002 — Prescribed shell deformation to evolving carrier

- **From:** The conditional quadratic-shell family in `EQ-0002`.
- **To:** A phase-indexed common carrier and its normal/tangent velocity
  decomposition.
- **Mathematical status:** `STD/DERIVED` for the determinant and regular
  moving-constraint identities. The recorded continuation is numerical and lacks
  a step-refinement study for its deformation-dependent scalar readouts.
- **Framework status:** `SRC/CANDIDATE`. The deformation family is not selected
  by an upstream H(s)H premise and is not a physical-time evolution law.
- **Source-status conflict:** The source's `coordinate_rewrite` label is
  `REJECTED`; the operation changes the constraint geometry rather than only its
  coordinates.
- **Graph role:** A benchmark/tool branch from configuration geometry, not a
  replacement for the still-open `intersection carrier -> framed finite tube ->
  transport and deformation` backbone.

### EDGE-0003 — Uniform constitutive filament to linear propagation

- **From:** A one-dimensional transverse field with stipulated uniform positive
  tension `T`, linear mass density `mu`, and periodic boundary conditions.
- **To:** Gapless normal modes with `omega_n^2=(T/mu)k_n^2`.
- **Equation:** `EQ-0003`.
- **Mathematical status:** `STD/DERIVED` under the explicit classical-string
  assumptions and repaired notation.
- **Framework status:** `OPEN`. Neither the one-dimensional reduction nor `T`
  and `mu` have been derived from a selected finite-core H(s)H object.
- **Graph role:** A conditional benchmark branch from constitutive dynamics to
  propagation. It is a special case of the candidate effective operator, not an
  upstream object-selection result.
- **Rejected downstream inheritance:** The source's quantum normalization,
  direct topology-to-mass map, metric inversion, gauge map, and spinor map do
  not follow from this edge.

## Earliest unsupported edge

The graph presently stops before `configuration geometry`: the archive has not yet
supplied a minimal, source-verified argument selecting the three-sphere constraints
from empirical Minkowski elements and the radial/UI construction. `EQ-0001` is
therefore a benchmark available to the framework, not yet part of its backbone.

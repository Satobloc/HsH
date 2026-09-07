# H(s)H Formalism Selection

Status: **provisional source-grounded selection map**. This document assigns
mathematical tools to typed jobs. A paper’s presence in a toolkit, an archive
label such as “core” or “locked,” and any LLM claim that work was checked carry
no mathematical weight.

## Current selection

The strongest immediate backbone candidate is framed-curve/director
variational mechanics:

[
\gamma:I\to\mathbb R^n,qquad r:I\to SO(n),qquad
\gamma'=r^{T}e_1,qquad r'=Ar,qquad A:I\to\mathfrak{so}(n).
]

Here the curve is a center-history or parametrization, the frame carries the
normal directions, and the skew connection (A) carries curvature/twist data.
A boundary map should package terminal frame and displacement, while an energy
density (Q(A)) supplies bending/twist mechanics.

Peter Hornung’s 2021 paper gives a rigorous version for
(mathbb R^3/SO(3)):

[
G(A)=\left(r_A(1),\int_0^1 r_A^T e_1,dt\right).
]

It proves smooth density while preserving clamped boundary conditions and
specified zero-curvature-component constraints, derives constrained
Euler–Lagrange conditions, and treats closed framed curves as a special case.
This makes it a strong source for admissible deformation, closure, framing, and
variational control.

## Why it is not yet the H(s)H formalism

The paper’s object is a three-dimensional framed rod/ribbon centerline, not a
four-dimensional finite-core worldtube. H(s)H still needs:

- a declared (mathbb R^4) or four-manifold setting and the corresponding
  three-dimensional normal space;
- an explicit choice between a full three-dimensional tube cross-section, a
  lower-dimensional rope/ribbon cross-section, or another finite-core object;
- boundary and cross-section fields, contact and merger rules, and a
  worldline-limit map;
- shell/resolving-hypersurface intersection data;
- constitutive coefficients and time evolution rather than static/admissible
  deformation alone.

A helix is not inserted as a primitive. In Hornung’s analysis it appears only
as a restrictive degenerate configuration under particular curvature
constraints and boundary data. That is the correct direction of dependence for
H(s)H: helix-like morphology should arise from equations or boundary
conditions, not be assumed.

## Typed role of the uploaded toolkit families

| Formalism | Proper current role | Adoption gate |
|---|---|---|
| Framed curves / Cosserat rods / ribbons | Center-history, frame transport, curvature/twist, elastic energy, closure | Extend to the selected 4D finite-core object and recover the curve limit |
| Gross–Pitaevskii / Bose models | Possible constitutive or effective-field branch | First identify an order parameter, domain, conserved quantities, units, and reason this reduction applies |
| Holonomy / parallel transport | Transport or closed-loop readout after a connection is defined | Specify the connection and loop; derive the observable rather than naming it |
| Cobordism / Pontryagin–Thom | Possible global classification of histories or transitions | Define objects and admissible morphisms first |
| Graph Laplacians | Discretization, solver, or spectral diagnostic | Show convergence or controlled relation to the continuum model |
| BV/AKSZ | Possible later constrained/derived-theory bookkeeping | Demonstrate an actual gauge/redundancy structure and justify any coarse-graining claim |

## Roundup assessment

`H(s)H_Toolkit/HsH IMPORTABLE EQUATION ROUNDUP.txt` is useful as a routing
catalog. It is not an equation authority. It combines results from distinct
domains—two-dimensional attractive Bose gases, holonomy, cobordism, and graph
theory—and then declares GPE and holonomy foundational without constructing
typed interfaces between their variables or the H(s)H object hierarchy.
Specific Bose-gas constants and anomaly formulas therefore remain local to
their source models unless a later reduction derives them for H(s)H.

## Evaluation rule

Formal verification and executable checks can catch algebraic transcription or
implementation errors, but neither a Lean file nor a passing Python log
establishes relevance, sound premises, or physical/model applicability.
Selection is based on:

1. well-defined objects and domains;
2. explicit assumptions and boundary/initial data;
3. reconstructible derivation;
4. dimensional and algebraic coherence;
5. controlled limits and counterexamples;
6. a typed interface to upstream and downstream H(s)H dependencies.

## Source record

- Peter Hornung, “Deformation of framed curves with boundary conditions,”
  *Calculus of Variations* 60:87 (2021), DOI
  `10.1007/s00526-021-01980-0`. HSH_RESOURCES PDF SHA-256
  `4dd0ffc84681a9cab0baa14555726764c1a2238d22b0534dc8cab16a69d3c09a`;
  extracted text blob `9c71741cb0ca1c782a04d251f5dddf3aeb730af2`;
  26 pages / 1,551 extracted lines read fully.
- `H(s)H_Toolkit/HsH IMPORTABLE EQUATION ROUNDUP.txt`, blob
  `a39c9cc1c2c4f2793e6fda3ce994521a295d06f4`, 264 lines read fully as a
  generated routing catalog.
- Main and addendum toolkit manifests read fully as structural catalogs.

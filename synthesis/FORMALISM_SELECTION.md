# H(s)H Formalism Selection

Status: **provisional source-grounded selection map**. This document assigns
mathematical tools to typed jobs. A paper’s presence in a toolkit, an archive
label such as “core” or “locked,” and any LLM claim that work was checked carry
no mathematical weight.

## Current selection

The strongest immediate backbone candidate is framed-curve/director
variational mechanics:

\[
\gamma:I\to\mathbb R^n,\qquad r:I\to SO(n),\qquad
\gamma'=r^{T}e_1,\qquad r'=Ar,\qquad A:I\to\mathfrak{so}(n).
\]

Here the curve is a center-history or parametrization, the frame carries the
normal directions, and the skew connection \(A\) carries curvature/twist data.
A boundary map should package terminal frame and displacement, while an energy
density \(Q(A)\) supplies bending/twist mechanics.

Peter Hornung’s 2021 paper gives a rigorous version for
\(\mathbb R^3/SO(3)\):

\[
G(A)=\left(r_A(1),\int_0^1 r_A^T e_1\,dt\right).
\]

It establishes smooth density while preserving clamped boundary conditions and
specified zero-curvature-component constraints, derives constrained
Euler–Lagrange conditions, and treats closed framed curves as a special case.
This makes it a strong source for admissible deformation, closure, framing, and
variational control.

## Minimal four-dimensional kinematics

The four-dimensional moving-frame layer follows directly from orthonormality,
without assuming a helix or a constitutive law. Let

\[
F(s)=\big(T(s),N_1(s),N_2(s),N_3(s)\big)\in SO(4),
\qquad T=\gamma'(s),
\]

for an arclength-parametrized regular curve \(\gamma:I\to\mathbb R^4\). Define

\[
\Omega=F^T F',\qquad F'=F\Omega.
\]

Differentiating \(F^TF=I\) gives

\[
\Omega^T+\Omega=0,
\]

so \(\Omega\in\mathfrak{so}(4)\). Relative to the tangent/normal split,

\[
\Omega=
\begin{pmatrix}
0&-\kappa^T\\
\kappa&\omega
\end{pmatrix},
\qquad
\kappa\in\mathbb R^3,\quad \omega\in\mathfrak{so}(3).
\]

Therefore

\[
T'=\sum_{a=1}^3\kappa_aN_a,\qquad
N_a'=-\kappa_aT+\sum_{b=1}^3N_b\,\omega_{ba}.
\]

The three components of \(\kappa\) bend the center-history through its
three-dimensional normal space. The three components of \(\omega\) rotate the
chosen normal frame.

For a normal-frame change \(N\mapsto NR(s)\), \(R:I\to SO(3)\),

\[
\widetilde\kappa=R^T\kappa,\qquad
\widetilde\omega=R^T\omega R+R^TR'.
\]

On an interval, solving \(R'=-\omega R\) gives a parallel/Bishop-type frame with
\(\widetilde\omega=0\). For a closed curve this gauge need not be periodic; the
residual return rotation is the normal holonomy. Thus local normal-frame
rotation is not automatically a modeled spin or twist observable.

This distinction changes only when the finite core supplies labeled material
directions or an anisotropic cross-section. For

\[
X(s,y)=\gamma(s)+\sum_{a=1}^3 y_aN_a(s),
\]

a simultaneous rotation of the normal basis and coordinates \(y\) is a
description change. Holding material labels or anisotropy fixed while rotating
the frame changes the modeled configuration; then the associated twist can
enter the constitutive energy.

**Status:** these \(SO(4)\) kinematics are **STD/DERIVED**. A specific material
frame, twist energy, or H(s)H constitutive interpretation remains
**SAT/CANDIDATE**.

## The finite-core type decision exposed

For a curve in four-dimensional ambient space, a full metric tube—at radius
small enough for the tubular coordinates to remain valid—has a
three-dimensional normal cross-section:

\[
N_\varepsilon(\gamma)
=
\left\{
\gamma(s)+\sum_{a=1}^3y_aN_a(s):
\lVert y\rVert\le\varepsilon
\right\}.
\]

Its boundary has \(S^2\) fibers over the center-history. A rope-like model with
a two-dimensional disk cross-section instead selects a rank-two subbundle of
the normal bundle. These are different modeled objects and generally have
different framing, deformation, and contact data. The current sources have not
yet selected between them.

## Why this is not yet the H(s)H formalism

Hornung’s established theorems concern a three-dimensional framed rod/ribbon,
not a four-dimensional finite-core worldtube. The kinematic extension above
does not automatically extend his density and variational results. H(s)H still
needs:

- an explicit choice of finite-core cross-section and boundary fields;
- contact, exclusion, merger, and worldline-limit rules;
- shell/resolving-hypersurface intersection data;
- constitutive energy and time evolution;
- an explicit statement of which normal directions are gauge and which are
  material labels.

A helix is not inserted as a primitive. In Hornung’s analysis it appears only
as a restrictive degenerate configuration under particular curvature
constraints and boundary data. That is the admissible direction of dependence
for H(s)H: helix-like morphology must arise from equations or boundary
conditions.

## Typed role of the uploaded toolkit families

| Formalism | Proper current role | Adoption gate |
|---|---|---|
| Framed curves / Cosserat rods / ribbons | Center-history, frame transport, curvature/twist, elastic energy, closure | Extend established results to the selected 4D finite-core object and recover the curve limit |
| Gross–Pitaevskii / Bose models | Possible constitutive or effective-field branch | Identify an order parameter, domain, conserved quantities, units, and reason the reduction applies |
| Holonomy / parallel transport | Transport or closed-loop readout after a connection is defined | Specify connection and loop; distinguish normal-frame gauge from material return |
| Cobordism / Pontryagin–Thom | Possible global classification of histories or transitions | Define objects and admissible morphisms first |
| Graph Laplacians | Discretization, solver, or spectral diagnostic | Show convergence or controlled relation to the continuum model |
| BV/AKSZ | Possible later constrained/derived-theory bookkeeping | Demonstrate an actual gauge/redundancy structure and justify any coarse-graining claim |

## Roundup assessment

\`H(s)H_Toolkit/HsH IMPORTABLE EQUATION ROUNDUP.txt\` is useful as a routing
catalog. It is not an equation authority. It combines results from distinct
domains—two-dimensional attractive Bose gases, holonomy, cobordism, and graph
theory—and then declares GPE and holonomy foundational without constructing
typed interfaces between their variables and the H(s)H object hierarchy.
Specific Bose-gas constants and anomaly formulas therefore remain local to
their source models unless a later reduction derives them for H(s)H.

## Evaluation rule

Formal verification and executable checks can catch algebraic transcription or
implementation errors, but neither a Lean file nor a passing Python log
establishes relevance, sound premises, or model applicability. Selection is
based on:

1. well-defined objects and domains;
2. explicit assumptions and boundary/initial data;
3. reconstructible derivation;
4. dimensional and algebraic coherence;
5. controlled limits and counterexamples;
6. a typed interface to upstream and downstream H(s)H dependencies.

## Source and search record

- Peter Hornung, “Deformation of framed curves with boundary conditions,”
  *Calculus of Variations* 60:87 (2021), DOI
  \`10.1007/s00526-021-01980-0\`. HSH_RESOURCES PDF SHA-256
  \`4dd0ffc84681a9cab0baa14555726764c1a2238d22b0534dc8cab16a69d3c09a\`;
  extracted text blob \`9c71741cb0ca1c782a04d251f5dddf3aeb730af2\`;
  26 pages / 1,551 extracted lines read fully.
- \`H(s)H_Toolkit/HsH IMPORTABLE EQUATION ROUNDUP.txt\`, blob
  \`a39c9cc1c2c4f2793e6fda3ce994521a295d06f4\`, 264 lines read fully as a
  generated routing catalog.
- Main and addendum toolkit manifests read fully as structural catalogs.
- All 314 extracted toolkit-paper metadata records were searched by title and
  source path for four-dimensional framed curves, higher-dimensional rods,
  normal bundles, \(SO(4)\), Bishop/Frenet frames, and related terms. No
  dedicated four-dimensional framed-curve or Cosserat source was identified.
  This is a metadata/title search, not a full-content absence claim.

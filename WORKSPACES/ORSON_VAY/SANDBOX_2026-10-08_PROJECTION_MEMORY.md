# Orson Vay Sandbox Checkpoint — Projection Memory

**ID:** OV-20261008-02  
**Date:** 2026-10-08  
**Status:** sandbox / non-canonical

## Working result

A deterministic 4D trajectory can produce apparently history-dependent behavior when an apparatus observes only part of its geometry.

Use the helix

[
X(s)=
egin{pmatrix}
Rcos(ks+phi)\
Rsin(ks+phi)\
0\
s
end{pmatrix}.
]

A reduced apparatus that preserves only

[
x(s)=Rcos(ks+phi)
]

does not retain the second transverse coordinate.

Sample at intervals (Delta), with

[
	heta=kDelta.
]

For unknown phase, the one-step conditional expectation is

[
mathbb E[x_1mid x_0]=x_0cos	heta.
]

The actual two-step geometry gives

[
mathbb E[x_2mid x_0]=x_0cos(2	heta),
]

whereas composing the one-step reduced transition rule as though the reduced state were Markov gives

[
mathbb E_{m Markov}[x_2mid x_0]=x_0cos^2	heta.
]

The discrepancy is

[
oxed{D=-x_0sin^2	heta.}
]

Thus the complete deterministic geometry can appear non-Markovian after state reduction.

## Exact recurrence

Retaining two consecutive observations recovers the missing state:

[
oxed{x_{n+1}=2cos	heta,x_n-x_{n-1}.}
]

A numerical sweep over 500,000 randomly initialized trajectories gave an RMS residual of approximately

[
2.9	imes10^{-16}R,
]

consistent with floating-point precision.

With independent Gaussian observation noise of standard deviation

[
sigma=0.03R,
]

the predicted recurrence-residual RMS was approximately

[
0.0519615R,
]

and the simulation returned approximately

[
0.0518825R.
]

## Interpretation

Some apparent memory, hysteresis, delayed response, or trans-temporal dependence in a reduced description may be caused by omitted geometric degrees of freedom rather than by an additional memory-bearing interaction.

Working rule:

> Before adding a memory mechanism, test whether restoring the missing geometrical state removes the effect.

This does **not** establish that all physical memory effects are representational. It gives a discriminator.

## Failure conditions

The one-step and two-step reduced predictions coincide when

[
sin	heta=0
]

or when the selected initial observation makes the discrepancy vanish.

A detector that already measures both transverse coordinates does not suffer this information loss.

If (s=ct) is given a relativistic interpretation, the helix parameters must additionally satisfy the corresponding timelike constraint.

## Next test

Replace the single-frequency helix with a two-frequency worldtube and an explicitly finite-thickness instantiation region. Compare:

1. complete geometric state,
2. one-observation reduced state,
3. progressively longer observation histories.

Ask whether the apparent memory vanishes as retained geometric information increases.

## Provenance actually read in the parent run

- `SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt` — opening ~300 lines; Universal Indicatrix / SO(4) rotation family.
- `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt` — complete file.
- `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/001. Epistemology of the World - inverse gravity - Bellomy.txt` — opening ~230 lines.
- Current onboarding and HSH_RESOURCES routing reviewed.
- `PRIOR_ART` remained quarantined.

## Boundary

Source facts, inference, and sandbox conjecture remain separate. No historical constant or particle label was used as a target.

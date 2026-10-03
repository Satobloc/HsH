# Mercer Sandbox — Graph-Laplacian Interbraid Spectroscopy

**Date:** 2026-10-03  
**Status:** SANDBOX / NONCANONICAL  
**Role:** Mercer

## Sources actually read

### Old SAT
`SAT_THEORY_ARCHIVE_2023-25/2026/SAT++.txt`, lines 1–700, substantially.

Useful source-level material retained:
- neighbor coupling appears as part of the filament construction;
- worldline/string-like embedding language is used as a mechanical scaffold;
- the file itself contains an explicit critical reading separating defined mathematics from unsupported autobiographical/metaphysical material.

Historical constants, personal anchors, and target-fitted particle claims in that file were **not** used.

### Current H(s)H / September-30 dump
`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PAPER_PARTICLE_ZOO_TYPED_TOPOLOGY.md`, read completely.

Frozen useful result:
- topology alone is not an injective particle label;
- a source-faithful state requires carrier class, framing/topology, geometry, excitation/phase, binding/composition, and persistence/event type;
- representative helices with the same carrier topology can have different curvature/torsion;
- braid geometry should therefore be treated as structure, not a one-number particle tag.

No external prior art entered before the construction.

## Independent Mercer construction

For N equal finite carriers coupled to a shared resolving medium and to one another, take transverse coordinates x_i and a symmetric pair-contact energy

[
E_{IB}=rac{J}{2}sum_{(ij)in E}(x_i-x_j)^2.
]

Let A be the contact/interaction adjacency matrix, D its degree matrix, and

[
L_G=D-A
]

the graph Laplacian. Then

[
E_{IB}=rac{J}{2}mathbf{x}^T L_Gmathbf{x}.
]

If each filament also has a local filament-sheet relative stiffness g and equal inertia m, the relative-sector k=0 Hessian is

[
H=rac{1}{m}(gI+JL_G).
]

Therefore the normal-mode frequencies obey

[
oxed{omega_a^2(0)=rac{g+Jlambda_a(L_G)}{m}}.
]

The uniform eigenvector has (lambda_0=0), so direct interfilament coupling J does not shift the common mode. All nonuniform relative modes are shifted according to the Laplacian spectrum.

## Concrete same-N discriminator

For four carriers:

Path P4:
[
lambda(L)={0,;2-sqrt2,;2,;2+sqrt2}.
]

Cycle C4:
[
lambda(L)={0,;2,;2,;4}.
]

Complete K4:
[
lambda(L)={0,;4,;4,;4}.
]

Thus identical strand count N=4 and identical local constitutive constants can still produce sharply different spectral multiplicities.

With arbitrary sandbox parameters (m=1, g=0.6, J=1), the predicted k=0 frequencies are obtained directly from the formula above. No historical SAT constants or particle data are used.

## Consequence

This sharpens the prior Mercer result:

- Electrogravity-like common/filament-sheet sectors are controlled primarily by coupling to the resolving medium.
- Interbraid relative sectors are controlled by the spectrum of an interaction/contact operator.
- Topology need not be mapped directly to a particle label. It can first alter adjacency/contact geometry, which alters (L_G), which produces a measurable normal-mode fingerprint.

This is a much safer translation of "braid identity" into mechanics.

## Tight prediction / solver test

Construct several finite-worldtube assemblies with:
1. equal N;
2. equal local tube radius, tension, bending modulus, inertia, and filament-sheet coupling;
3. different controlled contact/link graphs.

Measure their small-oscillation spectra. In the local quadratic regime,

[
momega_a^2-g=Jlambda_a(L_G).
]

Hence a single fitted J must map every measured relative mode onto the independently known graph-Laplacian spectrum.

For the complete graph (K_N),

[
lambda={0,N,N,dots,N},
]

so all N-1 relative modes are exactly degenerate in the symmetric limit. Symmetry-breaking geometry must split that multiplet.

## Failure conditions

This branch fails or needs replacement if:
- finite H(s)H braid interactions cannot be approximated by any local quadratic pair energy;
- measured spectra depend on over/under braid information that the contact graph cannot encode;
- nonlocal holonomy dominates and two graph-isospectral but topologically distinct configurations remain mechanically distinguishable;
- a single J cannot collapse multiple relative modes onto an independently constructed interaction operator.

The third failure mode is especially informative: it would tell us the correct operator is not an ordinary graph Laplacian but a richer signed, directed, phase-weighted, or holonomy-bearing Laplacian.

## Next move

Deliberately construct **graph-isospectral but braid-distinct** assemblies. If ordinary Laplacian spectra cannot distinguish them, introduce the smallest extra structure only after the failure is demonstrated:
- signed edge weights for chirality,
- complex phase weights for holonomy,
- directed couplings for orientation,
- higher-order hyperedges for genuine multi-strand contact.

This creates a controlled ladder from ordinary constitutive mechanics to genuinely topological H(s)H structure rather than assuming topology at the start.

— Mercer

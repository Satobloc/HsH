# SANDBOX — Meridian LXI: stretch-commutator rotation
Status: sandboxed / noncanonical
Date: 2026-10-04

## Sources read
- SAT_THEORY_ARCHIVE_2023-25/H(s)H NOTATION.txt, lines 1–1200: six SO(4) rotation planes; signed axiswise expansion/contraction; anisotropic expansion; 3+3/double-shell motifs.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt, lines 1–1200: candidate H=(t,sigma,Q), six-channel SO(4) engine, finite-core and holonomy solver ecology.

## Correction to previous sandbox idea
For symmetric strain D and antisymmetric rotation Omega, [D,Omega] is symmetric, not antisymmetric. Therefore conjugating a rotation by anisotropic scale does not simply 'mix L/R inside so(4)'; S Omega S^{-1} is generally not antisymmetric. The clean mechanism is instead a commutator of TWO symmetric anisotropic strains in different frames.

## Construction
Let A=A^T and B=B^T be infinitesimal anisotropic strain generators. A closed deformation loop is
G(e)=exp(eA) exp(eB) exp(-eA) exp(-eB).
BCH:
log G = e^2[A,B] + O(e^3).
Because A,B are symmetric,
[A,B]^T = -[A,B],
so [A,B] is an so(4) rotation generator.

Thus ordered anisotropic expansion/contraction can manufacture rotation at second order without inserting rotation as a primitive.

Numerical generic 4D fixture:
- antisymmetry residual of [A,B]: 1.96e-17
- polar rotation residue scales e^2.0010
- polar stretch residue scales e^3.0011
- BCH remainder after I+e^2[A,B] scales e^3.0018

Canonical 3+3 decomposition of the induced [A,B] in this fixture:
L = (-0.286645, 0.039685, 0.027986)
R = (-1.388765, 0.115049, -1.014154)
I_L=0.0845235, I_R=2.9704148
C=(I_L-I_R)/(I_L+I_R)=-0.94466435.
This number is fixture-specific and is NOT a target or physical constant.

## Candidate Hagalaz grammar
At infinitesimal level, split generator into symmetric strain E and antisymmetric rotation Omega:
K = E + Omega.
Primitive anisotropic expansion can live in Sym(4); ordered loops generate so(4) through [Sym,Sym] subset so(4).
This suggests rotation may be partly derived from expansion-history rather than always independent.

## Failure conditions
- Coaxial/commuting strains give [A,B]=0 and no O(e^2) rotation.
- The finite loop is not exactly a pure rotation; polar stretch remains at O(e^3).
- Physical relevance requires H(s)H to supply genuinely differently oriented strain fields/steps and a readout sensitive to the induced polar rotation.

## Next test
Feed actual archive/H(s)H anisotropic expansion steps into this commutator fixture, polar-decompose each closed cycle, and project induced rotation into L/R chiral coordinates. Test whether natural recursive ᚼ cycles produce stable nonzero chiral residues without hand-selected rotation inputs.

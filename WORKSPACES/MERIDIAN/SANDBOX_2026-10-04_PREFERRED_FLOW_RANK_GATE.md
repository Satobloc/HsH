# SANDBOX — Meridian LXVII — preferred-flow rank gate

Status: sandbox / noncanonical.

Fresh sources read:
- SAT_THEORY_ARCHIVE_2023-25/H(s)H NOTATION.txt, lines 1–1200: ++++ manifold, four axis-expansion slots, six rotation planes, time/emergence via expansion asymmetry, combinatorial H grammar.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt, lines 1–1200: candidate H=(t,sigma,Q), six-channel SO(4) engine, metric induction g=delta-2u⊗u, solver ecology and need to lock H semantics.

New sandbox result:
Let u be the distinguished unit flow used by metric induction. For four symmetric deformation generators E_a, define K(e_a wedge e_b)=[E_a,E_b] in so(4).

If every E_a preserves the splitting R u ⊕ u_perp (block diagonal in a u-adapted basis), then every commutator also preserves it and lies in so(u_perp) ≅ so(3). Therefore rank(K) <= 3. Random regression: 500/500 such four-mode fixtures had rank exactly 3.

If even one of the four symmetric modes has nonzero flow-transverse shear components E_{0i}, generic closure can recover full so(4). Random regression with one flow-mixing mode plus three u-preserving modes: 500/500 fixtures had rank 6.

Interpretation:
The preferred-flow field creates a sharp algebraic gate. A strictly foliation-preserving deformation grammar cannot generate the old six-plane SAT rotation compass; it generates only the spatial SO(3) stabilizer of u. To derive all six SO(4) channels from deformation history, H(s)H needs at least one deformation mode that tilts/mixes u relative to u_perp, or else rotation must retain independent primitive channels.

Discriminator:
Compute P_parallel=u u^T, P_perp=I-P_parallel and m_a=||P_parallel E_a P_perp + P_perp E_a P_parallel||_F. If all m_a=0, rank(K)<=3 exactly. Test actual reconstructed H(s)H modes before claiming four-mode SO(4) controllability.

Failure condition:
If canonical H(s)H requires u to remain invariant under all admissible local deformations, LXV/LXVI full-rank compression is physically unavailable even though it is generic in unconstrained linear algebra.

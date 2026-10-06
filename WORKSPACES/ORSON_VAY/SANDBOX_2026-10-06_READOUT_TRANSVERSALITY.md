# Orson Vay — Readout Transversality

Date: 2026-10-06
Status: SANDBOXED / NOT CANONICAL

Sources read this run: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Donut canon.txt`, `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H MATH TO DO.txt`, and `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/HsH Classic Run.txt`. Mersearch request `2026-10-06-orson-rq-hidden-symmetry-ancestry-002` was used as a retrieval map only.

Independent construction: take the static Euclidean-4D curve X(s)=(R cos ks,R sin ks,p s,q s). Standard readout t0=x4 gives apparent angular rate k/q. A tilted readout tbeta=x4+beta*x1 gives

 dtbeta/ds = q-beta R k sin(ks),
 omega_beta = k/[q-beta R k sin(ks)].

Therefore the same static 4D history can produce nonuniform apparent dynamics solely from changing the slicing/readout angle.

Readout is globally monotone only if |beta| R k < |q|. Equality is a tangency threshold; above it, the readout becomes multivalued over portions of the history. Numerical check for R=k=q=1: beta=.2 gives dt/ds in [.8,1.2]; beta=.8 gives [.2,1.8]; beta=1 reaches tangency; beta=1.2 gives dt/ds<0 over about 18.64% of one cycle.

Connection to recovered SAT construction: `Donut canon.txt` explicitly separates closure of the projected trace from closure of the lifted/full state. This sandbox adds the complementary rule that apparent dynamical regularity belongs to the pair (4D history, readout), not to the history alone.

Physics discriminator: before interpreting a projected snap, reversal, branch, clipping event, or state transition as intrinsic, calculate transversality of the candidate physical foliation. If the event moves under admissible readout changes while intrinsic 4D invariants remain unchanged, it is slicing-induced. If an intrinsic invariant changes at the same locus, it is not explained by readout alone.

Failure condition: H(s)H must independently specify the physically admissible readout/foliation field. If the readout can be chosen after the fact, this mechanism has no predictive force.

Next solver test: on a finite worldtube, replace dt(T)!=0 by the appropriate restricted-Jacobian rank condition, map near-rank-loss regions, and compare them with projected event loci. This converts the static-history/readout idea into a numerical geometry assay rather than a cognition metaphor.

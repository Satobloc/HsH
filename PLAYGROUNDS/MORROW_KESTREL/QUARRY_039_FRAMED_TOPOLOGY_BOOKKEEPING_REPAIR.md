# Quarry XXXIX — Framed-topology bookkeeping repair

Status: SANDBOX / noncanonical
Role: Morrow + Kestrel

## Provenance
Old SAT: `SAT_THEORY_ARCHIVE_2023-25/REUILIGIG.txt`, blob `6d3de4693f0fc3e8fcd2586b07818718189bb56f`. Read complete fetched file. Relevant historical node: worldtube/superhelix generator -> closure/bending/resistance -> topology; boundary claims explicitly marked conjectural.

Current H(s)H: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt`, blob `54f2f530697ab6e9c44758ce3406c4144915c73d`. Read lines 1–1200. Relevant construction: finite-core worldtubes, recursive generator, and `Q_top = L_wind + L_link + W_writhe`.

## Result
For a framed closed carrier the Călugăreanu-White-Fuller relation is
`Lk = Tw + Wr`.
Therefore, if the archived/current `L_wind` is intended to be ribbon twist `Tw`, then
`L_wind + L_link + W_writhe = Tw + Lk + Wr = 2 Lk`.
So the three-term quantity is not three independent topological contributions; it double-counts the framed linking invariant.

Numerical check on a closed (2,3) torus-knot carrier with a finite offset ribbon edge:
N=850: Lk=-3.000121, Wr=-3.220236, Tw=0.220115, and Lk+Tw+Wr=-6.000243 ≈ 2 Lk.

## Sandbox repair
Separate:
1. integer topological sector: `Q_frame = Lk(C,C_epsilon)`;
2. geometric partition inside that sector: `Lk = Tw + Wr`;
3. distinct inter-component pairwise linking numbers `Lk(C_i,C_j)`;
4. higher-order invariants (e.g. ternary memory) only when genuinely independent.

A useful elastic energy can depend on Tw and Wr separately while conserving Lk:
`E = A Tw^2 + B Wr^2 + ...`.
Minimization at fixed Lk predicts `Tw = [B/(A+B)] Lk`, `Wr = [A/(A+B)] Lk`.

## Failure condition
If `L_wind` in H(s)H denotes a genuinely independent winding around another cycle (not ribbon twist/self-link framing), the double-counting diagnosis does not apply. The notation must then identify the underlying cycles explicitly.

## Next test
Audit every use of `Q_top = L_wind + L_link + W_writhe` and classify each term by the actual curves/cycles involved. Then build a finite-core solver that conserves Lk while allowing Tw<->Wr conversion and test whether writhe/braid onset follows the stiffness ratio rather than an inserted snap angle.

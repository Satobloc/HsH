# Meridian sandbox | Avery benchmark: a charged trajectory's helix does not identify its cause | 2026-10-10

**Status:** SANDBOXED; no new physical entities and no added law. Meridian derivation from ordinary special relativistic Lorentz force. Curated IMPORTANT folder remains READ ONLY.

## Sources read in this run
- Current front door `Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` read in full; Common Reference Desk reviewed.
- Old SAT archive `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt` fetched 37,220 characters; substantially reviewed opening portion, particularly geometry-first constrained encoding, worldline/helix and force encoding. This is historical Nathan text, not validation of its tentative physics.
- HsH `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` fetched 9,258 chars and substantially read, particularly 0–10 and Propositions A/B.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/[🦉] IMPORTANT/Avery Protocol.txt` read in full (~3,155 chars) as Nathan-curated **assistant-style summary**, not independently verified Nathan-authored original. No writes to this protected folder. Avery's benchmark/label-strip/necessity/compression criteria applied.
- Reference packet router reviewed; no external theories imported. Source and interpretation separated.

## Ordinary Minkowski benchmark
In locally inertial Minkowski coordinates set `c=1`, a prescribed constant magnetic field along spatial z, negligible radiation reaction; known Lorentz-force equation `m dU^mu/dtau = q F^mu{}_nu U^nu`. With constant speed and constant gamma, define the coordinate-time angular frequency `omega=q B/(gamma m)` (signed); perpendicular speed `v_perp` and axial `v_z`. Worldline's spatial trace is

`r(t)=(a cos(omega t), a sin(omega t), v_z t)` with `a=v_perp/|omega|`.
For the **spatial helix**, Euclidean Frenet curvature and signed torsion (assuming omega>0) are
`kappa=a omega²/(v_perp²+v_z²)=a/(a²+b²)`,
`torsion=b/(a²+b²)`,
where `b=v_z/omega`.
Consequently `a=kappa/(kappa²+torsion²)` and `b=torsion/(kappa²+torsion²)`; signed spatial helix geometry determines radius and pitch up to rigid motions and orientation. Four-velocity norm `U^mu U_mu=-1` remains invariant with `c=1`; proper acceleration magnitude `sqrt(A^mu A_mu)=gamma² v_perp |omega|`.

**Label purge:** the intrinsic geometry of the single curve (kappa,torsion) does NOT uniquely recover q, B, m, gamma separately: even observing t and 3D trajectory identifies only combinations `q B/(gamma m)` and velocity components. In particular `q→s q, B→B/s` preserves the trajectory for nonzero s, and `m→s m, B→s B` does also when q, gamma held fixed. This is an exact observational degeneracy under the toy assumptions, not a failure of Minkowski or standard electromagnetism.

**Avery necessary structure:** uniform Lorentz force with magnetic-only input fixes a spatial helix (when both perpendicular and longitudinal speeds nonzero), but the **reverse** inference 'helix means magnetic interaction' is invalid. An identical curve can be driven by mechanically prescribed constrained motion or other forces. Hence morphology alone cannot uniquely decode the cause; information about interactions/environment/medium must be constrained by independent measurements. This is a precise limit on SAT curve-only inversion without adding ontology.

## Geometric solver control
Three analytic cases evaluated (a,b) giving (kappa,torsion):
(1,0.2) -> (0.96153846,0.19230769);
(1,1) -> (0.5,0.5);
(0.5,1) -> (0.4,0.8).
All use dimensionless illustrative units; no historical constants targeted. A spatial helix with b=0 has torsion 0 (planar circle); with a=0 curvature vanishes and Frenet torsion is not defined. Distinguish curvature of spatial curve from proper acceleration of 4D worldline.

## Discriminator and null
1. A single traced worldline's geometry cannot independently determine the electromagnetic field and charge-to-mass ratio; this is a documented **null identifiability result** for the bare geometric inverse map.
2. To resolve, take two particles with separately known charge-to-mass ratios in the same empirically measured field or characterize the environmental force independently; then check the shared `omega/(q/m)=B/gamma` in consistent units. This is standard physics, not new prediction.
3. SAT/H(s)H test: after constructing **full** measured 4D benchmark including other lines/medium geometry, see if a common invariant removes label dependence and predicts a held-out trajectory without case-specific encoding. If not, record null and do not add extra fields.

## Scope limitation
This is a partial benchmark (ideal uniform field; no radiation reaction) and not a proof that SAT cannot unify force labels; rather, it mathematically demonstrates the degeneracy that must be broken by the existing system's joint geometric constraints. The explanatory challenge is collective morphology and known interactions, not a single isolated helix.

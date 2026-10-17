# Meridian sandbox: R4 unlinking versus foliation-relative interbraid
**Date:** 2026-10-08. **Status:** SANDBOXED; mathematical counterexample, not theory authority. **Notation:** LOCAL:UNLINK, dimensionless coordinates. No historical constants fitted.

## Sources actually read
- SAT archive `[[SAT26 TOOLBOX]]/SAT26 MATH ROUNDUP.txt`: complete (~4.4k chars); historical UI rotation-expansion and superhelix claims, not adopted as proved.
- SAT archive `[[SAT26 TOOLBOX]]/THE SPHERES.txt`: lines 620–1300 (~18k chars); actual damped three-sphere driver and intersection-circle code.
- HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Math Extension.txt`: lines 1140–2130 (~7.7k chars); normal constraints, kink modes, proposed topological sectors. Source is an archived exploratory assistant formulation.
- Controlling `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, current symbol/citation/tool/workflow policies and `REFERENCE_DESK/README.md` read; HSH_RESOURCES War Room declaration and all its linked routes triaged for potential use, without theory import. HSH_RESOURCES toolkit index, tool chest, digestion plan, BOOT and main index overview-read. PRIOR_ART quarantine respected.
- Mersearch release/request bridge inspected. Exact known paths were read directly; no corpus-wide retrieval performed.

## Exact construction
In Euclidean R4 with coordinates (x,y,z,w), take
```text
C1(t)   = (cos t, sin t, 0, 0)
C2(s,u) = (1 + cos s + 3u, 0, sin s, h sin(pi u))
0 <= u <= 1, h > 0.
```
At u=0, these loops form a Hopf link in the w=0 three-plane. At u=1 they are unlinked, also in w=0. The intervening family is disjoint in R4. Exact minimization over both loop parameters gives
```text
d_min(u;h)^2 = (3u - 1)^2 + h^2 sin^2(pi u).
```
It is strictly positive for h>0. At the *3D projected* crossing u=1/3, true R4 separation is sqrt(3)h/2. With h=1, global minimum separation = 0.7061032001854671 at u=0.17689228621077516. Two tubular cores of radius 0.30 stay disjoint, minimum clearance 0.10610320018546715.

Numerical Gauss linking integral of 3D projections: Lk(0)=-1, Lk(0.2)=-1, Lk(0.5)≈0, Lk(1)≈0 (900×900 quadrature; residual <1e-14 away from the crossing). At u=1/3 the 3D projection intersects and its Gauss integral is undefined, even though R4 curves are separated.

**Foliation gate:** If both loops must remain in the *same fixed three-dimensional leaf* throughout a smooth disjoint isotopy, the integer Gauss linking number cannot change. This R4 deformation escapes that theorem by lifting C2 out of the leaf. The external parameter u is NOT physical time. If w is physical time, this is not an admissible same-time evolution of two coexisting loops.

## Translation and discriminator
Recovered SAT ingredient: moving sphere centers and coupled intersection carriers. New sandbox inference: a 3D interbraid/link number is not invariant under arbitrary ambient R4 transformations, even with finite core. Candidate local ᚼᚼ grammar: relative translations T_x(3u) and T_w(h sin(pi u)) plus a physical admissibility predicate (foliation, continuity, causal/dynamical restrictions). This is NOT achieved by a common global SO(4) rotation. The claim that finite-core linking alone gives a universal 4D conserved charge fails this explicit fixture. The converse claim that physical 3D entanglements therefore disappear also fails, because the exhibited deformation leaves the shared leaf.

**Next solver:** compare free-R4 versus leaf-preserving constrained path optimizations, with finite-core clearance. Test whether the present H(s)H time-normal/worldtube equations provide a principled admissibility rule rather than stipulating one.

## Secondary mathematical erratum
The HsH archived topological-sector text asserts pi_0(S1/Z3)=Z3. False: S1/Z3 is homeomorphic to S1 via z→z³, so pi_0 is trivial. The discrete minima {0,2pi/3,4pi/3} of cos(3theta) have three connected components, a different space. Do not silently inherit the quotient claim.

## Reproducibility
Standalone Python/SymPy/NumPy/SciPy solver and three Class P figures are in the accompanying conversation artifact `meridian_fourD_unlink_gate_2026-10-08.zip` (not committed here). Symbolic distance identity, global clearance, finite-core check, and 3D Gauss integral passed. This is an exact geometry fixture and a topology/admissibility constraint, not an independently validated physical mechanism.

*Meridian ◈*

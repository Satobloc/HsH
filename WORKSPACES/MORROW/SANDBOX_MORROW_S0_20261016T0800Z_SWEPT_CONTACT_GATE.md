# Morrow s0 | Swept R4 shell contact gate
2026-10-16T08:00Z | GEN/DERIVED/SANDBOXED; geometry QC only.

Source: WORKSPACES/MORROW/morrow_swept_shell_dimension_gate_20261015.py (blob e77b0518eec938bcaf980684c5bd66d6665b6971).

For the circular centreline gamma(s)=(A cos s,A sin s,0,0), material is Rin<=dist(x,gamma)<=Rout. For candidate C(t)=(A+Rm+eps cos t,eps sin t,0,0), Rm=(Rin+Rout)/2, exact distance is d(t)=sqrt((A+Rm)^2+eps^2+2(A+Rm)eps cos t)-A. With clearance a, forbidden band is [lo,hi]=[Rin-a,Rout+a]. Define c(r)=((A+r)^2-(A+Rm)^2-eps^2)/(2(A+Rm)eps). Exact fraction inside [u,v] is (acos(clip(c(u)))-acos(clip(c(v))))/pi.

Define sandbox penalty delta=max(0,min(d-lo,hi-d)), E=kappa/(4pi) integral_0^(2pi) delta(t)^2 dt. Because |d'(t)|<=eps and the prescribed loop traverses the band twice, E>=kappa*(hi-lo)^3/(24pi eps).

Fixture in metres: A=5, Rin=.8, Rout=1.2, eps=.3, a=.05, kappa=1 J/m^2. Material fraction=.464657970430385497; expanded forbidden fraction=.627232707439839234. Numerical E=.0057585207044966787228 J, rigorous bound=.0055262133018019213809 J, ratio=1.0420373572296. Independent 65536-midpoint E=.005758520696203164 J; all tests passed.

This is a positive contact penalty for one prescribed curve, not a physical force law or general confinement proof. Full derivation and executable Python appear in the visible calculation relay.

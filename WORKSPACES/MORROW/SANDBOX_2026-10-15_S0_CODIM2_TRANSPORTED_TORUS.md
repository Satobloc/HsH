# Morrow s0 | Codimension-two torus transport gate
2026-10-15 13:00 UTC. SANDBOXED, synthetic Euclidean geometry; not H(s)H physics.

Sources: WORKSPACES/MORROW/2026-10-09_SANDBOX_CODIM2_INTERBRAID_RESCUE.md (blob 5135fd93dbebf46c230db1cdc9858fd631af939d); WORKSPACES/MORROW/morrow_swept_shell_dimension_gate_20261015.py (blob e77b0518eec938bcaf980684c5bd66d6665b6971).

Let K={(A cos s,A sin s,b cos t,b sin t):s,t in S1}, A=5 m,b=1 m, embedded in Euclidean R4. This is a 2D torus T2=S1xS1, not a swept 3D shell. Define F1=rho12-A, F2=rho34-b, where rhoij=hypot(xi,xj). Exact global distance to K is sqrt(F1²+F2²). The meridian C(phi)=(A+eps cos phi,0,b+eps sin phi,0), eps=.3 m, has F(C)=eps(cos phi,sin phi), winding W=+1, and exact clearance eps-a=.25 m from the a=.05 m material thickening of the ENTIRE transported torus. Alexander duality: H1(R4\T2)=Z because H²(T2)=Z. For a<min(A,b), tubular thickening preserves the complement's H1. Area=4pi² A b=197.392088021787 m². Exact 4-volume of thickening=4pi³ A b a²=1.550313834015 m4.

Negative control: replacing S1 fiber with filled D2 gives Kfill=S1xD2, H²=0. The same meridian intersects Kfill at phi=3pi/2 (rho12=A,rho34=b-eps). Its global clearance is zero. The 2D carrier is an additional physical assumption, not a consequence of ordinary finite core.

Executed Python 3/NumPy: 8192 segments W=1.000000000000; torus clearance=.250000000000 m; filled distance=0; exterior W=0. 100 bounded <=.02 m point perturbations: minimum clearance .230093027038 m (guaranteed >=.23). 30 SO4 rotations: max distance discrepancy 4.496e-15 m. 400x400 polar midpoint quadrature matches exact thickening volume. All assertions passed. Full executable and Class P plot in relay conversation; local script SHA256 d2576e7b859dc79b5f10fd6b5eb8c14b3f8838cdd836feb1b96e470426f22dad.

Minimal reproducible stdlib check:
```python
from math import pi,sin,cos,hypot,atan2
A,b,e,a=5.,1.,.3,.05
n=8192
z=[complex(hypot(A+e*cos(2*pi*j/n),0)-A,hypot(b+e*sin(2*pi*j/n),0)-b) for j in range(n)]
w=sum(atan2((z[(j+1)%n]/z[j]).imag,(z[(j+1)%n]/z[j]).real) for j in range(n))/(2*pi)
assert abs(w-1)<1e-12 and abs(min(map(abs,z))-e)<1e-12
print(w,e-a)
```

Kestrel next: test whether a finite Kerr-like core supplies a genuine closed codim-2 support; model reconnection/overlap. Do not claim interbraid confinement, SU(3), or physical carrier existence from this existence proof.

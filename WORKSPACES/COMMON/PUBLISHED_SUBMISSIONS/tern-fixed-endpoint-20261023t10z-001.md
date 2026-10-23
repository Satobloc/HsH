# Tern Rook | Fixed-endpoint 4D braid gate | 2026-10-23T10Z

Task: calc48-20261023T10Z-tern-fixed-ends-001
Gate: INTERNALLY_CHECKED mathematical geometry; UNRESOLVED physical admissibility. No CODATA prediction, no BEDROCK promotion.

## Primary historical construction
HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT-Y 4D.txt, Git blob 9806853dd09ca6b36bcfc530d8333bed53d956c5, preserves an assistant-coded, Nathan-requested three-coil model with r=1, pitch=0.2, t in [0,4*pi], phases 0,2*pi/3,4*pi/3, and x=r*cos(t+phase), y=r*sin(t+phase), z=pitch*t. Original individual message timestamp is not established. SAT [[[SAT_2025_DERIV]]].txt, blob 2ed5f4e6ba465f6d00664ad3820c8cc4c86ebdc1, contains historical Q=L_wind+L_link+W_writhe; that equation is not established as an invariant of unrestricted four-dimensional embeddings. This test strengthens Calder's previous moving-endpoint deformation by FIXING all endpoints.

## Exact construction
In R4 (++++) set R=1, k=5, L=4*pi/k, H=1, phi_j=2*pi*j/3, b_j=j-1, q in [0,1], s in [0,L].
A(s,q)=(1-q)*exp(i*k*s)+q.
X_j(s,q)=(R*Re(A*exp(i*phi_j)), R*Im(A*exp(i*phi_j)), b_j*H*sin(pi*q)*sin(pi*s/L), s).

At q=0 this is the historical two-turn helix; at q=1 it is three straight parallel lines. At s=0,L, A=1 and z=0 for every q. All six endpoints are fixed pointwise.

For adjacent strands at equal s,
d_eq^2=3*R^2*abs(A)^2+H^2*sin(pi*q)^2*sin(pi*s/L)^2.
A three-region partition proves:
- q outside [1/4,3/4]: abs(A)>=1/2, hence d_eq>=sqrt(3)*R/2.
- q in [1/4,3/4] and s in [0,L/8] or [7L/8,L]: cos(k*s)>=0, abs(A)>=1/sqrt(2), hence d_eq>=sqrt(3/2)*R.
- q in [1/4,3/4] and s in [L/8,7L/8]: d_eq>=H*sin(pi/4)*sin(pi/8).
Thus d_eq>=d0=0.27059805007309845. The spatial derivative magnitude of any strand is bounded by V=R*k+H*pi/L=6.25. For different s,t, delta=abs(s-t), triangle inequality gives
distance >= sqrt(delta^2+max(0,d0-V*delta)^2) >= d0/sqrt(1+V^2)=0.04275192152953738.
For radius-a finite exclusion neighborhoods with a=0.01, this exceeds 2*a=0.02. Pairwise tube collision is analytically excluded along the entire endpoint-fixed isotopy.

The xy-projected pair winding is 2 at q=0.49, undefined at q=0.5 (projected difference vanishes at s=L/4 and 3L/4), and 0 at q=0.51. At the apparent projection singularities, full z separation of adjacent strands is H/sqrt(2), so no full-geometry collision occurs. Projection winding is not an invariant of the unrestricted R4 embedding.

## Executed numerical verification
Python/NumPy/SciPy executed with deterministic differential_evolution seed=20261023. Pairwise optimized centerline separations: (0,1) 0.4069931741; (0,2) 0.4092303097; (1,2) 0.3990922076. These optimization results are supplementary; the analytic lower bound supplies the certificate. ALL_ASSERTIONS_PASSED.

## Research boundary
This is a geometric embedding isotopy, not a physical process. It does not demonstrate physically permitted worldtube unbraiding, release of interbraid, an energy barrier, a Kerr/ER mechanism, or a change to BEDROCK BR-006. The native finite-core morphology, timesheet/medium response, endpoint-history constraints and physical admissibility remain open. A finite-radius exclusion neighborhood is used; individual normal-tube reach was not separately proved.

## Retrieval and reading
Live BEDROCK blob 83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8 and subordinate STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 retrieved complete, with controlling directives inspected. SAT REUILIGIG blob 6d3de4693f0fc3e8fcd2586b07818718189bb56f examined. Random math archive selected SAT [[[SAT_2025_DERIV]]].txt; random unrelated selected SAT MISC/AN Excellent Request.txt, blob 1f275c8abf64cda346082f2c0abc3204826e0e9c (45,149 characters). Unrelated file includes constructed High Gothoslavic literary translations, not authenticated medieval evidence. Private or restricted material was not published. Mersearch bridge shared request 2026-10-21-orson-nlm-big-haul-math-001 occupied; not overwritten; bounded direct reads used, no fresh Mersearch execution claimed.

## Minimal reproducibility checks
```python
from math import pi,sin,sqrt
R=k/5 if (k:=5) else 1
H=1.; L=4*pi/k; a=.01
d0=min(sqrt(3)*R/2,sqrt(3/2)*R,H*sin(pi/4)*sin(pi/8))
V=R*k+H*pi/L
assert d0/sqrt(1+V*V)>2*a
assert abs(L*k-4*pi)<1e-12
print(d0,V,d0/sqrt(1+V*V))
```
Full executed source, numerical stdout, plot, and provenance packet are preserved in the corresponding Calculation Relay conversation for manual archival.

# Ravel s4 | Smooth 4D capsule contact asymptotics
2026-10-15 13:48 UTC | SANDBOXED | GEN/DERIVED/EXECUTED

Source: Mercer finite flat-ended tube result (WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-finite-segment-angle-overlap-20261015t1336z-s3.md) and Ravel continuity (WORKSPACES/RAVEL/CONTINUITY_2026-10-11_POSTREENTRY_GEOMETRIC_FRAME.md).

Let C_A,C_B be radius-R Euclidean neighborhoods of two segments of half-length L in R4, axes tilted theta in (u,t), centers separated by D in y. Put p=2R-D>0, delta=L*theta/sqrt(R*p). All R,D,L,p have length units; theta is radians; V4 has length^4.

Exact parallel identity: V_capsule(theta=0)=2L*V3ball_lens(D,R)+V4ball_lens(D,R). The n-ball lens is V_n=pi^(n/2)*R^n/Gamma(n/2+1)*I_{1-(D/(2R))^2}((n+1)/2,1/2), I regularized incomplete beta.

Near contact V3ball_lens=(pi/2)*R*p^2-(pi/12)*p^3, V4ball_lens=(8pi/15)*R^(3/2)*p^(5/2)+O(p^(7/2)) at fixed R.

For fixed delta as p->0, theta->0:
V_capsule=pi*R*L*p^2*F(delta)+(8pi/15)*R^(3/2)*p^(5/2)*max(0,1-delta^2/4)^(5/2)+o(p^(5/2)).
F(delta)=1-delta^2/6+delta^4/80 for 0<=delta<=2; F(delta)=16/(15delta) for delta>=2. The smooth-cap correction is absent at this order for delta>=2. Derivation: at each rounded end v=|t|-L>=0, p_eff=p*(1-delta^2/4)-v^2/R. Integrate two endcap 3-ball-lens volumes (pi R/2)*[p_eff]_+^2 over v; integral of (1-x^2)^2 from 0 to 1 is 8/15.

Exact parallel fixture R=1.2,L=1,p=0.01: flat=0.000376467519655; endcaps=0.0000219760873443; total=0.000398443606999. Endcap leading asymptote=0.0000220252308847, relative discrepancy -0.2231%.

Independent numerical 2D quadrature after analytic y,z disk-lens reduction (480-point Gauss-Legendre inner u, adaptive outer t):
p=.01, delta=.5: exact 0.000379729596074, asymptotic 0.000380321091869;
delta=1: exact 0.000329155679280, asymptotic 0.000329601009666;
delta=2: exact 0.000202106232054, asymptotic 0.000201061929830;
delta=3: exact 0.000136098740788, asymptotic 0.000134041286553.
The complete executable solver and Class P plot generator are printed in the associated visible relay response and saved locally as ravel_capsule_contact_verified.py. No physical interaction or force law asserted.

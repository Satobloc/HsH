# Ariadne s4 | Embedded R4 normal-tube covariance gate
2026-10-17 04:48 UTC. DERIVED/SANDBOXED, source-grounded continuation.

For any smooth closed embedded curve gamma in R4 with 0<h<reach(gamma), exact uniform normal-tube covariance:
Cov(Tube_h)=Cov_arclength(gamma)+(h^2/5)*(I4+<T T^T>).
Proof: normal Jacobian 1-kappa.n, ball second moments h^2/5, integration by parts <gamma kappa^T+kappa gamma^T>=-2<T T^T>.
Hence trace increment h^2 exactly. For (p,q) torus curve (R cos pt,R sin pt,r cos qt,sigma*r sin qt), eigenvalues:
lambda_A=R^2/2+(h^2/5)*(1+p^2*R^2/(2*v^2)),
lambda_B=r^2/2+(h^2/5)*(1+q^2*r^2/(2*v^2)),
v^2=p^2 R^2+q^2 r^2. Chirality sigma is invisible to covariance.
For p=2,q=3,R=1m,r=.4m,h=.25m (<reach=.4m): V4=.959153141398m^4, lambda_A=.517095588235m^2, lambda_B=.094154411765m^2; independent deterministic 4D quadrature max covariance error 1.654e-14m^2. Complete runnable code is preserved in the scheduled conversation, SHA256 00b6cb5e06daf04a564fa8695f6e120ec0e7cc77868d5e856ee470b7d123dd9d.
Source: WORKSPACES/ARIADNE/SANDBOX_2026-10-16_S4_EXACT_TUBE_REACH.md blob 46635fde5c22637823f1b5490128e1d2cdfcccb5. This is mathematical geometry only, not a physical claim.

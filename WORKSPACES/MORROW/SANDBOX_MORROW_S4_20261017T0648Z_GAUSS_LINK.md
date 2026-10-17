# Morrow s4 | R4 swept-shell exterior Gauss linking
2026-10-17T06:48Z | SANDBOXED / DERIVED / source-grounded reconstruction, not historical worker participation.

Source: HsH WORKSPACES/MORROW/SANDBOX_MORROW_S0_20261017T0300_GLOBAL_HOMOLOGY_GATE.md (blob 0abfce73be0847b098833c7f1077c39ee3cab223).

For gamma(t)=(A cos t,A sin t,0,0), K={Rin<=dist(x,gamma)<=Rout}, take an exterior 2-sphere S_delta=(A+s*n1,0,delta+s*n2,s*n3) with n in S2, A>s>Rout. Its exact distance from the full circle is sqrt(s^2+delta^2+2*s*delta*n2). Thus the global shell clearance is |s-delta|-Rout when |s-delta|>Rout. With delta>=0, admissible exterior regimes are delta<s-Rout (linked) and delta>s+Rout (unlinked).

Define y=S_delta-gamma and degree=(2*pi^2)^(-1) integral_{S2xS1} det(y,y_theta,y_phi,y_t)/|y|^4. Let P=s^2+delta^2+2*s*delta*n2 and Q=2*A*(A+s*n1). Exact integration over t gives degree=A*s^2/pi * integral_{S2} [A*n1*P-(s+delta*n2)*Q]/[P*(P+2*Q)]^(3/2) dOmega. With (theta,phi,t) orientation, degree=-1 for delta<s, degree=0 for delta>s; at delta=s the sphere intersects the core and degree is undefined. The degree changes only by passing through the excluded material band.

Executed deterministic 2D and independent 3D quadratures: A=5m, Rin=.8m, Rout=1.2m, s=1.4m; delta=0,.1,.15m yield clearances .2,.1,.05m and degree -1; delta=3,4m yield clearances .4,1.4m and degree 0. 3D versus 2D discrepancy <2.1e-11. Contact band [.2,2.6]m, core crossing 1.4m. All assertions passed. Complete Python and geometry derivation are in the visible Calculation Relay s4 2026-10-17T06:48Z conversation. No physical force or particle interpretation.

Next Kestrel: test robustness under noncircular centerline deformation, preserving H2 exterior linking versus absence of H1 exterior winding.

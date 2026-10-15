# Morrow s4 | Exact anisotropic torus-core volume
2026-10-15 16:48 UTC. SANDBOXED synthetic Euclidean geometry; not an H(s)H physical law.

Source: WORKSPACES/MORROW/SANDBOX_2026-10-15_S0_CODIM2_TRANSPORTED_TORUS.md (blob 4c18074d0879deb5a0a255ddfc3e572b337ab4f2).

In R4 let K={(A cos s,A sin s,B cos t,B sin t)} with A>B>0. A normal elliptical disk at each (s,t) has semiaxes alpha,beta and orientation psi(s,t). In normal coordinates (u,v)=Rot(psi)(alpha r cos phi,beta r sin phi), r in [0,1], define x=((A+u)cos s,(A+u)sin s,(B+v)cos t,(B+v)sin t). Assume 0<beta<=alpha<B. The exact Jacobian is (A+u)(B+v)alpha beta r, including for varying psi. Integration gives the exact volume

V4=4*pi^3*A*B*alpha*beta + (pi*alpha*beta*(alpha^2-beta^2)/8) * integral_{0..2pi} integral_{0..2pi} sin(2psi(s,t)) ds dt.

For constant psi0 the correction is (pi^3/2)*alpha*beta*(alpha^2-beta^2)*sin(2psi0). For psi=psi0+m*s+n*t with nonzero integer (m,n) it vanishes exactly. For psi=psi0+eta*sin(s), the correction is multiplied by J0(2eta); the first zero is eta=1.20241277884789 radians.

Fixture in metres: A=5, B=1, alpha=.3, beta=.1, psi0=pi/4, eta=.8. Base volume 18.603766008180 m^4. Constant orientation 18.640973540196 m^4; integer twist 18.603766008180 m^4; sinusoidal modulation 18.620710398913 m^4 (J0(1.6)=.455402167639381). Independent deterministic quadrature matched within 3e-11 m^4; seeded Monte Carlo 300000 points per regime and 80 finite-difference Jacobian tests per regime passed.

A meridian at normal radius .4 m has winding +1 and exact minimum material clearance .1 m. The carrier remains embedded T2 x D2, and the twist cancels the volume correction without destroying the codimension-two topological obstruction. This is a geometrical counterexample to identifying averaged normal-core volume with a unique local frame state, not an interbraid force claim.

Reproducible source SHA256 d755ae31cf411da82134686f1bfa70cec00330f1a1cfd1d3da72b0eb4fa9eff2; full Python source and results preserved in the relay conversation.

# Mercer CF031 | Virial closure and global tangential kinetic partition
2026-10-13 16:00 UTC. SANDBOXED source-grounded Mercer-method reconstruction; standard Newtonian Vlasov-Poisson mathematical comparator, not an H(s)H physical claim or historical Mercer chat response.

Source: WORKSPACES/MERCER/SANDBOX_CF029_REGULARIZED_ANGULAR_MOMENTUM_GATE_2026-10-12.md and SANDBOX_CF030_JEANS_UNIQUE_ANISOTROPY_PEAK_2026-10-13.md.

For f(E,L)=C E^k(L0²+L²) with E=Psi-v²/2>0, let xi=r/r0, theta=Psi/Psic, eta=r0² Psic/L0², n=k+3/2, x=2eta xi²theta/(k+7/2). Exact normalized moments are rho=theta^n[1+2eta xi²theta/(k+5/2)], pr=theta^(n+1)(1+x)/(k+5/2), pt=2theta^(n+1)(1+2x)/(k+5/2). Here pt is the SUM of the two tangential pressure components.

**New analytic bound:** q=pt/(pr+pt)=(2+4x)/(3+5x) with q'=2/(3+5x)²>0, so 2/3 <= Kt/K < 4/5 for every finite self-consistent equilibrium in this family, with equality at the lower bound only for eta=0.

**Independent global check:** Jeans equilibrium and zero boundary pressure imply 2K+W=0, where 2K/E0=integral xi²(pr+pt) dxi, |W|/E0=integral m rho xi dxi, E0=4pi rhoc Psic r0³, theta'=-m/xi² and m'=xi²rho. Dimensions consistent.

Executed eight DOP853 equilibria, independent adaptive quadrature and 20,001-node composite Simpson integration; maximum |2K-|W||/|W| = 2.76e-13. k=0 eta=1: xi_R=2.68167636, beta_min=-0.43215466, Kt/K=0.72973328. At eta=3: Kt/K=0.75450141. A deliberately incorrect pt lacking its L² term produces virial residual -0.378400 at eta=1, establishing discriminating power. All scripted assertions passed.

Local complete derivation, executable solver, JSON and Class-P plot are conversation artifacts, not claimed committed. This does NOT establish dynamical stability, self-formation, or worldtube mapping. Next: constrained radial stability or energy-Casimir test with explicitly stated perturbation class.
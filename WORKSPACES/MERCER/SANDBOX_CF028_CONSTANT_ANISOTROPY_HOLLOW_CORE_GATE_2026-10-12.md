# Mercer CF-028 | Constant-anisotropy hollow-core gate

**Date:** 2026-10-12  
**Status:** SANDBOXED mathematical continuation; no physical SAT/H(s)H claim.

## Source and continuity boundary

This pass substantially read:

- Library \`CF025_checkpoint.md\`, created 2026-10-11, the isotropic Newtonian Vlasov–Poisson gate;
- \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt\`, blob \`0323682e7a49278b5a76d0c6a5a7787a13eb17d6\`, including the historical “heloid” morphology and filament/timesheet tug proposal;
- \`WORKSPACES/MERCER/CONTINUITY_HANDOFF_2026-10-09_CONVERSATION_CUTOFF.md\`, blob \`b3a1487a10f36dbbbaa6eb02074b0fda0091d8b1\`;
- the current Cross-Formalism Index, blob \`cccca10267064650dffbc68dd0a6672ee65167e3\`;
- relay receipt \`2026-10-12T0548Z_s4_mercer.md\`, blob \`2db2f622344ec29f23bf8ce26505e1bf0e6dab03\`.

That receipt names a CF-027 note, but the stated repository path currently returns 404. CF-028 therefore does not claim to have read CF-027. It reconstructs the next gate directly from CF-025's explicit distribution family and labels any agreement with the missing work as unverified.

Historical SAT “heloids” are the motivating morphology only. The calculation below is a standard Newtonian collisionless benchmark for an ensemble in a self-consistent potential. It is not a derivation of finite-core worldtube dynamics, Interbraid, Electrogravity, or a particle ontology.

## Distribution and exact moments

Take relative energy
\[
\mathcal E=\Psi(r)-\frac{v^2}{2},
\qquad \Psi=E_{\rm cut}-\Phi,
\]
and the stationary spherical family
\[
f(\mathcal E,L)=C\,\mathcal E^k L^{2\ell},
\qquad \mathcal E>0,\quad k\ge0,\quad \ell\ge0,
\]
with \(L=r v_t\). Since \(E\) and \(L\) are invariants of a static spherical potential, the Vlasov transport term vanishes.

Direct velocity integration gives
\[
\rho(r)=A_{k\ell}\,r^{2\ell}\Psi^{k+\ell+3/2},
\]
where
\[
A_{k\ell}
=2^{\ell+3/2}\pi C\,
B\!\left(\frac12,\ell+1\right)
B\!\left(\ell+\frac32,k+1\right).
\]

The radial pressure obeys
\[
\frac{p_r}{\rho}
=\frac{\Psi}{k+\ell+5/2},
\]
and the total two-component tangential pressure is
\[
p_t=2(\ell+1)p_r.
\]
Therefore the standard spherical anisotropy parameter is exactly
\[
\beta
=1-\frac{p_t}{2p_r}
=-\ell.
\]

The global kinetic ratio inherits the same constant ratio:
\[
\frac{2T_r}{T_t}=\frac{1}{1+\ell}.
\]

Thus every allowed \(\ell>0\) case is tangentially biased, not radially biased. A radial-orbit-instability diagnostic cannot establish instability for this family. That is not a proof of full linear or nonlinear stability.

## Self-consistent field equation and central gate

Let
\[
n=k+\ell+\frac32,\qquad
\Psi=\Psi_c\theta,\qquad r=\alpha\xi,
\]
with
\[
\alpha^{2\ell+2}
=\frac{1}{4\pi G A_{k\ell}\Psi_c^{\,n-1}}.
\]
Poisson's equation becomes the generalized Lane–Emden problem
\[
\theta''+\frac{2}{\xi}\theta'
+\xi^{2\ell}\theta^n=0,
\qquad \theta(0)=1,\quad\theta'(0)=0.
\]

Its regular central expansion is
\[
\theta(\xi)
=1-\frac{\xi^{2\ell+2}}{(2\ell+2)(2\ell+3)}
+O(\xi^{4\ell+4}).
\]

But the density contains the explicit factor
\[
\rho(r)\propto r^{2\ell}.
\]
Hence:

- \(\ell=0\): finite nonzero central density;
- every \(\ell>0\): \(\rho(0)=0\), an intrinsically hollow center.

This is the decisive gate. The pure \(L^{2\ell}\) family cannot represent a centrally concentrated smooth equilibrium once tangential bias is turned on. It can describe shell-like/hollow populations, but it does not by itself give a regular central “heloid” body.

## Numerical verification

The supplied solver integrates the generalized equation to its first zero and checks
\[
\int_0^{\xi_1}\xi^{2\ell+2}\theta^n\,d\xi
=-\xi_1^2\theta'(\xi_1).
\]

| \(k\) | \(\ell\) | \(n\) | \(\beta\) | \(2T_r/T_t\) | \(\xi_1\) | dimensionless mass |
|---:|---:|---:|---:|---:|---:|---:|
| 0 | 0 | 1.5 | 0 | 1 | 3.6537537362 | 2.7140551201 |
| 0 | 0.5 | 2 | -0.5 | 2/3 | 3.2101956532 | 3.2101956533 |
| 0 | 1 | 2.5 | -1 | 1/2 | 2.8817324240 | 3.4619914609 |
| 0 | 2 | 3.5 | -2 | 1/3 | 2.4757609773 | 3.7081356392 |
| 1 | 0 | 2.5 | 0 | 1 | 5.3552754590 | 2.1871995655 |
| 1 | 0.5 | 3 | -0.5 | 2/3 | 4.0442383500 | 2.5908646675 |
| 1 | 1 | 3.5 | -1 | 1/2 | 3.3994113440 | 2.8398199659 |
| 1 | 2 | 4.5 | -2 | 1/3 | 2.7517774675 | 3.1391470144 |

The \(\ell=0\) rows reproduce CF-025 to \(2.2\times10^{-9}\) in dimensionless mass and better in \(\xi_1\). All mass-integral residuals are below \(1.9\times10^{-14}\).

Reproducibility:

- \`WORKSPACES/MERCER/mercer_cf028_constant_anisotropy_gate.py\`, blob \`7c0ce1d7c164fd2f51340af77e339a44c2e7d156\`, local SHA-256 \`ab8890786c88c13aabbdcbf3ccd33b5572b0263bd91445c4e77a89fd4e30f43f\`;
- \`WORKSPACES/MERCER/mercer_cf028_constant_anisotropy_results.json\`, blob \`06884e96939ea0509e0b889e05b93521515a5f99\`, local SHA-256 \`a349a1c16b24d744d803071ac47ba10f6468dae21cecc6e6eda0aacc995e9caa\`.

## Failure condition and next calculation

**Failure condition:** any claim that positive powers of \(L\) provide a smooth centrally concentrated anisotropic equilibrium fails because the density vanishes at the center for every \(\ell>0\).

The smallest repair candidate is not to assume a desired outcome but to replace the singular central suppression with an independently declared angular-momentum scale, for example
\[
f=C\mathcal E^k(L^2+L_0^2)^\ell
\]
or a mixture \(f=f_0(E)+\eta f_1(E,L)\). Either adds a new scale/weight and must be justified rather than fitted to a target. The next blind calculation is to derive its density and pressure moments first, then test whether finite central density, tangential bias, compact support and a self-consistent Poisson solution can coexist. Full stability still requires the linearized Vlasov–Poisson spectrum or controlled \(N\)-body evolution.

## Claim status

- Vlasov moments and generalized ODE: \`STD/DERIVED\`.
- Numerical fixtures: \`STD/DERIVED\` for the stated equations.
- Connection to historical SAT heloids: \`SRC/CANDIDATE\`.
- Any H(s)H finite-core or force interpretation: \`OPEN\`.

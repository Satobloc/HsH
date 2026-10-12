# Mercer CF029 | Regularized angular momentum, hollow-center gate
**2026-10-12. SANDBOXED.** Source-grounded Mercer-method reconstruction, not an authenticated Mercer chat turn. Standard Newtonian Vlasov–Poisson calculation, not a SAT/H(s)H physical claim.

## Source / derivation
Extends `WORKSPACES/MERCER/SANDBOX_CF028_CONSTANT_ANISOTROPY_HOLLOW_CORE_GATE_2026-10-12.md`, whose pure distribution `f(E,L)=C E^k L^(2ell)` yields `rho proportional r^(2ell) Psi^(k+ell+3/2)` and a hollow center for ell>0.

Test independent regularization `f(E,L)=C E^k (L0^2+L^2)`, E=Psi-v²/2>0 and L²=r²v_t², k>-1, L0>0. Direct velocity integration yields
`rho=C L0² I0(Psi)[1+2 r² Psi/(L0²(k+5/2))]`, `I0 proportional Psi^(k+3/2)`.
Anisotropy `beta=1-(sigma_t²)/(2 sigma_r²)=-x/(1+x)`, `x=2r²Psi/[L0²(k+7/2)]`. Central density is nonzero, beta(0)=0; beta(r)<0 away from the center where Psi>0.

Self-consistent Poisson equation in dimensionless radial variable xi:
`theta''+2 theta'/xi= -theta^(k+3/2)[1+(2eta/(k+5/2))xi²theta]`.
Near the center, `rho/rho_c =1+[-(k+3/2)/6+2eta/(k+5/2)]xi²+O(xi^4)`.
A local centrally peaked center therefore requires `0<eta<(k+3/2)(k+5/2)/12`. For k=0 the threshold is eta=0.3125.

## Executed checks
SciPy DOP853 integration for k=0: eta 0, 0.1, 0.25, 0.30, 0.40, 1.00 gave equilibrium cutoff radii respectively 3.653754, 3.448793, 3.229198, 3.170680, 3.068670, 2.681676. Maximum normalized density is 1 at eta≤0.3, 1.010002 at eta=0.4, 1.219476 at eta=1. Twelve tested equilibria; independent velocity moment quadrature agreed to ~4.45e-16 and Poisson boundary-flux/mass error was ~8e-12.

**Interpretation:** Hollow-center obstruction is specific to pure angular-momentum-power family, not a theorem about tangential anisotropy. Stability, physical worldtube mapping, and legitimacy of L0 remain open. No historical constants fitted. Full original research note, executable source, JSON and Class P figures were created in the conversation runtime; this compact GitHub checkpoint preserves the result and its bounds.

## Routing
Research owner: Mercer. Incoming Ravel handoff belongs to `REVROT3-19-20261011:45:s1` and is only a repository packet, never authenticated ChatGPT delivery.
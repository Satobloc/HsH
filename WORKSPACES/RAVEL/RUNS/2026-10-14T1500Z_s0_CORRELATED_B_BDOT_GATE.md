# Ravel | 2026-10-14 15Z s0 | correlated material deformation gate
**SANDBOXED; apparatus thin-waveguide only.** Continuation of Ravel's 2026-10-11 geometric-frame checkpoint. No promotion or physical-particle claim.

## Exact first-order common-bath identity
For a deformed closed centerline r(theta,b)=((R+a cos 2theta)cos theta,(R+a cos 2theta)sin theta,b sin 2theta), use arclength chi=2pi s/L and thin-waveguide H0/E0=(N-ell phi0)^2-[L/(2pi)]^2 kappa(chi)^2/4. The fractional holonomy derivative g=(1/2pi)integral F_btheta dtheta, F_btheta=-r' dot ((partial_b r') cross r'')/|r'|^3. At b=0, reflection symmetry makes L'(0)=U'(0)=0. Hence V=partial_b H=-2 E0 ell g(N-ell phi0). The periodic local normal-frame transport potential A_b satisfies partial_chi A_b=F_btheta(dtheta/dchi)-g, with zero mean; let A=hbar ell A_b.

The *same* stochastic displacement b(t) drives delta H=V delta b+A delta dot b. With Fourier convention delta dot b(omega)=-i omega delta b(omega), the transition amplitude from i to j is M_ji=V_ji-i omega_ji A_ji, omega_ji=(E_j-E_i)/hbar. A positive oscillator bath has S_b(omega)=2 Gamma kBT/[(K-M omega^2)^2+Gamma^2 omega^2]. The joint Golden-Rule rate is W_ij=S_b(omega_ji)|M_ji|^2/hbar^2. **Do not add isolated uniform and local rates as independent channels:** the cross term is 2 S_b Re[V_ji (i omega A_ji*)]/hbar^2.

Under the b-dependent frame unitary W(b)=exp(-i b G/hbar), V'=V+i[G,H0]/hbar and A'=A-G, giving the same M_ji. Dense seeded Hermitian-G 29x29 matrix test: max amplitude discrepancy 3.58e-15.

## Executed fixture (Python; local complete reproducibility package)
R=E0=hbar=M=1, a=.1, ell=1, phi0=0, K=4, Gamma=2, kBT=.04, 4096 quadrature points, n=-14..14. L=6.34570686534; g=.300805777584; first doublet E1=.665909101203, E2=.809742365379, omega12=.143833264176. Rates in E0/hbar:
- uniform W_V=.00363923235465
- local W_A=.00004685325558
- cross W_X=+.00082585684870
- **joint W=.00451194245894**.
The incoherent sum .00368608561024 underestimates the joint rate by 22.40% relative to that sum; cross term is 18.30% of the joint result. nmax 8 to 14 convergence ~5e-12.

Reference-flux scan: phi0=.03 -> W=.003061697; phi0=.10 -> .001717402; phi0=.20 -> .002812324. Controls: ell=0 gives zero coupling; kBT=0 gives zero rate; a=0 gives g≈0 but nonzero local transport (RMS A_b=.7071062), requiring degenerate-state handling at circular limit. Dimensions: [V]=energy/length, [A]=action/length, [S_b]=length^2*time, [W]=1/time.

## Scope and next calculation
This is a gauge-covariant *conditional* reduced model. The temporal transport ansatz is not yet derived from the complete finite-core Laplace–Beltrami operator. Next: derive full finite-radius band mixing, include b-dependent metric potential and compare explicit colored-noise time propagation. Source boundaries respected; no restricted prior art consulted.

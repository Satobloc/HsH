# Calculation 003: intrinsic 4DHH–Kerr-oblate spectral splitting without EFT tension coefficient

**Date:** 2026-10-22. **Status:** mathematical geometry SANDBOX, neither physical SAT dispersion nor particle-spectrum prediction. **Predecessor:** `SANDBOX_2026-10-22_4DHH_KERR_TUBE_EFT_FREE_GATE.md`.

## Origin and constraint ledger
BEDROCK and AGENTS first: no new mechanics unless forced; preserve inherited literal spin, Kelvin-like medium, time sheet/bulk, precession/shelf-cocking. SAT archive `SAT O Derivations/SAT_D2_MODE_EXPANSION.txt` imposes the historical EFT kernel \(K=-T\partial_\lambda^2\) and \(\omega_n=|k_n|\sqrt{T/m}\), but these T and m are NOT imported. Read `SAT_D4_STRAIN_CURVATURE_MAPPING.txt`, `SAT_D5_GAUGE_TOPOLOGY.txt` and Ravel's `KERR_PARTICLE_REGIME_COLLISION_2026-09-16.md`. The Mersearch shared bridge remains occupied by Orson's dated request, so this bounded known-file comparison is NOT a comprehensive Mersearch search.

## Exact surface operator (kinematic geometry only)
The chosen constant-r oblate Kerr-coordinate spatial two-surface in Euclidean 3-space (not Kerr spacetime) has first fundamental form
\[
d\ell^2=E\,d\theta^2+G\,d\varphi^2,\quad E=r^2+a^2\cos^2\theta,\quad G=(r^2+a^2)\sin^2\theta.
\]
Therefore
\[
\boxed{\Delta_\Sigma f={1\over\sqrt{EG}}\partial_\theta\left(\sqrt{G/E}\partial_\theta f\right)+{1\over G}\partial_\varphi^2 f.}
\]
No worldsheet tension, EFT input or wave equation is needed to define this differential-geometric operator. Define eigenvalue problem \(-\Delta_\Sigma f=\lambda f\). The eigenvalue has dimension length^-2, NOT frequency squared. Let \(\epsilon=a^2/r^2\). In the spherical limit the l=1 subspace has three degenerate eigenvalues \(2/r^2\).

## Perturbation, explicitly integrated
Let \(x=\cos\theta\). The oblate area weight relative to the r-sphere is \(W(x)=\sqrt{(1+\epsilon)(1+\epsilon x^2)}=1+\epsilon(1+x^2)/2+O(\epsilon^2)\).
Using the Rayleigh quotient \(\lambda=\int|\nabla f|^2dA/\int |f|^2dA\) and axisymmetric perturbations:
- for \(l=1,m=0\), trial/eigenbasis function \(f_0=x\); numerator \(N_0=\int_{-1}^1 (1-x^2)(1-\epsilon x^2)W\,dx=4/3+8\epsilon/15+O(\epsilon^2)\); denominator \(D_0=\int_{-1}^1 x^2W\,dx=2/3+8\epsilon/15+O(\epsilon^2)\).
- for \(l=1,|m|=1\), \(f_1=\sqrt{1-x^2} e^{i\varphi}\); numerator \(N_1=\int_{-1}^1 [x^2(1-\epsilon x^2)+(1-\epsilon)]W\,dx=8/3-8\epsilon/15+O(\epsilon^2)\); denominator \(D_1=\int_{-1}^1(1-x^2)W\,dx=4/3+4\epsilon/5+O(\epsilon^2)\).
The Rayleigh quotients give the FIRST-ORDER perturbation eigenvalues (the eigenvectors may mix with higher l at next order):
\[
\boxed{\lambda_{1,0}={1\over r^2}(2-4\epsilon/5)+O(\epsilon^2/r^2)}
\]
\[
\boxed{\lambda_{1,\pm1}={1\over r^2}(2-8\epsilon/5)+O(\epsilon^2/r^2)}
\]
and
\[
\boxed{\lambda_{1,\pm1}-\lambda_{1,0}=-4a^2/(5r^4)+O(a^4/r^6).}
\]
All coefficients derive from the existing Kerr-oblate geometry and the sphere's standard Laplacian; no fitted dimensionless coefficient.

## Exact coordinate-rotation crosscheck
From prior gate: rotating labels \(\varphi' = \varphi+\Omega t\) mix Fourier harmonics \(e^{-i\omega_{inert} t+i m\varphi'}\) into a rotating chart, with \(\omega_{chart}=\omega_{inert}-m\Omega\) when \(\varphi'=\varphi+\Omega t\) is inertial angle. This shift is COORDINATE bookkeeping; it cannot be counted as an intrinsic physical spectrum, gyromagnetic ratio or gravity. A physical wave equation/mode response remains separately required.

## Numerical/symbolic execution
Executed SymPy script `/mnt/data/oblate_modes_gate.py` with exact rational integration and assertions:
```
lambda_10 * r² = 2 - 4*eps/5
lambda_1pm1 * r² = 2 - 8*eps/5
delta * r² = -4*eps/5
first-order control epsilon=.01: 249/125 248/125
```
The epsilon=.01 values are truncated first-order expressions, not exact eigenvalues. Valid small \(a/r\), not reliable near Kerr ring limit \(r/a\to0\).

## Cross-sector verdict and next gates
**Transferred** from SATO D2: mode decomposition and geometrically grounded spatial kernel idea. **Not transferred**: the old tension/inertial normalization T/m and the oscillator commutator (not geometrically derived). The same oblate parameter \(a/r\) constrains (i) spatial mode splitting, (ii) finite-core shape anisotropy from Ravel's work, (iii) spin length \(a=J/mc\) IF the original Kerr correspondence applies. This begins a genuine star closure; a or r are NOT independently adjustable fit coefficients. To make a physical prediction, recover the old 4DHH/Kelvin-like medium response and boundary conditions and derive an evolution operator with measured frequency units, then test whether the resulting mode splitting, magnetic response and local-time Frobenius condition close simultaneously. No new action or medium law has been introduced.

## Essential scope
This is an exact first-order **intrinsic geometry** result on a chosen Kerr-oblate comparison section. The physical 4DHH native structure, true Kerr/Einstein–Maxwell metric, rotating material worldtube dynamics and excitations remain distinct and unproved. Do not substitute this for a finite-core EFT reproduction.

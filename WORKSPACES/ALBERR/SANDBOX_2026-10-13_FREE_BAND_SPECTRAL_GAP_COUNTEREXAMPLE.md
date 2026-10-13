# Alberr-source-reconstructed free-band spectral gate (2026-10-13)

**Source-grounded scheduled calculation, not historical Alberr participation.** Continuing Alberr's 2026-10-11 tension/degeneracy sandbox.

Take a flat free cylinder S¹_R×[0,L] with scalar displacement h and E=1/2 ∫(A h²+B|∇h|²+D(Δh)²)dS, B>0,D≥0. In the θ-independent axial sector, natural free ends are D h''=0 and B h'-D h'''=0. For the first nonconstant axial mode, the Neumann Poincaré inequality and linear trial h=y-L/2 yield the **rigorous bound** π²B/L² ≤ λ₁ ≤ 12B/L². Hence λ₁→0 for L→∞ even with positive tension and arbitrarily large fixed bending stiffness: tension removes exact harmonic degeneracy on each finite band but does not guarantee a uniform gap across elongated bands.

Dimensionless ε=D/(B L²), μ=λ₁L²/B. Gauss-Legendre integrated odd Legendre Rayleigh-Ritz solver (order 19) gives:

| ε | μ |
|---:|---:|
| 0 | 9.869604401 |
| 0.0001 | 9.878955936 |
| 0.01 | 10.460731584 |
| 0.1 | 11.550158916 |
| 1 | 11.944357196 |
| 10 | 11.994301072 |
| 100 | 11.999428725 |
| 10000 | 11.999994286 |

For the full cylinder, B min(R⁻²,π²L⁻²) ≤ λ_full ≤ min(B/R²+D/R⁴,12B/L²). For L>√12 R, the first axial mode lies below all nonzero angular sectors, establishing the long-band result in the full model.

Dimensional 1D test: A=0.03 N/m², B=0.2 N, D=0.05 N·m², η=1 N·s/m². Excess decay rates are 2.358740/s (L=1m), 0.083686/s (L=5m), 0.020129/s (L=10m). The numerical solver and Class-P figures are available in the scheduled-run artifact package; this markdown note carries the mathematical result and inputs.

**Boundary:** Constitutive fixture only; no physical SAT/H(s)H prediction or experimentally established parameter mapping.

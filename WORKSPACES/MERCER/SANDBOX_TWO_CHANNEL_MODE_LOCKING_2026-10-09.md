# Mercer sandbox: two coupled stress channels (2026-10-09)
Status: NONCANONICAL. No empirical constants targeted.

Sources substantially read:
- SAT archive: `[[SAT26 TOOLBOX]]/H(s)H STRUCTURAL SKETCH.txt`, lines 1-350, blob 64906501d01db12171d3a2e58dc4fd0140d2784d.
- HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/BOSONIC TIME AND TWO GRAVITIES.txt`, opening 600 lines and closing section from about character 47000, blob bbc868efd38c38ba4710f82da1246f60d053aaa2.
- HSH_RESOURCES War Room, Tool Chest, Toolkit digestion, source index and reference routing reviewed. No quarantined content.

LOCAL:MERCER-2CH trial scalar fields s and f, with kinetic coefficients rho_s,rho_f, gradient moduli K_s,K_f, and local coupling g(s-f)^2/2. This is not a 4D metric.
Static collective U=(K_s*s+K_f*f)/(K_s+K_f) obeys a Poisson equation. Relative D=s-f obeys a screened Poisson equation with ell=sqrt(K_s*K_f/(g*(K_s+K_f))).
For sheet-sheet, filament-filament, and cross sources, point-source kernels respectively:
G_ss=[1+(K_f/K_s)exp(-r/ell)]/[4*pi*(K_s+K_f)*r]
G_ff=[1+(K_s/K_f)exp(-r/ell)]/[4*pi*(K_s+K_f)*r]
G_sf=[1-exp(-r/ell)]/[4*pi*(K_s+K_f)*r].
Far-field responses merge; short-range source-type dependence survives.

If K_s/rho_s=K_f/rho_f=c_star^2, dynamic branches are omega_collective^2=c_star^2*k^2 and omega_relative^2=c_star^2*k^2+omega_gap^2, where omega_gap^2=g*(1/rho_s+1/rho_f). EXACT TEST: ell*omega_gap=c_star. With unequal speeds this fails.

Scripted fixture K_s=4,K_f=1,rho_s=4,rho_f=1,g=0.2 gives ell=2, omega_gap=0.5, c_star=1. Matrix eigenvalues agree with analytic formulas to 1.8e-15. Fourier Yukawa inversion error below 3e-15. At r/ell=1, force ratios (ss,ff,sf)=(1.18394,3.94304,0.26424). For rho_s=rho_f=1, ell*omega_gap/c_collective=0.8.

Failure: no tensor GR/metric derived; relative mode can violate composition universality; equal speeds are not forced. Next: time-domain causal-support solver and finite-core 4D reconstruction. Related prior Mercer single-field carrier kernels (2026-10-03) do not contain this two-mode length-gap test.

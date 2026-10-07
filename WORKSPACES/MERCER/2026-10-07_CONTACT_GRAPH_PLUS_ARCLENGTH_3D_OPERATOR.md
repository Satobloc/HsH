# Mercer sandbox — contact graph + filament arclength yields a 3D long-wave operator

**Date:** 2026-10-07  
**Status:** LOCAL / SILOED PLAYGROUND / not canonical  
**Namespace:** `LOCAL:MERCER-CONTACT-3D-20261007`

## Sources actually read
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Filament onto.txt`, lines 1–1500 requested/read. Retained only: rigid/persistent filament + flexible resolving surface, direct filament interaction/interbraid intuition, finite-core/worldtube direction, and insistence that SAT incorporate standard physics. Historical numerical constants, particle assignments, black-hole identifications, and fitted mechanisms excluded.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H REWORK.txt`, lines 1–1500 requested/read. Retained: finite-worldtube action audit, explicit longitudinal tension/bending/interfilament terms, and the requirement that the principal symbol/light cone be derived rather than calibrated.
- Current Common front door / Reference Desk / symbol controls and HSH_RESOURCES War Room/Tool Chest/toolkit routing overview-read first. PRIOR_ART not entered.

## Construction
Let strand index i live on a 2D contact graph G and s be arclength along each strand. For transverse displacement u_i(s,t), use
E = 1/2 sum_i int ds [T_parallel |d_s u_i|^2 + B_parallel |d_s^2 u_i|^2]
  + 1/2 K_perp sum_(ij in E(G)) int ds |u_i-u_j|^2.
With kinetic susceptibility rho, graph eigenmode L_G phi_a=lambda_a phi_a gives
rho omega^2 = T_parallel k_s^2 + B_parallel k_s^4 + K_perp lambda_a.

For a locally square transverse contact graph with spacing a_perp,
lambda(qx,qy)=4 sin^2(qx a_perp/2)+4 sin^2(qy a_perp/2).
At long wavelength:
rho omega^2 = T_parallel k_s^2 + K_perp a_perp^2(k_x^2+k_y^2)+B_parallel k_s^4+O(k_perp^4).

Thus 1 longitudinal filament coordinate + 2 transverse contact-graph coordinates generates a 3D long-wave elastic operator. Isotropy is not automatic; it requires the derived constitutive equality
T_parallel = K_perp a_perp^2.
Then c_eff^2=T_parallel/rho=K_perp a_perp^2/rho.

## Numerical lattice discriminator
For matched coefficients, normalized exact cubic-lattice omega^2/q^2 along equal-|q| directions:
q a=0.1: axis 0.999167, face-diagonal 0.999583, body-diagonal 0.999722; directional spread 5.56e-4.
q a=0.5: 0.979340, 0.989627, 0.993075; spread 1.39e-2.
q a=1.0: 0.919395, 0.959022, 0.972529; spread 5.59e-2.
So approximate rotational isotropy emerges only for wavelengths large compared with contact spacing, while anisotropy reappears predictably near the weave scale.

## Failure conditions
- If the contact graph is effectively 1D, the coarse operator is only 2D (s + one graph coordinate).
- If graph spectral dimension is not ~2 over the relevant band, the transverse continuum is not 2D.
- If T_parallel/(K_perp a_perp^2) does not approach 1, the long-wave cone is anisotropic.
- If contact rearrangement destroys a stable low-frequency Laplacian regime, this quadratic bridge fails.

## Next solver
Generate actual finite-worldtube contact networks. Measure graph spectral dimension d_s from the low-eigenvalue counting law N(lambda) ~ lambda^(d_s/2), independently measure T_parallel, K_perp, rho and a_perp, then predict the full low-k dispersion without fitting. The sharp target is d_s ~ 2 plus T_parallel ~ K_perp a_perp^2. Only after those are independently recovered should the resulting 3D cone be compared with the resolving-surface/readout geometry.

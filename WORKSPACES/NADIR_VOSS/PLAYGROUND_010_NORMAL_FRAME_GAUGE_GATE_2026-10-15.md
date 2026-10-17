# Nadir Playground 010 | SO(4) normal-frame gauge control
2026-10-15 20:00 UTC nominal. SANDBOXED; source-grounded relay reconstruction, not historical Nadir participation.

Source: WORKSPACES/NADIR_VOSS/PLAYGROUND_009_RESONANT_QUADRATIC_DRIFT_2026-10-14.md, blob 429e9c4f5d9d5e6339de2dcef9c00196cec6d281.

Let Omega0=J12+2J34, Q0=exp(s Omega0), H=exp(eta sin(ks) J23), and Qg=Q0 H. Since H e1=e1, the centerline gamma'=ell Qg e1 equals ell Q0 e1 for all s. The finite-radius material tube is unchanged. Exact right-body connection: Omega_g=cos(theta)Omega0+sin(theta)(-J13+2J24)+theta'J23. The naive connection Omega0+eta k cos(ks)J23 omits the gauge-completion term and changes the physical centerline. At k=1 its first-order transverse drift is t3/ell=-(pi/2)eta+O(eta^3). Truncating the exact gauge connection to first order gives artificial longitudinal drift t1/ell=(pi/2)eta^2+O(eta^4), whereas the exact gauge yields zero translation for every eta.

Executed scipy DOP853 (rtol 2e-12, atol 1e-13): eta=0.025 gives naive t3/ell=-0.03925702573104, gauge-linear drift norm/ell=0.000981428150874, exact-gauge drift norm/ell=2.07e-14. Exact gauge closure passed k=1,2,3,7, eta=0.2,0.1,0.05. No physical interbraid force law inferred.

Full executable Python and numerical derivation preserved in the scheduled ChatGPT research artifact. Next: test gauge-invariant centerline or normal-bundle curvature rather than raw connection coefficients.

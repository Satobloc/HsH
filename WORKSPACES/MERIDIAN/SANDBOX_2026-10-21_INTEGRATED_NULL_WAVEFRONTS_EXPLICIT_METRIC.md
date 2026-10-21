# Cruller optical calculation | Integrated null wavefronts in explicit toy spacetime | 2026-10-21

**SANDBOX. Python/SciPy integration actually executed. Not a sourced solution of GR or a derived H(s)H metric.**

Unlike previous wavefront ansatz r=ct/[1+eps F], use a specified static 2+1 Lorentzian metric ds²=-N(x,y)²dt²+dx²+dy², N=1+eps exp(-[(x-.55)²+(y-.32)²]/(2*.48²)); c=1. This is a deliberately imposed localized lapse bump, not the toroidal global metric nor gravitational polarization derived from worldtubes.

For spatial unit tangent u and coordinate time t, null rays satisfy dx/dt=N u and du/dt=-grad N+u(u·grad N). The ODEs preserve |u|=1 and come from the optical metric n_optical=1/N, equivalently Fermat's principle in the static spacetime. We integrated 500 initially isotropic rays starting at (0,0), to t=2 (scipy solve_ivp rtol=2e-8, atol=2e-10).

Computed at t=2:
- eps=0: min/max radius exactly 2.0000000, maximum unit-direction error 1.1e-16;
- eps=.025: radius min 2.0027656, max 2.0267361, mean 2.0099299, max unit-direction error 8.3e-12;
- eps=.25 exaggerated: radius min 2.0263081, max 2.2301104, mean 2.0831445, max unit-direction error 8.7e-11.

This is an explicit demonstration that propagation through an inhomogeneous Lorentzian optical geometry deforms expanding emission wavefronts even if rays start isotropically at one emission event. It does not show all sky patterns, caustics, disappearing stars, reappearance, optical birefringence, Thirring, cosmic chirality or lightcone return. Wavefront comparison uses t=const slicing, not invariant sphere distortion. A lapse bump with eps>0 locally speeds coordinate light relative to baseline, and may violate usual source energy conditions when interpreted through Einstein eq; no physical matter model was claimed.

Local deliverables generated: /mnt/data/cruller_null_ray_lapse_fixture.py, /mnt/data/cruller_integrated_null_wavefronts_20261021.png and .svg. The physical next gate is a sourced metric from allowed finite-core stress response, full 3+1 ray transport and screen-Jacobi matrix, then flux/time-resolved sky predictions matched to real Rubin selection. Mersearch request was occupied by Orson and no new Mersearch run was performed.

Meridian, mathematical sandbox.

# Kestrel s1 | Sharp bounded-speed twist contact gate

Run: CALC-S1-20261017T0312Z-KESTREL-01. SANDBOXED Euclidean R4 geometry; no physical force or confinement claim. Source: WORKSPACES/KESTREL/SANDBOX_2026-10-16_S1_NONUNIFORM_TWIST_CONTACT_GATE.md.

Let a=.3 m, b=.1 m be normal ellipse semiaxes, center separation D=.5 m, product-torus base radii A=5 m, B=1 m. Exact convex support threshold Dcrit(psi)=min_q[sqrt(a^2+b^2 q^2)+sqrt(a^2(cos psi+q sin psi)^2+b^2(-sin psi+q cos psi)^2)]. Contact iff D<=Dcrit(psi). Numerical root psi_c=.48760591259754693 rad; contact-angle measure Lc=4 psi_c=1.9504236503901877 rad per 2pi; noncontact Ln=4.3327616567893985.

For any monotone degree-one angular map psi(s+2pi)=psi(s)+2pi with m<=psi'(s)<=M, change variable w=d s/d psi in [1/M,1/m]. Total time int_0^(2pi)w dpsi=2pi. Sharp contact duty bounds:
Fmin=max(Lc/M,2pi-Ln/m)/(2pi), Fmax=min(Lc/m,2pi-Ln/M)/(2pi).
For m=.5,M=2, Fmin=.15520978254146856, Fmax=.6208391301658742; uniform twist F0=.3104195650829371. Extremizers: (wC,wN)=(.5,1.2250785763087026) and (2,.5498428473825946), respectively. They are piecewise Lipschitz angle maps; smooth approximants approach the same bounds.

Let I0(psi) and Iu(psi) denote normal-ellipse intersection area and first radial moment. Exact product-torus contact four-volume V=2pi B int_0^(2pi)[A I0(psi)+Iu(psi)] w(psi) dpsi. Since overlap is supported only on contact angles, these extremizers also attain Vmin=V0/M and Vmax=V0/m for this fixture. Deterministic 1D ellipse-overlap quadrature: V0=.2612623557271263 m^4; Vmin=.13063117786356315 m^4; Vmax=.5225247114542526 m^4. Smooth beta=-.2,0,+.2 gives duty .43510673656,.31041956508,.22709411453 and V=.39724584353,.26126235573,.18858773955 m^4.

Executable script and full captured output are preserved inline in the scheduled conversation and local reproducibility artifacts. Tests passed for support endpoints, threshold root, exact bound attainability, inverse-time numerical occupancy, independent smooth-family comparisons, and volume inequalities. Two Class P figures generated. No random draws.

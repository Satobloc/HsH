# Alberr | Radial Householder curvature gate (2026-10-14)

**Status:** first-principles sandbox mathematics, not established SAT/H(s)H physics. Inputs: BEDROCK, Alberr Hall, Alberr 2026-10-13 spectral checkpoint. No director dynamics assumed.

## Metric and domain

On punctured Euclidean four-space x^a (metres), r=sqrt(x·x)>0, choose u=x/r, |u|_δ=1. Define g_ab=δ_ab−2u_a u_b. Its eigenvalues are (-1,+1,+1,+1) and g^-1=g in Cartesian Euclidean components. Since δ=dr²+r²dΩ₃² and u♭=dr,

**g=−dr²+r²dΩ₃²**.

This is a k=+1 Robertson–Walker metric with a(r)=r, not flat Minkowski. Warped-product identities yield

- Ric_rr=−3a''/a=0;
- Ric_ij=[a a''+2(a'^2+1)]γ_ij=4γ_ij;
- scalar curvature **R=12/r²** (m^-2);
- Einstein tensor **G_rr=6/r²**, **G_ij=−2γ_ij** (m^-2);
- Kretschmann **R_abcd R^abcd=48/r⁴** (m^-4).

Equivalently in Cartesian components with P=δ−uu: Ric=4P/r² and G=(6uu−2P)/r². The Ricci endomorphism eigenvalues are (0,4/r²,4/r²,4/r²). The origin is excluded; numerical domain 0.5≤r≤10 m.

## Numerical verification

A standalone Python/NumPy solver computes first and second Cartesian derivatives of g, then Christoffel, Riemann, Ricci, Einstein and Kretschmann. 80 seeded random orientations/radii agree with the independent warped-product formulas: maximum absolute errors Ricci 1.42e-14, scalar 4.26e-14, Einstein 1.42e-14, Kretschmann 1.82e-12. At r=1m: R=12m^-2, K=48m^-4, G_rr=6m^-2, G_xx=−2m^-2. At r=2m: R=3m^-2, K=3m^-4. Constant u=(1,0,0,0) yields exactly flat g=diag(-1,1,1,1).

If interpreted through Einstein equations, this metric requires effective p=−ρ_E/3 with ρ_E=6c⁴/(8πG_N r²), **not vacuum**. This interpretation is conditional; no field equation for u has been derived.

## Gate

**The Householder signature construction alone does not imply vacuum Einstein geometry.** Director gradients generate curvature; flat δ does not prevent this. A proposed vacuum exterior cannot use this radial director unmodified. Next: impose a concrete finite-core director action and seek asymptotically constant, nontrivial solutions with G_ab=0 outside the core, or a restricted-family no-go. Reproducible local Python and Class-P figure produced alongside this note.

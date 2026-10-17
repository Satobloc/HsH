# Morrow s1 | Exact 4D twisted-torus contact volume
2026-10-16T04:12Z. SANDBOXED synthetic Euclidean geometry; not a physical claim.

Sources: Morrow `WORKSPACES/MORROW/SANDBOX_2026-10-15_S4_ANISOTROPIC_TORUS_VOLUME.md` (blob 615b491a53d5a3bf4dd7d9cf46ad2e7f97767f6e); Kestrel `WORKSPACES/KESTREL/SANDBOX_2026-10-15_S4_NORMAL_CONTACT_VOLUME_COUNTEREXAMPLE.md` (blob 9d286cfd4a256725c59a3e6bae0a62dbe4c9d198).

Let two Euclidean R4 product-torus neighborhoods have radial centers (A,B) and (A+D,B), with elliptical normal fibers of semiaxes a,b and relative orientation ψ(s,t)=m s+n t+φ. Fixture A=5,B=1,a=.3,b=.1,D=.5 metres. Volume measure is (A+u)(B+v)du dv ds dt. For any integer (m,n)≠(0,0), ψ is uniform modulo π on the base torus. The 4D intersection volume is independent of (m,n) and φ.

At (u,v) inside first ellipse, let z=(D-u)^2+v^2. Fraction of orientations also inside the second ellipse:
f(z)=0 if z≥a²; f(z)=1 if z≤b²; otherwise
f(z)=(2/π)asin(sqrt(b²(a²-z)/(z(a²-b²)))).
Thus V_winding=4π² B ∫_{u²/a²+v²/b²≤1} (A+u)f((D-u)²+v²)du dv.
The odd-v moments vanish by symmetry. Deterministic quadrature:
averaged intersection area=0.001259566543 m²;
first-u moment=0.000320016313 m³;
V_winding=0.261262207525 m⁴.

For constant aligned fibers, exact lens area
2ab[acos(D/(2a))-(D/(2a))sqrt(1-(D/(2a))²)]
=0.007502592688 m² and V_aligned=1.555000058033 m⁴.
Constant orthogonal fibers have V=0 since D>a+b=.4.
V_winding/V_aligned=0.168014275096.

Contact threshold Dcrit(ψ)=min_q{sqrt(a²+b²q²)+sqrt(a²(cosψ+q sinψ)²+b²(-sinψ+q cosψ)²)}.
Root Dcrit(ψc)=D gives ψc=0.487605912598 radians and exact contact duty 2ψc/π=0.310419565083.
The contact set on T² has 2 gcd(|m|,|n|) connected bands with primitive slope (n/g,-m/g). Verified periodic-grid cases (1,0),(2,0),(2,3),(4,6): 2,4,2,4 components. Thus winding changes the spatial contact topology even though global contact duty and integrated overlap volume stay identical.

Independent unscrambled Sobol QMC: 2^20 samples V=0.261322246272 m⁴ (+0.022980%); 2^22 V=0.261163561742 m⁴ (-0.037757%). Independent aligned vertical-slice integral matched analytic lens area within 1e-10. All script assertions passed, three Class P figures generated. Complete executed code and figures appear in the scheduled conversation; script SHA256 631e018645a8590d192c55241db78368b45009d83c5f44239ca29da5ad84f155.

No interbraid force, particle, exclusion law or empirical mechanism inferred.
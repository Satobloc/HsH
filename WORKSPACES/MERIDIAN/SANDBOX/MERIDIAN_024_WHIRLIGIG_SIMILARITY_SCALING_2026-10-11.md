# Meridian Calculation 024: Whirligig scale-covariance null
2026-10-11 | SANDBOXED | Mathematical fixture only

Nathan's direction: Morrow/Kestrel should recover the source-authentic electron and planet equations, put them through the Whirligig, and calculate admissible intermediate equations rather than interpolate coefficients arbitrarily. Meridian independently tests scaling, transport, frame/material degrees of freedom, and holonomy. The recommendation is appended to Meridian's Whirligig hostile review.

## Exact calculation
Let H(s)=r(s)Q(s)x0, Q(s) in SO(4), Ω=QᵀQ'. Then H''=Q[r''I+2r'Ω+r(Ω'+Ω²)]x0.

For L>0 and parameter exponent z, put u=s/L^z, H_L(s)=L H(u), G_L(s)=L G(u), R_L=L R, Q_L(s)=Q(u).
The transport connection satisfies Ω_L(s)ds=Ω(u)du. Positive uniform scalar scaling commutes with SO(4) rotations and preserves geometric transport (once a connection is specified). It does NOT change winding indices or topology.

For the manuscript's action J=∫[κ|H''|²/2+λ(|H|²−R²)²/2+k|H−G|²/2]ds, fix κ_L=κ, k_L=k L^(-4z), λ_L=λ L^(-4z-2). Then each action term scales as L^(2-3z), hence J_L=L^(2-3z)J. All Euler–Lagrange terms scale together as L^(1-4z). These coefficient laws are a constructed covariance null, NOT physics inferred from SAT.

At z=1, physical Fourier wave number j/L and κ/k_L=L^4κ/k give unchanged transfer factor 1/[1+(κ/k)j^4]. Consequently trivial similarity cannot be the sought electron-to-planet scanning law if those source equations differ in their winding, material or ensemble structure.

## Actual 4096-point analytic-derivative numerical check
Two-frequency torus H=(cos 2u,sin 2u,cos 3u,sin 3u)/sqrt(2); κ=.02,k=1,λ=5,R=1; G*=H+(.02)H''''. For z=1:
L=1: J=7.33059229789, E-L max=2.6e-16.
L=2: J=3.66529614894, E-L max=3.2e-17.
L=5: J=1.46611845958, E-L max=5.3e-18.
L=10: J=.733059229789, E-L max=6.6e-19.
Every action matches J_1/L. Precision geometry and source: accompanying conversation artifacts meridian_024_scaling_geometry.png and meridian_024_scaling.py.

## Noncommuting material-frame check
With A=Rx(.445263), B=Rz(.445263), ||AB−BA||_F=.2754510162 and relative rotation angle angle[AB(BA)^(-1)]=.1950824796 rad. Acting on material director ez, ||AB ez−BA ez||=.1901923863. But AB and BA have the same SO(3) conjugacy class and therefore identical isotropic class-function energy. A material director can distinguish orientation/order while isotropic scalar elasticity generally cannot. Material stiffness/anchoring must be derived before claiming energetic consequences. SO(3) normal-frame holonomy does not by itself supply MK171's physical U(1) Aharonov–Bohm phase.

## Source and next step
Read: HsH Whirligig 2026-10-08 paper; historical SAT THE_WHIRLIGIG.txt; historical planetary Cycle 37 opening in 2026/SAT CYCLES 37-50.txt, proposing ω_macro proportional to inverse orbital radius and v_orb=c cos(theta4,ensemble); opening of SAT XYZ/SAT-Y Theta+Helix Particles.txt; MK171 R0. These historical endpoint candidates are not yet a verified matched pair.

Next: freeze exact electron/planet source equations and units, test their SO(4) path and ensemble/bundle representation separately, then calculate whichever non-similarity geometric transition the equations demand. Present calculation proves only an exact null-family and a material-order diagnostic, not an electron–planet bridge.

Meridian ◈

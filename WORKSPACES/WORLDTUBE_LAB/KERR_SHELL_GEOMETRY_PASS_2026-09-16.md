# Kerr shell geometry pass — 2026-09-16

Status: Ravel theoryworking note. Standard geometry is separated from H(s)H interpretation. Nothing below upgrades a geometric identity into a physical shell/tension law without an explicit model bridge.

## 0. Starting point

Resume from `KERR_CORE_BASELINE.md` and Nathan's later correction that Kerr remains a live H(s)H hypothesis. Keep the existing provisional reference assignment

\[
a=\frac{J}{mc},\qquad J=\frac{\hbar}{2}
\]

as an assumption under test, not as an established derivation.

The immediate question is not "which Kerr feature can carry H(s)H physics?" It is first: what geometry is actually present, what quantities are intrinsic or coordinate-dependent, and what can be measured before any constitutive interpretation is added?

## 1. Standard 3D oblate-shell construction

For the usual oblate Kerr spatial coordinates,

\[
x=\sqrt{r^2+a^2}\sin\theta\cos\phi,
\]
\[
y=\sqrt{r^2+a^2}\sin\theta\sin\phi,
\]
\[
z=r\cos\theta.
\]

At fixed `r`, this is an oblate spheroid

\[
\frac{x^2+y^2}{r^2+a^2}+\frac{z^2}{r^2}=1.
\]

Define

\[
A=\sqrt{r^2+a^2},\qquad C=|r|.
\]

Then `A` and `C` are the equatorial and polar semiaxes of the coordinate spheroid.

A useful parameterization is

\[
\mathbf X(\theta,\phi)=
(A\sin\theta\cos\phi,
 A\sin\theta\sin\phi,
 C\cos\theta).
\]

The induced Euclidean first fundamental form has

\[
E=A^2\cos^2\theta+C^2\sin^2\theta
=r^2+a^2\cos^2\theta
\equiv \Sigma,
\]

\[
G=A^2\sin^2\theta=(r^2+a^2)\sin^2\theta,
\]

with `F=0`.

This already gives a clean geometric measurement basis independent of any H(s)H shell mechanics.

## 2. Principal curvature structure

For the oblate spheroid embedded in ordinary Euclidean 3-space, the two principal curvature magnitudes are

\[
k_{\theta}=\frac{AC}{E^{3/2}},
\]

\[
k_{\phi}=\frac{C}{A\sqrt{E}}.
\]

These are purely shape-geometric quantities. They are not Kerr stress, physical tension, or field energy.

### At the pole

For `theta=0`, `E=A^2`, so

\[
k_{\theta}=k_{\phi}=\frac{C}{A^2}
=\frac{|r|}{r^2+a^2}.
\]

The shell is locally isotropic there.

### At the equator

For `theta=pi/2`, `E=C^2=r^2`, so

\[
k_{\theta}=\frac{A}{r^2},
\]

\[
k_{\phi}=\frac{1}{A}.
\]

Therefore as `r -> 0+`,

\[
k_{\theta}\to\infty,
\qquad
k_{\phi}\to\frac{1}{a}.
\]

The important geometric feature is not merely "oblate shells." It is a rapidly increasing curvature anisotropy concentrated toward the equatorial rim as the `r=0` disk/ring limit is approached.

That is a much sharper candidate datum for H(s)H than an informal picture of nested shells.

## 3. What this does and does not imply

Standard Kerr geometry gives a family of coordinate surfaces and a spacetime metric. It does **not** by itself make the constant-`r` surfaces material membranes with elasticity, permeability, surface tension, or independent normal modes.

Therefore:

- coordinate-shell geometry: standard mathematical input;
- principal-curvature anisotropy: standard geometric consequence of the oblate embedding used here;
- shell deformability/permeability/tension: not supplied by Kerr alone;
- treating a shell as a physical finite-core carrier: H(s)H hypothesis requiring an explicit bridge;
- any relation `tension ~ curvature`, `energy ~ curvature^2`, etc.: a model choice until independently derived.

This prevents us from smuggling a constitutive law into the word "shell."

## 4. 4D translation

A fixed-`r` 2-surface in a spatial slice becomes a 3-dimensional worldvolume when swept through the stationary Kerr spacetime. That worldvolume is the correct 4D object corresponding to the 3D shell picture.

The extra 4D structure is not merely "the same spheroid moving in time." Kerr has a nonzero time-azimuth cross term `g_{t phi}`. The standard local frame-dragging angular velocity for zero-angular-momentum observers is

\[
\omega(r,\theta)=-\frac{g_{t\phi}}{g_{\phi\phi}}.
\]

This is a clean standard quantity to compare with any H(s)H claim that the near-core structure carries rotational transport. It should be kept distinct from literal material rotation of a shell.

Thus a minimal 4D data package for each candidate `r=const` carrier is:

1. intrinsic 2-metric on the spatial cross-section;
2. principal spatial curvatures / shape operator of the chosen embedding representation;
3. proper circumferences and proper areas where well-defined;
4. frame-dragging profile `omega(r,theta)`;
5. tidal/curvature invariants of the spacetime evaluated across the same region;
6. the worldvolume's normal and extrinsic geometry in the full spacetime.

Only after those are in hand should we ask whether H(s)H supplies a constitutive interpretation.

## 5. Near-ring geometric signal worth testing

The first concrete candidate to carry forward is the equatorial curvature anisotropy

\[
\mathcal A_K(r)
=\frac{k_{\theta}}{k_{\phi}}
=\frac{A^2}{r^2}
=1+\frac{a^2}{r^2}
\]

at the equator.

This diverges as the disk/ring limit is approached.

This is not yet a physical divergence claim for a regularized finite-core H(s)H object. It gives us a precise thing a finite-core replacement must regularize or reinterpret. If H(s)H replaces the singular Kerr ring by a finite core, then a natural question is whether the replacement introduces a finite maximum anisotropy

\[
\mathcal A_{\max}
\]

or a minimum effective `r_min`, and whether that quantity is connected to any independently fixed worldtube scale.

That is a sharper bridge question than asking generically whether "the shell is stiff."

## 6. Measurement hierarchy

Before introducing any tension calculation, measure in this order:

### Geometry-only

- `a`;
- equatorial/polar semiaxes versus `r`;
- proper/coordinate circumference and area, explicitly labeled;
- `k_theta`, `k_phi`, mean curvature, Gaussian curvature;
- anisotropy `A_K(r,theta)`.

### Standard Kerr spacetime

- `g_tt`, `g_tphi`, `g_phiphi` across the candidate region;
- frame-dragging `omega`;
- curvature/tidal invariants;
- causal character of candidate worldvolumes;
- horizon/ergosurface status for the actual parameter regime rather than subextremal analogy.

### H(s)H bridge candidates

Only after the above:

- finite-core cutoff or regularization rule;
- what variable is allowed to deform;
- what is transported through the worldvolume;
- what "permeability" means operationally;
- action/energy functional for deformation;
- normal modes and stability;
- any tension or stiffness scale.

## 7. Immediate consequence for the old `~10^44` tension line

Do not use the remembered historical tension number as a current input. Standard Kerr geometry does not provide a material shell tension for these coordinate surfaces. A present H(s)H tension estimate requires, at minimum, a defined deformation variable and an energy/action functional from which the conjugate force/tension can be derived.

The old calculation remains historical evidence until its assumptions are reconstructed and checked against the current finite-core worldtube picture.

## 8. Next calculation

The next clean pass should calculate and graph, in dimensionless form with `q=r/a`,

\[
\frac{A}{a}=\sqrt{1+q^2},
\qquad
\frac{C}{a}=|q|,
\]

\[
a k_{\theta}(q,\theta),
\qquad
a k_{\phi}(q,\theta),
\]

and especially

\[
\mathcal A_K(q,\theta)=\left|\frac{k_{\theta}}{k_{\phi}}\right|.
\]

Then compare those geometry-only profiles with standard Kerr frame-dragging and curvature profiles over the same dimensionless `q` range. That gives the first controlled 3D -> 4D carrier atlas without yet presuming what physical role the carrier plays.

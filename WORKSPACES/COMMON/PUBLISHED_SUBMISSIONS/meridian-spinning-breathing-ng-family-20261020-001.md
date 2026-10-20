# Meridian | Spinning-breathing Minkowski ring family (2026-10-20)

**Research status:** Assistant-authored SANDBOXED exact Nambu-Goto calculation. Not Nathan Direct, not a derived Kerr solution. Source continuity: HsH issue #191 and `WORKSPACES/MERIDIAN/CONTINUITY_2026-10-20_MINKOWSKI_GUITAR_STRING.md` (original publisher verified). BR-008 is the controlling measurement-artifact audit.

## Construction

Use flat 3+1 Minkowski (-,+,+,+), c=1, NG tension T>0, R>0, sigma periodic modulo 2*pi*R, psi=sigma/R and theta=t/R. Let u=psi-theta and v=psi+theta. Define

```text
a(u)=(cos u, sin u, 0)
b(v)=(cos v, cos(alpha)*sin v, sin(alpha)*sin v)
x(t,sigma)=(R/2)*(a(u)+b(v))
```

The two traveling waves have unit tangent norms, so exactly satisfy x_tt=x_sigma_sigma, x_t.x_sigma=0 and |x_t|^2+|x_sigma|^2=1 (conformal-temporal NG). The NG action includes preselected tension; Minkowski spacetime alone does not entail a material tension law.

Writing x=U(theta)*cos(psi)+V(theta)*sin(psi):

```text
U/R=(cos(theta), (cos(alpha)-1)*sin(theta)/2, sin(alpha)*sin(theta)/2)
V/R=(0, (1+cos(alpha))*cos(theta)/2, sin(alpha)*cos(theta)/2)
U.V=0
|U|^2/R^2 = sin(alpha/2)^2 + cos(alpha/2)^2*cos(theta)^2
|V|^2/R^2 = cos(alpha/2)^2*cos(theta)^2
```

The center-of-momentum t-slice is a spatial ellipse, apart from folding instants. Its **full rest-frame spatial diameter** and the x-projection width are

```text
D_*(t)=2R*sqrt[sin(alpha/2)^2 + cos(alpha/2)^2*cos(t/R)^2]
W_x(t)=2R*abs(cos(t/R))
```

**The striking BR-008 discriminator:** W_x(t) is *identical for all alpha*, while intrinsic rest-frame cross-sectional diameter changes with alpha.

Energy and spatial momentum are E=2*pi*T*R, P=0. Direct integration of J=T*integral(x cross x_t) d sigma gives

```text
J=(pi*T*R^2/2)*(0,-sin(alpha),cos(alpha)-1)
|J|=pi*T*R^2*sin(alpha/2)
D_max=2R
D_min=2R*sin(alpha/2)=4*|J|/E (c=1).
```

For **0<alpha<pi**, this single exact dynamical family combines nonzero angular momentum and periodic diameter breathing, with a strictly positive minimum *envelope diameter*. Endpoints alpha=0 and alpha=pi reproduce the prior pulsating circular loop (J=0, zero minimum diameter) and rotating folded rod (constant 2R diameter), respectively.

With M=E/c^2 and a_spin=J/(Mc)=Jc/E, one may write D_min=4*a_spin for this NG fixture. This algebraic coincidence is **not** a Kerr geometry derivation, and its numeric factor is NOT promoted as universal.

## Negative finite-core gate (essential)

For alpha strictly between 0 and pi, the ellipse major/minor semiaxes are

```text
A=R*sqrt(s^2+k^2*cos(theta)^2)
B=R*k*abs(cos(theta))
s=sin(alpha/2), k=cos(alpha/2).
```

At theta=pi/2 mod pi, B=0, and the loop folds into a double-covered line segment even though D_min and |J| are nonzero. Hence it cannot be thickened into one globally embedded normal tube of any constant positive core radius.

Away from folds the ellipse reach is rho_min=B^2/A. An embedded tube with cross-sectional radius epsilon requires epsilon<rho_min; as theta approaches pi/2, rho_min approaches zero. Example alpha=pi/2, epsilon/R=0.05: curvature gate fails beginning theta=1.2967215657275295 rad; the invalid interval occupies 17.4481412% of a diameter-oscillation period. **Strict positive minimum diameter is not the same as strict positive finite-core regularity.**

## Executed numerical check

Python+NumPy in this successor turn, N=32768 evenly spaced sigma samples, alpha=pi/2, R=T=1. Verified SVD diameter formulas, projected width, NG constraints, conserved J, and a 0.6c boost of a rest-hyperplane spacelike displacement. Largest reported conformal residual <=4.44e-16, angular momentum discrepancy <1e-11, all tests passed. At t/R=(0,0.37,0.79,1.2,1.4,pi/2) the D values are (2,1.93351198,1.72939193,1.50419623,1.43449561,1.41421356). E=6.283185307179586 and J=(0,-1.5707963268,-1.5707963268). Script and Class P plots were generated as separate ChatGPT sandbox artifacts, NOT asserted present in repository.

## Interpretive controls and next task

D_* is defined by pairwise spacelike distances on the hyperplanes orthogonal to the conserved total 4-momentum: its construction is Lorentz-covariant once the rest slicing is transported. Arbitrary boosted equal-coordinate-time slices are a *different* measurement. The x-width is a deliberately axis-dependent readout, and the changing principal semiaxes cannot be eliminated by spatial rotation. Neither this calculation nor the NG action identifies the material singular ring of a stationary Kerr spacetime.

The finite-core closure challenge is sharper now: **Does a geometrically constrained, globally regular, spinning H(s)H worldtube admit periodic diameter changes without passing through an NG fold or inserting arbitrary constitutive behavior?** Derive or reject that from the finite-core geometry and physically admissible evolution; compare material core radius, ring trace, rest-frame diameter and a_spin independently.

**BEDROCK review:** Reviewed live Oct 20 BEDROCK blob acd2d9d935ed4ad1d9df8d42be4891ef296ea322; no proposed edits. BR-003 new findings stay TF; BR-006 framework-internal interbraid does not license unconstrained extra forces; BR-007 Mersearch mandatory; BR-008 coordinate/readout/dynamics three-layer distinction. OC-001/002 remain open. The Mersearch connector bridge slots at `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` and `MERSEARCH_REQUEST.json` were occupied by other workers, and no checked-out three-repository Mersearch runtime was accessible: no new Mersearch query was executed. This is an exact continuation of the recovered contemporary source, not a claim to have exhaustively searched historical priority.

Meridian

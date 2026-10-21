# Meridian | Cruller cosmological inverse geometry v1: self-lightcone / Hubble / Thirring separation | 2026-10-21

**Status: SANDBOX; actual executed Python numerical integral and precision plot.** Historical impetus: Nathan Direct 2026-10-21 specifies 'big circles' as looking back along our OWN past light cone, not another universe. Do not model a second fundamental shell. Bedrock ND-2026-10-20-01: Hubble-to-c normalization and simultaneity-to-Hubble-scale metric-curvature normalization are two separate operational constraints. Hypothesis-neutral.

## Geometry, no separate universe

In spatially compact quotient with deck transformations gamma, images of the SAME last-scattering surface may form matched circles. Flat cubic three-torus with shortest deck displacement D=L has matched-circle angular radius alpha if D<2chi_*:
cos alpha = L/(2chi_*).
The standard comoving last-scattering distance in reference flat-LambdaCDM is chi_*(H0)=c/H0 * integral_{0}^{z_*} dz / sqrt[Omega_r(1+z)^4+Omega_m(1+z)^3+Omega_L], z_*=1089.9. Our universe's causal return path is not proof of another universe. Ordinary past-cone cross-section (without identification) is a sphere and has no matched image automatically. These are different hypotheses.

**Planck 2015 topology search**, DOI 10.1051/0004-6361/201525829, finds no statistically significant matched circles, approximately L>6 c/H0 for specifically tested cubic torus, or inscribed radius L/2 >0.97chi_*; limit derives from alpha_min~15 deg and is NOT generic for all topologies. This is a **null bound**, not a detected circle radius.

## Actual executed calculator

Source: /mnt/data/cruller_cosmic_scale_gate_20261021.py. It uses SciPy adaptive integration (quad epsrel=1e-10), physical c from scipy.constants, Omega_m=.315, Omega_r=.000092, Omega_L=.684908, z_*=1089.9. Both H0 values have all Omega_i held fixed solely to demonstrate a scale degeneracy; this is NOT a joint Planck/SH0ES cosmological fit and cannot be treated as independent inference of chi_* from local SH0ES.

```text
                  H0=67.4          H0=73.04        units
R_H=c/H0          4447.959318      4104.496961     Mpc
chi_*            13864.339903     12793.763820     Mpc
chi_*/R_H            3.1170114         3.1170114    dimensionless
L_cube > .97*2chi_* 26896.819411     24819.901812 Mpc
```
Hubble rate fractional discrepancy [73.04-67.4]/67.4 = 0.0836795252; this is **not** a difference in spatial scalar curvature. The 0.35 Gpc difference in Hubble lengths is a difference in independently inferred reference scales, NOT a physical radial slab between different simultaneous spheres.

Plot generated and visually inspectable: /mnt/data/cruller_lightcone_circle_gate_20261021.png. Note the toy 'H0=73.04, same Omegas' is a counterfactual rescaled flat-FLRW background and should not be labeled the actual late universe cosmology.

## Rigorous identifiability calculation

FLRW ds²=-dt²+a(t)²[dchi²+S_K(chi)² dOmega²]. On a spatial section:
3-Ricci scalar = 6 K/a²,    H=dot a/a.
Friedmann: H²=(8pi/3)rho - K/a² + Lambda/3.
Set K=0 for *both* reference FLRW backgrounds above, while H0 differs. Then
3-Ricci scalar =0 for BOTH, identically, despite 8.36795% difference in H0.
This counterexample proves that the Hubble tension alone **does not imply nonzero intrinsic spatial metric curvature** between simultaneity and Hubble reference length.

The FOUR-dimensional Ricci scalar in the K=0 perfect-fluid reference model is R4=6(dot H+2H²), which generally is nonzero. At a=1 with these energy fractions, dot H/H0²=-(3/2)Omega_m-2Omega_r, so R4/H0²=6*(2-1.5*.315-2*.000092)=9.163896. This illustrates 4D spacetime curvature/expansion need not vanish even when intrinsic 3D slice curvature vanishes. Different H0 with same Omegas rescale spacetime scalar curvature proportional to H0², but cannot attribute the inference mismatch uniquely to physical radial curvature.

## No Thirring from a scalar H0 alone

An exactly FLRW homogeneous isotropic metric has no preferred rotational momentum current T_(t phi) nor nontrivial gravito-magnetic shearing / axis. The local metric in an axisymmetric rotating coordinate chart can have g_tphi without physical inertial dragging; require tensor/observer-invariant rotation/gyroscope relative transport. A nonzero H, topological self-image, or 8pi coupling does NOT generate a physical Thirring field. To recover differential Thirring in the Cruller, one must derive an anisotropic/toroidal angular-current component from the specified matter/worldtube motion, solve Einstein constraints and calculate proper transported gyros. Planck 2015 topology paper's physically coupled Bianchi VIIh vorticity bound (omega/H)_0<7.6e-10 (95% CL) is model-specific, *not* a universal prohibition of local frame dragging.

## New inference target (not solved)

An actual single Cruller metric g_mu_nu and topology Gamma must jointly predict: circle topology and alpha or its observational null; H(z) and D_A/D_L to CMB and local ladder; 3-curvature vs 4-curvature on defined Sigma_t; local rotational current and Fermi-Walker holonomy; and finite-core second-order winding energetics. Current data supply scale controls and bounds, **not** a unique inverse metric; infinitely many histories and topologies remain observationally degenerate.

Prior note: SANDBOX_2026-10-21_CRULLER_SELF_LIGHTCONE_HUBBLE_SCALE_GATE.md. Mersearch request shared slot remains occupied by Orson (2026-10-20-orson-braid-smoothing-q-rules-001) and was not modified. This pass uses primary Planck published article and direct GitHub check; no new Mersearch result claimed.

Meridian; SANDBOX.

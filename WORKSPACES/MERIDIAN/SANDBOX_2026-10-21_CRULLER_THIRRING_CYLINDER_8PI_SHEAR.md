# Meridian | Cruller Thirring pass: Einstein 8pi → rotating cylindrical shell → differential transport | 2026-10-21

**SANDBOX, executed numerical fixture.** This is an exact solution of a *specified linearized weak-field, stationary, infinitely long rotating thin cylindrical shell model*, to leading order in source strength/velocity; it is NOT the complete finite Cruller, an H(s)H sourced solution, a material torsional strain, or gauge decoupling. Everything in geometrized Planck units c=hbar=G=1.

## External controls
Frehland, 'Possibility of measuring the Thirring Effect', Nature Physical Science 230, 11 (1971), DOI 10.1038/physci230011a0: inside a long thin hollow rotating cylinder Coriolis field homogeneous, outside zero *in the stated linear approximation*. Costa et al. 'Frame-Dragging: Meaning, Myths, and Misconceptions', Universe 7 (2021) 388, doi 10.3390/universe7100388, explicitly distinguish inertial/Coriolis dragging, ZAMO rotation, and tidal precession. Historical source: SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/FINDING THE DONUT (nolat).txt, pages ~15-16 discusses Nathan's recognition of frame dragging after earlier 8pi/gauge-decoupling proposal. That original recognition is a historical research prompt, NOT established Einstein-equation proof of gauge decoupling.

## Derivation: 8pi goes through the current-source constraint

Weak-field Lorenz-gauge linearized Einstein equations for signature (-+++) with delta g_0i=h_0i, spatial mass-current j_i=T^{0i}:
```
box hbar_{mu nu} = -16pi T_{mu nu}
laplacian h_{0i} = +16pi j_i
```
for time-independent source (since T_0i=-j_i). This factor 16pi is the linearized consequence of the Einstein 8pi coupling and trace reverse, NOT a dedicated rotational or gauge-decoupling constant.

Let thin shell at cylindrical radius a have rest mass per unit axial length mu=2pi a Sigma, surface density Sigma, slow angular rotation Omega, with shell tangential speed Omega*a << 1 and mu<<1. The physical orthonormal azimuthal current is
```
j_phi^(orth)(r)=Sigma * Omega*a * delta(r-a).
```
For circular azimuthal vector potential h0^(orth)=f(r)e_phi, vector Laplacian gives
```
f''+(1/r)f' - f/r² = 16pi Sigma Omega a delta(r-a).
```
Solutions regular at r=0, decaying at infinity are f_in=b*r, f_out=b*a²/r. Continuity and derivative jump f'_out-f'_in=-2b =16pi Sigma Omega a give
```
b=-8pi Sigma Omega a = -4mu Omega.
h_(t phi) = r f(r) =
   -4mu Omega r²  (r<a)
   -4mu Omega a²  (r>a).
```
Consequently the zero-angular-momentum angular shift in an axisymmetric adapted chart is
```
omega_Z(r)=-g_(t phi)/g_(phi phi) =
   4mu Omega           (r<a),
   4mu Omega a²/r²     (r>a).
```
The azimuthal shift profile is continuous but has a derivative kink at thin shell. Inside relative radial ZAMO shear d omega_Z/dr =0; outside d omega_Z/dr=-8mu Omega a²/r³. If r1=a^- and r2=a(1+eta), the angular shift difference per source turn is
```
delta omega_Z/Omega=4mu*[1-(1+eta)^(-2)],
delta theta_Z(N turns)=2pi*N*(delta omega_Z/Omega).
```
**Do NOT call delta theta_Z a physical material torsional strain until physical identification of material directions and gyro/tetrad transport is constructed.** The local gravitomagnetic Coriolis/curl field corresponding to f(r) is curl h0 = -8mu Omega inside and ZERO outside, even though omega_Z outside decays as r^-2. This important distinction reproduces Frehland's qualitative inside-vs-outside result and prevents a spurious outside-field claim.

## Executed fixture and results (arbitrary weak-field numerical inputs, NOT calibrated to historical B or theta_obs)

mu=0.001 (Planck mass per length), Omega*a=0.1, eta=0.05, N=100 shell rotations:
```
omega_in/Omega = 0.004000000000
omega_out/Omega = 0.003628117913832
delta omega/Omega = 0.000371882086168
delta theta_Z = 0.233660405981282 rad
|sinc(delta theta_Z/2)| = 0.997726669301 (toy coherence average only!)
```
Last sinc is a separate illustrative uniformly distributed phase-response averaging model, NOT gauge-field decoupling. Apparent proximity to 0.246 rad is merely a consequence of arbitrarily selecting mu, eta, N, NOT a fit or prediction and must NEVER be promoted.

Code run and PNG generated locally: /mnt/data/cruller_thirring_cylinder_20261021.py and /mnt/data/cruller_thirring_cylinder_20261021.png. No claim those binaries are in GitHub.

## Required Cruller transfer

The physical Cruller is finite, curved, four-dimensional and not an infinite stationary cylinder. Its actual stress-energy tensor and Lorentzian worldtube/timesheet mapping need derivation. Then construct stress-energy angular current T_0i in the stationary or retarded Einstein constraint, solve for h0i; separately compute Fermi–Walker/gyroscopic relative holonomy, internal material transport and finite-core bending response. Gauge interaction suppression is **not** implied by GR frame dragging; if proposed, specify actual gauge current and transport of its observable, compare to unchanged local minimal coupling. A pure flat rotating-coordinates control produces g_tphi without Riemann curvature and must remain in the comparator suite.

## Key physical discriminator
Uniform interior omega_Z means this idealized cylinder **does NOT supply differential ZAMO dragging within the cavity**. Differential omega_Z appears radially across shell to exterior, but the local curl/Coriolis field outside is zero: local inertial dragging and ZAMO coordinate rotation are distinct. Thus a uniform interior shell is not a sufficient internal differential winding pump absent boundary traction, nonuniform matter, a different metric, or actual physical material constraints. Sign of beta/m winding cannot be inferred from the sign of omega_Z alone.

Prior notes: WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_THIRRING_DRAG_CRULLER_GATE.md, SANDBOX_2026-10-21_CRULLER_RELATIVE_REVERSE_WINDING.md. Status remains SANDBOX. Meridian.

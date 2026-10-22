# Meridian | Pythagorean comma and SO(4) closure gate | 2026-10-21

**STATUS: SANDBOXED / CONDITIONAL MATHEMATICS, NOT A DERIVATION OF B OR AN OBSERVATIONAL PREDICTION.**
Origin: Nathan asks whether the H(s)H coholonomy contains a Pythagorean comma; resumes earlier Meridian Minkowski Ring work. This note continues the earlier 4D material-history curvature correction and honors the explicit **zero adjustable constants** rule.

## A. Fixed arithmetic without fitted parameters
The conventional Pythagorean comma is the exact mismatch between 12 just fifths and 7 octaves:

- C_P = (3/2)^12 / 2^7 = 531441/524288 = 1.0136432647705078125.
- rho = log_2(3/2) = 0.5849625007211562...
- epsilon = 12*rho - 7 = log_2(C_P) = 0.0195500086538742...
- Single octave-circle residual: phi = 2*pi*epsilon = 0.122836327129256 rad.

These numbers use **the chosen canonical musical tuning ratios**. SAT/H(s)H has not derived that particular 3:2 and 2:1 pair from its worldtube geometry. Integers 12 and 7 are part of the Pythagorean-comma construction and are NOT universal SO(4) structure.

## B. Exact SO(4) relative-phase doubling in opposite isoclinic rotations
Complexify two real orthogonal planes, z1=x1+i*x2, z2=x3+i*x4. Let R2(a) be the real planar rotation matrix.

For a counter-rotating isoclinic SO(4) transformation:
 R_minus(phi) = diag(R2(phi),R2(-phi)),
 z1 -> exp(i phi) z1,  z2 -> exp(-i phi) z2.

The cross-plane bilinear Q=z1*conjugate(z2) obeys **Q -> exp(2i phi) Q**. Hence its relative phase is

 Phi_candidate = 2*phi = 4*pi*[12*log_2(3/2)-7]
               = 0.245672654258512 rad.

The factor 2 follows algebraically **conditional on opposite equal-magnitude plane rotations and on using this cross-plane relative phase**. In the co-rotating comparison R_plus=diag(R2(phi),R2(phi)), Q is unchanged and the relative phase is zero.

Independent NumPy matrix checks: determinant(R_minus)=+1, R_minus^T R_minus=I to 1.1e-16, and arg(Q_out/Q_in)=2*phi within floating point. The pair of orthogonal plane rotations commute; the construction does **not** exhibit nonzero local gauge curvature or establish physical holonomy by itself.

## C. Strict comparison with historical SAT numbers
- Historic phase-snap **Phi ~= 0.246 rad**: candidate minus this = -0.000327345741488 rad, fractional difference -0.133067%.
- Original geometric B0 = 3/(4*pi) = 0.238732414637843: candidate minus B0 = +0.006940239620669 rad, fractional difference +2.907121%.
- Other historical B variants around 0.24123 and 0.24177 likewise are NOT equal to this candidate.

Important: B has been described by Nathan as an **inverse-refractive-index analogue for worldtube bending resistance/response**, varying by material/bundle geometry. Phi is a **phase**. They must not be identified by mere numerical vicinity. Also 0.246 is a historical SAT prediction/claim, not a verified externally measured constant.

Alternate mapping with natural logarithm yields 4*pi*ln(C_P)=0.170287307639966, not 0.246: the octave-logarithmic phase convention is indispensable and must be established by a physical angular variable.

## D. Continue native material 4D curvature and bending calculation
For w a monotone affine time-in-length coordinate in native R4(++++) and physical marked material circular motion:
 X(w)=(R cos(omega w), R sin(omega w), 0, w), v=R*omega.
 Euclidean extrinsic curvature: kappa=R*omega^2/(1+v^2) = v^2/[R(1+v^2)].
 Frenet torsion in its 3D xyw subspace: tau=omega/(1+v^2).
 Per revolution, total Frenet frame twist: int(tau ds) = 2*pi/sqrt(1+v^2).
 Parameter-free normalized squared-bending integral:
 I_turn = int(kappa^2 ds) = (2*pi/R)*v^3/(1+v^2)^(3/2), dimensions inverse length.

Actual Python run with **illustrative initial conditions** R=10 Planck lengths, v=0.6c, omega=0.06 inverse Planck lengths:
 kappa=0.0264705882352941 /Planck length;
 I_turn=0.0855707339411073 /Planck length;
 int(tau ds)=5.3877869518475 radians.
These are geometric properties, not fitted constants. Multiplying I_turn by a guessed stiffness would violate the no-adjustable-constants discipline. If an energy is sought, obtain its constitutive coefficient from established physics or from derivation.

Note that a monotonic time coordinate means the entire physical 4D history does NOT make a closed spacetime loop; compare **material orientation across successive return sections**, not same spacetime event.

## E. Failure gates / next calculations
1. Does SAT/H(s)H actually select 3:2 and 2:1 frequency ratios (or another fixed primitive resonance) without importing them from music?
2. Does native worldtube/Cruller geometry demand **opposite isoclinic** plane rotations instead of same-sign or independent winding?
3. Which physically distinguishable material directions make Q a measured cross-plane relative phase, rather than frame-gauge bookkeeping?
4. Define a transport operator at actual successive timesheet/worldtube crossing sections and calculate its return map. Compute angle and winding invariants directly. Separate moving-frame monodromy from gauge and ambient Riemann curvature.
5. Determine separately whether a derived bending-response functional B(Q, topology) predicts an angular phase Phi, and whether the observed/historical 0.246 arises in held-out systems without resetting anything.

**Verdict:** a precise, nonfitted arithmetic-nearness result with a concrete SO(4) conditional doubling mechanism. It is a legitimate research lead, not an established explanation or a proof of the SAT B constant.

Primary continuity: LIVE CONVOS/Meridian Minkowski Ring Analysis — raw.json, blob SHA 56a84cb85d5c386efa4ea11d322d11e95e2c7703, and WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_ROTATION_AS_WORLDTUBE_CURVATURE_CORRECTION.md. See also 🔑/B_IS_INVERSE_REFRACTIVE_INDEX.md.

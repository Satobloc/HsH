# Framed Whirligig: complete swept normal-ellipsoid timesheet-volume gate

Date: 2026-10-22. Status: SANDBOXED/EXECUTED geometry, not a physical force, particle result, or BEDROCK amendment.

## Provenance and publication correction

This extends historical UI/Whirligig mathematics. Prior issue #216 was REJECTED by the publisher because the JSON omitted the mandatory sha256 property. It was not published. This is a corrected, distinct follow-up after a rejected intake, not a duplicate published result.

Read:
- Live BEDROCK.md blob 366c5f632dea7a7e5b53667ed8d201fd096899c0; STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9.
- DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/UI CONFIG.txt blob 6817caf68943593f31d72d51798e0ba4589624a4. Historical generator: y=r R x0; physical action terms distinct.
- WORKSPACES/NADIR_VOSS/PLAYGROUND_004_30SEP_RECOVERY_COLLISION.md blob e56b9cfffc4aa7a76b7302d6f1a66ad2ac2d4e4f. Exact variable-radius Whirligig acceleration and local-vs-readout distinctions.
- WORKSPACES/MERIDIAN/SANDBOX/2026-10-10_UI_SO4_STABILIZER_GEODESIC_GATE.md blob 829bbc0060cd0ba11cb51bd8565e66f99690b2f1. SO(3) stabilizer, framed elliptical contact.
- WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-finite-core-contact-energy-20261016t0036z-s3.md blob 74bc0c30de6efe054dbe5b07639d9329be53f8c4. Contact overlap *energy* is separate from contact yes/no.
- WORKSPACES/MERCER/2026-10-03_FINITE_CORE_INTERBRAID_CONTACT_SCALING.md blob 7863bb009c07b2c9fdadd080f80e58d4e6e9e951. Conditional quadratic-contact 5/2 onset exponent.
- WORKSPACES/ARIADNE/SANDBOX_2026-10-16_S4_EXACT_TUBE_REACH.md blob 46635fde5c22637823f1b5490128e1d2cdfcccb5. Local normal Jacobian does not guarantee globally embedded tube.
- WORKSPACES/MERIDIAN/SANDBOX/CROSS_READING_RESPONSE_2026-10-09.md blob b14066f4f6d461cbb7095d5aa2ed0f4466310f93. Straight-tube Fubini exposure normalization precursor.
- WORKSPACES/ORSON_VAY/SANDBOX_2026-10-03_READOUT_JACOBIAN_APPARENT_DYNAMICS.md blob d8a088ec4514fffd828887ade815e463d5fc4aa7. Source geometry and inverse readout singularities separate.

Mersearch-first: WORKSPACES/COMMON/MERSEARCH_REQUEST.json blob 662e4a99e47a48e1e573cf0dddffaf1329dd60dd was occupied by Orson's 2026-10-21-orson-nlm-big-haul-math-001, marked requested. Its per-request results path was still unavailable (404). Did not overwrite or claim a new Mersearch execution.

## Native geometry and exact Jacobian

Parameter t is dimensionless; all 4D coordinates and semiaxes are common arbitrary length units, so reported slice volumes have length^3 units. No time/dynamics are presumed.

H(t)=(R cos(omega*t), R sin(omega*t), rh cos(nu*t), rh sin(nu*t))
R(t)=1.3 exp(0.12*t*t+0.3*t); omega=1.7; nu=2.3; rh=0.23.

Let T=H'/v, v=norm(H'), and E(t) an orthonormal 4x3 normal frame, with E^T T=0. Transport E by the minimum SO(4) rotation mapping T(0.7) to T(t); this is a defined solver frame, not a derived physical connection. Rotate first two normal axes by U(chi), keeping the third unchanged. Denote F=E U(chi).

Take A=diag(a1,a2,a3), a=(0.25,0.10,0.075). The 4D swept tube parameterization is X(t,z)=H(t)+F(t) A z, norm(z)<=1. The full normal fiber is 3D, unlike the preliminary ribbon-like 2D disk.

For q_i=T dot F'_i = -T' dot F_i, exact 4-volume Jacobian magnitude is
  det(A) * abs(v + sum_i q_i a_i z_i).
The local-focal sufficient positivity gate is v > norm(q_i*a_i). A numerical t,chi sweep on t in [0.35,1.05] gives max norm(q*a)/v = 0.148246683617198, so local Jacobian stays positive on that tested interval. This does NOT certify global nonintersection (reach).

For timesheet w=w0 let s=w0-H_w(t), b_i=a_i F_(w,i), B=norm(b). The delta/coarea identity gives the parameter-counted 3-volume of the timesheet cut:

 Vslice = integral dt det(A) [pi/B] [1-(s/B)^2]_+
          * [v + (s/B^2)*sum_i q_i a_i b_i],   B>0,

where only |s|<B contributes. It is exact for the smooth parameterized tube while the Jacobian is positive and ranks are regular. If distant tube fibers overlap, it counts multiplicity rather than physical union volume. At B=0 the formula must be handled through a limiting/distributional straight-vacuum treatment, not division by zero.

For a single fixed-t 3D ellipsoid fiber, the *intrinsic 2D* central timesheet-section area is
  Asection = pi*(a1*a2*a3)*norm(n)/norm(A*n),
where n=F^T e_w, assuming n is nonzero. This section area is NOT the 3D swept slice volume.

## Executed numerical values

Center t=0.7: H=(0.63216054,1.57907342,-0.00901454,0.22982328); speed=3.045415861722; unit T_w=-0.784317739803; frame orthogonality norm 5.085e-15.

Fixed-station intrinsic section areas for chi 0,30,45,90 degrees:
  0.023561944902, 0.026509259131, 0.030938349363, 0.058904862255 [length^2].

Full parameter-counted swept slice volumes on t in [0.35,1.05], with w0=H_w(0.7), for the same angles:
  0.010066996137, 0.010056809001, 0.010045602885, 0.010021964652 [length^3].
Change at 90 degrees versus 0 degrees: -0.44731798644 percent. Local section area increases by factor 2.5, but 3-volume responds much less.

Enlarging t window to [0,1.5] does not change these four slice volumes, because it adds no cut support; enlarging to [-0.8,1.8] exposes another crossing and doubles much of the multiplicity-counted slice volume, proving that the resolution domain matters.

Straight tilted-tube exact check (theta=34 degrees, t from -2 to 2, sufficient to encompass slice support): the swept cross-section is exactly an ellipsoid of spatial volume (4*pi/3)*a1*a2*a3/abs(cos(theta))=0.009473613614 length^3, independent of normal-frame orientation. Numerical relative errors at 0,45,90 degrees: -3.64e-13, -9.47e-11, -5.74e-11. This is an exact Fubini/coarea cancellation, not a physical symmetry claim for a curved tube.

Circular core control a1=a2=a3=0.15 on curved t interval gives 0.018058265315 length^3 and fixed-station section area 0.070685834706 length^2 for all 0,30,45,90 degrees. Normal-frame rotation does not change the circular geometry.

Earlier #216 model precursor uses 2D elliptical radial-contact threshold, not projected support width. Correct threshold is 2/sqrt(cos^2(chi)/a1^2+sin^2(chi)/a2^2), so d=0.35 only contacts at the tested chi=0 degree, not chi=30 or 45 degrees.

## Reproducibility and limits

Executed Python 3, NumPy and SciPy; quadrature segmented at exact cut-support roots (brentq), with straight analytic and circular controls. Complete local executable distributed in conversation: finite_core_swept_slice.py (SHA-256 a715b9b321fb7ea0b250165686eeb1e9e08396e693da9b0b38564d7757f6c7f4), output finite_core_swept_slice_results.txt (SHA-256 5bee8e16659c8245306b7bfe62601e5e3b3e55c7f6f5b45c06d2d3733ce140f5), figure finite_core_swept_slice.png (SHA-256 9034c09bcbd04ad7bb69ab150f0315827ec76fbbab9235b68e21a1639fbb8d0a).

The current result establishes an orientation-sensitive, but largely averaging, geometric readout in the specified *curved* fixture. It neither demonstrates a global embedded tube without a reach/self-intersection test nor predicts energy, reconnection, mass, charge, photons, or CODATA parameters. Next discriminators: certify reach/global injectivity; distinguish parallel transport from material frame; vary anisotropy and core radius to compute leading scaling; apply independent constitutive contact law only after shape/readout correctness; verify observation invariants across admissible resolvers.

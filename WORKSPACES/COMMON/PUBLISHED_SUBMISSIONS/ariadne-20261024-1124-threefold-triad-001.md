# Ariadne | Threefold tangent triad and two-sector isotropy gate | 2026-10-24 11:24 EDT

Status: SANDBOXED mathematical bridge. Not an H(s)H candidate, empirical claim, or BEDROCK promotion.

## Provenance and retained mathematics
- Historical SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH-SAT Roundup 3/4DHHMISC.txt`, blob `63bf78e64b84f079e256c74bb2f642d820271aeb`, especially lines 102-231. The mixed human/assistant/NotebookLM transcript presents a 4DHH time-flow elasticity block, a unit-norm time-flow constraint, and a claimed Lorentz safety lock. Its claimed exact wave speed is not derived there.
- Current HsH: Mercer, `WORKSPACES/MERCER/2026-10-06_FLUCTUATION_GENERATED_IR_TENSION.md`, blob `fa9c3824fed11f9ce210821fdf3fc85619ff8b0d`. Original E[h] = integral[T0 |grad h|^2/2 + B (laplacian h)^2/2 + lambda |grad h|^4/4] d^3x; isotropic T_eff = T0 + (5/3) lambda Q, Q = <|grad xi|^2>.
- Ravel's 2026-10-24 10:24 relay extended this to K_ij = T0 delta_ij + lambda (Q delta_ij + 2 C_ij), with C_ij=<partial_i xi partial_j xi>, and principal-axis G_i/G_j=c_i/c_j under a shared reciprocal coupling. That extension is retained.
- Three-strand centerline comparator: Calder's 2026-10-24 08:24 finite-core helix geometry. The present material 3D centerlines are not asserted to be the native four-positive H(s)H worldtubes.

## Conditional construction and exact result
Let three equal-pitch helical centerlines have phases phi_j = kz+2*pi*j/3 and dimensionless pitch p=Rk. Their unit tangents are
t_j = (-p sin(phi_j), p cos(phi_j), 1)/sqrt(1+p^2).
The exact three-strand dyadic is
D = (1/3) sum_j t_j t_j^T = diag[p^2/(2(1+p^2)), p^2/(2(1+p^2)), 1/(1+p^2)].
**Additional unproved bridge assumption:** unresolved sheet-gradient covariance C = Q D. This is NOT derived from finite-core dynamics.

Then
K_perp = T0 + lambda Q [1 + p^2/(1+p^2)],
K_axis = T0 + lambda Q [1 + 2/(1+p^2)],
K_axis - K_perp = lambda Q (2-p^2)/(1+p^2).
At p=sqrt(2), the dyadic is I/3 and K=(T0+5 lambda Q/3) I. The helix tangent makes angle atan(sqrt(2)) = 54.735610317245346 degrees to its axis. Stronger result: t_i dot t_j = 0 for i!=j, and det[t_0 t_1 t_2]=+1. The three tangent directions are an exact orthonormal triad.

This is only rank-two isotropy. At p=sqrt(2), <t_z^4>=1/9, <t_x^4>=1/6, <t_y^3 t_z>=sqrt(2)/18, whereas an isotropic sphere has <t_z^4>=1/5 and <t_y^3 t_z>=0. The threefold frame retains fourth-order anisotropy. Moreover its skew frame connection A=T^T dT/dz has off-diagonal entries +/- k/sqrt(3); reversing k reverses A even though D is unchanged. Thus chirality-sensitive connection data can survive an isotropic quadratic readout. A itself is a geometric frame connection, not a derived electromagnetic or spin coupling.

## Planck-native dimensionless tests
Take c=G=hbar=1 and use T0=0, lambda Q=1 only as a normalization of the sandbox coefficients, not as a vacuum parameter or fitted length. Then
G_axis/G_perp = c_axis/c_perp = sqrt[(p^2+3)/(1+2p^2)].
p=1: 1.154700538379; p=sqrt(2): 1; p=2: 0.881917103688.
At the isotropy pitch, direct finite-core cross-strand minimization gives d_min/R=1.2001037832, hence the necessary mutual clearance condition a/R<0.6000518916. This is not a complete self-embedding or equilibrium proof.

## CODATA 2022 diagnostic, not independent prediction
NIST CODATA 2022 G=6.67430(15)e-11 m^3 kg^-1 s^-2; standard uncertainty u=1.5e-15 in the same units (https://physics.nist.gov/cuu/pdf/all.pdf).
At illustrative p=1, calibrate the shared source coupling so G_axis=G_CODATA. Holding that coupling fixed yields G_perp=5.78011335247848e-11 and residual G_perp-G_CODATA=-8.94186647521521e-12 m^3 kg^-1 s^-2 (fraction -0.1339745962).
This is a synthetic held-out model-form residual. CODATA does not supply directional G measurements for this comparison. It is neither an empirical sigma claim nor an independently derived H(s)H value. At p=sqrt(2), the ratio is one algebraically, not observationally established.

## Verification and limits
SymPy verified the dyadic, orthonormality, skew connection, isotropic Mercer limit and fourth moments; SciPy quadrature checked the dyadic; finite-core separation was numerically minimized; Python assertions passed. An independent high-precision verification is separately planned for the complete local artifact. No Lean proof claimed. Source reads were bounded, and the existing shared Mersearch request was not overwritten. All mathematical results remain conditional on the explicitly unproved covariance alignment and on using the inherited elastic comparator. No new medium law, particle assignment, force or scale is introduced.

Gates: HISTORICAL_MATH_RETAINED; RANK2_TRIAD_IDENTITY_PASS; RANK4_ISOTROPY_FAIL; CONNECTION_CHIRALITY_DISTINCTION_PASS; CODATA_FITTED_CONTROL_ONLY; HSH_CANDIDACY_NOT_ESTABLISHED.

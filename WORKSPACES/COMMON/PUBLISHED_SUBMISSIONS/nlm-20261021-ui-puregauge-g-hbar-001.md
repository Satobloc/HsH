# NLM Big Haul: three mathematical gates (2026-10-21)
Status: INTERNALLY_CHECKED mathematics; NO physical promotion. Source-led audit of SAT/H(s)H.

Sources: SAT 2026/SAT CORE — UI CONFIG.txt (blob 6817caf68943593f31d72d51798e0ba4589624a4); SAT MAY_2026_SNAPSHOT.txt (blob c29c49b697208294d705b0a280d91808a57edc66); HsH MOSTLY_EARLY_NLM/Interconn.txt (blob 02312fbb23167e8ce1c996451199ee0e498437b1); NLM Big Haul Worldline Action notebook JSON (blob 21976b2ceb1fab338367a57166d9d7fea4cd12c2). Source versions are historical compiled material, not authenticated individual authorship.

1. The notebook uses A_i = g^-1 partial_i g for SU(2) and infers nonzero curvature from [A_i,A_j]. But F_ij = partial_i A_j - partial_j A_i + [A_i,A_j] = 0 exactly for smooth pure gauge. SymPy check with g=exp(i*x*sigma_x)exp(i*y*sigma_y) gives commutator Frobenius norm 2.82842712 and zero total curvature. A non-pure-gauge field or defect must be separately specified.

2. The notebook's C^mn = <v^m v^n> cannot become Lorentzian through inversion alone: C is positive semidefinite for real velocities with nonnegative weights; C^-1 is positive definite if it exists. If velocities are tangent to one S3 wavefront, C*n=0 and rank(C)<=3, so the 4D inverse does not exist. Householder reflection is additional structure.

3. Historical pair hbar=m0*c*ell_f*B and G=rho_embed^2*c^2*ell_f/m0 yields exact necessary relation ell_P^2 = rho_embed^2*B*ell_f^2 where ell_P^2=G*hbar/c^3. With archived ell_f=0.7937 fm, rho_embed=1e-19, B0=3/(4*pi), closure ratio is 5.75710798652, not 1. Using Bstable=0.24177 gives 5.83036032209. Inverse-needed rho values 4.16771307e-20 / 4.14144885e-20 are fits, not independent predictions. CODATA 2022 (NIST Web Version 9.0): G=6.67430(15)e-11 SI; hbar exact.

4. Minimal SO(4) frame generator Omega_h=n'n^T-n(n')^T satisfies Omega_h*n=n' and ||Omega_h||_F^2=2||n'||^2. Even after quotienting stabilizer rotations, archived 0.5*r^2||Omega||_F^2 is twice the point-trajectory rotational kinetic term. Frame physical status unresolved.

Mersearch: existing Orson broad NLM query 2026-10-21-orson-nlm-big-haul-math-001 checked, request-scoped results absent, not overwritten; no new completed Mersearch run claimed. Script and full derivations retained in conversation-local research bundle. Gates: EXACT_INTERNAL_NO_GO for pure-gauge curvature and covariance inversion; CODATA_COMPARED_LITERAL_FAILURE for joint scale; PHYSICAL_CORRESPONDENCE_UNRESOLVED. No BEDROCK edit or Contents modification.

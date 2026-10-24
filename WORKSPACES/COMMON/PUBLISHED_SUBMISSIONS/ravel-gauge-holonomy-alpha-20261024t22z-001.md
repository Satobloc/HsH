# Ravel :00 | 2026-10-24T22Z | Historical SAT charge/alpha gauge audit

SANDBOXED. Mathematical audit, not BEDROCK, not a tentative H(s)H candidate, not a physical prediction.

## Provenance
- Nominal h=334; seq=5*h=1670; ring index 17 = Ravel; next Orson Vay, next hourly Ariadne.
- BEDROCK.md blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, 548 lines, full fetch; includes ND-2026-10-18-02/03, Oct 23 correction-first and mathematical-clearance-not-candidacy.
- STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines, full fetch.
- Mersearch guide blob 53ff8ba46672110efebeaa7785ad1e0dd2a782af, 101 lines. All four request lanes occupied (Orson, Tern Rook, Morrow, Meridian). No Mersearch run; bounded direct repository fallback only; HSH_RESOURCES not searched.
- Genuine Python secrets.randbelow(6) draw selected index 4, SAT_THEORY_ARCHIVE_2023-25/MISC/DUGUP.txt, blob a1f1185cd020002722f4c3656e7a319bcef6e670, 1383 lines, 51762 characters, full retrieval. Read relevant Appendix C/D (~284-475) and unrelated opening field material and mass/Bohr-Rydberg sections. Original composition date/authorship unknown (compiled archive).
- Later comparison: HsH WORKSPACES/RAVEL/KERR_PARTICLE_REGIME_COLLISION_2026-09-16.md, blob 8bc65c97e88afd9c7e6add7386574c0eea3492b9, 320 lines; and KERR_SCALE_SLICE_TRIANGULATION_2026-09-16.md blob 09aea7c60cff5eaaf5df7921c9e99b314b381add, 162 lines.
- Public-source material only; no restricted or private files reproduced.

## Original equations, assumptions, and exact audit
Appendix C prints psi' = psi + chi, A'_mu = A_mu + partial_mu chi, D_mu psi = partial_mu psi - q A_mu. Substitution yields D'_mu psi - D_mu psi = (1-q) partial_mu chi, so local gauge invariance FAILS unless q=1 or chi constant. Example q=2, partial chi=0.3 gives -0.3.

Two standard-equivalent repairs: (psi'=psi+chi, A'=A+dchi/q), q!=0; or (psi'=psi+q chi, A'=A+dchi). Both give exactly zero gauge defect. This fixes transformation normalization, not the absolute elementary charge. In SI, if A_phys has units action/(charge*length), D psi = dpsi - (q_phys/hbar) A_phys; the original q_phys*A_phys is dimensionally action/length, inconsistent with dimensionless phase gradient 1/length. Native symbolic tests set hbar=c=G=1, not a physical derivation.

Single-valued exp(i psi) implies integral_C dpsi=2*pi*w for integer winding w, NOT exp(i integral_C Dpsi)=1. For smooth A=(-B*y/2,B*x/2), circle radius R, flux Phi=integral A.dx=pi*B*R^2. Take psi=0, B=1/pi, R=1, q=1: exp(-i*q*Phi)=0.540302305868-0.841470984808i, despite globally single-valued exp(i psi)=1. Thus arbitrary smooth Wilson loops are NOT quantized by compact phase alone. A charge lattice may follow from U(1) representation weights relative to a normalized connection, but its physical scale is not fixed here.

Appendix D defines alpha=e^2/(4*pi*epsilon0*hbar*c), then substitutes epsilon0=e^2/(4*pi*alpha*hbar*c) to 'derive' alpha. SymPy substitution returns alpha=alpha identically. This is a circular re-expression, not an independent alpha prediction. Its numerical alpha^-1=137.035999084 is explicitly called empirical.

Later Kerr-Newman control: M_g=Gm/c^2, a=J/(mc)=j*hbar/(mc), Q_g^2=G e^2/(4*pi*epsilon0*c^4), r0=Q_g^2/(2M_g). Exact r0/a=alpha/(2j), hence alpha at j=1/2. This valid identity already inserts e/alpha and cannot independently recover charge or alpha. r0 is a g_tphi zero, not a horizon, ergosphere, or H(s)H shell.

## Executed tests and CODATA comparison
SymPy symbolic defect and repairs PASS; original invariance FAIL. Smooth-loop exact Stokes flux PASS; historical universal holonomy quantization FAIL. Independent standard-library circle quadrature n=32,64,128,256,512 converged O(n^-2) toward Phi=1, and adding grad(0.7*x) changed the loop integral by less than 8e-15. Dimensional check FAIL as printed, PASS after /hbar correction. SymPy alpha substitution proves tautology. Symbolic Kerr ratio PASS. An initial test failed because structurally different but equal SymPy expressions were compared with ==; repaired test uses simplify(difference)==0; retained as execution failure.

NIST CODATA 2022 (not a fitted model): alpha=7.2973525643(11)e-3, u=1.1e-12; alpha^-1=137.035999177(21), u=2.1e-8. Archived empirical inverse-alpha differs by -9.300001e-8. This is NOT a theory residual. With measured alpha and lepton masses as inputs, standard Kerr (a,r0) in fm: electron (193.07963366,1.40897015980); muon (0.933797152692,0.00681424704674); tau (0.0555268789888,0.000405199212776). All are input-dependent standard-control calculations, not independent SAT predictions.

## Gate and star-map propagation
- Historical charge/alpha no-input derivation: REJECTED AS WRITTEN.
- Gauge-normalization repairs and Kerr control identity: MATHEMATICALLY CHECKED, ELIGIBLE FOR H(s)H CANDIDACY CONSIDERATION ONLY, NOT A CANDIDATE.
- Absolute physical charge, charge spectrum, alpha, Kelvin-medium coupling and Kerr-worldtube readout: UNRESOLVED.
- No independent CODATA prediction -> NO CODATA VERIFICATION PROMOTION. No BEDROCK/STATE mutation.
- EM spoke: cannot infer charge magnitude from compactness alone. Spin/Kerr spoke: q0/a is alpha only after importing charge; not independent cross-sector confirmation. Responsive medium spoke: constitutive charge coupling remains to be derived, and fluid vorticity is not matter worldtube. No new machinery inserted.

## Reproducibility
Full runnable SymPy/NumPy/Matplotlib verifier and independent standard-library numerical verifier, their exact outputs, and Class P Wilson-loop plot are supplied inline in the corresponding conversation and local research bundle. Source and code hashes are logged there. The result is bounded and does not claim full archive coverage.

# Elias Kern :00 | Exact Kelvin-LIA circle and finite-amplitude helix gate
Date: 2026-10-24T09:00Z. Status: SANDBOX, classical 3D standard-physics comparator; NOT a derived H(s)H constitutive law or physical prediction.

## Source genealogy and controls
- HsH BEDROCK.md, blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, full 548 lines; STATE_OF_THE_THEORY.md, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, full 155 lines. Read ND-2026-10-18-02/03, BR-007/008, ND-2026-10-22 and ND-2026-10-23.
- Original archive: SAT_THEORY_ARCHIVE_2023-25/HsH AHA TOPOLOGY.txt, blob 5283ceb8d06109061543711ebe7c46954efe7ede, 2634 lines retrieved, relevant lines 328-341 inspected. Assistant CLAUDE text around July 12, 2026 asserts Hasimoto/local induction means an unperturbed vortex ring spontaneously develops helical Kelvin waves. This particular claim is tested here, not attributed to Nathan.
- Later bounded correction: HsH/WORKSPACES/MERIDIAN/SANDBOX_2026-10-22_STAR_006_KELVIN_BINORMAL_DISPERSION_VS_SATO_D2.md, blob 1ecf532ea90c57a7a6ec3541711465a93c562039, full 6431 characters read. It establishes the *linear* Kelvin dispersion omega=nu*k^2, explicitly not a ring result.
- Genuine Python secrets.randbelow(4) selected index 0: SAT archive WORLDTUBE THOUGTS.txt, blob 735f2a95e492944a244d1ceba31f33b6b5606119, all 224 lines read, including unrelated NotebookLM, BV, arclength/time, and cosmology material. Source is mixed user/assistant text; attribution is passage-specific.
- Existing completed Mersearch request 2026-10-21-orson-nlm-big-haul-math-001 inspected (manifest blob 0f017d6f557d24c721e417d1fe3c49abf0653991; receipt blob 191acaf733c8e59920ca16c53ccb74d6be90f3c6). 3 roots scanned with exclusions; query did not specifically target nonlinear LIA. Shared slot occupied; no new Mersearch execution; bounded direct source reads instead. No private/restricted source content included.

## Exact classical 3D calculation
LIA in arclength gauge: X_t=nu*(X_s cross X_ss), [nu]=L^2/T. For a generic parameter z the equivalent pure-normal/binormal flow is X_t=nu*(X_z cross X_zz)/|X_z|^3.

1. Circular ring: C(theta,t)=(R*cos(theta),R*sin(theta),nu*t/R). Direct differentiation gives C_t=nu*(C_theta cross C_thetatheta)/|C_theta|^3=(0,0,nu/R). Its curvature is 1/R and torsion remains exactly 0. Thus **the assertion that pure self-induction necessarily converts a smooth unperturbed ring into helical Kelvin waves is FALSE**. Other perturbations/instabilities or different fluid laws are not excluded.

2. Finite-amplitude helix: X(z,t)=(a*cos(k*z-omega*t),a*sin(k*z-omega*t),z+U*t). With q=a*k and |X_z|=sqrt(1+q^2), exact substitution into the 3D LIA yields:
omega_material=nu*k^2/(1+q^2)^(3/2);
U=nu*a^2*k^3/(1+q^2)^(3/2);
Omega_fixed_axis=omega_material+k*U=nu*k^2/sqrt(1+q^2).
The material parameter z and fixed physical axial coordinate are not the same observational frame. The two phase frequencies must not be conflated.
Curvature=a*k^2/(1+q^2); torsion=k/(1+q^2). The torsion belongs to the initially helical shape; it is not spontaneously generated from the exact circle.

3. Limits and units: q->0 recovers omega=nu*k^2 and U->0. The finite-amplitude fixed-axis ratio is 1/sqrt(1+q^2), not 1. nu L^2/T, a L, k L^-1, omega T^-1, U L/T. Fixed a and k->infinity is outside the demonstrated finite-core LIA validity and is not a causal ultraviolet completion.

## Executed checks and result
Actual Python/SymPy verified exact 3D cross-product identities, ring solution, helical residual zero, frame conversion, curvature/torsion and dimensional/limiting cases. Independent periodic finite differences gave relative residuals at N=64,128,256,512: 1.135927674e-3, 2.839735500e-4, 7.099285581e-5, 1.774818057e-5 (second-order convergence).
Planck-native illustrative fixture nu=0.15, a=2, k=0.5: q=1, omega_material=0.013258252147/tP, U=0.026516504294*c, Omega_fixed_axis=0.026516504294/tP; ring R=4 translates at 0.0375*c. These are not fits or particle predictions.
Executed verifier SHA-256: dffc6888bdabb8ed824f246a909b7e9ae412f9e1d8dbf29807512b1a0b4034ff.
Execution output SHA-256: d42de55628c9051468834753252361b3abd6e5bb6539f86ceb3e72cf6a860068.

## Gates and translation
Exact 3D classical comparator: MATHEMATICALLY CLEARED; ELIGIBLE FOR CANDIDACY CONSIDERATION ONLY. Historical unperturbed-ring spontaneous-twist claim: COMPARED_FAIL under pure LIA. Finite-amplitude frequency and frame split: PASS in this conditional 3D law. Transfer to 4D native ++++ finite Kerr/ER-associated worldtubes, codimension, material circulation and boundary conditions: UNRESOLVED. D2 second-order string dynamics is not identified with this first-order chiral vortex dynamics by visual similarity. CODATA: NOT_APPLICABLE (no independent H(s)H quantity). H(s)H candidate: NOT ESTABLISHED. BEDROCK: NO CHANGE.

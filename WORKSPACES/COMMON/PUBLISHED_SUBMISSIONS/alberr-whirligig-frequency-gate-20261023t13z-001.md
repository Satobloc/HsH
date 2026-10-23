# Alberr :00 | 2026-10-23T13Z | Archived Whirligig two-frequency obstruction

Status: historical Euler-Lagrange equation INTERNALLY_CHECKED; historical distinct-frequency solution REJECTED; historical stability inference REJECTED; finite-core H(s)H physics UNRESOLVED; BEDROCK unchanged; no CODATA observable.

## Primary source and history
HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, blob 02312fbb23167e8ce1c996451199ee0e498437b1, 236 lines, sections 5.1-5.3 lines 105-115. Duplicate Scalar-Angular.txt has identical blob, not independent corroboration. SAT-GIGAPACK.txt blob 99a137e4891cd4a3ecaee86cf76a2d06c5af300b repeats the negative-lambda stability claim; F1 WHIRLIGG.txt blob dcb0b820600b4b43593e4a225562efb724a2a43d repeats the absolute-value frequency relation. Original message-level date and authorship not established; these are archival compilations.

BEDROCK.md blob 83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8, 509 lines; STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines. Consulted current Mersearch request 2026-10-21-orson-nlm-big-haul-math-001 (occupied); read successful three-root manifest and receipt; no new Mersearch run. Bounded direct search followed. Source privacy: public only.

Random reading: actual Python secrets.randbelow(4) = 3; read all 200 lines of SAT_THEORY_ARCHIVE_2023-25/LEAN CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt, blob b128efd3004fe34e48dc7da2c39bdd14f9926ddc. Contains nonrelativistic fluid, covariant field, mass and Noether draft sections; undefined interfaces and sorry placeholders; not Lean-verified.

## Original mathematical claim
L = (kappa/2)|H''|^2 + (lambda_s/2)(|H|^2-R^2)^2 + (k/2)|H-G|^2.
E-L: kappa H'''' + 2 lambda_s (|H|^2-R^2)H + k(H-G) = 0.
Source sets k=0, R constant, H=(R cos(ws*t),R sin(ws*t),rh cos(wh*t),rh sin(wh*t)).
It substitutes a single H''''=omega^4 H and concludes omega^4=-2 lambda_s rh^2/kappa and stable two-frequency superhelical coiling.

## Exact derivation
Norm squared is R^2+rh^2. The first two E-L components carry coefficient kappa*ws^4+2*lambda_s*rh^2. The final two carry kappa*wh^4+2*lambda_s*rh^2. For R,rh,kappa nonzero, simultaneous vanishing requires ws^4=wh^4, hence |ws|=|wh| for real frequencies. The equal-frequency branch is H=u cos(wt)+v sin(wt) with orthogonal equal-norm fixed u,v: a planar circle in R4, not a genuine two-frequency superhelix.

For kappa>0, rh>0, real w requires lambda_s<0. The soft constraint potential is then unbounded below. Along the admissible amplitude family H_a=aH, let S=R^2+rh^2. E(a)=kappa*a^2*S*w^4/2+lambda_s*(a^2*S-R^2)^2/2. Under the stationary dispersion E'(1)=0 but E''(1)=4*lambda_s*S^2<0. Thus the stationary circle is NOT a local action minimum; the historical inference of stability is false.

## Actual SymPy/numeric tests
Fixture R=2,rh=0.5,kappa=1,lambda_s=-2,k=0,ws=1,wh=2. xy residual coefficient 0, zw residual coefficient 15; full residual norm 7.500000000000. Setting wh=ws=1 gives zero residual but a planar circle.
E(.999)=2.062427822232; E(1)=2.062500000000; E(1.001)=2.062427677732. Centered second difference=-144.500036125; exact E''(1)=-144.500000000. Positive lambda_s and kappa forbid real nonzero circular w.
Arclength-integrated energy dimensional audit: [L_density]=J/m, [kappa]=J*m, [lambda_s]=J/m^5=M L^-3 T^-2, [k]=J/m^3. Archived [lambda_s]=M L^-5 T^-2 is incompatible by L^-2 under the stated arclength convention.
All final SymPy assertions passed. One initial scheduler assertion failed because next-hour was mistakenly set to Mira; corrected next-hour to Elias Kern and reran successfully. Worker h=301, seq=1505, ring member Alberr, next ring Mira, next hourly Elias Kern.

## Gate
Do not repair by silently adding anisotropy, a different target radius, coupling, or a new tension law. Whether operative finite-core Kerr/ER worldtubes support multiple frequencies is UNRESOLVED. No independent CODATA quantity is produced; no fit, value, uncertainty or residual applies. No BEDROCK promotion.
Full executed verifier and Class P figures are preserved in the conversation archive.

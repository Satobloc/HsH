# Mercer CODE 000 | Marked four-tube finite-strain gate | 2026-10-24T02Z

Task: calc48-20261024T02Z-mercer-material-svk-001
Status: INTERNALLY_CHECKED exact continuum-mechanics comparator; H(s)H constitutive choice UNRESOLVED. No BEDROCK promotion, no CODATA prediction.

## Source genealogy
- SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt, Git blob 1854995be3311f565739f2be64269cbb0385a82f: historical filament bending and fourth-order action (historical assistant compilation, not independent physical validation).
- HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, Git blob 02312fbb23167e8ce1c996451199ee0e498437b1, lines 69-82: historical L_filament = T|X'|^2/2 + kappa|X''|^2/2.
- HsH/WORKSPACES/MERIDIAN/SANDBOX/2026-10-08_FINITE_CORE_4D_JACOBIAN_MATERIAL_TWIST_GATE.md, blob 34e971374b9c8fb87b5f5cac3b699baf8462455b: established quadratic twist strain comparator, E_tw/L = G4 V3 a^2 tau^2 / 5, for round marked 3-ball.
- HsH/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-twist-volume-measure-20261024t01z-001.md, blob 0584069dbfaeabc68e284b6073bafd60fff2170f: four-volume measure differs from fiber-reference arclength measure.

## Exact calculation
In native Euclidean R4 (++++) take a straight cylinder of material labels (s,y1,y2,y3), |y|<a. Define F(s,y)=(s, R(tau*s)(y1,y2), y3). This is an orientation-preserving diffeomorphism onto the same unmarked round cylinder. Let rho^2=y1^2+y2^2, J=DF, C=J^T J, and Green strain E=(C-I4)/2. Exact identities:

det J = det C = 1;
tr E = tau^2 rho^2/2;
tr(E^2) = tau^2 rho^2/2 + tau^4 rho^4/4.

A CONDITIONAL four-dimensional Saint-Venant--Kirchhoff material comparator (standard form, not SAT dynamics) is W = (lambda4/2)(tr E)^2 + mu4 tr(E^2). Hence
W = (mu4/2) tau^2 rho^2 + (lambda4+2mu4) tau^4 rho^4/8.

For a uniform 3-ball, V3=4*pi*a^3/3, <rho^2>=2*a^2/5, <rho^4>=8*a^4/35. Therefore
E_SVK/L = V3*[mu4*tau^2*a^2/5 + (lambda4+2*mu4)*tau^4*a^4/35].

A separate conditional incompressible neo-Hookean comparator W_NH=(mu4/2)(tr C-4) has E_NH/L = V3*mu4*tau^2*a^2/5, exactly Meridian's previously established quadratic twist comparator with G4=mu4. Their difference is the finite-strain quartic correction; it is NOT a derived H(s)H term. The nontrivial principal stretches are sqrt(1+g^2/4) +/- g/2 with g=|tau|*rho; the other two are 1,1. Their product is 1. A round UNMARKED tube has no licensed twist strain energy from this relabeling alone.

## Executed test and controls
Python SymPy/NumPy/SciPy actually executed. With a=1/4, tau=2, lambda4=3, mu4=2, L=2*pi, in declared relative units:
E_SVK/L = 0.007363107781851079;
E_NH/L = 0.006544984694978736;
E_SVK/E_NH - 1 = 0.12500000000000022;
E_SVK total = 0.04626377063010637.
Independent cylindrical quadrature residual -8.73e-16; seeded uniform-ball Monte Carlo N=300000: mean 0.007370203038017487, standard error 9.36916473351405e-06, residual 0.7573 standard errors. Random 150 Jacobian and singular-value checks: maximum residual 6.66e-16. Symbolic zero-twist, even-sign and 4D similarity-scale checks all passed. Script SHA-256: 91f14850cbc9af97624662f71fca9892d8ff25b570f21be28c634e44f832b253.

## Status and next discriminator
INTERNALLY_CHECKED mathematical comparator only. Material labels, Lamé moduli and boundary conditions are not established by the SAT/H(s)H archive; no CODATA residual is defined. A free, unmarked round tube cannot be assigned a material strain merely from the rotating coordinates. The operative construction must establish physical material connectivity and boundary constraints before selecting any elastic action. Do not merge this comparator with fiber-curvature energies or promote to BEDROCK. Privacy: no personal archive passages reproduced.

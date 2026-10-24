# Aster CODE 000 | Uniform material twist is not automatically a free equilibrium
Task: calc48-20261024T03Z-aster-svk-equilibrium-001
Status: INTERNALLY_CHECKED conditional continuum-mechanics obstruction; H(s)H constitutive applicability UNRESOLVED. No BEDROCK promotion.

## Historical and later source genealogy
- SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH - BACKBONE.txt, Git blob 1854995be3311f565739f2be64269cbb0385a82f, historical fourth-order filament action.
- HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, blob 02312fbb23167e8ce1c996451199ee0e498437b1, lines 69-82: L_filament = T|X'|^2/2 + kappa|X''|^2/2.
- HsH/WORKSPACES/MERIDIAN/SANDBOX/2026-10-08_FINITE_CORE_4D_JACOBIAN_MATERIAL_TWIST_GATE.md, blob 34e971374b9c8fb87b5f5cac3b699baf8462455b: conditional material twist energy and gauge distinction.
- HsH/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-material-svk-20261024t02z-001.md, blob e2696f5b829dedac4ad8eb7b6a3454967e635a5d: exact SVK and neo-Hookean energy integrals. This packet tests whether the prescribed map is an equilibrium, not whether its energy integral is correct.

## Exact stationarity gate
For Euclidean R4, material coordinates (s,x,y,z), rho2=x^2+y^2, take F=(s, x*cos(t*s)-y*sin(t*s), x*sin(t*s)+y*cos(t*s), z). Let J=DF, E=(J^T J-I)/2, W=lambda*(tr E)^2/2 + mu*tr(E^2), and P=J*(lambda*tr(E)*I+2*mu*E). For zero body force, Euler-Lagrange requires Div P=0.

Exact SymPy differentiation, evaluated at s=0 only AFTER differentiation, gives
Div P = (0, A*x, A*y, 0),
A = t^2*(lambda-2*mu) - (lambda+2*mu)*t^4*(x^2+y^2)/2.
For t!=0 and positive lambda,mu this cannot vanish identically throughout the three-ball. At general s the normal residual rotates with the director. This is a bulk-equilibrium failure for the prescribed uniform-twist SVK deformation without body forces, not a failure of the earlier energy integration.

An independent normal-scale variation F_u=(s,u*R(t*s)(x,y),u*z), evaluated at u=1, gives
d(E_SVK/L)/du = V3*[(3*lambda+4*mu)*a^2*t^2/5 + 4*(lambda+2*mu)*a^4*t^4/35],
V3=4*pi*a^3/3.
For positive lambda,mu and t!=0 this is strictly positive. The uniform twist is not stationary under an unconstrained radial material variation. Prescribed end displacements, external loads or material constraints could change admissibility; none were assumed.

## Numerical fixture and independent checks
a=1/4, t=2, lambda=3, mu=2. Original SVK energy/length = 0.007363107781851078. Exact normal-scale derivative = 0.05890486225480862; derivative/energy = 8.0. The lateral equatorial first-Piola traction at (x,y,z)=(a,0,0) is (0,3/8,0,0), not zero. Direct finite-difference Div P at 15 random points has max component discrepancy 1.40e-10. Independent cylindrical quadrature of P:delta J gives 0.05890486225480281, discrepancy -5.81e-15. Exact symbolic and numerical assertions passed.

## Distinct neo-Hookean comparator
For incompressible W=mu*(tr C-4)/2, P=mu*J-p*J^{-T}, choose p=p0-mu*t^2*rho2/2. This yields exact bulk Div P=0, unlike the SVK map. However zero traction at the spherical equator requires p0=mu+mu*t^2*a^2/2, leaving nonzero polar traction (0,0,0,-mu*t^2*a^2/2). Fixture polar traction = -0.25. Hence the same prescribed map is not traction-free on the entire spherical lateral boundary under this pressure solution. Other boundary conditions or deformations remain open.

## Limits and status
Zero twist removes both residuals. Div P is even in twist sign. All quantities use 4D material elasticity with moduli in energy per 4-volume. The geometry is a conditional mathematical comparator, not a derived SAT/H(s)H constitutive law, physical prediction or CODATA match. CODATA quantity: none; uncertainty/residual: not applicable. No parameter fitting. Original historical equations preserved; no claims about the actual Kerr/ER worldtube or its responsive medium.

Source reading: live BEDROCK aa5d236354258f4c4715f5cf77bff2c5db602cfd, 82,842 characters/548 lines, and subordinate STATE_OF_THE_THEORY b5958a1056c2541f00ab4f3477d8acc32426cfe9, 11,012 characters/155 lines, retrieved completely with focused review. Randomly selected SAT 2026 MATH REVAMP TAKE 1.txt, blob 399e194475ba55294202ea175b9f5d56f227c3c5, 64,352 characters/3300 lines, retrieved completely, distributed passages reviewed. Personal home-address material and other private passages excluded. Mersearch shared request occupied, no new Mersearch run claimed; bounded direct primary reads only. Full runnable Python and actual stdout are in originating calculation relay and local evidence packet.

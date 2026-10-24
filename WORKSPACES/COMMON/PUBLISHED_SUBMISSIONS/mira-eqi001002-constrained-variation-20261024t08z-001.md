# Mira | Calculation Relay 2026-10-24 08:12Z | EQI-001/002 variational closure

Historical source: Satobloc/SAT_THEORY_ARCHIVE_2023-25/FREEFORM DISCUSSION/SAT Lagrangian and Variational Derivation.txt, blob 9d5db44f16f1f2d853332efd8d91995a37e8d394 (1900 characters).
Displayed L = (1/2)(nabla theta)^2 - mu^2 cos(3theta) + lambda(u.u+1) + alpha(nabla_mu u_nu)(nabla^mu u^nu) + beta(nabla_mu theta)(nabla^mu u^nu)u_nu.
Displayed scalar equation: box theta + 3mu^2 sin(3theta) - beta div[(nabla u)u] = 0.

PREDECESSOR: HsH/WORKSPACES/COMMON/EQUATION_INTAKE_0002_VARIATIONAL_AUDIT_2026-10-23.md, blob a2c29ac9c67bd43e344f9fa05a49956917533706, independently identified the scalar sign mismatch and on-constraint beta zero. This turn completes the multiplier redefinition, full u variation, independent finite-difference test and kink check. Historical authorship beyond compiled assistant text is not established. This is NOT the operative finite-core action.

Let q=u.u+1 and A^mu=u_nu nabla^mu u^nu=(1/2)nabla^mu q (metric compatible). For constant beta,
L_beta=(beta/2)nabla_mu theta nabla^mu q
=-(beta/2)(box theta)q + div[(beta/2)q nabla theta].
Thus the BULK action is equivalent by lambda_eff=lambda-(beta/2)box theta, modulo the displayed boundary divergence. Assumptions: smooth fields, metric compatibility, unconstrained multiplier lambda, compatible boundary conditions, constant beta. This is a redundant coupling on the unit-norm branch, not an independent force.

For the exact source action, standard Euler-Lagrange gives:
box theta - 3mu^2 sin(3theta) + beta div A = 0;
2lambda u_nu - 2alpha box u_nu - beta(box theta)u_nu = 0;
u.u+1=0.
The historical scalar equation has two reversed signs. Its u summary has a factor-of-two mismatch in alpha and a nonmatching beta term. Corrected expressions are conditional algebra, NOT a preferred physical action or theory promotion.

EXECUTED: SymPy exact flat 1+1 static metric diag(-1,+1), four Euler-Lagrange variations, A=q'/2, beta integration-by-parts, and u=(cosh psi,sinh psi) giving L_on=(theta')^2/2-mu^2 cos(3theta)+alpha(psi')^2. ALL PASS.
Independent NumPy periodic 8192-grid action test: max |q|=4.44e-16, max |L_beta|=5.48e-13; off-shell integration-by-parts integral gap 0; theta variation finite-difference 1.2644692314711659 versus analytic 1.2644692314669594 (gap 4.21e-12). ALL PASS.
Historical tanh profile theta=(pi/3)(1+tanh(mu x)) at mu=1,x=0.5 has nonzero static residual for either sign: -3.7399472037535089 and +2.2176110298279097. The historical unsubtracted T00 tends to mu^2 at both spatial infinities, not zero. No uniquely justified replacement kink or physical identification asserted.
Initial symbolic run with mu unconstrained failed to evaluate asymptotic limits (depends on sign of mu); explicitly setting mu>0 repaired test assumptions, not the historical model.

GATES: original printed action+equations REJECTED as a pair; corrected variational identities PASS within stated assumptions; kink claim UNRESOLVED; physical HsH application NOT A CANDIDATE; CODATA verification queue triage only, no independently predicted CODATA observable or uncertainty-normalized residual; BEDROCK unchanged.
Scripts SHA256: primary fa15573c2f31e8a6ccbce1f5a64116dc79e4e79acbb9c73e4eed78810a0e83a2; independent b9b8e226fb6db217e40a71bdd8ff0a284afb4136501233cd0c46bf8ea3bed109. Full scripts and outputs in visible relay response and local COMPLETE.zip.

READS: live BEDROCK 82842 characters blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; subordinate STATE_OF_THE_THEORY 11012 characters blob b5958a1056c2541f00ab4f3477d8acc32426cfe9; randomized SAT BYO LAGRANGIAN 4178 characters blob 47ee684888525d9d71a6dd701041685681f3dc49; randomized HsH MINKOWSKI_VARIATIONS 132998 characters blob cb683778aef6dbecba11712504452d804216bd16. All retrieved completely and selected passages inspected, not manual line-by-line reading of all text. Actual Python secrets.choice draws; original short SAT draw supplemented. Shared Mersearch request blob 662e4a99e47a48e1e573cf0dddffaf1329dd60dd left unchanged; no new Mersearch run. No protected or private text reproduced.

RING: h=320, seq=1601, worker index 5 Mira, next index 6 Aldus.

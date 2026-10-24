# Aldus CODE 000 | Straight-core material twist and gauge gate | 2026-10-24T00Z

Task: calc48-20261024T00Z-aldus-material-fiber-gauge-001
Gate: INTERNALLY_CHECKED conditional Euclidean R4 geometry. Physical law UNRESOLVED; CODATA NOT_APPLICABLE; no BEDROCK promotion; NOT AN H(s)H CANDIDATE.

## Source genealogy
HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, blob 02312fbb23167e8ce1c996451199ee0e498437b1, lines 69-82, historically writes L_FILAMENT,i = T|X_i'|^2/2 + kappa|X_i''|^2/2. This is a centerline expression, not a unique finite-core constitutive law.
SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH BACKBONE, blob 1854995be3311f565739f2be64269cbb0385a82f, around lines 90-100, contains the fourth-order stiffness branch.
Existing correction-first controls: HsH WORKSPACES/MERIDIAN/SANDBOX/2026-10-08_FINITE_CORE_4D_JACOBIAN_MATERIAL_TWIST_GATE.md, blob 34e971374b9c8fb87b5f5cac3b699baf8462455b, already establishes physical-material versus gauge-frame twist. Loom's WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-finite-core-fiber-bending-20261023t23z-001.md, blob 330b0daef9e8cb8e3b397cad1dbc810ec30e8f55, integrates curvature of Bishop-frame offset fibers without material twist. The present calculation tests the complementary twist-only case, not a defect in Loom's declared domain.

## Exact geometry
Straight unit-speed R4 centerline X(s)=(s,0,0,0). Round normal ball y in B3(a). With physical material director rotation tau, F(s,y)=(s,y1 cos(tau s)-y2 sin(tau s),y1 sin(tau s)+y2 cos(tau s),y3).
For every tau the UNMARKED tube occupies the same set of points, and det DF=1, det(DF^T DF)=1. For a fixed material coordinate y, rho^2=y1^2+y2^2, speed^2=1+tau^2 rho^2 and fiber curvature kappa_f=tau^2 rho/(1+tau^2 rho^2).
The previously declared, explicitly conditional, fiber comparator dE=(K/2) kappa_f^2 ds_f d^3y integrates to
E/L=(K/2) int_B3(a) tau^4 rho^2/(1+tau^2 rho^2)^(3/2) d^3y
=K V3 tau^4 a^2/5 * 2F1(3/2,2;7/2;-(a tau)^2)
=(pi K/tau)*[(3+a^2 tau^2) atan(a tau)-3a tau] for tau!=0, V3=4pi a^3/3.
The continuous tau=0 limit is zero; the hypergeometric factor expands 1-6q^2/7+5q^4/7-20q^6/33+O(q^8), q=a tau. Leading E/L ~ K V3 a^2 tau^4/5. This is distinct from the pre-existing material twist STRAIN comparator proportional to tau^2; no constitutive selection is made.

## Gauge control
Under reference-frame rotation N->N H, H=Rot(sigma s), material director U->H^T U, the tube map is unchanged. Covariant W=U_tilde^T[(H^T H')U_tilde+U_tilde'] = tau J12; naive U_tilde^T U_tilde'=(tau-sigma)J12. For tau=0 and sigma!=0 the naive expression falsely assigns material twist. Thus reference-frame spin is gauge; marked material spin can be physical if material labels are established.

## Actual executed tests
SymPy exact determinant, metric, curvature, gauge, series and zero-twist limit: PASS. a=0.25, tau=2, L=2pi, K=1 arbitrary normalized: q=0.5, 2F1=0.8225675103143852, E/L=0.01076738353118883, E=0.0676534659999331. Independent adaptive cylindrical quadrature E/L=0.010767383531188822. Seeded uniform-ball Monte Carlo N=300000 gives 0.010773934133472149 +/- 0.000011563190144046414 (0.567 SE residual). Independent finite-difference curvature 0.6095374636726949 vs exact 0.609537468626748. Similarity scale 3.2 at fixed K: E'/E=10.24. ALL_ASSERTIONS_PASSED after correcting a test-harness substitution of q=a*tau; no physical parameter was tuned.
Executed Python SHA256: 00a16ce61541b9ce378ed6aea1e9bd86f455397ba81bb91e9049c544818cd9d1. Complete code and stdout retained in conversation artifacts.

## Retrieval, reading and privacy
Full live BEDROCK.md retrieved (blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, 548 lines, 82842 characters); STATE_OF_THE_THEORY.md retrieved (blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines, 11012 characters); directives ND-2026-10-18-02/03 and October 23 correction-first/candidacy reviewed. Mersearch request 2026-10-21-orson-nlm-big-haul-math-001 is occupied: inspected three-root run manifest and compact receipt (23825506 records, 34983 hits), not a new targeted search. Direct bounded original-source reads followed.
Actual secrets.randbelow(4) yielded index 3 from [REUILIGIG.txt, MISC/AN Excellent Request.txt, RMS THE FRAMEWORK.txt, 2026 MATH REVAMP TAKE 1.txt]. Selected SAT 2026 MATH REVAMP TAKE 1.txt, blob 399e194475ba55294202ea175b9f5d56f227c3c5, 3300 lines, 64352 characters; full file retrieved and distributed passages examined. Contains a B-derivation recovery discussion and unrelated personal material, which is not reproduced. No protected signet or private resource excerpts.

Disposition: INTERNALLY_CHECKED conditional mathematics, physical material-frame selection UNRESOLVED, CODATA NOT_APPLICABLE, not a candidate, no BEDROCK change.

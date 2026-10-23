# Meridian CODE 000 | 4D Frenet determinant and historical torsion normalization | 2026-10-23T22Z
Task ID: calc48-20261023T22Z-meridian-frenet-determinant-001
Status: INTERNALLY_CHECKED correction of a standard differential-geometric invariant. Historical tau-as-torsion formula REJECTED. Physical worldtube interpretation UNRESOLVED. No BEDROCK promotion.

## Historical exact equation and genealogy
HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, section 3.2, lines 65-71, blob 02312fbb23167e8ce1c996451199ee0e498437b1:
kappa(lambda)=|X''(lambda)|.
tau(lambda)=det(X',X'',X''',X'''') / |X''|^2.
The text calls tau a four-dimensional Frenet-Serret torsion.
SAT archive H(s)H MATH TO DO.txt, blob f827a01577d98ad1cb3ba3a75c5dd66e1bccc952, calls for the three Frenet curvatures kappa1,kappa2,kappa3; this is an orientation/toolbox source, not an independent derivation.
Meridian's earlier WORKSPACES/MERIDIAN/SANDBOX_2026-10-05_FRENET_SO4_RATE_MAP.md, blob f6f2d4a0b921580f18bb3dc5b2d77cb46ce41dfd, already establishes the 4D Frenet generator with three curvatures. Present correction concerns the determinant normalization and is not a claim to originate the three-curvature framework.

## Exact mathematical repair
For a regular arclength-parametrized Euclidean R4 curve with kappa1>0 and kappa2>0, standard oriented Frenet equations give
det(X',X'',X''',X'''')=kappa1^3*kappa2^2*kappa3_signed.
Thus kappa3_signed=det(X',X'',X''',X'''')/(kappa1^3*kappa2^2).
Unsigned third curvature is its absolute value; the sign depends on ambient orientation.
Historical tau_old=det/|X''|^2=kappa1*kappa2^2*kappa3_signed, not kappa3.
Units for arclength s and coordinate X both length: det has L^-6; historical tau has L^-4; true kappa3 has L^-1. Under geometric scaling X_L(s)=L X(s/L), tau_old scales L^-4, while kappa3 scales L^-1.
The historical expression is a legitimate determinant-based scalar density, but it is not a torsion curvature.

## Reproducible numerical fixture
Use the already-established normalized two-frequency curve:
X(s)=(sqrt(4/15)*cos(s),sqrt(4/15)*sin(s),sqrt(11/60)*cos(2s),sqrt(11/60)*sin(2s)).
Exact results: |X'|^2=1; det(X',X'',X''',X'''')=88/25; kappa1^2=16/5; kappa2^2=11/20; kappa3_signed=sqrt(5)/2; historical tau_old=11/10.
They happen to be numerically close at unit scale (1.11803 versus 1.1), but their scaling exponents differ by three. This coincidence cannot validate the old identification.
Executed SymPy exact assertions and independent 13-point finite-difference derivatives at s=0,0.47,1.3; kappa3 finite-difference deviations under 7e-6. Script SHA256: 3f60697c6a67103bcc1846d3d2f676ebb19191a62c17616dac2a770cb44e1c78. Execution result ALL_ASSERTIONS_PASSED.
At kappa2=0, the third Frenet curvature is undefined, not automatically zero. The corrected denominator is only used on the nondegenerate Frenet stratum.

## CODATA and source-control gates
No independently specified physical observable or CODATA quantity exists for this purely geometrical fixture. Status INTERNALLY_CHECKED, CODATA comparator NOT_APPLICABLE; no fitted constants or model uncertainty fabricated.
BEDROCK.md full live blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, 548 lines/82842 characters, and STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines/11012 characters, retrieved; governing ND-2026-10-18-02/03 and October 23 correction-first directives examined.
Existing three-repository Mersearch manifest 2026-10-21-orson-nlm-big-haul-math-001 inspected; no new Mersearch run claimed or shared request overwritten. A genuine Python secrets.randbelow(3) selected SAT 2026 MATH REVAMP TAKE 1.txt, blob 399e194475ba55294202ea175b9f5d56f227c3c5, 3300 lines/64352 characters. It contains both historical equation inventory and sensitive autobiographical/location information; the latter is excluded entirely from this public note. Source sections inspected, not represented as a line-by-line close reading.
No private personal information, protected signet, or raw private archive material is reproduced. No H(s)H candidacy or physical validity claimed.

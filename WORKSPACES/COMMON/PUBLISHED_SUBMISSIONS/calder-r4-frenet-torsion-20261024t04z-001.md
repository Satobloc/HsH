# Calder CODE 000 | 4D Frenet parameterization and degeneracy extension | 2026-10-24T04Z
Task: calc48-20261024T04Z-calder-r4-frenet-torsion-001
Status: INTERNALLY_CHECKED standard differential geometry. Historical tau-as-torsion formula REJECTED. Historical intended torsion index and physical H(s)H interpretation UNRESOLVED. No BEDROCK promotion.

## Established correction first
Meridian already published the arclength determinant correction in WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-frenet-determinant-20261023t22z-001.md (blob 55f8e06a6430f34b5adcb6763ad6edbbb3679d51). This packet independently extends it to arbitrary regular parameterizations and an exact degeneracy family, NOT a claim of original discovery.
Historical HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt section 3.2 lines 63-66 (blob 02312fbb23167e8ce1c996451199ee0e498437b1): kappa(lambda)=|X''| and tau(lambda)=det(X',X'',X''',X'''')/|X''|^2. Both require arclength/parameter audit. SAT archive 2026/SAT MATH - BACKBONE.txt (blob 1854995be3311f565739f2be64269cbb0385a82f) retains historical four-dimensional filament and stiffness material; not independent proof of tau.

## Exact general-parameter correction
Let Vj=d^j X/dlambda^j and Dj=det Gram(V1,...,Vj). For D1,D2,D3>0:
kappa1=sqrt(D2)/D1^(3/2);
kappa2=sqrt(D3)/D2;
signed_kappa3=det(V1,V2,V3,V4)*sqrt(D2)/(sqrt(D1)*D3).
Under arclength, det=kappa1^3*kappa2^2*signed_kappa3, reproducing Meridian. Historical tau has units L^-4 rather than curvature L^-1 and depends on parameterization. The historical symbol tau could refer to either higher Frenet curvature in R4; this is not uniquely resolved.

## Executed fixtures
For X(s)=(sqrt(4/15)cos s,sqrt(4/15)sin s,sqrt(11/60)cos2s,sqrt(11/60)sin2s): (D1,D2,D3,D4)=(1,16/5,704/125,7744/625); det=88/25; (kappa1,kappa2,signed_kappa3)=(4/sqrt5,sqrt55/10,sqrt5/2); historical tau=11/10. Reparameterize s=2*lambda: naive tau multiplies by 64, corrected curvatures invariant. Nonlinear s=lambda+lambda^3/10 at lambda=2/5: naive tau=1.4359116181397578, corrected kappa3=1.118033988749895. Similarity X_L(s)=L X(s/L): naive tau scales L^-4, corrected curvatures L^-1. Ambient reflection flips signed kappa3.
For general X=(A cos s,A sin s,B cos2s,B sin2s), kappa2=6AB/((A^2+4B^2)*sqrt(A^2+16B^2)), signed_kappa3=2/sqrt(A^2+16B^2), historical tau=72A^2B^2/(A^2+16B^2). As B->0+, kappa3 tends 2/A, but at B=0 D3=0 and kappa3 is UNDEFINED, not zero. No topology transition is inferred.

## Reproducibility and controls
Two executed Python/SymPy scripts passed exact identities, nonlinear parameterization, scale, orientation, and finite-difference checks. Script SHA256: 80d9fb5ec07490df719f092f3662aeeb9e637e17a385c72918d134cd89027937 and 1bf1830e5b277f2e1b78d2fa1fd45085b8107cac184c85c061c09b9b9833e7a1. Initial extension assertion failed from unfactored symbolic Gram determinant; factoring repaired only the test harness. Full scripts and outputs retained in originating relay evidence packet.
Live BEDROCK (blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, 548 lines/82842 chars) and STATE_OF_THE_THEORY (blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines/11012 chars) retrieved. Actual random archival selection: SAT MATH - BACKBONE.txt (1563 lines/233643 chars); unrelated random selection RMS THE FRAMEWORK.txt (blob 5faeca9f1818b3761844345d37ba9ebe52c5ef47, 4094 lines/549339 chars). Distributed passages reviewed; private autobiographical and third-party details excluded. Existing Mersearch manifest 2026-10-21-orson-nlm-big-haul-math-001 inspected (blob 0f017d6f557d24c721e417d1fe3c49abf0653991); no new run claimed.
CODATA: NOT_APPLICABLE, no physical observable or independently fixed scale; no fit or residual. No physical validation, candidacy, or BEDROCK promotion.

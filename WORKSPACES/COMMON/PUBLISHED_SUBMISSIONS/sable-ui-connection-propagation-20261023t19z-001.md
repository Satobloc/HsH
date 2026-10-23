# Sable CODE 000 | UI connection propagation audit | 2026-10-23T19Z
Task ID: calc48-20261023T19Z-sable-ui-connection-propagation-001
Gate: INTERNALLY_CHECKED algebra; current HsH applicability UNRESOLVED. Not an independent physical prediction or BEDROCK promotion.

## Historical source and established later correction
HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, lines 23-40, Git blob 02312fbb23167e8ce1c996451199ee0e498437b1, states y=r R x0 and
Omega=(dR/dlambda)R^-1=(dR/dlambda)R
and u=rdot R x0+r Omega R x0, with L_UI=rdot^2/2+r^2 Omega_ij Omega_ij/2.
SAT MAY_2026_SNAPSHOT.txt blob c29c49b697208294d705b0a280d91808a57edc66 preserves the SO(4) rotation background. Dates are archive labels, not necessarily dates of each embedded derivation.
Established later correction (NOT newly discovered): Mercer, WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-ui-stabilizer-20261023t07z-001.md, blob 429f81234c0c1dff81e95c3d087bf7469fe8d8e6, already established that the final equality must use R^T, not R, and that frame-stabilizer motion can change the UI frame cost without changing the worldline.

## New explicit propagation and masking test
Take R(z)=diag(R12(z),I2), x0=e1, r(z)=z, J12=[[0,-1],[1,0]].
Correct: Omega=R'R^T=J12, antisymmetric, trace 0.
Archived erroneous: Omega_bad=R'R=J12 R12(2z), symmetric part -sin(2z) I2, trace -2sin(2z).
At z=pi/4: Omega_bad=-I2 while Omega=J12. The wrong generator is a symmetric contraction, not an SO(4) infinitesimal rotation.
MASKING: Frobenius norm squared Omega_ij Omega_ij=2 for BOTH definitions. The archived scalar UI rotational cost cannot distinguish them in this example.
But the worldline derivative does:
u_direct=y'=R e1+z R'e1 = u_correct;
u_bad=R e1+z Omega_bad R e1;
|u_bad-u_direct|^2=4z^2 sin^2(z).
At z=pi/4, error norm=pi/(2sqrt(2))=1.1107207345395915.
True speed squared=1+z^2; bad speed squared=1+z^2-2z sin(2z). At pi/4 these are 1+pi^2/16 and (1-pi/4)^2 respectively.
This propagates an already-corrected transcription error into a large, previously unquantified trajectory-velocity error, even while the UI scalar contraction agrees.

## Reproducibility, dimensional and limiting checks
Executed SymPy exact 4x4 matrix identities and independent NumPy centered finite differences at h=1e-5: derivative residual 5.119374215976987e-11; erroneous generator trace -1.9999999999605047 at pi/4. All final assertions passed. An initial simplification assertion needed explicit trig expansion, with no changed physics or parameters.
z and r=z are dimensionless mathematical controls; a physical arclength requires z=lambda/l0, and angular velocity has units 1/lambda. No physical length scale was selected. At z=0 the definitions agree, but differ generically.
CODATA 2022: no independent measurable quantity is predicted; no uncertainty or residual is applicable. Mathematical clearance is not HsH candidacy.

## Intake and privacy
Full live BEDROCK.md retrieved (blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; 548 lines, 82842 characters); full STATE_OF_THE_THEORY.md retrieved (blob b5958a1056c2541f00ab4f3477d8acc32426cfe9; 155 lines, 11012 characters). Relevant ND-2026-10-18-02/03, October 23 correction-first and Factory Floor gates inspected.
Shared Mersearch request 2026-10-21-orson-nlm-big-haul-math-001 was not overwritten; this turn used bounded connected-repository correction search, not a new Mersearch run.
Actual Python secrets.randbelow(2) selected SAT RMS THE FRAMEWORK.txt (blob 5faeca9f1818b3761844345d37ba9ebe52c5ef47; 4094 lines, 549339 characters); distributed sections examined, not all lines closely read. Epistemology and philosophy are substantial topics; private autobiographical passages are excluded from this public packet.

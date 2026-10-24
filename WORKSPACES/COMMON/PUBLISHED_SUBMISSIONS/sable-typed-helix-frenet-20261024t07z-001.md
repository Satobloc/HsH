# Sable Calculation Relay 2026-10-24 07:12Z | Typed helix curvature

STATUS: INTERNALLY_CHECKED mathematical identity; ACTIVE_CODATA_VERIFICATION queue for future independent observables only. NOT an H(s)H candidate; no physical validation. CODE 000 / ND-2026-10-18-02/03 / ND-2026-10-23.

## Original and later work
Historical source: Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/H(s)H TEMPORAL ISOTROPY.txt; git blob 8be62af34009f9d9e97c94d137fe43ace3f39e21; MOVE 8-9. Exact original helix r(phi)=(R cos(phi),R sin(phi),P phi/(2 pi)), R=a0, P=lambda_C, b=P/(2 pi R)=alpha. This encodes known scales, not alpha prediction. Predecessor: Satobloc/HsH/WORKSPACES/MERIDIAN/SANDBOX/AVERY_HELIX_IDENTIFIABILITY_BENCHMARK_2026-10-10.md; blob a099b11b4cea2895ebea49c2164b75fd0f0efc41; spatial Frenet and proper acceleration; curve-only inverse dynamics nonunique. Kestrel causal-axis check: HsH issue #338. This relay adds exact Minkowski Frenet torsion and typed comparison. Original speaker-level authorship of compiled Temporal Isotropy text unresolved.

## Exact calculation, native Planck units c=G=hbar=1
Let 0<v<1, b=P/(2 pi R), v_perp=v/sqrt(1+b^2), u=b*v/sqrt(1+b^2), gamma=1/sqrt(1-v^2), omega=v_perp/R, Omega=gamma*omega.
Timelike worldline X(s)=(gamma*s,R*cos(Omega*s),R*sin(Omega*s),gamma*u*s), metric diag(-1,+1,+1,+1).
U=X', A=X'', J=X''': U.U=-1, U.A=0, A.A=kappa_M^2, J.U=-kappa_M^2, J.A=0, J.J=kappa_M^2 Omega^2, J'= -Omega^2 A. Therefore kappa_M=gamma^2*v^2/[R(1+b^2)], tau_M=sqrt(Omega^2+kappa_M^2), second timelike Frenet torsion=0.
Spatial Euclidean helix: kappa_E=1/[R(1+b^2)], tau_E=b/[R(1+b^2)], ratio_E=b.
Minkowski ratio_M=sqrt(1+b^2-b^2*v^2)/v. Exact inequality ratio_M^2-1=(1+b^2)(1-v^2)/v^2>0. Thus spatial torsion/curvature and timelike torsion/curvature are NOT interchangeable, even for identical spatial traces. Speed v is an independently required time-map input.

## CODATA 2022 input-only calculation
NIST CODATA 2022 via scipy.constants 1.17.0: alpha=0.0072973525643 (u=1.1e-12), electron mass=9.1093837139e-31 kg (u=2.8e-40 kg). Planck m_e=4.185462219147093e-23, R=1/(m_e alpha)=3.274094759491465e24 lP. The Bohr fixture b=v=alpha is INPUT.
kappa_E=3.054116709915936e-25 /lP, tau_E=2.2286966404776534e-27 /lP, ratio_E=0.0072973525643.
kappa_M=1.626445124849473e-29 /lP, tau_M=2.2288746676801298e-27 /lP, ratio_M=137.03964761100755.
Holding R,b fixed, changing v/alpha=0.5,1,2 changes ratio_M to 274.0792955134528,137.03964761100755,68.5198235140661.
kappa_M/(m_e alpha^3)=1/(1-alpha^4)=1.0000000028357066, relative +2.8357065584572183e-9. This is a relativistic kinematic consequence of chosen input, not an independent physical residual. CODATA uncertainty-normalized residual NOT APPLICABLE. No covariance propagation or observational fitting.

## Verification and reading
Executed SymPy exact seven 4D inner-product residuals plus second-torsion check, all zero. Independent 5-point finite differences at step .01: relative kappa error -2.5901572e-9, tau error -1.6291274e-6; smaller steps suffer roundoff, retained. Complete runnable script and JSON in conversation artifact. Script SHA256 97f58b383542730edd31696a6859ee349557349170470573ea6bbc9ea92bbfaa, output SHA256 d34ece5b5cc95f75efa2c2df919048c4cd05cc0c54fe1aa23faa.
BEDROCK 82842 chars / 548 lines blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; STATE_OF_THE_THEORY 11012 chars /155 lines blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Actual Python secrets.choice selected SAT RMS THE FRAMEWORK.txt 549339 chars /4094 lines blob 5faeca9f1818b3761844345d37ba9ebe52c5ef47, and HsH MINKOWSKI_VARIATIONS.txt 132998 chars /1989 lines blob cb683778aef6dbecba11712504452d804216bd16. Full retrieved and programmatically inspected; relevant passages manually reviewed, not all 680k chars manually read. No private text reproduced. Mersearch shared request blob 662e4a99e47a48e1e573cf0dddffaf1329dd60dd occupied; not overwritten. Bounded SAT/HsH connector search fallback, HSH_RESOURCES query no matches. No Mersearch execution claimed.
GATES: spatial and timelike geometry PASS, typed ratio conflation REJECTED, unique dynamics UNRESOLVED, cross-sector candidacy NOT A CANDIDATE, physical validation NONE, BEDROCK unchanged.

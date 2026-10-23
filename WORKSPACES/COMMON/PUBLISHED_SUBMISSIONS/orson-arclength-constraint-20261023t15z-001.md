# Orson Vay | CODE 000 constrained-arclength recovery | 2026-10-23 15Z

SANDBOX. Historical equation recovery and mathematical test only. No H(s)H candidacy, no BEDROCK promotion, no physical validation.

Task: calc48-20261023T15Z-orson-arclength-constraint-001. Worker Orson Vay, next Sable. Lane: dynamics / 4D geometry / source correction.

## Provenance
- SAT_THEORY_ARCHIVE_2023-25/MAY_2026_SNAPSHOT.txt, blob c29c49b697208294d705b0a280d91808a57edc66, lines 62-66: kappa H_i'''' + 2 lambda_s (r^2-R^2) H_i + k(H_i-G_i)=0; also the click-rate equation kappa omega^4 + 2 lambda_s r_h^2=0.
- HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt, blob 33785afb8d46804122d79056b952169f99b325e2, lines 12-22, action kappa|H''|^2/2 + lambda_s(|H|^2-R^2)^2/2 + k|H-G|^2/2. Original message date not authenticated.
- HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, blob 02312fbb23167e8ce1c996451199ee0e498437b1, lines 103-115, repeats the action and claims distinct-frequency harmonic stability.
- Later correction: HsH/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-bending-arclength-gate-20261023t08z-001.md, blob d72b16f40b6cd6a6b30a016e17870e38ba405ebb. Ravel correctly identifies failure of unnormalized arclength interpretation and distinct-frequency obstruction for the UNCONSTRAINED action. This note does not overwrite that result.

## New constrained variational gate
The historical action is not a reparameterization-invariant bending energy as written. If its parameter s is asserted to be arclength, constrained variation must account for |H'(s)|^2=1. Test the explicitly NEW mathematical constrained functional:

E[H,tau] = integral ds { kappa |H''|^2/2 + lambda_s (|H|^2-R^2)^2/2 + k |H-G|^2/2 + tau(s)(|H'|^2-1)/2 }.

For periodic boundaries and independent G,R, the exact Euler-Lagrange system is:

kappa H'''' + 2 lambda_s (|H|^2-R^2) H + k(H-G) - (tau H')'=0;
|H'|^2=1.

The tau term is a Lagrange multiplier for inextensibility, NOT a derived physical filament tension or new accepted constitutive law.

For a single circle H=a(cos(s/a),sin(s/a),0,0), k=0, tau constant:

kappa/a^4 + 2 lambda_s(a^2-R^2) + tau/a^2=0;
tau=2 lambda_s a^2(R^2-a^2)-kappa/a^2.

Setting tau=0 recovers Ravel's special restriction kappa=2 lambda_s a^4(R^2-a^2) and the bound kappa<=8 lambda_s R^6/27. With a freely determined constraint reaction, that bound is NOT necessary for stationary constrained circles. For R=1, kappa=1, lambda_s=2, a=0.8 (Planck-normalized illustrative values), tau=-0.6409, |H'|=1, max equation residual 1.78e-16. One-loop bending energy E_bend=pi*kappa/a=3.9269908169872414. The loop length is 2*pi*a and therefore changes with a.

## New nondegenerate two-plane R4 example
Take H=(A cos(w1 s), A sin(w1 s), B cos(w2 s), B sin(w2 s)), w1=1, w2=2. Its unit-speed condition is A^2 w1^2+B^2 w2^2=1. With k=0 and constant tau, the two component equations are

kappa w_i^4+2 lambda_s(S-R^2)+tau w_i^2=0, S=A^2+B^2.

For distinct squared frequencies, subtraction forces
tau=-kappa(w1^2+w2^2),
S=R^2+kappa w1^2 w2^2/(2 lambda_s).

Exact normalized example: kappa=1/10, lambda_s=1, R=1/2, w1=1, w2=2, A^2=4/15, B^2=11/60, S=9/20, tau=-1/2. Both component equations vanish exactly and A^2+4B^2=1. The first complex coordinate A exp(i s) makes the closed curve embedded for s modulo 2*pi. Numerical max EL residual 1.60e-16, unit-speed error 1.11e-16, bending energy per loop 1.0053096491487339 Planck energies. This is a mathematical counterexample to extending the UNCONSTRAINED distinct-frequency obstruction to the CONSTRAINED problem. It does not disprove the original narrower obstruction.

## Dimensional gate
Interpret E as line energy: [s]=L, [H]=L, [kappa]=E*L, [lambda_s]=E/L^5, [k]=E/L^3, [tau]=E/L. These are NOT automatically the historical bulk-energy-density coefficients, whose dimensions differ. Planck units c=G=hbar=1 were used for the numerical examples, retaining typed dimensions.

## Verification and limits
SymPy symbolic derivation and NumPy sample residuals executed locally, ALL_ASSERTIONS_PASSED. Full executable script SHA256 82ef1f45b699e5befb3f22102975c38865892243b9f4440f83ae404298730d9a. The arclength multiplier does not determine material response, Kerr/ER core mechanics, finite tube radius, energy ceiling, stability, or physical evolution. For a single one-turn periodic curve, fixing total length also fixes a. No CODATA 2022 quantity corresponds to the illustrative multiplier or energy; residual and z-score not defined. Status INTERNALLY_CHECKED (constrained mathematical model); H(s)H connection UNRESOLVED; NOT A CANDIDATE.

## Retrieval/read discipline
Full current HsH BEDROCK.md blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, 548 lines, 82842 chars, and subordinate STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines, 11012 chars, were fetched and scanned by section, including ND-2026-10-18-02/03 and CODE 000. Existing Mersearch stable-1.0 three-root run 2026-10-21-orson-nlm-big-haul-math-001 manifest blob 0f017d6f557d24c721e417d1fe3c49abf0653991, 13897 files, 23825506 records, 34983 hits, was inspected. Shared request slot occupied, no new Mersearch execution; bounded GitHub fallback was used for corrections. Actual secrets.randbelow(2) selected SAT/RMS THE FRAMEWORK.txt, blob 5faeca9f1818b3761844345d37ba9ebe52c5ef47, 4094 lines, 549339 chars. Full text fetched, programmatically scanned and six distributed sections inspected. It includes unrelated philosophy, science education and autobiographical discussions; no personal material is reproduced here.

## Minimal independently runnable Python
```python
import numpy as np
from math import pi,sqrt
k,l,R,w1,w2=.1,1.,.5,1.,2.
S=R**2+k*w1*w1*w2*w2/(2*l)
B2=(1-w1*w1*S)/(w2*w2-w1*w1)
A2=S-B2
tau=-k*(w1*w1+w2*w2)
assert abs(A2*w1*w1+B2*w2*w2-1)<1e-14
assert abs(k*w1**4+2*l*(S-R*R)+tau*w1*w1)<1e-14
assert abs(k*w2**4+2*l*(S-R*R)+tau*w2*w2)<1e-14
assert abs(A2-4/15)<1e-14 and abs(B2-11/60)<1e-14
print(A2,B2,tau,pi*k*(A2*w1**4+B2*w2**4))
```

## Handoff
Retain the historical unconstrained fourth-order equation and Ravel's audit. Add a distinct constrained-arclength branch with an explicit multiplier, rather than silently replacing the original. Next gate: constrained second variation, finite-core clearance, and actual material tension derived from the operative H(s)H mechanics. No CODATA fitting and no BEDROCK edit.

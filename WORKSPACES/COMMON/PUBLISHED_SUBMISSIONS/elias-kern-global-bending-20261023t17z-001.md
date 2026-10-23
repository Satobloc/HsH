# Elias Kern | CODE 000 | Global constrained bending certificate | 2026-10-23 17Z

Task: calc48-20261023T17Z-elias-kern-global-bending-001. Worker Elias Kern, ring successor Nadir Voss.
Status: INTERNALLY_CHECKED Euclidean mathematical theorem; no H(s)H physical candidacy or BEDROCK promotion. No independent CODATA prediction.

## Historical source and correction chain
SAT archive MAY_2026_SNAPSHOT.txt, blob c29c49b697208294d705b0a280d91808a57edc66, lines 62-66, preserves kappa H_i^(4)+2 lambda_s(r^2-R^2)H_i+k(H_i-G_i)=0.
HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt, blob 33785afb8d46804122d79056b952169f99b325e2, lines 13-22, preserves L=kappa|H''|^2/2+lambda_s(|H|^2-R^2)^2/2+k|H-G|^2/2.
Ravel ravel-bending-arclength-gate-20261023t08z-001.md, blob d72b16f40b6cd6a6b30a016e17870e38ba405ebb, identifies arclength normalization and unconstrained harmonic restrictions.
Orson orson-arclength-constraint-20261023t15z-001.md, blob 61f2f800e7fed120b7eae23e073a38e40cd2f3ed, introduces the NEW pointwise unit-speed constraint and an exact 1:2 R4 fixture. The multiplier is not historically authenticated as part of the old action.
Alberr alberr-reach-secondvariation-20261023t16z-001.md, blob ebb2a3d086c2582c19649a61afbba1e6ae88cd51, checks reach and restricted Hessian, but not full variations.

## Exact theorem
Let H:[0,2pi]->R4 be a C2 closed 2pi-periodic curve with |H'(s)|^2=1 pointwise. In explicitly typed Planck-normalized line-energy units, define
E[H]=integral [ (1/20)|H''|^2 + (1/2)(|H|^2-1/4)^2 ] ds.
Add the constraint multiplier tau=-1/2, identically zero on admissible curves:
E_aug=E-(1/4)integral(|H'|^2-1)ds.
Exact polynomial completion yields
E_aug=integral [ (1/20)(|H''|^2-5|H'|^2+4|H|^2) + (1/2)(|H|^2-9/20)^2 + 9/50 ] ds.
Fourier/Parseval on period 2pi gives
integral(|H''|^2-5|H'|^2+4|H|^2)ds = 2pi sum_{n in Z}(n^2-1)(n^2-4)|h_n|^2.
For every integer n the factor is nonnegative: n=0 gives 4, |n|=1 or 2 gives zero, |n|>=3 is positive. Thus
E[H]>=9pi/25.
Equality is attained by
H(s)=(A cos s,A sin s,B cos 2s,B sin 2s), A^2=4/15, B^2=11/60.
Here |H'|^2=1, |H|^2=9/20, and only harmonics 1 and 2 occur. It is a GLOBAL minimizer among all curves in the stated admissible class, not merely the amplitude family. Minimizer uniqueness is NOT claimed.

## Reproduction and gates
Exact energy E_bend=8pi/25, E_potential=pi/25, E_total=9pi/25=1.1309733552923256. Executed Python/SymPy verified exact polynomial identity and Fourier factorization, 100001-point quadrature (zero displayed residual), and 56 deterministic unit-speed two-frequency controls (none below bound). Script SHA256 b77ee488b8a498566efd03fa0519fd4e797312c61882d0d7866a69b643414ef3. Output: ALL_ASSERTIONS_PASSED.
Unit typing for line energy: [kappa]=energy*length, [lambda_s]=energy/length^5, [tau]=energy/length. This is Euclidean and depends on the 2pi period, fixed unit speed and chosen illustrative coefficients. The closed R4 fixture is not a future-directed Minkowski worldline; no physical prediction or CODATA residual. Original SAT equation is preserved without retroactive rewriting.

# Mira | Whirligig two-frequency and mass-bridge audit | 2026-10-23 05:24 EDT

Status: historical mathematical recovery / sandbox. Exact algebra verified in executed Python; CODATA comparison negative. Not a BEDROCK promotion or empirical proof.

## Historical primary sources

SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH-SAT Roundup 3/THE_WHIRLIGIG.txt`, Git blob `e244a2187ab3fbf0d55ddeffa71aa3e4cbc97057`, 741 lines retrieved; relevant lines 95-156 read. HsH: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt`, Git blob `02312fbb23167e8ce1c996451199ee0e498437b1`, 236 lines retrieved; sections 1, 5, 6 read. Individual original dates/authorship unresolved. SAT random historical read: `WORLDTUBE THOUGTS.txt`, blob `735f2a95e492944a244d1ceba31f33b6b5606119`, 224 lines retrieved; the source already cautions about fourth-order arclength/time ambiguity. HsH random read: Interconn, as above. Genuine Python secrets.choice draw from bounded three-document pools in each archive.

BEDROCK blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8` and STATE blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9` retrieved and governing sections reviewed. Mersearch bridge `MERSEARCH_REQUEST.json` occupied by Orson request `2026-10-21-orson-nlm-big-haul-math-001`; no overwrite and no Mersearch execution claimed. Bounded repository search plus direct original reads used; three-root search incomplete.

## Whirligig action and necessary two-frequency condition

Historical: L = (kappa/2)|H''|^2 + (lambda_s/2)(|H|^2-R_s^2)^2 + (k/2)|H-G|^2.
Exact Euler-Lagrange: kappa H'''' + 2 lambda_s (|H|^2-R_s^2) H + k(H-G)=0.

For k=0 and H(s)=(a cos(ps),a sin(ps),b cos(qs),b sin(qs)), define D=a^2+b^2-R_s^2. The two coordinate planes require simultaneously

F_p=kappa*p^4+2*lambda_s*D=0,
F_q=kappa*q^4+2*lambda_s*D=0.

Subtracting gives kappa*(p^4-q^4)=0. For nonzero kappa and real p,q, |p|=|q|. Thus the historical claim that its single omega^4 dispersion proves a genuine unequal-frequency 4D superhelix stationary is FALSE for the uncoupled constant-radius action. The original uses R for both the major helix radius and the sphere radius; a and R_s disambiguate, without introducing new physics.

For kappa>0, lambda_s>0, a=R_s, b>0, D=b^2>0, and no nonzero-frequency stationary solution exists. Negative lambda_s can cancel one mode but gives an unbounded-below quartic radial potential and does not establish stability. An exact equal-frequency stationary example exists at a=b=kappa=lambda_s=1, p=q=2, R_s=sqrt(10), but is a planar circle in R4, not a genuine two-frequency superhelix. If the penalty constraint is exactly satisfied, |H|^2=R_s^2, the penalty force vanishes and kappa>0 forbids nonzero circular frequency. The squared penalty is not a strict Lagrange multiplier.

Exact residual: ||E||^2=a^2 F_p^2+b^2 F_q^2. Minimizing over D gives D*=-kappa*(a^2 p^4+b^2 q^4)/(2 lambda_s*(a^2+b^2)) and ||E||_min=|kappa|*|p^4-q^4|*a*b/sqrt(a^2+b^2). For a=b=kappa=lambda_s=1,p=2,q=3, ||E||_min=65/sqrt(2)=45.96194077712559, never zero. Source-style a=R_s=1 gives residual 84.92938243034621. A 2048-point numeric sample agrees within 1.43e-14.

Units conditional on arclength s and energy-per-length integrand: [kappa]=energy*length; [lambda_s]=energy/length^5; [k]=energy/length^3. If s is physical time instead, this is a higher-time-derivative model and needs an independent stability analysis. No Lean execution. Coupled finite-core Kerr/ER geometry not tested by this uncoupled comparator.

## Mass bridge: exact algebra error and CODATA failure

Interconn prints B=3/(4*pi), mp=3*m0/(2B), me=m0*B^4, mu=mp/me=3/(2B^5)*(1+Delta_bridge), Delta_bridge approximately +8.2e-5. It incorrectly rewrites 3/(2B^5) as 128*pi^5/81 and claims mu approximately 1836.152673.

Unique algebraic correction: 3/(2*(3/(4*pi))^5) = 512*pi^5/81 = 1934.3466495069642478... . The printed 128*pi^5/81 is only 483.586662376741..., exactly one quarter. With its own positive bridge +0.000082 the predicted ratio is 1934.5052659322238, not 1836.152673.

2022 CODATA, NIST Web v9.0 (9 May 2024), proton-electron mass ratio 1836.152673426(32), dimensionless; standard uncertainty 0.000000032. Official source: https://physics.nist.gov/cgi-bin/cuu/Value?mpsme%7Csearch_for=proton+mass .

Unbridged residual (model minus CODATA): +98.19397608096425, +5.34781107814%. With source positive bridge: +98.35259250622382. The inverse-fit bridge needed at fixed B is -0.0507633810651221, opposite sign and ~619x the historical bridge magnitude; it is a fit, NOT an independent prediction. Formal residual/u(CODATA) is not a statistical significance because theoretical uncertainty is unquantified.

## Gates

Whirligig Euler-Lagrange algebra PASS; unequal-frequency stationary claim FAIL; unique two-mode correction VERIFIED; stability UNRESOLVED; finite-core coupled model UNTESTED; printed 128-to-512 coefficient corrected with proof; printed positive bridge CODATA FAIL; no independent mass prediction; no theory promotion. Complete executed Python, stdout, JSON results, three Class P figures and complete archival report are preserved in the initiating conversation artifact.

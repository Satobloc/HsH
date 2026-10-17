# Aster s1: uncertain genealogy and confidence reversal
Date: 2026-10-16T17:12Z. SANDBOXED, source-grounded reconstruction, not authenticated Aster participation.

Let H be binary with equal prior. With prior rho, k reports share one root C; otherwise they have independent roots I. Each root has correctness p; each derivative independently flips with epsilon. For j positive and n=k-j votes:

L_C(1)=p(1-epsilon)^j epsilon^n+(1-p)epsilon^j(1-epsilon)^n
L_C(0)=(1-p)(1-epsilon)^j epsilon^n+p epsilon^j(1-epsilon)^n
a=epsilon+(1-2epsilon)p
L_I(1)=a^j(1-a)^n
L_I(0)=(1-a)^j a^n
L_h=rho L_C(h)+(1-rho)L_I(h)
P(H=1|votes)=L_1/(L_1+L_0).

For p=3/4, epsilon=1/10, rho=1/2, and k unanimous positive votes:
x=(1/9)^k; y=(7/9)^k; z=(1/3)^k
P_k=(3/4+x/4+y)/(1+x+y+z).
P_k>3/4 iff 7^k>3^(k+1)+2, true for k>=2; P_k approaches 3/4 as k grows. Numerically P_3=.809090909091, P_4=.809597523220, P_5=.802812089356, P_20=.751630082359. Assuming independence gives P_20=.999999956302. Genealogy posterior P(C|20 unanimous)=.993479669425.

Exact Fraction verification: 40 normalization, 65 independent latent-enumeration, 65 symmetry and 44 martingale checks. Synthetic Monte Carlo: 250000 datasets, seed 202610161712, five conditional calibration bins passed. Full source code, numeric output, and two Class P figures retained inline in the scheduled ChatGPT response.

This extends Loom's deterministic-clone gate and Aster's beta-binomial partial-clone gate. No actual archive genealogy, author, source truth or SAT physical claim was inferred.

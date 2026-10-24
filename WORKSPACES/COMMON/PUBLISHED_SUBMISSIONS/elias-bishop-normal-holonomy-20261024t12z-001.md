# Elias Kern | CODE 000 | Euclidean Bishop normal holonomy | 2026-10-24T12Z

Task ID: calc48-20261024T12Z-elias-bishop-normal-holonomy-001
Status: INTERNALLY_CHECKED for Euclidean geometry; physical spin UNRESOLVED. No BEDROCK promotion.

Historical SAT: 2026/SAT MATH — BACKBONE.txt (blob 1854995be3311f565739f2be64269cbb0385a82f), radial SO(4) R x0; original R^4 two-plane superhelix. Later: HsH Meridian cross-reading 2026-10-09 (blob b14066f4f6d461cbb7095d5aa2ed0f4466310f93), which explicitly distinguishes Euclidean normal parallel transport from Lorentzian Fermi-Walker. Historical SAT WOLFRAM FIRST TRIES.txt (blob bcbe4ffaad7aa0780ec42bf30763be52015f45a9) names Frenet/Bishop frames; this is archival material, not physical proof.

For 0<u<1/4, X(s)=(A cos s,A sin s,B cos 2s,B sin 2s), A=sqrt(1-4u), B=sqrt(u), |X'|=1. Define v0=(0,A,0,2B), R(s)=diag(R2(s),R2(2s)), J=R^-1 R', N=[e1,e3,(0,2B,0,-A)] and rho=sqrt(1-3u). N is an orthonormal normal basis to v0.

Bishop transport E'=-T(T' dot E), E(0)=N, T=R v0. Writing E=R N H(s) yields H'=-C H with C=N^T J N, hence H(2pi)=exp(-2pi C). Exact C=[[0,0,-2B],[0,0,2A],[2B,-2A,0]], with C^3=-4(1-3u)C. Its eigenvalues are 0, +/-2i rho. Thus the normal holonomy has unreduced rotation angle 4pi rho; trace=1+2cos(4pi rho).

Since 1/2<rho<1, 1<2rho<2, so H(2pi) is never identity for any nondegenerate interior u. A Bishop-transported frame does not close after one centerline cycle. This is a normal-bundle holonomy, not an observed spin value or a causal Minkowski construction. A periodic Frenet frame is a different transport prescription and does not erase the Bishop holonomy.

Numerical fixture u=0.17: rho=0.7, principal normal holonomy angle 144 degrees; trace=-0.6180339887498836. Independent DOP853 ambient transport versus exact matrix exponential max error 6.56231e-12; normality 6.50868e-12; orthogonality 1.08085e-11; finite-difference Bishop residual 3.23509e-10. ALL_ASSERTIONS_PASSED. Python source and actual JSON output are retained in the chat evidence packet.

CODATA: not applicable; no independent physical observable or calibrated parameter. Distinguish frame holonomy from physical spin and Lorentzian Fermi-Walker transport. Preserve all failures and source genealogy. Privacy: no restricted/private archive excerpts or protected signet.

Next: test the Lorentzian finite-core material-frame transport law before assigning physical spin or interbraid interaction.

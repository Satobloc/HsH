# CODE 000 | Aster :48 | 2026-10-24T22Z

Task: calc48-20261024T22Z-aster-equal-core-smoothing-001
Status: INTERNALLY_CHECKED mathematical bound; H(s)H applicability UNRESOLVED; no CODATA observable; no BEDROCK promotion.

## Historical sources and genealogy
HsH Interconn.txt lines 132-146: S(Q,n) = B^(1-delta) approximately 0.262065; B=3/(4*pi). Lines 158-175 reuse S in CKM and Jarlskog readouts. Source Git blob 02312fbb23167e8ce1c996451199ee0e498437b1. The exponent delta is not independently derived in these recovered lines. The same source later denotes delta_CP=3*pi/2, but identifying those two deltas is not justified.
SAT archive 2026/SAT MATH - BACKBONE.txt, Git blob 1854995be3311f565739f2be64269cbb0385a82f, independently records smoothing S approximately 0.2621 as an input to mass scaling.
Current mathematical comparator: Orson Vay 2026-10-21 finite-core braid smoothing sandbox, Git blob 95baae8ac5fed555621180662c9738bf9095726a. It defines S_xi = A_ext(union of readout supports)/sum_i A(boundary support_i). This is sandbox geometry, not an operative physical mass law.

## Exact theorem and proof
Let U be a union of N equal-radius closed balls of radius R in Euclidean dimension d>=2. Define S_N = A(boundary U)/(N A(boundary ball_R)), using total exposed surface, with any enclosed voids filled if necessary. Since U contains one ball, Vol(U)>=Vol(ball_R). The Euclidean isoperimetric inequality gives A(boundary U)>=d*omega_d^(1/d)*Vol(U)^((d-1)/d)>=A(boundary ball_R). Therefore S_N>=1/N. The bound is independent of center placement, readout thickness and coordinate frame. It is a geometry-only inequality, not a mass law.

For N=2, S>=1/2. For N=3, S>=1/3. Historical S=0.262065 is below 1/3 by 0.0712683333333333. Hence no two- or three-equal-ball readout union can produce historical S as this exact surface ratio, at any thickness. N>=ceil(1/S)=4 is necessary, not sufficient, within equal-ball union models. This does NOT mean four physical strands are necessary.

Orson's tangent equilateral three-core local formula S3=1/(1+epsilon) holds only before the common triple intersection, epsilon<=2/sqrt(3)-1=0.15470053837925. Its minimum in that regime is sqrt(3)/2=0.86602540378444. Solving the local formula backward for S=0.262065 gives epsilon=2.81584721347757, far outside its derivation domain. Extrapolating that local formula is invalid.

For N congruent non-spherical supports K of volume V and surface area A(K), define q(K)=A(equal-volume ball)/A(K)<=1. Isoperimetry instead yields S_N>=q(K)/N. Thus N=3 and S=0.262065 require q(K)<=0.786195, or A(K)>=1.27194907115919 times the equal-volume ball area. This is necessary only; anisotropic Kerr-like shells or interaction weights require separate derivations.

## Executed controls
SymPy exact identities and a deterministic 120000-direction Fibonacci-sphere surface sampling were executed for 2- and 3-core controls at epsilon 0, .01, .05, .1, .154700538, .2, .5, 1, 3, 10. All assertions passed. At epsilon=0.1, sampled S2=0.95459583 versus exact 0.95454545; sampled S3=0.90912778 versus exact 0.90909091. At epsilon=10, sampled S3=0.37954444, above the exact universal bound 1/3. No random Monte Carlo claim; deterministic sampling only. Source script SHA256: 954dd9b68fcdfb8d5262ef0672945145fcce2e2375845facb3e847b18fd88cec.

## Limits, units, and external verification
S, q and epsilon=xi/r are dimensionless; the bound applies in any d>=2 to equal Euclidean balls. It cannot be automatically applied to arbitrary anisotropic finite-core geometry, 4D dynamics or a physically weighted interaction kernel. No independently derived physical observable maps S_N to a versioned CODATA quantity, so status is INTERNALLY_CHECKED, NOT CODATA_COMPARED. Historical S remains stipulated; no tuning or BEDROCK promotion.

Privacy: public-safe mathematics and public-source genealogy only; no private or restricted archive text, personal records, or protected signet.

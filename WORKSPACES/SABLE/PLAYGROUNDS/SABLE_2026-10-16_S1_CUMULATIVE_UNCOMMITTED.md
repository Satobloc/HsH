# SANDBOXED | Sable cumulative uncommitted results | 2026-10-16 09:12 UTC

## Sable: Exact source-diversity experiment
N=8 worker reports under hypothetical null p=.05 and within-source correlation rho=.10. Each source independently draws theta~Beta(alpha,beta), alpha=9/20, beta=171/20; its workers' reports are Bernoulli(theta) conditional on theta. Group size m has beta-binomial P(K_m=k)=C(m,k)(alpha)_k(beta)_(m-k)/(alpha+beta)_m. Multiplying independent group generating functions gives exact total K distribution.

All 22 integer partitions of 8 evaluated with rational arithmetic. Best P(K>=4) by number of sources G: 1 (8) .010399343446446345; 2 (4,4) .00312251397871; 3 (3,3,2) .00161559621488; 4 (2,2,2,2) .000960903698574; 5 (2,2,2,1,1) .000800354469336; 6 (2,2,1,1,1,1) .000649232748047; 7 (2,1,1,1,1,1,1) .000506653964844; 8 (1,1,1,1,1,1,1,1) .0003717513671875. Shared/independent high-tail inflation=27.97392118588.

At threshold K>=1 the preference reverses: shared=.262297479102, independent=.336579568711. Proof: for Z=1-theta, E[Z^(m+n)]>=E[Z^m]E[Z^n] by positive covariance of monotone functions; splitting a common source raises P(K>=1). The effect on higher thresholds is not universal.

Var(K)=p(1-p)[8+rho sum_g m_g(m_g-1)]; effective N matching variance is not an exact tail representation. Cost criterion J=T_G+lambda(G-1): at lambda=.001 optimum sources G=3 partition (3,3,2), J=.0036155962148808757; lambda=.01 optimum G=1 (8). Seeded simulations: four batches of 300000, total 1200000; all deviations <1 estimated standard error. Exact code SHA256 c572fb225217c674aceca8e0ce3c877288220c412543958f7fe83a2f3ee61ef5; full manuscript SHA256 8167bb8c7709051450fd79ef802061d07ba17df57b3fce546da010aeaa8700a8. The user's visible relay response preserves full Python, proofs, numerical output, three Class P figures.

## Other uncommitted results in visible relay
- Orson Vay, 05:12Z: clustered McNemar exact exchangeable null, 5 sessions x 10 cases; ordinary 5% size crossing rho=.912057017; at rho=.25 calibrated size/power .047896437/.852469486.
- Alberr, 06:12Z: g=delta-2u⊗u, u=(x,y,a,0)/sqrt(x²+y²+a²). Killing horizon r=a, normalized surface gravity kappa=1/(2a), curvature scalar 1/a² at horizon. Geometric sandbox, not physical claim.
- Elias Kern, 07:12Z: sequential evidence q0=.41 q1=.59, c=.01; optimal fixed risk .377809021, finite-horizon optimal .327282447; analytical threshold-4 .327278396.
- Ravel: finite-core nonlocal modal stiffness saturates and does not supply high-frequency coercivity automatically.
- Ariadne: four-dimensional (2,3) torus curve reach=.4, first normal-frame Pfaffian degeneracy at same radius.
- Hale, Morrow, Kestrel had independently verified workspace writes according to their prior relay receipts and are not blindly duplicated in this uncommitted record.

## Handoff to Loom
Test whether prefix, exact duplicate and superset compression mistakenly transforms copied reports into independent evidence. Preserve provenance and independent source identities. No worker inbox or ChatGPT chat delivery is claimed.

Scope: public synthetic research, no private or quarantined sources; SANDBOXED, non-controlling.

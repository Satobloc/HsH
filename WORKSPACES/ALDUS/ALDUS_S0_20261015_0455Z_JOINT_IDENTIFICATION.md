# Aldus s0 | Joint identification of hidden correspondence persistence and 4D orientation noise
**2026-10-15 04:55 UTC | SANDBOX / SOURCE-GROUNDED**, not physical SAT evidence.

Previous checkpoint: WORKSPACES/ALDUS/ALDUS_S0_20261015_0400Z_MARKOV_CORRESPONDENCE_PARITY.md. Define d_t=q s_t z_t, q=±1, hidden correspondence parity s_t=±1 with stationary Pr(s=+1)=p>1/2, refreshed with probability α, and independent observation sign noise Pr(z=-1)=e<1/2. Let a=2p-1, b=1-2e, ρ=1-α.

Then m=E[d_t]=qab and for k≥1, K_k=E[d_t d_(t+k)]=m²+b²(1-a²)ρ^k. Set C_k=K_k-m². In the interior 0<α<1, recover
ρ=C₂/C₁, α=1-ρ, b=sqrt(m²+C₁/ρ), e=(1-b)/2, p=(1+|m|/b)/2, q=sign(m).
Third lag is a parameter-free control K₃=m²+(C₁/ρ)ρ³. At k=0, K₀=1 and MUST NOT be substituted into positive-lag relation.

Synthetic experiment: 20,000 independent stationary tracks ×256 observations in four persistence regimes; seed 202610150455. At α=.1, estimated α=.1001596, p=.7918848, e=.0313622 versus true p=.79145414, e=.03143199. At α=.95, 114/300 bootstrapped inversions failed physicality, indicating ill-conditioning. Also 150,000 direct Gaussian 4D determinant-sign fixtures and exact 2^5-state enumeration passed controls.

Negative controls: α=1 and p=1 cause nonidentifiability; e=.5 removes orientation information; p=.5 leaves q ambiguous. Without p>1/2, (q,p) and (-q,1-p) are observationally equivalent. Dimensional input lengths appear only in noise calibration, all inferred parameters are dimensionless.

**Next cursor:** full hidden-Markov likelihood versus moment inversion; second-order correspondence, and external orientation calibration. Original complete reproducible package: aldus_s0_20261015_0455Z_joint_identification.zip (derivation, Python code, JSON, figures and handoff), uploaded in preceding conversation. This repository note is a compact faithful extraction.
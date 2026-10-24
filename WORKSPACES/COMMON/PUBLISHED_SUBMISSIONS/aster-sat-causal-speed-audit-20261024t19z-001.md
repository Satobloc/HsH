# Aster :00 2026-10-24 19Z | Historical SAT causal-speed derivation gate

SANDBOXED; no physical validation or BEDROCK change.

Primary historical source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/MISC/DUGUP.txt`, blob `a1f1185cd020002722f4c3656e7a319bcef6e670`, lines 28-35, 66-155. Random archival reading: actual Python secrets.randbelow(4) chose index 3, this 1383-line public compilation; equation-bearing sections and unrelated charge/alpha passages examined. Date/authorship of individual passages unverified. Current BEDROCK `aa5d236354258f4c4715f5cf77bff2c5db602cfd` (548 lines), STATE `b5958a1056c2541f00ab4f3477d8acc32426cfe9` (155 lines). Mersearch request lanes 1-4 occupied, no search execution claimed. Later corrections: Ravel 2026-10-18 effective-metric-normalization; Meridian 2026-10-05 Householder-flow-curvature and 2026-10-21 NLM intake/metric gate.

Historical action: `S=∫d4x κ[(∇_μu_ν)(∇^μu^ν)-λ(∇·u)^2]`, with `u·u=-1`. Historical EOM: `□δu_ν-λ∂_ν(∂·δu)=0`. Historical conclusion: unique light speed c from the null cone, without inserted metric or dimensional input.

**Exact countercheck:** Four independent first-derivative quadratic invariants exist for a unit timelike vector: I1=(∇u)^2, I2=(∇·u)^2, I3=(∇_μu_ν)(∇^νu^μ), I4=(u·∇u)^2. At the normalized background u=(1,0,0,0), four admissible first-order gradient witnesses give invariant matrix rows `[1,1,1,0]`, `[1,0,0,0]`, `[2,0,2,0]`, `[-1,0,0,1]`; determinant -2, rank 4. Thus the source's claim that only two independent quadratic invariants exist is false without additional restrictions.

**Dispersion:** For normalized spatial perturbations a_i, the original EOM yields `(-∂t²+Δ)a_i-λ∂i∂j a_j=0`. With k along x, principal symbol `diag(ω²-(1-λ)k²,ω²-k²,ω²-k²)`. Transverse branches have ω²=k²; longitudinal has ω²=(1-λ)k². λ=1/2 gives longitudinal speed 1/√2; λ=1 gives zero-frequency; λ=2 yields exponential instability. The reference unit speed is already present in the assumed Minkowski □. A generic divergence-free 'gauge choice' is unjustified: E(∂χ)=(1-λ)∂□χ, and the unit-norm constraint further restricts such shifts.

**Dimensional failure:** Source simultaneously assigns [x]=L, [u]=L^-1, [κ]=force=c^4/G, and calls S dimensionless. But ∫d4x(∇u)^2 is dimensionless under those assignments, so S has units of force. A dimensionless η and u·u=-1 also conflict with [u]=L^-1 absent an explicit typed coframe.

**Established later mathematical correction:** With Euclidean-unit u, H=I-2uu^T has eigenvalues (-1,1,1,1), det -1, H²=I. This yields Lorentzian algebraic signature but no derived c or Einstein dynamics. Older metric <vv^T> is positive semidefinite for nonnegative ensemble weights, not Lorentzian by itself.

**Executed:** SymPy 4-invariant rank, characteristic polynomial, Householder tests PASS. Independent centered finite differences for λ=.5 propagating and λ=2 unstable modes converge at O(h²), PASS. Initial determinant comparison failed due to structural equality; test corrected to simplify the difference, not the historical math.

**Gate:** historical no-input unique-c claim REJECTED; corrected signature INTERNALLY_CHECKED; dynamical action/λ and physical H(s)H relation UNRESOLVED. No independent CODATA observable, no CODATA comparison, no physical or BEDROCK promotion. Next: derive constraint-preserving action and mode coefficients from the existing finite-core geometry, with cross-sector held-out checks.

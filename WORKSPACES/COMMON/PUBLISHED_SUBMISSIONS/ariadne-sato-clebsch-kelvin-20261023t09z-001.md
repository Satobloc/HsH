# Ariadne 2026-10-23 09Z | SATO-Blockwave variational/Kelvin audit

**SANDBOX; BEDROCK unchanged; not a physical SAT proof.** Historical 3+1 responsive-medium candidate, not the 4D Kerr-associated matter worldtube. Public sources only.

**Source and authority:** SAT archive `SATOBLOC/SATOBLOCK Full Theory & Predictions.txt` (Git blob `3893ef0acf9009b01c58c736ec97b8df2ba74943`, embedded original LaTeX sections 1–420); `LEAN CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt` (blob `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`, 200 lines). Copies `leancheck1.txt` and HsH 30SEP26_DUMP have the SAME blob, not independent proofs. Original message dates unresolved. BEDROCK blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8` (complete 509 lines), STATE blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9` (complete 155 lines). Mersearch shared slot occupied by Orson; inspected existing receipt/manifest but did NOT run a new query; bounded public code-search fallback. No private HSH_RESOURCES material reproduced.

**Recovered action:**

`S = integral [rho*v²/2 - rho*W(Phi) - kappa*|grad Phi|²/2 + lambda*rho*Phi*div v + chi*(dt rho + div(rho*v))] d³x dt`.

Four archived variations (continuity, velocity Clebsch relation, Bernoulli, scalar elliptic constraint) **PASS** under smooth fields and boundary conditions:

`dt rho+div(rho v)=0; v=grad chi+(lambda/rho)*grad(rho Phi); Dchi=v²/2-W+lambda Phi div v; -rho W'+kappa lap Phi+lambda rho div v=0`.

**New exact correction conditional on this archived action:**

`rho Dv = lambda grad(rho D Phi) - kappa (lap Phi) grad Phi`, `D=dt+v·grad`.

Original claimed `rho Dv = -grad P-rho grad W-kappa(lap Phi)grad Phi+lambda grad(rho Phi)` **FAILS**. The source action has no pressure/internal-energy term. More decisively, `lambda grad(rho Phi)` has dimensions M L^-2 T^-1, whereas force density is M L^-2 T^-2.

**Full on-shell counterexample:** rho=1, Phi=t*x, chi=t³/6, lambda=1, W=0, v=(t,0,0), any kappa. All four original EL equations have zero residual. Actual rho Dv=(1,0,0); corrected RHS=(1,0,0); archived RHS=(t,0,0). Residual `(1-t,0,0)` (fails at t=0,2,3). Independently, a symbolic off-shell residual identity was checked in 2D with nontrivial polynomial rho,Phi,chi.

**Existing Kelvin mechanism constraint:** Define h=ln rho, q=lambda Phi, psi=chi+q. Then `v=grad psi+q grad h`, `curl v=grad q × grad h`. Smooth constant-density or aligned-gradient cases have zero local medium vorticity. Nonzero vorticity requires gradient misalignment or global/defect structure. Furthermore `v·curl v=div(psi curl v)`, so integrated helicity on a smooth periodic domain is zero unless boundary/patch conditions change. This does NOT equate a medium vortex with a Kerr-associated matter worldtube. A 64³ periodic numerical check gave global helicity +1.210e-17 with local helicity -1; exact torus integral 0.

**Dimensional branch ambiguity:** Source explicitly gives Phi=L²/T², kappa=M*T²/L³, lambda dimensionless. Interaction term then has energy density / T. Repair A keeps lambda dimensionless but requires Phi=L²/T and kappa=M/L³. Repair B retains source Phi/kappa but requires lambda=T. Neither is uniquely licensed; **UNRESOLVED**. Original positive energy is recovered as on-shell canonical Hamiltonian modulo boundary terms; gamma damping/wave dynamics not derived.

**CODATA gate:** NIST CODATA 2022 Web v9.0 G=6.67430(15)e-11 SI, c and h exact. No independent G/alpha/mass/charge prediction, so residual and z-score **UNDEFINED**. Corrected mathematics is INTERNALLY_CHECKED and eligible for structured verification prerequisites only; physical Kelvin/EM/finite-core interpretation UNRESOLVED. No parameter fitted to CODATA. No BEDROCK change.

**Reproduction:** Full executable Python verifier and actual stdout are in Ariadne 09Z conversation/manual archive; tests: exact EL on-shell counterexample, off-shell symbolic identity, dimension ledger both branches, vorticity/helicity, 64³ quadrature, exact Stokes circulation, canonical Hamiltonian, two Class P figures. No Lean compilation claimed.

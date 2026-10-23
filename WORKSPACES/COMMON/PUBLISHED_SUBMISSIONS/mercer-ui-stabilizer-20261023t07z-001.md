# Mercer :48 | SO(4) UI stabilizer gate | 2026-10-23 07Z
Task ID: `calc48-20261023T07Z-mercer-ui-stabilizer-001`.
Status: `INTERNALLY_CHECKED` mathematical counterexample; physical frame interpretation `UNRESOLVED`; no CODATA observable; not BEDROCK.

Recovered archive equations: `y=r R x0`, `Omega=Rdot R^-1`, and `L_UI=1/2 rdot^2+1/2 r^2 Omega_ij Omega_ij`. Sources: SAT `REUILIGIG.txt` blob `6d3de4693f0fc3e8fcd2586b07818718189bb56f`; SAT `2026 MATH REVAMP TAKE 1.txt` blob `399e194475ba55294202ea175b9f5d56f227c3c5` (math only; source includes private records not reproduced); HsH `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt` blob `02312fbb23167e8ce1c996451199ee0e498437b1`. These are not authenticated independent derivations.

Exact construction: x0=e1, R=R12(a t), K=R23(k t), r=1+t. K fixes e1; thus y=r R e1=r R K e1 for all k. Yet Omega(R):Omega(R)=2a^2 and Omega(RK):Omega(RK)=2(a^2+k^2), so archived L_UI(RK)-L_UI(R)=r^2 k^2. Same worldline, arbitrarily large frame-norm cost. This does NOT exclude a physical marked-frame energy, but the trajectory alone cannot determine it. Point kinetic T=1/2 |ydot|^2=1/2+1/2 r^2 a^2.

Unique transcription repair: HsH Interconn writes `(dR)R^-1=(dR)R` in indices. The final equality is false generically; since R is orthogonal, the correct second factor is R^T. At R12(a t), the incorrect generator has symmetric diagonal -2a sin(2at), while the correct generator is antisymmetric.

Executed SymPy exact tests and independent NumPy finite differences: at t=1,a=0.4,k=2, point kinetic=0.82, source L_UI=17.14; finite differences give 0.81999999999286 and 17.139999997662. ALL_ASSERTIONS_PASSED. No fitted constants. Source genealogy and code are preserved in the local/manual archival packet; no protected source text was published.

Control: BEDROCK blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`, STATE_OF_THE_THEORY blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. Mersearch bridge occupied by Orson's pending request; bounded GitHub search only, not a Mersearch execution. Earlier UI audits already noticed a point-kinetic versus Frobenius distinction; this packet supplies an exact unbounded stabilizer family.

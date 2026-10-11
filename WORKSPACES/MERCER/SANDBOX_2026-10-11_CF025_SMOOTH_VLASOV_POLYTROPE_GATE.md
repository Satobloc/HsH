# Mercer CF-025 | Smooth orbital ensemble: Newtonian Vlasov-Poisson gate
2026-10-11 | SANDBOXED | Mercer Calder

Sources fully read this run:
- SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt (historical heloids, ropes, timesheet/filament tug conjectures).
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002 Forces Across Temporal Points - to 8-13-24.txt (Nathan's block-universe two-particle interaction thought experiment; assistant responses not attributed to Nathan).
Also consulted front door, reference desk, cross-formalism index, Oct 9 scope rule, and CF-024. Full onboarding pointer sweep and Mersearch corpus-wide search not completed; no completeness claim. HSH_RESOURCES remains private reference routing, not imported theory authority.

## Bounded independent continuation of CF-024
Replace the delta-shell velocity distribution by a collisionless isotropic conserved-energy distribution in Newtonian weak-field gravity. Specific energy e=v²/2+Phi, relative potential Psi=e_cut-Phi. Set f(e)=C(e_cut-e)^k for e<e_cut, zero otherwise, k>=0. Stationarity follows since e is conserved.

Velocity integration:
rho=4pi sqrt(2) C B(3/2,k+1) Psi^(k+3/2);
p=(8pi sqrt(2)/3) C B(5/2,k+1) Psi^(k+5/2).
Thus n=k+3/2, p/rho=Psi/(k+5/2), and p=K rho^(1+1/n). Poisson gives Lane-Emden theta''+2theta'/xi+theta^n=0, theta(0)=1,theta'(0)=0, Psi=Psi_c theta, r=alpha xi, alpha²=Psi_c/(4pi G rho_c).

Numerical solve_ivp rtol 1e-10, atol 1e-12, step <=0.005:
k=0, n=1.5: first zero xi1=3.65375373622, dimensionless mass mu=2.71405511797.
k=1, n=2.5: xi1=5.35527545901, mu=2.18719956552.
At fixed rho_c,Psi_c, radius ratio 1.46569. No SAT constant fitted. R=alpha xi1; M=4pi rho_c alpha³ mu. Fixed rho_c: R~Psi_c^1/2, M~Psi_c^3/2, compactness GM/(Rc²)~Psi_c/c².

## Gate
This is a self-consistent smooth-in-velocity stationary collisionless model, not a relativistic Einstein-Vlasov solution, not an angular-momentum-biased heloid, and not a derived Interbraid constitutive action. k=0 retains a discontinuous energy cutoff; k=1 is continuous at cutoff. A model depending on nonconserved instantaneous radius fails the Vlasov stationarity gate. Next test anisotropic f(E,L)=C(Ecut-E)^k L^(2l), l>=0, then full Einstein-Vlasov self-consistency and collective stability separately.

Nothing is a physical claim.

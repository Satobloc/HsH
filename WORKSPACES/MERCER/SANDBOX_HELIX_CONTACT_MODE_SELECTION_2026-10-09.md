# Mercer sandbox checkpoint | 2026-10-09

Status: independent mathematical sandbox, not canonical theory.

Source reads: historical SAT `[[SAT26 TOOLBOX]]/THE SPHERES.txt` lines 1-450 and `Filament onto.txt` lines 1-550; HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt` lines 1-956. Onboarding and HSH_RESOURCES routing reviewed; quarantine preserved.

Model: A taut helix of radius R and pitch p contacting a cylindrical elastic layer creates mean pressure P=S/[2*pi*abs(p)*sqrt(R^2+p^2)] if load redistributes. A mode h=A*cos(n*theta+k*z) has quadratic stiffness B*(n^2/R^2+k^2)^2+Tz*k^2+K-Y*eta*n^2/R^2. Contact-line Fourier geometry selects k=-n/p. This produces a locked-mode critical tension growing as p^-3 at small pitch and p^2 at large pitch, with a finite optimum.

Dimensionless numerical fixture: R=1, B=.002, Y=1, K=.018, Tz=.001, p/R=.3, eta=.0175. Uniform n=2 threshold eta=.0125; exact nonlinear amplitude .07079945, barrier 7.8443e-5. Helix-locked n=2 threshold tension 2.339979; optimal pitch ratio 1.105607 with minimum tension .328920. Radial pinning can raise threshold by more than two orders of magnitude in the trial-mode comparison.

Failure: linking alone does not ensure compression or retained memory; sustained tension and stress confinement are needed. Next: full 3D line-contact eigenproblem with sliding versus locked contact. Reproducible script and figures are in the conversation artifact MERCER_HELIX_CONTACT_BUCKLING_2026-10-09.zip.

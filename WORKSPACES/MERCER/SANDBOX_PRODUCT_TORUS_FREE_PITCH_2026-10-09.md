# Mercer sandbox checkpoint, 2026-10-09
Status: SANDBOXED; not canonical physics.

Read: SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/THE SPHERES.txt lines 1-500; HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt lines 1-956. Common onboarding and October 5 reference routing reviewed. No quarantined content.

New model: a 2D product torus in Euclidean 4D has metric ds²=R² dtheta²+A² dphi². A primitive winding (m,n) has shortest length L=2pi sqrt(m²R²+n²A²). This follows by lifting angles and applying the triangle inequality. With radial springs K_R,K_A>0 and a tension-only filament, U=K_R(R-R0)²/2+K_A(A-A0)²/2+k_f max(0,L-L_nat)²/2. Positive initial rest-length deficit implies a unique compressed equilibrium with nonzero filament tension even when both radii and pitch relax. This requires continued confinement and elastic support; topology alone supplies no tension.

Demo: (m,n)=(2,1), R0=1,A0=.65,K_R=K_A=20,k_f=30,L_nat=.95L_ref. Solver gives R=.9463666403516697,A=.6409193080439973,T=.09012124069977645,U=.02972532630275732. Checked against force-balance root and perturbed-path quadrature.

4D crossing test: for X(t)=(R cos 2t,R sin 2t,A sin t,A cos t), d4(X(t),X(t+pi))=2A exactly, but projected d3=2A abs(sin t), which vanishes at t=0. A 3D apparent crossing is not automatically 4D contact.

Failure conditions: detachment, substrate relaxation, bending-dominated mechanics, finite-core self-contact, or a different Lorentzian constitutive law. Next: finite 3D elastic timesheet with sliding versus bonded versus detachable contact.

Full derivation, script, CSVs, verification, four Class-P figures: MERCER_PRODUCT_TORUS_FREE_PITCH_2026-10-09.zip in the task thread.

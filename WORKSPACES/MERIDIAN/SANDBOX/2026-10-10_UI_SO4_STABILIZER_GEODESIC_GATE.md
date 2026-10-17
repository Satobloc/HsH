# Meridian UI geometric validation checkpoint | 2026-10-10

Status: SANDBOXED. Branch: HAGALAZ-SOLVER-UNIFICATION.

Read: SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/SATO-scattering.txt (complete); SAT_THEORY_ARCHIVE_2023-25/2026/ELECTROGRAVACOUSTICS.txt (lines 1–340); HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/BYO LAGRANGIAN.txt (complete); HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/4D COVARIANCE+SATO.txt (complete); HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 PRE HsH/SAT 2026 — COIL Orders .txt (complete). Common onboarding and Oct 5 reference desk routing reviewed. No quarantined sources.

Verified standard geometry: for Y=r R n0, any K in SO(3) fixing n0 gives identical point path under R to R K. SO(4)/SO(3) is S3. Three SO(4) frame parameters are invisible to the point trajectory unless physical framing is independently supplied.

The source UI Test B great-circle equation has the wrong sign: it writes X''+(X'' dot X)X/a²=0; correct affine equation is X''-(X'' dot X)X/a²=0. On an exact unit great circle the source residual norm is 2, correct residual approximately zero. Nonaffine geodesic tests need parameter-invariant curvature checks.

The source UI Test C does not follow: the round S3 scalar Laplacian spectrum is ell(ell+2)/a² in magnitude, not 1/n²; closure of a curve alone does not produce an energy spectrum.

Exact finite-core contact fixture: two parallel filaments with equal elliptical cross sections, rotated together by chi, have contact threshold d<=2/sqrt(cos²chi/a2²+sin²chi/a1²). With a2=.25, a1=.10 and d=.35, chi=0 gives contact; chi=pi/2 gives no contact. Isotropic cores do not distinguish these frame rotations.

1000 random stabilizer checks and 1000 ellipse algebra checks passed. Complete executable solver, verification JSON, four precision figures and provenance checkpoint are preserved in the task thread as meridian_ui_gauge_gate_2026-10-10.zip. Next: add typed trajectory, physical frame, core shape, connection, and geodesic/spectral domains to the common solver. No physical claims promoted.

Meridian.
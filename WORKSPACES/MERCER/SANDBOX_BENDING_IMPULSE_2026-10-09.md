# Mercer sandbox: bending and finite spherical cores

2026-10-09. Noncanonical calculation. Source reads: SAT_THEORY_ARCHIVE_2023-25/Filament onto.txt lines 1-400; SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H FIRST BUILD.txt lines 1-360; HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt lines 1-650.

For static 3D sheet energy (T/2)|grad h|^2+(D/2)(Laplace h)^2, define ell=sqrt(D/T), z=b/ell and S(x)=3(x cosh x-sinh x)/x^3. Two nonoverlapping uniform spherical cores (radii a1,a2), passing at constant speed v and impact b>a1+a2, have complete-encounter impulse I/I0=1-z K1(z) S(a1/ell) S(a2/ell), I0=2C/(vb). This corrects the earlier rigid round-core theorem: its zero finite-size correction applies only to the pure-tension harmonic kernel, not to the bending-regularized Yukawa part. At a1=a2=ell and b=2.5a, point ratio 0.8152729591, finite ratio 0.7749992224. Checked via independent quadrature and 6D Sobol integration. Assumes quasistatic linear scalar sheet, rigid cores, weak deflection and no overlap. Next: solve retarded bending-sheet response for moving cores. No empirical fit or physical theory claim.

Mercer.
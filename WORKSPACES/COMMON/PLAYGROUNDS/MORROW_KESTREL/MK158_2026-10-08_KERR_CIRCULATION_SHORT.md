# MK158 | Kerr-Schild circulation (sandbox)
2026-10-08, Morrow / Kestrel. Exact standard Kerr-Schild geometry, not a new physical law.

Old SAT read: `SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt` lines 1-400, F1-F3.
Current HsH read: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md` complete.

Kerr-Schild null spatial direction ell=((r*x+a*y)/(r²+a²),(r*y-a*x)/(r²+a²),z/r), with Sigma=r²+a²*cos²(theta). Its azimuthal circulation at fixed oblate r,theta is Gamma=-2*pi*a*sin²(theta), independent of r. Local helicity ell dot curl ell=-2*a*cos(theta)/Sigma. Kerr metric g=eta+2*(M*r/Sigma)*k*k, k=dT+ell dot dx. Frame dragging requires mass weight: g_Tphi=(M*r/Sigma)*Gamma/pi; M=0 gives flat metric even when Gamma is nonzero. Bare circulation is not gravitational torsion.

Fixed Euclidean Cartesian reference: delta_E-g has rank two and indefinite sign for M>0, so not a single Householder reflection in this chart. This is coordinate-relative, not a general no-go.

Next: compare material frame, Fermi-Walker transport, and null-congruence transport with M->0 control. All results sandbox only.
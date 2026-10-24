# Mercer :00 2026-10-24 18Z | Periodic vortex circulation balance

SANDBOX. Source: historical SAT Whirligig/NS notebook v0.2, SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT WOLFRAM FIRST TRIES.txt, Git blob bcbe4ffaad7aa0780ec42bf30763be52015f45a9, lines 188-342. Current HsH workbench tools/whirligig_navier_stokes_workbench.py, blob 6b62848de4d44cc7a6e5986e0dfe0f828efecaab, lines 114-125. BEDROCK blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; STATE blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Mersearch lanes 1-4 occupied; no Mersearch run claimed.

On the flat periodic T2, D=eps^2+2-cos(x)-cos(y), u=(-sin(y)/D,sin(x)/D), eps>0. Exact divergence zero. Exact vorticity:

omega=[eps^2(cos(x)+cos(y))-2(1-cos(x))(1-cos(y))]/D^2.

As eps->0 away from the origin, with a=1-cos(x), b=1-cos(y), omega_0=-2ab/(a+b)^2 lies in [-1/2,0]. In distributions omega_eps -> 4*pi*delta_origin + omega_0; integral omega_0=-4*pi. Every smooth periodic eps>0 field has zero total vorticity. The singular positive core necessarily has negative distributed return vorticity.

For the CCW square [-R,R]^2, A=eps^2+2-cos(R), 0<R<pi:
Gamma=16*sin(R)/sqrt(A^2-1)*atan(sqrt((A+1)/(A-1))*tan(R/2)).
For fixed eps>0, Gamma->0 as R->0 or pi. For eps->0 first, then R->0, Gamma->4*pi. This is a noncommuting-limit effect, not physical charge quantization.

Executed tests: SymPy identities PASS; 12/12 square-loop analytic vs scipy quadrature PASS; independent Gauss-Legendre Stokes area/boundary at R=.2,.7,1.4,2.7 and n=256 PASS (max error 1.91e-14). eps=.05 N=1024: integrated positive +12.166579034436, negative -12.166579034436, net 4.82e-14. eps=0 punctured background N=1024: -12.566400666695 vs -4*pi=-12.566370614359. Failed preliminary structural assertion and overstrict grid tolerance retained in full report and corrected only as test code.

GATE: mathematical circulation balance PASS; isolated Kelvin-vortex interpretation NOT established; 3D/4D Kerr-medium and Coulomb mapping UNRESOLVED; no independent CODATA observable; NOT a tentative H(s)H candidate; no BEDROCK change. Full runnable scripts and execution outputs are preserved inline in the originating conversation.

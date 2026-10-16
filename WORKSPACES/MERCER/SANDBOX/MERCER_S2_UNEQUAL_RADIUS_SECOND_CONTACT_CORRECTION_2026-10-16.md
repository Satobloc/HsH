# Mercer s2 | exact unequal-radius R4 contact correction
GEN/DERIVED SANDBOX. 2026-10-16 12:24 UTC. Source: Mercer unequal-radius kernel, WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-unequal-radius-contact-20261016t0836z-s3.md (blob 3ca44318acb4e3fd21367f0cae8fd482078013ba).

Two infinite nonparallel Euclidean R4 line-tubes, radii R1,R2>0, separation D=R1+R2-p, angle 0<theta<pi, p->0+. The overlap V4=I/|sin(theta)|, all lengths in a common unit.

New derived expansion:
I=K*p^(5/2)*(1-C*p+H*p^2+O(p^3)),
K=(16*pi*sqrt(2)/15)*R1*R2/sqrt(R1+R2),
C=(8*R1^2+3*R1*R2+8*R2^2)/(28*R1*R2*(R1+R2)),
H=-(16*R1^2-41*R1*R2+16*R2^2)/(224*R1*R2*(R1+R2)^2).
Units: [K]=L^(3/2), [C]=L^(-1), [H]=L^(-2).
Equal radii: C=19/(56R), H=9/(896R^2). H switches sign at R2/R1=(41+-3sqrt(73))/32 = 0.480249648876 and 2.082250351124.

Proof: let z=R1-s be the common-normal coordinate. Integrate the s interval to obtain I=integral [p-f1(x,w)-f2(y,w)]_+ dx dy dw, where f1=R1-sqrt(R1^2-x^2-w^2), f2=R2-sqrt(R2^2-y^2-w^2). Set Re=R1R2/(R1+R2); x=sqrt(2R1p)u, y=sqrt(2R2p)v, w=sqrt(2Rep)zeta; Q1=u^2+(Re/R1)zeta^2, Q2=v^2+(Re/R2)zeta^2. Then (f1+f2)/p=r^2+pT+p^2U+O(p^3), r^2=u^2+v^2+zeta^2, T=Q1^2/(2R1)+Q2^2/(2R2), U=Q1^3/(2R1^2)+Q2^3/(2R2^2). Positive-part expansion: J0=int_B3(1-r^2)=8pi/15, J1=-int_B3 T, J2=-int_B3 U+(1/4)int_S2 T^2. Exact polynomial moments give C,H.

Executed 25 independent exact disk-lens quadratures at R1=1.2, R2/R1=.25,.5,1,2,4 and p/min(R1,R2)=.05,.02,.01,.005,.002. All normalized two-correction residuals <epsilon^3; extrapolated C relative error <6e-8. At R1=R2=1.2, epsilon=.01: exact=.996608146426; corrected through p^2=.996608147321. Complete source script and output preserved in the scheduled visible archive. No physical interaction law inferred. Nonuniform as theta->0.

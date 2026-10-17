# Enheduanna s2 | calibration allocation and session-orthogonal tetrad
2026-10-16 11:24 UTC nominal, run REVROT3-19-20261016:131:s2. GEN/DERIVED mathematical sandbox; source-grounded reconstruction, not historical worker participation, provenance/exposure evidence or physics.
Sources: ENHEDUANNA_S4_20261016T0348Z_CALIBRATED_ANCHOR_GATE.md and enheduanna-s3-20261016t0736z-anchor-bias-tetrad-gate.md.

Model: independent Z~Bern(p), H~Bern(q), binary Xi conditionally independent with E[Xi|Z,H]=fi+di*Z+ci*H, independent anchor Y with P(Y=1|H=0)=r0, P(Y=1|H=1)=r1, t=r1-r0. Set A=p(1-p), B=q(1-q), gi=Cov(Xi,Y), Cij=Cov(Xi,Xj), qhat=(E[Y]-r0)/t, Bhat=qhat(1-qhat), Rij=Cij-gi*gj/(Bhat*t*t). Correct calibration gives Rij=A*di*dj and tetrad Delta=R12*R34-R13*R24=0.

New exact endpoint gradient: G=A*(d1*c4-c1*d4)*(d2*c3-c2*d3). If estimated endpoints are r0+eta0,r1+eta1 while the data law has true r0,r1, then Delta=-G*(1-q)*eta0/t+G*q*eta1/t+O(||eta||^2). Independent labeled anchor sample means (M0,M1) add asymptotic variance a0/M0+a1/M1, where a0=[G*(1-q)/t]^2*r0*(1-r0), a1=[G*q/t]^2*r1*(1-r1).

Unlabeled influence: IF_Cij=(xi-mui)*(xj-muj)-Cij; IF_gi=(xi-mui)*(y-muY)-gi; IF_B=(1-2q)*(y-muY)/t; IF_Rij=IF_Cij-(gi*IF_gj+gj*IF_gi)/(B*t*t)+gi*gj*IF_B/(B*B*t*t). IF_Delta=R34*IF_R12+R12*IF_R34-R24*IF_R13-R13*IF_R24. Exact 32-cell enumeration yields sigma2=E[IF_Delta^2]. For independent samples Var(Delta_hat)~sigma2/N+a0/M0+a1/M1.

For k unlabeled rows per session sharing H but independent conditional Z and emissions, Var(mean IF_Delta)=[sigma2+(k-1)*Var_H(E[IF_Delta|H])]/N. Here E[IF_Delta|H]=0 exactly, since changing q alone preserves the corrected rank-one tetrad. Thus the first-order H-only session ICC vanishes for this score, not for general scores, misspecification or finite samples.

With equal costs and K=N+M0+M1, optimum N:M0:M1=sqrt(sigma2):sqrt(a0):sqrt(a1). Fixture p=.30,q=.38,r0=.05,r1=.95,f=(.08,.22,.10,.22),d=(.61,.54,.50,.44),c=(.21,-.16,.20,-.15): G=-.007260372, endpoint gradients +.0050015896,-.0030654904; sigma2=.0003559640962155, a0=.000001188255180024, a1=.0000004463684911434. K=1e6 optimum N=914755.73, M0=52851.45, M1=32392.82, SE=2.062519011621e-5; equal thirds SE=3.275356712879e-5. 32-cell enumeration, central finite differences, optimality assertions passed. Python SHA256 f9c08549398cfd52d9d1c46d8954d4c4c49362df371a93ca9718617fe1127ae5. Complete executable and outputs preserved in visible relay response. This is precision allocation for corrected tetrad, NOT power to detect a fixed nominal calibration error.

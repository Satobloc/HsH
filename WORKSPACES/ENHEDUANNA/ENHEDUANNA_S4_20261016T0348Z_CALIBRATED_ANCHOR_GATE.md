# Enheduanna s4 | Calibrated session-anchor inversion (2026-10-16 03:48 UTC)

Status: GEN/DERIVED mathematical sandbox. Not authenticated historical Enheduanna participation, source exposure, authorship, or SAT/H(s)H physics.

Sources: WORKSPACES/ENHEDUANNA/2026-10-14_FOUR_PROBE_GLOBAL_LATENT_ALIAS_GATE.md (blob 30e985ffdab36b4d83be8251937a57469db5cab8) and WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-common-fifth-probe-20261015t1236z-s3.md (blob c7f15dc665b84b342c81d61efc0c23db4747a8e4).

Independent Bernoulli Z~Bern(p), H~Bern(q); conditional means E[Xi|Z,H]=fi+di Z+ci H. A calibrated anchor Y with P(Y=1|H=0)=r0, P(Y=1|H=1)=r1, t=r1-r0!=0, is conditionally independent of the four Xi. Set A=p(1-p), B=q(1-q). Exact inversion:

q=(E[Y]-r0)/t;
ci=Cov(Xi,Y)/(B*t);
Rij=Cov(Xi,Xj)-B*ci*cj=A*di*dj for distinct i,j;
v1=sqrt(R12*R13/R23), vj=R1j/v1=sqrt(A)*dj (positive di convention);
alpha_ijk=(cum3(Xi,Xj,Xk)-B*(1-2*q)*ci*cj*ck)/(vi*vj*vk);
p=(1-alpha/sqrt(alpha**2+4))/2, di=vi/sqrt(A), fi=E[Xi]-p*di-q*ci.

The fourth cumulant checks the reconstruction:
cum4(X1,X2,X3,X4)=A*(1-6*A)*prod(d)+B*(1-6*B)*prod(c).
No generic identifiability claim without calibrated r0,r1, independent latents and positive exposure-loading convention.

Executed Python source: enheduanna_s4_calibrated_anchor.py, SHA256 a0ff3e7b4dca95fef01bcc30edb9808840ce63e47f9691cc35e058d43d610add, seed 202610160348. The two inherited four-probe branches differ by at most 6.939e-17 per cell. With r0=.05,r1=.95, anchor means P=.392000000000, Q=.328978658328, separation=.063021341672. Exact five-probe inversion errors max 2.734e-16 (P), 1.799e-16 (Q); rank-one residual <=1.388e-17, fourth-cumulant residual <=1.475e-17. At N=100000, 250 multinomial replicates, RMSE(p,q)=(.0032480,.0016695); at N=1000000 RMSE(p,q)=(.0010649,.0005752). No failures. Flat anchor r0=r1=.5 preserves alias and is rejected.

Next gate: quantify calibration bias and clustered-session uncertainty. Full executable and Class P plotting source preserved in the visible scheduled response.

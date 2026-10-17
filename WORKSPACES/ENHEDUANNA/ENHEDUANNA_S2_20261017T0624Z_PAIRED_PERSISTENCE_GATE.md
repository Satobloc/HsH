# Enheduanna s2 | Paired latent persistence gate
2026-10-17 06:24 UTC. SANDBOXED / GEN-DERIVED.
Source: WORKSPACES/ENHEDUANNA/ENHEDUANNA_S4_20261016T2248Z_CLUSTER_CALIBRATION_GATE.md (blob f43f2901f76922849e4ac7a2f0dfb6111f5cf3f9).
Model: independent Z~Bern(p), H~Bern(q), paired observations with latent copy-or-refresh probabilities rho_z,rho_h. Conditional means X=f+dZ+cH, Y=r0+tH+uZ, W=w0+vH. Set R=Y-(t/v)W, A=p(1-p), B=q(1-q).
Symmetrized same-row covariances U0=Cov(X,R)=Adu and V0=Cov(X,W)=Bcv. Cross-row covariances U1=rho_z*Adu, V1=rho_h*Bcv. Hence rho_z=U1/U0 and rho_h=V1/V0 when denominators nonzero.
Fixture (p,q,f,d,c,r0,t,u,w0,v)=(.15,.38,.04,.55,.34,.04,.45,.25,.10,.75), (rho_z,rho_h)=(.60,.85). Exact 1024-cell enumeration: U0=.01753125 U1=.01051875 V0=.060078 V1=.0510663.
Exact delta-method covariance for sqrt(M) ratio error: [[75.914777333670,-6.854978900136],[-6.854978900136,4.919920551722]]. At M=30000, SE=(.050304002,.012806145). Seeded 350x30000-session simulation: mean=(.598057155,.849979187), SD=(.048703139,.012149635). All 16 grid assertions passed.
Calibration error epsilon in lambda=t/v+epsilon: U0'=Adu-epsilon*Bcv, U1'=rho_z*Adu-rho_h*epsilon*Bcv. Corrected (U1'+epsilon*V1)/(U0'+epsilon*V0)=rho_z.
Executable Python SHA256 85776bc986954e93bd815a4d3738711b4b26268d98f17980edef615a92027ac1; full source and output preserved in scheduled conversation. No exposure inference or historical worker participation claimed.

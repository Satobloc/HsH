# Enheduanna s4 | Cluster-aware calibrated exposure contrast
2026-10-16 22:48 UTC. SANDBOXED, source-grounded reconstruction. Not historical Enheduanna participation, source-exposure evidence, or physical SAT/H(s)H validation.

Source: WORKSPACES/ENHEDUANNA/ENHEDUANNA_S1_20261016T1512Z_CROSS_ANCHOR_ALIAS_GATE.md (blob 5ac74ffe923042bfa848c7bc2cb8ade0621c542d).
Model: independent Bernoulli Z~Bern(p), H~Bern(q). Conditionally independent X,Y,W with E[X|Z,H]=f+dZ+cH, E[Y|Z,H]=r0+tH+uZ, E[W|Z,H]=w0+vH.
Define A=p(1-p), B=q(1-q), lambda=t/v+epsilon, R=Y-lambda W, g=t-lambda*v. Then D=Cov(X,R)=A*d*u+B*c*g.
Influence IF=(X-EX)*(R-ER)-D. Exact components: V_Z=d^2*u^2*A*(1-2p)^2; V_H=c^2*g^2*B*(1-2q)^2; V_ZH=(d*u)^2*A*(1-2p)^2+(d*g+c*u)^2*A*B+(c*g)^2*B*(1-2q)^2.
With N observations in independent k-row sessions sharing selected latents, first-order Var(Dhat)=[V+(k-1)*V_shared]/N. Correct calibration g=0 cancels H-only cluster inflation but not Z sharing. Miscalibration bias = -epsilon*v*B*c. Within-session Cov(X,R) is 0 if Z is shared and A*d*u if Z refreshes.
Exact 32-cell rational fixture (p,q,f,d,c,r0,t,u,w0,v)=(.15,.38,.04,.55,.34,.04,.45,.25,.10,.75): D=.01753125, V=.0449358538575, V_Z=.00118116796875, V_H=0, V_ZH=.00139819974375. k=20 design effects iid/H/Z/ZH=1/1/1.49942728/1.59119373.
Seeded NumPy simulation N=10000,k=20,400 replicates per regime and exact fraction assertions passed. Full executable plus Class P plotting source is in scheduled relay conversation; executable SHA256 f5d3ef0119f93519769de5caa9ce3c09d8ae5f37a57784346aa6e112e24d1ba4.
Next: Tern Rook audit availability of session labels and independent calibration before applying to real source-exposure claims.

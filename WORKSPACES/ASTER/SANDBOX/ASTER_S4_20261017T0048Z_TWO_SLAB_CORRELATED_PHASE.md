# Aster s4: correlated second harmonics from two 4D slab normals
Run: 2026-10-17T00:48Z. SANDBOXED GEN/DERIVED, source-grounded continuation, not authenticated historical Aster participation.

Source: WORKSPACES/ASTER/SANDBOX/ASTER_S4_20261016T0548Z_4D_HARMONIC_FISHER.md @ ca43a89f91a635398385755ad0c24414d814e533.

Circular carrier gamma(t)=R(cos t,sin t,0,0) m, unit normal n(alpha)=(-beta sin alpha,beta cos alpha,sqrt(1-beta^2),0), R=1 m, beta=sin(0.246), slab half-thickness a=R beta q, q=1/4. For h_alpha(t)=1{|sin(t-alpha)|<=q}, let b=asin(q), m=sin(2b)/pi and v=[b-sin(4b)/4]/pi. The second harmonic is M2=m exp(2i alpha); the first vanishes.

For two slab normals with known relative projected phase delta, shared uniform phase sampling t, and common unknown phase shift theta, tangent statistics T_i=N^-1 sum h_(alpha_i+theta)(t_j) sin[2(t_j-alpha_i)] have derivative 2m and covariance matrix [[v,c(delta)],[c(delta),v]]/N at theta=0. For 0<=delta<=2b, c(delta)={[b-delta/2]cos(2delta)-sin(4b-2delta)/4}/pi; c=0 for 2b<=delta<=pi/2. Local estimator (T1+T2)/(4m) has variance (v+c)/(8Nm^2).

Executed Python (seed 202610170048), bounded optimization: delta*=0.354729777456 rad (20.324519115846 deg), c=-0.005423506284, correlation=-0.416827676153. Joint/single phase SD ratio=0.539987186814; disjoint ratio=0.707106781187; aligned ratio=1. For N=4096, predicted SD single/opt/disjoint =0.005782905039/0.003122694623/0.004089131368 rad. 2400 MC replicates: 0.005551186413/0.003063774065/0.004054477509. SO(4) rotation residual 3.61e-16; 1,000,003-point quadrature discrepancies <=2.37e-7; all assertions passed.

This is a variance calculation for a restricted harmonic estimator, not a global Fisher bound for the raw binary data or a physical SAT/H(s)H validation. Full runnable code and derivation retained in the scheduled conversation.
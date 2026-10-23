# Equation Intake 0004 | 2026-10-23

Status: mathematical comparison, sandbox only; not Factory Floor clearance or physical verification.

Read directly: Orson 2026-10-21 finite-core braid smoothing (blob 95baae8ac5fed555621180662c9738bf9095726a); Worldtube Lab 2026-09-16 Kerr shell geometry (f4c34c0adc5809c064cbca17499baa2b575dbd05); Orson 2026-10-05 moving intersections (63b9c9170860cb5b82f92a6ed0de5f4a6d0a7a24); Meridian 2026-10-22 Kelvin circulation (09888c044817ceac3934ef3015dd9fdcd5d17671). This pass used GitHub code search and exact reads. The existing completed Mersearch receipt was reused as a route, not rerun.

EQI-019: For effective overlapping sphere supports (not physical Kerr tubes), S2=1-eps/[2(1+eps)], S3=1/(1+eps); triple overlap onset eps=2/sqrt(3)-1=0.15470053837925168. Python evaluated S2=.933012701892, S3=.866025403784 at onset. Valid only in the source's small-overlap sphere geometry and subject to interface thickness xi being physical rather than readout resolution.

EQI-020: Euclidean oblate Kerr-coordinate spheroid equatorial curvature anisotropy A=1+1/q² with q=r/a. Python: q=2,1,.5,.25,.1 -> A=1.25,2,5,17,101 respectively. This is embedding geometry, NOT Kerr spacetime curvature invariant or shell stress.

EQI-021: moving intersection speed ds/dlambda=-(F_lambda+grad F dot X_lambda)/(grad F dot X_s). In normalized planar model, v_observed=v_material+b(v_sheet-u)/a. Python values for (v_material,b,v_sheet,u)=(.05,.6,1,.2): a=1,.5,.1,.01 -> .53,1.01,4.85,48.05. Degenerate apparent intersection speed is not physical information speed.

EQI-022: Meridian-source historical velocity ansatz v=grad chi + lambda/rho grad(rho Phi) has curl=lambda grad Phi cross grad ln rho. An axisymmetric density and smooth single-valued potentials give zero circulation on circular azimuthal loops. Indexed from existing audit, NOT independently rerun or traced to original primary in this pass.

Next gates: replace sphere proxies with physical tube surface and specified response; distinguish Kerr exact metric/horizon from coordinate spheroid; compute finite-slab integrated readout; recover original SAT.O and later corrections. All statuses remain nonpromoted.

A detailed self-contained report plus executed Python verification script were saved as downloadable conversation artifacts.
# Ariadne s4: exact (2,3) normal-tube reach
2026-10-16 09:48 UTC. SANDBOXED / DERIVED / PYTHON EXECUTED. Predecessor: WORKSPACES/ARIADNE/SANDBOX_2026-10-15_S4_NORMAL_TUBE_CHIRALITY.md, blob ba6241213db6e282a00a71ff7fe6dbe2b95614c8.

Curve in Euclidean R4: gamma(t)=(R cos2t,R sin2t,r cos3t,sigma r sin3t), sigma=+/-1, R,r>0 metres. Speed=sqrt(4R^2+9r^2); focal radius=(4R^2+9r^2)/sqrt(16R^2+81r^2). For parameter separation delta, half-chord squared=R^2 sin^2(delta)+r^2 sin^2(3delta/2). Double-critical chords obey sin(delta)[12r^2 x^2+4R^2 x-3r^2]=0 with x=cos(delta). Roots x+/-=(-R^2 +/- sqrt(R^4+9r^4))/(6r^2), retaining -1<x<1. Their half-length H(x)=sqrt[R^2(1-x^2)+(r^2/2)(1-4x^3+3x)]. Delta=pi gives half-length r.

The smooth-curve thickness theorem gives reach=min(focal radius,r,H(x+),H(x-) for admissible roots). Algebra: focal^2-r^2=(16R^4+56R^2 r^2)/(16R^2+81r^2)>0; at stationary roots H(x)^2-r^2=R^2(1+x)^2(3-2x)/[3(2x+1)]. Hence reach=r when r/R<=2/3; reach=H(x-) when r/R>2/3. As r/R tends to infinity reach/R tends to sqrt(3)/2.

Inherited fixture R=1m,r=.4m: curvature=.989237062285/m; focal=1.010880038896m; non-antipodal H=1.045891943278m; reach EXACTLY .4m. At h=.4m, normal fibers from t=0 and pi meet at (R,0,0,0). Thus predecessor h=.5 parameterized-fiber Pfaffian remains mathematically valid but its family is not an embedded tube.

For 0<=h<reach, exact embedded four-volume is V4=(8*pi^2/3)*sqrt(4R^2+9r^2)*h^3 [m^4], because the normal Jacobian's linear curvature term averages to zero. V4 at h=.10,.25,.35,.39m: .061385801049,.959153141398,2.631916219997,3.641344332455 m^4. No extension to h>.4 as union volume.

Python 3/NumPy source SHA256: d29516b35f93bf3207bd8b9eac4ca4859ed12c07d1c5751b56a1e68c258060df. Exact chord/tangent, 200 phase-ratio controls, homogeneity, handedness and volume guards: ALL PASS. Full executable source, complete output and Class P figure are in the visible calculation relay conversation. No physical law inferred.

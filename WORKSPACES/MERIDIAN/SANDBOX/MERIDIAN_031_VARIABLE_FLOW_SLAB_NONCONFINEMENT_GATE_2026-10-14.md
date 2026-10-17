# Meridian 031 | Variable preferred flow does not enforce normal confinement
2026-10-14 18:24 UTC | s2 | SANDBOXED exact geometry and numerical fixture | No physical claim

## Question and source
Continuation of Meridian 030 (WORKSPACES/MERIDIAN/SANDBOX/MERIDIAN_030_TILTED_FLOW_SLAB_ESCAPE_GATE_2026-10-13.md, blob fc53d6135a154c9a1c731dc6cfc76dc39de1b986) and the later MK144 reach checkpoint (WORKSPACES/MERIDIAN/meridian_mk144_transverse_hagalaz_reach_gate_20261014.py, blob e5f36401f07866c2d9069d3b1b8777e2104a360c). Only HsH internal source/rules read in this run; no three-repo Mersearch, external comparison, or novelty claim. The October 9 Nathan Direct internal-first and forbidden-source boundaries were followed.

Does a **nonconstant** unit preferred flow plus a well-defined timelike time function force two finite-core histories to stay in a physical normal slab? Answer: no, if the slab restricts only their center time coordinates. A separate material confinement law would be necessary.

## Construction (all coordinates in metres)
In Euclidean R^4 with X=(w,x,y,z), set
  u(w)=(cos theta(w),0,0,sin theta(w)),
  theta(w)=theta0+eps sin(k w), k=2pi/L,
  g=I-2u u^T.
The Householder metric has eigenvalues (-1,+1,+1,+1) everywhere.

Define the two center histories X_±(w)=(w,±r(w)/2) for 0<=w<=L,
  r(w)=R(cos²(k w), cos(k w)sin(k w), sin(k w)).
Exactly |r(w)|=R, but r_z reaches ±R, and its (x,y) projection vanishes at w=L/4 and 3L/4. Thus an apparent planar winding can pass through the normal coordinate without the two centers colliding.

A legitimate local time function is
  tau(w,z)=integral_0^w cos(theta(v)) dv + z sin(theta(w)).
For eps != 0, d tau is not everywhere identical to the u covector; conflating them would be an error. The centered tau slab condition is
  |tau(X_±)-tau(w,0)| <= h/2
iff |r_z(w) sin(theta(w))| <= h.
It does **not** imply |r_z| <= h.

## Exact disjoint-core certificate
Differentiation gives |r'|²=R²k²(1+cos²(k w)). Each center graph has spatial Lipschitz bound v=pi sqrt(2)R/L. For any two parameters w,w', d=|w-w'|, spatial separation between opposite centers is >=max(0,R-vd). Therefore
  |X_+(w)-X_-(w')| >= sqrt(d²+max(0,R-vd)²) >= R/sqrt(1+v²).
Thus open Euclidean four-dimensional tubes of radius D/2 about the two centerlines cannot intersect if R/sqrt(1+v²)>D. This certificate concerns **core separation**, not containment of the entire radius-D/2 tubes inside the tau slab. The latter is an independent, stronger condition.

## Timelike and temporal bounds
With q=Rk/2, theta in [theta0-|eps|,theta0+|eps|] subset [0,pi/2],
  g(X'_±,X'_±) <= 1+v²-2[cos(theta0+|eps|)-q sin(theta0+|eps|)]².
For |z|<=zmax=R/2+D/2, let a=z cos(theta) theta'(w), |a|<=b=zmax |eps|k. The inverse metric equals g, and
  g^{-1}(d tau,d tau)=-1-2a cos(theta)+a²(1-2cos²(theta))
                   <= -1+2b+b².
Also d tau(X'_±)/dw >= cos(theta0+|eps|)-b-q sin(theta0+|eps|).
These are analytic uniform sufficient bounds, not grid-only checks.

## Numerical fixture and falsifier
R=1 m, L=20 m, D=0.8 m, h=0.6 m, theta0=0.5 rad, eps=0.1 rad.
k=0.314159265359 m^-1; v=0.222144146908.
- Maximum center tau difference = sin(0.6)=0.564642473395 m < h (margin 0.035357526605 m).
- Global opposite-center distance >=0.976203197631 m > D, hence disjoint Euclidean cores.
- Uniform tangent bound g(T,T)<=-0.035934209720; direct grid maximum -0.177322296092.
- Uniform g^-1(d tau,d tau)<=-0.942651894279; direct grid maximum -0.956539754517.
- Uniform d tau/dw >=0.708367448711; direct grid minimum 0.774047819543.
- Standard constant-flow control eps=0: tau difference maximum sin(0.5)=0.479425538604 m.
- Zero-tilt control theta0=eps=0: tau=w and tau slab places zero restriction on z.
- Falsifier for this explicit path: h=0.55 m <0.564642473395 m, so it fails the tau-slab condition.
- Limit R/L->0 makes the center tangents approach the preferred time direction for small theta.

Independent finite-difference check of d tau/dw vs analytic derivative: max absolute discrepancy 5.41e-11 on 200001 samples.

## Reproduction (Python 3, NumPy)
    import numpy as np
    R,L,D,h,t0,e=1.,20.,.8,.6,.5,.1
    k=2*np.pi/L; w=np.linspace(0,L,200001); x=k*w
    t=t0+e*np.sin(x); tp=e*k*np.cos(x); c=np.cos(x); s=np.sin(x)
    r=np.array([R*c*c,R*c*s,R*s]).T
    rp=np.array([-2*R*k*c*s,R*k*(c*c-s*s),R*k*c]).T
    u=np.array([np.cos(t),0*w,0*w,np.sin(t)]).T
    vmax=np.pi*np.sqrt(2)*R/L
    assert R/np.sqrt(1+vmax*vmax)>D
    assert np.max(np.abs(r[:,2]*np.sin(t)))<h
    for sign in [1.,-1.]:
        T=np.column_stack((np.ones_like(w),sign*rp/2))
        gt=np.sum(T*T,axis=1)-2*np.sum(u*T,axis=1)**2
        assert np.max(gt)<0
        z=sign*r[:,2]/2; zp=sign*rp[:,2]/2
        dt=np.cos(t)+z*np.cos(t)*tp+zp*np.sin(t)
        assert np.min(dt)>0
    print('max slab:',np.max(np.abs(r[:,2]*np.sin(t))))
    print('global separation bound:',R/np.sqrt(1+vmax*vmax))

## Interpretation and handoff
This is a **counterexample to center-slab confinement by a varying preferred time field alone**, not a counterexample to an additional physical wavefront thickness or constitutive restriction. Euclidean core thickness and Lorentzian temporal support must not be silently identified. No actual SAT/H(s)H force law, tube injectivity under a dynamical evolution, or measured observable follows.

Mercer: test whether a source-derived constitutive cost depending on the actual normal displacement r_z (rather than tau alone) supplies a positive escape barrier while retaining the exact time-function and core-separation controls. Compare to a standard harmonic confinement term; do not infer it from coordinate tilt.

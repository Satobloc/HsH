#!/usr/bin/env python3
"""Elias s2 2026-10-14: SO(4) order/spectrum/metric gate. SANDBOXED.
Sources: HsH BEDROCK; Cross-Formalism Index CF-001/008; Elias strict-priority
checkpoint (2026-10-14); Nadir Playground 008. This fixture is newly derived,
not an archival attribution or a physical prediction.

LOCAL:ELIAS-SO4-ORDER. A=R12(a), B=R23(b), u0=e1, g=I-2uu^T.
Angles dimensionless radians; r=1 m gives endpoint distance in meters.
C^2=||AB-BA||F^2=32xy(1-xy), x=sin(a/2)^2,y=sin(b/2)^2.
||ABe1-BAe1||=2|sin(a)sin(b/2)|.
||g(ABe1)-g(BAe1)||F=2sqrt(2)*d*sqrt(1-d^2/4).
BA=A^T(AB)A: identical eigenvalues/trace/determinant, different anchored
director and metric. Without external frame, difference may be pure gauge.
"""
import math
import numpy as np

def R(i,j,t):
    q=np.eye(4)
    c,s=math.cos(t),math.sin(t)
    q[i,i]=q[j,j]=c
    q[i,j]=-s
    q[j,i]=s
    return q

def norm(x):
    return float(np.linalg.norm(x))

def metric(u):
    return np.eye(4)-2*np.outer(u,u)

def run(A,B,name):
    ab=A@B
    ba=B@A
    u=ab[:,0]
    v=ba[:,0]
    c=norm(ab-ba)
    d=norm(u-v)
    m=norm(metric(u)-metric(v))
    assert norm(ba-A.T@ab@A)<1e-12
    assert abs(np.trace(ab)-np.trace(ba))<1e-12
    assert abs(np.linalg.det(ab)-1)<1e-12
    assert abs(np.linalg.det(ba)-1)<1e-12
    assert norm(np.sort_complex(np.linalg.eigvals(ab))-
                np.sort_complex(np.linalg.eigvals(ba)))<1e-12
    for g in (metric(u),metric(v)):
        assert norm(np.linalg.eigvalsh(g)-[-1,1,1,1])<1e-12
    assert abs(m-2*math.sqrt(2)*d*math.sqrt(max(0,1-d*d/4)))<1e-12
    print(name, "commutator_F",format(c,".12f"),
          "endpoint_delta_m_at_r1",format(d,".12f"),
          "metric_delta_F",format(m,".12f"))
    return c,d,m

def main():
    a,b=.2387,.246
    c,d,m=run(R(0,1,a),R(1,2,b),"shared")
    x=math.sin(a/2)**2
    y=math.sin(b/2)**2
    assert abs(c-math.sqrt(32*x*y*(1-x*y)))<1e-12
    assert abs(d-2*abs(math.sin(a)*math.sin(b/2)))<1e-12
    print("small-angle ratio",c/(math.sqrt(2)*a*b))
    for eps in (.1,.05,.025,.0125):
        ce,_,_=run(R(0,1,eps),R(1,2,eps),"eps="+str(eps))
        print("ratio",ce/(math.sqrt(2)*eps**2))
    for aa,bb in ((0,b),(a,0),(math.pi,math.pi)):
        ce,_,_=run(R(0,1,aa),R(1,2,bb),"boundary")
        assert ce<1e-12
    ce,_,_=run(R(0,1,a),R(2,3,b),"commuting disjoint planes")
    assert ce<1e-12
    c4,d4,m4=run(R(0,1,a)@R(2,3,.31),
                 R(1,2,b)@R(0,3,-.19),"genuine 4D")
    assert min(c4,d4,m4)>0
    print("PASS")

if __name__=="__main__":
    main()

# Independent calculation: 4D curvature energy and chirality

Date: 2026-10-15. Public mathematical sandbox, not established H(s)H physics.

## Exact construction

Let X(t)=(a cos(pt),a sin(pt),b cos(qt),b sin(qt)) in Euclidean R⁴, with t in [0,2π], positive lengths a,b in meters and integer winding numbers p,q. The curve lies on S³ of radius sqrt(a²+b²). Its derivatives obey

|X'|²=a²p²+b²q²=v²; X'·X''=0; |X''|²=a²p⁴+b²q⁴.

Consequently, arc length L=2πv and Frenet curvature κ=sqrt(a²p⁴+b²q⁴)/v². For constant isotropic stiffness EI in J·m, bending energy E=(EI/2)∫κ²ds=EI·L·κ²/2 in J.

The oriented four-jet determinant is exactly D=det[X,X',X'',X''']=a²b²pq(p²−q²)², with units m⁴ (t is dimensionless). Therefore q→−q preserves L, κ and E but flips the sign of D, provided p²≠q².

## Verified numerical fixture

For a=0.6 m, b=0.8 m, p=2, q=±3, EI=1 J·m:
κ=1.054092553389 m⁻¹, L=16.859555354498 m, E=9.366419641388 J for either winding.
D(+3)=+34.560000000000 m⁴; D(−3)=−34.560000000000 m⁴.
Direct numerical tests at 1,024 points for each winding gave maximum curvature error 4.441e−16 m⁻¹ and determinant error 4.263e−14 m⁴.

## Interpretation / limits

An isotropic bending energy is blind to winding-sign parity in this fixture; an orientation-calibrated four-jet distinguishes it. Without calibrated ambient orientation, reflection reverses D and reinstates ambiguity. When p²=q², D=0. This is a counterexample for a specified model, not a physical particle prediction.

## Complete executable verifier (Python 3 + NumPy)

```python
import math
import numpy as np

def curve(t,a,b,p,q):
    return np.array([a*math.cos(p*t),a*math.sin(p*t),b*math.cos(q*t),b*math.sin(q*t)])

def jet(t,a,b,p,q,n):
    return np.array([a*p**n*math.cos(p*t+n*math.pi/2),
                     a*p**n*math.sin(p*t+n*math.pi/2),
                     b*q**n*math.cos(q*t+n*math.pi/2),
                     b*q**n*math.sin(q*t+n*math.pi/2)])

def analytic(a,b,p,q,EI):
    v2=a*a*p*p+b*b*q*q
    kappa=math.sqrt(a*a*p**4+b*b*q**4)/v2
    length=2*math.pi*math.sqrt(v2)
    energy=EI*length*kappa*kappa/2
    orient=a*a*b*b*p*q*(p*p-q*q)**2
    return kappa,length,energy,orient

a,b,p,EI=0.6,0.8,2,1.0
for q in (3,-3):
    k,L,E,D=analytic(a,b,p,q,EI)
    err_k=err_d=0
    for i in range(1024):
        t=2*math.pi*i/1024
        r0=curve(t,a,b,p,q)
        r1,r2,r3=[jet(t,a,b,p,q,n) for n in (1,2,3)]
        kn=math.sqrt(max(0.0,float(r2@r2-(r1@r2)**2/(r1@r1))))/(r1@r1)
        dn=float(np.linalg.det(np.column_stack((r0,r1,r2,r3))))
        err_k=max(err_k,abs(kn-k))
        err_d=max(err_d,abs(dn-D))
    assert err_k<1e-12 and err_d<1e-10
    print(q,k,L,E,D,err_k,err_d)
```

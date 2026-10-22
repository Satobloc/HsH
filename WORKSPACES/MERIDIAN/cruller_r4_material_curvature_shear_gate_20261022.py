#!/usr/bin/env python3
"""Native R4 material-history curvature, differential shear, oriented osculation.

SANDBOXED pure geometry. No Lorentzian field equation or optical prediction.
Uses NumPy; optional matplotlib figures are provided by the full conversation script.
"""
import numpy as np

R0 = 10.0               # Planck lengths: illustrative fixture
CHI = np.pi / 4          # Clifford chart: illustrative fixture

def x_derivative(s, p, q, n, chi=CHI, radius=R0):
    """Derivative order n with respect to dimensionless s=ln(r/r0)."""
    r = radius * np.exp(s)
    out = []
    for amplitude, rate in ((np.cos(chi), p), (np.sin(chi), q)):
        z = r * amplitude * np.exp(1j * rate*s) * (1.0 + 1j*rate)**n
        out.extend([z.real, z.imag])
    return np.asarray(out)

def invariants(s, p, q, chi=CHI, radius=R0):
    w1, w2 = np.cos(chi)**2, np.sin(chi)**2
    A = w1*p*p + w2*q*q
    B = w1*p**4 + w2*q**4
    r = radius * np.exp(s)
    tangent = x_derivative(s,p,q,1,chi,radius)
    acceleration = x_derivative(s,p,q,2,chi,radius)
    gram = np.dot(tangent,tangent)*np.dot(acceleration,acceleration)-np.dot(tangent,acceleration)**2
    kappa_direct = np.sqrt(max(0.,gram))/np.linalg.norm(tangent)**3
    kappa_analytic = np.sqrt(A+B)/(r*(1+A))
    assert np.isclose(kappa_direct,kappa_analytic,rtol=1e-11,atol=1e-13)
    assert np.isclose(B-A*A,w1*w2*(p*p-q*q)**2,atol=1e-12)

    derivatives = np.stack([x_derivative(s,p,q,n,chi,radius) for n in range(1,5)],axis=1)
    D = np.linalg.det(derivatives)
    exact_D = r**4 * w1*w2*p*q*(p*p-q*q)**2*(1+p*p)*(1+q*q)
    assert np.isclose(D,exact_D,rtol=1e-8,atol=1e-9)
    P4 = D/np.linalg.norm(tangent)**10
    return dict(A=A, B=B, r_kappa=r*kappa_direct, curvature=kappa_direct,
                orient_r6P4=r**6*P4)

def stretches(s, p_chi, q_chi, chi=CHI):
    a = s*np.cos(chi)*p_chi
    b = s*np.sin(chi)*q_chi
    F = np.array([[1,0,0],[a,1,0],[b,0,1]],dtype=float)
    nu = np.hypot(a,b)
    predicted = np.array([np.sqrt(1+nu*nu/4)+nu/2,1.,
                          np.sqrt(1+nu*nu/4)-nu/2])
    actual = np.linalg.svd(F,compute_uv=False)
    assert np.allclose(actual,predicted,atol=1e-12)
    assert np.isclose(np.linalg.det(F),1)
    return nu,predicted

def embed(s,chi,alpha,beta,p0=.5,q0=.5,chi0=CHI,r0=R0):
    """One differential swirl control: p_chi=q_chi=1 at chi0."""
    p = p0 + (chi-chi0)
    q = q0 + (chi-chi0)
    r = r0*np.exp(s)
    return r*np.array([np.cos(chi)*np.cos(alpha+p*s),
                       np.cos(chi)*np.sin(alpha+p*s),
                       np.sin(chi)*np.cos(beta+q*s),
                       np.sin(chi)*np.sin(beta+q*s)])

def finite_difference_metric_check(h=1e-5):
    s=1.
    c=CHI
    f=lambda chi,alpha,beta: embed(s,chi,alpha,beta)
    D=np.stack([(f(c+h,0,0)-f(c-h,0,0))/(2*h),
                (f(c,h,0)-f(c,-h,0))/(2*h),
                (f(c,0,h)-f(c,0,-h))/(2*h)],axis=1)
    G = D.T@D/(R0*np.exp(s))**2
    expected = np.array([[2,.5,.5],[.5,.5,0],[.5,0,.5]])
    assert np.max(np.abs(G-expected))<1e-9
    return G

if __name__=="__main__":
    for label,p,q in [
        ("radial",0,0),("same-plane",.5,.5),
        ("counter-plane",.5,-.5),("one-plane",0,1/np.sqrt(2)),
        ("positive orientation",.5,.25),("negative orientation",.5,-.25)
    ]:
        for s in [-2,-.3,0,.5,1.7]:
            values = invariants(s,p,q)
        print(label,values)
    print("normalized shear at nu=1:",stretches(1,1,1))
    print("finite-difference metric:",finite_difference_metric_check())

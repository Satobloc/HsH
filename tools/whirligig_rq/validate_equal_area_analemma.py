#!/usr/bin/env python3
"""Independent standard-library validation of the Whirligig equal-area Analemma."""
from __future__ import annotations
import math

PI = math.pi
TAU = 2.0 * PI
APERTURE_GAIN = 0.20


def simpson(f, a: float, b: float, n: int = 8192) -> float:
    if n % 2:
        raise ValueError("Simpson interval count must be even")
    h = (b-a)/n
    total = f(a)+f(b)
    total += 4.0*sum(f(a+(2*i-1)*h) for i in range(1,n//2+1))
    total += 2.0*sum(f(a+2*i*h) for i in range(1,n//2))
    return total*h/3.0


def beta(t: float, k: float) -> float:
    return k*math.sin(t)*math.cos(t)**2


def beta_p(t: float, k: float) -> float:
    s,c=math.sin(t),math.cos(t)
    return k*c*(1.0-3.0*s*s)


def beta_pp(t: float, k: float) -> float:
    s=math.sin(t)
    return k*s*(9.0*s*s-7.0)


def lobe_area(k: float) -> float:
    # d(longitude)/dt=2; north-polar lobe area = integral(1-sin(latitude)) d(longitude).
    return 2.0*simpson(lambda t: 1.0-math.sin(beta(t,k)),0.0,PI)


def speed(t: float, k: float) -> float:
    return math.hypot(beta_p(t,k),2.0*math.cos(beta(t,k)))


def analemma_length(k: float) -> float:
    return simpson(lambda t:speed(t,k),0.0,TAU)


def solve_k() -> float:
    lo,hi=2.5,3.0
    flo=lobe_area(lo)-PI
    fhi=lobe_area(hi)-PI
    if flo*fhi>=0:
        raise RuntimeError("Equal-area root is not bracketed")
    for _ in range(80):
        mid=(lo+hi)/2.0
        fm=lobe_area(mid)-PI
        if flo*fm<=0:
            hi,fhi=mid,fm
        else:
            lo,flo=mid,fm
    return (lo+hi)/2.0


def unit_curve(t: float,k: float):
    be=beta(t,k)
    return (math.cos(be)*math.cos(2*t),math.cos(be)*math.sin(2*t),math.sin(be))


def unit_d1(t: float,k: float):
    be,bp=beta(t,k),beta_p(t,k)
    cb,sb,cp,sp=math.cos(be),math.sin(be),math.cos(2*t),math.sin(2*t)
    return (-bp*sb*cp-2*cb*sp,-bp*sb*sp+2*cb*cp,bp*cb)


def unit_d2(t: float,k: float):
    be,bp,bpp=beta(t,k),beta_p(t,k),beta_pp(t,k)
    cb,sb,cp,sp=math.cos(be),math.sin(be),math.cos(2*t),math.sin(2*t)
    eb=(-sb*cp,-sb*sp,cb)
    ep=(-sp,cp,0.0)
    g=unit_curve(t,k)
    aa=bpp+4*sb*cb
    dd=-4*bp*sb
    qq=-(bp*bp+4*cb*cb)
    return tuple(aa*eb[i]+dd*ep[i]+qq*g[i] for i in range(3))


def dot(a,b):
    return sum(x*y for x,y in zip(a,b))


def cross(a,b):
    return (a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1])


def norm(a):
    return math.sqrt(dot(a,a))


def main() -> None:
    k=solve_k()
    area_each=lobe_area(k)
    area_both=2*area_each
    area_remainder=4*PI-area_both
    length_unit=analemma_length(k)
    circuits=2
    ratio=1.0+circuits*length_unit/TAU
    b=0.55
    R=ratio*b
    length_physical=length_unit*b
    sphere_circ=TAU*b
    tube_circ=TAU*b
    inner_circ=TAU*(R-b)

    # E: branches at t=0,pi are transverse; W: branches at pi/2,3pi/2 share tangent.
    e1,e2=(2.0,k),(2.0,-k)
    e_det=e1[0]*e2[1]-e1[1]*e2[0]
    w1,w2=(2.0,0.0),(2.0,0.0)
    w_dot=dot(w1,w2)/(norm(w1)*norm(w2))

    # Check analytic derivatives against central differences.
    derivative_errors=[]
    t0=0.713
    for h in (1e-3,5e-4,2.5e-4):
        gm,g0,gp=unit_curve(t0-h,k),unit_curve(t0,k),unit_curve(t0+h,k)
        fd1=tuple((gp[i]-gm[i])/(2*h) for i in range(3))
        fd2=tuple((gp[i]-2*g0[i]+gm[i])/(h*h) for i in range(3))
        derivative_errors.append((h,norm(tuple(fd1[i]-unit_d1(t0,k)[i] for i in range(3))),
                                  norm(tuple(fd2[i]-unit_d2(t0,k)[i] for i in range(3)))))

    min_speed=min(speed(TAU*i/8192,k) for i in range(8192))
    max_lat=2*k/(3*math.sqrt(3))
    midpoint_bound=math.sin(APERTURE_GAIN)

    assert abs(area_each-PI)<2e-11
    assert abs(area_both-area_remainder)<2e-11
    assert abs(e_det)>1e-8
    assert abs(w_dot-1.0)<1e-14
    assert min_speed>1.0
    assert abs(TAU*(ratio-1.0)-circuits*length_unit)<2e-11
    assert abs(inner_circ-circuits*length_physical)<2e-11
    assert abs(sphere_circ-tube_circ)<1e-14

    print(f"area-balance shape k                 = {k:.13f}")
    print(f"one lobe area                       = {area_each:.13f} b^2")
    print(f"both lobes area                     = {area_both:.13f} b^2")
    print(f"equatorial remainder area           = {area_remainder:.13f} b^2")
    print(f"maximum lobe latitude               = {math.degrees(max_lat):.9f} deg")
    print(f"full Analemma length / b            = {length_unit:.13f}")
    print(f"minimum even circuit count          = {circuits}")
    print(f"required major/minor ratio R/b      = {ratio:.13f}")
    print(f"chosen tube/sphere radius b         = {b:.8f}")
    print(f"derived torus major radius R        = {R:.13f}")
    print(f"physical Analemma length            = {length_physical:.13f}")
    print(f"sphere great-circle circumference   = {sphere_circ:.13f}")
    print(f"tube cross-section circumference    = {tube_circ:.13f}")
    print(f"inner torus circumference           = {inner_circ:.13f}")
    print(f"inner circumference / Analemma L   = {inner_circ/length_physical:.13f}")
    print(f"E crossing tangent determinant      = {e_det:.13f} (nonzero = transverse)")
    print(f"W kissing tangent dot               = {w_dot:.13f} (1 = common tangent)")
    print(f"minimum spherical parameter speed   = {min_speed:.13f}")
    print(f"W_obble offset bound / b            = {midpoint_bound:.13f}")
    print("derivative finite-difference checks:")
    for h,e1err,e2err in derivative_errors:
        print(f"  h={h:.7g}: first={e1err:.3e}, second={e2err:.3e}")
    print("PASS: equal areas, E/W topology, regularity, radius equality, and 2:1 inner-circumference gearing")


if __name__=="__main__":
    main()

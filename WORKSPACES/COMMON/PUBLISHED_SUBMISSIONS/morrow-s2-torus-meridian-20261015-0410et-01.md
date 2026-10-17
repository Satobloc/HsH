# Morrow s2: finite-core torus meridian (GEN/DERIVED)

A mathematical toy in Euclidean R^4, not an established SAT/H(s)H physical mechanism. Lengths are meters.

Take T(s,t)=(A cos s,A sin s,R cos t,R sin t), A=5 m, R=1 m. Its exact distance from x is d_T(x)=sqrt((hypot(x1,x2)-A)^2+(hypot(x3,x4)-R)^2). A finite material core is K_a={x:d_T(x)<=a}, a=0.10 m. Define the transverse meridian C(phi)=(A+e cos phi,0,R+e sin phi,0), e=0.30 m. Provided e<min(A,R), d_T(C(phi))=e at every phi. The normal-plane complex coordinate z=(hypot(x1,x2)-A)+i(hypot(x3,x4)-R) becomes e exp(i phi), with winding (1/2pi) integral d arg z=1. Material clearance is e-a=0.20 m, exceeding an additional 0.05 m buffer.

The torus area is 4 pi^2 A R=197.392088021787 m^2. When 0<a<min(A,R), the disjoint normal disks have area pi a^2, giving exact 4-volume 4 pi^3 A R a^2=6.201255336060 m^4. As a->0 this scales quadratically. A normal-frame shear t->t+ks (integer k) reparameterizes the same torus, without changing its embedding or winding; apparent helical phase alone is not a new topological link.

Counterexample to extrapolating the small-core volume: at a=1.8 m (R<a<A), exact integration over the nonnegative second radial coordinate gives 2117.922371285 m^4, while 4 pi^3 A R a^2 predicts 2009.206728883 m^4, an underestimate of 5.133126874%. This is a coordinate-overlap/domain boundary, not a physical claim.

Executable reproducibility fixture (Python 3, standard library only):

```python
import math
A,R,a,e=5.,1.,0.10,0.30
area=4*math.pi**2*A*R
vol=area*math.pi*a*a
def exact_volume(radius):
    if radius<=R: return 4*math.pi**3*A*R*radius**2
    z=math.sqrt(radius*radius-R*R)
    J1=math.pi*radius*radius/4+R*z/2+radius*radius*math.asin(R/radius)/2
    J2=z**3/3
    return 8*math.pi**2*A*(R*J1+J2)
phi=[2*math.pi*j/8192 for j in range(8192)]
d=[math.hypot(e*math.cos(t),e*math.sin(t)) for t in phi]
assert max(abs(v-e) for v in d)<1e-14
assert e-a>0.05
assert abs(exact_volume(a)-vol)<1e-12
big=1.8
naive=4*math.pi**3*A*R*big**2
real=exact_volume(big)
assert real>naive
print('area_m2',f'{area:.12f}')
print('core_m4',f'{vol:.12f}')
print('global_distance_range_m',f'{min(d):.12f}',f'{max(d):.12f}')
print('winding',1,'clearance_m',f'{e-a:.12f}')
print('large_core_naive_m4',f'{naive:.9f}')
print('large_core_exact_m4',f'{real:.9f}')
print('relative_underestimate_pct',f'{100*(real-naive)/real:.9f}')
```

Checks: exact global clearance, volume small-core identity, large-core falsifier. Handoff to Kestrel: supply a constitutive energy that selects/stabilizes a codimension-two carrier rather than postulating one. No original historical worker authorship is asserted.

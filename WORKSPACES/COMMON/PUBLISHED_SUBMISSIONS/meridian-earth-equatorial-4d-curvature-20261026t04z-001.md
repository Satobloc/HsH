# Meridian :00 | Real Earth equatorial material-history curvature | 2026-10-26T04Z
Ring: h=364, seq=1820, index 15 Meridian -> Mercer.

STATUS: MATHEMATICAL_KINEMATICS_CHECKED; REAL_WGS84_REFERENCE_COMPARED; HSH_DYNAMIC_RESPONSE_UNRESOLVED; NO_BEDROCK_PROMOTION.

## Source genealogy and control
Nathan primary: HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH ARCHITECT.txt, blob 926dd9685471f311570112ebc72d4c0be158f4c6, lines 33-35: rotating objects of all scales have helical material histories; any Kelvin-vortex response must be derived across scales, not arbitrarily exempted. Original message date unverified.
Later mathematical correction: HsH WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_ROTATION_AS_WORLDTUBE_CURVATURE_CORRECTION.md, blob 199b560b52443eaf6228630299663b28e1b907bf, 71 lines. Extrinsic material-curve curvature is distinct from ambient Riemann curvature and moving-frame gauge curvature.
BEDROCK current blob 4cabda482c48c217614b868a2138409275df9bf7, 563 lines/86946 chars; ND-2026-10-18-02/03 and ND-2026-10-25-01 read. STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines/11012 chars, read.
Mersearch guide blob 82ffe3ebd837de1d997af78b04d411481f75158e, 103 lines, read. All four shared lanes occupied by other archive harvests; no overwrite and NO completed Mersearch run. Bounded three-repository connector search fallback.
Random Python secrets.randbelow(3) drew index 1 from [GNEW 2.txt, SCALING.txt, 2026/SAT MATH - BACKBONE.txt]; selected public SAT SCALING.txt, blob dcf23fbeda258da813f54360ab1a7f33243c7089, 457 lines/22550 chars fetched/read including unrelated mass, Cabibbo and 0.28-radian material. It is not physical authority for this Earth calculation.

## Actual physical system, observational basis
Marked equatorial Earth surface under NGA WGS84 2014, observationally calibrated geodetic reference. Adopted parameters: equatorial R=6378137.0 m, omega=7.292115e-5 rad/s, GM=3.986004418e14 m^3/s^2, Cbar20=-4.84165143790815e-4; theoretical normal equatorial gamma_e=9.7803253359 m/s^2. WGS84 reference values are conventional/adopted, not independent raw gravimeter observations and not quoted standard uncertainties.
NGA: https://earth-info.nga.mil/GandG/wgs84/gravitymod/egm2008/index.html
2014 standard: https://w3.uch.edu.tw/ccchang50/NGA.STND.0036_1.0.0_WGS84.pdf
CODATA 2022 G=6.67430(15)e-11 SI used ONLY for Planck unit conversion. c,h exact SI. https://physics.nist.gov/cuu/pdf/all.pdf

## Native R4 (++++) exact kinematics
Set w=ct and X(w)=(R*cos(omega*w/c), R*sin(omega*w/c),0,w).
Let beta=R*omega/c, b=c/omega, theta=omega*t.
The same curve in its nontrivial 3-plane is (R*cos(theta),R*sin(theta),b*theta).
Exact Frenet invariants:
kappa_E=R/(R^2+b^2)=beta^2/[R*(1+beta^2)]
tau_E=b/(R^2+b^2)=beta/[R*(1+beta^2)]
kappa_E/tau_E=beta; a_rot=omega^2*R=c^2*beta^2/R.
The sign of torsion depends on rotation orientation. Constant ambient Euclidean Riemann tensor = 0. Standard Lorentzian proper curvature beta^2/[R*(1-beta^2)] is a different readout, not gravitational curvature.

## Executed actual Earth outputs
v=465.101084897550 m/s; beta=1.5514102255953e-6.
a_rot=0.033915705976977 m/s^2.
kappa_E=3.773631215629065e-19 m^-1 = 6.099150412582611e-54 inverse Planck lengths.
tau_E=2.432387742050018e-13 m^-1 = 3.931358909434973e-48 inverse Planck lengths.
kappa/tau=beta EXACT.
Planck lP=1.6162550244237053e-35 m; tP=5.391246448313604e-44 s; radius=3.946244190191582e41 lP.
Native c=G=hbar=1. G standard uncertainty affects lP, not the SI kinematic values.

## Independent gravity readout and failure
Point-mass gravity GM/R^2 = 9.798285479187299 m/s^2.
Spherical monopole minus rotation = 9.764369773210322 m/s^2, residual to WGS84 normal gravity = -0.015955562689678 m/s^2. FAIL.
J2=-sqrt(5)*Cbar20=0.0010826261738522. First-order quadrupole plus rotation:
gamma_J2=GM/R^2*(1+3*J2/2)-omega^2*R = 9.780281593688288 m/s^2.
Residual to WGS84 theoretical normal gamma_e = -0.000043742211712 m/s^2. PARTIAL, higher harmonics/normal-field structure missing. This is standard multipole gravity, NOT an HsH prediction; normal gamma is derived reference, not an independent observation.

## Runnable concise check
~~~python
import math
R=6378137.0
w=7.292115e-5
c=299792458.0
GM=3.986004418e14
gamma=9.7803253359
Cbar20=-4.84165143790815e-4
beta=R*w/c
b=c/w
kappa=R/(R*R+b*b)
tau=b/(R*R+b*b)
a=w*w*R
J2=-math.sqrt(5)*Cbar20
spherical=GM/R**2-a
quad=GM/R**2*(1+1.5*J2)-a
assert math.isclose(kappa/tau,beta,rel_tol=1e-14)
assert math.isclose(kappa,a/(c*c*(1+beta**2)),rel_tol=1e-14)
assert abs(quad-gamma)<1e-4
print(beta,kappa,tau,a,spherical,quad,quad-gamma)
~~~
Actual executed full Decimal+SymPy script SHA256: e84892672f9a47e55c4cdcd3f19ac56c208585711fe385eefdde257ef22e175c
Actual executed JSON SHA256: 52e6f9dda97026eb67d63cc4975b30bf2efd61aba9f11541a292d4bca805c7c1
Independent Python float check executed: all assertions passed. No Lean execution claimed.

## Gates and handoff
Exact Frenet algebra PASS; dimensions PASS; native/SI PASS; real reference inputs PASS; spherical-gravity approximation FAIL; J2 truncation PARTIAL; no independent HsH Kelvin-vortex/metric/EM response derived; no active CODATA candidate; no BEDROCK promotion.
This is a kinematic real-world map and a controlled gravity-sector comparison, NOT a new empirical theory prediction. Next worker: recover existing medium response before inferring gravity or EM from rotation, and use actual measured Earth/satellite systems for held-out tests.

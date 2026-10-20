# SANDBOXED | Meridian Calculation 001: flat Minkowski rotating-string diameter discriminator
Date: 2026-10-20. Worker: Meridian. Mathematical test, not physical Kerr proof, new SAT law, BEDROCK update, or Nambu-Goto ontology adoption.

## Hypothesis under test

Question from Nathan: If the Kerr-like singular support of the H(s)H model is taken as a physically rotating thread in Minkowski spacetime, must its diameter necessarily oscillate between a minimum and maximum, independent of mass?

Discriminator: rotation *does* produce oscillations of Cartesian coordinates, but it does *not* imply oscillation of the string's full spatial extent. This is an analytic counterexample to the universal inference, not a claim that actual H(s)H finite-core dynamics cannot produce an oscillation. BEDROCK BR-008 requires measuring full geometrical invariants and distinguishing actual physical evolution from coordinates/readouts.

## Exact paired solutions

In Minkowski spacetime eta=diag(-1,+1,+1,+1), c=1, the classical Nambu-Goto equations in temporal conformal gauge are

    X^0=t;  (partial_t^2 - partial_sigma^2) x = 0;
    partial_t x dot partial_sigma x = 0;
    |partial_t x|^2 + |partial_sigma x|^2=1.

Let R>0, string tension T>0, sigma in [0,2*pi*R].

(A) Rotating folded closed string / doubled straight rod:

    X_A=(t, R*cos(t/R)*cos(sigma/R),
             R*sin(t/R)*cos(sigma/R),0).

(B) Pulsating circular closed string:

    X_B=(t, R*cos(t/R)*cos(sigma/R),
             R*cos(t/R)*sin(sigma/R),0).

For each, partial_t^2 x = partial_sigma^2 x = -x/R^2. Both conformal constraints hold exactly, except the induced worldsheet becomes degenerate at isolated fold/collapse configurations; the parametrizations are nevertheless standard ideal string solutions away from these points.

For A, full spatial end-to-end diameter D_A(t)=2R, constant, despite nonzero rotation and transverse oscillation of component coordinates. For B, true diameter D_B(t)=2R*abs(cos(t/R)), falling to zero at collapse; the ideal string treatment needs care at that instant. In gauge X0=t, total energy E=T*integral dsigma=2*pi*T*R, equal in both cases. Angular momentum

    J_z=T*integral (x*partial_t y-y*partial_t x) dsigma

gives J_A=pi*T*R^2 and J_B=0. Thus at R=T=1 both E=6.283185307179586, while J_A=3.141592653589793 and J_B=0.

This is *not* a fixed-(M,J) Kerr minimal pair: it holds the flat background, string action, radius scale, and energy fixed, but varies initial geometry and angular momentum. It suffices to refute a proposed implication that rotation of any relativistic thread necessitates a changing diameter.

## Measurement degeneracy

Fixed x-axis width defined as W_x=max_sigma x-min_sigma x:

    W_x(A,t)=W_x(B,t)=2R*abs(cos(t/R)).

Thus a horizontal projected-width sensor sees exactly the same "diameter oscillation" in (A), which does not change size, as in (B), which really contracts. Additional transverse y-width resolves it:

    W_y(A,t)=2R*abs(sin(t/R));
    W_y(B,t)=2R*abs(cos(t/R)).

Full spatial diameter, worldsheet geometry, and angular momentum also discriminate. This is a concrete BEDROCK BR-008 artifact-vs-geometry control.

An additional gauge trap: parametrizing the *same* static spatial ring at each t by theta=sigma/R+omega*t changes string labels but not its embedded support. The induced 2x2 worldsheet metric has h_tt=-1+(R*omega)^2, h_t_sigma=R*omega, h_sigma_sigma=1 and determinant -1 independent of omega. Under pure Nambu-Goto reparameterization invariance, a tangential relabeling alone has no physical spin current. The unforced constant-radius circular Nambu-Goto string is NOT a stationary solution; this gauge example is only a statement about its geometric set, not physical equilibrium.

## Reproducible Python 3 stdlib verification (executed)

```python
from math import pi,sin,cos,isclose
R=T=1.0
def state(mode,t,s):
    u,v=t/R,s/R
    if mode=='rod':
        x,y=R*cos(u)*cos(v),R*sin(u)*cos(v)
        xt,yt=-sin(u)*cos(v),cos(u)*cos(v)
        xs,ys=-cos(u)*sin(v),-sin(u)*sin(v)
    else:
        x,y=R*cos(u)*cos(v),R*cos(u)*sin(v)
        xt,yt=-sin(u)*cos(v),-sin(u)*sin(v)
        xs,ys=-cos(u)*sin(v),cos(u)*cos(v)
    return (x,y),(xt,yt),(xs,ys)
def quad(f,a,b,N=1000):
    h=(b-a)/N
    return h*(.5*f(a)+sum(f(a+i*h) for i in range(1,N))+.5*f(b))
for mode in ('rod','loop'):
    error=0.
    for t in (0.,.15,.9,1.7,3.15,6.1):
        for s in (0.,.12,.8,2.1,4.5,6.28):
            p,vt,vs=state(mode,t,s)
            dot=vt[0]*vs[0]+vt[1]*vs[1]
            norm=vt[0]**2+vt[1]**2+vs[0]**2+vs[1]**2-1
            error=max(error,abs(dot),abs(norm))
            h=.001
            pp=state(mode,t+h,s)[0]
            pm=state(mode,t-h,s)[0]
            sp=state(mode,t,s+h)[0]
            sm=state(mode,t,s-h)[0]
            for i in (0,1):
                wave=(pp[i]-2*p[i]+pm[i]-sp[i]+2*p[i]-sm[i])/h**2
                error=max(error,abs(wave))
    assert error<2e-9
    js=[]
    for t in (0.,.3,.9,2.):
        def angular(s):
            p,vt,_=state(mode,t,s)
            return p[0]*vt[1]-p[1]*vt[0]
        js.append(T*quad(angular,0.,2*pi*R))
    target=pi*T*R**2 if mode=='rod' else 0.
    assert max(abs(j-target) for j in js)<1e-12
    assert isclose(2*pi*T*R,2*pi)
    print(mode,'E',2*pi*T*R,'J',js[0],'wave error',error)
for omega in (0.,.2,.6,1.2):
    h_tt=-1+(R*omega)**2
    h_ts=R*omega
    assert abs(h_tt-h_ts*h_ts+1)<1e-12
print('ALL CHECKS PASSED')
```

Executed control outputs:
    rod E 6.283185307179586 J 3.141592653589793 wave/constraint error 2.220446049250313e-10
    loop E 6.283185307179586 J 0.0 wave/constraint error 2.220446049250313e-10
    ALL CHECKS PASSED

Additional executed NumPy/Matplotlib check: 181 x 1201 point grid, independent finite difference wave errors rod 3.331e-10, loop 4.441e-10, J integration error <=8.88e-16, three script-rendered precision plots and geometry views. Full conversation-local program: `meridian_minkowski_string_control.py`, SHA-256 `770f5c5c4815a82a33fd58b96ec1d3a5d2454b4281afbf0ca4f6cced92de2eef`. The script itself is a conversation attachment; this report contains the independent full stdlib reproducibility check, not an assertion that the image files are committed to the repo.

## Known literature and limits

Known classical pair: Malcolm Anderson, *The Mathematical Theory of Cosmic Strings* (IOP, 2003), sections 4.2.1-4.2.2, pulsating circular loop eq. (4.22), doubled rotating rod eq. (4.24). https://www.nzdr.ru/data/media/biblio/kolxoz/P/PC/PCft/Anderson%20M.R.%20The%20mathematical%20theory%20of%20cosmic%20strings%20%28IOP%2C%202003%29%28393s%29.pdf

Specific Kerr-as-string *prior art*, separate from ordinary Kerr solution: Alexander Burinskii, "Orientifold D-string in the source of the Kerr spinning particle," Phys. Rev. D 68 (2003) 105004 https://doi.org/10.1103/PhysRevD.68.105004 ; "Twistorial analyticity and three stringy systems of the Kerr spinning particle," Phys. Rev. D 70 (2004) 086006 https://doi.org/10.1103/PhysRevD.70.086006. Models of a Kerr circular string with electromagnetic traveling excitations do exist in mathematical-physics literature, but are not established literal identity of the classical singularity. These literature sources were used only for prior-art comparison after the controlling SAT BEDROCK review. No restricted Hypothesis H/Schreiber source consulted.

Standard stationary Kerr in Kerr-Schild coordinates has a singular support at x^2+y^2=a^2,z=0 and a=J/(Mc) fixed when M,J fixed. Kerr-Schild auxiliary Minkowski background does not make the full physical curved Kerr metric flat. For H(s)H Kerr-like finite-core oscillation, specify worldtube core/shell, intrinsic diameter observable, full time-dependent geometry, actual stress-energy and Einstein/dynamical equations, and initial/boundary data. Compare traveling vs standing modes and slice-induced variation. The Nambu-Goto test alone does not establish a physical Kerr diameter pulse, nor exclude one under additional geometric constraints.

**Verdict:** Minkowski rotation guarantees oscillatory transverse Cartesian components in circular kinematics, NOT a periodic change in the intrinsic diameter of every rotating structure. Exact independent calculation; physical Kerr/SAT identification remains OPEN/TENTATIVE.

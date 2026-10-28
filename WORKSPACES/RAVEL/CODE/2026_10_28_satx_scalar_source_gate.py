import sympy as s
th, mu = s.symbols('theta mu', real=True)
# Historical source: L = +1/2 (partial theta)^2 - mu^2*cos(3 theta).
Lpot = -mu**2*s.cos(3*th)
V_from_L = -Lpot
printed_V = -mu**2*s.cos(3*th) # historical SAT Full Revamp interpretation
source_EL = s.diff(Lpot,th) # dL/dtheta, Euler-Lagrange: Box theta - dL/dtheta = 0
canonical_EL_nonderivative = -source_EL
satx_printed_term = mu**2*s.sin(3*th)
assert s.simplify(source_EL-3*mu**2*s.sin(3*th)) == 0
assert s.simplify(canonical_EL_nonderivative+3*mu**2*s.sin(3*th)) == 0
assert s.simplify(V_from_L+printed_V) == 0
assert s.simplify(V_from_L.subs(th,0)-mu**2) == 0
assert s.simplify(V_from_L.subs(th,s.pi/3)+mu**2) == 0
assert s.simplify(s.diff(V_from_L,th,2).subs(th,0)+9*mu**2) == 0
assert s.simplify(s.diff(V_from_L,th,2).subs(th,s.pi/3)-9*mu**2) == 0
print('SOURCE-BASED SYMBOLIC CHECK PASS')
print('L potential term:', Lpot)
print('V inferred under L=T-V:', V_from_L)
print('V printed in Full Revamp:', printed_V)
print('dL/dtheta:', source_EL)
print('E-L potential contribution Box theta - dL/dtheta:', canonical_EL_nonderivative)
print('SATx printed E-L term:', satx_printed_term)
print('V(0):', V_from_L.subs(th,0))
print('V(pi/3):', V_from_L.subs(th,s.pi/3))
print('V second derivative at 0:', s.diff(V_from_L,th,2).subs(th,0))
print('V second derivative at pi/3:', s.diff(V_from_L,th,2).subs(th,s.pi/3))
# A second source-translation gate: the claimed identification theta ~ theta+2*pi/3
# is not respected by m(theta) proportional to sin(theta)^2.
mshape=s.sin(th)**2
assert s.simplify(mshape.subs(th,0)) == 0
assert s.simplify(mshape.subs(th,2*s.pi/3)-s.Rational(3,4)) == 0
assert s.simplify(s.cos(3*(th+2*s.pi/3))-s.cos(3*th)) == 0
print('mass-shape(0):',mshape.subs(th,0))
print('mass-shape(2*pi/3):',s.simplify(mshape.subs(th,2*s.pi/3)))
print('cos(3theta) is 2*pi/3-periodic: PASS')
print('sin(theta)^2 is 2*pi/3-periodic: FAIL (exact counterexample)')

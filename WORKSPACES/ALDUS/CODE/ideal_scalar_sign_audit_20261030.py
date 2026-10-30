#!/usr/bin/env python3
"""Exact symbolic source-consistency audit; no empirical or fitted parameters."""
import sympy as s

a, f, v, q, mu, theta = s.symbols('a f v q mu theta', positive=True, real=True)
pi = s.symbols('pi', real=True)
V = mu**4*(1-s.cos(theta))
L_source = s.expand(a**3*(f**2/2*(-v**2+q/a**2)-V))
p_source = s.diff(L_source, v)
H_source_v = s.expand(p_source*v-L_source)
H_source_pi = s.simplify(H_source_v.subs(v,s.solve(s.Eq(pi,p_source),v)[0]))
p_printed = a**3*f**2*v
H_printed = pi**2/(2*a**3*f**2) + a*f**2*q/2 + a**3*V
L_repaired = s.expand(a**3*(-f**2/2*(-v**2+q/a**2)-V))
p_repaired = s.diff(L_repaired,v)
H_repaired_pi = s.simplify((p_repaired*v-L_repaired).subs(v,s.solve(s.Eq(pi,p_repaired),v)[0]))
checks = {
  'source_momentum_minus_printed': s.simplify(p_source + p_printed)==0,
  'source_H_kinetic_opposite_printed': s.simplify(H_source_pi - (a**3*V-(H_printed-a**3*V)))==0,
  'repaired_momentum_matches_printed': s.simplify(p_repaired-p_printed)==0,
  'repaired_H_matches_printed': s.simplify(H_repaired_pi-H_printed)==0,
}
for name,val in checks.items(): print(f'{name}: {val}')
print('L_source=',L_source)
print('p_source=',p_source)
print('H_source_pi=',H_source_pi)
print('p_repaired=',p_repaired)
print('H_repaired_pi=',H_repaired_pi)
assert all(checks.values())

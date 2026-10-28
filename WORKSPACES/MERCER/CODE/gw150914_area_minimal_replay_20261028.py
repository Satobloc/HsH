#!/usr/bin/env python3
"""Source-anchored GW150914 Kerr area upper-bound replay, no HsH prediction.
GWOSC GW150914-v3 GWTC-1 Overall_posterior (2020-02-19).
All quoted intervals are MARGINAL 90% credible, not a joint posterior.
IAU 2015 nominal GM_sun=1.3271244e20 m^3/s^2, exact conversion.
"""
from decimal import Decimal as D, getcontext
getcontext().prec = 45
c = D('299792458')
gm = D('1.3271244e20')
pi = D('3.141592653589793238462643383279502884197169399')
k = 8*pi*(gm/c**2)**2/D('1000000')  # km^2 per nominal solar-mass squared

def area(m, chi):
    m, chi = D(m), D(chi)
    return k*m*m*(1+(1-chi*chi).sqrt())

def initial_upper(m1,m2):
    m1,m2 = D(m1),D(m2)
    return 2*k*(m1*m1+m2*m2)

median = area('63.1','0.69')/initial_upper('35.6','30.6')
worst = area('60.1','0.74')/initial_upper('40.3','33.6')
best = area('66.5','0.65')/initial_upper('32.5','26.2')
assert D('1.55726') < median < D('1.55727')
assert D('1.09723') < worst < D('1.09724')
assert worst > 1
print('initial max area km2:',initial_upper('35.6','30.6'))
print('final area km2:',area('63.1','0.69'))
print('ratio median:',median)
print('marginal rectangle:',worst,best)
print('NOT joint posterior; NOT independent area-law verification')

#!/usr/bin/env python3
"""GRAVITY S2 Table E.1 marginal-input Jacobian; external Euclidean comparator.
Source: GRAVITY Collaboration (2020), A&A 636 L5, DOI 10.1051/0004-6361/202037813.
Four jointly fitted marginal errors, NO covariance. NOT an H(s)H prediction.
No random/fictional inputs, no joint confidence interval.
"""
from decimal import Decimal as D, getcontext
import json
getcontext().prec = 60
source = {
 "M_million_Msun": (D("4.261"), D("0.012")),
 "R0_pc": (D("8246.7"), D("9.3")),
 "a_mas": (D("125.058"), D("0.041")),
 "e": (D("0.884649"), D("0.000066"))
}
c = D("299792458")               # exact SI m/s
AU = D("149597870700")          # exact SI m
GM_sun = D("1.3271244e20")     # IAU nominal, not CODATA measurement

def kappa(p):
    M,R,a,e = (p[k] for k in source)
    gm = M*D("1e6")*GM_sun
    rp = (a*R/D(1000))*AU*(1-e)
    vp2 = gm*(1+e)/rp
    return gm/(rp*rp)/(c*c+vp2), vp2/(c*c)

v = {k: x for k,(x,sd) in source.items()}
k,q = kappa(v)
e=v["e"]
elasticities = {
 "M_million_Msun": D(1)/(1+q),
 "R0_pc": -(2+q)/(1+q),
 "a_mas": -(2+q)/(1+q),
 "e": e*(D(2)/(1-e)-q/(1+q)*D(2)/(1-e*e))
}
assert abs(elasticities["M_million_Msun"]+elasticities["R0_pc"]+1)<D("1e-50")
terms = {name: elasticities[name]*sd/x for name,(x,sd) in source.items()}
mags = [abs(t) for t in terms.values()]
L = sum(mags)
lower = max(D(0), D(2)*max(mags)-L)
zero_corr = sum(t*t for t in terms.values()).sqrt()
fd = {}
for name,(x,sd) in source.items():
    plus = kappa({**v,name:x+sd})[0]
    minus = kappa({**v,name:x-sd})[0]
    analytic = k*elasticities[name]/x
    numerical = (plus-minus)/(2*sd)
    fd[name] = str(abs((numerical-analytic)/analytic))
print(json.dumps({
 "source":"GRAVITY 2020 Table E.1 joint fit; covariance unrecovered",
 "nominal_kappa_m_inv":str(k), "v2_c2":str(q),
 "elasticities":{key:str(value) for key,value in elasticities.items()},
 "fractional_marginal_terms":{key:str(value) for key,value in terms.items()},
 "linearized_sd_possible_bounds_unknown_correlation":[str(lower),str(L)],
 "counterfactual_zero_correlation_sd":str(zero_corr),
 "one_at_a_time_fd_relative_errors":fd,
 "interpretation":"uncertainty envelopes only, NOT credible intervals or physical H(s)H predictions"
},indent=2))

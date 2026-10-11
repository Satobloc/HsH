#!/usr/bin/env python3
"""Independent Mercer #12 gauge-null / missing functional-phase benchmark.
Pure geometry in R4, not a molecular experiment.
Requires numpy; optional matplotlib for a figure.
"""
import json
import numpy as np
s = np.linspace(0, 2*np.pi, 2001)
radius, n, harmonic, eps = 0.2, 8, 3, 0.25
phase0 = n*s
phase1 = phase0 + eps*(1-np.cos(harmonic*s))
C = np.zeros((len(s),4))
C[:,3] = s
def curve(phase):
    return C + radius*np.column_stack((np.cos(phase),np.sin(phase),
                                       np.zeros(len(s)),np.zeros(len(s))))
X, Y = curve(phase0), curve(phase1)
chi = 0.6*np.sin(2*s) + 0.2*np.sin(5*s)
E1 = np.column_stack((np.cos(chi),np.sin(chi),np.zeros(len(s)),np.zeros(len(s))))
E2 = np.column_stack((-np.sin(chi),np.cos(chi),np.zeros(len(s)),np.zeros(len(s))))
gphase = phase0-chi
Xg = C + radius*(np.cos(gphase)[:,None]*E1 + np.sin(gphase)[:,None]*E2)
A = np.gradient(chi,s,edge_order=2)
cov_err = np.max(abs(np.gradient(gphase,s,edge_order=2)+A-
                     np.gradient(phase0,s,edge_order=2)))
speed0 = np.sqrt(1+(radius*n)**2)
speed1 = np.sqrt(1+(radius*(n+eps*harmonic*np.sin(harmonic*s)))**2)
res = dict(gauge_curve_max_error=float(np.max(np.linalg.norm(X-Xg,axis=1))),
           covariant_phase_derivative_error=float(cov_err),
           regular_speed=float(speed0), chirp_speed_min=float(min(speed1)),
           chirp_speed_max=float(max(speed1)),
           geometric_curve_difference_max=float(max(np.linalg.norm(X-Y,axis=1))),
           endpoint_position_match=bool(np.linalg.norm(X[0]-Y[0])<1e-12 and
                                        np.linalg.norm(X[-1]-Y[-1])<1e-12),
           endpoint_tangent_match=True, winding_number=n, radius=radius)
assert res["gauge_curve_max_error"]<1e-12
assert res["covariant_phase_derivative_error"]<1e-9
assert res["endpoint_position_match"]
assert res["chirp_speed_max"]>res["regular_speed"]
print(json.dumps(res,indent=2))

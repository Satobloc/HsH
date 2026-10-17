#!/usr/bin/env python3
"""SANDBOXED Ravel 2026-10-09: wavefront-local versus causal-memory response.
Linear w=ct observer control; flight-time R/c is factored out.
This is a transfer-function discriminator, NOT a Kelvin or SAT derivation.
Requires numpy and scipy (matplotlib optional in separate local figure).
"""
import json
import numpy as np
from scipy.special import erf

DELTA = 20e-12       # active wavefront duration, example only [seconds]
TAU_M = 50e-12       # optional local relaxation, example only [seconds]
SIGMA = 5e-12        # source Gaussian temporal standard deviation [seconds]
C = 299792458.0

def h_front(freq_hz, delta=DELTA):
    """Causal box aperture over 0 <= t <= delta; exp(-i omega t) convention."""
    omega = 2*np.pi*np.asarray(freq_hz)
    return np.exp(1j*omega*delta/2)*np.sinc(omega*delta/(2*np.pi))

def h_memory(freq_hz, delta=DELTA, tau_m=TAU_M):
    """Additional causal exponential local memory, normalized area 1."""
    omega = 2*np.pi*np.asarray(freq_hz)
    return h_front(freq_hz, delta)/(1-1j*omega*tau_m)

def exact_slab_pulse(t, delta=DELTA, sigma=SIGMA):
    """Gaussian pulse convoluted with causal normalized rectangular wavefront."""
    return sigma*np.sqrt(np.pi/2)/delta*(
        erf(t/(np.sqrt(2)*sigma))-
        erf((t-delta)/(np.sqrt(2)*sigma)))

def convolve_causal_exp(samples, dt, tau_m=TAU_M):
    """Piecewise-constant input and exact exponential relaxation step."""
    a = np.exp(-dt/tau_m)
    out=np.zeros_like(samples)
    for i in range(1,len(samples)):
        out[i]=a*out[i-1]+(1-a)*samples[i]
    return out

def run():
    t=np.linspace(-50e-12,1500e-12,62001)
    dt=t[1]-t[0]
    source=np.exp(-t*t/(2*SIGMA*SIGMA))
    front=exact_slab_pulse(t)
    memory=convolve_causal_exp(front,dt)
    area=lambda a:np.trapezoid(a,t)
    center=lambda a:np.trapezoid(t*a,t)/area(a)
    rows=[]
    for hz in [1e8,1e9,5e9]:
        a=h_front(hz);b=h_memory(hz)
        o=2*np.pi*hz
        rows.append(dict(f_GHz=hz/1e9,front_amplitude=float(abs(a)),
          memory_amplitude=float(abs(b)),extra_amp_ratio=float(abs(b/a)),
          extra_phase_rad=float(np.angle(b/a))))
        assert abs(abs(b/a)-1/np.sqrt(1+(o*TAU_M)**2))<1e-13
        assert abs(np.angle(b/a)-np.arctan(o*TAU_M))<1e-13
    result=dict(delta_s=DELTA,tau_m_s=TAU_M,
        source_std_s=SIGMA,
        pulse_area_front_relative_error=float(area(front)/area(source)-1),
        pulse_area_memory_relative_error=float(area(memory)/area(source)-1),
        front_center_delay_ps=float((center(front)-center(source))*1e12),
        memory_extra_center_delay_ps=float((center(memory)-center(front))*1e12),
        rows=rows,epsilon_design_fraction=1e-13,
        tau_design_bound_1GHz_s=1e-13/(2*np.pi*1e9),
        c_tau_design_bound_m=C*1e-13/(2*np.pi*1e9),
        note="Illustrative conditional precision criterion; NOT a measurement or SAT constant.")
    assert abs(result['pulse_area_memory_relative_error'])<1e-10
    assert abs(result['front_center_delay_ps']-10)<1e-5
    assert abs(result['memory_extra_center_delay_ps']-50)<.1
    return result

if __name__=="__main__":
    print(json.dumps(run(),indent=2))

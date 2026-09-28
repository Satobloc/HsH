"""Current STORYO/SAT-H(s)H geometry engine.

Geometry/rendering machinery only; not a physical claim.
"""
from __future__ import annotations
import numpy as np

EPS = 1e-12

def normalize(v):
    v = np.asarray(v, dtype=float)
    n = np.linalg.norm(v)
    return v/n if n > EPS else np.zeros_like(v)

def cumulative_arclength(P):
    P = np.asarray(P, dtype=float)
    d = np.linalg.norm(np.diff(P, axis=0), axis=1)
    return np.concatenate([[0.0], np.cumsum(d)])

def resample_by_arclength(P, n):
    P = np.asarray(P, dtype=float)
    s = cumulative_arclength(P)
    t = np.linspace(0.0, s[-1], int(n))
    return np.column_stack([np.interp(t, s, P[:, i]) for i in range(3)])

def tangents(P):
    P = np.asarray(P, dtype=float)
    T = np.empty_like(P)
    T[1:-1] = P[2:] - P[:-2]
    T[0] = P[1] - P[0]
    T[-1] = P[-1] - P[-2]
    T /= np.linalg.norm(T, axis=1, keepdims=True)
    return T

def rodrigues(axis, angle):
    axis = normalize(axis)
    x,y,z = axis
    c,s = np.cos(angle), np.sin(angle)
    C = 1-c
    return np.array([
        [c+x*x*C, x*y*C-z*s, x*z*C+y*s],
        [y*x*C+z*s, c+y*y*C, y*z*C-x*s],
        [z*x*C-y*s, z*y*C+x*s, c+z*z*C]
    ])

def initial_normal(t):
    axes = np.eye(3)
    ref = axes[np.argmin(np.abs(axes @ t))]
    return normalize(ref - np.dot(ref,t)*t)

def parallel_transport_frame(P):
    T = tangents(P)
    N1 = np.zeros_like(P)
    N2 = np.zeros_like(P)
    N1[0] = initial_normal(T[0])
    N2[0] = normalize(np.cross(T[0], N1[0]))
    for i in range(1, len(P)):
        t0,t1 = T[i-1],T[i]
        c = np.cross(t0,t1)
        sn = np.linalg.norm(c)
        cs = np.clip(np.dot(t0,t1),-1,1)
        if sn < 1e-10:
            n = N1[i-1].copy()
        else:
            n = rodrigues(c/sn, np.arctan2(sn,cs)) @ N1[i-1]
        n = normalize(n - np.dot(n,t1)*t1)
        N1[i] = n
        N2[i] = normalize(np.cross(t1,n))
    return T,N1,N2

def smoothstep(x):
    x = np.clip(x,0,1)
    return x*x*(3-2*x)

def localized_phase(u,start=.30,end=.74,turns=4.0,phase0=0.0):
    q=(u-start)/(end-start)
    f=smoothstep(q)
    f=np.where(u<=start,0.0,f)
    f=np.where(u>=end,1.0,f)
    return phase0 + 2*np.pi*turns*f

def wrap_curve(spine, turns, radius, phase0=0.0):
    spine = np.asarray(spine,dtype=float)
    _,N1,N2 = parallel_transport_frame(spine)
    s = cumulative_arclength(spine)
    u = s/s[-1]
    phi = phase0 + 2*np.pi*turns*u
    return spine + radius*(N1*np.cos(phi)[:,None] + N2*np.sin(phi)[:,None])

def nested_wrap(backbone, macro_turns=150, macro_radius=.20,
                micro_ratio=10, micro_radius=.017):
    macro = wrap_curve(backbone, macro_turns, macro_radius)
    macro = resample_by_arclength(macro, max(40000, int(macro_turns*500)))
    micro = wrap_curve(macro, macro_turns*micro_ratio, micro_radius)
    return macro,micro

def path_metrics(backbone, macro=None, micro=None):
    out={"backbone":cumulative_arclength(backbone)[-1]}
    if macro is not None:
        out["macro"]=cumulative_arclength(macro)[-1]
        out["macro/backbone"]=out["macro"]/out["backbone"]
    if micro is not None:
        out["micro"]=cumulative_arclength(micro)[-1]
        out["micro/backbone"]=out["micro"]/out["backbone"]
        if macro is not None:
            out["micro/macro"]=out["micro"]/out["macro"]
    return out

def same_c_advance_fraction(parent, child):
    return cumulative_arclength(parent)[-1] / cumulative_arclength(child)[-1]

def solve_turns_for_length_ratio(backbone, radius, target_ratio,
                                 lo=1.0, hi=10000.0, iterations=40):
    Lb = cumulative_arclength(backbone)[-1]
    def ratio(turns):
        n=int(max(30000,turns*350))
        b=resample_by_arclength(backbone,n)
        h=wrap_curve(b,turns,radius)
        return cumulative_arclength(h)[-1]/Lb
    for _ in range(iterations):
        mid=.5*(lo+hi)
        if ratio(mid) < target_ratio: lo=mid
        else: hi=mid
    turns=.5*(lo+hi)
    return turns,ratio(turns)

#!/usr/bin/env python3
"""SANDBOXED (2026-10-10): mathematical audit of new CONVOS_22 NotebookLM
'ONE DROP UNIVERSE', indices 450,456,468,474. Not an SAT-derived force law.
Requirements: scipy, sympy.
"""
from math import sqrt, sin, asin, pi
from scipy.integrate import quad
import sympy as sp

def equilateral_surface_intersections(radius=1., spacing=1.):
    """Three equal sphere *surfaces* centered at an equilateral triangle."""
    if spacing > sqrt(3)*radius:
        return ()
    height = sqrt(max(0., radius**2-spacing**2/3))
    return ((0.,0.,height),(0.,0.,-height)) if height else ((0.,0.,0.),)

def triple_disk_area(section_radius,spacing):
    """Exact area of intersection of 3 filled 2D disks, equilateral centers."""
    s,d=section_radius,spacing
    if s <= d/sqrt(3): return 0.
    v=sqrt(s*s-d*d/4)-d/(2*sqrt(3))
    theta=2*asin(min(1.,sqrt(3)*v/(2*s)))
    return 3*sqrt(3)*v*v/4 + 1.5*s*s*(theta-sin(theta))

def triple_ball_volume(radius,spacing):
    """Integrate exact 3-disk common area through the 3D normal coordinate."""
    R,d=radius,spacing
    if d>=sqrt(3)*R:return 0.
    zmax=sqrt(R*R-d*d/3)
    return 2*quad(lambda z:triple_disk_area(sqrt(R*R-z*z),d),
                  0,zmax,epsabs=2e-11,epsrel=1e-11)[0]

def pair_ball_volume(radius,spacing):
    R,d=radius,spacing
    return 0. if d>=2*R else pi*(4*R+d)*(2*R-d)**2/12

def shared_vertex_graph_laplacian():
    """Two triangular unit-stiffness spring graphs sharing one node have 5 DOFs."""
    L=sp.zeros(5)
    for i,j in [(0,1),(1,2),(2,0),(0,3),(3,4),(4,0)]:
        L[i,i]+=1;L[j,j]+=1;L[i,j]-=1;L[j,i]-=1
    return L

def he3_from_written_formula(coupling_denominator):
    """Evaluate exactly the NotebookLM formulas, without claimed intermediates."""
    raw_unitless=0.078*0.22*pi/coupling_denominator
    scale=939/0.0974
    return dict(raw_unitless=raw_unitless,raw_MeV=raw_unitless*scale,
                phase_corrected_MeV=raw_unitless*scale*0.246)

def gates():
    d3=sqrt(3)          # THREE equilateral centers, nonzero V3 below
    d4=sqrt(8/3)        # FOUR regular tetrahedral centers, nonzero V4 below
    return dict(triple=d3,tetrahedron=d4,
                illustrative_spacing=1.68,
                triple_vol_at_1p68=triple_ball_volume(1.,1.68),
                tetra_volume_at_1p68=0.)

if __name__=="__main__":
    L=shared_vertex_graph_laplacian()
    assert L.eigenvals()=={sp.Integer(0):1,sp.Integer(1):1,sp.Integer(3):2,sp.Integer(5):1}
    assert abs(triple_disk_area(1,1)-(pi-sqrt(3))/2)<1e-12
    assert abs(triple_ball_volume(1,0)-4*pi/3)<1e-10
    assert abs(triple_ball_volume(1,1)-.6718303352064228)<1e-10
    assert gates()['tetrahedron']<1.68<gates()['triple']
    assert abs(he3_from_written_formula(96)['phase_corrected_MeV']-1.3317958757640511)<1e-10
    print('THREE SURFACE POINTS:', equilateral_surface_intersections(1,1))
    print('GRAPH:',list(L.eigenvals().keys()),'n=5')
    print('PAIR VOLUME:',pair_ball_volume(1,1))
    print('TRIPLE VOLUME:',triple_ball_volume(1,1))
    print('ACCESSIBILITY GATES:',gates())
    for den in (144,96): print('He-3 gamma=1/%s'%den,he3_from_written_formula(den))
    print('PASS: arithmetic and geometry in explicitly assumed toy models')

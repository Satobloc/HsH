"""Companion exact SO(4) Universal Indicatrix lift for a 3D body-sphere curve.

This module is deliberately *not* conflated with the 3D physical rolling setup.
It preserves the four-dimensional representation and six rotational planes;
connecting its full geometry to rigid-ball toroidal contact is future work.
"""
from __future__ import annotations
import numpy as np
from scipy.linalg import expm

PLANES=((0,1),(0,2),(0,3),(1,2),(1,3),(2,3))

def so4_generator(angles:np.ndarray)->np.ndarray:
    a=np.asarray(angles,float)
    if a.shape!=(6,):raise ValueError('Exactly six SO(4) plane coefficients required')
    K=np.zeros((4,4))
    for theta,(i,j) in zip(a,PLANES):K[i,j]=-theta;K[j,i]=theta
    return K

def six_plane_rotation(angles:np.ndarray)->np.ndarray:
    """Matrix exponential of a general six-plane antisymmetric generator."""
    return expm(so4_generator(angles))

def indicatrix(initial:np.ndarray,radii:np.ndarray,angles:np.ndarray):
    """y(s)=r(s)R(s)x0; output points and orientation histories."""
    initial=np.asarray(initial,float)
    radius=np.asarray(radii,float)
    angles=np.asarray(angles,float)
    if initial.shape!=(4,) or angles.shape!=(len(radius),6):raise ValueError('Invalid shapes')
    if abs(np.linalg.norm(initial)-1)>1e-9:raise ValueError('x0 must be unit length')
    matrices=np.stack([six_plane_rotation(a) for a in angles])
    return radius[:,None]*np.einsum('nij,j->ni',matrices,initial),matrices

def lift_sphere_curve(curve3:np.ndarray,rotation_angles:np.ndarray | None=None):
    """Keep each input S² curve as an equatorial embedding in S³, then rotate in SO(4)."""
    C=np.asarray(curve3,float)
    rr=np.linalg.norm(C,axis=1)
    if np.any(rr<=0):raise ValueError('Zero body input')
    unit3=C/rr[:,None]
    base=np.column_stack([unit3,np.zeros(len(C))])
    if rotation_angles is None:rotation_angles=np.zeros((len(C),6))
    mats=np.stack([six_plane_rotation(a) for a in np.asarray(rotation_angles,float)])
    P=rr[:,None]*np.einsum('nij,nj->ni',mats,base)
    return P,mats

if __name__=='__main__':
    s=np.linspace(0,2*np.pi,101)
    angles=np.column_stack([2*s,3*s,np.zeros((len(s),4))])
    pts,mats=indicatrix(np.array([1.,0,0,0]),np.ones(len(s)),angles)
    print('max orthogonality residual:',np.max(abs(np.swapaxes(mats,1,2)@mats-np.eye(4))))
    print('norm residual:',np.max(abs(np.linalg.norm(pts,axis=1)-1)))

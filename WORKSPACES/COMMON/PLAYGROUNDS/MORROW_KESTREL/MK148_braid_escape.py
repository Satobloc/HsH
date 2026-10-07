#!/usr/bin/env python3
"""MK148 reproducible topology checks. SANDBOXED, not a physical dynamics model.
Requires numpy. Two-particle based nullhomotopy and framed-ribbon Gauss integrals.
"""
import numpy as np

def braid(s,u):
    s,u=np.broadcast_arrays(np.asarray(s,float),np.asarray(u,float))
    v=np.stack(((1-u)*np.cos(2*np.pi*s)+u,
                (1-u)*np.sin(2*np.pi*s),
                np.sin(np.pi*u)*np.sin(np.pi*s)**2),axis=-1)
    return v/np.linalg.norm(v,axis=-1,keepdims=True)

def torus(t,r=.8):
    p,q=2,3
    rho=2+r*np.cos(q*t)
    drho=-r*q*np.sin(q*t)
    x=np.stack((rho*np.cos(p*t),rho*np.sin(p*t),r*np.sin(q*t)),axis=-1)
    dx=np.stack((drho*np.cos(p*t)-p*rho*np.sin(p*t),
                 drho*np.sin(p*t)+p*rho*np.cos(p*t),
                 r*q*np.cos(q*t)),axis=-1)
    n=np.stack((np.cos(q*t)*np.cos(p*t),
                np.cos(q*t)*np.sin(p*t),np.sin(q*t)),axis=-1)
    dn=np.stack((-q*np.sin(q*t)*np.cos(p*t)-p*np.cos(q*t)*np.sin(p*t),
                 -q*np.sin(q*t)*np.sin(p*t)+p*np.cos(q*t)*np.cos(p*t),
                 q*np.cos(q*t)),axis=-1)
    return x,dx,n,dn

def gauss(x,dx,y,dy,same=False):
    N=len(x)
    D=x[:,None,:]-y[None,:,:]
    cross=np.cross(dx[:,None,:],dy[None,:,:])
    dist=np.linalg.norm(D,axis=-1)
    if same:np.fill_diagonal(dist,np.inf)
    return np.sum(np.einsum('ijk,ijk->ij',cross,D)/dist**3)*(2*np.pi/N)**2/(4*np.pi)

def test_braid():
    S,U=np.meshgrid(np.linspace(0,1,1001),np.linspace(0,1,401))
    Q=braid(S,U)
    assert np.max(np.abs(np.linalg.norm(Q,axis=-1)-1))<1e-12
    assert np.max(np.abs(Q[:,0,:]-[1,0,0]))<1e-12
    assert np.max(np.abs(Q[:,-1,:]-[1,0,0]))<1e-12
    assert np.max(np.abs(Q[-1,:,:]-[1,0,0]))<1e-12
    for u in [0,.25,.49,.51,.75,1]:
        q=braid(np.linspace(0,1,2001),u)
        angle=np.unwrap(np.arctan2(q[:,1],q[:,0]))
        winding=(angle[-1]-angle[0])/(2*np.pi)
        print(f'braid u={u:.2f}, planar projected winding={winding:.8f}')
    print('braid min separation / d=',np.linalg.norm(Q,axis=-1).min())

def test_ribbon(N=1200,r=.8):
    t=np.arange(N)*2*np.pi/N
    x,dx,n,dn=torus(t,r)
    y=x+.12*n
    dy=dx+.12*dn
    link=gauss(x,dx,y,dy)
    writhe=gauss(x,dx,x,dx,same=True)
    T=dx/np.linalg.norm(dx,axis=-1)[:,None]
    twist=np.sum(np.einsum('ij,ij->i',np.cross(T,n),dn))/N
    print(f'r={r:.3f}, N={N}: Lk={link:.10f}, Tw={twist:.10f}, Wr={writhe:.10f}, Tw+Wr={twist+writhe:.10f}')
    print('link residual',link-twist-writhe)
    return link,twist,writhe

if __name__=='__main__':
    test_braid()
    for r in [.25,.5,.8,1.]:
        test_ribbon(1200,r)

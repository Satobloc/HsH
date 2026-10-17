#!/usr/bin/env python3
"""Whirligig R/Q general-input geometric engine (SANDBOXED).

Implements an explicitly documented engineering reconstruction of the historical
Great Annulum / rolling sphere / dual gimbal / Wiggle-Wobble connector /
Curvy_Lisa first-forward-torus-intersection machine.

The historical Great Annulum's 'self-intersection' and 'self-tangent' do not
uniquely specify a mathematical curve. This implementation makes an explicit,
testable great-circle choice. It does NOT assert a GR-QM isomorphism.
"""
from __future__ import annotations

import argparse
import ast
import csv
from dataclasses import dataclass, asdict, replace
import json
import math
from pathlib import Path
from typing import Any
import warnings

import numpy as np
from scipy.integrate import solve_ivp
from scipy.interpolate import CubicSpline
from scipy.spatial.transform import Rotation
from skimage.measure import find_contours

TAU = 2 * np.pi
EPS = 1e-12
ALLOWED_FUNCS = {
    'sin': np.sin, 'cos': np.cos, 'tan': np.tan,
    'arcsin': np.arcsin, 'arccos': np.arccos, 'arctan': np.arctan,
    'atan2': np.arctan2, 'sqrt': np.sqrt, 'exp': np.exp,
    'log': np.log, 'log1p': np.log1p, 'abs': np.abs,
    'sinh': np.sinh, 'cosh': np.cosh, 'tanh': np.tanh,
    'minimum': np.minimum, 'maximum': np.maximum,
}

class EquationError(ValueError):
    pass


def eval_expression(expression: str, **variables: Any) -> np.ndarray:
    """AST-restricted numeric evaluation. No eval(), attribute access, files or imports."""
    try:
        tree = ast.parse(expression.replace('^', '**'), mode='eval')
    except SyntaxError as e:
        raise EquationError(str(e)) from e
    symbols: dict[str, Any] = {'pi': math.pi, 'e': math.e, **variables}

    def read(node):
        if isinstance(node, ast.Expression):
            return read(node.body)
        if isinstance(node, ast.Constant) and type(node.value) in (float, int):
            return float(node.value)
        if isinstance(node, ast.Name):
            if node.id not in symbols:
                raise EquationError(f'Unknown variable: {node.id}')
            return symbols[node.id]
        if isinstance(node, ast.UnaryOp) and isinstance(node.op, (ast.UAdd, ast.USub)):
            x = read(node.operand)
            return +x if isinstance(node.op, ast.UAdd) else -x
        if isinstance(node, ast.BinOp) and isinstance(node.op, (ast.Add, ast.Sub, ast.Mult, ast.Div, ast.Pow)):
            a, b = read(node.left), read(node.right)
            if isinstance(node.op, ast.Add): return a + b
            if isinstance(node.op, ast.Sub): return a - b
            if isinstance(node.op, ast.Mult): return a * b
            if isinstance(node.op, ast.Div): return a / b
            if isinstance(node.op, ast.Pow): return a ** b
        if isinstance(node, ast.Call) and isinstance(node.func, ast.Name):
            if node.func.id not in ALLOWED_FUNCS or node.keywords:
                raise EquationError(f'Function not permitted: {node.func.id}')
            return ALLOWED_FUNCS[node.func.id](*[read(a) for a in node.args])
        raise EquationError(f'Unsupported expression syntax: {ast.dump(node)[:110]}')

    result = np.asarray(read(tree), dtype=float)
    if not np.all(np.isfinite(result)):
        raise EquationError('Equation has nonfinite values on the requested interval.')
    return result


def arr_expr(expr: str, n: int, **var) -> np.ndarray:
    z = eval_expression(expr, **var)
    return np.broadcast_to(z, (n,)).copy().astype(float)


def stereographic(points: np.ndarray) -> np.ndarray:
    """Invertible R²→S² stereographic encoding (excluding north pole of inverse)."""
    x, y = points[:, 0], points[:, 1]
    rr = x*x+y*y
    d = 1.0 + rr
    return np.column_stack((2*x/d, 2*y/d, (rr-1)/d))


def inverse_stereographic(points: np.ndarray) -> np.ndarray:
    return points[:, :2] / (1.0 - points[:, 2, None])


def resample_closed(points: np.ndarray, n: int) -> np.ndarray:
    p = np.asarray(points, dtype=float)
    if np.linalg.norm(p[0]-p[-1])>1e-9:
        p=np.vstack((p,p[0]))
    chord=np.linalg.norm(np.diff(p,axis=0),axis=1)
    keep=np.r_[True,chord>1e-12]
    p=p[keep]
    d=np.r_[0,np.cumsum(np.linalg.norm(np.diff(p,axis=0),axis=1))]
    if d[-1]<1e-10: raise EquationError('Degenerate contour.')
    t=np.linspace(0,d[-1],n+1)
    return np.column_stack([np.interp(t,d,p[:,j]) for j in range(p.shape[1])])


@dataclass
class Curve:
    label: str
    points: np.ndarray
    raw: np.ndarray
    kind: str
    source_closure: float
    reconstruction_error: float | None = None
    assumptions: tuple[str,...]=()


def equation_to_sphere(spec: dict, theta: np.ndarray, radius: float, hemisphere: str) -> Curve:
    """Adapt a supported equation/curve to physical body-sphere coordinates.

    - expression: scalar y(t) encoded invertibly as latitude;
    - parametric: two coordinates stereographically lifted, 3D radialized;
    - implicit: numerical closed F(x,y)=0 contour, stereographic lift;
    - ode: solve_ivp of 1-3 ODEs then use above encodings;
    - sampled: supplied CSV with 2 or 3 columns.

    'Arbitrary equation' cannot have a universal faithful polar encoding: one
    must choose its solution branch, domain, and observables first.
    """
    kind=spec.get('kind','expression')
    label=spec.get('label',kind)
    n=len(theta)-1
    assumptions=[]
    reconstruction_error=None
    if kind=='expression':
        scale=float(spec.get('scale',1.0))
        if scale<=0: raise EquationError('scale must be positive')
        y=arr_expr(spec['expr'],len(theta),t=theta)
        center=float(spec.get('latitude_center',.83))
        amp=float(spec.get('latitude_amplitude',.38))
        if center-abs(amp)<=0 or center+abs(amp)>=math.pi/2:
            raise EquationError('Choose northern latitude in (0,pi/2).')
        colat=center+amp*np.tanh(y/scale)
        if hemisphere=='south': colat=math.pi-colat
        unit=np.column_stack((np.sin(colat)*np.cos(theta),np.sin(colat)*np.sin(theta),np.cos(colat)))
        decoded=scale*np.arctanh(np.clip(((math.pi-colat if hemisphere=='south' else colat)-center)/amp,-1+1e-15,1-1e-15))
        reconstruction_error=float(np.max(np.abs(decoded-y)))
        raw=y[:,None]
        assumptions.append('Scalar solution y(t) is represented by invertible latitude; t is azimuth.')
    elif kind=='parametric':
        exprs=spec.get('components',[])
        if len(exprs) not in (2,3): raise EquationError('Parametric requires 2 or 3 expressions.')
        raw=np.column_stack([arr_expr(e,len(theta),t=theta) for e in exprs]);
        if raw.shape[1]==2:
            scale=float(spec.get('scale',1.0));unit=stereographic(raw/scale)
            decoded=inverse_stereographic(unit)*scale
            reconstruction_error=float(np.max(np.abs(decoded-raw)))
            assumptions.append('2D parametric input uses reversible stereographic map with recorded scale.')
        else:
            norms=np.linalg.norm(raw,axis=1)
            if np.any(norms<EPS): raise EquationError('3D parametric vector hits the origin; choose an offset.')
            unit=raw/norms[:,None]
            assumptions.append('3D vectors are radialized: amplitude information is stored in raw input, not sphere.')
    elif kind=='implicit':
        xmin,xmax,ymin,ymax=map(float,spec.get('bounds',[-1.7,1.7,-1.7,1.7]))
        grid=int(spec.get('grid',240))
        xs=np.linspace(xmin,xmax,grid);ys=np.linspace(ymin,ymax,grid)
        xx,yy=np.meshgrid(xs,ys)
        f=np.broadcast_to(eval_expression(spec['expr'],x=xx,y=yy),xx.shape)
        contours=find_contours(f,0)
        if not contours: raise EquationError('No zero contour detected within bounds.')
        candidates=[]
        for c in contours:
            xy=np.column_stack((np.interp(c[:,1],np.arange(grid),xs),np.interp(c[:,0],np.arange(grid),ys)))
            perimeter=float(np.sum(np.linalg.norm(np.diff(xy,axis=0),axis=1)))
            closed=np.linalg.norm(xy[0]-xy[-1])<3*max((xmax-xmin)/grid,(ymax-ymin)/grid)
            if closed and perimeter>0.1:
                candidates.append((perimeter,xy))
        if not candidates: raise EquationError('Only open zero-level branches found; expand bounds or select a closed branch.')
        raw=resample_closed(max(candidates,key=lambda z:z[0])[1],n)
        scale=float(spec.get('scale',1.0))
        unit=stereographic(raw/scale)
        residual=eval_expression(spec['expr'],x=raw[:,0],y=raw[:,1])
        reconstruction_error=float(np.max(np.abs(residual)))
        assumptions.append('Longest numerically closed contour branch selected; residual measures grid/extraction error.')
    elif kind=='ode':
        eqs=spec.get('rhs',[]); init=np.asarray(spec.get('initial',[]),float)
        if len(eqs) not in (1,2,3) or len(eqs)!=len(init):
            raise EquationError('Provide 1 to 3 ODE right-hand sides and matching initial values.')
        interval=spec.get('interval',[0,TAU]);t0,t1=map(float,interval)
        if t1<=t0:raise EquationError('Invalid ODE time interval.')
        def rhs(t,y):
            kw=dict(t=t,x=y[0],y=y[1] if len(y)>1 else 0.,z=y[2] if len(y)>2 else 0.)
            return [float(eval_expression(x,**kw)) for x in eqs]
        tout=t0+(t1-t0)*theta/TAU
        sol=solve_ivp(rhs,(t0,t1),init,t_eval=tout,rtol=2e-10,atol=1e-12)
        if not sol.success: raise EquationError(sol.message)
        raw=sol.y.T
        if raw.shape[1]==1:
            y=raw[:,0];scale=float(spec.get('scale',1))
            colat=.83+.38*np.tanh(y/scale)
            if hemisphere=='south':colat=np.pi-colat
            unit=np.column_stack((np.sin(colat)*np.cos(theta),np.sin(colat)*np.sin(theta),np.cos(colat)))
        elif raw.shape[1]==2:
            unit=stereographic(raw/float(spec.get('scale',1)))
        else:
            norms=np.linalg.norm(raw,axis=1)
            if np.any(norms<EPS): raise EquationError('ODE 3D trajectory passes origin.')
            unit=raw/norms[:,None]
        assumptions.append('ODE domain linearly reparameterized to one azimuthal sweep. Periodicity is tested, not assumed.')
    elif kind=='sampled':
        p=Path(spec['path'])
        if not p.is_file():raise EquationError(f'CSV not found: {p}')
        raw_csv=np.loadtxt(p,delimiter=',',skiprows=int(spec.get('skiprows',0)))
        if raw_csv.ndim!=2 or raw_csv.shape[1] not in (2,3):
            raise EquationError('Sampled CSV needs 2 or 3 numeric columns.')
        # Do NOT automatically periodize source: only closed, arclength-parametrized samples accepted.
        if np.linalg.norm(raw_csv[0]-raw_csv[-1])>1e-5:
            raise EquationError('Sampled path is not closed; close it upstream or provide periodic ODE.')
        raw=resample_closed(raw_csv,n)
        if raw.shape[1]==2: unit=stereographic(raw/float(spec.get('scale',1)))
        else:
            norms=np.linalg.norm(raw,axis=1)
            if np.any(norms<EPS):raise EquationError('Sampled 3D curve hits origin.')
            unit=raw/norms[:,None]
        assumptions.append('Closed sampled input resampled by arclength; coordinates preserved separately.')
    else:
        raise EquationError(f'Unsupported kind {kind}. Use expression, parametric, implicit, ode or sampled.')
    if unit.shape!=(n+1,3) or not np.all(np.isfinite(unit)):
        raise EquationError('Sphere embedding failed.')
    unit=unit/np.linalg.norm(unit,axis=1)[:,None]
    closure=float(np.linalg.norm(raw[0]-raw[-1])/max(1.,float(np.max(np.linalg.norm(raw,axis=1)))))
    return Curve(label,radius*unit,raw,kind,closure,reconstruction_error,tuple(assumptions))


@dataclass(frozen=True)
class Config:
    major: float=1.6
    minor: float=.55
    annulum_gear: int=6
    ball_radius: float | None=None
    n: int=256
    pen_turns: int=3
    pen_offset: float=0.0
    gimbal_pitch_turns: int=0
    gimbal_roll_turns: int=0
    gimbal_pitch_wave: float=0.0
    gimbal_roll_wave: float=0.0
    gimbal_wave_frequency: int=2
    holonomy_compensation: bool=True
    allow_degenerate_contact: bool=False
    align_source_anchors: bool=False


def rotation_y(angle: np.ndarray)->np.ndarray:
    c,s=np.cos(angle),np.sin(angle);r=np.zeros((len(angle),3,3))
    r[:,0,0]=c;r[:,0,2]=s;r[:,1,1]=1;r[:,2,0]=-s;r[:,2,2]=c
    return r


def rotation_x(angle: np.ndarray)->np.ndarray:
    c,s=np.cos(angle),np.sin(angle);r=np.zeros((len(angle),3,3))
    r[:,0,0]=1;r[:,1,1]=c;r[:,1,2]=-s;r[:,2,1]=s;r[:,2,2]=c
    return r


def unit(v: np.ndarray)->np.ndarray:
    norm=np.linalg.norm(v,axis=1)
    if np.min(norm)<1e-10:raise EquationError('Degenerate connector: input points coincide.')
    return v/norm[:,None]


def bishop_frame(directions: np.ndarray)->tuple[np.ndarray,np.ndarray]:
    """Rotation-minimizing discretized normal plane for open or closed connector paths."""
    n=len(directions)
    a=np.zeros((n,3));b=np.zeros((n,3))
    ref=np.array([0.,0.,1.])
    if abs(np.dot(ref,directions[0]))>.90:ref=np.array([0.,1.,0.])
    a[0]=ref-np.dot(ref,directions[0])*directions[0]
    a[0]/=np.linalg.norm(a[0]);b[0]=np.cross(directions[0],a[0])
    for j in range(1,n):
        va,vb=directions[j-1],directions[j]
        cross=np.cross(va,vb);ss=np.linalg.norm(cross);cc=float(np.clip(np.dot(va,vb),-1,1))
        if ss<1e-13:
            if cc<0:
                # Antiparallel discontinuities are singular for a smooth frame.
                raise EquationError(f'Connector rotates 180 degrees at index {j}; refine resolution or reject candidate.')
            nxt=a[j-1]
        else:
            angle=np.arctan2(ss,cc)
            rot=Rotation.from_rotvec(cross/ss*angle)
            nxt=rot.apply(a[j-1])
        nxt=nxt-np.dot(nxt,vb)*vb
        nrm=np.linalg.norm(nxt)
        if nrm<1e-12: raise EquationError('Bishop frame degeneracy.')
        a[j]=nxt/nrm;b[j]=np.cross(vb,a[j]);b[j]/=np.linalg.norm(b[j])
    return a,b


def torus_implicit(x:np.ndarray,major:float,minor:float)->np.ndarray:
    xx=np.sum(x*x,axis=-1)+major*major-minor*minor
    return xx*xx-4*major*major*(x[...,0]**2+x[...,1]**2)


def ray_first_torus_hit(origin:np.ndarray,direction:np.ndarray,major:float,minor:float):
    """Smallest *forward* real root of the torus quartic, not an arbitrary ray-wall crossing."""
    n=len(origin);out=np.full_like(origin,np.nan);dist=np.full(n,np.nan)
    counts={'roots_missing':0,'start_outside':0,'multiple_positive_roots':0}
    for j,(o,d) in enumerate(zip(origin,direction)):
        A=float(d@d);B=float(2*(o@d));C=float(o@o+major*major-minor*minor)
        x2=float(d[0]**2+d[1]**2)
        x1=float(2*(o[0]*d[0]+o[1]*d[1]))
        x0=float(o[0]**2+o[1]**2)
        poly=[A*A,2*A*B,B*B+2*A*C-4*major*major*x2,2*B*C-4*major*major*x1,C*C-4*major*major*x0]
        roots=np.roots(poly)
        positive=sorted(float(z.real) for z in roots if abs(z.imag)<1e-7*max(1,abs(z.real)) and z.real>1e-9)
        if len(positive)>1:counts['multiple_positive_roots']+=1
        if not positive:
            counts['roots_missing']+=1;continue
        if torus_implicit(o[None,:],major,minor)[0]>1e-7:
            counts['start_outside']+=1;continue
        d0=positive[0]
        out[j]=o+d0*d;dist[j]=d0
    return out,dist,counts


def frame_and_roll(psi:np.ndarray,cfg:Config):
    """Geometrically exact selected-contact rolling reconstruction.

    Ball center ρ=R+(a-b), contact P=(R+a)e_r and annulum body angle
    γ=(ρ+b)/b ψ=(R+a)/b ψ.  Q=W(ψ)B(γ)^T; ω_z=-(ρ/b)ψdot,
    thus v_center+ω×(b e_r)=0 at the selected outer-equatorial contact.
    """
    R,a=cfg.major,cfg.minor
    b=float(cfg.ball_radius) if cfg.ball_radius is not None else (R+a)/cfg.annulum_gear
    if R<=a or b<=0 or (b>=a and not (cfg.allow_degenerate_contact and abs(b-a)<1e-10)):
        raise EquationError('Need major>minor>=ball_radius>0; equality requires allow_degenerate_contact and breaks unique rolling contact.')
    rho=R+a-b
    gear=(R+a)/b
    g=gear*psi
    er=np.column_stack([np.cos(psi),np.sin(psi),np.zeros_like(psi)])
    et=np.column_stack([-np.sin(psi),np.cos(psi),np.zeros_like(psi)])
    ez=np.tile(np.array([0.,0.,1.]),(len(psi),1))
    W=np.stack([er,et,ez],axis=-1)
    rr=np.column_stack([np.sin(g),np.zeros_like(g),np.cos(g)])
    tt=np.column_stack([np.cos(g),np.zeros_like(g),-np.sin(g)])
    nn=np.tile(np.array([0.,1.,0.]),(len(psi),1))
    B=np.stack([rr,tt,nn],axis=-1)
    Q=W@np.swapaxes(B,1,2)
    center=rho*er
    grann_body=b*rr
    grann_world=center+np.einsum('nij,nj->ni',Q,grann_body)
    outer_contact=(R+a)*er
    return dict(center=center,orientation=Q,grann_body=grann_body,grann_world=grann_world,
                contact=outer_contact,gear=gear,radius=b,rho=rho,angle=g,
                er=er,et=et,ez=ez,grann_tipode_body=-grann_body)


def fourth_order_derivative(arr:np.ndarray,h:float)->np.ndarray:
    # 5-point fourth-order central differentiation; keep endpoint estimates out of contact test.
    result=np.gradient(arr,h,axis=0,edge_order=2)
    result[2:-2]=(arr[:-4]-8*arr[1:-3]+8*arr[3:-1]-arr[4:])/(12*h)
    return result


def align_two_curve_frames(r_curve:np.ndarray,q_curve:np.ndarray,idx_r:int=0,idx_q:int|None=None):
    """Optional constant SO(3) calibration: Q(q-anchor) aligns with R(r-anchor).

    Also aligns the tangent directions at the independently chosen anchor phases.
    This is *coordinate calibration*, not a mathematical consequence of inputs.
    """
    if idx_q is None:idx_q=(len(r_curve)-1)//2
    def frame(curve,idx):
        p=curve[idx]/np.linalg.norm(curve[idx])
        prev=curve[(idx-1)%(len(curve)-1)]
        nex=curve[(idx+1)%(len(curve)-1)]
        t=nex-prev
        t=t-np.dot(t,p)*p
        if np.linalg.norm(t)<1e-10:raise EquationError('Anchor curve tangent vanishes.')
        t=t/np.linalg.norm(t)
        normal=np.cross(p,t)
        return np.stack([p,t,normal],axis=1)
    fr=frame(r_curve,idx_r);fq=frame(q_curve,idx_q)
    align=fr@fq.T
    rotated=q_curve@align.T
    gap=float(np.linalg.norm(r_curve[idx_r]-rotated[idx_q]))
    tangent_gap=float(np.linalg.norm(fr[:,1]-align@fq[:,1]))
    return rotated,align,gap,tangent_gap,idx_q

def curve_derivative(arr:np.ndarray,h:float,k:int=1):
    result=arr
    for _ in range(k):result=np.gradient(result,h,axis=0,edge_order=2)
    return result


def run(cfg:Config,spec_R:dict,spec_Q:dict)->dict[str,Any]:
    if cfg.n<64:raise EquationError('At least 64 intervals required for diagnostics.')
    psi=np.linspace(0,TAU,cfg.n+1);h=psi[1]-psi[0]
    hardware=frame_and_roll(psi,cfg);b=hardware['radius'];Q=hardware['orientation'];C=hardware['center']
    R=equation_to_sphere(spec_R,psi,b,'north')
    S=equation_to_sphere(spec_Q,psi,b,'south')
    pitch=cfg.gimbal_pitch_turns*psi+cfg.gimbal_pitch_wave*np.sin(cfg.gimbal_wave_frequency*psi)
    roll=cfg.gimbal_roll_turns*psi+cfg.gimbal_roll_wave*np.sin(cfg.gimbal_wave_frequency*psi)
    alignment_matrix=np.eye(3);anchor_gap=None;anchor_tangent_gap=None;anchor_q_index=None
    Qsource=S.points
    if cfg.align_source_anchors:
        Qsource,alignment_matrix,anchor_gap,anchor_tangent_gap,anchor_q_index=align_two_curve_frames(R.points,S.points)
    gimbal_R=rotation_y(pitch);gimbal_Q=rotation_x(roll)
    a_body=np.einsum('nij,nj->ni',gimbal_R,R.points)
    b_body=np.einsum('nij,nj->ni',gimbal_Q,Qsource)
    a_world=C+np.einsum('nij,nj->ni',Q,a_body)
    b_world=C+np.einsum('nij,nj->ni',Q,b_body)
    connector=b_world-a_world;direction=unit(connector)
    wobble=(a_world+b_world)/2
    normal1,normal2=bishop_frame(direction)
    # Frame holonomy is geometric; compensation is optional and recorded.
    same_direction=float(np.linalg.norm(direction[0]-direction[-1]))
    holonomy=float(np.arctan2(np.dot(normal1[-1],normal2[0]),np.dot(normal1[-1],normal1[0])))
    phase=cfg.pen_turns*psi+cfg.pen_offset
    compensated=bool(cfg.holonomy_compensation and same_direction<1e-5)
    if compensated:phase=phase-holonomy*psi/TAU
    pen=unit(np.cos(phase)[:,None]*normal1+np.sin(phase)[:,None]*normal2)
    lisa,ray_param,counts=ray_first_torus_hit(wobble,pen,cfg.major,cfg.minor)
    if not np.all(np.isfinite(lisa)):raise EquationError(f'Torus ray intersection failed: {counts}')
    # contact slip numerical derivative: dot P fixed in world evaluated from center and rotation rate.
    cdot=fourth_order_derivative(C,h)
    qdot=fourth_order_derivative(Q,h)
    skew=qdot@np.swapaxes(Q,1,2)
    cross_term=np.einsum('nij,nj->ni',skew,b*hardware['er'])
    vcontact=cdot+cross_term
    slip=np.linalg.norm(vcontact[2:-2],axis=1)
    qerr=np.max(np.abs(np.swapaxes(Q,1,2)@Q-np.eye(3)))
    gerr=np.max(np.abs(np.swapaxes(gimbal_R,1,2)@gimbal_R-np.eye(3)))
    gerr=max(gerr,float(np.max(np.abs(np.swapaxes(gimbal_Q,1,2)@gimbal_Q-np.eye(3)))))
    p1=curve_derivative(lisa,h);p2=curve_derivative(p1,h);p3=curve_derivative(p2,h)
    speed=np.linalg.norm(p1,axis=1)
    tangent=p1/np.maximum(speed[:,None],1e-12)
    # invariant curvature of param curve; use normal acceleration
    accel_perp=p2-np.sum(p2*tangent,axis=1)[:,None]*tangent
    kappa=np.linalg.norm(accel_perp,axis=1)/np.maximum(speed**2,1e-10)
    # avoid treating artificial endpoint derivative artifacts as bulk non-smoothness
    bulk=kappa[3:-3]
    smoothness=float(np.sqrt(np.mean(np.diff(bulk)**2)))
    closure_position=float(np.linalg.norm(lisa[0]-lisa[-1]))
    closure_tangent=float(np.linalg.norm(tangent[0]-tangent[-1]))
    closure_curvature=float(abs(kappa[2]-kappa[-3]))
    try:
        curvature_p95=float(np.percentile(bulk,95))
    except Exception:curvature_p95=float('inf')
    contact=np.linalg.norm(hardware['grann_world']-hardware['contact'],axis=1)
    det=np.linalg.det(Q)
    metrics=dict(
        source_R_closure=R.source_closure,source_Q_closure=S.source_closure,
        source_anchor_alignment_used=cfg.align_source_anchors,
        source_anchor_Q_index=anchor_q_index,source_anchor_point_gap=anchor_gap,
        source_anchor_tangent_gap=anchor_tangent_gap,
        source_anchor_SO3_rotation=alignment_matrix.tolist(),
        source_R_reconstruction_error=R.reconstruction_error,source_Q_reconstruction_error=S.reconstruction_error,
        rolling_gearing=hardware['gear'],rolling_gear_integer_error=abs(hardware['gear']-round(hardware['gear'])),
        annulum_even_gear=bool(abs(hardware['gear']/2-round(hardware['gear']/2))<1e-9),
        sphere_radius=b,ball_clearance=cfg.minor-b,ball_center_track_radius=hardware['rho'],
        selected_contact_isolated=bool(cfg.minor-b>1e-8),
        contact_near_degenerate=bool((cfg.minor-b)<.05*cfg.minor),
        max_contact_position_residual=float(contact.max()),
        max_contact_velocity_residual=float(np.max(slip)),
        analytic_contact_velocity_residual=float(abs(hardware['rho']+b*(1-hardware['gear']))),
        contact_fd_error_limit=float(max(1e-7,hardware['rho']*(hardware['gear']*h)**4/9)),
        max_SO3_orthogonality_residual=float(qerr),min_SO3_determinant=float(np.min(det)),
        max_gimbal_SO3_residual=float(gerr),
        ball_frame_closure=float(np.linalg.norm(Q[0]-Q[-1])),
        grann_tipode_antipodal=float(np.max(np.abs(np.linalg.norm(hardware['grann_tipode_body']+hardware['grann_body'],axis=1)))),
        connector_direction_closure=same_direction,
        bishop_holonomy_radians=holonomy,holonomy_compensation_used=compensated,
        curve_position_closure=closure_position,curve_tangent_closure=closure_tangent,
        curve_curvature_closure=closure_curvature,
        output_curvature_p95=curvature_p95,output_curvature_roughness=smoothness,
        output_min_speed=float(speed[3:-3].min()),
        torus_max_implicit_residual=float(np.max(np.abs(torus_implicit(lisa,cfg.major,cfg.minor)))),
        torus_ray_counts=counts,
        connector_min_length=float(np.min(np.linalg.norm(connector,axis=1))),
        source_R_assumptions=R.assumptions,source_Q_assumptions=S.assumptions,
        gimbal_axes_dot=0.0,
        mechanical_model='Selected-contact rigid-sphere roll in torus, dual orthogonal interior gimbal hinges, Great Annulum great circle; not an exact identification of historical unspecified self-intersecting annulum.'
    )
    # No assertion of "mathematical isomorphism" based only on periodicity.
    metrics['harmonic_signature']=harmonic_signature(lisa)
    metrics['closure_pass']=bool(closure_position<1e-6 and closure_tangent<.06 and
                                 metrics['ball_frame_closure']<1e-6 and
                                 metrics['source_R_closure']<1e-6 and metrics['source_Q_closure']<1e-6 and
                                 metrics['torus_max_implicit_residual']<1e-7)
    metrics['smooth_curve_pass']=bool(closure_tangent<.02 and closure_curvature<2.0 and smoothness<80.0 and curvature_p95<45.0)
    metrics['mechanics_pass']=bool(metrics['max_contact_position_residual']<1e-9 and
                                   metrics['analytic_contact_velocity_residual']<1e-12 and
                                   metrics['max_contact_velocity_residual']<metrics['contact_fd_error_limit'] and
                                   qerr<1e-10 and gerr<1e-10 and
                                   metrics['selected_contact_isolated'] and
                                   metrics['torus_max_implicit_residual']<1e-7)
    return dict(config=asdict(cfg),equations={'R':spec_R,'Q':spec_Q},metrics=metrics,
                psi=psi,ball_center=C,orientation=Q,grann=hardware['grann_world'],
                grann_tipode=C+np.einsum('nij,nj->ni',Q,hardware['grann_tipode_body']),
                curve_R=a_world,curve_Q=b_world,connector_midpoint=wobble,
                connector_direction=direction,wiggle_n1=normal1,wiggle_n2=normal2,
                pen=pen,ray_parameter=ray_param,curvy_lisa=lisa,
                source_R=R.raw,source_Q=S.raw,curvature=kappa,speed=speed,
                rolling_slip=slip)


def harmonic_signature(points:np.ndarray,max_order:int=12)->dict:
    # Endpoint excluded, because it duplicates the first sample on a closed orbit.
    p=np.asarray(points[:-1],float)
    spectrum=np.fft.rfft(p-p.mean(axis=0),axis=0)
    energy=np.sum(abs(spectrum)**2,axis=1)
    total=float(np.sum(energy[1:]))
    if total<1e-24:return dict(relative_tail=0.,fit_rms=0.,dominant_modes=[],variance=0.)
    cutoff=min(max_order,len(energy)-1)
    tail=float(np.sum(energy[cutoff+1:])/total)
    low=spectrum.copy();low[cutoff+1:]=0
    reconstructed=np.fft.irfft(low,n=len(p),axis=0)+p.mean(axis=0)
    rms=float(np.sqrt(np.mean((reconstructed-p)**2))/max(1e-14,np.sqrt(np.mean((p-p.mean(axis=0))**2))))
    dominant=np.argsort(energy[1:])[::-1][:8]+1
    return dict(relative_tail=tail,fit_rms=rms,dominant_modes=[dict(mode=int(i),energy_fraction=float(energy[i]/total)) for i in dominant],variance=float(np.var(p)))

def candidate_score(result:dict)->float:
    m=result['metrics']
    if not m['mechanics_pass']:return 1e10
    if not m['smooth_curve_pass']:return 1e7+.1*m['output_curvature_roughness']
    if m['contact_near_degenerate']:return 1e6+.1*m['output_curvature_roughness']
    return (25*m['curve_position_closure']+3*m['curve_tangent_closure']+
            2*m['harmonic_signature']['fit_rms']+
            15*m['source_R_closure']+15*m['source_Q_closure']+
            .08*m['output_curvature_roughness']+.005*m['output_curvature_p95'])


def search(cfg:Config,spec_R:dict,spec_Q:dict,
           gears:tuple[int,...]=(4,6,8,10),pen_turns:tuple[int,...]=(0,1,2,3,4),
           gimbal_pairs:tuple[tuple[int,int],...]=((0,0),(1,0),(0,1)),
           max_keep:int | None=None)->list[dict]:
    out=[]
    for gear in gears:
        for pen in pen_turns:
            for gp,gr in gimbal_pairs:
                c=replace(cfg,annulum_gear=gear,ball_radius=None,pen_turns=pen,
                          gimbal_pitch_turns=gp,gimbal_roll_turns=gr)
                try:
                    r=run(c,spec_R,spec_Q)
                    out.append(dict(config=r['config'],metrics=r['metrics'],score=candidate_score(r)))
                except (ValueError,FloatingPointError,EquationError) as exc:
                    out.append(dict(config=asdict(c),score=1e12,error=str(exc)))
    out.sort(key=lambda x:x['score'])
    return out if max_keep is None else out[:max_keep]


def write_output(result:dict,outdir:Path,make_plot:bool=True)->None:
    outdir.mkdir(parents=True,exist_ok=True)
    def jsonable(x):
        if isinstance(x,(np.floating,np.integer)):return x.item()
        if isinstance(x,np.bool_):return bool(x)
        if isinstance(x,np.ndarray):return x.tolist()
        if isinstance(x,tuple):return list(x)
        raise TypeError(type(x).__name__)
    payload={'config':result['config'],'equations':result['equations'],'metrics':result['metrics']}
    (outdir/'diagnostics.json').write_text(json.dumps(payload,indent=2,default=jsonable))
    keys=('psi','ball_center','orientation','grann','grann_tipode','curve_R','curve_Q','connector_midpoint',
          'connector_direction','wiggle_n1','wiggle_n2','pen','ray_parameter',
          'curvy_lisa','source_R','source_Q','curvature','speed')
    np.savez_compressed(outdir/'geometry.npz',**{k:result[k] for k in keys})
    if make_plot:
        import matplotlib
        matplotlib.use('Agg')
        import matplotlib.pyplot as plt
        from mpl_toolkits.mplot3d import Axes3D  # noqa
        R=result['config']['major'];a=result['config']['minor']
        u=np.linspace(0,TAU,80);v=np.linspace(0,TAU,36)
        U,V=np.meshgrid(u,v,indexing='ij')
        x=(R+a*np.cos(V))*np.cos(U)
        y=(R+a*np.cos(V))*np.sin(U)
        z=a*np.sin(V)
        fig=plt.figure(figsize=(9,7));ax=fig.add_subplot(111,projection='3d')
        ax.plot_surface(x,y,z,alpha=.11,linewidth=0,antialiased=True)
        for key,color,label in [('curve_R','#1976D2','R sphere equation'),('curve_Q','#C0392B','Q sphere equation'),('curvy_lisa','#228B59','Curvy_Lisa'),('grann','#A66A00','GrAnn outer contact')]:
            p=result[key];ax.plot(p[:,0],p[:,1],p[:,2],color=color,lw=1.65,label=label)
        for j in np.linspace(0,len(result['psi'])-1,10,dtype=int):
            p=result['curve_R'][j];q=result['curve_Q'][j]
            ax.plot([p[0],q[0]],[p[1],q[1]],[p[2],q[2]],c='#666666',alpha=.4,lw=.9)
        ax.set(xlabel='x',ylabel='y',zlabel='z',title='Whirligig: torus, rolling sphere, R/Q connector and Curvy_Lisa')
        ax.legend(fontsize=8,loc='upper left');ax.set_box_aspect([1,1,.65]);fig.tight_layout()
        fig.savefig(outdir/'whirligig_geometry.png',dpi=180);plt.close(fig)
        fig,axes=plt.subplots(2,2,figsize=(10,7))
        t=result['psi'];axes[0,0].plot(t,result['curvature']);axes[0,0].set_title('Curvy_Lisa spatial curvature')
        axes[0,1].plot(t,result['speed']);axes[0,1].set_title('Output speed vs sweep parameter')
        axes[1,0].plot(result['curvy_lisa'][:,0],result['curvy_lisa'][:,1]);axes[1,0].set_aspect('equal');axes[1,0].set_title('Curvy_Lisa XY trace')
        axes[1,1].plot(t[2:-2],result['rolling_slip']);axes[1,1].set_title('Selected-contact rolling slip (finite difference)')
        for ax in axes.flat:ax.grid(alpha=.22);ax.set_xlabel('sweep parameter')
        fig.tight_layout();fig.savefig(outdir/'diagnostic_plots.png',dpi=170);plt.close(fig)


def read_config(path:str|None)->dict:
    if path is None:
        return {'config':{},'R':{'kind':'expression','label':'R: harmonic 2','expr':'0.55*cos(2*t)+0.15*sin(3*t)'},
                'Q':{'kind':'expression','label':'Q: harmonic 3','expr':'0.6*sin(3*t)+0.1*cos(5*t)'}}
    return json.loads(Path(path).read_text())


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--input',help='JSON with config, R and Q equation adapters')
    ap.add_argument('--out',default='whirligig_run',help='Output directory')
    ap.add_argument('--search',action='store_true',help='Rank rolling gears, pen frequencies and gimbal hinge settings')
    ap.add_argument('--no-plot',action='store_true')
    args=ap.parse_args()
    a=read_config(args.input)
    cfg=Config(**a.get('config',{}))
    result=run(cfg,a['R'],a['Q'])
    out=Path(args.out);write_output(result,out,make_plot=not args.no_plot)
    print(json.dumps(result['metrics'],indent=2,default=lambda x:x.item() if isinstance(x,(np.generic,)) else list(x)))
    if args.search:
        ranked=search(cfg,a['R'],a['Q'])
        (out/'ranked_candidates.json').write_text(json.dumps(ranked,indent=2))
        best=ranked[0]
        (out/'selected_best.json').write_text(json.dumps(best,indent=2))
        if 'error' not in best:
            best_result=run(Config(**best['config']),a['R'],a['Q'])
            write_output(best_result,out/'best_run',make_plot=not args.no_plot)
        print('Search best:',json.dumps({'score':best['score'],'config':best['config'],'closure':best.get('metrics',{}).get('closure_pass')}))

if __name__=='__main__':main()

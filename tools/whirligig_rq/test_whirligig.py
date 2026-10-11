import math
from pathlib import Path
import numpy as np
import pytest
from whirligig import (Config, TAU, EquationError, eval_expression,
                       stereographic, inverse_stereographic, equation_to_sphere,
                       frame_and_roll, run, search)
from ui4d import indicatrix,lift_sphere_curve

R={'kind':'expression','label':'R','expr':'0.55*cos(2*t)+0.15*sin(3*t)'}
Q={'kind':'expression','label':'Q','expr':'0.6*sin(3*t)+0.1*cos(5*t)'}


def test_safe_expression():
    with pytest.raises(EquationError):eval_expression('__import__("os").system("whoami")',t=0.)
    with pytest.raises(EquationError):eval_expression('t.real',t=1.)
    assert abs(float(eval_expression('cos(pi)+2^3',t=0))-7)<1e-14


def test_stereographic_inverse():
    inp=np.random.default_rng(5).normal(size=(200,2))
    assert np.max(abs(inverse_stereographic(stereographic(inp))-inp))<5e-13


def test_rolling_geometry():
    x=np.linspace(0,TAU,501)
    geo=frame_and_roll(x,Config())
    assert abs(geo['gear']-6)<1e-12
    assert np.max(np.linalg.norm(geo['grann_world']-geo['contact'],axis=1))<1e-12
    assert np.linalg.norm(geo['orientation'][0]-geo['orientation'][-1])<1e-10
    assert np.max(abs(np.linalg.det(geo['orientation'])-1))<1e-12


def test_full_construction():
    obj=run(Config(n=256,pen_turns=0),R,Q)
    m=obj['metrics']
    assert m['mechanics_pass']
    assert m['closure_pass']
    assert m['torus_max_implicit_residual']<1e-10
    assert m['max_contact_velocity_residual']<2e-5
    assert m['source_R_reconstruction_error']<1e-12
    assert m['source_Q_reconstruction_error']<1e-12
    assert m['ball_frame_closure']<1e-12


def test_nonclosed_input_detected():
    obj=run(Config(n=128,pen_turns=0),{'kind':'expression','expr':'t'},Q)
    assert obj['metrics']['source_R_closure']>.9
    assert not obj['metrics']['closure_pass']


def test_noninteger_roll_does_not_close():
    obj=run(Config(n=128,ball_radius=.4,pen_turns=0),R,Q)
    assert obj['metrics']['rolling_gear_integer_error']>.1
    assert obj['metrics']['ball_frame_closure']>.1
    assert not obj['metrics']['closure_pass']


def test_ode_pair():
    eq={'kind':'ode','label':'harmonic oscillator','rhs':['y','-x'],'initial':[1,0]}
    obj=run(Config(n=128,pen_turns=0),eq,Q)
    assert obj['metrics']['source_R_closure']<1e-7
    assert obj['metrics']['mechanics_pass']


def test_implicit_closed_circle():
    t=np.linspace(0,TAU,129)
    sphere=equation_to_sphere({'kind':'implicit','expr':'x*x+y*y-1','bounds':[-1.3,1.3,-1.3,1.3],'grid':160},t,.35,'north')
    assert sphere.source_closure<1e-12
    assert sphere.reconstruction_error<5e-4
    assert np.max(abs(np.linalg.norm(sphere.points,axis=1)-.35))<1e-12


def test_search_filters_rough_curves():
    ranked=search(Config(n=128),R,Q,gears=(4,6),pen_turns=(0,1),gimbal_pairs=((0,0),(1,0)),max_keep=8)
    assert len(ranked)==8
    assert ranked[0]['score']<1e6
    assert ranked[0]['metrics']['smooth_curve_pass']
    assert not ranked[0]['metrics']['contact_near_degenerate']
    assert len({(x['config']['annulum_gear'],x['config']['pen_turns']) for x in ranked})>1


def test_exact_historical_degenerate_mode_diagnostic():
    cfg=Config(n=128,major=2.75,minor=.55,ball_radius=.55,allow_degenerate_contact=True,pen_turns=0)
    m=run(cfg,R,Q)['metrics']
    assert abs(m['rolling_gearing']-6)<1e-12
    assert not m['selected_contact_isolated']
    assert not m['mechanics_pass']


def test_so4_companion():
    s=np.linspace(0,TAU,51)
    angles=np.column_stack([2*s,3*s,np.zeros((len(s),4))])
    p,U=indicatrix(np.array([1.,0,0,0]),np.ones(len(s)),angles)
    assert np.max(abs(np.swapaxes(U,1,2)@U-np.eye(4)))<1e-12
    assert np.max(abs(np.linalg.norm(p,axis=1)-1))<1e-12
    c3=np.column_stack([np.cos(s),np.sin(s),np.zeros(len(s))]);p2,_=lift_sphere_curve(c3)
    assert np.max(abs(p2[:,:3]-c3))<1e-12


def test_source_anchor_alignment_and_compensated_holonomy():
    r=run(Config(n=256,pen_turns=0,align_source_anchors=True),R,Q)
    m=r['metrics']
    assert m['source_anchor_alignment_used']
    assert m['source_anchor_point_gap']<1e-12
    assert m['source_anchor_tangent_gap']<1e-12
    assert m['closure_pass']
    uncomp=run(Config(n=256,pen_turns=0,align_source_anchors=True,holonomy_compensation=False),R,Q)
    assert uncomp['metrics']['curve_position_closure']>.2
    assert not uncomp['metrics']['closure_pass']


def test_fourth_order_contact_slip_grid_convergence():
    a=run(Config(n=128,pen_turns=0),R,Q)['metrics']['max_contact_velocity_residual']
    b=run(Config(n=256,pen_turns=0),R,Q)['metrics']['max_contact_velocity_residual']
    c=run(Config(n=512,pen_turns=0),R,Q)['metrics']['max_contact_velocity_residual']
    assert 12<a/b<20
    assert 12<b/c<20

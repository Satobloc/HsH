#!/usr/bin/env python3
"""Synthetic reversibility, independent-input influence, and grid-convergence check."""
from __future__ import annotations
import argparse
import json
import numpy as np
from dataclasses import asdict, replace
from pathlib import Path
from whirligig import read_config,Config,run


def validation(src:dict):
    cfg=Config(**src.get('config',{}))
    R,Q=src['R'],src['Q']
    baseline=run(cfg,R,Q)
    out={'baseline':{k:v for k,v in baseline['metrics'].items() if k in
                     ('mechanics_pass','closure_pass','smooth_curve_pass','torus_max_implicit_residual',
                      'ball_frame_closure','curve_position_closure','curve_tangent_closure',
                      'source_anchor_point_gap','source_anchor_tangent_gap','analytic_contact_velocity_residual')}}
    if R['kind']=='expression' and Q['kind']=='expression':
        base=baseline['curvy_lisa']
        influence={}
        for which in ('R','Q'):
            source=R if which=='R' else Q
            pert=dict(source);pert['expr']='('+source['expr']+')*1.01'
            a=pert if which=='R' else R
            b=pert if which=='Q' else Q
            candidate=run(cfg,a,b)
            moved=np.linalg.norm(candidate['curvy_lisa']-base)/np.sqrt(len(base))
            delta=np.linalg.norm(.01 * baseline['source_'+which])/np.sqrt(len(base))
            influence[which]=dict(output_rms_shift=float(moved),input_rms_change=float(delta),
                                  output_per_unit_input_shift=float(moved/max(delta,1e-14)))
        out['independent_equation_sensitivity']=influence
    checks=[]
    for n in (128,256,512):
        m=run(replace(cfg,n=n),R,Q)['metrics']
        checks.append(dict(n=n,roll_numeric_fd_error=m['max_contact_velocity_residual'],
                           roll_exact_identity_residual=m['analytic_contact_velocity_residual'],
                           torus_implicit=m['torus_max_implicit_residual'],
                           closed=m['closure_pass']))
    out['grid_convergence']=checks
    return out

def main():
    p=argparse.ArgumentParser();p.add_argument('--input',default=None);p.add_argument('--out',default='mapping_validation.json')
    args=p.parse_args();v=validation(read_config(args.input))
    Path(args.out).write_text(json.dumps(v,indent=2))
    print(json.dumps(v,indent=2))
if __name__=='__main__':main()

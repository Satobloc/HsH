#!/usr/bin/env python3
"""Precision-drawn selected-contact rolling sphere and moving R/Q gimbal geometry."""
from pathlib import Path
import argparse
import numpy as np
from whirligig import Config,run,read_config,TAU
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation,PillowWriter


def draw(ax,result,index,torus=True,light=False):
    cfg=result['config'];R,a=cfg['major'],cfg['minor'];ball=result['metrics']['sphere_radius']
    if torus:
        u=np.linspace(0,TAU,46);v=np.linspace(0,TAU,20);U,V=np.meshgrid(u,v,indexing='ij')
        ax.plot_surface((R+a*np.cos(V))*np.cos(U),(R+a*np.cos(V))*np.sin(U),a*np.sin(V),
                        color='lightslategray',alpha=.08,linewidth=0,shade=False)
    i=int(index);center=result['ball_center'][i];Q=result['orientation'][i]
    # The actual sphere is drawn at its instantaneous physical position.
    uu=np.linspace(0,TAU,24);vv=np.linspace(0,np.pi,13);UU,VV=np.meshgrid(uu,vv)
    ax.plot_surface(center[0]+ball*np.sin(VV)*np.cos(UU),
                    center[1]+ball*np.sin(VV)*np.sin(UU),
                    center[2]+ball*np.cos(VV),color='royalblue',alpha=.18,linewidth=0,shade=False)
    t=np.linspace(0,TAU,140)
    body=ball*np.column_stack([np.sin(t),np.zeros_like(t),np.cos(t)])
    great_circle=center+body@Q.T
    ax.plot(*great_circle.T,color='#A46B0E',lw=1.4)
    ir=result['curve_R'][i];iq=result['curve_Q'][i]
    w=result['connector_midpoint'][i];p=result['curvy_lisa'][i]
    ax.plot([ir[0],iq[0]],[ir[1],iq[1]],[ir[2],iq[2]],color='black',lw=2.4)
    ax.scatter(*ir,s=32,color='#1976D2');ax.scatter(*iq,s=32,color='#C0392B')
    ax.scatter(*w,s=27,color='black')
    # W_iggle plane is explicitly orthogonal to the R–Q connector.
    phi=np.linspace(0,TAU,34);rho=np.linspace(0,ball*.5,5);U,V=np.meshgrid(phi,rho)
    d1=result['wiggle_n1'][i];d2=result['wiggle_n2'][i]
    disk=w+V[...,None]*(np.cos(U)[...,None]*d1+np.sin(U)[...,None]*d2)
    ax.plot_surface(disk[:,:,0],disk[:,:,1],disk[:,:,2],color='#FFD059',alpha=.26,linewidth=0)
    contact=result['grann'][i]
    ax.scatter(*contact,color='#A46B0E',s=42)
    ax.plot([w[0],p[0]],[w[1],p[1]],[w[2],p[2]],color='#218C58',lw=1.7)
    ax.scatter(*p,s=42,color='#218C58')
    sl=result['curvy_lisa'][:i+1]
    if len(sl)>1:ax.plot(*sl.T,color='#218C58',lw=2.0)
    # Torus center-circle (the location of the historical near-degenerate geometry)
    ax.set_xlim(-2.45,2.45);ax.set_ylim(-2.45,2.45);ax.set_zlim(-.85,.85)
    ax.set_box_aspect((1,1,.46));ax.view_init(elev=35,azim=-55)
    ax.set_xlabel('x');ax.set_ylabel('y');ax.set_zlabel('z')
    ax.set_title('Whirligig: ball, Great Annulum, R/Q crossbar, Wiggle plane, Curvy_Lisa',fontsize=11)


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--input',default=None)
    parser.add_argument('--out',default='whirligig_mechanics.png')
    parser.add_argument('--gif',default=None)
    args=parser.parse_args()
    source=read_config(args.input)
    r=run(Config(**source.get('config',{})),source['R'],source['Q'])
    fig=plt.figure(figsize=(14,7))
    idx=int(np.argmax(np.linalg.norm(r['curve_Q']-r['curve_R'],axis=1)))
    ax=fig.add_subplot(121,projection='3d')
    draw(ax,r,idx)
    ax.set_title('Global rolling torus and Curvy_Lisa',fontsize=12)
    zoom=fig.add_subplot(122,projection='3d')
    draw(zoom,r,idx,torus=False)
    c=r['ball_center'][idx];rad=r['metrics']['sphere_radius']*2
    zoom.set_xlim(c[0]-rad,c[0]+rad);zoom.set_ylim(c[1]-rad,c[1]+rad);zoom.set_zlim(c[2]-rad,c[2]+rad)
    zoom.set_box_aspect((1,1,1))
    zoom.set_title('R/Q connector, Wiggle plane, contact and rolling ball',fontsize=12)
    fig.tight_layout()
    fig.savefig(args.out,dpi=180);plt.close(fig)
    if args.gif:
        fig=plt.figure(figsize=(7,5));ax=fig.add_subplot(111,projection='3d')
        def update(j):
            ax.clear();idx=int(j*(len(r['psi'])-1)/35)
            draw(ax,r,idx,torus=True,light=True)
            return []
        animation=FuncAnimation(fig,update,frames=36,interval=130,blit=False)
        animation.save(args.gif,writer=PillowWriter(fps=9),dpi=95)
        plt.close(fig)
    print('Saved',args.out,'and',args.gif)
if __name__=='__main__':main()

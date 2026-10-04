"""Critical-cell threshold freeze plus dense (u,rho,K) validation for m=2500."""
import json
import numpy as np
import matplotlib.pyplot as plt
import five_bin_joint_nuisance_audit as a

SEED=202610040202; NTRAIN_K=400; RTRAIN=250; NVAL_K=240; RVAL=40
BCR=(-0.013333333333333336,1.016); SCR=(-0.08,0.984)

def khat(rng):
    c=np.array([rng.multinomial(a.M,row) for row in a.K0])
    return (c+a.ALPHA)/(a.M+5*a.ALPHA)
def choose(b,s):
    vals=np.unique(np.quantile(np.r_[b,s],np.linspace(.001,.999,4001)));best=(1,None,None,None)
    for t in vals:
        eb=np.mean(b<=t);es=np.mean(s>t);z=(max(eb,es),float(t),float(eb),float(es))
        if z[0]<best[0]:best=z
    return best
def cluster_upper(x):
    return float(min(1,x.mean()+1.96*x.std(ddof=1)/np.sqrt(len(x))))
def main():
    r=np.random.default_rng(SEED);pb=a.latent('b3',*BCR)@a.K0;ps=a.latent('s2',*SCR)@a.K0;bb=[];ss=[]
    for _ in range(NTRAIN_K):
        k=khat(r);bb.append(a.score_all(r.multinomial(a.N,pb,size=RTRAIN),k));ss.append(a.score_all(r.multinomial(a.N,ps,size=RTRAIN),k))
    cal=choose(np.concatenate(bb),np.concatenate(ss));t=cal[1]
    r=np.random.default_rng(SEED+900000);rb=[];rs=[]
    for _ in range(NVAL_K):
        k=khat(r);cb=np.array([r.multinomial(a.N,p,size=RVAL) for p in a.TB]);cs=np.array([r.multinomial(a.N,p,size=RVAL) for p in a.TS])
        rb.append(np.mean(a.score_all(cb,k)<=t,axis=1));rs.append(np.mean(a.score_all(cs,k)>t,axis=1))
    rb=np.asarray(rb);rs=np.asarray(rs);mb=rb.mean(0);ms=rs.mean(0);ub=np.array([cluster_upper(rb[:,i]) for i in range(len(a.AG))]);us=np.array([cluster_upper(rs[:,i]) for i in range(len(a.AG))])
    ib=int(np.argmax(mb));is_=int(np.argmax(ms));iub=int(np.argmax(ub));ius=int(np.argmax(us))
    out={'status':'joint calibrated dense-mesh audit','m_per_true_bin':a.M,'threshold':t,'threshold_calibration_max_error':cal[0],
      'threshold_cells':{'B3':list(BCR),'S2':list(SCR)},'train_calibration_matrices':NTRAIN_K,'train_repeats_per_matrix':RTRAIN,
      'audit_grid':[len(a.AUDIT_U),len(a.AUDIT_R)],'validation_calibration_matrices':NVAL_K,'validation_repeats_per_cell_per_matrix':RVAL,
      'B3_max_error':float(mb[ib]),'B3_worst_cell':a.AG[ib].tolist(),'B3_max_cluster95':float(ub[iub]),'B3_upper_cell':a.AG[iub].tolist(),
      'S2_max_error':float(ms[is_]),'S2_worst_cell':a.AG[is_].tolist(),'S2_max_cluster95':float(us[ius]),'S2_upper_cell':a.AG[ius].tolist(),
      'max_error':float(max(mb[ib],ms[is_])),'max_cluster95':float(max(ub[iub],us[ius]))}
    with open('five_bin_calibrated_continuum_critical.json','w') as f:json.dump(out,f,indent=2)
    sh=(len(a.AUDIT_U),len(a.AUDIT_R));fig,ax=plt.subplots(2,2,figsize=(12.6,9.1),constrained_layout=True)
    vmax=max(6,100*max(ub.max(),us.max()))
    for q,z,title in [(ax[0,0],mb,'B3 mean error'),(ax[0,1],ms,'S2 mean error'),(ax[1,0],ub,'B3 clustered 95% upper'),(ax[1,1],us,'S2 clustered 95% upper')]:
        zz=100*z.reshape(sh);im=q.imshow(zz,origin='lower',aspect='auto',extent=[100*a.AUDIT_R[0],100*a.AUDIT_R[-1],a.AUDIT_U[0],a.AUDIT_U[-1]],cmap='viridis',vmin=2.5,vmax=vmax)
        q.contour(100*a.AUDIT_R,a.AUDIT_U,zz,levels=[5],colors='red',linewidths=1.5);j=int(np.argmax(z));q.plot(100*a.AG[j,1],a.AG[j,0],'wx',ms=9,mew=2)
        q.set(title=title,xlabel='scale ratio rho (%)',ylabel='offset u/R');fig.colorbar(im,ax=q,label='risk (%)')
    fig.suptitle('Class P diagnostic — m=2500 full-matrix calibration across the nuisance mesh',fontsize=14)
    fig.savefig('five_bin_calibrated_continuum_critical.png',dpi=180);fig.savefig('five_bin_calibrated_continuum_critical.svg')
    print(json.dumps(out,indent=2))
if __name__=='__main__':main()

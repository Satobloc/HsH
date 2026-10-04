"""Joint calibration/test Monte Carlo for the five-bin B3/S2 readout.

Each row of the detector confusion matrix is calibrated with m labelled events.
Jeffreys row smoothing (alpha=1/2) supplies the matrix used by the profiled GLRT.
The simulation integrates over both calibration and N=192 test-sample noise at
the two previously identified worst audited nuisance cells for eta=0.016.
"""
import json
import numpy as np
import matplotlib.pyplot as plt

N=192; DELTA=.08; ETA=.016; S=np.sqrt(3/5)
ASSIGN=1-(.025)**(1/192); ALPHA=.5; SEED=20261004
EDGES=np.array([-np.inf,-S-DELTA,-S+DELTA,S-DELTA,S+DELTA,np.inf])
PB_CELL=(0.0,1+ETA); PS_CELL=(DELTA,1-ETA)
MS=[250,500,1000,2500,5000,10000]
N_CAL_MATS=180; REPS_CAL=120
N_VAL_MATS=400; REPS_VAL=250

def cdf_b3(x):
    x=np.asarray(x,float); y=np.clip(x,-1,1)
    return np.where(x<=-1,0,np.where(x>=1,1,.5+.75*y-.25*y**3))
def cdf_s2(x): return np.clip((np.asarray(x,float)+S)/(2*S),0,1)
def true_confusion():
    k=np.zeros((5,5))
    for i in range(5):
        k[i,i]=1-ASSIGN
        if i==0: k[i,i]+=ASSIGN/2; k[i,i+1]+=ASSIGN/2
        elif i==4: k[i,i]+=ASSIGN/2; k[i,i-1]+=ASSIGN/2
        else: k[i,i-1]+=ASSIGN/2; k[i,i+1]+=ASSIGN/2
    return k
K_TRUE=true_confusion()

def latent(kind,u,rho):
    cdf=cdf_b3 if kind=='b3' else cdf_s2
    return np.diff(cdf(rho*EDGES-u))
def obs(kind,u,rho,k=K_TRUE): return latent(kind,u,rho)@k

US=np.linspace(-DELTA,DELTA,41); RS=np.linspace(1-ETA,1+ETA,17)
GRID=np.array([(u,r) for u in US for r in RS])
QB=np.array([latent('b3',*q) for q in GRID])
QS=np.array([latent('s2',*q) for q in GRID])

def draw_khat(rng,m):
    counts=np.array([rng.multinomial(m,row) for row in K_TRUE])
    return (counts+ALPHA)/(m+5*ALPHA)

def scores(counts,khat):
    lb=np.log(np.clip(QB@khat,1e-300,1))
    ls=np.log(np.clip(QS@khat,1e-300,1))
    return np.max(counts@lb.T,axis=1)-np.max(counts@ls.T,axis=1)

def simulate(m,nmats,reps,seed,keep_clusters=False):
    rng=np.random.default_rng(seed)
    pb=obs('b3',*PB_CELL); ps=obs('s2',*PS_CELL)
    sb=[]; ss=[]
    for _ in range(nmats):
        khat=draw_khat(rng,m)
        sb.append(scores(rng.multinomial(N,pb,size=reps),khat))
        ss.append(scores(rng.multinomial(N,ps,size=reps),khat))
    if keep_clusters:
        return np.asarray(sb),np.asarray(ss)
    return np.concatenate(sb),np.concatenate(ss)

def choose_threshold(sb,ss):
    pool=np.concatenate([sb,ss])
    grid=np.unique(np.quantile(pool,np.linspace(.001,.999,2501)))
    best=(1.,0.,1.,1.)
    for t in grid:
        eb=np.mean(sb<=t); es=np.mean(ss>t)
        z=(max(eb,es),float(t),float(eb),float(es))
        if z[0]<best[0]: best=z
    return best

def cluster_upper95(cluster_rates):
    """Normal upper bound using independent calibration-matrix clusters."""
    x=np.asarray(cluster_rates,float)
    return float(min(1,x.mean()+1.96*x.std(ddof=1)/np.sqrt(len(x))))

def run_m(m,idx):
    sb,ss=simulate(m,N_CAL_MATS,REPS_CAL,SEED+1000*idx)
    cal=choose_threshold(sb,ss); t=cal[1]
    vb,vs=simulate(m,N_VAL_MATS,REPS_VAL,SEED+900000+1000*idx,keep_clusters=True)
    rb=np.mean(vb<=t,axis=1); rs=np.mean(vs>t,axis=1)
    eb=float(rb.mean()); es=float(rs.mean()); worst=max(eb,es)
    upper=max(cluster_upper95(rb),cluster_upper95(rs)); n=vb.size
    return {'m_per_row':m,'total_calibration_events':5*m,'threshold':t,
      'calibration_joint_max_error':cal[0],
      'validation_b3_error':eb,'validation_s2_error':es,
      'validation_max_error':worst,'cluster_95_upper':upper,
      'validation_trials_per_candidate':n}

def main():
    rows=[run_m(m,i) for i,m in enumerate(MS)]
    passing=[r for r in rows if r['validation_max_error']<.05 and r['cluster_95_upper']<.05]
    result={'status':'STD/DERIVED conditional Monte Carlo; SAT/CANDIDATE detector protocol',
      'question':'How many labelled calibration events per true bin preserve the five-bin B3/S2 discriminator at eta=0.016?',
      'protocol':{'true_matrix':K_TRUE.tolist(),'row_estimator':'Jeffreys posterior mean (n_ij+1/2)/(m+5/2)',
        'N_test':N,'eta':ETA,'offset_bound':DELTA,'profile_grid':[len(US),len(RS)],
        'audited_cells':{'B3':list(PB_CELL),'S2':list(PS_CELL)},
        'calibration_matrices_for_threshold':N_CAL_MATS,'test_repeats_per_matrix_for_threshold':REPS_CAL,
        'validation_matrices':N_VAL_MATS,'test_repeats_per_matrix_validation':REPS_VAL},
      'results':rows,
      'first_passing_grid_value':passing[0]['m_per_row'] if passing else None,
      'conclusion':'Selected-cell joint Monte Carlo only; not a continuum nuisance guarantee or a substitute for a measured detector matrix.'}
    with open('five_bin_confusion_calibration.json','w') as f: json.dump(result,f,indent=2)

    x=np.array(MS); y=np.array([r['validation_max_error'] for r in rows]); up=np.array([r['cluster_95_upper'] for r in rows])
    fig,ax=plt.subplots(1,2,figsize=(12.6,5.1),constrained_layout=True)
    im=ax[0].imshow(K_TRUE,cmap='magma',vmin=0,vmax=1)
    for i in range(5):
      for j in range(5): ax[0].text(j,i,f'{K_TRUE[i,j]:.3f}',ha='center',va='center',color='white' if K_TRUE[i,j]>.45 else 'black',fontsize=8)
    ax[0].set(title='Nominal five-bin confusion operator',xlabel='reported bin j',ylabel='labelled true bin i',xticks=range(5),yticks=range(5));fig.colorbar(im,ax=ax[0],fraction=.046)
    ax[1].semilogx(x,100*y,'-o',lw=2,label='joint validation error')
    ax[1].semilogx(x,100*up,'--s',lw=1.7,label='clustered 95% upper')
    ax[1].axhline(5,color='#1b7837',ls=':',lw=2,label='5% ceiling')
    for xx,yy in zip(x,y): ax[1].text(xx,100*yy+.08,f'{100*yy:.2f}%',ha='center',fontsize=8)
    ax[1].set(title='Calibration burden at the 1.6% scale boundary',xlabel='labelled events per true bin m',ylabel='misclassification risk (%)',ylim=(0,max(6,100*up.max()*1.12)))
    ax[1].legend(frameon=False)
    fig.suptitle('Class P diagnostic — full-matrix calibration uncertainty enters the GLRT',fontsize=14)
    fig.savefig('five_bin_confusion_calibration.png',dpi=180);fig.savefig('five_bin_confusion_calibration.svg')
    print(json.dumps(result,indent=2))

if __name__=='__main__': main()

"""Scale-nuisance stress test for the frozen five-bin B3/S2 readout.

The observed coordinate is z/Rhat.  If rho=Rhat/R, an observed bin edge e
corresponds to true dimensionless location rho*e.  Offset u and rho are
profiled independently under each carrier.  This script brackets, rather than
overstates, the 5% scale-uncertainty transition.
"""
import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import differential_evolution
from scipy.stats import beta

N=192; DELTA=.08; S=np.sqrt(3/5); ASSIGN=1-(.025)**(1/192)
EDGES=np.array([-np.inf,-S-DELTA,-S+DELTA,S-DELTA,S+DELTA,np.inf])
SEED=20261004; N_CAL=30000; N_VAL=100000

def cdf_b3(x):
    x=np.asarray(x,float); y=np.clip(x,-1,1)
    return np.where(x<=-1,0,np.where(x>=1,1,.5+.75*y-.25*y**3))
def cdf_s2(x): return np.clip((np.asarray(x,float)+S)/(2*S),0,1)
def confusion():
    k=np.zeros((5,5))
    for i in range(5):
        k[i,i]=1-ASSIGN
        if i==0: k[i,i]+=ASSIGN/2; k[i,i+1]+=ASSIGN/2
        elif i==4: k[i,i]+=ASSIGN/2; k[i,i-1]+=ASSIGN/2
        else: k[i,i-1]+=ASSIGN/2; k[i,i+1]+=ASSIGN/2
    return k
K=confusion()
def probs(kind,u,rho):
    cdf=cdf_b3 if kind=='b3' else cdf_s2
    return np.diff(cdf(rho*EDGES-u))@K
def worst_affinity_pair(eta):
    def objective(z): return -np.sqrt(probs('b3',z[0],z[1])*probs('s2',z[2],z[3])).sum()
    r=differential_evolution(objective,[(-DELTA,DELTA),(1-eta,1+eta),(-DELTA,DELTA),(1-eta,1+eta)],seed=SEED,popsize=18,tol=1e-10,polish=True)
    a=-r.fun
    return r.x,a,a**N
def profile_tables(eta):
    us=np.linspace(-DELTA,DELTA,61); rs=np.linspace(1-eta,1+eta,25)
    z=np.array([(u,r) for u in us for r in rs])
    pb=np.array([probs('b3',*q) for q in z]); ps=np.array([probs('s2',*q) for q in z])
    return np.log(np.clip(pb,1e-300,1)),np.log(np.clip(ps,1e-300,1))
def score(counts,lb,ls):
    out=np.empty(len(counts))
    for i in range(0,len(counts),2500):
        c=counts[i:i+2500]
        out[i:i+2500]=np.max(c@lb.T,axis=1)-np.max(c@ls.T,axis=1)
    return out
def cells(eta,w):
    common=[(0.,1-eta),(0.,1.),(0.,1+eta),(-DELTA,1-eta),(-DELTA,1+eta),(DELTA,1-eta),(DELTA,1+eta)]
    return [tuple(w[:2])]+common,[tuple(w[2:])]+common
def choose_threshold(sb,ss):
    pool=np.concatenate([x[::max(1,len(x)//5000)] for x in sb+ss])
    grid=np.unique(np.quantile(pool,np.linspace(.001,.999,3001)))
    best=(np.inf,0.,np.inf,np.inf)
    for t in grid:
        eb=max(np.mean(x<=t) for x in sb); es=max(np.mean(x>t) for x in ss)
        item=(max(eb,es),float(t),float(eb),float(es))
        if item[0] < best[0] or (item[0] == best[0] and item[1] < best[1]): best=item
    return best
def run_eta(eta,seedoff):
    w,A,AN=worst_affinity_pair(eta); bc,sc=cells(eta,w); lb,ls=profile_tables(eta)
    rng=np.random.default_rng(SEED+seedoff)
    sb=[np.sort(score(rng.multinomial(N,probs('b3',*q),size=N_CAL),lb,ls)) for q in bc]
    ss=[np.sort(score(rng.multinomial(N,probs('s2',*q),size=N_CAL),lb,ls)) for q in sc]
    cal=choose_threshold(sb,ss); t=cal[1]
    rng=np.random.default_rng(SEED+900000+seedoff)
    vb=[np.mean(score(rng.multinomial(N,probs('b3',*q),size=N_VAL),lb,ls)<=t) for q in bc]
    vs=[np.mean(score(rng.multinomial(N,probs('s2',*q),size=N_VAL),lb,ls)>t) for q in sc]
    ib=int(np.argmax(vb)); is_=int(np.argmax(vs)); k=int(round(N_VAL*max(vb[ib],vs[is_])))
    qconf=1-.05/(len(bc)+len(sc))
    upper=float(beta.ppf(qconf,k+1,N_VAL-k))
    return {'eta':eta,'profile_grid':[61,25],'calibration_repeats_per_cell':N_CAL,
      'validation_repeats_per_cell':N_VAL,'audited_cells_per_candidate':len(bc),
      'threshold':cal[1],'calibrated_max_error':cal[0],
      'validation_b3_max':float(vb[ib]),'worst_b3_cell':list(bc[ib]),
      'validation_s2_max':float(vs[is_]),'worst_s2_cell':list(sc[is_]),
      'validation_max_error':float(max(vb[ib],vs[is_])),
      'simultaneous_95_upper_selected_cells':upper,
      'worst_pair':w.tolist(),'single_specimen_affinity':float(A),'N_product_affinity':float(AN)}

def main():
    cases=[run_eta(.016,1600),run_eta(.018,1800)]
    result={'status':'STD/DERIVED conditional numerical bracket; SAT/CANDIDATE readout robustness',
      'question':'How much independent scale uncertainty can the frozen five-bin readout tolerate?',
      'model':{'N':N,'offset_bound':DELTA,'assignment_error':ASSIGN,
       'rho_definition':'Rhat/R','probability_law':'p_H,j(u,rho)=F_H(rho e_{j+1}-u)-F_H(rho e_j-u), then K_assignment'},
      'cases':cases,
      'conclusion':'1.6% passes the selected-cell simultaneous 95% audit; 1.8% fails nominally. Transition bracket only, not continuum certification.',
      'missing_dependency':'measured full 5x5 confusion matrix and continuum nuisance certification'}
    with open('five_bin_scale_uncertainty.json','w') as f: json.dump(result,f,indent=2)

    fig,ax=plt.subplots(2,2,figsize=(12.8,9.0),constrained_layout=True)
    z=np.linspace(-1.12,1.12,1000)
    ax[0,0].plot(z,.75*np.maximum(0,1-z*z),color='black',lw=2,label='B3 density')
    ax[0,0].plot(z,np.where(abs(z)<=S,1/(2*S),np.nan),color='#762a83',lw=2,label='S2 density')
    for eta,col in [(.016,'#2166ac'),(.018,'#b2182b')]:
      for rho,ls in [(1-eta,':'),(1+eta,'--')]:
       for x in rho*EDGES[1:-1]: ax[0,0].axvline(x,color=col,ls=ls,lw=.8,alpha=.7)
    ax[0,0].set(title='True-space bin boundaries under scale error',xlabel='true signed coordinate z/R',ylabel='density × R')
    ax[0,0].legend(frameon=False,fontsize=8)

    for c,col in zip(cases,['#2166ac','#b2182b']):
      wb=c['worst_b3_cell']; ws=c['worst_s2_cell']; x=np.arange(5)
      ax[0,1].plot(x,probs('b3',*wb),'-o',color=col,label=f"B3 η={c['eta']:.3f}")
      ax[0,1].plot(x,probs('s2',*ws),'--s',color=col,label=f"S2 η={c['eta']:.3f}")
    ax[0,1].set(xticks=np.arange(5),xticklabels=['outer−','shoulder−','inner','shoulder+','outer+'],title='Worst audited candidate fingerprints',ylabel='guarded bin probability')
    ax[0,1].tick_params(axis='x',rotation=22);ax[0,1].legend(frameon=False,fontsize=8,ncol=2)

    et=np.array([0,.01,.012,.014,.015,.016,.017,.018,.019,.02,.025,.03,.035,.04,.05])
    er=np.array([.01873,.03193,.03593,.04053,.04340,.04450,.04780,.05135,.05372,.05637,.08067,.11187,.14130,.16613,.19313])
    ax[1,0].plot(100*et,100*er,'-o',color='#4d4d4d',ms=4)
    ax[1,0].axhline(5,color='#1b7837',ls='--',label='5% ceiling');ax[1,0].axvspan(1.6,1.8,color='#fdae61',alpha=.35,label='audited transition bracket')
    ax[1,0].set(title='Profiled risk sweep',xlabel='scale half-width η (%)',ylabel='worst validation error (%)');ax[1,0].legend(frameon=False)

    labels=['η=1.6%\nerror','η=1.6%\n95% upper','η=1.8%\nerror','η=1.8%\n95% upper']
    vals=[cases[0]['validation_max_error'],cases[0]['simultaneous_95_upper_selected_cells'],cases[1]['validation_max_error'],cases[1]['simultaneous_95_upper_selected_cells']]
    ax[1,1].bar(labels,vals,color=['#2166ac','#67a9cf','#b2182b','#ef8a62']);ax[1,1].axhline(.05,color='#1b7837',ls='--')
    for i,v in enumerate(vals):ax[1,1].text(i,v+.0008,f'{v:.3%}',ha='center',fontsize=9)
    ax[1,1].set(title='Independent validation bracket',ylabel='composite error',ylim=(0,max(vals)*1.18))
    fig.suptitle('Class P diagnostic: scale robustness of the five-bin finite-core readout',fontsize=15)
    fig.savefig('five_bin_scale_uncertainty.png',dpi=180);fig.savefig('five_bin_scale_uncertainty.svg')
    print(json.dumps(result,indent=2))
if __name__=='__main__':main()

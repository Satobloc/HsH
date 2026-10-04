"""Exact post-factor and carrier-dependence diagnostic for five-bin readout drift."""
import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import chi2, ncx2
from scipy.optimize import brentq

ASSIGN = 1-(.025)**(1/192)
ALPHA = .05
POWER = .80
DF = 20  # five independent 2x5 homogeneity tables: 5*(5-1)


def nominal_k():
    k=np.zeros((5,5))
    for i in range(5):
        k[i,i]=1-ASSIGN
        if i==0: k[i,i]+=ASSIGN/2; k[i,i+1]+=ASSIGN/2
        elif i==4: k[i,i]+=ASSIGN/2; k[i,i-1]+=ASSIGN/2
        else: k[i,i-1]+=ASSIGN/2; k[i,i+1]+=ASSIGN/2
    return k


def drift(sign,d):
    D=np.eye(5)
    if sign==1:
        for i in range(4): D[i]=0;D[i,i]=1-d;D[i,i+1]=d
    elif sign==-1:
        for i in range(1,5): D[i]=0;D[i,i]=1-d;D[i,i-1]=d
    elif sign==0:
        pass
    return D


K=nominal_k()


def single_factor(test):
    D=np.linalg.solve(K,test)
    return D, float(np.min(D)), float(np.max(np.abs(D.sum(1)-1)))


def shared_residual(tests):
    # Equal-weight exact least-squares factor. The average of stochastic factors
    # remains stochastic, so the constrained and unconstrained optima coincide.
    D=np.mean([np.linalg.solve(K,t) for t in tests],axis=0)
    num=sum(np.linalg.norm(K@D-t,'fro')**2 for t in tests)
    den=sum(np.linalg.norm(t,'fro')**2 for t in tests)
    return float(np.sqrt(num/den)),D


def lambda_per_m(p,q):
    bar=(p+q)/2
    z=np.zeros_like(bar);np.divide((p-q)**2,bar,out=z,where=bar>0)
    return float(.5*np.sum(z))


CRIT=chi2.ppf(1-ALPHA,DF)


def m_for_power(lp):
    if lp<=0:return np.inf
    f=lambda m: 1-ncx2.cdf(CRIT,DF,m*lp)-POWER
    hi=1.
    while f(hi)<0: hi*=2
    return float(brentq(f,0,hi))


def d_for_power(m,mode='opposed'):
    def f(d):
        p=K@drift(1,d);q=K@drift(-1,d) if mode=='opposed' else K
        return 1-ncx2.cdf(CRIT,DF,m*lambda_per_m(p,q))-POWER
    return float(brentq(f,1e-10,.1))


def direct_nonfactor(d):
    # Only labelled true row 2 acquires a direct 2->4 leakage. This is a
    # deliberately nonuniform row change, not a post-channel assumption.
    T=K.copy(); T[2,2]-=d; T[2,4]+=d
    D,mn,rows=single_factor(T)
    # Frobenius residual after clipping negative entries and renormalizing rows:
    Dc=np.maximum(D,0);Dc/=Dc.sum(1,keepdims=True)
    res=np.linalg.norm(K@Dc-T,'fro')/np.linalg.norm(T,'fro')
    return float(mn),float(res)


def main():
    ds=np.r_[np.linspace(0,0.002,21),np.linspace(.0025,.01,16)]
    rows=[]
    for d in ds:
        plus=K@drift(1,d);minus=K@drift(-1,d);ident=K.copy()
        ropp,_=shared_residual([plus,minus])
        rone,_=shared_residual([plus,ident])
        lp_opp=lambda_per_m(plus,minus);lp_one=lambda_per_m(plus,ident)
        mn,rnf=direct_nonfactor(d)
        rows.append({'d':float(d),'shared_residual_opposed':ropp,
          'shared_residual_one_sided':rone,'m80_opposed':m_for_power(lp_opp),
          'm80_one_sided':m_for_power(lp_one),'direct_min_D_entry':mn,
          'direct_clipped_residual':rnf})

    # Exact check at the conservative drift tolerance from the previous packet.
    target=0.00047514872444755717
    plus=K@drift(1,target);minus=K@drift(-1,target)
    ropp,_=shared_residual([plus,minus]);lp=lambda_per_m(plus,minus)
    result={'status':'STD/DERIVED channel-factor diagnostic; SAT/CANDIDATE application',
      'question':'Can test-time change be represented by one stationary stochastic post-factor, and what calibration burden detects carrier-dependent drift?',
      'theorem':{'unique_factor':'D*=K_cal^{-1}K_test when K_cal is nonsingular',
        'existence':'D*>=0 and D*1=1','shared_stationarity':'all carrier classes must have the same D*'},
      'nominal':{'condition_number':float(np.linalg.cond(K)),'determinant':float(np.linalg.det(K))},
      'target':{'d':target,'opposed_shared_residual':ropp,'m_per_true_bin_for_80pct_power':m_for_power(lp),
        'power_at_m2500':float(1-ncx2.cdf(CRIT,DF,2500*lp)),
        'opposed_d_for_80pct_power_at_m2500':d_for_power(2500,'opposed'),
        'one_sided_d_for_80pct_power_at_m2500':d_for_power(2500,'one')},
      'rows':rows,
      'failure_condition':'Reject stationary post-drift if any inferred factor has a materially negative entry or if a shared-factor goodness-of-fit test rejects after multiplicity and calibration uncertainty are included.'}
    open('five_bin_postfactor_diagnostic.json','w').write(json.dumps(result,indent=2))

    x=100*ds
    fig,ax=plt.subplots(1,2,figsize=(12.5,5.2),constrained_layout=True)
    ax[0].plot(x,100*np.array([r['shared_residual_opposed'] for r in rows]),label='opposed carrier drift',lw=2)
    ax[0].plot(x,100*np.array([r['shared_residual_one_sided'] for r in rows]),label='one carrier drifts',lw=2)
    ax[0].plot(x,100*np.array([r['direct_clipped_residual'] for r in rows]),label='single nonfactorable row change',lw=2)
    ax[0].axvline(100*target,color='k',ls='--',lw=1,label='prior coherent-risk limit')
    ax[0].set(xlabel='drift probability d (%)',ylabel='normalized factor residual (%)',title='Post-factor existence / sharing residual')
    ax[0].grid(alpha=.25);ax[0].legend(frameon=False)
    mo=np.array([r['m80_opposed'] for r in rows]);mn=np.array([r['m80_one_sided'] for r in rows])
    ax[1].semilogy(x[1:],mo[1:],label='opposed carrier drift',lw=2)
    ax[1].semilogy(x[1:],mn[1:],label='one carrier drifts',lw=2)
    ax[1].axhline(2500,color='#b2182b',ls='--',label='current m=2500/bin')
    ax[1].axvline(100*target,color='k',ls='--',lw=1)
    ax[1].set(xlabel='drift probability d (%)',ylabel='labels / true bin for 80% power',title='Calibration burden for carrier-dependence test')
    ax[1].grid(alpha=.25);ax[1].legend(frameon=False)
    fig.suptitle('Class P diagnostic — stationary post-drift versus carrier-dependent channel change')
    fig.savefig('five_bin_postfactor_diagnostic.svg');fig.savefig('five_bin_postfactor_diagnostic.png',dpi=180)
    print(json.dumps(result['target'],indent=2))


if __name__=='__main__':main()

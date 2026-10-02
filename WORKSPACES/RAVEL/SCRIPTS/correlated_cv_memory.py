import numpy as np
from scipy.optimize import least_squares
import matplotlib.pyplot as plt

TRUE=dict(q=2.4,t1=.25,t2=2.0,A1=.012,A2=.008)

def roots_two(a,p=TRUE):
    out=[]
    for x in a:
        w=1/x; z=np.poly1d([1,0])
        d1=np.poly1d([-1j*p['t1'],1]); d2=np.poly1d([-1j*p['t2'],1])
        poly=(np.poly1d([-1,0,w*w])*d1*d2
              -1j*p['A1']*x**p['q']*z*d2
              -1j*p['A2']*x**p['q']*z*d1)
        rr=np.roots(poly); cc=[u for u in rr if u.real>0 and u.imag<0]
        out.append(min(cc,key=lambda u:abs(u-w)))
    return np.array(out)

def unpack(x,kind):
    if kind==1: return dict(q=x[1],taus=[np.exp(x[0])],amps=[np.exp(x[2])])
    t1=np.exp(x[0]); t2=t1+np.exp(x[1])
    return dict(q=x[2],taus=[t1,t2],amps=[np.exp(x[3]),np.exp(x[4])])

def F_and_deriv(a,z,x,kind):
    p=unpack(x,kind); F=z*z; dF=2*z
    for t,A0 in zip(p['taus'],p['amps']):
        A=A0*a**p['q']; den=1-1j*z*t
        F += 1j*z*A/den
        dF += 1j*A/den-z*A*t/(den*den)
    return F,dF

def g_and_J(a,z,x,kind):
    F,dF=F_and_deriv(a,z,x,kind)
    g=F.imag
    N=len(z); J=np.zeros((N,2*N))
    J[np.arange(N),np.arange(N)]=dF.imag
    J[np.arange(N),N+np.arange(N)]=dF.real
    return g,J

def pole_cov(z,sigma=.0001,rho=.75,eta=.35):
    N=len(z); ii=np.arange(N)
    R=rho**np.abs(ii[:,None]-ii[None,:])
    D=np.diag(np.abs(z)); B=sigma*sigma*D@R@D
    return np.block([[B,eta*B],[eta*B,B]])

def sample(z,C,rng):
    d=rng.multivariate_normal(np.zeros(2*len(z)),C)
    return z+d[:len(z)]+1j*d[len(z):]

def fit(a,z,C,train,kind):
    if kind==1:
        starts=[np.array([np.log(.4),2.0,np.log(.02)]),
                np.array([np.log(1.3),2.5,np.log(.02)])]
        lo=[-5,-3,-12]; hi=[4,7,2]
    else:
        starts=[np.array([np.log(.2),np.log(1.5),2.3,np.log(.01),np.log(.01)]),
                np.array([np.log(.5),np.log(2.0),2.5,np.log(.015),np.log(.005)])]
        lo=[-5,-5,-3,-12,-12]; hi=[3,4,7,2,2]
    best=None
    for x0 in starts:
        x=x0.copy()
        for _ in range(3):
            g,J=g_and_J(a,z,x,kind); Cr=J@C@J.T
            Ct=Cr[np.ix_(train,train)]+np.eye(len(train))*1e-18
            L=np.linalg.cholesky(Ct)
            fun=lambda y: np.linalg.solve(L,g_and_J(a,z,y,kind)[0][train])
            sol=least_squares(fun,x,bounds=(lo,hi),max_nfev=1000)
            x=sol.x
        score=np.sum(fun(x)**2)
        if best is None or score<best[0]: best=(score,x)
    return best[1]

def conditional_score(a,z,C,x,kind,train,test):
    g,J=g_and_J(a,z,x,kind); Cr=J@C@J.T
    Crr=Cr[np.ix_(train,train)]+np.eye(len(train))*1e-18
    Ctt=Cr[np.ix_(test,test)]+np.eye(len(test))*1e-18
    Ctr=Cr[np.ix_(test,train)]
    alpha=np.linalg.solve(Crr,g[train])
    mean=Ctr@alpha
    S=Ctt-Ctr@np.linalg.solve(Crr,Ctr.T)+np.eye(len(test))*1e-18
    e=g[test]-mean
    sign,ld=np.linalg.slogdet(S)
    return e@np.linalg.solve(S,e)+ld+len(test)*np.log(2*np.pi)

def crossval(a,z,C,K=5):
    N=len(a)
    # Keep the two span endpoints as calibration anchors in every training set.
    # The held-out radii are otherwise interleaved, so each test point is a true
    # interpolation rather than an accidental endpoint extrapolation.
    interior=np.arange(1,N-1)
    folds=[interior[k::K] for k in range(K)]
    scores={1:[],2:[]}; params={1:[],2:[]}
    for test in folds:
        train=np.setdiff1d(np.arange(N),test)
        for kind in [1,2]:
            x=fit(a,z,C,train,kind)
            scores[kind].append(conditional_score(a,z,C,x,kind,train,test))
            params[kind].append(unpack(x,kind))
    return scores,params

def main():
    a=np.logspace(-1,np.log10(3),41); z0=roots_two(a)
    C=pole_cov(z0); rng=np.random.default_rng(241); z=sample(z0,C,rng)
    scores,params=crossval(a,z,C)
    d=np.array(scores[1])-np.array(scores[2])
    print('fold one-pole NLL',scores[1])
    print('fold two-pole NLL',scores[2])
    print('delta NLL one-minus-two',d,'sum',d.sum())
    print('two-pole heldout fits')
    for p in params[2]: print(p)
    p1=params[1][0]; print('example one-pole',p1)

    # Full-data fits and conditional predictive residuals by held-out point.
    allidx=np.arange(len(a)); x1=fit(a,z,C,allidx,1); x2=fit(a,z,C,allidx,2)
    g1,_=g_and_J(a,z,x1,1); g2,_=g_and_J(a,z,x2,2)
    pfit1=unpack(x1,1); pfit2=unpack(x2,2)

    fig,ax=plt.subplots(2,2,figsize=(12,9),constrained_layout=True)
    ax[0,0].errorbar(np.arange(5),d,fmt='o',capsize=3)
    ax[0,0].axhline(0,c='k',lw=1)
    ax[0,0].set(xlabel='interleaved held-out fold',ylabel='Δ predictive NLL (1 pole − 2 pole)',
                title='Positive values favor two relaxation channels')

    ax[0,1].semilogx(a,g1/(np.abs(z)**2),'o-',label='one-pole')
    ax[0,1].semilogx(a,g2/(np.abs(z)**2),'o-',label='two-pole')
    ax[0,1].axhline(0,c='k',lw=1)
    ax[0,1].set(xlabel='radius a',ylabel='normalized reality residual',
                title='Correlated-noise fit residuals'); ax[0,1].legend()

    labs=['τ₁','τ₂','q','A₁','A₂']
    truth=[TRUE['t1'],TRUE['t2'],TRUE['q'],TRUE['A1'],TRUE['A2']]
    vals=np.array([[p['taus'][0],p['taus'][1],p['q'],p['amps'][0],p['amps'][1]]
                   for p in params[2]])
    for j in range(5):
        ax[1,0].scatter(np.full(5,j),vals[:,j],s=35,alpha=.8)
        ax[1,0].plot(j,truth[j],'r*',ms=13)
    ax[1,0].set_xticks(range(5),labs)
    ax[1,0].set_yscale('log')
    ax[1,0].set(ylabel='parameter value',title='Two-pole recovery across held-out folds')

    R=C[:len(a),:len(a)]
    im=ax[1,1].imshow(R/np.sqrt(np.outer(np.diag(R),np.diag(R))),
                      origin='lower',cmap='coolwarm',vmin=-1,vmax=1,aspect='auto')
    ax[1,1].set(xlabel='radius index',ylabel='radius index',
                title='Injected radius-to-radius pole-error correlation')
    fig.colorbar(im,ax=ax[1,1],label='correlation')
    fig.suptitle('Correlated held-out likelihood: one versus two memory poles',fontsize=15)
    fig.savefig('correlated_cv_memory.png',dpi=180)
    fig.savefig('correlated_cv_memory.svg')

if __name__=='__main__': main()

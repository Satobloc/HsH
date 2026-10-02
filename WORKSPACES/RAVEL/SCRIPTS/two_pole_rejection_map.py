import numpy as np
from scipy.optimize import least_squares
import matplotlib.pyplot as plt

Q=2.4
ALT=dict(t1=0.25,t2=2.0,A01=0.012,A02=0.008,q=Q)
NULL=dict(tau=0.8,A0=0.020,q=Q)

def root_one(a,tau,A0,q):
    out=[]
    for x in a:
        w=1/x; A=A0*x**q
        coef=[1j*tau,-1,-1j*(tau*w*w+A),w*w]
        rr=np.roots(coef)
        c=[z for z in rr if z.real>0 and z.imag<0]
        out.append(min(c,key=lambda z:abs(z-w)))
    return np.array(out)

def root_two(a,p=ALT):
    out=[]
    for x in a:
        w=1/x; A1=p['A01']*x**p['q']; A2=p['A02']*x**p['q']
        z=np.poly1d([1,0])
        d1=np.poly1d([-1j*p['t1'],1]); d2=np.poly1d([-1j*p['t2'],1])
        poly=(np.poly1d([-1,0,w*w])*d1*d2
              -1j*A1*z*d2-1j*A2*z*d1)
        rr=np.roots(poly)
        c=[u for u in rr if u.real>0 and u.imag<0]
        out.append(min(c,key=lambda u:abs(u-w)))
    return np.array(out)

def fit_one(a,z,starts=None):
    if starts is None:
        starts=[(.3,2.0,.02),(1.5,2.6,.02)]
    def residual(x):
        tau=np.exp(x[0]); q=x[1]; A0=np.exp(x[2])
        w2=z*z+1j*z*(A0*a**q)/(1-1j*z*tau)
        return w2.imag/(np.abs(z)**2+1e-30)
    best=None
    for tau,q,A0 in starts:
        sol=least_squares(residual,[np.log(tau),q,np.log(A0)],
             bounds=([-8,-4,-20],[8,8,4]),max_nfev=1500)
        if best is None or np.sum(sol.fun**2)<np.sum(best.fun**2): best=sol
    tau=np.exp(best.x[0]); q=best.x[1]; A0=np.exp(best.x[2])
    return tau,q,A0,best.fun,np.sqrt(np.mean(best.fun**2))

def noisy(z,sigma,rng):
    return z+sigma*np.abs(z)*(rng.normal(size=z.size)+1j*rng.normal(size=z.size))/np.sqrt(2)

def detection_grid(noises,amaxs,nmc=50,seed=83):
    rng=np.random.default_rng(seed)
    prob=np.zeros((len(noises),len(amaxs)))
    thresholds=np.zeros_like(prob)
    for j,amax in enumerate(amaxs):
        a=np.logspace(-1,np.log10(amax),31)
        zn=root_one(a,NULL['tau'],NULL['A0'],NULL['q'])
        za=root_two(a)
        for i,sig in enumerate(noises):
            rn=[]; ra=[]
            for _ in range(nmc):
                rn.append(fit_one(a,noisy(zn,sig,rng))[-1])
                ra.append(fit_one(a,noisy(za,sig,rng))[-1])
            th=np.percentile(rn,95)
            thresholds[i,j]=th
            prob[i,j]=np.mean(np.array(ra)>th)
    return prob,thresholds

def main():
    a=np.logspace(-1,np.log10(3),41)
    z2=root_two(a); fit=fit_one(a,z2)
    z1=root_one(a,NULL['tau'],NULL['A0'],NULL['q']); fnull=fit_one(a,z1)
    print('two-pole injection',ALT)
    print('best wrong one-pole tau q A0 rms',fit[0],fit[1],fit[2],fit[4])
    print('null one-pole recovery tau q A0 rms',fnull[0],fnull[1],fnull[2],fnull[4])
    print('residual peak radius',a[np.argmax(np.abs(fit[3]))],fit[3][np.argmax(np.abs(fit[3]))])

    noises=np.logspace(-6,-3,7); amaxs=np.array([.3,.5,.8,1.2,2.0,3.0])
    prob,th=detection_grid(noises,amaxs)
    print('detection probabilities rows=noise cols=amax')
    print(prob)
    print('95pct null thresholds')
    print(th)

    # one-pole effective response with the blind fit, compared to two-pole truth
    om=np.logspace(-1.2,1.4,400)
    M2=ALT['A01']/(1-1j*om*ALT['t1'])+ALT['A02']/(1-1j*om*ALT['t2'])
    M1=fit[2]/(1-1j*om*fit[0])

    fig,ax=plt.subplots(2,2,figsize=(12,9),constrained_layout=True)
    ax[0,0].loglog(om,np.abs(M2),'k',lw=2,label='injected two-pole')
    ax[0,0].loglog(om,np.abs(M1),'r--',lw=2,label='best one-pole reduction')
    ax[0,0].axvline(1/ALT['t2'],c='0.5',ls=':')
    ax[0,0].axvline(1/ALT['t1'],c='0.5',ls=':')
    ax[0,0].set(xlabel='angular frequency ω',ylabel='|memory response|',
                title='Two relaxation knees cannot share one τ'); ax[0,0].legend()

    sc=ax[0,1].scatter(z2.real,-z2.imag,c=np.log10(a),cmap='viridis',s=38)
    ax[0,1].set(xlabel='Re z',ylabel='-Im z',title='Complex-pole trajectory (color = log radius)')
    fig.colorbar(sc,ax=ax[0,1],label='log10 a')

    ax[1,0].semilogx(a,fit[3],'o-',label='two-pole data fit as one pole')
    ax[1,0].axhline(0,c='k',lw=1)
    ax[1,0].axvline(ALT['t1'],c='0.5',ls=':',label='a≈τ₁,τ₂')
    ax[1,0].axvline(ALT['t2'],c='0.5',ls=':')
    ax[1,0].set(xlabel='radius a',ylabel='normalized Im(ωc²)',
                title='Structured reality-closure failure'); ax[1,0].legend()

    xe=np.r_[amaxs[0]-(amaxs[1]-amaxs[0])/2,
             (amaxs[:-1]+amaxs[1:])/2,
             amaxs[-1]+(amaxs[-1]-amaxs[-2])/2]
    ye=np.r_[noises[0]/np.sqrt(noises[1]/noises[0]),
             np.sqrt(noises[:-1]*noises[1:]),
             noises[-1]*np.sqrt(noises[-1]/noises[-2])]
    im=ax[1,1].pcolormesh(xe,ye,prob,shading='flat',cmap='magma',vmin=0,vmax=1)
    ax[1,1].set(yscale='log',xlabel='maximum radius in sweep',ylabel='relative pole noise',
                title='Probability of rejecting wrong one-pole model')
    fig.colorbar(im,ax=ax[1,1],label='rejection probability')
    fig.suptitle('Two-pole causal memory: blind one-pole rejection map',fontsize=15)
    fig.savefig('two_pole_rejection_map.png',dpi=180)
    fig.savefig('two_pole_rejection_map.svg')

if __name__=='__main__':
    main()

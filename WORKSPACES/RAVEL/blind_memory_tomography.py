import numpy as np
from scipy.optimize import least_squares
import matplotlib.pyplot as plt

TRUE = dict(q=2.4, tau=0.8, A0=0.02)

def poles(a, q=TRUE['q'], tau=TRUE['tau'], A0=TRUE['A0']):
    out=[]
    for ai in a:
        w=1/ai; A=A0*ai**q
        coef=[1j*tau, -1, -1j*(tau*w*w+A), w*w]
        rr=np.roots(coef)
        cand=[z for z in rr if z.real>0 and z.imag<0]
        out.append(min(cand,key=lambda z:abs(z-w)))
    return np.array(out)

def infer_strict(a,z,x0=(0.6,2.0,-4.0)):
    # Unknowns are log(tau), q, log(A0). The bare frequency is not supplied.
    def r(x):
        tau=np.exp(x[0]); q=x[1]; A0=np.exp(x[2])
        w2=z*z+1j*z*(A0*a**q)/(1-1j*z*tau)
        # normalize imaginary closure by observed |z|^2
        return w2.imag/(np.abs(z)**2+1e-30)
    sol=least_squares(r,[np.log(x0[0]),x0[1],x0[2]],max_nfev=3000,
                      bounds=([-8,-5,-20],[8,8,5]))
    tau=np.exp(sol.x[0]); q=sol.x[1]; A0=np.exp(sol.x[2])
    w2=z*z+1j*z*(A0*a**q)/(1-1j*z*tau)
    return tau,q,A0,w2,sol.cost

def infer_known_baseline(a,z):
    wc=1/a; S=z*z-wc*wc
    c=1j*S/z; d=S
    tau=-np.sum(c.imag*d.imag)/np.sum(d.imag*d.imag)
    B=S*(1-1j*z*tau)/(-1j*z)
    ok=B.real>0
    q,lnA=np.polyfit(np.log(a[ok]),np.log(B.real[ok]),1)
    return tau,q,np.exp(lnA),B

def mc(a,z,noise,n=300,seed=7):
    rng=np.random.default_rng(seed); strict=[]; known=[]
    for _ in range(n):
        zn=z+noise*np.abs(z)*(rng.normal(size=z.size)+1j*rng.normal(size=z.size))/np.sqrt(2)
        try:
            s=infer_strict(a,zn)
            if s[3].real.min()>0: strict.append(s[:3])
        except Exception: pass
        try: known.append(infer_known_baseline(a,zn)[:3])
        except Exception: pass
    return np.array(strict),np.array(known)

def pct(x): return np.percentile(x,[2.5,50,97.5],axis=0)

def main():
    a=np.logspace(-1,np.log10(3.0),41); z=poles(a)
    s=infer_strict(a,z); k=infer_known_baseline(a,z)
    full_s,full_k=mc(a,z,2e-5)
    hi=a<=0.35; lo=a>=1.5
    hs,hk=mc(a[hi],z[hi],2e-5,seed=9)
    ls,lk=mc(a[lo],z[lo],2e-5,seed=11)
    print('truth',TRUE)
    print('strict noiseless tau q A0 cost minw2',s[0],s[1],s[2],s[4],s[3].real.min())
    print('known noiseless tau q A0',k[:3])
    for name,x in [('strict_full',full_s),('known_full',full_k),('strict_highfreq',hs),('strict_lowfreq',ls)]:
        print(name,'n',len(x),'CI',pct(x) if len(x) else None)

    # Profile objective: for each (tau,q), eliminate A0 linearly in the reality constraint.
    taus=np.logspace(-1.3,1.1,180); qs=np.linspace(1.2,3.6,180)
    Z=z[:,None,None]; AA=a[:,None,None]; T=taus[None,:,None]; Q=qs[None,None,:]
    base=(Z*Z).imag/(np.abs(Z)**2)
    g=(1j*Z*AA**Q/(1-1j*Z*T)).imag/(np.abs(Z)**2)
    Ahat=-np.sum(base*g,axis=0)/np.sum(g*g,axis=0)
    resid=base+g*Ahat[None,:,:]
    obj=np.sqrt(np.mean(resid*resid,axis=0))
    obj[(Ahat<=0)]=np.nan

    fig,ax=plt.subplots(2,2,figsize=(12,9),constrained_layout=True)
    ax[0,0].loglog(a,z.real,'o-',label='Re pole')
    ax[0,0].loglog(a,-z.imag,'o-',label='-Im pole')
    ax[0,0].axvline(TRUE['tau'],color='0.4',ls=':',label='a≈τ crossover')
    ax[0,0].set(xlabel='radius a',ylabel='angular rate',title='Input: complex pole across radius'); ax[0,0].legend()

    im=ax[0,1].pcolormesh(qs,taus,np.log10(obj),shading='auto',cmap='viridis')
    ax[0,1].plot(TRUE['q'],TRUE['tau'],'r*',ms=13,label='injected')
    ax[0,1].plot(s[1],s[0],'wo',ms=6,label='blind minimum')
    ax[0,1].set(yscale='log',xlabel='q',ylabel='τ',title='Poles-only reality-closure landscape'); ax[0,1].legend()
    fig.colorbar(im,ax=ax[0,1],label='log10 RMS Im(ωc²)/|z|²')

    Arec=s[2]*a**s[1]
    ax[1,0].loglog(a,TRUE['A0']*a**TRUE['q'],'k-',lw=2,label='injected A₀aᵠ')
    ax[1,0].loglog(a,Arec,'ro',ms=4,label='blind recovered')
    ax[1,0].set(xlabel='radius a',ylabel='memory strength A(a)',title='Recovered constitutive scaling'); ax[1,0].legend()

    ax[1,1].scatter(full_s[:,1],full_s[:,0],s=12,alpha=.25,label='full radius span')
    if len(hs): ax[1,1].scatter(hs[:,1],hs[:,0],s=12,alpha=.25,label='high-frequency only')
    if len(ls): ax[1,1].scatter(ls[:,1],ls[:,0],s=12,alpha=.25,label='low-frequency only')
    ax[1,1].plot(TRUE['q'],TRUE['tau'],'r*',ms=14)
    ax[1,1].set(xlabel='recovered q',ylabel='recovered τ',title='Noise reveals conditioning (2×10⁻⁵ relative)')
    ax[1,1].legend(fontsize=8)
    fig.suptitle('Blind one-pole memory tomography from radii and complex poles',fontsize=15)
    fig.savefig('blind_memory_tomography.png',dpi=180)
    fig.savefig('blind_memory_tomography.svg')

if __name__=='__main__': main()

# Ravel | finite-window common-bath interference (17 October 2026)
GEN/DERIVED sandbox mathematics, not physical H(s)H validation. BEDROCK blob 528e5734f8b8e484f4ded65ec0bfa313d414aab8 checked; BR-003 forbids automatic theory promotion.

For y(t)=V b(t)+i s a bdot(t), s=+1 or -1, the windowed transition rate
R_s(T)=(1/T) E|int_0^T exp(i omega t)y(t)dt|^2
=2 Re int_0^T (1-t/T)exp(i omega t)[V^2 C(t)+2 i s a V Cp(t)-a^2 Cpp(t)]dt.
Define R_s=R0+s X, with R0=Rb+Rbdot and
X=-4 a V int_0^T(1-t/T)sin(omega t)Cp(t)dt.
For equilibrium Cp(t)=-kBT*t/M+O(t^2), hence X=(a V omega kBT/(3M))*T^3+O(T^4).
By Cauchy-Schwarz |X| <= 2 sqrt(Rb*Rbdot). Thus finite-window interference is cubic in T, whereas the leading incoherent rate is linear in T.

Original Ravel fixture K=4,M=1,Gamma=2,kBT=.04,omega=.143833264176,
V=.6017065385854649, a=.47466847425118125 (rates from 2026-10-14 bath gate).
Exact quadrature results (T, Rplus, R0, Rminus, X/R0):
0.1: .00120266129138, .00120214637370, .00120163145601, .00042834
1: .00694110158246, .00668503637584, .00642897116922, .03830
2: .00703818837027, .00628340400851, .00552861964675, .12012
10: .00495883276763, .00413381612763, .00330879948763, .19958
100: .00455662947383, .00373085827158, .00290508706932, .22134
1000: .00451641116040, .00369056287636, .00286471459233, .22377
As T->infinity: (Rplus,R0,Rminus)=(.004511942458908805,.00368608561023,.002860228761551195).
At T=100, |X|/(2 sqrt(Rb Rbdot))=.71394082477 < 1.
Controls: changing s flips X and preserves R0; setting a=0 removes X. This shows why an asymptotic interference rate must not be imposed on short observation windows.

Complete executable Python reproduction (requires numpy and scipy):
```python
import numpy as np
from scipy.integrate import quad
K,M,Gamma,kBT,omega=4.,1.,2.,.04,.143833264176
WV,WA=.00363923235465,.00004685325558
S=lambda nu:2*Gamma*kBT/((K-M*nu**2)**2+(Gamma*nu)**2)
V=np.sqrt(WV/S(omega));a=np.sqrt(WA/S(omega))/omega
g=Gamma/(2*M);O=np.sqrt(K/M-g*g);C0=kBT/K
def C(t):return C0*np.exp(-g*t)*(np.cos(O*t)+g/O*np.sin(O*t))
def Cp(t):return -C0*(K/M)*np.exp(-g*t)*np.sin(O*t)/O
def Cpp(t):return C0*(K/M)*np.exp(-g*t)*(-np.cos(O*t)+g/O*np.sin(O*t))
def part(T,which):
    def f(t):
        r=(1-t/T)*np.exp(1j*omega*t)
        c=V*V*C(t) if which==0 else -a*a*Cpp(t)
        if which==2:c=2j*a*V*Cp(t)
        return (r*c).real
    return 2*quad(f,0,T,epsabs=1e-12,epsrel=1e-12,limit=500)[0]
for T in [.1,1,2,10,100,1000]:
    rb,rd,x=(part(T,k) for k in range(3))
    base=rb+rd
    print(T,base+x,base,base-x,x/base,abs(x)/(2*np.sqrt(rb*rd)))
    assert abs(x)<=2*np.sqrt(rb*rd)+1e-12
```
Source: WORKSPACES/RAVEL/ravel_finite_time_colored_noise_gate_20261014.py and Ravel postreentry checkpoint.

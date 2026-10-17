# Ravel: exact finite-time common-bath transition gate (2026-10-15)

Status: GEN/DERIVED conditional apparatus, not a SAT/H(s)H physical prediction.

## Mathematical result

For stationary correlated noise y(t)=V b(t)+A bdot(t), the finite-time
transition rate is
R(T)=2 Re integral_0^T (1-t/T) exp(i omega t) C_y(t) dt.
For equilibrium underdamped oscillator covariance
C(t)=C0 exp(-gamma t)[cos(Omega t)+(gamma/Omega)sin(Omega t)],
C0=kBT/K, gamma=Gamma/(2M), Omega=sqrt(K/M-gamma^2),
with Cp=dC/dt and Cpp=d2C/dt2, the coupled covariance is
C_y=V^2 C+(A V-V conjugate(A))Cp-|A|^2 Cpp.

Write C_y(t)=Bplus exp((-gamma+i Omega)t)+Bminus exp((-gamma-i Omega)t).
Define pplus=gamma-i(omega+Omega), pminus=gamma-i(omega-Omega).
Then, EXACTLY,
R(T)=2 Re sum_{q=plus,minus} Bq [1/pq-(1-exp(-pq T))/(T pq^2)].
Consequently R(infty)=2 Re sum Bq/pq and
D=2 Re sum Bq/pq^2,
R(T)=R(infty)-D/T+O(exp(-gamma T)/T).
A negative D produces a positive long-window overshoot. This is an exact
finite-time transform of a specified stationary model, not a Markov approximation.

Using the 2026-10-14 Ravel common-bath fixture K=4,M=1,Gamma=2,
kBT=.04, omega=.143833264176,
WV=.00363923235465, WA=.00004685325558, WX=.00082585684870,
V=sqrt(WV/Sb(omega)), A=i sqrt(WA/Sb(omega))/omega, where
Sb(nu)=2 Gamma kBT / [(K-M nu^2)^2+(Gamma nu)^2]:

R(infty)=0.00451194245891, D=-0.00446870149229,
-D/R(infty)=0.990416330214.
Therefore the long-time relative excess is 0.990416330214/T.
At T=100 it is ~0.990416%, and at T=1000 ~0.0990416%.
Selected exact values:
T=.1: .00120266129138
T=.5: .00480295480481
T=1: .00694110158246
T=2: .00703818837027
T=5: .00539849173519
T=10: .00495883276763
T=20: .00473537753286
T=100: .00455662947383
T=1000: .00451641116040.
Independent real-time scipy quadrature matched the closed expression to
<=3.47e-18 for these fixtures. The zero-coupling control has R(T)=0.

## Complete reproduction script

```python
#!/usr/bin/env python3
import cmath, math
from scipy.integrate import quad

K,M,Gamma,kBT,omega=4.,1.,2.,.04,.143833264176
WV,WA,WX=.00363923235465,.00004685325558,.00082585684870
S=lambda nu: 2*Gamma*kBT/((K-M*nu**2)**2+(Gamma*nu)**2)
V=math.sqrt(WV/S(omega))
A=1j*math.sqrt(WA/S(omega))/omega
gamma=Gamma/(2*M)
Omega=math.sqrt(K/M-gamma**2)
C0=kBT/K
c=C0*(1-1j*gamma/Omega)
cp=1j*C0*(K/M)/Omega
cpp=C0*(K/M)*(-1-1j*gamma/Omega)
cross=A*V-V*A.conjugate()
Bp=(V*V*c+cross*cp-abs(A)**2*cpp)/2
Bm=(V*V*c.conjugate()+cross*cp.conjugate()-abs(A)**2*cpp.conjugate())/2
pp=gamma-1j*(omega+Omega)
pm=gamma-1j*(omega-Omega)
Rinf=2*(Bp/pp+Bm/pm).real
D=2*(Bp/pp**2+Bm/pm**2).real

def finite(T):
    assert T>0
    F=lambda p: 1/p-(1-cmath.exp(-p*T))/(T*p*p)
    return 2*(Bp*F(pp)+Bm*F(pm)).real

def cov(t):
    z=cmath.exp((-gamma+1j*Omega)*t)
    return V*V*(c*z).real+cross*(cp*z).real-abs(A)**2*(cpp*z).real

def quad_rate(T):
    fn=lambda t: ((1-t/T)*cmath.exp(1j*omega*t)*cov(t)).real
    return 2*quad(fn,0,T,epsabs=1e-13,epsrel=1e-13,limit=1000)[0]

print('Rinf',Rinf,'D',D,'relative coefficient',-D/Rinf)
assert abs(Rinf-(WV+WA+WX))<5e-13
for T in [.1,.5,1,2,5,10,20,100,1000]:
    a,b=finite(T),quad_rate(T)
    print(T,a,b,abs(a-b))
    assert abs(a-b)<3e-12
for T in [100,1000]:
    assert abs(finite(T)-(Rinf-D/T))<2e-13
print('NEGATIVE CONTROL: V=A=0 makes covariance/rate identically zero.')
```

Provenance: numerical fixture and model from
WORKSPACES/RAVEL/ravel_finite_time_colored_noise_gate_20261014.py;
analytic transform and independent execution here on 2026-10-15.

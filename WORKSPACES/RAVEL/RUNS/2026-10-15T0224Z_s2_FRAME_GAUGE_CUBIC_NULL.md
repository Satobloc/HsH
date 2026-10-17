# SANDBOXED | Ravel s2 | Frame-gauge invariance and sixth-order leakage gate
**2026-10-15 02:24 UTC nominal slot.** Selected Ravel (h=98, seq=492, 492 mod 19=17); next Orson Vay. **Status:** exact two-state mathematical control, not a finite-core SAT/H(s)H Hamiltonian, particle prediction, or physical claim.

## Source and distinction from existing result
Read Ravel's `CONTINUITY_2026-10-11_POSTREENTRY_GEOMETRIC_FRAME.md`, `SANDBOX_2026-10-11_MATERIAL_FRAME_ACTION_AND_LEAKAGE.md`, and the newer `ravel_finite_time_colored_noise_gate_20261014.py`. That last result already treats finite-time correlated b and bdot noise. **This gate adds an explicit frame-redefinition invariance check and a higher-order cancellation counterexample.** Existing oscillator PSD and cross-channel interference are reused, not claimed as discoveries here. The Oct 9 internal-first and cross-formalism rules remain controlling.

## Exact model and units
Take a two-state apparatus truncation
```
H(t) = (hbar*omega/2) sigma_z + g*b(t)*sigma_x + h*bdot(t)*sigma_y.
```
b [m], omega [s^-1], hbar [J s], g [J/m], h [J s/m]. For |down> -> |up>, <up|sigma_y|down>=-i. A smooth pulse with b(0)=b(T)=0 obeys
```
A_1 = -(i/hbar) (g-omega*h) integral_0^T b(t) exp(i omega t) dt.
```
This follows exactly at first perturbative order from integration by parts. A single equilibrium oscillator bath has two-sided PSD
```
S_b(nu)=2*Gamma*kBT/((K-M*nu**2)**2+(Gamma*nu)**2)  [m^2 s],
rate=(g-omega*h)**2*S_b(omega)/hbar**2  [s^-1].
```
The cross term -2*g*omega*h cannot be discarded. The spectral matrix of (b,bdot/omega) is rank one at each nonzero frequency, not two independent baths. This is the standard driven two-state / Langevin oscillator comparator, not a derivation of a material timesheet.

For U(b)=exp(-i*q*b*sigma_y/hbar), exact transformed Hamiltonian is
```
H_U=U^dag H U - q*bdot*sigma_y.
```
Linearized parameters change to g'=g-q*omega, h'=h-q, but g'-omega*h'=g-omega*h. Consequently **the physical on-shell transition rate is frame invariant**, while independently adding the two apparent rates is not.

## Reproducible fixture
Set hbar=1 J s (artificial scale), omega=1 s^-1, M=1 kg, K=4 kg/s^2, Gamma=2 kg/s, kBT=0.04 J, g=0.8 J/m, h=0.35 J s/m, q=0.6 J s/m.
- S_b(omega)=0.0123076923076923 m^2 s.
- g-omega*h=0.45 J/m.
- **Correct rate = 0.00249230769230769 s^-1.**
- Incorrect channel-summed rate = 0.00938461538461538 s^-1 (3.7654321 times the correct value).
- After gauge rotation: g'=0.2 J/m, h'=-0.25 J s/m. Correct rate unchanged; incorrect sum becomes 0.00126153846153846 s^-1.
- Null g=omega*h=0.35 J/m: first-order rate **exactly zero**, but incorrect sum = 0.00301538461538462 s^-1.

## New nonlinear cancellation theorem (this run)
For the cancellation fixture set q=h and g=omega*h. Writing x=h*b/hbar and Delta=hbar*omega, the exact transformed transverse coefficient is
```
C_x = (Delta/2)*[-sin(2*x)+2*x*cos(2*x)]
    = -(4/3)*Delta*x**3 + O(x**5).
```
The linear transverse interaction vanishes, but the full Hamiltonian is not trivial: diagonal terms change at order b^2 and the first transverse term is cubic. With b(t)=epsilon*sin(omega*t)*sin^2(pi*t/T), T=20*pi s, endpoint-zero, the transition probability scales as **epsilon^6**, not epsilon^2, in the weak-amplitude limit.

Numerical exact Schrödinger integrations (SciPy DOP853, rtol 2e-11, atol 2e-13, max_step 0.05 s):
| epsilon [m] | Exact leakage P | P / epsilon^6 [m^-6] |
|---:|---:|---:|
| 0.060 | 8.26345209701e-9 | 0.177114457 |
| 0.030 | 1.29150966320e-10 | 0.177161819 |
| 0.015 | 2.01811618348e-12 | 0.177173437 |
Log-log slopes: 5.99961426 and 5.99990539. At generic g,h, exact lab-frame and transformed-frame final-state norm differences are 1.54e-15, 8.73e-16, 1.87e-15 for epsilon=0.024,0.012,0.006 m, respectively. This validates the gauge equivalence numerically, not just the asymptotic rate.

## Compact reproducibility snippet
```python
import numpy as np
from scipy.integrate import solve_ivp
sx=np.array([[0,1],[1,0]],complex)
sy=np.array([[0,-1j],[1j,0]],complex)
sz=np.diag([1,-1]).astype(complex)
eye=np.eye(2,dtype=complex)
omega=hbar=1.; h=.35; g=omega*h; q=h; T=20*np.pi
S=lambda w: .16/((4-w*w)**2+(2*w)**2)
assert (g-omega*h)**2*S(omega)==0
def pulse(t,e):
    z=np.sin(np.pi*t/T)**2
    dz=np.pi/T*np.sin(2*np.pi*t/T)
    return e*np.sin(t)*z, e*(np.cos(t)*z+np.sin(t)*dz)
def ham(t,e,rot=False):
    b,v=pulse(t,e)
    H=.5*sz+g*b*sx+h*v*sy
    if not rot: return H
    x=q*b
    U=np.cos(x)*eye-1j*np.sin(x)*sy
    return U.conj().T@H@U-q*v*sy
def prob(e,rot=False):
    sol=solve_ivp(lambda t,y:-1j*ham(t,e,rot)@y,
                  (0,T),np.array([0,1],complex),
                  method='DOP853',rtol=2e-11,atol=2e-13,max_step=.05)
    assert sol.success
    return abs(sol.y[0,-1])**2
for e in (.06,.03,.015):
    p,p2=prob(e),prob(e,True)
    print(e,p,p/e**6,abs(p-p2))
    assert abs(p-p2)<2e-12
```

## Limits and falsification
As epsilon->0, the nonlinear leakage coefficient tends to finite 0.17718 m^-6 **for this pulse**, while probability tends to zero as epsilon^6. kBT->0 or g=h=0 gives zero weak-bath rate; Gamma->0 off resonance gives zero spectral weight. At nonzero pulse endpoints the integration-by-parts boundary term must be retained, and physical initial/final projectors must transform with U; dropping either manufactures frame dependence. Different pulse shapes or extra physical couplings can destroy the sixth-power selection rule. Do not promote the toy null to a universal particle protection mechanism.

**Next test:** lift the two-state control into Ravel's deformed-ring eigenbasis, using the same b,bdot covariance and endpoint-consistent projectors; check whether the cubic cancellation survives local connection and finite-core mode mixing.

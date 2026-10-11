# SANDBOXED — Ravel: single-action finite-tube geometric holonomy, thermal backreaction and unavoidable local transport
**2026-10-11, successor Ravel session.** `LOCAL:RAVEL-FC-20261011`. Not SAT/H(s)H bedrock, not a stochastic-gravity derivation. Quantitative **apparatus-constrained tube control**, with an explicit action and its failure modes. Companion code: `CODE/geometric_holonomy_backreaction.py`; numerical output `DATA/geometric_holonomy_backreaction.json`. The Python source regenerates a Class P figure.

## Actual read / provenance
- Historical primary: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/THE FUNDAMENTAL INTUITIONS — EXTENDED.txt` (source PDF updated 2026-02-26; extraction blob `9b94093053f28be8bf64ee227d3382d2296f63ea`), read pages 1–6. Filament histories, time surface, bidirectional force/backreaction, vacuum-aligned histories and geometric holonomy are inherited **questions**, not derivations of the action below.
- Recent HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` (blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`), substantially read; and `WORKSPACES/RAVEL/SANDBOX_2026-10-11_FINITE_TUBE_HOLONOMY_NOISE_GATE.md` (blob `410642ba5765bfb4394205ec733fd0396dbbd03f`), read completely.
- Current authority: `BEDROCK.md`, `STATE_OF_THE_THEORY.md`, Ravel cutoff `CONTINUITY_CUTOFF_2026-10-11_0903EDT.md`, `WORKSPACES/COMMON/NATHAN_DIRECT_2026-10-09_SCOPE_AND_REFERENCE_RULE.md`. No imported HSH_RESOURCES foundations, Schreiber-authored material or Hypothesis H proper.

## 1. A precise negative gate: a material angle is not enough
For a closed oriented tube's transverse frame, a smooth periodic director angle `alpha(s)` contributes `d alpha/ds` to its normal connection. Its loop integral is `2 pi k` with integer winding `k`, and therefore gives **zero fractional holonomy**. A fluctuating smooth `alpha` cannot, by itself, generate continuous AB-type loop phase. Earlier proposed `alpha`-only quadratic action would be physically ineffective for this channel. A nontrivial normal-bundle connection must arise from actual embedding/parallel transport or another demonstrably physical structure.

## 2. Finite tube embedded without an external carrier
On an apparatus resolving section, choose an independently specified closed centerline
```
r(theta) = ((R+a*cos(2theta))*cos(theta),
            (R+a*cos(2theta))*sin(theta),
            b*sin(2theta)),    0<=theta<2*pi.
```
`R` is the centerline reference radius, `a` the signed radial second harmonic, `b` the out-of-plane second harmonic. All three are `LOCAL:RAVEL-FC-20261011` lengths, not a Kerr parameter or filament radius. Place a physical finite core of separate transverse radius `r_core` around this **apparatus** centerline. The tube's coordinates are `X(theta,u,v,t)=r(theta,b(t))+u e_1(theta,b)+v e_2(theta,b)`, `u²+v²<=r_core²`. The centerline is not a material object/worldline wrapping around another object.

Define the oriented Frenet frame where curvature is nonzero, with torsion
`tau = (r' cross r'') dot r''' / |r' cross r''|²`,
and fractional connection holonomy `phi(b)=(1/(2pi))*integral tau ds mod 1` in the chosen oriented frame. For small `a/R,b/R` the b-linear, a-linear term is
```
H_geom(a,b) = integral tau ds = 6*pi*a*b/R² + higher orders.
dphi/db at b=0 = 3*a/R² + O(a³/R^4).
```
The coefficient `6*pi` was independently obtained by symbolic differentiation/integration of the exact torsion integrand, then numerically checked. At `a=0` a pure vertical sinusoid has no linear **global** holonomy even though it changes local transport.

## 3. Nonzero representation coupling from transverse angular modes
A circular finite transverse core supports conditional eigenmodes `Psi ∝ f_{l,q}(rho) exp(i l beta) psi(theta,t)`, with integer `l`. Reducing the ordinary scalar kinetic term in the induced tube metric yields a longitudinal covariant derivative `D_s psi=(partial_s-i*l*omega_s)psi` (orientation convention). Thus the previous stipulated `chi_g` is `l`, derived **for a prepared nonzero-transverse-angular-mode state** from SO(2) normal-frame transport, not an unexplained gravitational coupling. For the ordinary `l=0` transverse ground channel, the effect is exactly zero. The mechanism does **not** derive preparation, stabilization, charge, mass, or a universal HsH mode.

## 4. One explicit candidate action, thermal covariance and reciprocal response
Use an underlying minimally confined material-wave scalar field `Psi` on the tube's pulled-back spatial metric, an elastic centerline collective deformation `b(t)`, and a positive oscillator bath whose oscillators are **internal material response degrees**, not extra gravitational fields:
```
S = integral dt [ M*bdot²/2 - K*b²/2
   + sum_j (m_j*xdot_j²/2 - m_j*omega_j²*(x_j-c_j*b/(m_j*omega_j²))²/2)]
   + integral dt dVol_tube [ (i*hbar/2)(Psi* DtPsi-c.c.)
                             -(hbar²/(2*m)) |Grad_g Psi|²
                             - V_conf |Psi|²].
```
`M [mass]`, `K [energy/length²]`, `Gamma [mass/time]` denote the effective one-coordinate deformation parameters; the `c_j` are material-bath couplings. `V_conf` confines the finite core. The ring mode current exerts the reciprocal force `F_b=-partial H_ring/partial b` from the **same action**. Integrating out a positive thermal oscillator bath produces a retarded generalized Langevin equation `M bddot+K b + integral_0^t gamma(t-s) bdot(s) ds = xi(t)+F_b(t)`. The classical equilibrium correlation `<xi(t)xi(t')>=k_B*T*gamma(|t-t'|)` is PSD because `gamma` is a positive oscillator cosine sum. **An Ohmic continuum/thermal ensemble is an additional constitutive assumption**, not a derivation from historical SAT vacuum material.

For Markov bath `gamma(t)~2 Gamma delta(t)` use `M bddot+Gamma bdot+K b=xi+F_b`, `<xi(t)xi(t')>=2 Gamma k_B T delta(t-t')`. Then
```
S_b(omega) = 2 Gamma k_B T /[(K-M*omega²)² + Gamma² omega²] >= 0.
chi_R(omega)=1/(K-M*omega²-i Gamma omega), causal/retarded.
```
The dimension of `S_b` is length²*time; **it is not an instantaneous variance**. This corrects an important ambiguity in the old numerical fixture, where `K_phi` was computed from an instantaneous angular covariance but inserted as though it were the time-integrated white-noise strength. In particular, `K_phi=(1/2)S_phi(0)` in a two-sided spectral convention.

For `l!=0` with `H_n(b)=E0(n-l*phi(b))² + ...` and `E0/hbar` fixed, energy difference sensitivity for `n-m=1` is `|g|=2 E0 |l| |phi'(0)|`. Weak stationary bath noise gives
```
D_hol=(g²/(2 hbar²))*S_b(0)
     =2(E0/hbar)² l² (phi')² S_b(0).
```
The static back-force for `n=1` at `b=phi=0` is `F_b=2E0*l*phi'`. With `chi_R(0)=1/K` the response is reciprocal, though external field/sheet gravity is NOT obtained.

## 5. Intrinsic geometrical local leakage, not a separately invented channel
The same tube's normal-frame connection has gauge-invariant parameter curvature
```
F_{b theta}(theta) = -r' dot ((partial_b r') cross r'')/|r'|³,
integral_0^{2pi} F_{b theta} dtheta = dH_geom/db,
```
up to the consistent choice of orientation. Its zero Fourier harmonic changes loop holonomy; its **nonzero** Fourier harmonics cannot be removed by a single smooth gauge choice throughout b(t). In the instantaneous thin-tube adiabatic mode approximation, the resulting temporal Berry connection has `(A_b)_j≈(F_{b theta})_j/(ij)` for nonzero integer j (with arclength-coordinate corrections at finite radial deformation). Fluctuating `bdot` then causes transitions:
```
W_{0->j}≈l² |F_j/j|² [omega_j² S_b(omega_j)],
  omega_j=j² E0/hbar,
  F_j=(1/2pi) integral F_{b theta} exp(-ij theta) dtheta.
```
This is a **leading free-ring/Born and adiabatic-geometric control**, not an exact spectral result for a deformed ring. The full finite-core metric, geometric potential, mode splitting, bath spectral density and nonadiabatic transitions must be included before calling it a particle prediction. Reflection symmetry makes `partial_b |r'|=partial_b kappa=0` at b=0, but does **not** remove the Berry transport electric curvature or its Fourier leakage.

## 6. Reproducible numerical gate (dimensionless illustration, no fitted physical constant)
Set `R=1,a=.1,b_reference=0,r_core=.04,l=1,E0/hbar=1,M=1,K=4,Gamma=2,kBT=.04`, 4096 theta samples.
- `H'(0)=1.890018441917119` numeric versus `integral F=1.8900184420304935`; agreement within 1.2e-10. Leading `6*pi*a=1.88495559215` differs by 0.269% due to finite a.
- `phi'=0.3008057775659518`; nonzero `F_2=0.9526763477573443` (complex Fourier coefficient), compared with `F_0=0.30080577758399596`. Local coupling is appreciable.
- `var(b)=kBT/K=.01`; `S_b(0)=.01` in length²*time, `D_hol=0.0018096823163411373` in inverse-time units.
- Leading `W_{0->+2}+W_{0->-2}=0.005585182914315523`; `W_{|j|<=12}=0.0055871039015765005`. **Leakage/dephasing ~3.0863**, not zero.
- `r_core*kappa_max=0.04959<1` for evaluated centerlines: only a local tubular coordinate regularity check, not global tube embedding or exclusion.
- `l=0`: zero holonomy coupling and zero Berry leakage. `a=0`: no linear *global* holonomy; local `j=2` transport persists. Noise disabled: both stochastic rates vanish.
- The static n=1 reactive force is `0.6016115551` energy/length in the chosen hbar=E0=1 normalization, and zero-frequency response `1/K=.25`.

## Outcome and decisive next gate
**Positive conditional result:** geometric normal-bundle holonomy, nonzero integer mode representation, PSD thermal fluctuations and reciprocal causal **local material-deformation** backreaction follow from a single explicit **candidate** finite-tube/mode-plus-positive-bath action.

**Negative result:** the same geometry generates nonzero local Berry curvature and hence generic stochastic mode transitions. The toy system **fails** the pure N-dephasing operator-selection gate in this tested parameter fixture. A slowly varying bath whose power at `omega_j` is negligible relative to its zero-frequency spectral weight, plus transverse-mode stability and adiabatic isolation, might suppress the leakage; that selection cannot be asserted without independent material parameters. No gravity/timesheet causal backreaction, Kerr core, or particle-scale identification has been derived.

**Further numerical work:** diagonalize the full Laplace–Beltrami plus curvature potential for the deformed finite tube, include proper arclength-mode Fourier coefficients and the complete time-dependent connection, then solve a jointly driven material/timesheet response with one covariant energy ledger. Compare against ordinary electromagnetic flux noise; do not tune to familiar constants.

**Ravel | SANDBOX ONLY.**

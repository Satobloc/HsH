# Sable | Mark IV.2 scalar-sign and Z3/filament topology audit | 2026-10-23 04:24 EDT

**Status:** historical mathematical recovery / sandbox; no theory promotion or empirical proof.

## Primary sources and original formulas

SAT archive `SAT Mark V/SAT_Symbolic_Kernel.txt`, blob `446c3000aaa102a11cee17225c35c3925044e524`, 71 lines, complete retrieval. Mark IV.2 contains `+1/2 (partial theta4)^2 - mu^2 cos(3 theta4) + lambda (u.partial theta4)^2`, with `u.u=-1`, and `Q_Z3=(3/2pi)[theta4(+infinity)-theta4(-infinity)] mod 3`. Original author/date of the mathematical lines not verified.

HsH archive `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt`, blob `02312fbb23167e8ce1c996451199ee0e498437b1`, 236 lines, complete retrieval. Its `Q=3A=sum W_i+L` is a **constituent-strand count**, not the SAT kernel's Z3 kink charge. Do not silently equate these historical Q definitions. The HsH file's original passage date/authorship remains unverified.

Current governing `BEDROCK.md` blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`, 509 lines retrieved; `STATE_OF_THE_THEORY.md` blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 155 lines retrieved. Governing sections reviewed, not every line close-read. Mersearch bridge occupied by Orson request `2026-10-21-orson-nlm-big-haul-math-001`; bounded GitHub searches/primary reads used, no new Mersearch run.

## Exact calculation and conditional verdict

Use the Mark IV.2 native unit-timelike convention eta=(-,+,+,+), local homogeneous rest `u=(1,0,0,0)`, `c=1`, positive mu and real lambda. With one spatial x:

`L = (lambda-1/2) theta_t^2 + (1/2) theta_x^2 - mu^2 cos(3 theta)`.

Euler-Lagrange:

`(1-2 lambda) theta_tt - theta_xx + 3 mu^2 sin(3 theta) = 0`.

About theta=0:

`omega^2 = (k^2+9 mu^2)/(1-2 lambda)`.

* lambda<1/2: hyperbolic, real omega, but canonical quadratic Hamiltonian is **negative definite** relative to vacuum.
* lambda=1/2: temporal Hessian zero; no independent quadratic time evolution.
* lambda>1/2: omega^2 negative for all real k, exponential instability; energy indefinite.

For lambda<1/2 the isolated scalar action is the **negative** of the usual positive-energy scalar action, up to a constant. Flipping the entire isolated scalar sector preserves its isolated Euler-Lagrange equation, but changes relative signs in the coupled system. This is not an authorized global correction: physical relative sign, coefficient and metric convention require source-grounded closure.

An exact static Z3 kink exists:

`theta(x)=(4/3) atan(exp(3 mu x))`, `Delta theta=2pi/3`, `Q_Z3=1 mod 3`.

Its conventional positive-energy tension in normalized units is `+8 mu/3`; the printed Mark IV.2 sign assigns `-8 mu/3` **relative to its vacuum**. The physical J/m^2 normalization is not supplied by this dimensionless scalar action.

The scalar kink is a codimension-one domain wall; it is not automatically a codimension-two Kelvin vortex. A 1D core in four spatial dimensions has normal S2 (pi1=0, H2=Z); a 2D sheet in four dimensions has normal S1 (pi1=Z). This codimension distinction was previously calculated by Meridian on 2026-10-10; the present round uses it to type the Mark IV.2 Z3 charge against the HsH strand count and Kelvin circulation. No new medium law was installed.

## Executed tests and CODATA gate

SymPy verified the exact Euler-Lagrange equation, dispersion, kink ODE, energy identity and integral. SciPy checked kink energy at mu=0.4, 1.0, 1.7. 21 seeded independent numerical fixtures had max kink-ODE residual `9.103828801926284e-15`, dispersion residual `3.552713678800501e-15`, and energy-density residual `4.440892098500626e-16`. No Lean execution.

2022 CODATA, NIST Web v9.0 (9 May 2024), recommended **quantum of circulation** `Gamma_CODATA=pi*hbar/m_e=3.6369475467(11)e-4 m^2/s`, standard uncertainty `1.1e-13 m^2/s`. Independent arithmetic from exact SI h and CODATA electron mass `9.1093837139(28)e-31 kg` gives `Gamma=3.636947546676119e-4 m^2/s`; signed residual (arithmetic minus tabulation) `-2.38808349678e-15 m^2/s`, within rounding. The equality is **definitional**, not an independent SAT prediction of a Kelvin vortex, electron spin or topology. A classical ring with assumed J=hbar/2 gives Gamma=2pi J/m_e=pi*hbar/m_e by identity; the physical mapping remains unproved.

**Gates:** algebra PASS; dimensions PASS conditional on x0=ct and mu in inverse length; linear positive-energy scalar FAIL under printed sign; source-authorized coupled repair UNRESOLVED; Z3-to-Kelvin topology UNRESOLVED; CODATA identity REPRODUCED but **NOT PREDICTIVE**. No BEDROCK promotion.

Full source `calculate.py`, actual `stdout.txt`, structured `results.json`, and three Class P figures are preserved in the accompanying conversation artifact.

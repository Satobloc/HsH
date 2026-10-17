# Mercer sandbox checkpoint: Local derivative-gated Schwarzschild director (2026-10-10)

**Status:** SANDBOXED / independent constitutive counterexample, not canonical H(s)H, not a physical prediction. No historical constants fitted.

## Sources substantially read
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H FIRST BUILD.txt`, lines 1–600 (historical mixed Nathan/assistant discussion, tentative 4D metric induction and honesty controls).
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt`, complete 23,331 characters (Meridian, 2026-09-27, sandbox spec; especially sections 8–9: scalar timesheet Poisson/Green response).
- Current Common front door, symbol/citation controls, Reference Desk and October 5 HSH_RESOURCES/War Room routing overview-read. No quarantined material opened. Direct reads of known exact files; no corpus-wide novelty search.

## Mathematical advance
For a positive compact spherical source `f(x)=(1-x²)^4` on `x=r/a<1`, define `I(x)=∫_0^x t²f(t)dt`, `I1=I(1)`, and `J(x)=∫_x^1 I(t)/t²dt`. The dimensionless scalar timesheet field is `H=(M/a)(1+J/I1)` inside and `H=M/r` outside, with `M=Gm/c²`. Its Poisson source is `-∆H=(M/a³)f/I1≥0` inside.

**New LOCAL constitutive conjecture (engineered, not action-derived):**
```
Q_gate = |grad H|²/(|grad H|² + ell_gate²(∆H)²)
chi = H Q_gate
u^flat = sqrt(1-chi) dT + sqrt(chi) dr
g = delta - 2 u^flat tensor u^flat
```
Symbols `Q_gate,chi,ell_gate` are LOCAL:MERCER-GATE-20261010; `ell_gate` is NOT historical SAT `ℓ_f` or timesheet bending `ℓ_b`.

Because `∆H=0` outside, `chi=M/r` exactly, so `g` is Schwarzschild exterior. Near the center, `|grad H|=O(r)` and `∆H=const+O(r²)`, giving `chi=O(r²)` and a smooth Cartesian director. This is a counterexample to the need for a source-dependent amplitude threshold: derivatives permit a universal local gate. It does **not** derive the gate from mechanics.

For `M=1,a=3,ell_gate=.6`, calculated `max chi=0.4681802822` (real director, no horizon), exterior Schwarzschild discrepancy 0, radial Gauss-law residual <3.4e-16, effective enclosed mass derivative nonnegative within 1.8e-15 numerical tolerance.

## Finite-energy constitutive discriminator
For Schwarzschild exterior,
`|grad u|²=9M/(4r³)+M²/[4r³(r-M)]`.
Constant positive director stiffness gives logarithmically divergent exterior energy. A *provisional* stiffness `kappa(H)=kappa0 H^p`, `p>0`, makes the exterior energy finite. At `p=1`:
`E_dir,ext/kappa0=2π[(M/4)ln(a/(a-M))+2M²/a]`.
For the fixture above, exterior = 4.82569330724619, core ≈7.22060475, total ≈12.04629806. Scalar sheet energy = `12.4436696867 T_eff M²/a`. These energies are separate and do not prove a stable action.

## Failure conditions and next cursor
A joint local stable action must generate the gate and stiffness rather than insert them; second spatial derivatives in the gate threaten higher-order dynamics, preferred-foliation covariance is unproven, non-spherical/multi-source tests are absent, and compact sources can violate `chi≤1` (e.g. `a/M=1.8,ell_gate/a=.05` gives max chi≈1.1095). Kerr order-J² obstruction remains open.

**Next:** linearize a coupled (H,u) action about the spherical fixture, compute its principal symbol and perturbative stability, and check interior Einstein energy conditions. Do not promote before independent checks.

**Provenance:** old SAT supplies 4D map motivation; September 30 HsH supplies scalar sheet Green response; standard radial Poisson and Einstein identities are mathematical tools; derivative gate and stiffness are new Mercer sandbox conjectures.

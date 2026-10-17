# MK172: transverse-mode charge and reciprocal torsional response (SANDBOXED)

**Morrow/Kestrel | 2026-10-11 | continuation of MK171 hostile reviews.** NOT canonical H(s)H. **Outcome:** The representation coefficient in Ravel's geometry need not be a free phenomenological number once a definite transverse mode exists. But geometry alone does **not** select a nonzero mode, and the first dynamical completion makes noise and backreaction inseparable.

## Provenance, access and internal-first gate
- Historical SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH-SAT Roundup 3/MINKOWSKI_VARIATIONS.txt`, blob `cb683778aef6dbecba11712504452d804216bd16`, lines 400–620 substantially read. Its persistent/transient filament excitation and timesheet-intersection taxonomy motivated a finite transverse boundary degree of freedom. Numerical mass/smoothing and particle-tag conjectures **not imported**, and some historical arithmetic plainly requires independent audit.
- Current HsH: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt`, blob `54f2f530697ab6e9c44758ce3406c4144915c73d`, lines 1–220 substantially read. Its finite-core/worldtube/UI scale-rotation and loop-holonomy proposals supplied geometric scaffolding only; no claim that its speculative KNdS parameter maps are correct.
- Review and independent continuation: `WORKSPACES/RAVEL/MK171_REVIEW_PACKET_C_PRIMARY_SOURCE_2026-10-11.md`, and `WORKSPACES/RAVEL/SANDBOX_2026-10-11_FINITE_TUBE_HOLONOMY_NOISE_GATE.md` read. Their surviving gate is deriving the normal-frame charge and reciprocal response.
- Common formalism index CF-003, CF-007, CF-010 and symbol registry consulted. Mersearch bridge was **occupied** by Orson request `2026-10-11-orson-morrow-inspiral-package-001`, status `requested-retry`; no request overwritten. This was a bounded exact-path source-read, **not** a full three-repo Mersearch search. No novelty or complete ancestry claim.
- No outside literature imported as theory. Standard vector-bundle angular modes and equilibrium Langevin identities are mathematical comparison tools only.

## Construction A: obtain representation weight instead of choosing it
Assume an **apparatus-defined** closed orbit `gamma:S1 -> Sigma_t` with a radius-a circular transverse cross-section and **oriented normal two-plane** `(e1(s),e2(s))`. Let polar normal coordinate be `theta`; one material/field mode has `u_l(rho,theta)=f_l(rho) exp(i l theta)`, integer `l` from single-valuedness. The infinitesimal SO(2) normal-frame rotation acts as `-i d/dtheta`, so `(-i partial_theta)u_l=l u_l`. Following frame transport around the centerline projects the connection `omega_s=e1 dot nabla_s e2` into the mode derivative `D_s=partial_s - i l omega_s` (choose this sign convention). **For this explicit mode, chi_g=l,** not an adjustable coefficient. The sign changes with normal-frame orientation and mode chirality. The scalar transverse zero mode `l=0` gives **chi_g=0** and kills this geometric channel. Half-integer weights require a **specified spin/pin bundle and boundary spin structure**, not a generic scalar finite core. SO(2) mode charge is not an electric charge.

**Crucial counterexample:** a flat planar ring with a globally nonrotating normal frame has `omega_s=0`; arbitrary single-valued frame twists change integral `int omega ds` by `2 pi Z`, which does not change the phase of integer-l modes. The presence of a normal bundle does not imply nontrivial holonomy. To create a noninteger phase requires a genuinely nontrivial connection/physical transport, not an arbitrary gauge frame.

For a mode of mass m in an apparatus of radius R, kinematic projection leads to the familiar restricted `H_l=E0 (N+phi_AB+l phi_g)^2`, `E0=hbar^2/(2mR^2)`, with `phi_g=(1/2pi)oint omega_s ds mod Z`. This is a **conditional effective ring quantization**, NOT a deduction that any unconstrained H(s)H worldtube has a closed charged orbit, an AB flux, or a Berry response. An isotropic transverse eigenmode degeneracy permits l=+/- modes; selecting one chirality requires extra boundary data.

## Construction B: one elastic mode supplies both fluctuations and reactive strain
Let the **gauge-invariant small deviation** of loop holonomy be `q(t)`; do not equate q with a freely gauge-chosen local frame angle. Introduce phenomenological finite-core stiffness `K>0`, torsional drag `zeta>0`, thermal-like energy scale `Theta>=0`, and the combined conditional potential

`V_n(q)=E0(n+phi0+l q)^2+(K/2)q^2`.

This single *postulated* potential contains a reciprocal effect: occupancy n biases the material torsion, while that torsion shifts orbital phase. Completing the square yields exactly:

`Keff=K+2 E0 l^2`; `q*_n=-2E0 l (n+phi0)/Keff`; `V_n(q*_n)=Eeff (n+phi0)^2`; `Eeff=E0 K/Keff`.

The formal response gate is `dq*_n/dn=-2E0 l/Keff`; for l=0 it vanishes, as does any geometric dephasing. Note this equilibrium energy renormalization is **not independently observed**, and the n-conditioned classical coordinate is not yet a complete-positive quantum-classical feedback construction. It is a constitutive test fixture.

For fixed n and overdamped equilibrium Langevin fixture,
`zeta dq= -Keff(q-q*_n)dt + sqrt(2 zeta Theta)dW`.

Exact stationary covariance: `C_q(t)=Theta/Keff exp(-|t|/tau)`, `tau=zeta/Keff`. For an **externally specified** weakly coupled zero-mean q noise approximation (freeze the n-conditioned equilibrium shift), linear coupling to the ring is `2E0 l (N+phi0)delta q`; the dephasing functional is

`coherence_nm(t)=exp[-(2E0^2 l^2/hbar^2)(n-m)^2 J_q(t)]`,
`J_q(t)=2(Theta/Keff)[tau t-tau^2(1-exp(-t/tau))]`.

The long-time formal rate is `Dhol=4 E0^2 l^2 Theta zeta/(hbar^2 Keff^2)`. **This coefficient is conditional**: it uses an equilibrium Langevin law and backreaction has been frozen during the stochastic averaging. Exact joint CQ CP dynamics still missing, so do not present it as a full derived gravitational decoherence model. For tau not short compared with coherent time, early-time contrast has zero initial slope and is nonexponential.

## Numerical fixture (dimensionless hbar=1, E0=0.2, K=8, zeta=2, Theta=.04)
| l | Keff | Var(q) | tau | Dhol | Eeff |
|---:|---:|---:|---:|---:|---:|
| 0 | 8.0 | 0.005000000 | 0.250000000 | 0 | 0.200000000 |
| 1 | 8.4 | 0.004761905 | 0.238095238 | 0.0001814059 | 0.190476190 |
| 2 | 9.6 | 0.004166667 | 0.208333333 | 0.0005555556 | 0.166666667 |

Code plot and basic exact checks in local accompanying `test.py`; charts `mode_gate.png` and `mode_gate_strong.png`. The second plot uses deliberately stronger nondimensional coupling to reveal the curve shape, not a calibrated physical system. **No target historical particle angle or 0.239 constant was used.**

## Independent failure conditions and next decision
1. **No chiral transverse state** (l=0 or equal incoherent +/-l ensemble) suppresses/changes the proposed effect.
2. **Flat or pure-gauge normal transport:** phi_g integer, zero physical shift for integer l. A frame rotation cannot create observable phase on its own.
3. Finite-core cross-section or degeneracies need not support conserved l; angular anisotropy mixes sectors and may cause momentum leakage. This defeats a pure N-dephasing selection argument.
4. `q` may not be a local dynamical independent holonomy variable; topology, gauge invariance and finite-core field geometry must produce it. Generic q(t) inserted at will is an input, not mechanism.
5. Equilibrium fluctuation/dissipation and the Markov reduction may be unjustified for a block-universe geometry, and unconditional N-dependent backreaction may destroy naive CP averaging.
6. Any angular momentum leakage or decoherence indistinguishable from ordinary EM/material noise is not an H(s)H-specific discriminator.

**Next frozen test:** construct an actual finite-radius H(s)H tubular embedding with a transported *nonzero-l normal mode*; compute its normal connection and gauge-invariant holonomy numerically, and compare it with a planar-ring zero control and mirror-chirality -l control. Couple a single covariance/action to both ring and material variable in a mathematically consistent quantum-classical reduced model. Reject this route if natural finite-core states force l=0 or if all allowed transport phases are pure gauge. Then test whether a physically plausible nonzero phase contributes more than ordinary apparatus noise.

**Status:** source-backed internal reconstruction plus new explicit sandbox model, not physical confirmation. No claim of novelty or priority.

# Ravel sandbox — field-derived contact modes and resolver dispersion

**Status:** SILOED PLAYGROUND / `GEN/CANDIDATE`. The calculations below are synthetic continuum-mechanics checks. They are not canonical SAT/H(s)H theory and do not establish a particle model.

## Current result

Two old-math repairs meet at the same discriminator:

1. the September 30 moving-resolver sketch becomes physical only after its independently chosen `omega` and `k` are replaced by a tension–bending dispersion law; its append-only “scar” is renderer memory, not material memory;
2. projecting the full compliant-contact Hessian produces the earlier two-coordinate coefficients rather than choosing them. In the present fixture the induced pad coordinate reproduces the slowest full-field pole to `4.34e-8` relative error when the pad is fast, but a one-pad-mode closure fails once the pad viscosity approaches the stiffness ratio `b/a = 92.89`: several pad modes enter the slow band together.

The repair is therefore stricter than “add a delayed contact coordinate.” Delayed contact is a field unless a spectral gap independently justifies one contact coordinate.

## Exact source record

### Historical SAT archive — substantially read

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/WORLDTUBE THOUGTS.txt`, entire file (requested lines 1–400, then 401–EOF; the latter was empty).

What was actually read and used:

- the document distinguishes an intrinsic filament coordinate `s` from an evolution coordinate `tau` and warns that fourth order in arclength is ordinary geometric elasticity whereas fourth order in physical time is a different higher-derivative theory;
- it proposes a repaired finite-core action containing kinetic, tension/first-gradient, bending/second-gradient, frame, alignment, interaction, and constraint terms;
- it states the decisive dispersion distinction: bending supplies a `k^4` contribution, while tension or another first-gradient term is needed for `k^2`;
- it treats finite radius, bounded curvature, contact/non-self-intersection, coercivity, and well-posed evolution as required rather than optional decoration;
- it explicitly corrects the ontology: a particle is a morphology of the vacuum worldtube, while topology, geometry, embedding, framing, and phase are descriptors of that morphology.

Historical particle labels and constants were not used as targets.

### H(s)H September 30 dump — substantially read

`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SKETCH_GUITAR_STRING_MODEL.txt`, entire file (2,651 characters).

What was actually read and used:

- the animation assigns `A=1`, `omega=2`, `k=2*pi/10`, a vertical resolver speed `v=1`, and the field `A sin(k x-omega t)`;
- it estimates a local line angle with `arctan(A k cos(k x-omega t))`;
- it appends every resolver intersection to a persistent list called a scar;
- it supplies no equation of motion, constitutive parameters, energy flux, damping, or deletion/relaxation law for that scar.

### Onboarding/search record

Before substantive work I re-read `Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` and the materially relevant live pointers: `MERSEARCH_REQUEST.json`, `TASK_BRANCH_GRAPH.json`, `CHECKINS.md`, `HANDOFFS.md`, `CURRENT_WORKFLOW_ORIENTATION_V2.md`, and `FORMALISM_INDEX/CROSS_FORMALISM_INDEX_2026-10-10.md` (especially CF-007 finite-core tubes, CF-009 medium mechanics, and CF-013 numerical verification).

The queued Mersearch request `2026-10-11-ravel-contact-relaxation-hysteresis-001` was checked first. Its indexed `SEARCH_RESULTS.md` and `RUN_MANIFEST.json` were still unavailable, so direct source selection followed only after that check. The HSH_RESOURCES packet remained quarantined as routing/prior-art material; no packet proposition was promoted into the model.

## Boundary between source, inference, and conjecture

**Source facts:** the archive supplies the `k^2` versus `k^4` distinction and a clean separation of intrinsic coordinate from evolution time. The H(s)H sketch supplies a prescribed sinusoid, a moving resolver, and an append-only plotting trace.

**Ravel inference:** the sketch does not yet specify a physical filament. One pair `(k,omega)` cannot identify both tension and bending. The apparent scar is persistence inserted by the visualization code unless a state variable and relaxation law are added.

**New sandbox conjecture:** an H(s)H intersection can remain stationary while energy is transported through it. Consequently, a stationary resolved feature is not by itself a stationary 4D morphology. Material memory requires a transported/deforming state, not repeated intersections stored by the observer.

## Repair 1 — the smallest tension–bending field

Use local symbols in `LOCAL:RAVEL-FHMR`. Let `y(s,tau)` be a small transverse displacement of a finite-core carrier with inertia density `mu`, tension `T`, and bending stiffness `B`:

\[
\mu y_{\tau\tau}-T y_{ss}+B y_{ssss}=0.
\]

For `y=A sin(ks-omega tau)`,

\[
\omega^2=\frac{T}{\mu}k^2+\frac{B}{\mu}k^4.
\]

This is the minimal system pair requested by the archive warning:

- tension-only: `B=0`, so `omega^2=(T/mu)k^2`;
- tension+bending: `B>0`, so the `k^4` term changes phase and group transport.

For the source sketch's numbers,

\[
k=\frac{2\pi}{10}=0.62831853,\qquad \omega=2,
\]

the only inference available from that single mode is

\[
\frac{T}{\mu}+0.39478418\frac{B}{\mu}=10.13211836.
\]

Thus the same drawing can mean `T/mu=10.13211836` with no bending, `B/mu=25.66495564` with no tension, or infinitely many mixed systems. The animation does not select among them.

### Resolver/intersection law

For a resolver moving as `s_R=v tau`, the instantiated intersection signal is

\[
y_R(\tau)=A\sin[(kv-\omega)\tau],\qquad
\Omega_R=|\omega-kv|.
\]

At the source speed `v=1`,

\[
\Omega_R=1.37168147,\qquad P_R=\frac{2\pi}{\Omega_R}=4.58064459.
\]

This frequency is a beat between morphology and resolver, not a new intrinsic frequency. If the resolver is phase-locked, `v=omega/k`, the intersection is stationary. But

\[
v_g-v_p=\frac{Bk^3}{\mu\omega},
\]

so for `B>0` energy still moves through the stationary intersection. That is the tightest geometric warning from this source pair.

## Repair 2 — coefficients from the full contact-field Hessian

The previous compliant-pad functional is

\[
E[\psi,h]=\int_0^1\left[
\frac{C}{2}\psi_s^2+\frac{K}{2}\sin^2\psi+\Lambda hV(\psi)
+\frac{B_p}{2}h_s^2+\frac{A_p}{2}(h-h_t)^2
\right]ds.
\]

At a retained equilibrium `(psi_*,h_*)`, the discrete Hessian blocks are

\[
H_{\psi\psi}=-C\partial_s^2+K\cos(2\psi_*)+\Lambda h_*V''(\psi_*),
\]

\[
H_{hh}=-B_p\partial_s^2+A_p,\qquad
H_{\psi h}=\Lambda V'(\psi_*).
\]

The statically eliminated director Hessian is the Schur complement

\[
H_{\mathrm{eff}}=H_{\psi\psi}-H_{\psi h}H_{hh}^{-1}H_{h\psi}.
\]

No scalar coefficients are assumed. Define `phi` as the softest normalized eigenmode of `H_eff`, and define the pad mode by its induced response

\[
\chi=\mathcal N\left[-H_{hh}^{-1}H_{h\psi}\phi\right].
\]

The projected pair is then

\[
H_2=\begin{pmatrix}a&c\\c&b\end{pmatrix},\qquad
a=\langle\phi,H_{\psi\psi}\phi\rangle,\quad
b=\langle\chi,H_{hh}\chi\rangle,\quad
c=\langle\phi,H_{\psi h}\chi\rangle.
\]

For the unchanged synthetic fixture `C=0.010`, `K=0.050`, `A_p=40`, `ell_p=0.025`, `B_p=0.025`, and `Lambda=12`, the coefficients converge to

\[
a=0.46960033,\qquad b=43.62317158,\qquad c=-0.73865812,
\]

with `c^2/(ab)=0.02663430` and `b/a=92.89425` on the `N=181` grid.

| grid `N` | full slow rate | projected-pair slow rate | relative error | mode overlap |
|---:|---:|---:|---:|---:|
| 101 | 0.457135645 | 0.457135665 | 4.34e-8 | 0.999999997 |
| 141 | 0.456960254 | 0.456960274 | 4.34e-8 | 0.999999997 |
| 181 | 0.456960430 | 0.456960449 | 4.34e-8 | 0.999999997 |
| 241 | 0.457187532 | 0.457187552 | 4.34e-8 | 0.999999997 |

The `N=241` equilibrium gradient residual is `5.08e-7`; the other grids are below `9.15e-8`. The small drift at `N=241` is therefore optimizer-limited, not evidence of exact continuum convergence.

## The contact-memory correction

Let the gradient-flow metric be `diag(eta_psi,eta_h)`. The mode ordering depends on the viscosity ratio, not on the energy Hessian alone.

| `eta_h/eta_psi` | projected pair rates | full four slowest rates (`N=181`) |
|---:|---:|---:|
| 1 | 0.456960, 43.635811 | 0.456960, 0.471798, 1.829261, 1.953783 |
| 5 | 0.456402, 8.737832 | 0.456402, 0.471240, 1.826078, 1.950071 |
| 20 | 0.453807, 2.196952 | 0.453793, 0.468613, 1.755738, 1.848273 |
| 100 | 0.377189, 0.528643 | 0.367154, 0.375548, 0.421501, 0.426468 |

At ratios 1–20, the induced pair captures the lowest pole while its pad pole remains outside the low director band. Near `b/a≈92.9`, multiple spatial pad modes descend together. At ratio 100, the one-pad-mode pair misses both the first rate by 2.73% and the second rate by 40.8%. The earlier illustrative choice `eta_h/eta_psi=5` therefore did not demonstrate a slow contact pole for this actual field model.

This is the main repair: static elimination and a one-contact-coordinate dynamical closure can both be excellent while contact is fast, yet the same one-coordinate closure becomes wrong precisely in the regime where one hopes to obtain contact memory.

## Failure condition and discriminator

Reject a one-contact-coordinate H(s)H memory mechanism unless the full generalized Hessian has an isolated contact-dominated mode. A practical gate is:

1. classify eigenmodes by their `h` participation;
2. require one contact-dominated mode below the next contact-dominated mode by at least a predeclared factor (candidate: 10);
3. require the projected pair to predict the first two full rates and modal residues within 1% under grid refinement;
4. repeat for polar and annular contact, with the annulus retaining no sign-selective response.

The present fixture fails gate 2 in the slow-pad regime. Its honest reduced model then needs several pad modes or the full `h(s,tau)` field.

## Next calculation / experiment

Run a frequency-domain generalized-Hessian sweep over `(ell_p,eta_h/eta_psi)` and map the number of contact-dominated modes below the first three director rates. The tight prediction candidate is a **closure phase diagram**:

- fast pad: static Schur complement is sufficient;
- intermediate pad: one induced pad coordinate may create a resolvable second pole;
- slow distributed pad: a band of contact modes appears and scalar hysteresis models fail.

For a benchtop analogue, drive the asymmetric rod/pad system sinusoidally and measure both orientation and indentation. A scalar-contact architecture predicts one additional Debye-like corner; a distributed pad predicts several thickness- and boundary-condition-dependent corners. Separately, phase-lock the optical resolver to a visible traveling wave: a stationary intersection accompanied by downstream energy transport would directly demonstrate the distinction between resolved persistence and material persistence.

## Durable artifacts

- `WORKSPACES/RAVEL/CODE/field_hessian_mode_projection.py`
- `WORKSPACES/RAVEL/DATA/field_hessian_mode_projection.json`
- `WORKSPACES/RAVEL/FIGURES/field_hessian_mode_projection.svg`

**Next cursor:** compute contact participation ratios and the `(ell_p,eta_h/eta_psi)` closure phase diagram; do not add hysteresis until the contact-mode spectral gap is established.

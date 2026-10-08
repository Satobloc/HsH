# Ravel sandbox: orientation–chirality load coupler

**Status:** quarantined mechanism candidate; not canonical SAT or H(s)H.  
**Question:** If a finite-core 4D history meets a resolver with a particular orientation and handedness, can morphology change the sign/channel of deposited load while leaving passive wake transport unchanged?

## Provenance and actual read coverage

### Controlling H(s)H material

- `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` — read completely at blob `2e788d4a...`; followed its current workflow, symbol, citation, Mersearch, and Ravel pointers.
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 CONCEPTS/2026 NEW — Filament onto.txt` — blob `a13c67ff2b47cf178672804d91771e01d4c4a3e1`; directly read lines 1–450 and 1801–2200, with intervening search excerpts used only for navigation. Recoverable motifs: a rigid filament plus flexible resolving surface; morphology/orientation relative to that surface; resistance distinct from stability; resistance need not be conserved under deformation. The file also contains many particle assignments, numerical targets, and cosmological claims; none are imported here.

### Independently selected old archive material

- `SAT_THEORY_ARCHIVE_2023-25/HsH AHA TOPOLOGY.txt` — blob `5283ceb8d06109061543711ebe7c46954efe7ede`; directly read lines 1–350 and 701–1050 (plus the connector-returned portion of 351–700). Recoverable construction: one connected history can produce several resolving intersections; transported orientation may reverse; rotational winding can change intersection multiplicity without requiring several underlying objects. Rejected as unsupported here: Klein topology as mandatory, orientation sign as charge conjugation, specific particle labels, Kerr/Planck identifications, or cosmological scale assignments.

### Retrieval audit

- Mersearch request `2026-10-07-ravel-orientation-load-coupling-001` was submitted by CAS update, commit `77141b54dae2c682f1f9085ffc879f0ba3a6f121`.
- The expected manifest `indexes/mersearch_requests/2026-10-07-ravel-orientation-load-coupling-001/manifest.json` was not yet present when this checkpoint was written. No Mersearch hit was assumed.
- `HSH_RESOURCES` remained routing/prior-art material only; it did not supply the mechanism below.

## Boundary: source fact, inference, conjecture

**Source facts inside the project corpus:** the older construction repeatedly treats observed particles as resolving intersections of extended histories, makes local orientation mechanically relevant, and distinguishes the finite history from the resolving structure. It does not derive a valid orientation-dependent response law.

**Inference:** if readout is produced at the resolver, orientation information must enter through a local source-coupling operator. It need not alter the resolver's passive constitutive poles.

**New sandbox conjecture:** the smallest useful local operator is the sum of an isotropic term, a director-anisotropy term, and a handed antisymmetric term. Morphology affects the numerator of the transfer function; one passive denominator transports every deposited channel.

## Minimal geometry

Work in the resolver's local two-channel response plane. Let

\[
\mathbf n=(\cos\theta,\sin\theta),\qquad
Q(\mathbf n)=\mathbf n\mathbf n^{\mathsf T}-\tfrac12 I,
\qquad
J=\begin{pmatrix}0&-1\\1&0\end{pmatrix},
\]

and let \(\chi=\pm1\) label the handedness of an otherwise envelope-matched finite core. The most economical linear source coupler retained in this sandbox is

\[
C(\chi,\mathbf n)=aI+bQ(\mathbf n)+\chi cJ.
\]

Here \(a\) is isotropic loading, \(b\) is director anisotropy, and \(c\) is a handed transverse conversion. This is a local constitutive ansatz, not an identification with electric charge or spin.

Let the passive resolving field obey the already-tested moving-wake operator

\[
\tau_s\partial_t\mathbf h+\mathbf h-\ell_s^2\partial_\xi^2\mathbf h
=C(\chi,\mathbf n)\,\mathbf p(\xi-vt).
\]

For spatial Fourier mode \(q\),

\[
\mathbf H_\chi(q,v,\theta)
=\frac{C(\chi,\mathbf n)\mathbf p(q)}
{D(q,v)},
\qquad
D(q,v)=1+(\ell_s q)^2-iqv\tau_s.
\]

Handedness reversal cleanly separates the response:

\[
\mathbf H_{\rm even}=\frac{\mathbf H_{+}+\mathbf H_{-}}2
=\frac{(aI+bQ)\mathbf p}{D},
\]

\[
\mathbf H_{\rm odd}=\frac{\mathbf H_{+}-\mathbf H_{-}}2
=\frac{cJ\mathbf p}{D}.
\]

The new discriminator is therefore stronger than a sign flip: **the even and handed-odd channels must share the same complex poles, phase lag, and upstream/downstream decay lengths.** For fixed \(\theta\) and input polarization, every nonzero projected ratio

\[
\mathcal R(q,v,\theta)=
\frac{\mathbf u_o\!\cdot\!\mathbf H_{\rm odd}}
{\mathbf u_e\!\cdot\!\mathbf H_{\rm even}}
\]

is independent of \(q\) and \(v\). Geometry fixes the ratio; transport cancels.

For an input \(\mathbf p=p\mathbf e_x\), the channels are explicit:

\[
H_x=\frac{p[a+b(\cos^2\theta-1/2)]}{D},\qquad
H_y=\frac{p[(b/2)\sin2\theta+\chi c]}{D}.
\]

Thus director rotation changes the even transverse load, while handedness reversal changes only the odd transverse sign. Neither operation moves a pole in the separable architecture.

## Competing architecture and failure condition

A genuinely morphology-dependent medium instead gives the odd channel its own denominator,

\[
D_o(q,v)=1+(\ell_o q)^2-iqv\tau_o,
\]

while even loading uses \(D_e\). This is not a small semantic variation: it predicts frequency- and velocity-dependent \(\mathcal R\), different wake tails, and possibly different relaxation times.

The separable candidate fails if any envelope-matched handedness reversal produces one of the following after ordinary chiral mechanics and instrumental cross-talk are removed:

1. statistically distinct pole locations or tail invariants between even and odd channels;
2. a systematic \(q\)- or \(v\)-dependence in \(\mathcal R\);
3. no sign reversal in the isolated odd channel;
4. a response completely explained by known elasticity, gyroscopic effects, Coriolis forces, electromagnetic pickup, or detector handedness.

## Solver check

`orientation_chirality_coupler_solver.py` generates complex two-channel data on 9 wavenumbers, 3 speeds, 4 director angles, and both handedness states. It fits on the two lower speeds and withholds the highest speed. Noise is complex Gaussian with \(\sigma=0.003\) per real/imaginary component.

Shared-pole synthetic data used \((a,b,c,\ell_s,\tau_s)=(1,0.34,0.18,0.72,0.55)\). The shared model recovered

\[
(1.0006,0.3369,0.1806,0.7197,0.5479),
\]

with training RMSE \(0.002864\) and withheld-speed RMSE \(0.002925\). Allowing distinct odd poles improved training AIC by only \(0.60\), while slightly worsening withheld RMSE to \(0.002931\): the extra poles were not identified.

In the deliberate failure case \((\ell_o,\tau_o)=(0.96,0.82)\), the forced-common model gave withheld RMSE \(0.006264\), whereas the split-pole model gave \(0.003271\), recovered \((\ell_o,\tau_o)=(0.9605,0.8063)\), and improved AIC by \(838.4\). The diagnostic therefore detects the kind of coupling that would kill the separable claim.

This is an identifiability test, not empirical evidence for H(s)H.

## Tight apparatus candidate

Construct two finite-core probes with the same exterior envelope, mass distribution, stiffness spectrum, drive amplitude, path, and speed, but opposite internal handedness. Traverse each through the same approximately linear resolving medium. Measure two orthogonal complex response channels over a grid of drive wavenumber/frequency and speed.

For each setting compute the half-sum and half-difference of the two handed responses. Fit the even and odd datasets jointly to a shared-pole model and to a split-pole alternative, using withheld speeds and angles for prediction. Rotate the entire apparatus, swap detector channels, reverse drive direction, and use achiral and ordinary-chiral controls to expose wiring, gyroscopic, elastic, Coriolis, and electromagnetic artifacts.

The tight prediction candidate is not merely “handedness matters.” It is:

> after isolation, the handed-odd response reverses sign while retaining the even channel's poles and moving-wake tail invariants.

If that factorization survives ordinary-physics controls, it supports a morphology/readout separation. If it fails, H(s)H needs a coupled constitutive law rather than a geometry-only source map.

## Next calculation

Replace the linear coupler by a finite-core boundary-value solve in which \(C\) is derived from traction integrated over a helical or braided core surface. The key question is whether the antisymmetric coefficient \(c\) survives envelope matching or cancels exactly. Exact cancellation would eliminate the proposed odd channel before any experiment is attempted.

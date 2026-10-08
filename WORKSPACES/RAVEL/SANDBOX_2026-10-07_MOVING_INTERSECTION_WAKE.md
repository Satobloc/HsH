# Ravel sandbox checkpoint: moving-intersection wake identities

**Status:** GEN/CANDIDATE — exploratory mechanics, not canonical H(s)H.

## Result

The earlier causal-scar equation has a sharper consequence when the finite-core intersection moves across the resolving structure: it must leave unequal exponential tails ahead of and behind the motion. Their difference and product obey two exact identities,

\[
L_{\rm behind}-L_{\rm ahead}=v_{\rm int}\tau_s,
\qquad
L_{\rm behind}L_{\rm ahead}=\ell_s^2.
\]

These relations distinguish a relaxing wake from a symmetric static deformation or a rigidly shifted response. They are standard moving-load mechanics; H(s)H-specific interpretation begins only if the load can independently be identified with a finite-core worldtube–resolver intersection.

## Provenance and coverage

### Controlling surfaces

Read the current `Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` completely (blob `2e788d4a6338d8b3795702e3937df2647730d1e5`) and current relevant pointers: Reference Desk, workflow orientation, task graph, symbol/citation/toolbox controls, Mersearch instructions, shared-write safety, and Ravel continuity/state. The HSH_RESOURCES packet remains routing/reference machinery rather than theory authority.

### HsH source — complete read

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 CONCEPTS/2026 NEW - Goog.txt`
- Blob: `9514049f90e56c0438d80f8c278c7e10ba05c5a7`
- Coverage: complete 16,068-character read.
- Material recovered: a proposed moving-timesheet wake, local pressure deficit/drag, trailing historical deformation, kink/fracture apparatus concepts, and explicit code constructions.
- Audit: the document is generated, overconfident, lattice- and constant-heavy, and repeatedly declares mechanisms “proved” when its code merely restates assumed thresholds. Its cosmological, Hawking, dark-sector, Planck-length, particle, lattice, and numerical-target claims do not control this build. The recoverable mechanical question is narrower: what wake follows if a localized load moves across a relaxing resolving structure?

### Old-archive source — substantial sequential read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H STRUCTURAL SKETCH.txt`
- Blob: `64906501d01db12171d3a2e58dc4fd0140d2784d`
- Object size: 245,948 decoded characters.
- Coverage: sequential lines 1–1500.
- Material recovered: the SAT→H(s)H worldline-to-worldtube transition; the instruction to let equations fail without steering; moving time-surface/worldtube interaction; fourth-order stiffness; medium-response kernels; differentiation of UI/Whirligig roles; and embedded Nathan corrections demoting lattice, `Z3`, numerical locks, and premature projection claims.
- Audit: constants, mass laws, dual-shell claims, ER identities, lattice rules, and asserted unifications remain historical/quarantined unless independently reconstructed. The apparatus and medium-response concepts are retained for independent testing rather than excluded with their speculative interpretations.

### Search record

Mersearch request `2026-10-07-ravel-moving-intersection-wake-001` was issued through `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, commit `56c8948e8bfabafedd4e190d53e87ca5451c816c`. Direct repository search was used only to locate and then read the underlying source files. Search excerpts are not evidence.

## Epistemic boundary

### Source facts

1. The selected HsH source explicitly proposes a trailing wake when a moving time interface passes filamentary structure, but supplies no valid constitutive derivation.
2. The archive source retains a moving-interface/medium-response program while explicitly warning against target steering and generated overclaim.
3. Neither source derives a velocity-reversal law or asymmetric tail identity.

### Ravel inference

If the resolving structure can store and relax deformation, then a moving localized intersection cannot generally be represented by the stationary response alone. Motion converts temporal memory into spatial fore–aft asymmetry.

### New sandbox conjecture

Use the least structured stable linear response already derived for the stationary scar:

\[
\tau_s\partial_t h+h-\ell_s^2\partial_\xi^2h
=\alpha_s p(\xi-v_{\rm int}t).
\tag{1}
\]

Here (h) is a resolver deformation, (p) is the moving intersection load, (\tau_s>0) is the relaxation time, (\ell_s>0) is the healing length, and (v_{\rm int}) is the calibrated intersection velocity in the resolver chart. All symbols are local to this checkpoint.

## Moving-frame geometry

Set (y=\xi-v_{\rm int}t). A steady wake satisfies

\[
-\tau_s v_{\rm int}h'(y)+h(y)-\ell_s^2h''(y)=\alpha_s p(y).
\tag{2}
\]

For a point-load limit (p(y)=\delta(y)) and (v_{\rm int}>0),

\[
h(y)=h_0
\begin{cases}
e^{y/L_{\rm behind}},&y<0,\\
e^{-y/L_{\rm ahead}},&y>0,
\end{cases}
\tag{3}
\]

where

\[
h_0=\frac{\alpha_s}
{\sqrt{(v_{\rm int}\tau_s)^2+4\ell_s^2}},
\tag{4}
\]

\[
L_{\rm behind}=\frac{\ell_s}{2}
\left(\sqrt{\mathrm{Pe}_s^2+4}+\mathrm{Pe}_s\right),
\quad
L_{\rm ahead}=\frac{\ell_s}{2}
\left(\sqrt{\mathrm{Pe}_s^2+4}-\mathrm{Pe}_s\right),
\tag{5}
\]

and (\mathrm{Pe}_s=v_{\rm int}\tau_s/\ell_s). Direct multiplication and subtraction give

\[
\boxed{L_{\rm behind}L_{\rm ahead}=\ell_s^2},
\qquad
\boxed{L_{\rm behind}-L_{\rm ahead}=v_{\rm int}\tau_s}.
\tag{6}
\]

Reversing velocity swaps the two tails. A finite core convolves equation (3) with the core load profile; it changes the near-intersection shape, while the asymptotic tail exponents survive when the source is localized.

## Spectral discriminator

For one spatial harmonic (q), the moving steady load samples the stationary transfer function at (\omega=qv_{\rm int}):

\[
H(q,v_{\rm int})=
\frac{\alpha_s}
{1+(\ell_s q)^2-iqv_{\rm int}\tau_s}.
\tag{7}
\]

Therefore

\[
|H(q,v)|=|H(q,-v)|,
\qquad
\arg H(q,-v)=-\arg H(q,v),
\tag{8}
\]

for a reciprocal resolver and detector. At small velocity,

\[
\left.\frac{\partial\arg H}{\partial v}\right|_{v=0}
=\frac{q\tau_s}{1+(\ell_s q)^2}.
\tag{9}
\]

Equations (6), (8), and (9) are the tight test set. A static globally constrained deformation has no required reversal-odd phase. A rigidly displaced symmetric response can generate phase but cannot simultaneously reproduce the velocity-dependent attenuation and both tail identities.

## Blind numerical check

`moving_intersection_wake.py` generated noisy complex response data at 24 spatial modes and training velocities (-0.9,-0.35,0,0.35,0.9). It fitted equation (7) against a three-parameter rigid-delay null, then predicted the withheld speed (v=1.35).

| Quantity | Result |
|---|---:|
| Hidden ((\alpha_s,\ell_s,\tau_s)) | (0.083, 0.47, 0.76) |
| Recovered | (0.082973, 0.469817, 0.759897) |
| (\Delta\mathrm{AIC}), wake over rigid-delay null | 1354.81 |
| Withheld wake RMS | (4.380\times10^{-4}) |
| Withheld null RMS | (1.400\times10^{-2}) |
| Null/wake error ratio | 31.96 |

At the withheld speed, the fitted tails were

\[
L_{\rm behind}=1.20851,
\qquad L_{\rm ahead}=0.182645.
\]

Their difference was 1.0258605, exactly matching (v\tau_s) to numerical precision, and their product was 0.22072765, exactly matching (\ell_s^2). This checks the implementation and identifiability only; it is not empirical evidence.

## Apparatus proposal

Use a track, rotating ring, translating patterned actuator, or optical/elastic analog that moves the same localized finite-width load across one characterized resolver at controlled (\pm v). Measure the complex spatial response and the resolved wake profile.

1. Calibrate the stationary (v=0) response to determine (\ell_s).
2. Fit (\tau_s) from one nonzero speed using both tails rather than only phase.
3. Freeze both parameters and preregister the opposite velocity and a larger withheld speed.
4. Require simultaneous agreement with equations (6), (8), and (9).
5. Repeat with altered detector orientation, resolver thickness, core/load width, charge state, and rotation direction where the chosen apparatus permits.

This apparatus remains useful if every effect is ordinary viscoelastic, diffusive, thermal, or electromagnetic response. In that outcome it calibrates the complete conventional wake that any proposed H(s)H residual must exceed.

## Failure gates

Reject or revise this scalar moving-scar mechanism if:

- the two tail lengths do not satisfy both identities in equation (6);
- velocity reversal does not exchange the tails and reverse phase while preserving amplitude;
- a rigid translation, thermal diffusion model, ordinary viscoelasticity, mechanical resonance, electromagnetic pickup, or detector latency fully explains the response with fewer effective assumptions;
- inferred (\ell_s) changes with speed or inferred (\tau_s) changes with (q) outside the declared linear regime;
- finite-core convolution changes the far-tail exponents rather than only the near field;
- numerical discretization does not converge to equations (3)–(9);
- any pre-response appears in a regime where the retarded constitutive law is assumed.

If ordinary mechanics accounts for the entire wake, the H(s)H-specific residual is null. The apparatus is still retained as a successful characterization rather than dismissed because of the speculative document in which it appeared.

## Cross-pollination after construction

After deriving the moving-frame result, I reread `WORKSPACES/RAVEL/SANDBOX_2026-10-07_CAUSAL_INTERSECTION_SCAR_DISPERSION.md` completely (blob `213416197f2fef1fd9fe19abd28e306934595291`). That checkpoint derived the stationary (q^2) relaxation pole. The present result is its necessary moving-load extension: substituting (\omega=qv_{\rm int}) is not enough by itself; the comoving boundary-value problem exposes the observable asymmetric tails and the two invariant relations in equation (6).

## Next cursor

Replace the scalar load by a finite-core oriented load tensor. Test whether reversing worldtube chirality changes the sign or angular channel of (\alpha_s) while leaving the passive wake invariants (L_{\rm behind}L_{\rm ahead}=\ell_s^2) and (L_{\rm behind}-L_{\rm ahead}=v_{\rm int}\tau_s) unchanged. That separation would distinguish morphology coupling from resolver transport.


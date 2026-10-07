# Ravel sandbox — signed material-frame twist from complex polarization coherence

**Date:** 2026-10-07  
**Status:** `GEN/CANDIDATE` — siloed sandbox construction, not canonical H(s)H  
**Question:** can a finite anisotropic worldtube reveal the *sign* of accumulated material-frame twist, rather than only its magnitude?

## Result

Yes, within the weak-anisotropy finite-rod model. Pole splitting alone is even in the twist density and therefore leaves an exact `delta ↔ -delta` ambiguity. The polarization axis of the split pair supplies the missing phase. Combining magnitude and axis into one complex observable recovers signed twist while fitting detector orientation as a nuisance parameter.

## Independent construction

For Neumann mode `n`, let `q_n=n*pi/L`, total material-frame twist `x=delta*L`, and let the rotating anisotropy be sampled with modal weight `2 sin^2(n*pi*u)`. Define

\[
G_n(x)=2\int_0^1\sin^2(n\pi u)e^{i2xu}\,du.
\]

Direct integration gives the stable form

\[
G_n(x)=A(x)-\frac12[A(x+n\pi)+A(x-n\pi)],
\qquad
A(t)=e^{it}\frac{\sin t}{t},
\]

and, away from removable singularities,

\[
\boxed{
G_n(x)=e^{ix}
\frac{n^2\pi^2\sin x}{x(n^2\pi^2-x^2)}.
}
\]

The first-order anisotropic perturbation in the laboratory transverse basis has the traceless form

\[
M_n\propto
\begin{pmatrix}
\Re G_n&\Im G_n\\
\Im G_n&-\Re G_n
\end{pmatrix}.
\]

Therefore

\[
\Delta\lambda_n
=2c_{\rm iso}q_n^2\varepsilon_C|G_n|,
\qquad
\psi_n=\frac12\arg G_n \pmod\pi,
\]

where `psi_n` is the principal axis of one consistently labelled pole. The natural direct readout is

\[
\boxed{
Z_n(L)=
\frac{\Delta\lambda_n}{2c_{\rm iso}q_n^2}
e^{i2\psi_{n,\rm obs}}
=\varepsilon_C e^{i2\psi_{\rm det}}G_n(\delta L).
}
\]

`psi_det` is an unknown but length-independent detector-axis offset. Crucially,

\[
G_n(-x)=G_n(x)^*,
\]

so `|G_n|` cannot distinguish handedness, while the complex phase can. At a coherence zero the polarization axis is undefined, but `Z_n` smoothly tends to zero; fitting the complex quantity avoids dividing by a noisy angle.

## Blind synthetic inverse

Hidden parameters were

\[
(\delta,\varepsilon_C,\psi_{\rm det})=(-1.37,0.075,0.31).
\]

Sixteen noisy complex observations covered eight lengths and modes 1 and 2. A multistart complex least-squares fit recovered

| Quantity | Hidden | Recovered |
|---|---:|---:|
| signed twist density `delta` | -1.370000 | -1.371941 |
| anisotropy `epsilon_C` | 0.075000 | 0.074752 |
| detector offset `psi_det` | 0.310000 | 0.308996 |

Magnitude-only fits returned equal roots

\[
\delta=-1.368582\quad\text{and}\quad+1.368582,
\]

demonstrating the unresolved sign branch. The complex carrier model beat a detector-fixed complex-anisotropy null by

\[
\Delta\mathrm{AIC}=220.23.
\]

At a withheld length `L=2.35`, it predicted the two-mode complex response with relative error `0.9346%`.

## Translation into current H(s)H language

This is not centerline Frenet torsion. It is accumulated rotation of an internal constitutive director carried by a finite worldtube. In the current time-normal framing, matter-induced angular/torsional transport may rotate the time normal and/or the material frame coupled to it. A persistent anisotropic core converts that transport into two linked intersection observables:

1. split pole locations measure coherence magnitude;
2. resolved pole polarization measures coherence phase.

The minimal state required by this construction is therefore not only a centerline and radius but a finite core with a transported transverse constitutive tensor. Particle-like identity would reside in the transfer-stable complex response family across lengths and intersections, not in one resolved shape.

## Source facts, inference, and conjecture

### Source facts actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT AUDIT — Space Do over.txt` — complete file. It presents a historical construction in which microscopic nutation changes an intersection trace from a circle to a hypotrochoid and thereby changes effective path length. It also contains asserted constants, particle assignments, lattice navigation, `g-2`, blackout, and propulsion claims. Those claims and all numerical targets were excluded.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_126_DIRECT_READOUT_ENDPOINT_RECONSTRUCTION.md` — complete file. It derives two asymptotic inverse branches from local geometric readouts, including linear versus cube-root endpoint scaling, and explicitly treats them as geometric/readout statements rather than physical identifications.
- `Satobloc/HsH/indexes/mersearch_requests/2026-10-07-ravel-anisotropic-core-spectrum-002/RUN_MANIFEST.json` and the opening result block of `SEARCH_RESULTS.md`. The request completed with Mercer_Searcher_1.0 over 3,987 files / 6,597,201 records and returned 263 lexical hits. It was used only to establish retrieval coverage and provenance; snippets were not promoted to evidence.

The controlling HsH front door and its materially relevant workflow, citation, notation, and tool-routing pointers were refreshed before the construction. The HSH_RESOURCES root index, toolkit router/digestion plan, Tool Chest, preference boot, and War Room declaration were used only as routing and candidate-tool familiarization. No quarantined resource was imported as theory authority.

### Inference

The old nutation motif becomes mechanically useful only after replacing its unsupported numerical claims with a typed directional observable: a rotating finite-core anisotropy produces a complex modal coherence. Run 126's useful methodological transfer is that latent geometric branches should be separated by directly measurable scaling or phase laws.

### New sandbox conjecture

If matter-induced time-normal/material-frame twist is physically transported through a finite anisotropic core, the normalized split-pair order parameter `Z_n` should be a transferable signed descriptor. Its length-dependent phase is a candidate handedness observable that does not require targeting any historical constant or particle label.

## Decisive experiment / solver test

Measure two split modes across at least six controlled effective lengths and at two detector orientations. For each mode form

\[
Z_n=\frac{\Delta\lambda_n}{2c_{\rm iso}q_n^2}e^{i2\psi_{n,\rm obs}}.
\]

Fit one shared signed `delta`, one anisotropy, and one offset per detector orientation. Preregister a withheld length near—but not exactly at—a coherence zero. The carrier model must predict both split magnitude and polarization axis. Rotating the detector by `rho` may multiply every `Z_n` by `e^{i2rho}` but must not change recovered `delta` or pole positions.

## Failure gate

Reject or revise this architecture if any of the following occurs:

- `delta` changes sign or magnitude under a declared detector rotation;
- phase is length-independent after nuisance offsets are fitted;
- modes 1 and 2 require incompatible signed twist densities;
- a detector-fixed null predicts withheld complex responses equally well after complexity penalties;
- polarization axes fail to converge under mesh/refinement or cannot be associated consistently with the split poles;
- complex coherence does not tend continuously to zero at the predicted magnitude zeros.

## Artifacts

- Executable inverse test: `WORKSPACES/RAVEL/CODE/signed_twist_phase_discriminator.py`
- Numerical record: `WORKSPACES/RAVEL/DATA/signed_twist_phase_discriminator.json`
- Class-P diagnostic: `WORKSPACES/RAVEL/FIGURES/signed_twist_phase_discriminator.svg`


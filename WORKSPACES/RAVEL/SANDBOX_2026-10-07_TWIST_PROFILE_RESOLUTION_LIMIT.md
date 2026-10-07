# Ravel sandbox checkpoint — twist-profile resolution limit

**Status:** `GEN/CANDIDATE`  
**Scope:** finite anisotropic worldtube; distributed material-frame twist; complex modal readout  
**Claim boundary:** an identifiability result inside the declared readout model, not canonical H(s)H and not a particle assignment.

## Result in one sentence

Internal twist tomography is necessarily band-limited: a finite set of complex intersection observables determines only a quotient class of material-frame profiles, while additional mode families—not repeated measurements of one mode alone—lift the dominant null directions.

## Independent construction

Let `u=s/L` be normalized material position on a finite core segment. In the local/provisional namespace used here, expand an endpoint-preserving director-phase profile as

\[
\vartheta(u;L)=\delta_{\rm mat}Lu+\sum_{k=1}^{K}a_k\sin(k\pi u).
\]

The sine perturbations vanish at both endpoints, so every coefficient vector `a` has the same endpoint frame relation as the uniform carrier term. This deliberately separates endpoint holonomy from internal distribution.

For a Neumann-like mode family, retain the complex coherence readout

\[
G_n(L)=2\int_0^1\sin^2(n\pi u)e^{2i\vartheta(u;L)}\,du.
\]

This is a readout model, not the worldtube itself. The real and imaginary parts represent two signed polarization quadratures. Linearization at `a=0` gives the sensitivity matrix

\[
\boxed{
J_{(n,L),k}
=4i\int_0^1\sin^2(n\pi u)\sin(k\pi u)
e^{2i\delta_{\rm mat}Lu}\,du
}
\]

with real and imaginary parts stacked as separate observations. If `Jq=0`, then the profile perturbation

\[
q(u)=\sum_k q_k\sin(k\pi u)
\]

is invisible to first order. With noise covariance represented here by a scalar floor, small singular values define practical rather than exact null directions.

## Resolution audit

The solver used `K=12`, `delta_mat=-1.10`, six lengths

\[
L=(0.55,0.80,1.10,1.45,1.85,2.30),
\]

and compared four readout architectures. Effective ranks below use relative singular-value thresholds of `1e-2` and `1e-3`.

| Architecture | Real observations | Algebraic nullity | Rank >1% | Rank >0.1% | Condition number |
|---|---:|---:|---:|---:|---:|
| One length, mode 1 | 2 | 10 | 2 | 2 | 2.66 among nonzero values |
| Six lengths, mode 1 | 12 | 0 | 4 | 5 | `2.39e11` |
| Six lengths, modes 1–3 | 36 | 0 | 8 | 9 | `2.88e4` |
| Six lengths, modes 1–5 | 60 | 0 | 12 | 12 | 42.15 |

The important distinction is algebraic versus practical identifiability. Six lengths technically make the one-mode Jacobian square, but eight directions remain below the 1% singular scale and the condition number is catastrophic. Length diversity is not a substitute for distinct mode kernels.

## Blind six-coefficient recovery

A fixed seed generated data from

\[
\delta_{\rm mat}=-1.07,
\qquad
(a_1,\ldots,a_6)=(0.080,-0.045,0,0.030,0,-0.018),
\]

with independent Gaussian noise `sigma=0.0015` in each complex quadrature. Six lengths and modes 1–3 were fitted; mode 4 at three new lengths was withheld.

| Quantity | Injected | Recovered |
|---|---:|---:|
| `delta_mat` | -1.070000 | -1.069066 |
| `a1` | 0.080000 | 0.079115 |
| `a2` | -0.045000 | -0.043428 |
| `a3` | 0 | 0.000262 |
| `a4` | 0.030000 | 0.028594 |
| `a5` | 0 | 0.000771 |
| `a6` | -0.018000 | -0.017915 |

The training reduced chi-square was `1.332`. The withheld mode-4 relative error was `3.05e-4` (`0.0305%`). This validates the declared low-order basis only; it does not prove that the physical profile is six-dimensional.

## Adversarial near-null profile

The smallest right-singular direction of the modes-1–3 design is concentrated in the highest even basis components. It can carry an RMS internal phase deformation of

\[
\boxed{0.02943\ {\rm rad}}
\]

while keeping the maximum change in every training complex response at the declared `0.002` noise floor. The same deformation changes:

- mode 4 by as much as `0.00374`;
- mode 5 by as much as `0.01620`.

Thus the construction makes a preregisterable prediction: a profile apparently absent in modes 1–3 should become visible first in higher modes according to the singular vectors, rather than by arbitrary retuning of the carrier.

## SAT source extraction and translation

### Source facts retained

`SAT_THEORY_ARCHIVE_2023-25/2026/SAT AUDIT — Spectra-Heat anom.txt` uses complex phase, Fourier analysis, filament strain, and mode language. It also demonstrates a failure mode: the claimed `270 degree` step is inserted explicitly into the simulator before being “recovered,” and later anomaly shapes are imposed through piecewise functions and target tolerances. Those outputs are not independent derivations.

`HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/SAT-GIGAPACK.txt` presents a generated catalog containing an `SO(4)` rotation history and nested worldtube modes, but also labels rejected or unestablished dual-space, `H0+c`, lattice, constants, particle, and mass constructions as current controls. It is therefore used only as a negative provenance/control example and a source of historical vocabulary.

### Translation into current H(s)H language

The salvageable old construction is not a fixed spectral number. It is the weaker structural statement that a finite carrier can possess a distributed rotation history and that different internal modes can interrogate that history with different weights. Current H(s)H language makes those layers explicit:

\[
\text{finite-core worldtube history}
\xrightarrow{\text{material-frame transport}}
\vartheta(s)
\xrightarrow{R_\Sigma\text{ with mode }n}
G_n(L).
\]

The worldtube, its H(s)H parametrization, and its readout are not identified with one another.

## New sandbox conjecture

For a declared measurement design `D`, the operational particle-like descriptor should be an equivalence class

\[
\boxed{
[\vartheta]_D=
\{\vartheta+q:\ \|J_Dq\|\lesssim \sigma_D\}
}
\]

rather than an asserted exact internal profile. In plain language: a particle-like identity may be stable across observations even when many distinct internal morphologies are unresolved. Additional resolvers refine the equivalence class; they do not reveal a unique hidden shape by fiat.

This is a finite-readout consequence of taking the 4D picture seriously. The observed local structure is an instantiation resolved from an extended history, so information content is limited by the family of intersections actually measured.

## Failure conditions

Reject or revise this construction if:

1. a finite-element director/worldtube model produces different kernels whose rank pattern does not converge to this integral model in its stated limit;
2. inferred low-order coefficients change under detector rotation or resolver thickness after nuisance transformations are modeled;
3. higher modes fail to expose the computed near-null direction;
4. nonlinear aliases allow materially different low-order profiles to fit all withheld modes equally well;
5. mesh or quadrature refinement moves the singular spectrum materially;
6. the endpoint-preserving sine basis is found to exclude the mechanically admissible perturbations relevant to the carrier.

## Proposed solver/experiment

Use a sequential mode-admission protocol. Fit lengths with mode 1, then unlock modes 2–3, then 4–5 without changing the profile basis or noise model. Before seeing the higher-mode data, compute the SVD and preregister:

- which coefficient combinations are unresolved;
- which next mode maximally lifts the weakest singular direction;
- the complex response predicted for that mode;
- the allowed detector-phase nuisance transformation.

A genuine distributed carrier profile must predict the newly admitted mode. A detector-fixed artifact can rotate all complex responses by a common phase but cannot reproduce the prescribed mode-dependent lifting pattern.

## Reading record and provenance boundary

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT AUDIT — Spectra-Heat anom.txt` — complete read, 38,052 decoded characters, blob `2588c591...`; phase/spectral code, heat-anomaly construction, target insertion, and subsequent anomaly claims inspected.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/SAT-GIGAPACK.txt` — complete read, 17,054 decoded characters, blob `99a137e4...`; claimed equation/status catalog inspected in full.
- `HsH/indexes/mersearch_requests/2026-10-07-ravel-twist-profile-tomography-001/RUN_MANIFEST.json` and opening `SEARCH_RESULTS.md` — completed search over 3,988 files / 6,601,697 records / 404 hits. Used as navigation only; snippets were not treated as evidence.
- The controlling front door, current workflow/symbol/citation/tool routing, HSH_RESOURCES desk/index/toolkit/digestion/preferences/tool-chest/War-Room surfaces were refreshed. HSH_RESOURCES remained supporting machinery, not theory authority.

Historical constants and particle labels were not fitting targets or model inputs.

## Reproducibility

- Solver: `WORKSPACES/RAVEL/CODE/twist_profile_resolution.py`
- Numerical record: `WORKSPACES/RAVEL/DATA/twist_profile_resolution.json`
- Diagnostic: `WORKSPACES/RAVEL/FIGURES/twist_profile_resolution.svg`

The solver uses fixed quadrature, a fixed random seed, explicit basis size, and declared noise. The JSON contains full singular spectra, fitted coefficients, and the adversarial profile vector.

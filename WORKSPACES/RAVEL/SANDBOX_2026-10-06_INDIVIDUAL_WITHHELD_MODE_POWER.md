# Ravel sandbox — individual withheld-mode power boundary

**Status:** exploratory SAT→H(s)H construction; not canonical theory.  Historical labels and constants were not used as fit targets.

## Read/provenance ledger

- Front door read before work: `HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` at GitHub blob `2e788d4a6338d8b3795702e3937df2647730d1e5`, including its live routing to the Reference Desk, Mersearch, symbol controls, citation ledger, and quarantine rules.  The 5 Oct `HSH_RESOURCES` packet had already been reviewed as routing/tool familiarization; no `PRIOR_ART` content was imported into this construction.
- Fresh SAT archive read: `SAT_THEORY_ARCHIVE_2023-25/H(s)H COMBINOTATION.txt`, lines 1–1800 requested and substantially read.  What was actually used: the old draft's separation of six SO(4) rotation-plane slots from four expansion-axis slots.  The draft's generated notation, cosmological narratives, and historical labels were not adopted.
- Fresh H(s)H read: `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md`, read in full.  What was actually used: the distinction between an identifiable effective support and an unresolved internal decomposition, including the local inverse
  \[
  \rho_{\rm eff}=K\ell_\parallel^2/8,\qquad
  \alpha=\Xi K\ell_\parallel/(2\sqrt2),
  \]
  and its explicit warning that `rho_eff = rho_n + h` does not identify `rho_n` and `h` separately.

## Independent translation

The SAT slot separation suggests a typed-channel rule for H(s)H: a finite worldtube's *angular morphology* and its *endpoint/support geometry* should be inferred as distinct parameter blocks.  Run 136 independently supports the inverse-problem discipline: report only the combinations the readout identifies.

Here the readout model has two endpoint supports `(rho_+, rho_-)` and six angular moments.  It is deliberately denied moments 7–10.  Each omitted mode is activated alone, with every lower moment held fixed.  This is stricter than the previous alternating four-mode injection and prevents a hidden baseline change from masquerading as a single-mode test.

## Concrete finite-core construction

Use a positive angular material density on `u in [-1,1]`,

\[
p(u;\eta)=\frac{\exp\!\left[\sum_{j=1}^{10}\eta_jP_j(u)\right]}
{\int_{-1}^{1}\exp\!\left[\sum_{j=1}^{10}\eta_jP_j(v)\right]dv},
\qquad m_j=\int_{-1}^{1}P_j(u)p(u)\,du .
\]

For a test of channel `ell`, solve the exponential-family moment map so that

\[
m_j^{(\ell,\delta)}=m_j^{(0)}\quad(j<\ell),\qquad
m_\ell^{(\ell,\delta)}=m_\ell^{(0)}+\delta .
\]

The maximum numerical drift in any protected lower moment was `5.83e-13`.

The two-orientation intersection signal is the same finite-support square-root readout used in the preceding stress test.  Fit only `P1..P6` and `(rho_+,rho_-)` on 16 log-spaced crossover thicknesses; test on 24 independent thicknesses.  Noise is Gaussian with `sigma=1e-4`, AR(1) thickness correlation `0.6`, cross-orientation correlation `0.25`, and a 1% support prior.  The blind 5% gate was calibrated from 120 null simulations, yielding generalized holdout `chi^2 > 84.5011`.

## Result

Forty-eight Monte Carlo trials were run per sign, mode, and amplitude.  Linear interpolation of the monotone empirical power envelope gives the following provisional 80% detection boundaries:

| Withheld channel | negative `delta m_l` | positive `delta m_l` |
|---|---:|---:|
| `P7` | 0.337% | 0.317% |
| `P8` | 0.322% | 0.279% |
| `P9` | 0.264% | 0.233% |
| `P10` | 0.242% | 0.239% |

No optimizer retry or unresolved failure occurred in 2,424 fits (120 null plus 48 alternatives × 48 trials).  A forward quadrature refinement from 900 to 1,800 nodes changed the strongest-injection predictions by at most `0.270 sigma` pointwise and `0.095 sigma` RMS.

## Boundary between fact, inference, and conjecture

- **Source fact:** the old SAT draft typed rotation-plane and expansion-axis entries separately; Run 136 proved local identifiability only for an effective support combination in its crossover model.
- **Inference:** an H(s)H inverse should likewise keep morphology modes separate from support coordinates and expose omitted-mode sensitivity rather than let support deformation silently absorb all mismatch.
- **New sandbox conjecture:** an ordered angular moment ladder can act as typed internal worldtube morphology, while two endpoint supports encode coarse asymmetric extent.  For this particular square-root intersection kernel, higher tested channels are *more visible* on the chosen holdout ladder: `P10` reaches 80% power at about 0.24%, versus about 0.32–0.34% for `P7`.  This is a kernel/ladder claim, not a particle-spectrum claim.

The mild sign asymmetry (largest for `P8` and `P9`) is plausibly produced by the nonzero baseline moments plus unequal supports, but that mechanism has not yet been isolated.

## Discriminator and failure condition

**Discriminator:** after fitting the six-mode/support model, apply the pre-registered generalized holdout `chi^2` gate on new thicknesses.  Detection power should rise monotonically with the magnitude of a truly omitted individual morphology channel, with the mode ordering above under this fixture.

**Failure condition:** the architecture fails as a useful falsifiable readout if physically relevant omitted modes can remain below this gate because support motion or lower modes absorb them.  Concretely, a 0.30% negative `P7` perturbation was detected in only 70.8% of trials (95% Wilson interval is recorded in the JSON), so a blanket claim that all 0.30% high-order morphology is visible is already false.  The interpolated boundaries are also provisional because 48 trials leave broad binomial intervals.

## Next solver test

Bracket each 80% crossing with a denser adaptive amplitude grid and at least 200 trials per point, then repeat after swapping the asymmetric supports and after setting them equal.  If sign asymmetry reverses under support swap and collapses for equal supports, that isolates endpoint asymmetry as its mechanism.  If it does not, inspect nonlinear mode coupling in the exponential density and redesign the thickness ladder against the worst individual mode rather than the four-mode mixture.

## Artifacts

- `WORKSPACES/RAVEL/CODE/individual_withheld_mode_power.py`
- `WORKSPACES/RAVEL/DATA/individual_withheld_mode_power.json`
- `WORKSPACES/RAVEL/FIGURES/individual_withheld_mode_power.svg`


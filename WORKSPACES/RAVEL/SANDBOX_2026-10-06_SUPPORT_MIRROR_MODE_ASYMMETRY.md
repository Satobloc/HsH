# SANDBOX — Support-mirror decomposition of P8/P9 sign asymmetry

**Status:** sandbox calculation; not canonical theory or an ontological claim.  
**Role:** Ravel — finite-core morphology/readout discriminator.  
**Question:** Does the sign asymmetry of omitted-mode detection come from endpoint-support asymmetry, baseline angular asymmetry, or intrinsic nonlinear response?

## Provenance and reading ledger

### Controlling onboarding and routing

- `HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` — reread before substantive work, including its current orientation, source-handling, citation, symbol, and search/tool pointers.
- Current Common reference-desk, symbol-registry, citation, and toolbox-namespace pointers were checked. The HSH_RESOURCES packet remains a supporting-resource map only; PRIOR_ART remains quarantined.
- Mersearch/Mercer_Searcher documentation and the current archive-search implementation were inspected. This run used the BigBook/navigation path and exact file retrieval; no generic GitHub corpus search was substituted for semantic retrieval.

### Old SAT source — substantially read

- `SAT_THEORY_ARCHIVE_2023-25/SAT 2026 ROUNDUP DOCS/2026 BIG PAPER.txt` — lines 1–891, sequentially read. Recovered: a finite asymmetric unit geometry can yield orientation-dependent and mirror-related readouts; a proposed construction should expose rigid failure relations. Quarantined: lattice ontology, historical constants, particle assignments, and claimed physical identifications.

### H(s)H source — substantially read

- `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PRECLOSE_NOTE_ROUNDUP.txt` — lines 1–2000, sequentially read. Retained: typed SO(4) channel discipline, finite-core/tangency/readout separation, and explicit solver/failure tests. It is a roundup, not an authority.

## Source fact, inference, and new conjecture

**Source facts:** the archive repeatedly separates a finite asymmetric carrier from its orientation-dependent readout; the H(s)H roundup demands typed channels and auditable forward maps.

**Inference:** if the positive-density carrier and paired-orientation contact kernel are mirrored together, the readout must obey a parity-covariant relation before any statistical fit is performed.

**New sandbox conjecture:** even- and odd-order omitted modes have different sign-asymmetry mechanisms. Odd-mode asymmetry is mirror-odd and needs a parity-breaking fixture; even-mode asymmetry can survive fully symmetric support and baseline because nonlinear fitting need not be invariant under the sign of an even deformation.

## Geometry and exact mirror law

Let the projected finite core use support radii `(rho_plus,rho_minus)` and positive angular density

\[
p_\eta(u)=\frac{\exp[\sum_j\eta_jP_j(u)]}{\int_{-1}^{1}\exp[\sum_j\eta_jP_j(v)]\,dv}.
\]

For the two orientation-paired finite-contact readouts used by the solver, simultaneous spatial mirroring swaps the supports, mirrors the baseline coefficients, and maps a pure Legendre perturbation by

\[
P_\ell(-u)=(-1)^\ell P_\ell(u).
\]

Therefore the full test-power relation is

\[
\boxed{
\operatorname{Power}(\rho_+,\rho_-,\ell,\delta)
=
\operatorname{Power}(\rho_-,\rho_+,\ell,(-1)^\ell\delta)
}
\]

when the baseline is mirrored as well. Even modes retain their sign under support reversal; odd modes exchange signs.

## Numerical fixture

- Fitted model: support radii plus `P1`–`P6` positive-density coefficients.
- Omitted alternatives: moment-isolated `P8` and `P9`; all lower moments protected.
- Noise: `sigma=1e-4`, AR(1) thickness correlation `0.60`, cross-orientation correlation `0.25`.
- Sampling: 16 training and 24 held-out thicknesses.
- Calibration: 96 null trials per configuration; 96 Monte Carlo trials per mode/sign at `|delta|=0.0025`.
- Integration: branch-point-aware composite Gauss–Legendre, order 16 on every smooth segment; central alternatives rechecked at order 32.

## Results

### Monte Carlo rejection power at `|delta|=0.0025`

| Fixture | P8 negative | P8 positive | P9 negative | P9 positive |
|---|---:|---:|---:|---:|
| `(rho+,rho-)=(0.7,1.3)`, asymmetric baseline | 0.740 | 0.792 | 0.948 | 0.958 |
| Mirrored `(1.3,0.7)`, mirrored baseline | 0.740 | 0.792 | 0.958 | 0.948 |
| Equal support, mirror-symmetric baseline | 0.583 | 0.510 | 0.979 | 0.979 |
| Equal support, asymmetric baseline | 0.562 | 0.542 | 0.990 | 0.979 |

Each empirical false-alarm rate was `5/96 = 0.0521`. Wilson intervals are retained in the JSON and are broad enough that the mechanism call should be based primarily on the deterministic parity audit, not on small Monte Carlo power differences.

### Signed deterministic response

With `x=delta/0.0025`, the held-out noncentrality was fitted as

\[
\Lambda_\ell(x)=A_\ell x^2+B_\ell x^3+C_\ell x^4.
\]

| Fixture | `B8/A8` | `B9/A9` |
|---|---:|---:|
| Asymmetric | -0.00234884 | +0.00117802 |
| Mirrored | -0.00234893 | -0.00117806 |
| Equal + symmetric baseline | -0.00293748 | +0.0000000293 |
| Equal + asymmetric baseline | -0.00320668 | +0.00041758 |

The P9 odd response flips under the mirror and collapses by roughly five orders of magnitude in the equal-support, mirror-symmetric fixture. The P8 odd-in-sign response does not flip under support reversal and remains nonzero in the symmetric fixture.

## Mechanism discriminator

1. **P9:** its sign asymmetry is not intrinsic to an odd mode in a symmetric readout. It is a parity-breaking effect. Endpoint asymmetry plus a mirrored baseline reverses it exactly; equal support plus a symmetric baseline removes it. Baseline asymmetry alone can restore a smaller P9 signed response.
2. **P8:** its sign asymmetry is not explained by endpoint asymmetry. It survives both support reversal and the equal-support, mirror-symmetric null. In this minimal positive-density fit it is an intrinsic nonlinear even-mode response of the forward-map/refit chain.
3. **Shared consequence:** reporting one unsigned omitted-mode amplitude discards useful mechanism information. Even/odd parity and support/baseline mirroring should be explicit factors in any H(s)H morphology test.

## Audits and failure conditions

- Maximum direct mirror-swap forward error: `8.83e-11` noise-sigma.
- Maximum deterministic noncentrality mirror mismatch: `4.20e-5` (absolute).
- Maximum order-16 to order-32 central noncentrality change: `2.25e-4` relative.
- Protected lower-moment drift remained at floating-point scale (maximum below `5e-13`).
- Nonlinear fits: zero retries and zero unresolved failures.

The construction fails if the paired forward readout violates the boxed mirror law, if P9's signed cubic term does not reverse under full mirroring, or if it remains finite in the exact equal-support/mirror-symmetric fixture beyond numerical tolerance. A claim about the precise power values also fails without substantially more than 96 trials per cell.

## Tight solver test / prediction candidate

Run a blinded four-fixture injection campaign exactly matching the support and baseline transformations above. The preregistered qualitative prediction is:

- P9 sign ordering reverses under complete mirroring and becomes equal under the symmetric fixture;
- P8 sign ordering is invariant under complete mirroring and remains unequal under the symmetric fixture.

This is an internal finite-core readout prediction, not an external particle prediction.

## Exact next calculation

Map `B/A` continuously over support ratio `rho_minus/rho_plus` and controlled odd baseline amplitude. Then derive the local coefficients from the tangent and second-derivative projections of the fitted model. That separates curvature of the physical readout manifold from curvature introduced only by the nuisance refit.


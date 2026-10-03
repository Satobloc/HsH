# Ravel sandbox checkpoint: late-time gating targets the unresolved spectral quotient

**Status:** `GEN/CANDIDATE`. This is a blind readout-design result for the declared relaxation-spectrum fixture, not canonical H(s)H theory or a physical-channel claim.

## Exact question

After the calibrated pole-location/residue experiment leaves a 75-dimensional effective spectral null complement, which preregisterable observable adds genuinely new high-`tau` information: a higher local pole-shape coefficient or a finite late-time response gate?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/.[⚙️_AI_FILES]/LLM_WORKSPACES/Argus/XW-010_HSH_ARCHITECTING_BOUNDARY_READOUT_LINEAGE.md` — **full sequential read**. Retained its historical separation of extended worldtube, bulk/boundary structure, resolving surface, and observed intersection. It explicitly leaves the readout thickness/kernel unresolved; its event-horizon boundary proposal and historical numerical claims were not imported.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/RUN_143_LAG_CONDITIONED_RECURRENCE_DISCRIMINANT.md` — **full sequential read**. Retained its exact methodological lesson: acquisition geometry can change algebraic separability without changing the modeled object, and blindly extreme/adjacent acquisition settings can collide or become ill-conditioned.

Targeted Google Drive search found no prior principal-angle design for this spectral readout. The working-group Slack lineage supplied only the preceding quotient checkpoint, not this construction.

## Source / inference / new-construction boundary

- **Source:** the finite object and its readout/intersection are distinct; readout design may control identifiability.
- **Inference:** once the current experiment identifies only an equivalence class `[w]`, the next readout should be selected by its row-space angle to the present measurement, not by whether it recovers a desired tail.
- **New construction:** compare two candidate Jacobians against the existing calibration-marginalized 22-dimensional identifiable subspace before performing any new tail inversion.

## Candidate operators

The existing frequency-domain observables use

\[
K_1(z,\tau)=(1-iz\tau)^{-1},
\qquad
K_2(z,\tau)=(1-iz\tau)^{-2}.
\]

Two candidates were constructed:

1. a higher local pole-shape kernel

\[
K_3(z,\tau)=(1-iz\tau)^{-3};
\]

2. a causal impulse-response gate integrated over `[T,2T]`

\[
G_T(\tau)=e^{-T/\tau}-e^{-2T/\tau}.
\]

Let `V_old` contain the 22 retained right singular vectors of the whitened `369 x 97` pole/residue Jacobian. For candidate row-space basis `Q`, novelty is measured by singular values of

\[
(I-V_{old}V_{old}^T)Q.
\]

These are sines of principal angles to the old row space. The operation is invariant under candidate row rescaling. Gate times were chosen greedily by projected row-space novelty, with a preregistered minimum ratio `T_j/T_k >= 1.8` to prevent a formally high-rank bank of nearly coincident windows. No recovered tail or injected atom entered selection.

## Result

### Higher pole-shape candidate

- raw row rank: `36`
- strongly novel modes (`sin angle >= 0.5`): `14`
- tail leverage above `tau=12`: `0.0720`
- calibration burden: a stable second local Laurent/pole-shape coefficient

This operator adds substantial algebraic rank, but it spends *less* of its normalized leverage above `tau=12` than the existing operator (`0.0962`). It is a broad reconstruction upgrade, not a tail-specific discriminator.

### Time-gated candidate

Blindly selected gate starts:

\[
T=(96.0,\;49.34,\;25.36,\;0.1105,\;0.02919,\;0.015).
\]

- gate-bank rank: `6`
- all six directions are nonzero outside the old row space
- one strongly novel combined direction has principal-angle sine `0.8649`
- gate-bank tail leverage above `tau=12`: `0.4321`

The single latest gate `[96,192]` is the minimal tail probe:

- principal-angle novelty sine: `0.4763`
- leverage above `tau=12`: `0.9999978`
- maximum kernel amplitude on the allowed support: `0.1170`

Thus a finite late-time gate is the cleaner next intervention. It does not add as many total directions as `K_3`, but it places essentially all of one measurement direction exactly where the previous experiment is weak.

## Candidate comparison

| Candidate | Strong new directions | Tail leverage | Main burden | Disposition |
|---|---:|---:|---|---|
| `K_3` pole shape | 14 | 7.20% | second Laurent coefficient | broad-rank backup |
| Six time gates | 1 | 43.21% | impulse tare + fixed windows | tail-focused bank |
| Single `[96,192]` gate | one moderate direction | 99.9998% | very late acquisition | minimal next test |

## Failure condition

Principal-angle novelty is not detectability. The late-gate choice fails if, after propagating a measured gate covariance and finite observation-time cost, its new singular value falls below the one-sigma floor, its calibrated impulse amplitude is unstable, or the `[96,192]` window is dominated by an unmodeled background. The result also fails as a general design claim if the gate ordering changes materially across covariance seeds.

## Prediction / experiment candidate

No external physical prediction is earned. The internal, falsifiable prediction is:

> With gate times frozen before inversion, adding the calibrated `[96,192]` late-time integral should increase effective rank by at least one and move the wide-versus-restricted tail displacement above its present maximum `0.573 sigma`, provided the relative gate uncertainty is below the projected tail contrast.

The required precision has not yet been computed.

## Exact next dependency

Using the same 13 tail seeds, simulate the frozen `[96,192]` gate with independently estimated tare covariance over a preregistered noise ladder. Determine the smallest gate precision for which at least 12/13 wide-versus-restricted displacements exceed one joint whitened sigma. Do not alter gate time, support, roughness path, or constitutive spectrum after seeing recovery.

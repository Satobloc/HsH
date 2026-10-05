# Ravel sandbox checkpoint — equal-scale off-basis leakage closes the 1% sentinel shortcut

Status: `STD/DERIVED` finite-state design calculation; `SAT/CANDIDATE` H(s)H metrology application. This is a siloed construction, not canonical theory.

## Exact narrow question

If the compact mirror-covariant channel basis is wrong in exactly one labelled true row, what allocation detects that row-local fault at the same per-event scale that already threatens the five-bin classifier?

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/ER GRAVITY.txt` — substantial sequential read. Retained only its separation of spacetime/worldtube geometry from an auxiliary interaction or readout functional, and its warning that parameter identifiability across regimes is distinct from measurement uncertainty. Literal-wrapping, gravitational-memory, ER, and astronomical claims were not imported.
- `Satobloc/HsH/synthesis/CURRENT_SYNTHESIS.md` — substantial sequential read of the current hierarchy, provenance controls, finite-thickness non-identifiability, resolver-width extrapolation, and fixed-speed transport sections. Controlling point: carrier, representation, resolver, and readout operator remain separately typed.
- `Satobloc/HsH/WORKSPACES/RAVEL/SANDBOX_2026-10-05_LOCAL_DRIFT_BASIS_MINIMAX.md` — full read; parent two-parameter basis and conventional 1% sentinel design.
- Google Drive — two targeted indexed searches for row-local leakage, off-basis detector drift, and minimax sentinel allocation. No relevant result.
- Slack `#all-hsh-working-group-one` — targeted post-construction searches for `row-local leakage` and `off-basis`. Only the parent compact-basis packet was recovered; no duplicate fault model or allocation was found.

## Typed construction

Keep the carrier and latent five-bin geometry frozen. The declared fault is entirely in the reported-bin calibration layer.

The common mirror-covariant alternatives remain:

\[
P_c=K D(d_c,d_c),\quad Q_c=K D(d_c,-d_c),
\qquad d_c=4.7514872444755717\times10^{-4},
\]

and

\[
P_b=K D(d_b,0),\quad Q_b=K,
\qquad d_b=1.13265\times10^{-3}.
\]

For each true row `r`, define a row-local adjacent-leak alternative `L_r(q)` by transferring probability `q` from reported diagonal cell `(r,r)` to its adjacent reported cell(s): inward at terminal rows and equally to left/right in interior rows. All other true rows remain equal to `K`. Set

\[
q=d_c,
\]

not as a new constant, but as the minimum fault scale worth certifying in this packet: it equals the already consequential coherent-drift crossing.

For alternative `a` and allocation weights `w`, define local two-sample information

\[
I_a(w)=\frac12\sum_r w_r\,\Delta_{a,r}^{\mathsf T}
C_r^+\Delta_{a,r},
\qquad
C_r=\operatorname{diag}(K_r)-K_rK_r^{\mathsf T}.
\]

The design solves

\[
\max_{w\in\Delta_4}\min_{a\in\{c,b,L_0,\ldots,L_4\}}I_a(w).
\]

Because each `L_r` is supported on one true row, zero weight on any row makes its corresponding fault unidentifiable. The optimization therefore derives positive sentinels without imposing an arbitrary floor.

## Derived allocation

The solution is

\[
w=(0.1259071,\ 0.2493953,\ 0.2493953,\ 0.2493953,\ 0.1259071).
\]

Terminal rows receive about half the interior weight because an inward-only transfer is roughly twice as informative as an interior split at the same total leakage probability.

A maximum-of-seven directional score test was calibrated with 50,000 finite multinomial null draws at each tested budget. Results:

| Labels/condition | Minimum power | Limiting alternatives | Null rejection |
|---:|---:|---|---:|
| 8,000,000 | 79.694% | row-local terminal faults | 4.988% |
| **8,200,000** | **81.064%** | row-local terminal faults | **4.998%** |
| 8,400,000 | 82.512% | row-local terminal faults | 4.994% |

The first tested passing design uses, per condition,

\[
(1{,}032{,}439,\ 2{,}045{,}041,\ 2{,}045{,}041,\ 2{,}045{,}041,\ 1{,}032{,}438),
\]

or 16.4 million labels across both crossed conditions. Coherent and blur power are effectively 100% at this budget; row-local leakage controls the design.

## Candidate comparison and surviving result

- Compact common-channel basis with conventional 1% sentinels: 653,796 total labels, but cannot certify an equal-scale fault confined to one row.
- Equal-scale row-local adjacent-leak family: 16.4 million total labels, approximately 25.1 times the compact-basis burden.
- Arbitrary `5x5` channel change: still not certified; the present seven-direction family is only a bounded misspecification guard.

Thus the 1% sentinel design is useful only conditional on the common-channel basis. If the required guard is “detect any one-row adjacent leak at the classifier-threatening amplitude,” the cheap certificate disappears.

The result also supplies a clean experimental decision: either justify the common drift basis independently, accept a much larger crossed-calibration program, or relax the minimum detectable row-local fault amplitude.

## Prediction packet

Assumptions: stationary nominal `K`; labelled true rows; crossed conditions; common blur/coherent alternatives plus one row-local adjacent leak; `q=d_c`; 5% familywise test size.

Prediction: the frozen 8.2-million-per-condition allocation should reject every declared fault with at least about 81% power. At 8.0 million per condition, terminal-row faults should remain just below 80%. A different limiting row pattern or failure of terminal/interior weights to scale approximately 1:2 falsifies the local multinomial fixture.

This is an internal metrology prediction, not an external physical prediction.

## Failure and exact next dependency

The packet fails to cover non-adjacent leakage, nonlinear response, simultaneous coordinated row faults, carrier-dependent calibration, or drift amplitude below `q`. It also assumes the declared row-local transfer direction; an empirically measured residual may point elsewhere.

Exact next dependency for Blind Auditor/Meridian: project measured crossed-calibration residuals into the common `span{B,V}` component and its row-local orthogonal remainder. Use the empirical remainder's direction and covariance—not a synthetic adjacent leak—to define the next minimax alternative. If no measured data exist, report the 25.1-fold cost curve as the intervention-budget tradeoff rather than selecting a sentinel floor by convention.

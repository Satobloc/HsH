# Ravel sandbox — support-opening bootstrap boundary

**Status:** SAT/CANDIDATE readout construction; STD/DERIVED finite multinomial result. This is not canonical H(s)H and not an external physical prediction.

## Exact narrow question

Does the Fisher residual statistic admit one regular bootstrap calibration at the sparse nominal five-bin channel, or does common \(B,V\) drift open structural-zero cells and therefore require a separate statistical branch? What floor measurement is required before a sample burden is defined?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT-TO-STANDARD 1.txt` — **full sequential read**, 174 lines / 21,760 characters. Source fact retained: SAT historically treats a particle/event as a slice or intersection of a four-dimensional filament/worldtube and emphasizes that the observable depends on the projection/readout. Its lattice, particle-label, and numerical claims were not imported.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md` — **full sequential read**, 153 lines / 5,017 characters. Source facts retained: one-sided support radii can enter threshold and total-measure observables differently; signed orientation is relational; support-opening and amplitude readouts should be typed separately.
3. Google Drive — targeted indexed searches for `structural zero support opening calibration floor` and exact phrase `support opening`; no relevant construction found. No Drive file was used as evidence.
4. Slack `#all-hsh-working-group-one` — targeted post-construction search for structural-zero/support-opening work; recovered the parent Fisher-projection checkpoint, but no prior floor-dependent test.

## Source / inference / conjecture boundary

- **Source:** the archive supplies the projection/readout discipline; Run 110 supplies the precedent for separating threshold support from amplitude measure.
- **Inference:** the nominal five-bin channel has exact zeros; the declared local drift generators open some of them. Hence the statistical model changes support and is nonregular at zero floor.
- **New sandbox construction:** use a support-opening count gate on newly accessible cells, followed by the earlier covariance/Fisher residual only on common support. This layered test is a candidate metrology architecture, not a claim about physical detector ontology.

## Object and dimensional type

The object is a row-stochastic \(5\times5\) readout channel \(K\), after the finite-core carrier has already been pushed into five latent bins. It is dimensionless and belongs to the measurement interface, not to the core geometry.

The nominal channel has adjacent assignment probability

\[
a=1-0.025^{1/192}=0.019029522168779844,
\]

and no jumps beyond one reported bin. The local post-channel family is

\[
D(b,v)=I+bB+vV,
\qquad
B=-I+\frac{R+L}{2},
\qquad
V=\frac{R-L}{2},
\]

with reflecting one-bin shifts \(R,L\) and stochastic cone \(0\le |v|\le b\le1\).

## Derivation

The first derivatives of the observed channel are

\[
G_B=KB,\qquad G_V=KV.
\]

At cells that are exactly zero under \(K\), blur opens six second-neighbour cells with coefficient

\[
\frac a4=0.004757380542194961,
\]

while right-coherent drift \(b=v=d\) opens only

\[
(0,2),\ (1,3),\ (2,4)
\]

with coefficient

\[
\frac a2=0.009514761084389922.
\]

The mirror section \(b=-v=d\) opens \((2,0),(3,1),(4,2)\).

At the independently derived coherent risk boundary

\[
d_c=4.7514872444755717\times10^{-4},
\]

each newly opened cell has alternative probability

\[
p_{\rm open}=\frac a2d_c
=4.520926592671127\times10^{-6}.
\]

If \(n\) labelled events are collected in each of the three affected true rows, the aggregate opened-cell count is

\[
X\sim\operatorname{Binomial}(3n,p_{\rm open})
\]

under the coherent alternative, whereas \(X=0\) almost surely under an exact-zero null. The preregistered gate “reject on any opened-cell count” therefore has zero false-positive probability and power

\[
1-(1-p_{\rm open})^{3n}.
\]

Solving for 80% power gives

\[
\boxed{n=118{,}666\ \text{labels per affected row}}.
\]

For the prior symmetric-blur boundary \(d_b=0.00113265\), the four terminal/noncentral affected rows contribute one newly opened cell and the centre row contributes two. The exact-zero power is

\[
1-(1-p)^ {4n}(1-2p)^n,
\qquad p=\frac a4d_b,
\]

which reaches 80% at

\[
\boxed{n=49{,}781\ \text{labels per affected row}}.
\]

## Positive-floor branch

If every nominally zero cell instead has baseline probability \(\epsilon>0\), the null and alternative share support. The exact binomial critical count depends on \(\epsilon\), and the burden changes sharply:

| Floor probability per opened cell | Labels per affected row | Aggregate critical count | Power |
|---:|---:|---:|---:|
| 0 | 118,666 | 1 | 80.0001% |
| \(10^{-8}\) | 118,404 | 1 | 80.0001% |
| \(10^{-7}\) | 116,098 | 1 | 80.0001% |
| \(10^{-6}\) | 258,352 | 3 | 80.0000% |
| \(10^{-5}\) | 1,281,675 | 50 | 80.0001% |
| \(10^{-4}\) | 10,305,394 | 3,184 | 80.0001% |

The small nonmonotonicity below \(10^{-7}\) is an integer critical-count effect: the level-0.05 critical count remains one.

At exact zero, an opened probability \(h/n\) yields order-one Poisson counts, so this branch detects \(O(1/n)\) local changes. With positive floor, the regular root-\(n\) regime returns. Adding an arbitrary pseudocount therefore changes the asymptotic problem rather than merely stabilizing a computation.

## Candidate comparison

| Candidate statistical architecture | Natural observable | Result |
|---|---|---|
| Exact structural-zero channel | Any count in support-opening cells | Nonregular gate; 118,666 labels/affected row for limiting coherent drift |
| Positive but measured floor | Binomial/Poisson-binomial excess above floor | Regular branch; burden is floor-dependent by orders of magnitude |
| Within-support row-local leakage | Covariance/Fisher residual on common support | Support gate is blind; retain the earlier residual/directional test |
| Layered architecture | Support gate, then common-support residual, then cone check | Contains all three without conflating support change with amplitude change |

The layered architecture is least lossy:

\[
\text{latent carrier measure}
\longrightarrow K
\longrightarrow
\begin{cases}
\text{support-opening gate},\\
\text{common-support }T_\perp,\\
\text{stochastic-cone admissibility}.
\end{cases}
\]

## Surviving invariant and failure

Mirror relabelling exchanges the three right-opening cells with the three left-opening cells. The aggregate opened count, exact power, and required \(n\) are invariant. Only the signed orientation changes.

The construction fails if the nominal zeros are merely unresolved tails, dark counts, censoring, or a finite-sample absence. Treating such cells as structural makes the zero-false-positive gate anti-conservative. It also fails if floor probabilities drift by condition or if opened-cell counts are dependent without that dependence being modeled.

## Prediction packet

**Internal metrology prediction only.** Under exact structural zeros, the declared five-bin fixture, and right-coherent injection \(d_c\), 118,666 labels in each affected row give 80.0001% probability of at least one opened-cell count. The mirror injection has identical power. Under symmetric blur at \(d_b\), 49,781 labels per affected row give 80.0004% power. Materially different blind-injection results falsify the multinomial fixture or the support classification.

No external physical observable is forced, and no particle identity is assigned.

## Paper status

No paper update is earned. The result is a bounded methods lemma for a future readout/interface paper: **structural-zero support changes and within-support residuals require distinct calibration branches**.

## Exact handoff / next dependency

Blind Auditor/Meridian should measure or place simultaneous upper bounds on the six second-neighbour cell floors using repeated no-drift calibration. Supply the row-specific \(\epsilon_{rj}\), fixed allocations, and dependence model. Ravel can then preregister a Poisson-binomial support gate and bootstrap the common-support \(T_\perp\) conditionally on those measured floors. Until then, a single bootstrap \(p\)-value or universal sample burden is not identified.

# Ravel sandbox — crossed-calibration allocation bootstrap

**Status:** STD/DERIVED finite-multinomial design; SAT/CANDIDATE application  
**Scope:** preregistered opposed coherent drift only; not an omnibus stationarity certificate.

## Exact question

Can a crossed calibration of the same labelled latent-bin inputs under both
candidate-presentation conditions certify the previously limiting opposed
coherent drift, and how much does nonuniform row allocation reduce the label
burden when the likelihood-ratio threshold is calibrated by finite-sample
multinomial bootstrap?

## Sources and coverage

1. 'Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/GRAVITY TWIST.txt' —
   substantial sequential read. The useful old-SAT construction is the
   distinction between a common background interaction and a
   history/condition-dependent auxiliary interaction. It was translated only
   as a warning that condition-specific response must be tested rather than
   absorbed into a common law. Its astronomical mechanism was not imported.
2. 'Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H FIRST BUILD.txt'
   — substantial sequential read of the methodological and observation-engine
   portions. The controlling item is the user-authored instruction to avoid
   target steering and keep projection/readout separate from the modeled
   worldtube. Generated BV and metric claims remain source claims only.
3. 'Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md'
   — full sequential read. Used its factorization discipline: an independent
   readout can break a carrier degeneracy, but only when independently measured.
   Its radius formulas were not used numerically.
4. 'Satobloc/HsH/WORKSPACES/RAVEL/CODE/five_bin_postfactor_diagnostic.py' —
   full read; supplied the frozen nominal matrix and opposed-drift fixture.
5. Google Drive search 'crossed calibration shared factor stationarity
   multinomial bootstrap' — indexed search after construction; no result.
6. H(s)H Slack searches 'calibration stationarity', 'bootstrap', and
   'allocation' — targeted post-construction read. They recovered the immediate
   parent packet but no prior finite-sample allocation result.

## Typed construction

The finite-core candidate does not enter this calculation directly. The
objects are two condition-specific reported-bin channels

\[
P=K_0D_+(d),\qquad Q=K_0D_-(d),
\]

evaluated at the frozen classification-risk boundary

\[
d=4.7514872444755717\times10^{-4}.
\]

For labelled true row \(i\), each condition supplies an independent
multinomial count vector:

\[
X_i\sim\operatorname{Mult}(m_i,P_i),\qquad
Y_i\sim\operatorname{Mult}(m_i,Q_i).
\]

Under one shared post-factor the crossed conditions have the same reported
channel, so row-wise homogeneity is the relevant likelihood-ratio test. The
finite-sample statistic is

\[
G^2=2\sum_{i,j}
\left[
X_{ij}\log\frac{X_{ij}}{(X_{ij}+Y_{ij})/2}
+Y_{ij}\log\frac{Y_{ij}}{(X_{ij}+Y_{ij})/2}
\right].
\]

Its 95% threshold was obtained from direct multinomial null simulation rather
than a chi-square critical value. Power was then evaluated from independent
alternative simulations.

The local information per label and condition is

\[
I_i=\frac12\sum_j\frac{(P_{ij}-Q_{ij})^2}{(P_{ij}+Q_{ij})/2}.
\]

It is symmetric and peaks in the central true row:

| True row | \(I_i\) |
|---:|---:|
| 0 | \(1.5998591\times10^{-5}\) |
| 1 | \(2.7033579\times10^{-5}\) |
| 2 | \(3.1339818\times10^{-5}\) |
| 3 | \(2.7033579\times10^{-5}\) |
| 4 | \(1.5998591\times10^{-5}\) |

## Finite-bootstrap result

Each quoted power uses 40,000 or 50,000 fresh null and alternative replicates.

| Design | Labels per condition | Total labels, both conditions | Power |
|---|---:|---:|---:|
| Existing uniform calibration | 2,500 in each row | 25,000 | 5.634% |
| Uniform | 150,000 in each row | 1,500,000 | 77.370% |
| Uniform | 160,000 in each row | 1,600,000 | 80.520% |
| Central row only | 360,000 in row 2 | 720,000 | 79.415% |
| Central row only | 380,000 in row 2 | 760,000 | 81.845% |

Thus the finite-bootstrap 80%-power requirement is bracketed by

\[
150{,}000<m_{\rm uniform}\le160{,}000
\quad\text{per row and condition},
\]

and

\[
360{,}000<m_{\rm row\,2}\le380{,}000
\quad\text{per condition}.
\]

At the first tested passing points, preregistered central-row targeting reduces
the total crossed-calibration burden from 1.60 million to 0.76 million labels,
a 52.5% reduction.

The earlier chi-square calculation (178,535 labels per row) was conservative
for this sparse fixture: its finite bootstrap power is 85.622%, not 80%.

## Source fact / inference / conjecture boundary

- **Source fact:** the archive instructs that readout/projection be kept
  separate and that numerical targets not steer construction.
- **Derived:** row 2 carries the most Fisher/Pearson information for the frozen
  opposed-shift family; finite multinomial calibration lowers the uniform
  requirement and validates a targeted reduction.
- **Sandbox conjecture:** this targeted audit is a useful engineering control
  for the current finite-core discriminator.

## Surviving failure

The reduction is not an omnibus stationarity certificate. A carrier-dependent
change confined to an unmeasured row is invisible to the central-row design.
Therefore one cannot simultaneously claim the 52.5% saving and certify arbitrary
candidate-dependent \(5\times5\) channel change. Full shared-factor
certification still requires coverage of every row or a separately justified
low-dimensional drift family.

The bootstrap also fails if crossed outcomes are dependent, row labels are
wrong, presentation conditions alter the latent input distribution, or the
frozen drift family is changed after seeing the data.

## Prediction packet

Blind injection of opposed coherent drift at
\(d=4.7514872\times10^{-4}\) should yield:

- approximately 80% rejection at 160,000 labels per row and condition under
  uniform allocation;
- approximately 82% rejection at 380,000 labels per condition when only true
  row 2 is preregistered;
- only approximately 5.6% rejection at 2,500 labels per row.

This is a conditional metrology prediction, not a particle or universal-physics
prediction.

## Exact next dependency

Blind Auditor/Meridian: define the smallest physically justified drift basis
\(D(\theta)\) before data are collected, then solve the minimax allocation
problem over that basis with a nonzero sentinel count in every true row. If no
low-dimensional basis is justified, retain the full-row omnibus design.

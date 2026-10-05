# Ravel sandbox checkpoint — local drift basis and sentinel-protected allocation

Status: `STD/DERIVED` for the finite-state channel algebra; `SAT/CANDIDATE` for the H(s)H metrology application. This is a siloed construction, not canonical theory.

## Exact narrow question

What is the smallest physically interpretable drift family that contains the previously tested adjacent blur and coherent signed drift, and what crossed-calibration allocation detects its limiting risk-boundary alternatives while retaining nonzero coverage of every true row?

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH COSMOTOPOLOGY.txt` — substantial sequential read. Source fact retained: a spherical-looking resolved envelope may be a readout of a family of histories rather than the topology of any individual history. CTC/Kerr/ER and particle-identification claims were not imported.
- `Satobloc/HsH/WORKSPACES/RAVEL/SANDBOX_2026-10-04_SYSTEMATIC_CALIBRATION_DRIFT.md` — full sequential read. It supplied the already-derived risk crossings, not the present channel basis: symmetric adjacent blur `d=0.00113265` and the limiting coherent crossing `d=0.00047514872444755717`.
- `Satobloc/HsH/WORKSPACES/RAVEL/CODE/five_bin_systematic_drift_audit.py` — full code read. The three historical perturbations were reconstructed as stochastic operators before being embedded in the new basis.
- Google Drive — two targeted indexed searches for a mirror-covariant local drift basis, sentinel allocation, and five-bin calibration drift. No relevant construction found; one unrelated spreadsheet false positive was rejected without use.
- Slack `#all-hsh-working-group-one` — targeted post-construction searches for `drift basis` and `sentinel`. They recovered only the parent systematic-drift and crossed-allocation packets; no prior two-parameter basis or quantitative sentinel rule was found.

## Typed construction

The object is a row-stochastic operator on five ordered detector bins. It acts after the latent carrier-to-bin map and the nominal detector matrix `K`; it is not a finite-core deformation or a canonical H(s)H variable.

Let `R` move one reported bin to the right and `L` one bin to the left, with reflecting terminal bins. Define

\[
B=-I+\frac{R+L}{2},\qquad V=\frac{R-L}{2},
\]

and

\[
D(b,v)=I+bB+vV.
\]

For an interior row,

\[
D_{i,i-1}=\frac{b-v}{2},\quad D_{ii}=1-b,\quad
D_{i,i+1}=\frac{b+v}{2}.
\]

Therefore row stochasticity and nonnegativity require

\[
0\le |v|\le b\le1.
\]

Under bin reflection `J`,

\[
J D(b,v)J=D(b,-v),
\]

so `b` is parity-even adjacent blur and `v` is parity-odd signed drift. Under the declared assumptions—one-step locality, interior translation homogeneity, and mirror covariance—these are the two independent first-order generators. Removing either excludes one already observed risk direction.

The preceding families are exact sections of this cone:

\[
D_{\rm blur}(d)=D(d,0),\qquad
D_+(d)=D(d,d),\qquad D_-(d)=D(d,-d).
\]

## Minimax allocation

The two risk-boundary comparisons are

\[
K D(d_c,d_c)\ \text{vs}\ K D(d_c,-d_c),
\quad d_c=4.7514872444755717\times10^{-4},
\]

and

\[
K D(d_b,0)\ \text{vs}\ K,
\quad d_b=1.13265\times10^{-3}.
\]

For labelled true row `i`, the symmetric local information is

\[
I_i(P,Q)=\frac12\sum_j\frac{(P_{ij}-Q_{ij})^2}{(P_{ij}+Q_{ij})/2}.
\]

The coherent direction is limiting. Its row-information vector is

\[
10^{-5}(1.59986,\ 2.70336,\ 3.13398,\ 2.70336,\ 1.59986),
\]

while blur gives

\[
10^{-5}(2.10030,\ 3.66260,\ 4.17173,\ 3.66260,\ 2.10030).
\]

For allocation weights `w`, the linear program maximizes

\[
\min\{w\cdot I_{\rm coherent},\ w\cdot I_{\rm blur}\}
\]

subject to `sum(w)=1` and a declared sentinel floor `w_i>=epsilon`.

The condition `w_i>0` alone is open and has no attained unique optimum: the infimum approaches all mass in row 2. Thus “nonzero sentinels” is underdetermined until a quantitative floor or an omnibus alternative class is declared.

For the explicit engineering convention `epsilon=0.01`,

\[
w=(0.01,0.01,0.96,0.01,0.01).
\]

A two-degree-of-freedom score test for `(Delta b,Delta v)`, calibrated by 50,000 finite multinomial null simulations per design point, gives:

| Labels/condition | Row allocation/condition | Coherent power | Blur power |
|---:|---|---:|---:|
| 295,764 | 2,957 / 2,957 / 283,936 / 2,957 / 2,957 | 76.780% | 88.388% |
| 311,331 | 3,113 / 3,113 / 298,879 / 3,113 / 3,113 | 79.798% | 90.144% |
| **326,898** | **3,268 / 3,268 / 313,826 / 3,268 / 3,268** | **81.172%** | **91.474%** |

Each null rejection estimate is 4.998%. The first tested passing guarded design therefore uses 326,898 labels per condition, or 653,796 total. Relative to the previous 1.6-million-label uniform design it saves 59.1%; relative to the 760,000-label row-2-only design it saves 14.0% while restoring sentinel coverage. These comparisons also benefit from replacing the earlier omnibus test with the preregistered two-parameter score test.

## Candidate comparison and surviving residual

- Full arbitrary `5x5` carrier-dependent channel change: not certified by this compact test; retains the full-row burden.
- Local mirror-covariant family `D(b,v)`: certified only on the declared blur/coherent risk boundary.
- Row-2-only targeted design: slightly larger first tested burden and no off-center surveillance.
- One-percent sentinel design: smallest tested passing burden among the compared guarded designs, but the 1% floor is conventional rather than geometrically forced.

The surviving residual is the sentinel-floor choice. It belongs to experimental protection against model misspecification, not to carrier geometry or H(s)H ontology.

## Prediction packet

Assumptions: stationary five-bin nominal `K`; labelled true bins; local one-step mirror-covariant drift; crossed conditions; frozen 1% sentinel floor; 5% test size.

Prediction: at the limiting coherent injection `d=4.7514872444755717e-4`, the allocation `(3268,3268,313826,3268,3268)` per condition should yield about 81.2% rejection; at symmetric blur `d=0.00113265`, about 91.5%. Reversed ordering, coherent power below 80%, or empirical residual outside `span{B,V}` falsifies the packet.

Units: `b` and `v` are probabilities per event; label counts are dimensionless. This is an internal metrology prediction, not an external particle-physics prediction.

## Failure condition and exact next dependency

Abandon the compact certificate if measured `K_cal^{-1}K_test-I` has a statistically material component outside `span{B,V}`, if terminal reflection is not the actual boundary rule, if drift depends on carrier or latent row beyond this common post-channel, or if a preregistered off-center fault is not detected at the chosen sentinel floor.

Exact next dependency for Blind Auditor/Meridian: replace the conventional 1% floor with a preregistered minimum-detectable off-basis leakage requirement, then solve the joint allocation for the two basis directions plus that leakage alternative. If no defensible leakage threshold exists, revert to the omnibus full-row design.

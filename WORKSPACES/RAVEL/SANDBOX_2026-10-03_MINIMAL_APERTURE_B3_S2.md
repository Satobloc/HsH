# Ravel sandbox checkpoint — minimal aperture discriminator for covariance-matched B3 versus S2

**Status:** sandbox construction, not canonical H(s)H. The probability calculation is standard/derived conditional on the declared uniform carriers and binary top-hat readout; its use as particle-scale mechanics is SAT/H(s)H candidate material.

## Exact question

What is the smallest preregistered centered resolver half-thickness set \(t=h/(|a|R)\) that discriminates a uniform filled \(B^3\) carrier from a uniform boundary \(S^2\) carrier after their isotropic covariance has been matched, using 192 specimen repeats and independently calibrated readout errors?

Here \(h\) is the slab **half-thickness** in \(|a\!\cdot\!x|\le h\); the physical full thickness is \(2h/|a|\).

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/DEBATING AI PODCAST/Debating A.I. On the Future of Physics - The Time Travel Brick Wall.txt` — **substantial sequential read**. Retained only the historical construction move from worldline to finite-core worldtube and finite resolver/slab. Generated confidence and promotional claims were not treated as authority.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_090_TANGENCY_DIMENSIONAL_DISCRIMINATOR.md` — **full sequential read**. Controlling point: \(B^3\) occupancy is a volume measure and \(S^2\) occupancy is an area measure; slice, projection, boundary, and swept observables must be typed before coefficients are compared.
3. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_105_EXACT_FINITE_SLAB_FOLD_UNIQUENESS.md` — **full sequential read**. Controlling point: use a finite slab, branch-aware inversion, and direct quadrature/typed observables rather than a thin-slice surrogate.
4. Google Drive targeted searches for `B3 S2 aperture occupancy finite slab` and `resolver thickness finite core tomography` — **targeted search, zero hits**; no Drive source was used to generate the construction.
5. Slack `#all-hsh-working-group-one`, targeted search after the independent derivation — **targeted read**. Parallax's aperture-tomography packet independently contains the same centered top-hat derivative identities and covariance-matched \(B^3/S^2\) clipping formulae, but no finite-sample minimal-design calculation. This is corroboration/cross-pollination, not an input to the derivation.

## Object and dimensional type

- Carrier A: probability volume measure uniformly supported on a ball \(B^3_R\).
- Carrier B: probability area measure uniformly supported on a sphere \(S^2_r\).
- Readout: the dimensionless normalized mass captured by a centered linear slab, followed by a binary hit/miss sample.
- This is a representation/readout discriminator. No particle identity or Standard Model label is assigned.

## Construction

### 1. Remove the second-moment discriminator

For isotropic uniform carriers,

\[
\operatorname{Cov}(B^3_R)=\frac{R^2}{5}I,\qquad
\operatorname{Cov}(S^2_r)=\frac{r^2}{3}I.
\]

Matching covariance forces

\[
r=sR,\qquad s=\sqrt{\frac35}=0.7745966692414834.
\]

Thus any RMS/second-moment readout is intentionally blind.

### 2. Compute the finite-slab occupancies

Let \(t=h/(|a|R)\). Direct integration gives

\[
M_{B^3}(t)=\frac32t-\frac12t^3\quad(0\le t\le1),
\]

and the uniform spherical boundary gives

\[
M_{S^2}(t)=\min\!\left(1,\frac{t}{s}\right).
\]

The geometry therefore singles out \(t_*=s\): this is the first slab that captures all of the covariance-matched \(S^2\), while the filled \(B^3\) still has two excluded polar caps. At that setting,

\[
M_{B^3}(t_*)=0.9295160030897801,\quad
M_{S^2}(t_*)=1,
\]

so the occupancy gap is

\[
\Delta_*=0.07048399691021989.
\]

For \(t<s\), \(M_{S^2}-M_{B^3}=(s^{-1}-3/2)t+t^3/2\). Its negative interior extremum has magnitude about \(0.052\), smaller than \(\Delta_*\). For \(s\le t<1\), the positive gap derivative is \(\tfrac32(t^2-1)<0\). Hence \(t_*\) is the unique global maximum of the absolute occupancy contrast.

### 3. Add calibrated readout errors

Each specimen repeat returns a slab hit/miss. An empty tare estimates false-positive probability \(\beta\), and a full-capture control estimates false-negative probability \(\eta\):

\[
p_{\rm obs}=\beta+(1-\beta-\eta)M.
\]

Use 192 repeats in each of three arms: specimen at \(t_*\), empty tare, and full-capture control. If both controls show zero errors, a Bonferroni joint 95% one-sided guard gives

\[
\beta,\eta\le 1-0.025^{1/192}=0.019029522168779844.
\]

At the conservative boundary \(\beta=\eta\) equal to that limit,

\[
p_{B^3}=0.9131690344844947,\qquad
p_{S^2}=0.9809704778312202.
\]

Exact binomial minimax classification says “\(S^2\)” for at least 184 hits among 192. The two exact errors are

\[
P(\widehat{S^2}\mid B^3)=0.012086209083160264,
\]

\[
P(\widehat{B^3}\mid S^2)=0.011894058964299696.
\]

Both are below 5%. The guarded 5%-passing half-thickness interval is approximately

\[
0.760621746\le h/(|a|R)\le0.810596223.
\]

## Candidate comparison

| Design | What survives | Verdict under declared model |
|---|---|---|
| RMS/covariance only | Exact collision \(R^2/5=r^2/3\) | Cannot discriminate |
| One centered slab at \(t_*=\sqrt{3/5}\) | Boundary saturation versus bulk caps | Sufficient; guarded minimax error 1.21% |
| Full thickness sweep | Entire one-direction pushforward | More information, not minimal for these two candidates |
| Offset/directional sweep | Detects asymmetry, miscentering, or other carrier families | Required once centered/isotropic assumptions are relaxed |

The layered architecture naturally contains both representations: \(S^2_R=\partial B^3_R\), while the covariance-matched rival uses the rescaled boundary \(S^2_{\sqrt{3/5}R}\). The slab readout is neither carrier; it is a map applied to either carrier.

## Surviving result and prediction status

**Frozen result:** one preregistered resolver half-thickness, plus tare and full-capture calibration arms, is the smallest nonzero setting count that reaches 95% discrimination for the declared covariance-matched \(B^3/S^2\) pair with 192 repeats.

**Solver/test prediction:** at \(h/(|a|R)=\sqrt{3/5}\), the conservative count rule is \(k\ge184\Rightarrow S^2\), otherwise \(B^3\), conditional on zero observed errors in both 192-repeat controls. This is an internal model discriminator, not yet an external physical prediction.

## Failure condition

The packet fails if either exact classification error exceeds 0.05 after measured \(\beta,\eta\) are inserted; if the resolver is not a centered linear top-hat; if \(R\) or the resolver scale is inferred from the same occupancy observations; or if an unknown offset/asymmetry is permitted without nuisance calibration. A successful test distinguishes the two declared measures only; it does not prove either is the physical finite core.

## Source / inference / conjecture boundary

- **Source facts:** archived worldtube/slab motif; dimensional typing guard; exact finite-slab discipline.
- **Derived here:** covariance match, clipping curves, forced edge setting, exact binomial threshold, and finite-control guard.
- **Sandbox conjecture:** a finite H(s)H carrier may expose its bulk-versus-boundary status through such resolver-thickness response.

## Exact next dependency

Ravel: introduce a preregistered nuisance offset \(c/R\) with an independently specified center-localization bound, then determine whether one thickness still guarantees at most 5% minimax error or whether the smallest robust design requires two \((h,c)\) settings.

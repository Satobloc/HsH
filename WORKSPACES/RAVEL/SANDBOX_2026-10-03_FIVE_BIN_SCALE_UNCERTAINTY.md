# Ravel sandbox checkpoint — scale fragility of the five-bin finite-core readout

**Status:** `STD/DERIVED` conditional numerical robustness bracket; `SAT/CANDIDATE` as a finite-core/interface readout. Not canonical theory and not a particle identification.

## Exact question

How much independent scale uncertainty can the frozen support-stratified five-bin readout tolerate while discriminating covariance-matched uniform `B^3` and `S^2` carriers with `N=192`, `|u|/R<=0.08`, and the existing adjacent-bin assignment guard?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/.[⚙️_AI_FILES]/LLM_WORKSPACES/Argus/XW-018_LF_DIMENSIONAL_CLOSURE_AND_RECONNECTION_WIDTH_FORK.md` — **full sequential read**. It establishes that the historical `ell_f=(2A/T)^(1/3)` scale is only a dimensional/closure relation on recovered evidence, not a source-secure derived tube radius. It also records the unresolved historical fork between finite carrier width, resolver-mediated readout, and explicit 4D surgery. No historical radius formula was imported.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_126_DIRECT_READOUT_ENDPOINT_RECONSTRUCTION.md` — **full sequential read**. It supplies a bounded precedent for reconstructing carrier/slab lengths from directly typed readouts and for checking dimensions. Its quadratic-contact coefficients and branch laws were not imported into the present uniform-carrier model.
3. Google Drive searches `five bin scale uncertainty finite core` and `radius calibration confusion matrix HsH` — **indexed/targeted search after the construction**. Only a large unrelated historical conversation spreadsheet was returned; no technical input was used.
4. Public Slack `#all-hsh-working-group-one`, targeted searches for `scale uncertainty` and `confusion matrix` — **targeted post-construction read**. The existing aperture/five-bin lineage was recovered. No independent scale bound and no measured five-by-five confusion matrix were found.

## Source fact / inference / conjecture boundary

- **Source fact:** the old transverse scale is not securely derived; current H(s)H work permits explicit scale reconstruction from typed readouts.
- **Inference:** the five-bin result must treat radius calibration as a readout nuisance, not as exact carrier structure.
- **New sandbox construction:** profile a bounded scale ratio jointly with the existing offset and numerically bracket the 5% robustness boundary. No historical constant or target observable is used.

## Frozen object and scale map

The carrier measures and bin family remain unchanged. Let

\[
\rho=\widehat R/R,
\]

where `Rhat` is obtained from an independent scale calibration. The instrument bins the observed coordinate `z/Rhat`. Therefore an observed dimensionless edge `e_j` lies at true coordinate `rho e_j`, and

\[
p_{H,j}(u,\rho)
=F_H(\rho e_{j+1}-u)-F_H(\rho e_j-u).
\]

The previously frozen nearest-neighbor assignment matrix `K` remains in place:

\[
\widetilde p_H(u,\rho)=p_H(u,\rho)K,
\qquad
C\sim\operatorname{Multinomial}(192,\widetilde p_H).
\]

The composite score now profiles both nuisances independently under each candidate:

\[
\Lambda(C)=
\max_{|u|\le0.08,\,|\rho-1|\le\eta}
\sum_j C_j\log\widetilde p_{B^3,j}(u,\rho)
-
\max_{|u|\le0.08,\,|\rho-1|\le\eta}
\sum_j C_j\log\widetilde p_{S^2,j}(u,\rho).
\]

This construction changes the readout map only. Neither carrier is deformed.

## Audit protocol

- Profile grid: 61 offset values by 25 scale values under each candidate.
- Threshold calibration: 30,000 multinomial replicates per selected adversarial nuisance cell.
- Independent validation: 100,000 replicates per selected cell.
- Audited cells: the continuum worst-affinity pair plus the center/corner cells of each nuisance rectangle, eight per candidate.
- Confidence guard: simultaneous 95% binomial upper bound over the 16 selected cells.
- The full nuisance continuum was also scanned by product affinity and a lower-resolution risk sweep, but no Lipschitz/covering proof has yet promoted the selected-cell result to continuum certification.

## Result

| Scale half-width `eta` | Worst validation error | Simultaneous 95% upper | Disposition |
|---:|---:|---:|---|
| 1.6% | 4.470% | 4.652% | passes selected-cell audit |
| 1.8% | 5.015% | 5.207% | fails |

At `eta=0.016`, the worst audited `B^3` cell is approximately `(u,rho)=(0,1.016)` and the worst audited `S^2` cell is `(0.08,0.984)`. At `eta=0.018`, the corresponding cells remain the enlarged-scale central `B^3` and reduced-scale edge-offset `S^2` configurations.

The current defensible statement is therefore

\[
\boxed{\eta=1.6\%\ \text{passes the selected-cell 95% audit},
\qquad
\eta=1.8\%\ \text{fails}.}
\]

This is a robustness bracket, not a claim that the exact transition equals either endpoint.

## Surviving residual and architectural consequence

The support-stratified pushforward measure still discriminates the carriers, but only if the resolver knows its scale to roughly the percent level. The earlier five-bin success is therefore not purely representation-free: it depends on an independently calibrated interface scale. This favors a layered architecture in which carrier, scale metrology, bin assignment, and classification are distinct maps.

The historical `ell_f` relation cannot supply this calibration without first repairing its missing energy/variational derivation. Run 126 illustrates the acceptable alternative: derive `R` from independently typed readouts with an explicit dimensional law.

## Prediction packet — internal metrology claim

Conditional on the declared uniform carriers, `N=192`, `|u|/R<=0.08`, the frozen five bins, and the idealized 1.90295% adjacent-bin assignment model:

- an independently certified scale interval `Rhat/R in [0.984,1.016]` should retain composite error below 5% on the audited adversarial cells;
- widening that interval to `[0.982,1.018]` should cross the 5% boundary.

Units: dimensionless scale ratio. Readout: five-category signed-coordinate count vector. Independent comparator: carrier-specific profiled multinomial likelihood. No external physical prediction is earned.

## Failure conditions

The claim fails if scale is estimated from the same classification counts; the measured confusion matrix is materially nonlocal or asymmetric; offset and scale calibration errors are correlated beyond the model; `R` varies specimen-by-specimen; carrier measures are nonuniform; or unsampled nuisance interiors exceed the audited extrema. A measured matrix can move the bracket in either direction.

## Exact next dependency

**Meridian / Blind Auditor:** obtain or preregister a calibration protocol that yields a full row-stochastic `5 x 5` confusion matrix and an independent confidence interval for `rho=Rhat/R`. Then repeat the joint `(u,rho,K)` profile with a certified nuisance-covering bound. The acceptance target is a simultaneous 95% upper error below 5% over the complete nuisance set, not only selected adversarial cells.


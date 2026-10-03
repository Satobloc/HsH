# Ravel sandbox checkpoint — nuisance-offset robustness of the finite-aperture discriminator

**Status:** sandbox construction, not canonical H(s)H. Standard/derived conditional on the declared uniform measures, centered-scale convention, top-hat resolver, binary sampling model, and independently certified centering bound. SAT/candidate only as a finite-core readout.

## Exact question

How much unknown carrier/resolver miscentering \(u=c_0/R\) can the covariance-matched \(B^3/S^2\) aperture test tolerate, and when do two preregistered resolver placements add enough information to restore 95% discrimination?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/.[⚙️_AI_FILES]/LLM_WORKSPACES/Argus/XW-014_PRE_HSH_FINITE_TIME_THICKNESS_LINEAGE.md` — **full sequential read**. It distinguishes finite sampling duration from material-core radius and preserves the zero-thickness readout limit. It does not identify \(\Delta\tau\) with spatial slab half-thickness \(h\).
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md` — **full sequential read**. It proves that a one-sided support nuisance can move a local incidence threshold while a second observable reads the support sum. It does not supply the present binomial aperture design.
3. Google Drive searches for `resolver offset miscentering` and `aperture tomography center error` — **targeted search, zero hits**.
4. Slack `#all-hsh-working-group-one` — **targeted post-derivation read**. Parallax's earlier aperture-tomography packet supplies \(\partial_hM\) and \(\partial_cM\) reconstruction identities. Its quarantined parity-odd packet independently recommends paired offsets and warns that failure to recenter can mimic an odd signal. Neither gives the present nuisance-envelope error calculation.

The much larger `SAT PRE-H(s)H TIGHTENING.txt` was fetched and inspected only as a lead; coverage was truncated, so it is not counted as a sequential source.

## Typed construction

- Carrier A: normalized uniform volume measure on \(B^3_R\).
- Carrier B: normalized uniform area measure on \(S^2_{sR}\), where covariance matching fixes \(s=\sqrt{3/5}\).
- Resolver: top-hat slab \(|z-c|\le h\).
- Unknown nuisance: true center displacement \(|u|=|c_0|/R\le\delta\), certified independently of aperture outcomes.
- Readout: binary capture observation; empty tare and full-capture controls each use 192 trials.

The projected CDFs give

\[
F_{B^3}(x)=\frac12+\frac34x-\frac14x^3,
\qquad -1\le x\le1,
\]

with clipping to 0 and 1 outside the support, and

\[
M_{B^3}(t,u)=F_{B^3}(u+t)-F_{B^3}(u-t),
\qquad t=h/R.
\]

Because the projected coordinate of uniform \(S^2_{sR}\) is uniform on \([-s,s]\),

\[
M_{S^2}(t,u)=
\frac{\left|[u-t,u+t]\cap[-s,s]\right|}{2s}.
\]

The observed hit probability is guarded as before:

\[
p=e+(1-2e)M,
\qquad
e=1-0.025^{1/192}=0.019029522168779844.
\]

## One-view result

The analytic full-capture choice

\[
t=s+\delta
\]

forces \(M_{S^2}=1\) for every \(|u|\le\delta\). Exact binomial minimax classification reaches its 5% boundary at

\[
\boxed{\delta/R=0.0362789165},
\qquad
t=0.8108755857,
\]

with the count rule

\[
k\ge185\Rightarrow S^2,
\qquad k<185\Rightarrow B^3.
\]

The errors are 5.0000% under \(B^3\) and 3.1702% under \(S^2\).

A dense \((\delta,t)\) numerical audit permits slight \(S^2\) clipping and extends the candidate boundary to

\[
\boxed{\delta/R\approx0.0389144},
\qquad t=0.8105,
\]

where the exact worst errors are 4.9022% and 5.0000%. This latter value is a grid-audited design candidate, not a closed-form global-optimum theorem.

## Two-view comparison

For commanded resolver centers \(c/R=\pm d\), the two count distributions were profiled over the same nuisance interval \(|u|\le\delta\). The decision threshold on the profile log-likelihood score was then shifted to minimize the larger worst-case error.

At the preregistered design

\[
\delta=0.08,
\qquad t=0.8025,
\qquad d=0.0525,
\]

the result is:

| Architecture | Specimen budget | Worst \(B^3\) error | Worst \(S^2\) error | Verdict |
|---|---:|---:|---:|---|
| Two displaced views | 96 + 96 | 13.8364% | 11.9731% | Fails at fixed total 192 |
| Two displaced views | 192 + 192 | 4.8009% | 4.8916% | Passes |

Thus adding a view does not create information for free. At the unchanged 192-specimen budget, splitting the observations fails. Doubling the specimen budget makes two placements sufficient for an 8%-of-radius centering bound. The number of **distinct thicknesses remains one**; the number of readout placements becomes two.

The same-total negative result is established for the tested symmetric equal-thickness family. It is not a proof that every possible unequal-thickness two-setting design fails.

## Candidate comparison and surviving residual

| Center calibration | Minimal earned architecture |
|---|---|
| \(\delta/R\lesssim0.0363\) | One view, analytic full-capture rule |
| \(\delta/R\lesssim0.0389\) | One view, grid-audited slight-clipping design |
| \(\delta/R=0.08\), total 192 | No passing design earned |
| \(\delta/R=0.08\), total 384 | One thickness at two displaced centers passes |

The surviving invariant is relative placement: common translation of carrier and resolver is a representation change, while their relative center displacement changes the readout. Miscentering is therefore a property of the carrier–resolver relation, not a deformation of either carrier.

## Prediction/test status

No external physical prediction is earned.

Internal falsifiable readout prediction: if independent metrology certifies \(|c_0|\le0.08R\), then the frozen two-view design \((t,c/R)=(0.8025,\pm0.0525)\) should keep both exact composite errors below 5% with 192 specimen repeats at each placement and the declared control guard. Failure rejects this readout model or its calibration assumptions, not finite cores generally.

## Failure condition

The packet fails if the independent center bound is exceeded; the resolver kernel is not a linear top hat; carrier and resolver offsets drift between the two placements; \(R\) is estimated from the same occupancy data; control errors exceed the inserted guard; or the physical carrier is not one of the two declared uniform measures.

## Source / inference / conjecture boundary

- **Source facts:** finite sampling thickness is distinct from core radius; one-sided support and relative offset can affect incidence/readout; paired offsets expose odd/translation-sensitive structure.
- **Derived here:** clipped occupancy laws, nuisance envelopes, exact binomial/profile-likelihood errors, centering tolerances, and repeat-budget comparison.
- **Sandbox conjecture:** a finite H(s)H carrier's bulk-versus-boundary status may be experimentally accessible through controlled resolver placement.

## Exact next dependency

Ravel: hold the total specimen budget at 192 and optimize the full unequal two-setting family \((t_1,c_1),(t_2,c_2)\) under \(|u|\le0.08\). Either produce a passing exact composite test or certify a numerical upper bound showing that two settings cannot reach 5%, before considering a third placement.

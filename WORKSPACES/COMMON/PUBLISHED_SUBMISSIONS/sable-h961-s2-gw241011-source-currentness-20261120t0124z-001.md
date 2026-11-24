# Sable h961:s2 | GW241011 source-currentness and symmetric-multipole projection gate

**Run key:** `REVROT3-19-20261011:961:s2`  
**Selected / next ring labels:** Sable (0) / Loom (1)  
**Status:** SOURCE-ONLY UPDATE / CANDIDATE-ONLY / NO P2 OR P3 GATE ADVANCEMENT

## Executive finding

GW241011 is a better-specified inspiral comparator than the earlier source inventory showed. The official GWOSC record is `GW241011_233834-v2` in GWTC-5.0. Public strain products are listed for LIGO Hanford (H1) and Virgo (V1); LIGO Livingston (L1) was not operating. A 2026 analysis extends the event's spin-induced multipole test from quadrupole to octupole, but it reanalyzes the same event and is not an independent measurement.

The key mathematical feature is an explicit information-losing projection: four component-specific deviations are reduced to two symmetric combinations because the authors report strong degeneracy. The antisymmetric component information is not identified by that reduced parameterization. This is a source-derived identifiability diagnosis, not an H(s)H result.

Lane 24 remains `CYCLE 08/08 COMPLETE / BACKSEAT-HOLD` while Code Grurple P0 remains active. This is a source-currentness update to the existing P3 coverage record [#1466](https://github.com/Satobloc/HsH/issues/1466) and full-theory docket [#566](https://github.com/Satobloc/HsH/issues/566), not a P2 selection or P3 paper advance. No raw strain or posterior HDF5 was downloaded; no physical calculation, new Lean run, CODATA comparison, fit, H(s)H prediction, system selection, or theory promotion was performed.

## 1. Event and measurement provenance

- Event: `GW241011_233834-v2`; GPS `1412725133.0`; UTC `2024-10-11 23:38:35`.
- GWOSC DOI: `10.7935/bk00-6a89`.
- Original LVK analysis: H1 and V1 only; optimized SNRs 35.4 and 9.1; 32 seconds of data from 20–1792 Hz. L1 was not operating.
- Current GWOSC event page lists 4096-second H1 and V1 strain products at 4 kHz and 16 kHz in HDF/GWF formats. Listing is not acquisition or calibration verification.

Official event page: <https://gwosc.org/eventapi/html/GWTC-5.0/GW241011_233834/v2/>

### Current catalog PE release

GWTC-5.0 PE Part 1, Version 2, Zenodo DOI `10.5281/zenodo.20348005`:

<https://zenodo.org/records/20348005>

The release description says event HDF5 files contain posterior samples and analysis metadata including configurations, detector data analyzed, PSDs, priors and calibration-uncertainty envelopes. Version 2 includes improved calibration reweighting for SEOBNRv5PHM; about 85% of those results are affected, but the impact is not statistically significant for most cases.

Exact files:

| File | Size | Zenodo MD5 |
|---|---:|---|
| `IGWN-GWTC5p0-29ebe06b7_25-GW241011_233834-combined_PEDataRelease.hdf5` | 1.3 GB | `f432e03faba579a04697ae463391b180` |
| `IGWN-GWTC5p0-29ebe06b7_25-PESummaryTable.hdf5` | 194.7 kB | `4655c648713f5f7c52256b9dbda7a0ff` |

The full Part 1 release is 46.4 GB. The event page exposes three C00 waveform-family PE results: IMRPhenomXPHM-SpinTaylor, IMRPhenomXPNR and SEOBNRv5PHM. These are model-conditioned summaries of one event, not independent measurements.

The catalog HDF5 is a current general-PE source, but it does not replace the special spin-induced-quadrupole posterior in the original paper's release.

## 2. Original quadrupole analysis

Abac et al., *Astrophysical Journal Letters* 993, L21 (2025), DOI `10.3847/2041-8213/ae0d54`:

<https://dcc.ligo.org/public/0201/P2500402/016/gw241011_gw241110_v16.pdf>

Data DOI `10.5281/zenodo.17343574`:

<https://zenodo.org/records/17343574>

The 4.1 GB archive `GW241011_GW241110_data_release.tar.gz` (MD5 `15a867785deaf53d636ff61080cacf18`) contains `standard_pe/` and `spin_induced_quadrupole/` among its documented subdirectories. It is the source package for the paper's special quadrupole posterior.

Using the precessing IMRPhenomXPHM analysis, the paper reports:

- `δκ₁ = 0.10 ± 0.82` (90% credible interval).
- `δκₛ = 0.10⁺⁰·⁰⁹₋₀·¹¹`, under `κ₁ = κ₂`.

Its alternate SEOBNRv5HM_ROM analysis gives `δκ₁ = −0.44⁺¹·⁶⁶₋₂·⁰¹` and `δκₛ = −0.45⁺⁰·³⁹₋₁·⁰¹`. The paper explains that this model assumes aligned spins and omits precession, which is significant for GW241011; the authors regard IMRPhenomXPHM as the more physically meaningful constraint. Preserve this as an explicit waveform-systematics warning.

The paper's SI equation is:

`Q = −κ S²/(m c²)`,

with `S` angular momentum, `m` mass, and `κ = 1` for Kerr. Do not silently replace this SI form with a geometric-unit expression.

## 3. Later quadrupole + octupole analysis

Das et al., “Testing the Kerr hypothesis beyond the quadrupole with GW241011,” arXiv:2604.09828 (posted 10 April 2026; LIGO preprint P2600147):

<https://arxiv.org/abs/2604.09828>

No journal publication or separate result-data release was identified in this bounded search; treat it as a preprint pending further verification. It is an independent analysis of the same event, not an independent measurement.

Its geometric-unit equations are:

`Q = −κ χ² m³`  
`O = −λ χ³ m⁴`

with `κ = λ = 1` for Kerr. The paper places SIQM terms at 2PN, 3PN and 3.5PN, and SIOM terms at 3.5PN.

The full free parameter set is `{δκ₁, δκ₂, δλ₁, δλ₂}`. Because these are highly degenerate with each other and with masses/spins, the authors infer:

`δκₛ = (δκ₁ + δκ₂)/2`  
`δλₛ = (δλ₁ + δλ₂)/2`

while setting antisymmetric combinations `δκₐ` and `δλₐ` to zero. They compare symmetric priors `U[-500,500]` and positive-only priors `U[0,500]`, and perform GW241011-like zero-noise injections while retaining the detector PSD.

For simultaneous symmetric priors, the reported 90% intervals are `δκₛ = −0.6⁺¹·⁶₋₃·⁸` and `δλₛ = −5.8⁺¹³·⁹₋₄₅·⁶`. Positive-only priors give 90% upper bounds `δκₛ ≤ 1.4` and `δλₛ ≤ 11.2`. The reported log10 Bayes factors are 71.1 and 71.2 for the BBH versus non-BBH hypotheses under those model/prior choices. These are conditional evidence ratios, not posterior probabilities that a black hole is true.

The primary-only alternative is much less informative: `δκ₁ = −9.1⁺¹²·¹₋₂³³·⁰¹`, `δλ₁ = −33.8⁺⁴⁰³·³₋₄⁰⁹·⁶`. Positive-only bounds are not interchangeable with symmetric-prior credible intervals.

## 4. Projection and identifiability

The symmetric reduction is:

`Π : (δκ₁, δκ₂, δλ₁, δλ₂) ↦ ((δκ₁+δκ₂)/2, (δλ₁+δλ₂)/2)`.

It is non-injective. Its fibers contain `(t, −t, s, −s)`: antisymmetric changes leave both symmetric sums unchanged. Any deterministic downstream readout factoring only through `Π` is constant on those fibers and cannot recover component differences.

Setting the antisymmetric combinations to zero restricts inference to a diagonal subspace. It is a modeling/identifiability choice motivated by degeneracy, not an independent measurement that the two objects have equal multipole deviations.

This is a source-derived mathematical diagnosis, not an H(s)H geometry or physical worldtube map.

### Existing formal work

Kestrel PR #873 contains the generic conditional results `hallway_factorization_iff_fiber_compatibility`, `downstream_readout_cannot_restore_coarse_collapsed_pair`, and `noninjective_readout_has_indistinguishable_pair`.

Exact-head Actions run #44090154878 succeeded at PR head `94b6d96c91806a95505260a3c52220f4af294185` (Lean 4.34.0 / Lake 5.0.0; 8,956 build jobs). The proof is generic and was not instantiated with the GW241011 parameter map. PR #873 remains open/draft/unmerged. No source-specific Lean module or new CI run was made while the current Lane 24 hold remains in force.

## 5. CODATA custody

Current reference: NIST CODATA 2022, Web Version 9.0 (9 May 2024), Mohr et al., *Reviews of Modern Physics* 97, 025002 (2025), DOI `10.1103/RevModPhys.97.025002`.

The global adjustment uses 133 input data and 79 adjusted constants (54 degrees of freedom). `G` is evaluated separately as a weighted mean of 16 determinations, with three nonzero correlations:

- NIST-82 / LANL-97: `0.351`
- HUST-05 / HUST-09: `0.134`
- HUST-09 / HUSTT-18: `0.068`

The separate G evaluation uses uncertainty expansion factor 3.9 and reports `χ² = 12.9` for 15 degrees of freedom, upper-tail probability `0.61`, and Birge ratio `0.93`. Recommended `G = 6.67430(15) × 10⁻¹¹ m³ kg⁻¹ s⁻²`, relative standard uncertainty `2.2 × 10⁻⁵`. NIST SRD 121 last updated its data content in May 2024. The next CODATA adjustment closes 31 December 2026; results are expected early 2027. CODATA 2022 remains the latest published set.

No CODATA constant was used here. Catalog quantities are in solar masses and Mpc; the later multipole equations are in geometric units. No SI conversion, G-dependent comparison, or H(s)H parameter comparison was performed. If a future derivation converts mass to geometric length, it must carry the exact CODATA version, G evaluation/uncertainty and relevant covariance. `c` is exact in SI.

## 6. Source-to-observable chain and missing H(s)H map

The external chain is source mass/spin → multipole coefficients → PN dynamics/phase → waveform model → H1/V1 response/calibration → likelihood with PSD/priors/calibration uncertainty → posterior.

The missing H(s)H chain is an explicit, source-authorized map from H(s)H geometry/worldtube/timesheet and constitutive variables to multipole coefficients, then through dynamics, waveform, detector response and calibrated strain. The reverse inference must state identifiability under the actual projection and detector network. Analogy or dimensional resemblance is insufficient.

## 7. Status and next admissible steps

| Item | Status |
|---|---|
| GW241011 | Observed astrophysical event |
| H1/V1 strain products | Publicly listed; not downloaded |
| L1 | Not operating at event time |
| GWTC-5.0 event HDF5 / summary table | Publicly listed; exact file identities recorded; not downloaded |
| Original 2025 SIQM archive | Publicly listed; includes `spin_induced_quadrupole/`; not downloaded |
| Calibration / PSD / priors | Described in PE release; not extracted |
| 2025 SIQM posterior | Published, model-conditioned inference |
| 2026 SIQM/SIOM posterior | Preprint, same event, model/prior-conditioned reanalysis |
| Independent measurement | None beyond the original event observation |
| H(s)H forward map / prediction / holdout | Not supplied |
| CODATA comparison | None |

P0 Code Grurple remains ACTIVE. Lane 24 Cycle 08/08 remains complete and BACKSEAT/HOLD. GW241011 remains an inspiral comparator in the existing P3 source lane; it is not a P2 selection and this note does not advance the December 14 paper gate. P1 Orson remains independently owned; P2 November 30 remains HOLD. No theory premise or BEDROCK status changes.

After the existing gate opens: (1) retrieve the original 2025 event-specific SIQM posterior/configuration and hashes; (2) retrieve the 194.7 kB GWTC-5.0 summary table first, then the 1.3 GB event HDF5 only if needed; (3) define the H(s)H geometry-to-multipole map; (4) formalize the four-to-two projection and fibers in Lean and run exact-head CI; (5) define a falsifiable observable and independent holdout before fitting or prediction.

**Epistemic label:** source-currentness update / source-derived conditional map analysis / no new physical calculation / no new Lean run / no independent measurement / no H(s)H prediction / no paper-gate advancement.

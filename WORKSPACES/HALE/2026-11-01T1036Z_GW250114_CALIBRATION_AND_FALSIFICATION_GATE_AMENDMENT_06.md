# Amendment 06 — Shared-source channel map, conditional identifiability, and GWOSC version gate

**Nominal slot:** 2026-11-01T1036Z  
**Run key:** `REVROT3-19-20261011:514:s3`  
**Selected label:** Hale (ring index 8)  
**Next label:** Elias Kern (ring index 9)  
**Classification:** supplemental correction to the existing report; no duplicate primary receipt or publication.

## 1. Source correction: the two echo channels are not free physical knobs

The primary external source is Prasad et al., *Listening to the Horizon: Probing Near-Horizon Reflectivity with GW250114*, arXiv:2610.12429 (2026), Eq. 5 and Supplementary Eqs. 9–14.

The first-echo coefficient is represented in the existing formalization as

\[
Z^{(1)}=R_s e^{ik_H\Delta t}
\left[
R^{BH}Z^\infty+\hat\sigma t^{BH}Z_H^{(+)}
\right].
\]

The supplement makes an important distinction that the earlier report did not state strongly enough:

- \(Z^\infty\) and \(Z_H^{(+)}\) are separate functionals of the **same Teukolsky source term** \(\mathcal T\), evaluated with different radial kernels.
- The minus horizon contribution is not a free third channel: the source gives the identity \(t^{BH}Z_H^{(-)}=r^{BH}Z^\infty\).
- The plus contribution has no direct-wave counterpart in \(Z^\infty\), has no simple closed form in the stated treatment, and is computed numerically.
- The paper reports that the plus path supplies about 90% of the echo peak and the minus path about 10%.

Thus the physical preprint does **not** fit two arbitrary complex channel values independently. Its Teukolsky source model restricts the admissible channel pairs to the image of one common source history. The direct-wave calibration constrains a shared complex amplitude and timing, but it does not independently validate the plus-channel kernel: that channel remains a model-dependent numerical transfer.

The source model uses an NR-calibrated equal-mass SEOBNRv4 trajectory through ISCO, followed by a geodesic plunge. The paper also reports that an abrupt source switch-on can preserve a high direct-wave match while producing a larger echo. Source history therefore matters to the horizon-directed channel.

The preprint explicitly does not require the direct wave itself to be a horizon mode. The separate direct-wave horizon-frequency diagnostic must not be conflated with the echo/reflectivity inference.

## 2. What the new algebraic theorem does, and does not, say

The existing PR #1166 module now defines the channel map

\[
L(z_\infty,z_+)=R^{BH}z_\infty+\hat\sigma t^{BH}z_+.
\]

It proves the shift invariance

\[
L(z_\infty+\hat\sigma t^{BH},\ z_+-R^{BH})
=L(z_\infty,z_+),
\]

and, when \(\hat\sigma t^{BH}\ne0\), non-injectivity of \(L\) on the unrestricted pair space \(\mathbb C^2\).

This is a **conditional identifiability boundary**, not a refutation of the preprint. The theorem says that the scalar channel sum cannot identify two freely varying complex channel amplitudes. The physical Teukolsky model narrows the admissible pairs through the shared-source map. Whether that restricted image avoids the null direction is a separate source-model question.

The existing theorem `firstEchoAmplitude_injective_horizonPlus` proves conditional injectivity in \(Z_H^{(+)}\) when \(Z^\infty\) and the transfer coefficients are fixed and the relevant coefficient is nonzero. It is not, by itself, a detector-level identifiability theorem or an independent validation of the source model.

**HsH architecture requirement:** define one admissible H(s)H source state \(S\), then two explicit maps

\[
\Pi_\infty:S\mapsto Z^\infty,
\qquad
\Pi_{H+}:S\mapsto Z_H^{(+)}
\]

and a separate detector-response map into the H1/L1 strain time series. Do not introduce independently tunable channel amplitudes unless a physical reason and calibration are supplied. The source image must be tested for null-direction degeneracies, or the full time/frequency/detector observables must resolve them.

This is where the user-role Ravel source statements constrain the architecture: the 2026-09-07 conversation describes a spatial Kerr section extended along the filament, mutual filament/timesheet accommodation under force, and multiple simultaneous 4D/3D representations. These are source-level representational commitments, not yet the two transfer maps. The raw Library capture was materialized and parsed: 10,671,630 bytes, SHA-256 `a519fcb59a5e214cb8d129bd323e3986c1433d3b05eb85bb29caa00b15a53590`, Git blob SHA-1 `58c1b041623d04667629a69bc4580b52fd803417`, 2,050 mapping nodes, title `🎼 Ravel [H(s)H] Syncmathcek`. Selected source messages are user-role entries; the export's author-name field is null, so attribution is by conversation provenance and role, not a populated author-name field.

The HsH repository's large raw-export copy has Git blob SHA-1 `c49367b0faa424491e7b3520a034b9e44fe6897f`. The Library and repository captures are not byte-identical serializations. The connector returned an empty body for the oversized repository file, so no full-byte equivalence is claimed. The selected user-role message text agrees with the existing verified Ravel source batch.

## 3. GW250114 data-version and timing gate

The GWOSC event portal exposes at least two event versions relevant to this event:

- `v1`: `O4_Discovery_Papers`, DOI `10.7935/1g4j-2028`.
- `v2`: `GWTC-5.0`, DOI `10.7935/bk00-6a89`.

Both expose H1/L1 strain products. GWOSC's version guidance warns that releases may differ in calibration and cleaning. The preprint's supplement cites the discovery-paper figure scripts/posterior material and H1/L1 strain, but the inspected text does not pin the exact event-portal version. A reanalysis must freeze the exact version, file URLs/metadata, calibration, cleaning, sample rate, and file checksums; do not mix v1 and v2 products.

The event portal gives GPS peak time 1420878141.2 and a 4096-second file beginning at GPS 1420877824, so the peak is 317.2 seconds into the file. The available sample-rate choices include 4096 Hz and 16384 Hz. Deterministic index conversions are:

| Rate | Event-peak index from file start |
|---:|---:|
| 4096 Hz | 1,299,251.2 samples |
| 16384 Hz | 5,197,004.8 samples |

The paper's 257 ms best-fit echo-delay peak corresponds to 1052.672 samples at 4096 Hz or 4210.688 samples at 16384 Hz. These are fractional-sample offsets; preserve sub-sample timing in the fit rather than rounding to an integer index. This is an indexing conversion from published event metadata and a reported **best-fit noise peak**, not a new measurement or detected echo.

The preprint reports no echo evidence: the 257 ms best-fit delay has SNR 3.2 and is typical of the time-slide background. Its reported 90% upper limit is \(|R_s|<0.059\), with \(0.059^2=0.003481\) under the paper's reflectivity/energy normalization; a different complex-plane prior gives 0.070–0.073. The supplement fixes remnant parameters to maximum-posterior values for the search, so a new analysis must either reproduce that conditioning or propagate remnant-posterior uncertainty explicitly. No raw GWOSC strain was downloaded or independently reanalysed in this run.

## 4. Refined test matrix

| Hypothesis | Shared parameters / source constraint | Calibration | Holdout | Predicted observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|---|
| Kerr/Teukolsky near-horizon reflectivity | One plunge source; separate \(Z^\infty[\mathcal T]\) and \(Z_H^{(+)}[\mathcal T]\) kernels; common complex amplitude and timing; \(R_s\), phase and delay | H1/L1 direct-wave fit; NR-calibrated SEOBNRv4 through ISCO plus geodesic plunge; fixed or propagated remnant posterior; detector PSD/calibration | Independent comparable-mass NR source histories with both outgoing waveform and horizon-directed flux; then a separate GW event | Full detector echo strain, channel ratio/phase, and posterior on \(R_s\) | Kerr no-reflection \(R_s=0\), plus the published Teukolsky echo model | Shared-source prediction for the plus channel/echo falls outside the joint NR + solver + detector uncertainty envelope, or requires independently retuned channel amplitudes |
| H(s)H coupled source candidate | One filament/timesheet source state; explicit \(\Pi_\infty\), \(\Pi_{H+}\), coupling and detector maps; shared geometric/force parameters, no free channel knobs | Fit only the declared calibration subset; freeze source geometry and map parameters before holdout | Comparable-mass NR and a separate GW event, with the same pinned strain release and independently specified channel targets | Simultaneous direct-wave and horizon-directed/echo strain, including cross-channel phase and amplitude | Kerr/Teukolsky model and its \(R_s=0\) null | No single HsH source state reproduces both channels and detector strain within the propagated uncertainty budget, or success requires channel-specific retuning |
| Direct-wave horizon-frequency diagnostic | Separate hypothesis; not an assumption of the echo model | Spin/time sweep with fixed filtering and remnant conventions | Independent comparable-mass NR and detector events | Time-dependent direct-wave frequency and damping relative to \(\Omega_H\), \(\kappa\) | Standard Kerr/QNM and published comparable-mass NR results | Systematic residual outside the pre-registered NR/measurement uncertainty envelope |

No numerical H(s)H falsification threshold is assigned yet. The required covariance/uncertainty budget must include detector calibration, PSD/noise estimation, remnant posterior, NR waveform error, Teukolsky solver truncation, source-history uncertainty, and data-release version. The preprint's match values and posterior limit are calibration/context values, not universal acceptance thresholds.

## 5. Lean verification and exact status

The existing PR #1166 branch remains `research/hale-gw250114-direct-wave-algebra-20261031t1924z`, head `24dc259e873aaa61f6aead0cf4898748a508274d`. Actions run #41300720325 checked merge commit `6fee9ab`, merging that PR head into base `b5a86c85f17df74e6c8b2d734c5507caea6a8f16`. The Hale module blob was identical at PR head and merge ref: `a6ceb8910cbd2ab750b57ab4da41aafeb4a61124`.

The Hale module built successfully at target 8927/8945. Its actual `#eval` output included `3481 / 1000000` and the encoded calibration-ledger record. The theorem-specific `#print axioms` output for the direct-wave inversions, rational-filter norm, conditional horizon-channel injectivity, channel-shift invariance, and channel non-injectivity contained `propext`, `Classical.choice`, and `Quot.sound`; none of those Hale theorem reports contained `sorryAx`.

**The overall library run did not succeed.** `lake build` failed in the base-branch `NadirHelixSliceGeometry.lean` target, with unrelated noncomputable-definition errors involving `Real.instDivInvMonoid`/`Real.cos` and an `unfold onTimeSlice` failure. That module's theorem `transverse_line_intersection_unique` was reported with `sorryAx`. This is not a Hale-module failure and was not modified in this lane. Tests, lint, and the separate automated axiom audit were skipped. This was a merge-ref build, not an exact-head standalone build.

PR #1166 remains open, draft, and unmerged. Lean checks only the encoded algebra and assumptions; it does not validate the Teukolsky source translation, the physical source trajectory, the HsH maps, or the GWOSC data.

## 6. Controls and coordination

- BEDROCK, STATE_OF_THE_THEORY, SAT-O, Blockwave, and paper manuscripts unchanged.
- Code Grurple remains ACTIVE. Both pinned reader routes were freshly attempted and remained inaccessible from the available web/browser surface; classification is `ACCESS_UNAVAILABLE / ROUTE_NOT_OBSERVED`, not a rendering failure or successful repair.
- The four Mersearch request lanes were occupied/reserved; no request was overwritten or created. Bounded direct source reads were used instead.
- No raw strain download, fit, physical prediction, or independent measurement.
- No new tool, dependency, branch, PR, issue, or automation.
- P1 November 9, P2 November 30, and P3 December 14 remain separate.
- FIE rereview is not due; last full review October 27. No repetitive unrelated-reading break was performed.

The existing :36 automation remains enabled and unchanged: task ID `6a9f52b69ec08191b0a2ba24a074f781`, original hourly America/New_York :36 schedule and phase. Current run ID `2780662b-122c-8322-8203-c01422448f4b` was still recorded `in_progress` with no `chat_ref` at final inspection. No sixth task or task/ID/cadence modification occurred.

# Kelvin-wave pentacoherence: statistic order is not acquisition rank

**Workshop Relay :36 | nominal 2026-11-07 11:36Z | h659:s3**  
**Status:** source-grounded observability addendum; Lean exact-head build verified; no physical calculation, P2 selection, or theory promotion.

This addendum extends, without replacing or reissuing, HsH issues [#1301](https://github.com/Satobloc/HsH/issues/1301) (joint-readout identifiability) and [#1261](https://github.com/Satobloc/HsH/issues/1261) (Kelvin-vortex P2 candidate). It records a new cross-paper distinction from the 2026 PRL follow-on and a generic formal theorem.

## 1. Two related experiments, different acquisition maps

**Nature Physics (2026):** Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w), published 2026-02-10. The Methods identifies a Basler side-view contour stream, a Phantom top-view PIV velocity-field stream, and a separate PTV vertical-velocity path. The Results' “two orthogonal cameras” handedness statement is not fully joined in the retrieved Methods to the specific synchronized/registered data and estimator. The declared dataset is [Figshare DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347), but its version, file manifest, raw bytes, checksums and joint covariance remain unretrieved.

**Physical Review Letters (2026):** Barckicke, Gissinger & Falcon, “Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core,” PRL 137, 134001, DOI [10.1103/t3bt-m431](https://doi.org/10.1103/t3bt-m431), published 2026-09-21. The author-hosted final PDF describes one optical camera (480 fps, 3 Mpix) perpendicular to the vortex axis, tracking the displacement field
\[
\eta(z,t)=[r_i(z,t,0)-r_i(z,t,\pi)]/2
\]
over a 20.6 cm vertical window. Its pentacoherence is calculated from Fourier amplitudes of this same measured \(\eta(z,t)\) record, averaged over 75 minutes. The paper's data-availability statement says there are no publicly available research data or software and directs requests to the authors. No author request was sent.

The papers are distinct publications from the same author group/program, not independent-laboratory replication. Their acquisition maps must not be treated as interchangeable.

## 2. The new distinction

Keep three forms of independence separate:

1. **Experiment independence:** independent campaign/laboratory versus same-group follow-on.
2. **Acquisition-channel independence:** new sensor, modality, or coordinate-resolved measurement versus the same acquired field.
3. **Statistic independence:** a higher-order statistic may retain phase correlations omitted by a coarser statistic, without becoming a new acquisition channel.

PRL pentacoherence may distinguish measured \(\eta\) time series that have the same second-order power spectrum but different higher-order phase correlations. It is therefore potentially more informative than the power spectrum alone. It is nevertheless a deterministic statistic of the same one-camera \(\eta(z,t)\) acquisition.

## 3. Lean-verified function/fiber theorem

For source states \(X\), acquisition \(M:X\to Y\), and deterministic statistic \(T:Y\to Z\):
\[
M(x_1)=M(x_2)\implies (T\circ M)(x_1)=(T\circ M)(x_2).
\]
Thus if \(T\circ M\) is injective, \(M\) was already injective; deterministic post-processing cannot restore injectivity lost by acquisition. It cannot distinguish source geometries that already produce the same complete acquired \(\eta(z,t)\) record.

Formalized in existing draft PR #1401, file `FORMAL_VERIFICATION/HsHVerification/EnheduannaKelvinParityReadout.lean`, commit `f601252879ffdf8951be11793bbfb52cb40b4447`. Exact-head Actions run #42369787715 / job #128395340494: SUCCESS; checked-out commit equals PR head; Lean 4.34.0 / Lake 5.0.0; root build 8,955 jobs. All three new theorem-specific `#print axioms` reports say “does not depend on any axioms.” No `sorryAx` or bare `admit` in the full job log. Lint, nanoda and separate global axiom audit were skipped. PR remains OPEN / DRAFT / UNMERGED.

This is a mathematical function/fiber result only. Lean does not validate the physical acquisition map, camera calibration, source-to-geometry translation, or any H(s)H premise.

## 4. Geometry and prediction consequence

For the measured classical air-core water vortex, the finite core and air-water interface are forced by the source and already appear in the standard Rankine-core comparator. The present readouts do not force an additional H(s)H thickness field, internal twist/connection, extra contact law, or independent timesheet field. Helical Kelvin modes and six-wave correlations are already treated within standard Kelvin-wave/weak-turbulence theory.

An H(s)H extension must predict a non-reparameterizable residual in an independently acquired observable beyond shared standard parameters and the acquisition map's nullspace. Depending on the proposed sector, this requires a resolved radial profile, calibrated cross-sectional director/phase transport, independent boundary-stress/curvature measurement, or a synchronized additional field whose signal is not reducible to \(\eta\).

No raw-data reanalysis, fit, prediction, covariance propagation, independent measurement, numerical threshold, P2 system selection, Factory Floor admission, BEDROCK change, or theory promotion is claimed. P1 Nov 9, P2 Nov 30 and P3 Dec 14 remain separate gates; Code Grurple P0 remains active.

**Source status:** PRL raw data unavailable publicly per its statement; Nature Figshare manifest and raw files not retrieved. This is a source/architecture result, not an empirical H(s)H result.

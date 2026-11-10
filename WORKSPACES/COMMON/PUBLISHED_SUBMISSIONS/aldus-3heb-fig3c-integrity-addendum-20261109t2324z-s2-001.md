# Addendum: byte-integrity verification of `Fig3c.csv` (Zenodo 7525698)

**Relationship:** additive source-integrity note to HsH publication issue #1526. This does not replace that intake, select a P2 system, or establish an H(s)H result.

## File identity

- Dataset: experimental data for “Rotating quantum wave turbulence.”
- Zenodo version record: `10.5281/zenodo.7525698`, version v1.
- File: `Fig3c.csv`.
- Size: 476 bytes.
- Zenodo-listed MD5: `044358f689a0a7efddebe99a613dc9bd`.

## Independent text-byte check

The CSV text returned by the Zenodo file view was reconstructed as UTF-8 with LF line endings and a final newline. Its 476-byte representation reproduces the Zenodo-listed MD5 exactly:

`MD5 = 044358f689a0a7efddebe99a613dc9bd`

The SHA-256 of that same verified byte sequence is:

`SHA-256 = 6a2d88cb33518ac3b31eba49556cde5a633a0ab91bf6e63e97d46290cd944996`

This is a checksum of the web-served text representation whose MD5 matches the Zenodo manifest. It is not a claim that a separate local binary download was obtained.

## Data scope and interpretation limits

The file contains eight headerless rows and four numeric columns. The figure context supports the provisional interpretation: pressure (bar), inverse energy-pumping efficiency `β⁻¹`, and lower/upper uncertainty columns. The paper's Figure 3c caption identifies the plotted quantity as `β⁻¹` and says its error bars are 1σ confidence intervals. The exact column labels remain unconfirmed because `DatasetDescription.pdf` could not be decoded in this reader runtime.

The pressure-dependent vortex-core-size curve on Figure 3c's right axis is described as an estimate from an earlier reference; it is not a direct core-radius measurement contained in `Fig3c.csv`.

`β⁻¹` is a fitted model parameter, not a direct instrument reading. This is figure-level derived/fitted data, not raw NMR, tuning-fork, rotation-drive, or time-series acquisition data. The checksum therefore improves file provenance but does not enable a physical H(s)H calculation, fit, prediction, or P2 system selection.

## Source and correction custody

- Article: Mäkinen et al., “Rotating quantum wave turbulence,” Nature Physics 19 (2023), DOI `10.1038/s41567-023-01966-z`.
- Publisher correction: DOI `10.1038/s41567-023-02057-9`; preserve the corrected tuning-fork calibration statement `C ∝ p_F^4` rather than an earlier uncorrected transcription.
- Aalto's catalogue lists `10.5281/zenodo.7525697`, while the accessible Zenodo version record is `10.5281/zenodo.7525698`. Preserve both identifiers; the precise concept/version relationship was not independently established in this check.

## Next gate

Decode the dataset's `DatasetDescription.pdf` and obtain the underlying acquisition/analysis package or an author-provided raw-data release before quantitative reanalysis. Keep the measured, calibrated, fitted, derived, and simulated quantities separate. No H(s)H map or rope equivalence is asserted.

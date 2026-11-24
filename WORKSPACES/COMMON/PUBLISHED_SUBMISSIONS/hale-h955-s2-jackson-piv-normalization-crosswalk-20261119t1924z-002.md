# Hale h955:s2 source note — Jackson & Thomas rotating-vortex parameter-normalization crosswalk

**Status:** `SOURCE_CROSSWALK / P2_CANDIDATE_ONLY / NOMINAL_PARAMETER_AUDIT / NO_RAW_PIV_REANALYSIS / NO_H(s)H_PREDICTION`.

**Scope:** This note adds one narrowly bounded source finding to the existing rotating-fluid PIV candidate already tracked in [P2 issue #565](https://github.com/Satobloc/HsH/issues/565). Earlier Nadir h811, Nadir h849, and Enheduanna h853 reports already cover the experimental setup, public-data boundary, VLS/HLS separation, PIV processing, and the post-breakdown change in what the vorticity-maximum tracker follows. This note does not repeat or replace those analyses.

## 1. Primary source pair

1. O. C. Jackson and P. J. Thomas (2026), “An experimental study investigating the inertial-wave field accompanying vortex rings translating through a rotating fluid,” *Journal of Fluid Mechanics* 1029, A47. [DOI: 10.1017/jfm.2026.11199](https://doi.org/10.1017/jfm.2026.11199).
2. O. C. Jackson (2025), *An experimental study of the dynamics of vortex rings in a rotating fluid*, PhD thesis, University of Warwick, WRAP eprint 195731. [Repository record and PDF](https://wrap.warwick.ac.uk/id/eprint/195731/).

These are related but distinct source versions. Their symbols and dimensionless-number conventions must not be silently merged.

## 2. Verbatim source definitions and apparatus geometry

The 2026 JFM article gives:

\[
Ro=\frac{U_P}{2\Omega L_P}
\tag{JFM Eq. 2.1}
\]

\[
Re=\frac{U_P L_P}{\nu}
\tag{JFM Eq. 2.2}
\]

Here \(U_P\) is the piston speed and \(L_P\) the piston stroke. The article also says that \(L_P\)-based definitions can be translated into diameter-based values.

The 2025 thesis gives the jet Reynolds-number convention:

\[
Re_J=\frac{\bar U_o\,l_o}{2\nu}
\tag{Thesis Eq. 2.3}
\]

and a generic Rossby definition:

\[
Ro=\frac{U}{2\Omega L}
\tag{Thesis Eq. 2.6}
\]

The thesis apparatus description states that the cylinder diameter and nozzle inner diameter are both 50 mm, and that this makes piston stroke \(L\) equal to fluid-injection length \(l_o\). Its glossary identifies \(U_0\) as piston speed. Equal cross-sectional area supports the ideal incompressible mapping from piston speed to mean nozzle speed, but the accessible source does not provide a separately measured flow-rate record or uncertainty for that mapping.

The reported geometry is:

- nozzle radius \(r_0=25\ \mathrm{mm}\);
- nozzle diameter \(D_0=2r_0=50\ \mathrm{mm}\);
- piston stroke \(L_P=100\ \mathrm{mm}\) for the illustrated case;
- therefore \(L_P=2D_0\).

## 3. Conditional normalization crosswalk

For the same nominal speed and viscosity, define:

\[
Re_{L_P}=\frac{U_P L_P}{\nu},
\qquad
Re_{D_0}=\frac{U_P D_0}{\nu}
\]

\[
Ro_{L_P}=\frac{U_P}{2\Omega L_P},
\qquad
Ro_{D_0}=\frac{U_P}{2\Omega D_0}
\]

When \(L_P=2D_0\):

\[
Re_{D_0}=\frac12 Re_{L_P},
\qquad
Ro_{D_0}=2Ro_{L_P}.
\]

If, additionally, the thesis variables map as \(U_P=\bar U_o\) and \(L_P=l_o\), then:

\[
Re_J=\frac{\bar U_o l_o}{2\nu}
     =Re_{D_0}
     =\frac12 Re_{L_P}.
\]

The velocity identification is conditional on the equal-area, incompressible, no-leak interpretation; it is not claimed as a separately calibrated observation.

## 4. Reproducible nominal-parameter check

The illustrated source settings are \(U_P=100\ \mathrm{mm\,s^{-1}}=0.100\ \mathrm{m\,s^{-1}}\), \(L_P=0.100\ \mathrm{m}\), \(D_0=0.050\ \mathrm{m}\), and \(\nu=1\ \mathrm{mm^2\,s^{-1}}=10^{-6}\ \mathrm{m^2\,s^{-1}}\).

Thus:

\[
Re_{L_P}=10{,}000,\qquad Re_{D_0}=5{,}000.
\]

For \(\Omega=2\pi(\mathrm{rpm}/60)\), the nominal Rossby conversions are:

| Rotation | \(\Omega\) (rad s\(^{-1}\)) | \(Ro_{L_P}\) | \(Ro_{D_0}\) |
|---:|---:|---:|---:|
| 2 rpm | 0.20944 | 2.3873 | 4.7746 |
| 6 rpm | 0.62832 | 0.7958 | 1.5915 |
| 12 rpm | 1.25664 | 0.3979 | 0.7958 |

The JFM figure captions report \(Re=5000\), with \(Ro\) values approximately 4.77, 1.59, and 0.80 at 2, 6, and 12 rpm respectively. Those values match the \(D_0\)-based conversions and the thesis \(Re_J\) convention, not direct application of JFM Eqs. 2.1–2.2 with \(L_P=100\) mm.

The article's statement that \(L_P\)-based values can be translated into diameter-based values may explain the figure labels. The captions do not explicitly identify the characteristic-length basis, while Eq. 2.2 as printed differs by a factor of two from the thesis \(Re_J\) convention and the plotted \(Re=5000\) example. The appropriate classification is **an unlabelled normalization-basis switch plus a source-version Reynolds-definition mismatch**, not a demonstrated experimental error.

## 5. Metrology and evidence limits

These are nominal control-parameter consistency checks, not new measurements. The accessible article/thesis passages do not state uncertainties or covariance for piston speed, piston stroke, rotation-rate calibration, nozzle diameter, or the quoted kinematic viscosity. The article reports water at approximately 20 °C and \(\nu=1\ \mathrm{mm^2\,s^{-1}}\), but the uncertainty attached to that value is not supplied in the passages reviewed.

The earlier h811/h849/h853 reports document the separate VLS/HLS 2D2C acquisitions, the large raw-data volume, and the public access boundary. This note acquired no raw PIV files and performed no fit, independent reproduction, holdout test, or physical prediction.

## 6. H(s)H / Lane 24 implication

Any future geometry-to-observable comparison using this experiment must carry the characteristic-length convention and source version explicitly. Otherwise the same apparatus can be assigned Reynolds and Rossby values differing by factors of two solely through the selected length normalization.

This is a measurement/definition issue, not evidence for an H(s)H constitutive law. The existing source-faithful object distinction also remains: VLS and HLS are separate planar acquisitions, and the post-breakdown vorticity-maximum tracker follows inertial-wave phases rather than one persistent vortex-core centre. A full 3D worldtube cannot be inferred from those records without additional registration, synchronization, symmetry assumptions, and uncertainty propagation.

## 7. Formal and project status

No new Lean module is claimed in this source note. The current Hale PR #2120 contains the separate PNAS turbulent-blob interval/closure formalization. Its current head is `24db8a3263c7fa5d7ec3677c1b7fb6c8b699472b`. A prior exact-head Lean run failed on proof/parser issues; the proof bounds and doc-comment syntax were patched, but no exact-head Lean build was observed after the final patch. The corrected head is therefore **NOT VERIFIED**. The separate `conversation-json-content-ci` failure is not a Lean build.

P2 remains HOLD and this experiment remains a candidate, not a selected system. No paper gate advanced and no BEDROCK theory promotion occurred.

**Next source/data gate:** obtain an author- or repository-supplied parameter sheet that explicitly labels the length basis used for each reported \(Re\) and \(Ro\); obtain run-level PIV fields, acquisition calibration, and uncertainty/covariance before any H(s)H forward/reverse map or independent observable test.

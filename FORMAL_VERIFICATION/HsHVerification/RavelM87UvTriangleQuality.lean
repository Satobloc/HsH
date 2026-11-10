import Mathlib

/-!
# Ravel: measured M87 uv-triangle quality and coordinate-closure checks

This module extends the existing M87 standard-measurement-layer PR. It
formalizes exact rational arithmetic for two actual rows from the public
Event Horizon Telescope 2017 HOPS network-calibrated Stokes-I release.

It does not formalize an H(s)H worldtube, a source-to-emissivity map,
radiative transfer, or a physical prediction. The local diagnostic
namespace is LOCAL:RAVEL-M87-UV; it is not a shared SAT/H(s)H symbol.

The CSV U,V coordinates are in wavelengths and printed to four decimal
places. Multiplying every coordinate by 10^4 represents those decimal
inputs exactly as integers; the dimensionless ratios below are invariant
under that common scaling.

For a directed triangle A->B->C->A, Q_uv^2 is computed from the two measured
legs AB and BC and the closure-derived third leg AB+BC. The separately
measured AC baseline is used for the coordinate-closure residual, not to
silently force the geometry to close.

The sample-specific exact equalities below verify arithmetic on measured
inputs. They do not verify the dataset's calibration, the physical source,
or an H(s)H interpretation.
-/

namespace HsHVerification.RavelM87UvTriangleQuality

/-- Squared length of a baseline vector in the (u,v) plane. -/
def uvNormSq (ux uy : ℚ) : ℚ := ux ^ 2 + uy ^ 2

/--
Squared normalized shape diagnostic for a directed uv triangle.
The third side is the closure-derived vector AB + BC.
-/
def uvTriangleQualitySq
    (uABx uABy uBCx uBCy : ℚ) : ℚ :=
  let uACx := uABx + uBCx
  let uACy := uABy + uBCy
  let cross := uABx * uBCy - uABy * uBCx
  let denom :=
    uvNormSq uABx uABy +
    uvNormSq uBCx uBCy +
    uvNormSq uACx uACy
  12 * cross ^ 2 / denom ^ 2

/-- Squared mismatch of the measured third baseline from AB + BC. -/
def uvClosureResidualSq
    (uABx uABy uBCx uBCy uACx uACy : ℚ) : ℚ :=
  (uABx + uBCx - uACx) ^ 2 +
  (uABy + uBCy - uACy) ^ 2

/-- Smallest of the three measured baseline lengths, squared. -/
def uvMinBaselineSq
    (uABx uABy uBCx uBCy uACx uACy : ℚ) : ℚ :=
  min (uvNormSq uABx uABy)
    (min (uvNormSq uBCx uBCy) (uvNormSq uACx uACy))

/--
Squared coordinate-closure residual divided by the smallest measured
baseline length squared. The square root is the residual/minimum-baseline
ratio reported in the data audit.
-/
def uvClosureResidualRatioSq
    (uABx uABy uBCx uBCy uACx uACy : ℚ) : ℚ :=
  uvClosureResidualSq uABx uABy uBCx uBCy uACx uACy /
    uvMinBaselineSq uABx uABy uBCx uBCy uACx uACy

/--
M87* 2017-04-05, high-band HOPS network-calibrated Stokes-I sample.
Source: eventhorizontelescope/2019-D01-01
File: csv/SR1_M87_2017_095_hi_hops_netcal_StokesI.csv
Git blob: d6cac32d27a6877ca0753574eae07912c143ce8e
CSV data rows: 1452 (AA->AZ), 1458 (AZ->LM), 1453 (AA->LM)
time(UTC)=03.60138881
The third phase is reversed from AA->LM to LM->AA.
-/
def aaAzLmQualitySq : ℚ :=
  uvTriangleQualitySq
    (25337016320000 : ℚ) (-47978429440000 : ℚ)
    (-3437813760000 : ℚ) (12379376640000 : ℚ)

def aaAzLmResidualRatioSq : ℚ :=
  uvClosureResidualRatioSq
    (25337016320000 : ℚ) (-47978429440000 : ℚ)
    (-3437813760000 : ℚ) (12379376640000 : ℚ)
    (21899340800000 : ℚ) (-35599098880000 : ℚ)

def aaAzLmClosureDegrees : ℚ :=
  (-433539 : ℚ) / 10000 +
  (-443824 : ℚ) / 10000 +
  (1182559 : ℚ) / 10000

def aaAzLmMinSNR : ℚ :=
  min ((9862260 : ℚ) / 453032)
    (min ((35358711 : ℚ) / 3433101) ((5409816 : ℚ) / 201930))

/--
M87* 2017-04-10, high-band HOPS network-calibrated Stokes-I sample.
Source: eventhorizontelescope/2019-D01-01
File: csv/SR1_M87_2017_100_hi_hops_netcal_StokesI.csv
Git blob: c38782d92ea3cb5e0b6b397c0cbd3bd767a7fc42
CSV data rows: 1088 (AA->JC), 1100 (JC->SM), 1084 (AA->SM)
time(UTC)=04.88472211
The third phase is reversed from AA->SM to SM->AA.
-/
def aaJcSmQualitySq : ℚ :=
  uvTriangleQualitySq
    (56171873280000 : ℚ) (-40655976960000 : ℚ)
    (-278505781 : ℚ) (-1183177500 : ℚ)

def aaJcSmResidualRatioSq : ℚ :=
  uvClosureResidualRatioSq
    (56171873280000 : ℚ) (-40655976960000 : ℚ)
    (-278505781 : ℚ) (-1183177500 : ℚ)
    (56172083200000 : ℚ) (-40656952320000 : ℚ)

def aaJcSmClosureDegrees : ℚ :=
  (1295516 : ℚ) / 10000 +
  (-1443206 : ℚ) / 10000 +
  (241982 : ℚ) / 10000

def aaJcSmMinSNR : ℚ :=
  min ((7380018 : ℚ) / 656463)
    (min ((115347556 : ℚ) / 8994537) ((7029159 : ℚ) / 410326))

/-- Exact Q_uv^2 for the measured AA-AZ-LM sample. -/
theorem aaAzLm_quality_exact :
    aaAzLmQualitySq =
      (96550438432656139634872368 : ℚ) /
        8578018498189592302292954521 := by
  norm_num [aaAzLmQualitySq, uvTriangleQualitySq, uvNormSq]

/-- Exact measured-coordinate closure residual ratio squared for AA-AZ-LM. -/
theorem aaAzLm_residual_exact :
    aaAzLmResidualRatioSq = (90 : ℚ) / 699647392457 := by
  norm_num [aaAzLmResidualRatioSq, uvClosureResidualRatioSq,
    uvClosureResidualSq, uvMinBaselineSq, uvNormSq]

/-- Exact unwrapped closure phase for the measured AA-AZ-LM sample. -/
theorem aaAzLm_closure_exact :
    aaAzLmClosureDegrees = (76299 : ℚ) / 2500 := by
  norm_num [aaAzLmClosureDegrees]

/-- All three measured AA-AZ-LM baselines pass the exploratory SNR >= 10 cut. -/
theorem aaAzLm_min_snr_gt_ten : aaAzLmMinSNR > 10 := by
  norm_num [aaAzLmMinSNR]

/-- Exact Q_uv^2 for the measured AA-JC-SM sample. -/
theorem aaJcSm_quality_exact :
    aaJcSmQualitySq =
      (18151155209283438913786153431993699532800000000 : ℚ) /
        23118982173297924600164369258680408023617781853150781521 := by
  norm_num [aaJcSmQualitySq, uvTriangleQualitySq, uvNormSq]

/-- Exact measured-coordinate closure residual ratio squared for AA-JC-SM. -/
theorem aaJcSm_residual_exact :
    aaJcSmResidualRatioSq =
      (281747856851709961 : ℚ) / 1477474466556669961 := by
  norm_num [aaJcSmResidualRatioSq, uvClosureResidualRatioSq,
    uvClosureResidualSq, uvMinBaselineSq, uvNormSq]

/-- Exact unwrapped closure phase for the measured AA-JC-SM sample. -/
theorem aaJcSm_closure_exact :
    aaJcSmClosureDegrees = (23573 : ℚ) / 2500 := by
  norm_num [aaJcSmClosureDegrees]

/-- All three measured AA-JC-SM baselines pass the exploratory SNR >= 10 cut. -/
theorem aaJcSm_min_snr_gt_ten : aaJcSmMinSNR > 10 := by
  norm_num [aaJcSmMinSNR]

#eval aaAzLmQualitySq
#eval aaAzLmResidualRatioSq
#eval aaAzLmClosureDegrees
#eval aaAzLmMinSNR

#eval aaJcSmQualitySq
#eval aaJcSmResidualRatioSq
#eval aaJcSmClosureDegrees
#eval aaJcSmMinSNR

#print axioms aaAzLm_quality_exact
#print axioms aaAzLm_residual_exact
#print axioms aaAzLm_closure_exact
#print axioms aaAzLm_min_snr_gt_ten
#print axioms aaJcSm_quality_exact
#print axioms aaJcSm_residual_exact
#print axioms aaJcSm_closure_exact
#print axioms aaJcSm_min_snr_gt_ten

end HsHVerification.RavelM87UvTriangleQuality

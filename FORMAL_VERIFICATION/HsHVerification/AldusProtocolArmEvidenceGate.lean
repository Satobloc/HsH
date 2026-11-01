import Mathlib

/-!
Protocol-arm evidence ledger and readout-fusion gate, 2026-11-01.

Purpose:
  Prevent paper-level aggregation from making separate experimental arms look
  like one synchronized, jointly measured system. The ledger distinguishes
  instrument-reported, proxy-derived, controlled-nominal, derived, model-
  inferred, manufacturer-reported, not-reported-in-arm, not-in-protocol, and
  unknown evidence states.

Primary source A:
  G. Kozyreff and B. Seron, "Dynamical elastic contact of a rope with the
  ground", Phys. Rev. Research 3, L022026 (2021),
  DOI 10.1103/PhysRevResearch.3.L022026.
  The authors report an initial applied tension of order 1 N measured in a
  static configuration with a force meter. For the seven Table I frequency
  conditions, however, T was difficult to measure directly and x0 was used
  as a monotone proxy. Table I gives rho = 15 g/m, Z0 = 81 cm,
  x0 = [1.08, 1.20, 1.47, 1.65, 1.80, 2.30, 2.45] m with ±0.03 m,
  and f1 = [1.18, 1.19, 1.20, 1.20, 1.23, 1.17, 1.20] Hz with ±0.02 Hz.
  The conditional source model gives T_proxy = rho*g*x0^2/(2*Z0).
  The exact rational calculations below use g = 9.81 m/s^2, nominal rho
  and Z0, and propagate only the printed x0 interval. No uncertainty for
  rho, Z0, g, covariance, or model discrepancy is supplied here.

Primary source B:
  H. Endo, S.-J. Yoon, and K. Arakawa, "Effects of Torsion on Mechanical
  Properties of Polymeric Fiber Ropes", Advanced Experimental Mechanics 1
  (2016), 210-213, DOI 10.11395/aem.1.0_210.
  The paper has distinct experimental arms:
    (1) displacement-controlled torsion/fracture tests on 2.4 m rope
        samples (1.2 m test length), pin-fixture turns imposed before
        tensile loading, 30 mm/min, room temperature, at least three new
        samples per condition, reported repeat differences within 5%;
    (2) a separate 1 m energy-transfer setup with a motor, UTM-30Nm torque
        meter, generator, 40 N dead weight, 220 ohm resistor and data logger.
        Torque and rotation are recorded in this second arm.
  The paper-level union therefore contains both fracture-load and torque
  measurements, but no single arm reports them as one synchronized joint
  response. The source does not establish common specimen identity,
  synchronized acquisition, shared calibration, or a covariance model
  across the two arms.

These are ordinary-rope comparators. They are not climbing-rope tests of a
traveling helical kink, and they do not establish physical equivalence between
a rope and SAT/H(s)H. The formal theorems check only this finite source ledger
and its arithmetic; source transcription and physical interpretation remain
separate review obligations.
-/

namespace HsHVerification.AldusProtocolArmEvidenceGate

inductive Observable where
  | axialTension
  | contactPosition
  | resonanceFrequency
  | imposedTurns
  | fractureLoad
  | torque
  | rotation
  | generatorPower
  | energyTransferEfficiency
  | forceDisplacement
  | forceTimeSeries
  | travelingHelicalKink
  | centerline3DHistory
  | materialFrame
  | kinkCurvature
  | contactPressure
  | workEnergy
  | dissipatedEnergy
  | returnedEnergy
  | localTemperature
  | manufacturerDiameter
  | impactForce
  | dynamicElongation
  | linearMass
  | sheathFraction
deriving DecidableEq, Repr

inductive EvidenceState where
  | instrumentReported
  | proxyDerived
  | controlledNominal
  | derivedFromInstrument
  | qualitativelyReported
  | modelInferred
  | manufacturerReported
  | notReportedInArm
  | notInProtocol
  | unknown
deriving DecidableEq, Repr

/-- Evidence units are protocol arms or a separately typed product-spec record,
    not whole publications. -/
inductive EvidenceUnit where
  | kozyreffBaselineTension
  | kozyreffFrequencySeries
  | endoTorsionFracture
  | endoEnergyTransfer
  | petzlManufacturerSpecifications
deriving DecidableEq, Repr

/-- Source-conditional status of one observable in one evidence unit. -/
def evidenceState : EvidenceUnit → Observable → EvidenceState
  | .kozyreffBaselineTension, .axialTension => .instrumentReported
  | .kozyreffFrequencySeries, .axialTension => .proxyDerived
  | .kozyreffFrequencySeries, .contactPosition => .instrumentReported
  | .kozyreffFrequencySeries, .resonanceFrequency => .instrumentReported
  | .endoTorsionFracture, .imposedTurns => .controlledNominal
  | .endoTorsionFracture, .fractureLoad => .instrumentReported
  | .endoTorsionFracture, .forceDisplacement => .instrumentReported
  | .endoTorsionFracture, .torque => .notReportedInArm
  | .endoEnergyTransfer, .axialTension => .controlledNominal
  | .endoEnergyTransfer, .torque => .instrumentReported
  | .endoEnergyTransfer, .rotation => .instrumentReported
  | .endoEnergyTransfer, .generatorPower => .derivedFromInstrument
  | .endoEnergyTransfer, .energyTransferEfficiency => .qualitativelyReported
  | .petzlManufacturerSpecifications, .manufacturerDiameter => .manufacturerReported
  | .petzlManufacturerSpecifications, .impactForce => .manufacturerReported
  | .petzlManufacturerSpecifications, .dynamicElongation => .manufacturerReported
  | .petzlManufacturerSpecifications, .linearMass => .manufacturerReported
  | .petzlManufacturerSpecifications, .sheathFraction => .manufacturerReported
  | _, .travelingHelicalKink => .notInProtocol
  | _, .centerline3DHistory => .notInProtocol
  | _, .materialFrame => .notInProtocol
  | _, .kinkCurvature => .notInProtocol
  | _, .contactPressure => .notReportedInArm
  | _, .forceTimeSeries => .notReportedInArm
  | _, .workEnergy => .notReportedInArm
  | _, .dissipatedEnergy => .notReportedInArm
  | _, .returnedEnergy => .notReportedInArm
  | _, .localTemperature => .notReportedInArm
  | _, _ => .unknown

def instrumentReported (unit : EvidenceUnit) (obs : Observable) : Bool :=
  decide (evidenceState unit obs = .instrumentReported)

def endoPaperArms : List EvidenceUnit :=
  [.endoTorsionFracture, .endoEnergyTransfer]

def endoPaperUnionHasInstrumentRecord (obs : Observable) : Bool :=
  endoPaperArms.any (fun unit => instrumentReported unit obs)

def endoHasSingleArmTorqueAndFracture : Bool :=
  endoPaperArms.any (fun unit =>
    instrumentReported unit .torque && instrumentReported unit .fractureLoad)

/-- The paper-level union contains torque and fracture-load measurements. -/
theorem endo_paper_union_has_torque :
    endoPaperUnionHasInstrumentRecord .torque = true := by
  decide

theorem endo_paper_union_has_fracture_load :
    endoPaperUnionHasInstrumentRecord .fractureLoad = true := by
  decide

/-- But the two measurements occur in different arms; paper-level union is
    not a synchronized joint measurement. -/
theorem endo_no_single_arm_jointly_measures_torque_and_fracture :
    endoHasSingleArmTorqueAndFracture = false := by
  decide

theorem endo_fracture_arm_torque_not_reported :
    evidenceState .endoTorsionFracture .torque = .notReportedInArm := by
  rfl

theorem endo_energy_arm_torque_meter :
    evidenceState .endoEnergyTransfer .torque = .instrumentReported := by
  rfl

theorem endo_energy_arm_rotation_recorded :
    evidenceState .endoEnergyTransfer .rotation = .instrumentReported := by
  rfl

theorem endo_energy_arm_tension_is_controlled_nominal :
    evidenceState .endoEnergyTransfer .axialTension = .controlledNominal := by
  rfl

theorem kozyreff_baseline_tension_force_meter :
    evidenceState .kozyreffBaselineTension .axialTension =
      .instrumentReported := by
  rfl

theorem kozyreff_frequency_series_tension_proxy :
    evidenceState .kozyreffFrequencySeries .axialTension =
      .proxyDerived := by
  rfl

theorem kozyreff_frequency_series_measures_x0_and_f1 :
    instrumentReported .kozyreffFrequencySeries .contactPosition = true ∧
    instrumentReported .kozyreffFrequencySeries .resonanceFrequency = true := by
  decide

inductive VerificationState where
  | verified
  | contradicted
  | unknown
deriving DecidableEq, Repr

structure CrossArmFusionWitness where
  sameSpecimen : VerificationState
  sameProtocol : VerificationState
  synchronized : VerificationState
  sharedCalibration : VerificationState
  covarianceAvailable : VerificationState
deriving Repr

def fusionEligible (w : CrossArmFusionWitness) : Prop :=
  w.sameSpecimen = .verified ∧
  w.sameProtocol = .verified ∧
  w.synchronized = .verified ∧
  w.sharedCalibration = .verified ∧
  w.covarianceAvailable = .verified

/-- The two Endo arms are distinct protocols. Specimen identity, a shared
    calibration and cross-arm covariance are not established by the paper. -/
def endoCrossArmFusionWitness : CrossArmFusionWitness :=
  { sameSpecimen := .unknown
    sameProtocol := .contradicted
    synchronized := .unknown
    sharedCalibration := .unknown
    covarianceAvailable := .unknown }

theorem endo_cross_arm_fusion_not_established :
    ¬ fusionEligible endoCrossArmFusionWitness := by
  simp [fusionEligible, endoCrossArmFusionWitness]

/-- Channels required for a joint WWRD-style traveling-kink test. This is a
    proposed measurement requirement, not a claim that the cited studies ran it. -/
def requiredWWRDChannels : List Observable :=
  [ .axialTension
  , .imposedTurns
  , .travelingHelicalKink
  , .centerline3DHistory
  , .materialFrame
  , .kinkCurvature
  , .contactPressure
  , .forceTimeSeries
  , .torque
  , .workEnergy
  , .dissipatedEnergy
  , .returnedEnergy
  ]

def boundedEvidenceUnits : List EvidenceUnit :=
  [ .kozyreffBaselineTension
  , .kozyreffFrequencySeries
  , .endoTorsionFracture
  , .endoEnergyTransfer
  , .petzlManufacturerSpecifications
  ]

def completeInstrumentCoverage (unit : EvidenceUnit) : Bool :=
  requiredWWRDChannels.all (fun obs => instrumentReported unit obs)

/-- Within this bounded source ledger, no single protocol arm or manufacturer
    specification supplies the full joint measurement set. This is not a
    universal claim about all rope literature. -/
theorem no_bounded_evidence_unit_has_full_wwrd_coverage :
    boundedEvidenceUnits.all (fun unit => !completeInstrumentCoverage unit) = true := by
  decide

/-! Exact-rational calculation from Kozyreff & Seron's Table I.
    Inputs: rho=15 g/m, g=9.81 m/s^2, Z0=0.81 m, x0 values in metres.
    The printed ±0.03 m on x0 is propagated alone; rho/Z0 uncertainty and
    model discrepancy are not supplied and are therefore not included. -/

def rhoKgPerM : ℚ := 15 / 1000
def gravityMS2 : ℚ := 981 / 100
def z0M : ℚ := 81 / 100
def x0UncertaintyM : ℚ := 3 / 100

def x0TableM : List ℚ :=
  [108 / 100, 120 / 100, 147 / 100, 165 / 100, 180 / 100, 230 / 100, 245 / 100]

def f1TableHz : List ℚ :=
  [118 / 100, 119 / 100, 120 / 100, 120 / 100, 123 / 100, 117 / 100, 120 / 100]

/-- T inferred from the paper's leading-order static relation, not a direct
    per-condition force-meter measurement. -/
def tensionProxyN (x0 : ℚ) : ℚ :=
  rhoKgPerM * gravityMS2 * x0 ^ 2 / (2 * z0M)

def tensionProxyBoundsN (x0 : ℚ) : ℚ × ℚ :=
  (tensionProxyN (x0 - x0UncertaintyM),
   tensionProxyN (x0 + x0UncertaintyM))

theorem first_tension_proxy :
    tensionProxyN (108 / 100) = 26487 / 250000 := by
  norm_num [tensionProxyN, rhoKgPerM, gravityMS2, z0M]

theorem last_tension_proxy :
    tensionProxyN (245 / 100) = 261709 / 480000 := by
  norm_num [tensionProxyN, rhoKgPerM, gravityMS2, z0M]

theorem tension_proxy_span_ratio :
    tensionProxyN (245 / 100) / tensionProxyN (108 / 100) =
      60025 / 11664 := by
  norm_num [tensionProxyN, rhoKgPerM, gravityMS2, z0M]

theorem first_tension_proxy_x0_only_bounds :
    tensionProxyBoundsN (108 / 100) =
      (16023 / 160000, 447663 / 4000000) := by
  norm_num [tensionProxyBoundsN, tensionProxyN, x0UncertaintyM,
    rhoKgPerM, gravityMS2, z0M]

theorem last_tension_proxy_x0_only_bounds :
    tensionProxyBoundsN (245 / 100) =
      (1595869 / 3000000, 104749 / 187500) := by
  norm_num [tensionProxyBoundsN, tensionProxyN, x0UncertaintyM,
    rhoKgPerM, gravityMS2, z0M]

#eval x0TableM.map tensionProxyN
#eval x0TableM.map tensionProxyBoundsN
#eval f1TableHz

#print axioms endo_paper_union_has_torque
#print axioms endo_paper_union_has_fracture_load
#print axioms endo_no_single_arm_jointly_measures_torque_and_fracture
#print axioms endo_cross_arm_fusion_not_established
#print axioms kozyreff_baseline_tension_force_meter
#print axioms kozyreff_frequency_series_tension_proxy
#print axioms no_bounded_evidence_unit_has_full_wwrd_coverage
#print axioms first_tension_proxy
#print axioms last_tension_proxy
#print axioms tension_proxy_span_ratio
#print axioms first_tension_proxy_x0_only_bounds
#print axioms last_tension_proxy_x0_only_bounds

end HsHVerification.AldusProtocolArmEvidenceGate

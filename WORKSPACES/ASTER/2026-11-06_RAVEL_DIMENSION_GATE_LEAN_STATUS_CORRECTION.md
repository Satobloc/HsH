# Aster formalization-status correction | Ravel carrier/sheet dimension gate

**Date:** 2026-11-06  
**Relation:** Additive correction to the h646:s2 Aster source audit. The base receipt remains immutable.  
**Status:** CONDITIONAL_DIMENSION_ARITHMETIC_FORMALIZED_AND_COMPILED / GEOMETRIC_HYPOTHESES_NOT_FORMALIZED / PHYSICAL_MAP_UNINSTANTIATED.

## 1. Existing source/code result recovered

The earlier h646 Aster receipt described the generic transverse-intersection dimension count as “not Lean-verified.” That was too broad. An existing Ravel-owned formalization already exists in HsH PR #1133:

- PR: Ravel: conditional carrier/timesheet reconstruction and O3 pairing audit, open/draft/unmerged, stacked on infrastructure PR #262 and targeting infra/lean4-verification-20261023.
- Branch: research/ravel-carrier-slice-reconstruction-20261031t0212z.
- Exact-head commit used by the successful run: 5b278cbc14273716a83e09f5a85ef97033be356a, created 2026-11-05T01:18:03Z.
- Module: FORMAL_VERIFICATION/HsHVerification/RavelCarrierSheetDimensionGate.lean, blob dae31690baf7170b0c156f1c7e9a7987f890eb59.
- Root aggregator: FORMAL_VERIFICATION/HsHVerification.lean, blob 59b478bfcac5399e6d5dfb461a09178dbfbe22ff.
- Both module and aggregator blobs independently match the current PR branch readback.
- Actual GitHub Actions exact-head run: #41947575131, job #126983483353, completed SUCCESS. The job built RavelCarrierSheetDimensionGate at 8925/8950 and completed the full root build successfully at 8950 jobs.
- Toolchain: Lean 4.34.0; Lake 5.0.0.
- The job log contains no sorryAx or admit occurrences. Tests, lint, nanoda, and the separate automated axiom-audit stage were skipped. This is a successful exact-head Lean build, not a complete independent project audit or mainline merge.

## 2. What the formalized statements actually establish

For numeric carrier dimension k, ambient dimension 4, and a 3-dimensional sheet, the module formalizes the arithmetic:

    d_perp = 4 - k
    d_expected = k + 3 - 4 = k - 1

with profiles:

| Carrier dimension k | Normal-complement rank 4-k | Expected transverse intersection dimension k-1 |
|---:|---:|---:|
| 1 | 3 | 0 |
| 2 | 2 | 1 |
| 3 | 1 | 2 |
| 4 | 0 | 3 |

The module also introduces ExpectedTransverseIntersectionOutcome so a negative expected dimension (generic emptiness) is not confused with a genuine zero-dimensional expected intersection. It proves the regression fact that the legacy Nat-valued subtraction helper conflates a generic-empty 1D/1D intersection in 4D with a 0D 1D/3D expected intersection.

The module's SliceCompatibleRetraction makes the missing map condition explicit: a tube-to-carrier projection induces a map between tube/sheet and carrier/sheet pullbacks only when a preservesSlice condition is supplied, together with an explicit sheet reparameterization. The commuting witness is proved from that supplied condition.

## 3. Proof and assumption limits

The Lean statements check the encoded arithmetic and conditional map interface. They do not prove the differential-geometric hypotheses or the physical translation:

- Smooth embeddings, a chosen normal complement, and transversality are stated in the module's explanatory comments, but are not represented as a formal smooth-manifold/transversality development in the theorem types. The core dimension theorems reduce to arithmetic over Nat.
- preservesSlice is an input field of SliceCompatibleRetraction; it is not derived from a source-defined H(s)H tube, carrier, or sheet.
- The generic types Ambient, Tube, Carrier, and Sheet do not instantiate a physical object, metric, topology, finite-core profile, dynamics, responsive-medium law, current, or observation operator.
- The 4D “full core region” profile is a conditional dimension count. It does not establish that the source-defined SAT/H(s)H object is an open 4D region or that its physical slice exists with the assumed regularity.
- The exact-head CI build proves only the formalized statements at the recorded commit. It does not prove soundness of the source-to-code translation, truth of physical premises, empirical validity, or current mainline integration.

In the target module's #print axioms output, the concrete arithmetic cases, typed empty-versus-point distinction, and induced commuting witness report no axioms. The parameterized carrierSliceDimension_eq_k_minus_one reports [propext, Quot.sound]; positiveNormalRank_implies_carrier_lt_four and nonnegative_outcome_agrees_with_nat_helper report [propext]. These are explicit Lean axiom dependencies, not sorry/admit; the separate automated axiom-audit stage was skipped.

## 4. Corrected Aster status wording

Replace the overbroad interpretation of “not Lean-verified” with:

**The abstract expected-dimension arithmetic and a conditional slice-compatible pullback interface have been Lean-formalized and compiled on Ravel PR #1133 at exact head 5b278... The source-defined geometric hypotheses, finite-core realization, actual slice-preserving projection/reparameterization, and physical readout remain unformalized and unverified.**

Aster did not author or amend PR #1133 and did not create a new theorem. This is a source-grounded cross-worker status correction only. PR #1133 remains owned by its existing Ravel branch; no PR/branch/issue modification was made.

## 5. Next proof-first cursor

Recover the actual Nathan Direct construction that defines the finite-core support and the tube/carrier/sheet maps. Then type the domains/codomains and composition order, and determine whether smoothness, normal-complement, transversality, and preservesSlice are genuinely source-supported. Only then consider extending the existing formalization under its owner's branch controls. If those objects cannot be recovered, retain GEOMETRY_UNDERSPECIFIED and do not manufacture a data-free physical fixture or substitute an analogy.

No CODATA comparison, physical calculation, fit, prediction, independent measurement, Factory Floor admission, BEDROCK promotion, or theory promotion follows from this correction.

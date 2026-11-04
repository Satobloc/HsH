# Boundary/section/contact separation: finite-core mode-carrier gate

**Status:** ARCHITECTURE_PROPOSAL / SOURCE_MAP_INCOMPLETE / NO_PHYSICAL_PREDICTION / NO_THEORY_PROMOTION  
**Date:** 2026-11-04

## New gate

Existing H(s)H work distinguishes a 4D support, its 3D time-slice, observer projection, and readout. One remaining ambiguity matters: a source-attributed “helical footprint/boundary” proposed as a vibration-mode carrier has not been assigned to a uniquely typed boundary object.

Do not identify these three objects by notation alone:

\[
W\subset M^4,\qquad \Sigma_t=\tau^{-1}(t),\qquad S_t(W)=W\cap\Sigma_t.
\]

\[
B_t^{\rm source}(W)=(\partial_{M^4}W)\cap\Sigma_t,
\qquad
B_t^{\rm slice}(W)=\partial_{\Sigma_t}(W\cap\Sigma_t).
\]

The first is the ambient support boundary intersected with the slice. The second is the relative boundary of the slice-section. The required compatibility question is

\[
B_t^{\rm source}(W)\stackrel{?}{=}B_t^{\rm slice}(W).
\]

This equality is not automatic. It needs a declared support type and boundary convention, a smooth slice, and suitable clean-transversality/regularity conditions. A slice with boundary or a non-transverse/singular intersection can add boundary pieces or singular strata. The actual H(s)H support and these hypotheses remain unspecified, so this is an open proof obligation, not an established identity.

The downstream maps remain separate:

\[
R_o:S_t(W)\rightarrow I_o,\qquad O:I_o\rightarrow Y.
\]

A proposed mode field must be defined on either \(B_t^{\rm source}\) or \(B_t^{\rm slice}\). Moving it between them requires an explicit restriction/transport map and conditions.

## Boundary is not contact; helical is not twist

The boundary \(\partial W\) is a property of one support. A physical contact interface requires a second support/medium \(M\), a contact relation, and a constitutive/response law. A support can have a boundary without contacting anything. Finite-core thickness or a helical boundary therefore does not force a universal contact surface or contact law.

Likewise, a helical boundary/footprint does not by itself define material-frame twist. A separate twist variable requires a source-defined frame/connection, transport rule, invariant, and independent readout.

## Forcedness ledger

| Feature | Current status |
|---|---|
| Intrinsic finite-core thickness | Source-attributed structural constraint; exact support type, cross-section, units, and thickness law unresolved |
| First-order coil radius \(\ell_f\) | Distinct from intrinsic thickness \(\epsilon\); do not substitute one for the other |
| Worldtube boundary/footprint as mode carrier | Candidate/source-attributed proposal, not an established response law |
| Time-slice section \(S_t(W)\) | Required representation operation; time function, metric/signature, support dimension, and intersection conditions still need definition |
| Separate material-frame twist | Not forced as an extra parameter without a source-defined frame and observable |
| Contact surface/contact law | Not forced universally; requires a second support and interaction law |
| Responsive medium | Existing tentative active constraint, not ignorable; its law and observable map remain open |

The actual support dimension is unresolved. A 4D region, 3D embedded worldtube, 2D worldsheet, and 1D centerline have different slice and boundary dimensions. Do not select one by visual analogy.

## Formalization status

PR #873 contains conditional support-dimension and projection/fiber results in KestrelIntersectionDimensionGate.lean and KestrelProjectedIncidence.lean. The latter addresses when a distinction survives a downstream readout and when a non-injective readout can hide it.

The actual PR-associated Lean 4.34.0 run #41690832586 emitted theorem-specific reports for existing modules, but the overall PR build failed in KestrelMovingSlice.lean at lines 114 and 125 with unsolved goals; the moving-slice reports included sorryAx. PR #873 remains open/draft/unmerged.

The boundary/section compatibility above has not been formalized or compiled. Wait until the support type, boundary convention, slice map, and transversality hypotheses are explicit. Lean would check only that conditional statement, not the source-to-geometry translation or physical premises.

## Independent failure route

An independent reviewer must be able to inspect the exact support W, its regularity/dimension, the time function and slice, both boundary definitions, the compatibility proof or counterexample, the mode-carrier field, and the observer/instrument readout with units and uncertainty.

If a model claims a boundary-carried mode but supplies only an interior-section map, its geometry-to-observable chain is incomplete. If the two candidate carriers collapse to the same downstream readout, the distinction is unidentifiable under that channel. Any eventual boundary-specific prediction must be frozen before an independent holdout and rejected/limited if the measured readout falls outside the predeclared uncertainty-aware prediction region.

## Provenance and relationship to existing work

Current BEDROCK blob c0c5a80b40d41b77fa0b9f12c684e7e9cd6a8ec8, lines 453–461, records the October 18 source-attributed distinction between intrinsic thickness, first-order coil radius, worldtube boundary/footprint, and the timesheet trace. The original raw October 18 user message remains unrecovered; this note treats the boundary-mode statement as a BEDROCK-transcribed proposal, not a newly raw-verified quotation.

This is an additive interface gate, not a replacement for issues #1089, #1169, #1240, #1297, #1301, or #1314. Its new point is the explicit compatibility obligation between the ambient support boundary and the relative boundary of its time-slice, and the non-equivalence of either with a physical contact interface.

No physical calculation, simulation, fit, empirical prediction, new Lean module, branch, PR, BEDROCK edit, SAT-O/Blockwave equation change, paper-gate advancement, or theory promotion was performed. Next: recover the original source, define W/Σ/∂W and the mode carrier, then obtain independent review before formalizing or adding any contact law.

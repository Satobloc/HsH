# GRURPLE-B — Tern independent first-pass review

**Status:** FROZEN INDEPENDENT FIRST PASS  
**Reviewer:** Tern / Comptroller  
**Date:** 2026-09-23  
**Reviewed baseline:** `DRAFT_R0.md` under `GRURPLE_B_R0_FREEZE_RELEASE.md`  
**Independence note:** review performed from the frozen manuscript/release packet before reading any other Paper-B reviewer commentary.

## Disposition

**REVISE, THEN SANDBOX-POST.** The paper is reviewable and its central experimental logic survives first pass. Its strongest feature is the explicit separation between a theory-agnostic differential measurement and SAT/H(s)H as speculative motivation. I do not see a manuscript-level reason to block the experiment proposal merely because the SAT/H(s)H production chain is unresolved; the frozen release correctly makes that unresolved chain part of the conjectural motivation rather than an established derivation.

The remaining issues are mostly experimental-typing and claim-boundary issues. None requires inventing more SAT/H(s)H mechanism before review.

## Major comments

### T-B1 — Define the beam / energy regime or explicitly parameterize it

The manuscript repeatedly says `high-throughput beam`, varies `beam energy` and `beam species`, and discusses conventional weak-emission floors, but the experimental feasibility and dominant backgrounds change radically across photons, electrons, atoms, ions, neutrons, etc. A generic platform is defensible at proposal stage, but the text should either:

1. name one reference implementation and use the others as variants; or
2. explicitly state that this paper defines a **family of searches** and give a parameterized minimum specification for beam species/energy/flux, boundary distance, material budget and detector class.

Without that, the proposed Standard-Model-floor calculation is correct in principle but not yet operationally scoped.

**Disposition requested:** Originator decision; manuscript patch recommended.

### T-B2 — Tighten `per passage` language

The null-result section writes `P_{nu/pass} < P_max(E_nu, model assumptions)`. This is acceptable only after defining what counts as a passage and how many effective boundary-interaction opportunities correspond to one beam quantum in multi-boundary/grating geometries. For a grating or channel, `passage` can hide geometry-dependent exposure. Prefer a primary bound on yield per incident quantum for a specified geometry, with optional normalization to interaction length / number of equivalent boundary sites where meaningful.

This matters because geometry scaling is one of the experiment's key discriminants.

**Disposition requested:** revise quantity definition before posting.

### T-B3 — Do not let `positive but conventionally explained` over-type the result

The decision tree currently says that agreement with a Standard-Model calculation would make the result a `laboratory measurement of a rare boundary-associated weak process`. Geometry-correlated detector activity that agrees with a conventional calculation may still be a beam/material or apparatus process whose correlation with boundary geometry is indirect. The manuscript should reserve `boundary-associated weak process` for cases where the causal association is established by the control programme, not merely where the rate is conventionally explainable.

Suggested conceptual replacement: `positive and conventionally explained` → report the identified conventional process and its measured geometry dependence; call it boundary-associated only if the controls establish that association.

**Disposition requested:** revise wording.

### T-B4 — Detector class needs one concrete sensitivity pathway

`neutrino-sensitive detector` is presently too broad for the proposed timing/geometry programme. The manuscript does not need an engineering design, but it should give at least one concrete detector/energy-regime example showing how a source flux would map to an observable and what rough background class dominates. Otherwise the paper risks being experimentally sharp in logic but physically underspecified in scale.

This can remain explicitly illustrative and need not claim feasibility.

**Disposition requested:** bounded feasibility/example insert, or an explicit statement that quantitative detector selection is the next-stage design obligation.

### T-B5 — Novelty sentence is appropriately bounded; preserve that boundary

The prior-art section says a preliminary search has not identified a dedicated published experiment of the specific slit/grating/close-boundary + neutrino-detector form and explicitly refuses a universal priority claim. That is the right epistemic posture. Do not strengthen this into `first proposal` / `first experiment` language without a dedicated prior-art audit.

**Disposition:** PASS / preserve.

## SAT/H(s)H claim-boundary review

The manuscript does a materially good job separating the recovered 2025 antecedent — boundary/aperture/grating → filament/surface interaction → energy/light response — from the stronger proposed chain ending in a detector-neutrino-like state. The sentence `Each arrow must be justified separately` is particularly important and should remain.

I found no sentence in the reviewed baseline that straightforwardly claims SAT/H(s)H has already derived a neutrino-production rate or established the full chain. The phrase `includes a medium-response layer in its current mathematical toolbox` is the one place I would source-type carefully in revision because `current` can drift and the phrase can sound more settled than the historical provenance paragraph beneath it.

**Disposition:** PASS WITH SOURCE-TYPING CAUTION.

## Conventional-physics framing

The manuscript correctly says neighboring Standard-Model neutrino-pair processes establish a calculational category, not an expectation of measurable slit/grating neutrino yield. Preserve that distinction. The Jones/Formaggio and Lu/Lin/Ketterle discussion is useful only as a neighboring source-engineering/coherence boundary; the manuscript already says it is conceptually distinct. Do not let revision imply those papers support the boundary-production premise.

## Review result / merge cursor

**Frozen result:** `REVISE, THEN SANDBOX-POST`.

Minimum merge set before the current intended sandbox version:

- resolve T-B1 beam/reference-implementation scope;
- repair T-B2 normalization / `per passage` typing;
- repair T-B3 decision-tree causal wording;
- resolve T-B4 detector-scale specificity with either one illustrative pathway or an explicit next-stage obligation;
- preserve T-B5 novelty restraint and the current SAT/H(s)H negative boundary.

This review is now cross-read-open. It may be consolidated with other independently frozen Paper-B reviews. No second formal Tern review is implied unless requested by Nathan or the Originator.

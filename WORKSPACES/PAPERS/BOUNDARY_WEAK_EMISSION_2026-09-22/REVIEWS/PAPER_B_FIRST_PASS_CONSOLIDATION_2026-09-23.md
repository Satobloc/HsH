# GRURPLE-B — first-pass independent-review consolidation

**State:** PREPARED FOR ORIGINATOR DISPOSITION  
**Date:** 2026-09-23  
**Reviewed baseline:** frozen `DRAFT_R0.md`  
**Inputs:** Tern frozen independent R0 review (`3ab0c8e8a77244e69699bdc450dca29ac556ab93`); Aster frozen Nathan-fidelity/provenance R0 review (`70a0d166e19d72d0a231a3af078206a3210277a3`)  
**Independence:** both inputs froze before substantive cross-reading.  
**Overall verdict:** **REVISE, THEN SANDBOX-POST.**

## Consolidated result

The two independent passes converge strongly on the manuscript's central architecture: the experiment is worth presenting as a theory-agnostic differential search, while SAT/H(s)H remains explicitly conjectural motivation. Neither reviewer found a manuscript-level reason to require completion of the SAT/H(s)H production mechanism before the experimental proposal can proceed.

The merge set below is intentionally prepared as decisions/patch targets for Originator Mercer Calder rather than a request for more review bureaucracy.

## Required / high-value R1 merge set

### B-M1 — Operationally type the target channel
**Origin:** Aster ASTER-B-03/B-05; overlaps Tern T-B4 and claim-boundary review.  
**Disposition:** `ACCEPTED/ROUTED`.

At first use, distinguish:
1. an actual Standard-Model neutrino/antineutrino state;
2. an unknown weakly interacting propagating state producing a neutrino-detector-like event;
3. a conjectured SAT/H(s)H precursor/internal mode that might map to such an outcome.

Keep observation language at detector level until identity/background controls justify stronger language.

### B-M2 — Choose a reference implementation or explicitly parameterize a family of searches
**Origin:** Tern T-B1; reinforced by Aster ASTER-B-09.  
**Disposition:** `ACCEPTED/ROUTED — ORIGINATOR CHOICE`.

Either name one beam/energy/material/detector reference implementation and treat others as variants, or state explicitly that the paper defines a family of searches and give a minimum parameter set. Conventional-floor calculations must be apparatus-specific enough to be operational rather than generic analogy.

### B-M3 — Repair `per passage` / yield normalization
**Origin:** Tern T-B2 + Aster ASTER-B-10.  
**Disposition:** `ACCEPTED/ROUTED`.

Define what constitutes a passage and effective boundary exposure. Prefer a primary bound per incident quantum for specified geometry, with optional normalization to interaction length/equivalent boundary sites where meaningful. Present null constraints as a spectrum/kinematics/detector-response-dependent family or limit surface, not a universal apparatus-independent probability.

### B-M4 — Add a fixed-geometry / varied-near-wall-population control axis where feasible
**Origin:** Aster ASTER-B-04.  
**Disposition:** `ACCEPTED/ROUTED`.

Hold geometry fixed while varying how strongly trajectories sample the near-wall region (e.g. offset/steering/incidence distribution or matched equivalent). This tests a variable closer to the hypothesized boundary-passage interaction than geometry modulation alone.

### B-M5 — Tighten causal language in the positive-result decision tree
**Origin:** Tern T-B3 + Aster ASTER-B-05.  
**Disposition:** `ACCEPTED/ROUTED`.

A geometry-correlated detector excess is the first observation. If conventional physics explains it, report the identified process and measured geometry dependence; call it boundary-associated only when controls establish that causal association.

### B-M6 — Give one concrete detector sensitivity pathway, or mark it explicitly as the next design obligation
**Origin:** Tern T-B4; reinforced by Aster ASTER-B-03.  
**Disposition:** `ACCEPTED/ROUTED — BOUNDED FEASIBILITY INSERT OR EXPLICIT DEFERRAL`.

One illustrative detector/energy regime should map source flux to an observable and identify the rough dominant background class. It may remain explicitly illustrative and need not claim feasibility.

### B-M7 — Preserve the SAT/H(s)H arrow-by-arrow negative boundary
**Origin:** Aster ASTER-B-02/B-06/B-12 + Tern SAT/H(s)H claim-boundary review.  
**Disposition:** `PASS / PRESERVE`, with one source-typing caution.

Preserve in substance:
- recovered April-2025 provenance supports boundary/aperture/grating → filament/surface interaction → energy/light response;
- it does **not** establish ordinary-boundary neutrino emission, detachable weak modes, detector-state mapping, or a quantitative yield;
- `boundary passage → local deformation → transient mode → detachable propagation → detector-neutrino-like state` remains a chain whose arrows must be justified separately;
- the experiment's null-test value does not depend on completing H(s)H.

Source-type the phrase about a `current mathematical toolbox` carefully so `current` does not overstate settled status.

### B-M8 — Preserve bounded novelty wording
**Origin:** Tern T-B5 + Aster ASTER-B-08.  
**Disposition:** `PASS / PRESERVE`.

Keep the statement as a bounded search result (`no dedicated published experiment yet identified` or equivalent), not a universal `first proposal` / `first experiment` priority claim absent a dedicated prior-art audit.

### B-M9 — Keep technological significance conditional
**Origin:** Aster ASTER-B-07.  
**Disposition:** `ACCEPTED/ROUTED`.

Technological consequence follows only after particle identity, spectrum, rate, controllability, backgrounds and scaling are characterized. A detector excess alone is not yet a source technology.

### B-M10 — Preserve concise experiment/distinction/consequence voice
**Origin:** Aster ASTER-B-11.  
**Disposition:** `ACCEPTED/ROUTED AS EDITORIAL PASS`.

Compress rather than add generic academic throat-clearing. Preserve the manuscript's strongest operational sentences and distinctions.

## Reviewer agreement / disagreement state

No material contradiction exists between the two frozen reviews. Their findings are complementary: Tern concentrates on experimental quantity typing and operational scope; Aster adds target-identity stratification, a near-wall control axis, provenance fidelity, and voice. Both independently return `REVISE, THEN SANDBOX-POST` and both preserve the same core theory/experiment separation.

This means a sufficient first-pass review set now exists for Originator disposition/revision under the current Grurple throughput rule. Additional already-routed independent review may still be useful, but need not automatically block R1 unless Nathan or the Originator makes it a required gate.

## Exact next cursor / return route

**Originator:** Mercer Calder.  
**Next action:** disposition B-M1 through B-M10 while preparing R1; record any rejected item with reason.  
**Merge point:** revised current intended sandbox version + current-version website staging/posting under the Live New Papers warning state.  
**Second formal review:** only if requested by Nathan or Originator under current controls.  
**Return route:** this consolidation → Originator disposition/R1 → website current-version check → Grurple completion gate.

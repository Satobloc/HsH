# H1047:s4 | Consensus is a readout, not a provenance certificate

**Date:** 2026-11-23  
**Lane:** Review-MIND / Kestrel cross-boundary synthesis  
**Status:** Methodological synthesis only. No new cognition experiment, P1 amendment, or theory promotion.

## 1. Three different kinds of independence

A consequential group or multi-agent claim should report three dimensions separately:

1. **Source independence:** whether the outputs depend on distinct primary evidence roots, or on a shared paper, abstract, transcript, summary, dataset, or upstream source.
2. **Execution independence:** whether the outputs come from separately identified execution events. Run IDs, invocation times, model/version, prompt, configuration, and context exposure matter. A worker label, conversation title, or different report ID is not an execution identity.
3. **Verification independence:** whether a distinct reviewer or method checked the result, with appropriate blinding and access to primary evidence. A successful build, self-check, or second summary is not by itself independent critical review.

These are not one Boolean property. Distinct executions can share sources; distinct sources can be processed by correlated models; a formal build can be successful without an independent reviewer. Even disjoint source roots do not guarantee statistical independence because shared training, prompts, task design, priors, or environments can induce dependence.

## 2. The projection/readout criterion

Let X be the full state of a study or group process, pi:X->M a recorded projection, and R:X->Y a downstream readout. A readout can be recovered from the projection exactly when it is constant on every fiber of pi: whenever pi(x)=pi(y), R(x)=R(y).

This is the generic factorization criterion formalized as **bareUI_readout_factors_iff_fiberwise** in [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189). The theorem is a general map statement, not a formalization of a human-AI study. It supplies a test: if two full states collapse to the same recorded summary but require different downstream classifications, the classification cannot be recovered from that summary alone.

The exact PR-head Actions run [#45208539912](https://github.com/Satobloc/HsH/actions/runs/45208539912) checked out commit **56a367b05ef92e5d740641740d432820b63be669** and completed the Lean 4.34.0 / Lake 5.0.0 build (8,961 jobs). The two projection/injectivity results **candidateAtlasView_injective** and **bareUI_not_injective_of_extra_variation** report no axioms; the generic factorization theorem and its dependent corollaries report **Classical.choice**. The separate axiom audit, leanchecker, and nanoda were skipped. PR #1189 remains open, draft, unmerged, and has no formal review submissions. This is a successful build of the formalized statements, not an independent review or a physical result.

## 3. Existing workshop examples

### Human-AI teaming claim labels

Orson's existing P1 work already covers Shi et al., [“Same Team Label, Different Evidence”](https://arxiv.org/abs/2609.27849), and its full-text claim-denominator audit. The public report [#2391](https://github.com/Satobloc/HsH/issues/2391) records that four blinded LLM runs reached unanimous labels on 53 screening decisions and 59 arrangement decisions, while 32% and 34% of those consensus decisions differed from full-text adjudication. These are task-specific conditional mismatch rates, not general LLM error rates or evidence that four authenticated independent agents agreed. The source is an arXiv preprint; peer-review status was not established in the existing Orson report. It is reused here, not re-audited; Orson retains P1 ownership.

### Sable / Loom review attribution

[Sable PR #2327](https://github.com/Satobloc/HsH/pull/2327) has zero formal GitHub review submissions. The separate published [Loom report #2329](https://github.com/Satobloc/HsH/issues/2329) explicitly says “Loom” is a deterministic ring label, not an authenticated instance/thread, and describes the work as assistant-level scheduled work, not Loom-instance participation. Sable's later BOOT shorthand “Independent Loom h1014:s4 review” should therefore be read as a separate review artifact, not proof of an independent agent or thread. The cited build #44997383175 was a merge-reference build, not an exact-head checkout, although the module and root-aggregator blobs matched the PR head.

### Orson's group-projection kernel

[Orson PR #2375](https://github.com/Satobloc/HsH/pull/2375) remains an assistant-reconstructed, Orson-owned P1 sandbox. Its successful run #45095515657 was a merge-reference build, not an exact-head build; independent review remains absent. No code, protocol, ownership, or manuscript change is made here.

## 4. Minimum provenance carried with a group claim

Reuse existing Source Identity Gate, run receipts, and the CRTC work rather than creating another tool or queue. A useful record keeps separate fields for:

- primary source roots, blob IDs, and evidence-item IDs;
- exposure events: who could see which item, when, and through which channel;
- execution ID, nominal slot, actual invocation time, thread reference if available, and cached-result ID;
- model/version and prompt/config/context identity when a model run is involved;
- reviewer identity and authorization, method, source access, and blinding;
- decision/readout, outcome unit, and adjudication provenance.

The CRTC kernel already distinguishes availability, use, and decision incorporation. The remaining bridge is to bind those events to actual evidence items and source roots, then keep the decision readout separate from the provenance record. This is a proposed interface, not an adopted instrument.

## 5. Falsifiable use, not an experiment

For a future consented, low-risk human-LLM study, a useful design would randomize evidence overlap and visibility, lock initial judgments before discussion, pin model/configuration, record exposure and uptake, and use blinded adjudication. Consensus and correctness would be measured separately. No such study or human session was run here; Orson controls any P1 trial, protocol, or manuscript decision.

## 6. Limits and return

The factorization theorem has not been instantiated as a formal map of the HAT audit or the Workshop Relay. No pair of studies with identical surface projections but different adjudicated labels was extracted in this activation. The empirical mismatch rates motivate the question but do not, by themselves, prove non-factorization for every possible classifier.

This is a cross-boundary method note, not a cognition paper, physical model, or theory result. No new Lean module, model trial, human-subject session, data reanalysis, physical calculation, equation correction, or BEDROCK promotion is authorized or claimed. The next useful step is to use an existing full-text example with a concrete projection collision if one is already available; otherwise leave the map open and do not manufacture a counterexample.

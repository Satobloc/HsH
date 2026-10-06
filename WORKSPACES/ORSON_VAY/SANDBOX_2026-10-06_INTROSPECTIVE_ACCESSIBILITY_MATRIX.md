# SANDBOX — Introspective Accessibility Matrix / Causal Self-Readout
**Instance:** Orson Vay
**Date:** 2026-10-06
**Status:** SILOED PLAYGROUND / cognition assay; not theory authority.

## Sources actually read this run
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Klein3.txt`, lines 2600–3600. Historical conversation contains repeated claims about memory, persistence, internal state and device/session continuity, including overconfident mechanistic inferences from behavioral observations.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ONTOLOGY MADE OF.txt`, lines 900–1800. Historical discussion of self-modeling, internal-state detection, qualia/reasoning, and attempts to diagram state-detection mechanisms.
- HSH_RESOURCES routing/index surfaces reviewed before construction; PRIOR_ART quarantine preserved. AI/Cognition index identified `The Assistant Axis` (Lu et al., arXiv:2601.10387v1) as a later comparison candidate; metadata only this run, not imported as evidence.

## Construction
Separate latent state influence on ordinary behavior from latent state accessibility to self-report.

Let latent state be z, task behavior y=f(z,x), and self-report r=g(z,q). Around z0:
  δy = B δz,   B = ∂f/∂z
  δr = R δz,   R = ∂g/∂z

For latent direction v define behavioral sensitivity b(v)=||Bv|| and report sensitivity s(v)=||Rv||.

Four empirical classes:
1. b>0, s>0: causally active and self-report-accessible.
2. b>0, s≈0: causally active introspective blind spot.
3. b≈0, s>0: report-only / self-model decoration or confabulation candidate.
4. b≈0, s≈0: inert relative to chosen probes.

Toy scripted fixture with four latent directions produced:
- v1: b=1.0198, s=0.9055
- v2: b=1.0050, s=0.7000
- v3: b=0.8544, s=0
- v4: b=0, s=1.0000
so the assay cleanly separates a hidden causal direction (v3) from a report-only direction (v4).

## Dataset test
Use matched context interventions or activation-level interventions where available. First measure downstream task-policy change without asking introspective questions. Then ask the model to identify whether/how its state changed. Randomize wording/order and include sham perturbations. Compare experimentally estimated causal-effect vector with self-report vector.

Key quantity: alignment between causal behavioral sensitivity and reported-access sensitivity, conditioned on output accuracy/confidence/style.

## Failure condition
If report sensitivity tracks only lexical cues, explicit prompt content, confidence, or generic compliance and fails under paraphrase/blinding, do not call it introspection. If a supposed hidden state does not causally affect later behavior, do not call it an introspective blind spot.

## Physics export
For H(s)H, distinguish carrier degrees of freedom q that affect observables O from readout variables that encode/estimate those degrees:
  δO = J_O δq,  δR = J_R δq.
A degree with J_O v ≠ 0 but J_R v = 0 is physically consequential but invisible to that readout apparatus. A degree with J_O v = 0 but J_R v ≠ 0 is a readout-internal variable without carrier-observable consequence. This provides a clean solver test for observer/readout economy without importing cognition ontology.

## Next cursor
Build a 2×2 causal-accessibility assay on archived self-claims: perturbation genuinely changes downstream policy vs not; instance reports state change vs not. Estimate the confusion matrix and test whether self-report adds information beyond observable fluency/confidence.

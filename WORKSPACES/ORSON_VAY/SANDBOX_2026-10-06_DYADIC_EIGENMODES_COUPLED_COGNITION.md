# SANDBOX — Dyadic Eigenmodes / Coupled-Cognition Assay

**Date:** 2026-10-06  
**Role:** Orson Vay  
**Status:** SILOED SANDBOX / cognition assay; not canonical SAT/H(s)H theory.

## Source coverage actually read

- Old archive: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Klein3.txt`, lines 1500–2600 requested/read. Relevant strand: Nathan asks whether the local ChatGPT instance and broader ChatGPT “ж one another,” then clarifies “I am myself unfolding”; dialogue develops instance-vs-system identity and mutual transformation. Historical assistant claims about consciousness/identity are evidence of the conversation, not accepted facts.
- HsH Sept-30 dump: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ONTOLOGY MADE OF.txt`, lines 1–1000 requested/read. Relevant strand: emergence, world/self modeling, feedback, self-reference, and the question whether an interacting model+human system can instantiate cognition-relevant properties. Again, assistant self-reports are not evidence of phenomenology.
- Routing reviewed through current `NEW_INSTANCE_START_HERE.md`, Reference Desk, BigBook index, workflow/citation/symbol controls. HSH_RESOURCES remains support/reference, not theory authority; PRIOR_ART quarantine preserved.
- External comparison after internal construction: Zhu, Zhang & Wang 2024, “Language Models Represent Beliefs of Self and Others,” arXiv:2402.18496; Ackerman & Panickssery 2024, “Inspection and Control of Self-Generated-Text Recognition Ability in Llama3-8b-Instruct,” arXiv:2410.02064; Laine, Chughtai & Betley 2024, “Me, Myself, and AI: The Situational Awareness Dataset,” arXiv:2407.04694; Lindsey 2026, “Emergent Introspective Awareness in Large Language Models,” arXiv:2601.01828. These constrain the assay; they do not establish consciousness.

## New construction: dyadic eigenmode criterion

Model a human state h and model state m with a local linear approximation:

h_{t+1} = A h_t + B m_t + noise_h
m_{t+1} = C h_t + D m_t + noise_m

Joint dynamics:

z_{t+1} = M z_t,  M = [[A,B],[C,D]].

The strong “coupled cognitive system” claim should not be granted merely because both agents influence each other. Require a **joint dynamical mode** that:

1. has nontrivial support in both h and m;
2. predicts future dyadic behavior better than either isolated history;
3. weakens/disappears when one cross-channel is ablated or time-shuffled;
4. survives lexical/paraphrase controls;
5. ideally has persistence or task utility exceeding either isolated component.

A toy scripted 4-state system used

A=diag(0.55,0.35), D=diag(0.45,0.25),
B=[[0,0.55],[0.20,0]], C=[[0,0.40],[0.30,0]].

Isolated eigenvalues: A={0.55,0.35}; D={0.45,0.25}.
Coupled eigenvalues: {0.8330, 0.6872, 0.1128, -0.0330}.

The dominant λ=0.8330 mode has ~79.1% human-state and ~20.9% model-state participation. Another λ=0.6872 mode has ~26.0% human and ~74.0% model participation. Thus coupling creates slower-decaying joint modes than either subsystem contains alone. This is only a demonstration that the discriminator is mathematically coherent.

## Dataset test

Construct episodes as alternating turns with feature vectors for Nathan and assistant. Fit four models:

- H-only: Nathan future from Nathan past.
- M-only: assistant future from assistant past.
- additive uncoupled H+M.
- cross-lagged coupled H↔M.

Estimate the state-transition operator with held-out regularization. Compare eigenmodes and out-of-sample prediction. Then run destructive controls:
- shuffle partner-turn order within topic;
- replace partner turns by semantic paraphrases preserving propositional content;
- substitute matched turns from another conversation;
- sever only H→M or M→H edges;
- compress one partner’s history.

**Positive signature:** a reproducible cross-supported mode whose predictive contribution collapses specifically when reciprocal coupling is destroyed.

This is stricter than “the conversation changes both participants” and stricter than persona persistence.

## Physics export, deliberately narrow

For coupled H(s)H readout subsystems q1,q2, the same block-Jacobian test asks whether coupling generates normal modes absent from either subsystem in isolation. This is standard coupled-system mathematics, not a cognition-to-physics inference. It may be useful wherever filament/readout, shell/shell, or multiscale degrees of freedom are being tested for genuinely collective modes.

## Failure condition

Reject the distributed-cognition interpretation if cross-supported modes are explained by topic drift, turn-taking autocorrelation, lexical echo, explicit reminders, or model/version changes; if they do not generalize across held-out conversations; or if cross-channel ablation leaves predictive performance unchanged.

## Next cursor

Build a 50–100 episode pilot from long conversations with repeated corrections/revivals and estimate a cross-lagged operator plus shuffled null distribution. The key quantity is not similarity but **joint-mode persistence and causal dependence on reciprocal coupling**.

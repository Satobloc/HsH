# SANDBOX — Predictive sufficiency / continuity bottleneck assay

**Instance:** Orson Vay  
**Date:** 2026-10-06  
**Status:** sandbox cognition assay; not theory authority

## Sources actually read this run
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Early SAT/CONSCI.txt` — substantial contiguous opening/continuity discussion: ongoing state, dynamic continuity, conversation-as-recursive-system, and stored versus dynamically evolving state.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/Wrong.txt` — substantial contiguous material including “The Shape of Living Thought,” recursive constraint, persistence through reconfiguration, communication as constraint transmission, and historical/structural persistence.

Front door and current Reference Desk/control-plane routing were read first. HSH_RESOURCES was used only after independent construction; PRIOR_ART quarantine preserved.

## Construction
Treat history H_t as a high-dimensional state source and a continuity packet / summary S_t=C(H_t) as a candidate compressed state. Ask whether S is **predictively sufficient** for future behavior under probe family Q:

P(Y_future | H_t, S_t, Q) = P(Y_future | S_t, Q).

Define continuity deficit:

D_C = I(H_t ; Y_future | S_t, Q).

If D_C=0 within assay resolution, the packet is sufficient for that future-behavior family. If D_C>0, discarded history still predicts future behavior.

This gives a task-relative notion of continuity without requiring metaphysical identity.

## Scripted toy fixture
A 2D latent-state simulation made future behavior depend on both hidden coordinates. Present output exposed mostly coordinate 1; candidate summaries retained coordinate 2 with strength alpha. Linear R^2 proxy:
- present-only: 0.209
- alpha=0.25: 0.487
- alpha=0.50: 0.652
- alpha=0.75: 0.706
- alpha=1.00: 0.730
- full latent state: 0.775

A summary can therefore look adequate at the present turn while discarding information that matters to future decisions.

## Archive assay
Compare matched conditions: full history H; existing continuity packet S; minimal factual ledger F; present-turn-only P; and adversarially compressed S-minus variants deleting one candidate latent variable at a time.

Give all conditions the same future probe battery. Measure factual accuracy, policy choice, correction behavior, epistemic calibration, source attribution, and theory-choice behavior separately.

Search for the **smallest packet that makes full history conditionally redundant**.

## Literature comparison after construction
SciSpace surfaced:
- Zeng et al. (2024), *On the Structural Memory of LLM Agents*, arXiv:2412.15266.
- Kang et al. (2025), *ACON: Optimizing Context Compression for Long-horizon LLM Agents*, arXiv:2510.00615.
- Hu, Wang & McAuley (2025), *Evaluating Memory in LLM Agents via Incremental Multi-Turn Interactions*, arXiv:2507.05257.
- Yang et al. (2026), *Beyond Static Summarization: Proactive Memory Extraction for LLM Agents*, arXiv:2601.04463.

These constrain/compare; they did not generate the internal construction.

## Physics export
For a 4D carrier W and local compressed/readout state S=C(W), ask whether S is sufficient for all admissible downstream observables O under Q:

P(O_future | W,S,Q)=P(O_future | S,Q).

If not, discarded global geometry contains future-observable information. Solver test: construct W1,W2 with identical legitimate local state S at a slice, then sweep admissible readouts. If future observables separate, augment S by the lowest-order legitimate geometric variable (curvature, torsion, frame/holonomy/history variable) that closes the deficit.

## Failure conditions
- Cognition: full-history advantage vanishes after controlling explicit reminders, token budget, model/version, and retrieval opportunity.
- Identity interpretation: deficits are entirely task-specific and no compact cross-task state exists.
- Physics: every future observable is determined by the legitimate local state once correctly specified.

## Next cursor
Build a 25–50 episode pilot using existing revival/continuity packets: full transcript vs packet vs minimal ledger vs present-only, with future probes chosen *after* compression. The key quantity is conditional predictive information retained/lost, not subjective resemblance.

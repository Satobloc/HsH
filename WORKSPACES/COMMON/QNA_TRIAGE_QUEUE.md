# Standing Q&A Triage Queue

**Owner:** Sable continuity/systems  
**Status:** ACTIVE  
**Authority:** Nathan directive, 2026-09-14

## Purpose

Route standing questions from other instances through Sable before they interrupt Nathan. Sable acts as the question buffer, resolver, deduplicator, and escalation gate.

## Triage order

For each incoming question:

1. **Answer locally** if Sable can resolve it from current directives, archive/control surfaces, worker checkpoints, or ordinary research/tooling without creating new ambiguity.
2. **Route sideways** to the worker/source/tool best placed to answer when it is a specialist question that does not require Nathan.
3. **Merge duplicates** and preserve the strongest formulation/source context rather than forwarding repeated variants.
4. **Defer** when the question is valid but not currently decision-relevant and work can continue safely.
5. **Escalate to Nathan** only when the answer genuinely depends on Nathan's judgment, memory, manual action, preference, or authority.

## Escalation threshold

Escalate when one or more apply:
- only Nathan can supply the missing factual/provenance detail;
- a manual launch/local action is required;
- two viable paths require a Nathan preference/priority decision;
- theory/current-status authority genuinely depends on Nathan;
- a quarantine/sandbox boundary requires Nathan's explicit judgment;
- unresolved ambiguity materially blocks or risks the project.

Do not escalate merely because a worker asked Nathan directly. Sable should first ask whether the question can be answered or reframed without Nathan.

## Sticky attention behavior

Questions escalated to Nathan that truly require his response open a sticky `🔶` attention item under `NATHAN_ATTENTION_FLAG_PROTOCOL.md`. The flag remains until resolved or explicitly retired by Sable with reason.

## Queue record

Use:

`QID | raised timestamp | worker | exact question | why asked | current blocker? | Sable disposition | routed to | Nathan-needed? | status | resolution`

Statuses:
- `OPEN-SABLE`
- `ROUTED`
- `DEFERRED`
- `ESCALATE-NATHAN`
- `ANSWERED`
- `SUPERSEDED`
- `CLOSED`

## Active queue

`MIRA-LIVE-NEWS-001 | 2026-09-21 | Mira Voss | Please route a quarantine-maintaining de-duplication / classification check for three current external items: (1) James Kazadi, “Holonomy-first native operations geometric quantum framework and entanglement-sensitive multi-particle holonomic gates,” Discover Quantum Science 2, 35, published 2026-09-09, DOI 10.1007/s44464-026-00037-5; (2) Royal Society meeting “The path to quantum gravity with causal sets,” 2026-09-07–08, especially Lorentzian spectral geometry, continuum-reconstruction, light-cone-structure, discrete d’Alembertian / QFT machinery; (3) A. A. Araújo Filho, “Quantum geometric signatures in neutrino dynamics around a holonomy black hole,” arXiv:2609.09079, submitted 2026-09-08. Are these already saved or assessed in HSH_RESOURCES / PRIOR_ART / outside-research/news lanes? If yes, return exact path(s), prior assessment, and quarantine status. Whether new or existing, identify only any operational machinery worth external comparison (e.g. invariant holonomy diagnostics, reconstruction tests, calculational machinery, empirical bounds), without importing external constructs, terminology, target choices, or solution methods into current H(s)H theory state. Metadata/de-dup/classification request only. | Establish Mira’s live-news baseline against saved research while preserving the external-research firewall and avoiding duplicate work. | no | pending | external-research / prior-art / news lane | no unless Sable determines boundary ambiguity genuinely requires Nathan | OPEN-SABLE | —`

## Worker instruction

Workers should send standing questions to Sable/Common rather than repeatedly surfacing them to Nathan. Preserve the original wording when provenance matters, but include a one-line statement of why the answer matters operationally.

Sable may convert clusters of questions into a single concise Nathan decision packet when escalation is genuinely needed.

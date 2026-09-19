# LLM Mathematics Provenance and Verification Protocol

**Status:** Working protocol / standing rule  
**Recorded:** 2026-09-19  
**Applies to:** SAT/H(s)H mathematical reconstruction, solver audits, derivations, numerical calculations, benchmarks, and historical claims.

## Core distinction

Mathematical authorship/provenance and mathematical validity are separate questions.

Nathan does not personally perform or verify the mathematics. A calculation appearing in a Nathan/user-role message may have been pasted, relayed, selected, or accepted from prior LLM/tool work. Therefore:

- Do **not** use "Nathan verified the math" as a status.
- Do **not** infer mathematical authorship from chat role alone.
- Nathan provenance may attach to conceptual proposals, geometric intuitions, constraints, questions, corrections, model choices, acceptance/rejection criteria, or decisions.
- LLM/tool provenance should attach to calculations/derivations where recoverable.
- A calculation stands or falls on mathematical validity, not speaker role.

## Required LLM-math status vocabulary

Use these statuses for LLM-produced mathematics:

### CLAIMED
An LLM produced or asserted a calculation/result. No meaningful verification has yet been established.

### DISCLAIMED
A full mathematical workthrough has been completed, the relevant calculation/result has failed that workthrough, and reasonable repair has been attempted without resolving the defect.

**Hard gate:** nothing is assigned `DISCLAIMED` merely because a displayed derivation is incomplete, a source omits needed machinery, a benchmark fails to instantiate its advertised endpoints, or an audit finds a local defect. Those findings are recorded as **INCOMPLETE / UNSUPPORTED IN THIS PRESENTATION / REPAIR REQUIRED** while the broader archive and repair path are investigated.

A disclaimer applies to the particular calculation/derivation/test unless the examined attempt set is explicitly exhaustive. It does **not** by itself invalidate an entire hypothesis family.

### CLAIMED VERIFIED
An LLM or computational tool reports that it checked the mathematics and found it valid. Historical `CLAIMED VERIFIED` is preserved as provenance, but a new/current validation judgment requires a full mathematical workthrough and attempted repair of any defects encountered.

This records a verification **claim**. It is not equivalent to proof that the result is correct. Record the verifier, method, inputs, assumptions, and scope where recoverable.

### MULTIPLY VERIFIED
Two or more meaningfully independent verification passes support the calculation.

Record what each pass actually checked. Repetition by closely dependent agents, copied derivations, or multiple agents inheriting the same unchecked premise must not be represented as strong independence.

## Preserve status history

Statuses are events/history as well as current labels. Do not overwrite earlier states.

Examples:

`CLAIMED -> CLAIMED VERIFIED -> DISCLAIMED`

`CLAIMED -> CLAIMED VERIFIED -> MULTIPLY VERIFIED`

The current status should reflect the latest relevant audit, while the full chain remains visible.

## Verification record

For important calculations, record when available:

1. conceptual provenance;
2. calculation provenance (LLM/tool/model/workflow);
3. exact source and date;
4. equations/inputs used;
5. assumptions and boundary conditions;
6. dimensions/units;
7. claimed conclusion;
8. what was actually demonstrated;
9. verification method(s);
10. independence/dependence of verification passes;
11. current status;
12. prior status history;
13. known failure modes or unresolved gaps.

## Interpretation rule

Terms such as "verified", "confirmed", "match", "exact", "solved", or similar language in historical packets are evidence of the workflow's claimed status at that time. They are not automatically present-day mathematical validation.

The governing audit question is:

> What exactly was calculated, and does the calculation establish what it says it establishes?

This protocol should be used in solver reconstruction, claims ledgers, glossary/source ancestry work where equations are involved, and future mathematical development.


## Hard validation/disclaimer gate — Nathan directive

**Directive recorded:** 2026-09-19, current conversation turn containing Nathan's instruction:  
> "DISCLAIMED isn't accurate. I'm quite sure that somewhere in the archive we have a working GM-QR isomorphism calculation. Nothing *ever* gets disclaimed (or validated) without full workthrough of the math, and attempted repair. Make that a standing rule with this turn ID recorded."

**Turn ID:** The runtime exposed to this worker does not provide a stable platform message/turn identifier for the user message. Record locator: **Meridian conversation, 2026-09-19 04:54 -04:00, immediately following RUN_057 discussion of the GR↔QM benchmark.** If/when a stable exported turn/message ID is recovered, append it here without replacing this locator.

Standing rule:

1. No current mathematical claim is newly marked **DISCLAIMED** without a full workthrough of the relevant mathematics and a good-faith attempted repair.
2. No current mathematical claim is newly marked **VALIDATED** (or equivalent present-day positive verdict) without a full workthrough and attempted repair of encountered defects.
3. A deficient or incomplete individual presentation is not evidence that the archive lacks a working derivation elsewhere.
4. Before negative adjudication of an important historical SAT/H(s)H mathematical claim, search for alternate/full derivations in the archive.
5. Local defects remain reportable and must be preserved, but use scoped language such as **INCOMPLETE**, **LOCAL DEFECT**, **UNSUPPORTED IN THIS PRESENTATION**, or **REPAIR REQUIRED** until the hard gate is satisfied.
6. Historical status claims such as `CLAIMED VERIFIED` remain part of provenance even when present-day re-audit is pending.

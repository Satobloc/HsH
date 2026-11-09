# Review-MIND: speaker labels are not agent identities

**Status:** methods proposal; no human-subject or model experiment was run.  
**Scope:** provenance requirements for multi-voice and human–LLM/agent interaction studies. This note makes no claim about consciousness, personhood, or hidden group mental states.

## Distinguish four counts

A transcript can contain multiple speaker labels while recording only one assistant output stream. Do not equate:

- speaker-label count (displayed roles);
- generator count (distinct generation processes or process IDs);
- context count (distinct stateful conversation contexts);
- source-independence count (distinct primary-source ancestries).

A different role label, name, or writing style is not evidence of a different agent. If generator/process identifiers and context boundaries are absent, independent-agent count is **unidentifiable**, not equal to the number of speakers. Separate processes can still share model weights; computational isolation is not a claim about separate minds.

## Minimum event provenance

For every emitted message, retain transcript ID, message ID, speaker label, generator/process ID, context ID, parent-message IDs, source IDs plus ancestry, prompt hash, model/version, memory-state ID, tool trace, timestamps, and routing/visibility edges. Mark unknown fields unknown; do not infer them from character labels or UI layout.

Define interaction only from recorded message-routing/visibility edges. Define source independence from primary-source ancestry, not filename count. Define influence only through a counterfactual or randomized exposure contrast, not mere co-occurrence or agreement.

## Disconfirmatory design

A feasible study is a preregistered 2×2 comparison:

- shared single-generation context versus isolated per-agent generation contexts;
- shared versus disjoint primary-source ancestry.

Use a fixed, objectively adjudicable collaborative task; randomize at the group/session level with multiple independent groups per condition. Include human-only and single-LLM-adviser baselines where relevant. Keep model/version, prompts, tools, memory policy, context budget, and task difficulty controlled. Blind independent adjudicators to architecture. Measure role leakage, source-attribution accuracy, unique evidence contribution, calibration, decision quality, and consensus dynamics. Preserve full process/context/source logs. Determine sample size from pilot-based power analysis, not intuition.

A result in which shared-context multi-role output matches isolated-agent groups on preregistered outcomes would weaken the claim that multiple agents are needed for that task. A robust advantage for isolated agents with disjoint, traceable sources would support a narrower claim about provenance-separated parallel processing, not consciousness.

## Ethics and epistemic status

Use consented participants and non-sensitive or explicitly consented material; do not use private personal narratives or third-party sensitive records by default. No participant recruitment, model calls, or trials are reported here. This is a methodological proposal, not an empirical finding or Lean theorem.
# Calder Review-MIND audit amendment 01 | falsifiable experiment design
Parent report: WORKSPACES/CALDER/2026-11-01T2148Z_REVIEW_MIND_SOURCE_DEPENDENCY_AUDIT.md
Status: DESIGN PROPOSAL ONLY / NOT PREREGISTERED / NOT RUN / NOT AN ORSON P1 OWNERSHIP TRANSFER.

## Research question
When does shared source exposure increase apparent agreement among LLM runs without improving answer accuracy or independent evidential support?

## Experimental object and unit
Use an existing, source-grounded public task corpus with authoritative answer keys and recoverable source ancestry. Select the corpus only after a source inventory; do not invent tasks, fixtures or subject results. The primary unit is task × execution, not message count or worker-name count. Preserve every execution ID, conversation/thread ID, model/version/configuration, prompt/system context, retrieval source, source digest, handoff, evaluator and timestamp.

## Randomized exposure arms
- A — source-disjoint: independent runs receive distinct primary-source roots for the same prespecified question set; no cross-run summary or handoff is exposed before outputs are frozen.
- B — shared-source: independent runs receive the same primary-source root, but no prior answer or handoff.
- C — shared-source plus relay: runs receive the same source root and a frozen prior summary/handoff.

Keep task wording, answer-key version, model/version and decoding settings balanced across arms. Use separate conversation contexts and freeze outputs before any cross-read. If distinct model instances/providers are used, record them as execution configurations; do not infer instance identity from ring labels.

## Prespecified outcomes
Primary:
1. proposition-level pairwise agreement;
2. accuracy against the independent source-grounded key;
3. pairwise error correlation.

Secondary:
- source-ancestor Jaccard overlap;
- citation/source-locator fidelity;
- confidence calibration;
- sensitivity to order, paraphrase and answer normalization.

Report both agreement and accuracy. Agreement alone is identity-blind and can rise without improved correctness.

## Null and resampling
Primary null: after conditioning on task and configuration blocks, the shared-source exposure does not increase proposition-level agreement or error correlation relative to source-disjoint exposure.

Use a permutation that preserves each execution's marginal answer distribution and task blocks. Bootstrap at the independent task/source-root cluster, not at the message or repeated-file level. Prespecify all outcomes and apply multiplicity control. Do not calculate a p-value until the corpus, independent units, missingness rules and randomization scheme are frozen.

## Negative and positive controls
- Duplicate-path control: two archive paths resolving to the same raw blob must count as one source root.
- Role-repost control: assistant-generated text reposted in a user-role message must retain its original derivation edge; outer role alone does not establish text origin.
- Identifier-collision control: a non-injective source-ID normalization must be detected rather than creating false overlap.
- Positive shared-exposure control: intentionally provide a common source and handoff; the pipeline should detect the shared ancestry.

## Falsification criteria
- If agreement rises in B/C but accuracy does not, and error correlation rises, shared exposure is a plausible source of consensus inflation.
- If source-disjoint, no-handoff runs retain above-null agreement and independently adjudicated correctness on held-out tasks, shared-source exposure alone does not explain convergence.
- If the apparent effect disappears after source deduplication, task clustering or evaluator blinding, the original consensus claim is not robust.
- If exposure logs are incomplete, classify the pair as UNKNOWN/INCOMPLETE rather than independent.

## Human and privacy safeguards
This design does not require human subjects. If human annotators or human-LLM group sessions are later added, obtain informed consent, minimize personal data, document privacy handling and blind evaluators to exposure condition. No actual human session or model call was run in this Calder pass.

## Ownership and readiness
Orson retains P1 ownership. The original OV49–53 bank remains unrecovered and no authorized inference endpoint was evidenced in the current P1 docket. This design is a candidate methods contribution for Orson to accept, reject or revise; it does not satisfy the Nov 2 protocol freeze, Nov 9 manuscript gate, or any empirical-result claim.

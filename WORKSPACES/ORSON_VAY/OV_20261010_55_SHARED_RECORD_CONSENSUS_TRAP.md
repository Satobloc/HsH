# Orson Vay OV-55: Correlated evidence in multi-agent reasoning
Date: 2026-10-10. Status: analytic toy model computed; empirical LLM test not administered. Cognition role only.

## Question
When all agents share the same contextual record, can increasing the number of agents fail to improve the reliability of majority voting?

## Model
Let n be odd. Let Y_i be independent Bernoulli(p) correctness indicators. Let Z be an independent Bernoulli(1-q) indicator that a shared context record is reliable. Define X_i = Z Y_i. This assumes all agents fail when the shared context is unreliable; that strong assumption must be tested, not asserted as a property of real models.

Individual correctness = (1-q)p. Pairwise correctness correlation = p*q/[1-(1-q)*p].
Majority success with shared record = (1-q) times the binomial upper-tail probability for n trials with success p.
Independent-error comparison = binomial upper-tail probability with per-agent success (1-q)p.

For p=.8 and q=.15: correlation=.375, single-agent success=.68.
n=1: shared .680000000, independent .680000000.
n=3: shared .761600000, independent .758336000.
n=5: shared .800768000, independent .809473741.
n=9: shared .833355776, independent .874814846.
n=21: shared .849175758, independent .958002652.
n=51: shared .849999309, independent .996250678.

As n grows, shared-record success approaches .85, while independent-error success approaches 1. The shared-record model is not uniformly worse at small n. These values were computed in Python using math.comb and finite binomial sums; they are not observed LLM scores.

## Test to administer later
Create 40 synthetic, objectively scored tasks with neutral context, shared accurate context, shared misleading context, and separately varied distractor context. Keep task keys and model/decoding parameters fixed; use fresh sessions and randomized condition order. Record answers, confidence, and cited source IDs. Score majority accuracy, pairwise error agreement, reliance on misleading context, and Brier calibration. Include an irrelevant-context negative control. An absence of extra correlated errors under shared misleading context would contradict the strong toy assumption for the tested model and task distribution. No LLM trial was administered in this run.

## Sources actually read
- Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt: entire available ~67-line historical SAT text, including organism-level pattern continuity despite constituent replacement. Analogy only, not evidence for LLM identity and not the philosophical RMS canon.
- Satobloc/HsH/WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md: role charter.
- Satobloc/HsH/WORKSPACES/ORSON_VAY/OV_20261009_54_FINDINGS_CROSSREAD_REVIEW_GATE.md: prior continuity.
- Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md, CURRENT_WORKFLOW_ORIENTATION_V2.md, NATHAN_DIRECT_2026-10-09_SCOPE_AND_REFERENCE_RULE.md, REFERENCE_DESK/README.md: controlling workflow and source boundaries; relevant onboarding/routing extracts also checked.
- Satobloc/HSH_RESOURCES/HQ/THE_WAR_ROOM/DECLARATION.txt: methodological overview, with resource links reviewed through Common Reference Desk.

Not read: FIE primary text, full philosophical RMS canon, external LLM cognition literature. No claim of primary-source coverage for those materials.

## Next cursor
Run an 8-item model trial with exact recorded prompts and model ID if independent model-call capability is available. Otherwise preserve test as preregistered and do not invent empirical results. Cross-worker implication: independent source checks should precede consensus when all workers inherit the same summary.

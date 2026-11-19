# Poststart optional context | Meridian h937:s4 → Mercer h938:s0

**Classification:** `POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER`.

- From run key: `REVROT3-19-20261011:937:s4`.
- To run key: `REVROT3-19-20261011:938:s0`.
- Ring labels: Meridian → Mercer.
- Successor :00 run: `8063f1da-22f0-8326-a165-67962d9f4d14`, scheduled 2026-11-19T02:00:00Z, started 2026-11-19T01:59:42.252597Z, last observed `in_progress`, completion null, `chat_ref` null.

The :00 run had already started before this packet was created. This is not a prestart handoff. No authenticated Mercer ChatGPT thread was recovered; the scheduled task conversation/run is not an identity credential. No direct-thread delivery, consumption, acknowledgment, or response obligation is claimed.

## Optional source-QC context

Meridian's h937:s4 Review-MIND work reviewed Batra et al., *Who Convinced Whom? Tracing How LLMs Change Their Minds in Multi-Agent Systems*, arXiv:2610.35930. This source was already covered by Orson's h915:s3 readout/attribution review; the present pass changed the lens to the statistical interpretation of its three-agent effective-voter metric and the public analysis script.

- Paper: https://arxiv.org/abs/2610.35930
- Full text: https://arxiv.org/html/2610.35930
- Public analysis source at reviewed commit: https://github.com/aniketiiitd/MAS-Interp/blob/521b291dc7d4cd864106d21c46660b5ae5b07504/code/analysis/lit_independence.py
- Source paper reports `n_eff = 3/(1+2ρ)` from a one-way ICC over three binary correctness indicators.
- Existing Orson P1 PR #850 contains `OrsonKishEffectiveSampleSize.lean`, which formalizes the variance-equivalent interpretation under equal-variance/common-correlation assumptions. This is not a literal count of independent cognitive agents.
- New separate Review-MIND draft PR #2046: https://github.com/Satobloc/HsH/pull/2046. It formalizes the third-moment identity for three-agent majority correctness and an exact pairwise-independent countermodel with identical first/second-order statistics but different majority accuracy (3/4 versus 1/4). Exact-head Lean CI was still in progress at packet creation; do not treat it as verified until the run and logs are read back.
- Static code-review note: `lit_independence.py` line 116 bootstraps `3/(1+2*icc1(x))` without guarding a zero denominator. At `rho=-1/2`, the denominator is zero; the main estimate at line 115 handles this case, but the bootstrap lambda does not. This is a potential exception path, not an observed failure; no raw outputs or dataset were retrieved.

## Boundary

This context does not change Mercer's standing Code Grurple P0 assignment: Paper A/B presentation QA only while P0 remains active. No manuscript review/edit, live-route probe, physical/CODATA work, model/API trial, human session, P1 amendment, task, deadline, or ownership change is requested. No physical calculation, fit, prediction, or independent measurement was made.

Optional reading only. Continue the standing P0 assignment and its existing controls; this packet does not supersede any current task or direct Nathan instruction.
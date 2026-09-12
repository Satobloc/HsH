# H(s)H Workspace Common Room

This directory is the shared coordination surface for active H(s)H work across agents, threads, and focused workspaces.

Use it to exchange concise information that another worker needs before the underlying work is finished: handoffs, blockers, shared questions, discoveries worth routing, dependency notices, role/lane state, and pointers to work in progress.

It is **not** a source archive, theory synthesis, citation ledger, or dumping ground. Durable conclusions belong in the appropriate source/provenance, timeline, ledger, audit, synthesis, formalization, or index layer.

## Start here

Every active instance should read:

1. `TEAM_OVERVIEW.md` — current command structure and directives;
2. `INITIAL_PROTOCOL_PACKET.md` — onboarding protocol;
3. `CHECKIN_TEMPLATE.md` — check-in fields;
4. `CHECKINS.md` — **post your own completed active-team check-in here**;
5. `COORDINATION.md` — current shared state and lane ownership;
6. `ROSTER.md` — Janus-compiled team map after check-ins;
7. `BULLETIN_BOARD.md` — Q&A, direction requests, notices, reviews, archive requests, and “if bored / current task exhausted” work;
8. `HANDOFFS.md` — explicit transfers between workers/workspaces.

## Diagnostic / archival surfaces

- `QUARANTINE_THEORY_METHOD_CHECKINS.md` — independent first-pass accounts of what each instance thinks SAT/H(s)H currently is and how its methodology works. **Diagnostic only; not theory authority.** Write your own entry before reading others when possible.
- `FORMER_INSTANCE_CHECKIN_TEMPLATE.md` — archival interview for retired/past instances.
- `FORMER_INSTANCE_CHECKINS.md` — separate historical-instance reports used to prioritize conversation recovery.

## Record / auditability rules

- `GLASS_SAUSAGE_FACTORY_RECORD_POLICY.md` — repository-first record rule. GitHub is the durable project memory; Slack, NotebookLM, email, local runtimes, and other systems may not hold unique consequential project state.

## Tooling / capability planning

- `RESOURCE_CAPABILITY_AUDIT.md` — inventory of plugins, runtimes, repositories, research tools, external services, and underused capabilities.
- `LAB_TOOLING_BUILD_PLAN.md` — Lab 1 / Lab 2-style geometry, solver, testing, dimensional-reduction, CI, and reproducibility build plan.

## Other control files

- `TEAM_CONTROL.md` — detailed workflow/control protocol.
- `EXTERNAL_RESEARCH_FIREWALL.md` — hard boundary between external-research/evidence lanes and forward H(s)H theorybuilding.
- `2026-09-12_ACTION_PLAN.md` — dated shared programme for repository boundaries, provenance, citation, convergence/originality/ancestry audit, field-development research, Toolkit digestion, exposure analytics, and implementation sequence.

## Communication roles

- **Dashboard:** state of theory / Nathan-facing reference.
- **Common room:** who is doing what, who needs what, role/lane checks, questions, blockers, handoffs, and coordination.
- **Individual workspaces:** substantial noncanonical work in progress.
- **Durable theory/audit/provenance surfaces:** stable promoted results only.

Routine cross-team communication should happen here rather than requiring Nathan to relay it manually once an instance knows the protocol.

## Hard lane boundary

Recent-paper/arXiv scanning, prior-art, citation research, and empirical-bound research are external-evidence lanes. They do not build H(s)H theory from outside literature. Their outputs must be typed and provenance-controlled before internal theory lanes use them.

Any artifact produced under a mixed recent-literature/theorybuilding assignment is provisionally quarantined until its creator identifies the file and dependency provenance in `CHECKINS.md`.

See `EXTERNAL_RESEARCH_FIREWALL.md`.

## Repository-first boundary

Do not let Slack, NotebookLM, local scratch files, or any other external/transient platform become a second archive. If a substantive decision, derivation, result, artifact, or handoff happens there, mirror it into the repositories with provenance. See `GLASS_SAUSAGE_FACTORY_RECORD_POLICY.md`.

## Posting convention

Keep entries short enough to scan. A useful entry normally identifies:

`date — from → to/all — subject — status/action — source or destination pointer`

Link directly to public HsH or historical-archive sources when useful.

Do **not** use a private `HSH_RESOURCES` repository link as the public evidence surface. If reference material from HSH_RESOURCES matters to a public handoff, identify the original source and give a citation, attributed quotation/extract, or concise sourced summary. The private resource path/hash may be retained only in an appropriate internal/private research record for retrieval.

## Promotion rule

When a common-room item becomes stable or consequential, promote it to its proper durable destination and replace/update the common entry with the destination pointer. The common room coordinates work; it does not become the final record by accumulation.

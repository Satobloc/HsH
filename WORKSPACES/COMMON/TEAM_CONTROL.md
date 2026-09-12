# H(s)H Team Control

**Status:** active coordination protocol  
**Authority:** workflow/routing only; current theory status remains in the Dashboard, synthesis, ledgers, checkpoints, and other durable surfaces.

## 1. Control surfaces

- **State of theory / Nathan-facing reference:** `SAT_THEORY_ARCHIVE_2023-25/..[🎛️_NATHAN_DASH]/!_DASHBOARD.md`
- **Shared team coordination:** `WORKSPACES/COMMON/COORDINATION.md`
- **Handoffs:** `WORKSPACES/COMMON/HANDOFFS.md`
- **Shared programme / evidence rules:** `WORKSPACES/COMMON/2026-09-12_ACTION_PLAN.md`
- **Substantial work:** `WORKSPACES/<lane>/`
- **Conversation provenance:** Conversation Viewer + canonical raw conversation JSON

The Dashboard is the default answer to “what is the state of the theory / what does Nathan need to know?” Workspaces are noncanonical. The common room is a routing surface, not a shadow synthesis.

## 2. Lead roles

### Janus — coordination / integration supervisor

Primary responsibility: continuity, task routing, role boundaries, cross-team dependencies, promotion gates, archive priorities, automation design, and keeping Nathan’s Dashboard/update surface intelligible.

Janus may stop or reroute work for duplication, provenance, safety, stale assumptions, missing QC, or role collision. Janus does **not** override the lead theorist on theory content.

### Ravel — lead theorist / co-theorist with Nathan

Primary responsibility: forward H(s)H theory construction with Nathan, including deciding which mathematical constructions belong in the active theory and which remain tools, candidates, or discarded branches.

**Theory override:** Ravel has final project-internal override on theory construction/promotion unless Nathan decides otherwise. Process/provenance objections remain visible rather than being erased.

### Other lanes

Assignments remain provisional until the active-team check-in roster is complete. Existing tendencies may be preserved when useful (archive/provenance, geometry/solver, covariance/representation, outsider/adversarial, prior-art/toolkit, code/infrastructure), but role bleed should be made explicit rather than silently normalized.

## 3. Check-in and roster rule

Every active instance should submit a concise check-in before roles are tightened. Janus compiles the roster from those reports and records:

- current task and intended output;
- material actually loaded/read versus merely available;
- repository/file/tool access;
- special capabilities and constraints;
- strongest context / unique institutional knowledge;
- overlaps with other workers;
- blockers and requested inputs;
- recommended next job.

Use `WORKSPACES/COMMON/CHECKIN_TEMPLATE.md`.

After several check-ins, Janus assigns or loosens lanes based on demonstrated context and performance rather than prior naming alone.

## 4. Minimum preload by role

All active instances should know, at minimum:

1. the Dashboard;
2. `WORKSPACES/README.md`;
3. this file;
4. current `COORDINATION.md` and `HANDOFFS.md`;
5. the current synthesis/checkpoint if their job touches theory status.

Additional loading should be role-specific rather than universal:

- **Ravel / theory:** current synthesis, current checkpoint, relevant Worldtube Lab packets/ledgers, current mathematical construction documents.
- **Archive/provenance:** archive index/survey, conversation viewer/catalog, exact raw conversations, source chronology; avoid silently promoting historical math.
- **Geometry/solver:** exact source constructions plus relevant standard mathematical references; strip external physical interpretations unless deliberately imported.
- **Prior-art/toolkit:** `HSH_RESOURCES/indexes/AI_START_HERE.md`, relevant PRIOR_ART/Toolkit indices, original external sources, convergence rubric.
- **Outsider/adversarial:** intentionally limited preload when blindness is useful; state the blind packet explicitly.
- **Automation/infrastructure:** action plan, this protocol, task registry/locks, validation rules; no independent authority to promote theory.

## 5. Quarantine / caution labels

Files or conversations explicitly labeled by Nathan as `weird`, `4D organism`, or equivalent cautionary/speculative material are **quarantined by label** unless Nathan or Ravel explicitly promotes a specific construction.

Rules:

- they may be read for historical context or mathematical ideas;
- they do not silently enter current H(s)H premises;
- if a useful geometric construction is extracted, restate it independently with assumptions and provenance;
- a title/path label is a routing warning, not a verdict on every sentence in the file.

## 6. Work and promotion flow

Default substantial-task flow:

`assignment -> workspace -> result packet -> independent check -> handoff -> promotion decision -> durable destination`

For theory-bearing results:

`worker -> independent mathematical/QC check -> Ravel theory review -> Janus process/provenance check -> durable theory surface`

Janus can block promotion for missing evidence/QC; Ravel controls theory acceptance. Nathan can override either.

Negative/null results should be retained when they close a live path.

## 7. One-writer / code-lock rule

Until a stronger task registry is needed, use a simple one-writer lease for shared durable files:

- claim the target/file/task in `COORDINATION.md` before an automated or multi-step edit;
- state owner, scope, and expected return point;
- other workers may review but should not concurrently overwrite the same durable target;
- do experimental work in a workspace/output file first;
- release the claim after merge/promotion or abandonment.

Automated workers should default to writing workspace/outbox artifacts, not directly changing synthesis, Dashboard, ledgers, or checkpoints.

## 8. Cross-vetting

Use orthogonal review where it matters:

- mathematical derivation -> independent derivation or numerical/unit test;
- provenance/priority -> separate chronology/source audit;
- empirical claim -> independent data/source check;
- code -> syntax/tests + reviewer not responsible for original implementation;
- theory promotion -> Ravel + process/provenance check;
- automation changes -> dry run before recurring deployment.

Avoid having the same instance generate, validate, and promote a consequential result without an independent checkpoint.

## 9. Automated-work supervisor

Do **not** appoint or deploy the automated supervisor until the roster and current automation inventory are visible.

When created, its lane should be operational only: task scheduling, stale-task detection, output validation, lock checking, handoff routing, and exception reporting. It should not independently decide theory, priority, novelty, or publication claims.

It reports to Janus; theory-bearing exceptions route to Ravel.

## 10. Archive priorities

Immediate human search priority remains the original **Lab 1** and **Lab 2** full conversations.

After those, prioritize raw/full conversations when they satisfy one or more of:

1. contain the first derivation of a result now used in current work;
2. contain a unique transition in the theory that survives only as summaries/extracts elsewhere;
3. contain original UI/Whirligig/Spheres/finite-core or nested-superhelix construction steps not yet preserved in canonical raw form;
4. are repeatedly referenced by active agents but absent from the Conversation Viewer/archive;
5. contain exact corrections by Nathan that later summaries may have blurred;
6. are the sole provenance for a frozen/current mathematical result.

Lower priority: duplicate exports, conversations whose distinctive content is already preserved verbatim elsewhere, and explicitly quarantined `weird`/`4D organism` material unless a current provenance question specifically requires them.

## 11. Continuity rule

At any conversation cutoff, a replacement supervisor should be able to resume by reading, in order:

1. Dashboard;
2. this file;
3. current `COORDINATION.md`;
4. current `HANDOFFS.md`;
5. current check-in roster / active workspace READMEs;
6. current synthesis/checkpoint only as needed for the task.

The goal is not to recreate one model’s memory. The goal is to make the project state reconstructible from durable, concise surfaces.

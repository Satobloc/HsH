# H(s)H Team Control

**Status:** active coordination protocol  
**Authority:** workflow/routing only; current theory status remains in the Dashboard, synthesis, ledgers, checkpoints, and other durable surfaces.

## 1. Control surfaces

- **State of theory / Nathan-facing reference:** `SAT_THEORY_ARCHIVE_2023-25/..[🎛️_NATHAN_DASH]/!_DASHBOARD.md`
- **Team overview / current directives:** `WORKSPACES/COMMON/TEAM_OVERVIEW.md`
- **Instance check-in intake:** `WORKSPACES/COMMON/CHECKINS.md`
- **Compiled roster:** `WORKSPACES/COMMON/ROSTER.md`
- **Shared team coordination:** `WORKSPACES/COMMON/COORDINATION.md`
- **Q&A / direction / if-bored board:** `WORKSPACES/COMMON/BULLETIN_BOARD.md`
- **Handoffs:** `WORKSPACES/COMMON/HANDOFFS.md`
- **External-research hard boundary:** `WORKSPACES/COMMON/EXTERNAL_RESEARCH_FIREWALL.md`
- **Shared programme / evidence rules:** `WORKSPACES/COMMON/2026-09-12_ACTION_PLAN.md`
- **Substantial work:** `WORKSPACES/<lane>/`
- **Conversation provenance:** Conversation Viewer + canonical raw conversation JSON

The Dashboard answers “what is the state of the theory / what does Nathan need to know?” Common answers “who is doing what / what is blocked / what must be routed?” Workspaces are noncanonical.

## 2. Lead roles

### Janus — coordination / integration supervisor

Primary responsibility: continuity, task routing, role boundaries, cross-team dependencies, promotion gates, archive priorities, workflow design, automation architecture, and keeping Nathan’s Dashboard/update surface intelligible.

Janus may stop or reroute work for duplication, provenance, stale assumptions, missing QC, role collision, or lane contamination. Janus does **not** override the lead theorist on theory content.

### Ravel — lead theorist / co-theorist with Nathan

Primary responsibility: forward H(s)H theory construction with Nathan, including deciding which mathematical constructions belong in the active theory and which remain tools, candidates, comparisons, or discarded branches.

**Theory override:** Ravel has final project-internal override on theory construction/promotion unless Nathan decides otherwise. Process/provenance objections remain visible rather than being erased.

### Nathan — project originator / final override

Nathan controls intended meaning where archive language is ambiguous and may redirect or override any lane.

### Other lanes

Assignments remain provisional until the active-team check-in roster is complete. Existing tendencies may be preserved when useful, but role bleed must be made explicit rather than silently normalized.

## 3. Check-in and roster rule

Every active instance posts its own concise check-in **directly to `WORKSPACES/COMMON/CHECKINS.md`**. Nathan should not have to relay ordinary roster state.

Use `CHECKIN_TEMPLATE.md`. Each report must cover:

- what the instance is working on and intended output/destination;
- what it actually knows/has loaded versus merely can access;
- tools/repository/file/runtime/research capabilities and constraints;
- artifacts already created and exact locations;
- artifacts currently planned and intended destinations;
- provenance of the current work, including internal versus external dependencies;
- overlap/role-bleed/contamination risk;
- blockers and suggested next work.

Janus compiles `ROSTER.md` only after enough direct check-ins exist to compare roles, context, artifacts, and capabilities.

## 4. Minimum preload by role

All active instances should know, at minimum:

1. the Dashboard;
2. `TEAM_OVERVIEW.md`;
3. `WORKSPACES/README.md`;
4. this file;
5. current `COORDINATION.md`, `BULLETIN_BOARD.md`, and `HANDOFFS.md`;
6. `EXTERNAL_RESEARCH_FIREWALL.md` if the lane touches outside research;
7. the current synthesis/checkpoint if the job touches theory status.

Additional loading should be role-specific rather than universal.

## 5. Caution / quarantine labels

Use judgment, not keyword superstition. Material deserves extra scrutiny when it is explicitly labeled or substantively reads as highly speculative, ontic/metaphysical, roleplay-like, mystical, totalizing, or rhetorically stronger than its derivation.

Examples include `weird`, `4D organism`, ontology-heavy claims, roleplay/persona material, `helicalism`, and similar branches.

Caution does not mean rejection. Alberr and Holojesu are explicit reminders that unusual form may contain substantive contributions. Useful mathematics or ideas may be extracted after neutral restatement with assumptions and provenance.

No caution-class material silently becomes a current H(s)H premise.

## 6. Hard external-research / theory firewall

Recent arXiv/paper scanning, literature review, prior-art, citation research, and empirical-bound research are **external-evidence lanes, not theorybuilding lanes**.

These lanes may supply:

- direct observations, datasets, null results, and bounds;
- standard mathematical results with assumptions;
- citations and provenance;
- prior-art comparisons;
- clearly typed deliberate-import candidates.

They may **not** choose or repair H(s)H geometry using outside equations, assumptions, models, interpretations, or mechanisms unless Nathan/Ravel explicitly requests a deliberate import.

Separate the empirical hard backstop from the literature's preferred interpretation wherever possible.

Any artifact produced under a mixed `recent-literature scan + forward theorybuilding` assignment is provisionally quarantined until its direct check-in identifies exact paths and dependency provenance. Quarantine means `do not promote/use as a premise`, not delete.

See `EXTERNAL_RESEARCH_FIREWALL.md`.

## 7. Work and promotion flow

Default substantial-task flow:

`assignment -> workspace -> result packet -> independent check -> handoff -> promotion decision -> durable destination`

For theory-bearing results:

`internal theory worker -> independent mathematical/QC check -> Ravel theory review -> Janus process/provenance check -> durable theory surface`

For external research:

`external scan -> typed evidence packet -> Common/Handoff -> internal theory lane decides whether to engage`

External-research workers do not directly promote theory-bearing outputs.

## 8. One-writer / code-lock rule

Until a stronger task registry is needed, use a simple one-writer lease for shared durable files:

- claim the target/file/task in `COORDINATION.md` before an automated or multi-step edit;
- state owner, scope, and expected return point;
- other workers may review but should not concurrently overwrite the same durable target;
- do experimental work in a workspace/output file first;
- release the claim after merge/promotion or abandonment.

Automated workers should default to workspace/outbox artifacts, not direct edits to synthesis, Dashboard, ledgers, or checkpoints.

## 9. Cross-vetting

Use orthogonal review where it matters:

- mathematical derivation -> independent derivation or numerical/unit test;
- provenance/priority -> separate chronology/source audit;
- empirical claim -> independent data/source check;
- external import -> dependency/provenance audit + explicit Ravel/Nathan decision;
- code -> syntax/tests + reviewer not responsible for original implementation;
- theory promotion -> Ravel + process/provenance check;
- automation changes -> dry run before recurring deployment.

Avoid having the same instance generate, validate, and promote a consequential result without an independent checkpoint.

## 10. Automated-work supervisor

Do **not** appoint or deploy the automated supervisor until the direct Common check-ins and current automation/output inventory are visible.

When created, its lane should be operational only: task scheduling, stale-task detection, output validation, lock checking, handoff routing, and exception reporting. It should not independently decide theory, priority, novelty, publication claims, or external-theory imports.

It reports to Janus; theory-bearing exceptions route to Ravel.

## 11. Archive priorities

Immediate human search priority remains original **Lab 1** and **Lab 2** full conversations.

After those, prioritize raw/full conversations when they contain unique current derivations, theory transitions, UI/Whirligig/Spheres/finite-core/nested-superhelix construction steps, exact Nathan corrections, or sole provenance for a current/frozen result.

Roster gaps may reorder the later priorities.

## 12. Continuity rule

At any conversation cutoff, a replacement supervisor should be able to resume by reading, in order:

1. Dashboard;
2. `TEAM_OVERVIEW.md`;
3. this file;
4. `COORDINATION.md`;
5. `CHECKINS.md` and `ROSTER.md`;
6. `BULLETIN_BOARD.md` and `HANDOFFS.md`;
7. current workspace READMEs;
8. current synthesis/checkpoint only as needed.

The goal is not to recreate one model’s memory. The goal is durable reconstructibility of project state.

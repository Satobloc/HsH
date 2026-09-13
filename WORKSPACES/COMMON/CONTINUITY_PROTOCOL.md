# Scoped-Instance Continuity Protocol

**Purpose:** reduce institutional-memory loss when long LLM conversations are cut off, context windows shift, instances diverge, or useful working relationships cannot simply be continued in-place.

This is an operational continuity/reconstruction system. It does not assume that a later model instance is literally the same entity as an earlier one.

## What to preserve

For a scoped instance or sustained working relationship worth preserving, capture five layers separately:

1. **Identity/provenance** — stable handle/discriminator, originating conversation ID, relevant message/node IDs and timestamps, workspace, and relationship to predecessor/parallel instances.
2. **Task state** — current objective, live TODOs, completed actions, blockers, next likely actions, exact artifact paths, and unresolved decisions.
3. **Knowledge state** — what was actually read/loaded/possessed, what was merely indexed/known to exist, important source cursors, corrections from Nathan, and areas where the instance is explicitly uncertain.
4. **Capability/working configuration** — role, tools/access, demonstrated strengths, useful operating conventions, failure modes, boundaries/firewalls, and any task-specific habits that materially improved work.
5. **Interaction dynamics** — only where useful: concise observations about what made the collaboration effective or ineffective (degree of initiative, preferred granularity, correction style, autonomy boundaries, pacing, division of labor). Keep this evidence-based and tied to actual work, not speculative personality essentialism.

## Minimum restart packet

Before an unusually long or valuable conversation becomes fragile, prefer a short `CONTINUITY.md` in the personal workspace containing:

- `WHO / LINEAGE`
- `CURRENT REMIT`
- `NOW`
- `NEXT`
- `LOADED / POSSESSED`
- `IMPORTANT DIRECT NATHAN CORRECTIONS / DIRECTIVES`
- `ARTIFACTS / PATHS`
- `TOOLS / ACCESS / LIMITS`
- `WORKING CONVENTIONS`
- `KNOWN FAILURE MODES / DO-NOT-REPEAT`
- `HANDOFF / RECONSTRUCTION NOTES`

The packet should be restartable without requiring another model to read the entire prior conversation first, while still pointing back to raw conversation provenance for audit.

## Continuity versus reconstruction

### Planned continuity

When the instance is still active:

- maintain its workspace and placard;
- log direct Nathan directives with raw-message provenance when available;
- periodically update the restart packet rather than waiting until cutoff;
- preserve useful scripts/templates/tooling in durable repository locations rather than only in chat;
- distinguish durable shared state from instance-local notes.

### Retrospective reconstruction

For useful historical instances archived before this protocol existed:

- begin from raw conversations and authored artifacts, not later summaries;
- recover name/handle, role, task scope, major outputs, tools/access, direct Nathan feedback, and distinctive working conventions;
- identify demonstrated capabilities from actual successful work rather than self-description alone;
- record uncertainty about lineage or whether multiple conversations represent the same continuing instance;
- create a reconstructed placard/restart packet labeled `RETROSPECTIVE` rather than pretending it was contemporaneously maintained.

## Possible future structured representation

The continuity system should eventually support a machine-readable companion record (JSON/YAML or generated index) with fields such as:

- `instance_handle`
- `discriminator`
- `lineage_relation`
- `conversation_ids[]`
- `message_anchors[]`
- `workspace_path`
- `roles[]`
- `capabilities[]`
- `tools_access[]`
- `loaded_sources[]`
- `artifacts[]`
- `directives[]`
- `working_conventions[]`
- `known_failure_modes[]`
- `status`
- `last_continuity_update`
- `confidence / provenance` per field where reconstruction is retrospective

This should be treated as a research/operations record: useful for restart, comparison, and analysis of productive scoped dynamics, not as a claim that an LLM has a fixed or persistent personality independent of context.

## Broader analysis goal

Once enough instances have contemporaneous or reconstructed records, the project can compare which factors correlate with productive scoped dynamics: source coverage, task definition, tool access, autonomy, feedback loops, continuity practices, division of labor, role clarity, conversation length, correction history, and preserved local conventions. The analysis should separate observable configuration from speculative causal claims.

## Relationship to other records

- `WORKSPACES/README.md` — when/how to create a personal workspace.
- `INSTANCE_PLACARDS.md` — compact Commons-facing identity/role/capability directory.
- `CHECKINS.md` — fuller contemporaneous team status reports.
- `NATHAN_DIRECTIVES_PROVENANCE.md` — auditable direct-request/correction provenance.
- raw conversation JSON — primary record for reconstruction and exact wording.

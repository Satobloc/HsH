# Glass Sausage Factory Record Policy

**Status:** standing project record rule  
**Purpose:** preserve auditability, continuity, and reconstructibility of SAT/H(s)H work.

## Core principle

The Glass Sausage Factory ethos is sacrosanct: the work should remain inspectable enough that present and future Nathan/instances can reconstruct not only conclusions, but how, when, and from what they were produced.

GitHub repositories are the project record. External communication platforms are not.

## Repository-first rule

Substantive project work belongs in the appropriate SAT/H(s)H repository surface:

- source/provenance records;
- theory workspaces;
- derivations;
- code and tests;
- data/result packets;
- handoffs;
- decisions;
- role assignments;
- questions that materially alter work;
- generated artifacts;
- external-evidence packets;
- negative/null results worth retaining.

Slack, chat apps, email, NotebookLM, temporary runtimes, local scratchpads, and similar systems may be used as **transient interfaces, computational tools, or discovery surfaces**, but they must not become the sole location of project-relevant state.

## Mirror-back requirement

If substantive SAT/H(s)H content is produced or decided outside the repositories, the responsible instance should mirror it back promptly into the correct repository surface, with enough provenance to recover the external event.

At minimum record:

- date/time or sequence position;
- participants/tool/platform;
- what was decided/discovered/generated;
- source inputs or dependencies;
- exact artifact or concise faithful summary;
- destination/status;
- link or identifier to the external source when stable and appropriate.

Do not rely on an external platform remaining searchable, accessible, connected, or context-preserving.

## Slack rule

Slack is acceptable for transient coordination if useful. It is **not** an authoritative project ledger, theory surface, provenance archive, derivation store, or unique handoff channel.

If a Slack exchange changes theory direction, assigns consequential work, resolves a blocker, contains a derivation, creates an artifact, or records a result another worker may depend on, mirror it to GitHub.

## NotebookLM rule

NotebookLM may be used aggressively for source-grounded synthesis, Deep Dives, audio generation, source comparison, and asset production. The NotebookLM notebook itself is not the canonical project record.

For project-relevant NotebookLM work preserve in GitHub:

- source manifest and versions;
- curation rationale;
- controlling prompts/instructions;
- important outputs or faithful summaries;
- resulting decisions;
- generated asset inventory;
- known limitations or hallucination/error checks.

## Local/runtime rule

Scripts, notebooks, figures, temporary files, generated datasets, and solver outputs that materially matter should not remain only in `/mnt/data`, a local machine, a chat attachment, or a transient runtime.

Promote useful artifacts into the appropriate repository with:

- code version;
- input identities/hashes where practical;
- parameters/configuration;
- deterministic seed when relevant;
- output/result identity;
- test status;
- provenance pointer.

## Communication hierarchy

1. **GitHub durable surfaces** — authoritative project state and reconstructible record.
2. **WORKSPACES/COMMON/** — live coordination bus and routing state.
3. **Conversation Viewer/raw conversation archive** — canonical conversational provenance when preserved.
4. **External platforms/tools** — transient interfaces, source systems, or computation/production environments; never sole project memory.

## Promotion discipline

Auditability does not mean every thought becomes canonical theory. Preserve the sausage-making while keeping status typed:

`source` / `workspace` / `experimental` / `quarantined` / `external evidence` / `historical` / `candidate` / `frozen` / `superseded` / `failed`.

The aim is to make both the successful path and the discarded path recoverable without confusing them.

## Checksum

> If future us would kick ourselves because something important existed only in one chat, Slack thread, notebook, runtime, or memory, it belongs in the repository now.

# H(s)H Resource / Capability Audit

**Status:** active inventory scaffold  
**Purpose:** identify tools, plugins, runtimes, repositories, code infrastructure, and external services that can improve the project without fragmenting the record or breaching lane boundaries.

This inventory should be updated from active-instance check-ins and practical tests. `available` is not the same as `loaded`, `connected`, `validated`, or `appropriate`.

## Governing rules

1. GitHub remains the durable project record. See `GLASS_SAUSAGE_FACTORY_RECORD_POLICY.md`.
2. External-research tools remain behind `EXTERNAL_RESEARCH_FIREWALL.md`.
3. A tool is adopted because it reduces error, increases reproducibility, or adds a capability—not because it is novel.
4. Important outputs from transient tools/runtimes must be mirrored to the repository with provenance/configuration.
5. Independent implementations are valuable when used as cross-checks rather than silently merged.

## A. Repository / archive infrastructure

### GitHub — installed and central

Current uses:

- canonical source/version record;
- Common coordination;
- conversation archive/viewer;
- code and CI;
- issues/PRs if useful for bounded engineering tasks;
- provenance and durable artifacts.

Underused opportunities:

- GitHub Issues for discrete code/test bugs instead of adding another project-management platform;
- protected result schemas / JSON ledgers;
- Actions matrix tests across Python versions;
- scheduled integrity/index checks;
- artifact validation and broken-link/provenance checks;
- generated solver result manifests.

### Conversation Viewer

Use as provenance/navigation instrument, not merely reader. Add landmarks for first derivation, correction, freeze, failure, import, or supersession.

### File/library connectors

Use for retrieval/materialization when needed, but preserve durable results in repositories.

## B. Computation / formal mathematics

### Python + container/runtime — available

Core numerical implementation environment.

Needed project conventions:

- pinned Python/environment;
- dependency lock;
- deterministic seeds;
- test fixtures;
- input/output hashes;
- machine-readable equation/constants ledger;
- no consequential result existing only in a transient runtime.

### Wolfram — installed

High-value use:

- independent symbolic simplification;
- exact equation solving;
- differential-equation checks;
- algebraic identities;
- special-function and group calculations;
- independent verification of Python/SymPy results.

Preferred role: **orthogonal checker**, not source of H(s)H premises.

### Data / analytics capability — installed

Potential use:

- large parameter-sweep analysis;
- statistical external-backstop work;
- clustering / dimensional-reduction diagnostics;
- structured result tables.

## C. Academic / prior-art tooling

### SciSpace — installed

Use only in external-research/prior-art lanes: discovery, triage, structured paper tables, source synthesis.

### Scholar Sidekick — installed

Use for identifier resolution, citation verification, and citation formatting. Strong fit for citation closure.

### Academic Writing Toolkit — installed

Potential use after paper skeletons stabilize: citation-consistency audit and conservative manuscript checks. Not a theory generator.

### Web search — native

Use for current literature/news/public datasets with explicit source citations.

### Candidate research plugins not currently installed

Observed in plugin directory:

- **Scite** — citation-context/graph checking; potentially useful for prior-art and support/contradiction audits.
- **Consensus** — broad peer-reviewed search/synthesis; overlapping with SciSpace, so install only if benchmark shows added value.
- **Elicit** — structured paper/report extraction; overlapping with SciSpace.
- **Scholar Gateway** — publisher-grounded scholarly search; narrower source coverage.

Decision rule: benchmark one real provenance/citation task before adding another literature tool. Do not multiply overlapping research channels without demonstrated gain.

## D. Documents / figures / publication assets

### PDF/DOCX/slides/spreadsheet generation — available

Use for controlled deliverables, while source text/code/data remain versioned where appropriate.

### Figma — installed

Potential use for editable solver diagrams, architecture maps, public explanatory graphics, or podcast/site assets. Keep source design files linked and export provenance recorded.

### Explain Video Generator — installed

Possible use for explanatory/public-facing assets after scientific content is frozen. Not a canonical technical record.

### BioRender — available but not installed

Probably low priority unless biological/scientific schematic needs exceed Figma/image-generation capability.

## E. Communication / external platforms

### Slack — installed/used by some instances

Allowed only as transient communication. Unique project state must be mirrored to GitHub. See `GLASS_SAUSAGE_FACTORY_RECORD_POLICY.md`.

### Gmail / Google Drive — available/installed

Useful for source intake or collaborator exchange. Durable project state still belongs in repositories.

### NotebookLM — user-operated external production environment

No direct canonical connector assumed here. Use through a documented source manifest + prompt packet + returned asset/output record. Excellent candidate for the proposed podcast programme.

## F. Development / local-computer options

### GitHub coding/CI — already available

Preferred before introducing another project-management/code platform.

### Remote Desktop Commander — available, not installed

Could materially help controlled access to Nathan-authorized local files/terminal and long-running local development workflows. Evaluate only if local-machine automation becomes a real bottleneck; repository-first rules still apply.

### External project managers (Linear/Wrike/Asana/ClickUp/etc.)

Available in plugin ecosystem but **not recommended as project state stores**. GitHub/Common already solves the central auditability problem. Add only for a clearly missing function, not general coordination.

## G. Automation

Current automation inventory must be reviewed against the new lane map.

Required classes:

- internal theory construction;
- archive/provenance recovery;
- external evidence/literature scan;
- validation/integrity checks;
- coordination/dispatcher functions.

Hard rule: external-literature automation never becomes a forward-theory worker.

## H. Audit questions for every active instance

From `CHECKINS.md`, extract:

- tool/plugin access not shared by others;
- code/runtime advantages;
- missing connections;
- duplicate capabilities;
- unique local files/data;
- tasks currently being done manually that should be scripted;
- scripts already created but not centralized;
- tools used without durable result capture.

## I. Adoption priority

### Immediate

1. Python solver/test architecture.
2. Wolfram-vs-Python independent math checking.
3. GitHub CI/integrity automation.
4. Conversation/provenance landmark tooling.
5. external-research evidence packet schema.

### Next

1. paper/citation audit toolchain;
2. automated dimensional/invariant sweeps;
3. visual regression and solver-animation pipeline;
4. NotebookLM podcast source/prompt/asset protocol.

### Evaluate only if needed

- extra literature plugins;
- local-computer remote connector;
- additional project-management platforms.

## J. Standing output

Maintain a small matrix once roster compilation is complete:

`capability | tool/instance | tested? | canonical output path | lane | redundancy | next action`

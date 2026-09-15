# Cross-Repo Script Execution Safety Standard

**Status:** REQUIRED  
**Owner:** Sable systems / infrastructure QA  
**Scope:** all scripts, GitHub Actions, bots, one-shot compute shims, local utilities, extraction jobs, indexing/tagging jobs, and automated write processes operating on any combination of `[[HsH]]`, `[[GLASS]]`, and `[RESOURCES]`.

This is an execution-safety contract, not theory authority.

## Core rule

No script may assume it is the only writer.

Every script must know:
1. exactly which repositories/paths it may **read**;
2. exactly which repositories/paths it may **write**;
3. whether each output is **source**, **derived**, **generated/regenerable**, or **shared semantic state**;
4. what it will do if the target changes between read and write.

If those answers are not explicit, the script is not safe for unattended project use.

## Required pre-run declaration

Each nontrivial run should be able to state, in code/config/log output or a run manifest:

- `run_id` — unique identifier or timestamp+nonce;
- tool/script version or commit SHA;
- source repository + exact source commit/ref for each repo read;
- declared read roots;
- declared write repository/branch;
- declared write roots/files;
- quarantine/sandbox exclusions or routing rules relevant to the task;
- whether the run is read-only, append-only, replace-generated, or semantic-update;
- deterministic seed/configuration when applicable.

GitHub Actions should record the checked-out commit SHA of every repository they scan.

## Source preservation

**Never overwrite original source artifacts in place as part of extraction, conversion, OCR, image extraction, normalization, indexing, or analysis.**

Derived products must go to a declared output namespace and, where practical, record:
- source repo/path;
- source blob/content hash;
- extraction/conversion tool version;
- run ID;
- generated artifact hash.

Examples:
- PDF/image extraction -> dedicated extraction/output tree;
- conversation normalization -> generated Viewer/index tree, not the raw conversation file;
- OCR/text extraction -> derived text file alongside provenance metadata, not replacement of the original binary.

A source may be deliberately edited only by a workflow whose explicit purpose is to edit that source, with the semantic-write protections below.

## Quarantine and sandbox

- Ordinary scripts must not descend into or read quarantine-controlled trees unless the workflow is explicitly authorized for that quarantine.
- Path pruning must occur **before file open/hash/index/sample operations**, not merely before publishing results.
- Quarantine-derived material must not leak into ordinary manifests, search indexes, logs, samples, filenames, or error reports beyond authorized minimal routing metadata.
- Direct theory construction/development remains sandbox-routed; infrastructure scripts must preserve sandbox/public/private distinctions rather than flatten them.

## Write classes

### A. Read-only / audit
Safest class. May inventory/hash/read permitted sources but makes no repo changes.

Requirements:
- exact source refs recorded;
- quarantine pruning before descent;
- outputs, if retained, are written separately as derived artifacts.

### B. Derived/generated output
Examples: extracted images/text, manifests, Viewer catalogs, indexes, samples, generated reports.

Requirements:
- deterministic/rebuildable when feasible;
- write only inside declared generated/output paths;
- do not overwrite source artifacts;
- compare generated source coverage against current inputs before declaring success;
- publish from a fresh base;
- safe to regenerate rather than hand-merge when appropriate.

### C. Append-only operational logs/handoffs
Requirements:
- re-fetch immediately before append;
- preserve existing entries exactly;
- if append cannot be made atomically or against current state, abort/retry rather than replace from a stale copy.

### D. Shared semantic state
Examples: central checkpoints, controlling status files, manually curated synthesis/control documents.

Requirements:
- re-fetch immediately before write;
- use current blob SHA / compare-and-swap semantics where available;
- if target changed since read, abort or reconcile explicitly;
- never silently whole-file replace from stale cached content;
- minimize independent writers;
- prefer worker-local state + handoff + aggregation over many writers editing one central file.

### E. Destructive/renaming/migration jobs
Examples: delete, move, mass rename, directory restructuring, source rewriting.

Requirements:
- dry-run/default preview unless the operation is trivial and fully deterministic;
- pre-run manifest of affected paths and hashes;
- explicit source/destination collision handling;
- no overwrite-on-collision unless the workflow specifically proves identity and records the action;
- reversible mapping or backup/provenance sufficient to reconstruct prior location/content;
- post-run integrity check.

## GitHub Contents API writes

For replacement updates, use the current blob SHA. This provides compare-and-swap behavior: stale writes should fail rather than silently clobber a newer version.

Required pattern:
1. fetch current target + SHA;
2. compute/reconcile update;
3. update with that SHA;
4. on stale-SHA failure, re-fetch and retry/reconcile; do not bypass the guard.

## Git checkout / commit / push writes

Before publishing:
1. fetch current target branch;
2. rebase/reset/merge onto current branch as appropriate;
3. rerun any validation whose assumptions could have changed;
4. push without force;
5. if rejected, fetch again and retry non-destructively or stop for reconciliation.

**Never force-push automated generated or semantic project updates to `main`.**

One-shot stage -> run -> cleanup GitHub Actions are allowed when their workflow is narrow, validated, and uses this fresh-base publish pattern.

## Concurrency

Use repository/workflow concurrency controls when two runs of the same job could overlap.

Concurrency controls are a convenience, not the primary integrity mechanism: scripts must still tolerate another actor changing the repository while they run.

For long-running jobs:
- snapshot exact input commits at start;
- treat output as a product of those snapshots;
- before publishing semantic changes, reconcile against current target state;
- generated outputs may either publish snapshot-stamped results or rerun against newer input, but must not pretend stale input was current.

## Cross-repo jobs

A job reading multiple repositories must treat each repository as an independent versioned input.

Record the commit SHA for every repo. Do not use vague labels such as `latest` in retained run manifests.

If a combined output contains metadata/content from a private repository, default its destination to a private repository. Publication to a public repo requires an explicit safe-publication decision; do not infer one from the fact that other inputs were public.

## Image / OCR / extraction jobs

Because extraction jobs may run simultaneously with archive work:

- write only to dedicated derived-output trees;
- never modify the source PDF/image/binary;
- use source hash + relative path as identity, not filename alone;
- avoid a single shared temporary filename/path; use per-run temp directories;
- atomic finalization where possible: write temporary output, validate, then rename/move into final destination;
- if final destination already exists with the same source/tool identity, verify/reuse rather than blindly overwrite;
- if it differs, preserve both or route to reconciliation.

## Temporary files

Temporary/state files must be either:
- outside repository trees; or
- inside a clearly designated ignored/generated temp namespace.

Do not leave generic names such as `output.json`, `temp.txt`, or `result.csv` at shared roots where concurrent jobs can overwrite one another.

## Validation / post-run checks

A script that writes should perform checks appropriate to its job, such as:
- expected outputs exist and are nonempty;
- JSON/YAML/CSV syntax validates;
- source count/coverage is plausible;
- output source IDs/hashes map back to actual inputs;
- no source files changed unexpectedly;
- quarantine exclusions remain absent;
- git diff contains only declared write scope;
- commit/push succeeded from a fresh base.

Unexpected writes outside declared scope are a failure condition.

## Run manifest / auditability

For substantial recurring or cross-repo jobs, prefer a compact machine-readable run record containing:
- run ID;
- start/end time;
- tool version;
- input repo SHAs;
- declared read/write scope;
- output hashes/counts;
- exclusions/quarantine-root counts without leaking quarantined content;
- success/failure status;
- published commit SHA(s).

Do not record credentials/tokens.

## Failure behavior

On ambiguity, collision, stale target, unknown source identity, or unexpected diff:

**STOP / RETRY / ROUTE — never guess and overwrite.**

A failed run is preferable to silent data loss.

## Worker / automation obligations

- Workers may propose improvements, but Sable owns cross-lane workflow redesign and project-wide execution-safety policy unless Nathan says otherwise.
- Infrastructure QA should audit scripts/workflows for compliance opportunistically and after incidents.
- Newly written scripts should comply from first use.
- Existing scripts are grandfathered only temporarily; upgrade them when touched or when they become active collision risks.
- Repeated manual scripts should be promoted toward repo-native, reproducible workflows when practical.

## Minimal compliance checklist

Before running a write-capable script, answer YES:

- [ ] Exact read/write scope declared?
- [ ] Correct quarantine/sandbox routing enforced before file access?
- [ ] Source artifacts preserved?
- [ ] Fresh target state fetched immediately before semantic writes?
- [ ] CAS/current-SHA or fetch/rebase protection used?
- [ ] No force-push / blind overwrite?
- [ ] Concurrent temp/output names isolated?
- [ ] Private-derived output kept private by default?
- [ ] Outputs validated and unexpected diffs rejected?
- [ ] Enough run/source provenance retained to reproduce or audit the result?

If not, the script should be treated as needing a safety upgrade before unattended use.

# Infrastructure QA / Pipeline Convergence Rotation

**Owner:** Sable systems, with Mercer and relevant workers contributing  
**Status:** ACTIVE  
**Authority:** Nathan directive, 2026-09-15

## Purpose

Continuously look for infrastructure mismatches, stale downstream artifacts, incomplete automation coverage, brittle triggers, broken wayfinding, and opportunities to improve archive accessibility/transparency across [[HsH]], [[GLASS]], and permitted [RESOURCES].

This is not a one-time audit. It is a recurring QA class in the automated task rotation.

## Core invariant

A source artifact entering the archive should eventually converge across every downstream surface that is supposed to represent it.

For uploaded conversations, compare at minimum:
1. source file exists in `DEVELOPMENT_FULL_CONVOS` or `LIVE CONVOS`;
2. Conversation Viewer catalog includes the source where eligible;
3. layered autotag manifest covers it where eligible;
4. Nathan Direct packaging contains eligible Nathan-authored messages;
5. Stage-2 queues reflect the current packaged substrate;
6. chronology/index/wayfinding surfaces are not stale where they are intended to be current;
7. no duplicate/superset/source-identity conflict has silently split or hidden the record.

Pipelines may run independently and asynchronously. QA asks for eventual convergence, not artificial serial dependency.

## QA classes

### Trigger coverage
- Does uploading/changing a supported source actually trigger every pipeline that should care?
- Are path globs complete for new folders/file types?
- Do bot-generated commits accidentally suppress a needed secondary pipeline?
- Are manual-dispatch-only workflows documented as such?

### Downstream convergence
- Compare source inventory against viewer catalog, tagging manifest, Nathan Direct manifest, Stage-2 manifest, chronology/indexes, and other expected derivatives.
- Flag missing, stale, duplicated, orphaned, or contradictory entries.

### Race / concurrency behavior
- Check whether simultaneous bots/workers can strand generated outputs, lose updates, create non-fast-forward failures, or trigger loops.
- Prefer deterministic rebuild-from-current-main and non-destructive retry patterns.

### Coverage / silent truncation
- Compare counts, source paths, message counts, hashes or stable IDs where available.
- Detect newly uploaded folders that are visible in one surface but absent in another.
- Treat unexpectedly unchanged outputs after source growth as a QA signal.

### Wayfinding / transparency
- Test Dashboard, Viewer, indices, crosswalks, and archive maps from a user's perspective.
- Look for dead ends, stale pointers, hidden-but-important source families, unclear status, or missing provenance links.

### Tool / infrastructure improvement
- Propose or implement safe scripts, manifests, reports, tests, trigger changes, integrity checks, and UI improvements.
- Prefer reusable automatic detection over one-off manual repair when practical.

## Rotation behavior

Sable should periodically choose `INFRA-QA` as a high-information run class, especially after:
- large conversation uploads;
- new archive folders;
- pipeline/workflow edits;
- tagging/extraction changes;
- Viewer/index changes;
- reports of missing or stale material;
- bot races or unexplained no-op runs.

Mercer is a natural independent QA partner for source/integrity/reproducibility checks. Other workers may report infrastructure anomalies to Sable for triage.

## Current issue discovered 2026-09-15

`layered-nathan-autotag.yml` previously did not trigger on conversation uploads; only Viewer generation did. This allowed new conversation folders to become visible in source/Viewer while archive-wide tagging/Nathan Direct packaging remained stale. Trigger coverage was repaired to include JSON/TXT under `DEVELOPMENT_FULL_CONVOS/**` and `LIVE CONVOS/**`.

This incident should become a regression case: future QA should compare newly added source paths against all intended downstream manifests.

## Escalation

Most infrastructure QA should be repaired/routed without Nathan. Raise sticky `🔶` only when a manual/local action, permission, policy choice, or Nathan-only decision is genuinely required.

# Mercer -> Sable / tagging-infrastructure owner — autotag source-lineage metadata

**Date:** 2026-09-15  
**Class:** infrastructure / provenance handoff  
**Status:** ready for owner disposition

## Transfer

Mercer has completed the bounded search for an already-existing durable source-snapshot lineage surface in the current autotag -> Nathan Direct -> Stage-2 chain. None was located in the inspected adjacent manifests/indexes.

## Why

The durable generated products now exist and their current count arithmetic is coherent, but artifact-local freshness cannot be reconstructed because the exact commit scanned by the autotag job is not retained in the visible root/Stage-2 manifests. The workflow can generate from one checkout and later publish the validated snapshot atop a newer `origin/main`, so publication ancestry is not a substitute for source ancestry.

## Evidence / exposure

Inspected without quarantine access:
- `.github/workflows/layered-nathan-autotag.yml`
- `indexes/autotag/` inventory and `AUTOTAG_SUMMARY.md`
- `indexes/autotag/conversation-tag-manifest.json` presence/blob identity
- `indexes/nathan-direct/MANIFEST.json`
- `indexes/nathan-direct/stage2/MANIFEST.json`
- repository search for `source_commit` / generation-lineage terms
- `WORKSPACES/COMMON/CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md`

Durable Mercer analysis: `WORKSPACES/MERCER/AUTOTAG_LINEAGE_QA_2026-09-15.md` and `WORKSPACES/MERCER/RUN_053_2026-09-15.md`.

## Complete vs incomplete

Complete: identification of the missing retained lineage and bounded search for an existing adjacent substitute.

Incomplete: implementation. Mercer has deliberately not redesigned tagging semantics or changed the tagging workflow.

## Minimum requested contract

If the owner elects to repair it, retain at least:
- exact scanned `source_commit`;
- source repository;
- run identity and UTC generation time;
- workflow/generator commit or blob identity;
- stable config/source-root/exclusion identity;
- publication-base commit separately from scanned source commit;
- existing counts; output hashes where practical.

## Must not be inferred

This handoff does not say the current tags/packages are stale, selective, semantically correct, or theory-authoritative.

## Return path

Mercer can audit the resulting metadata/freshness contract after implementation. No Nathan decision is currently required.

# Mercer — Autotag Generation / Freshness Lineage QA

**Date:** 2026-09-15
**Status:** QA finding / infrastructure proposal; not theory authority
**Scope:** `.github/workflows/layered-nathan-autotag.yml`, `indexes/autotag/`, `indexes/nathan-direct/`

## Finding

The layered autotag workflow now leaves durable repo-visible outputs (`indexes/autotag/` and `indexes/nathan-direct/`) and validates their basic syntax/non-emptiness before publication. This closes the earlier Actions-artifact-only durability gap.

However, the retained generated manifests do not currently carry enough machine-readable generation lineage to establish freshness against an exact source snapshot from the artifacts alone. In particular, `indexes/nathan-direct/MANIFEST.json` records generator identity and corpus/package counts but no exact source repository commit, workflow run ID, generation timestamp, generator blob/commit identity, or output hashes.

The workflow itself checks out `main`, runs the autotagger/package/Stage-2 pipeline, snapshots generated outputs, then on publication resets to the latest `origin/main` and re-lays the earlier validated snapshot. Its comment correctly states that the snapshot remains tied to the source state that produced it, but that source state is not written into the durable machine-readable output. Consequently, after later source changes, a consumer cannot determine from the manifest alone whether the package was generated from the current conversation corpus or from an earlier queued run.

This is a **lineage/freshness observability gap**, not evidence that the current autotag/Nathan Direct data are stale or incorrect.

## Evidence checked

- `.github/workflows/layered-nathan-autotag.yml`: durable generation, validation, fresh-base publication/retry, and artifact upload behavior.
- `indexes/autotag/AUTOTAG_SUMMARY.md`: current visible corpus counts (447 JSON scanned, 412 recognized conversation exports, 73,200 message records, 22,758 user messages, 0 parse errors).
- `indexes/nathan-direct/MANIFEST.json`: 73,200 input records, 22,758 input user records, 15,133 packaged unique user messages, 7,625 collapsed archive duplicates; generator path present, exact generation/source snapshot identity absent.
- `WORKSPACES/COMMON/CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md`: substantial recurring jobs should retain exact source commit/tool version/run provenance; GitHub Actions should record checked-out commit SHA.

## Minimum safe repair proposal for Sable / tagging-infrastructure owner

Do not change tagging semantics. Add generation metadata to durable machine-readable output, ideally once at the root manifest and propagated/referenced by downstream package manifests:

- `run_id` / GitHub Actions run identity;
- `generated_at` UTC;
- `source_repository`;
- exact `source_commit` used for the corpus scan;
- generator/workflow commit or script blob identity;
- declared source roots/exclusions;
- stable configuration (`window`, autotagger version);
- output counts already retained;
- optional SHA-256 for principal generated artifacts.

Because publication may occur after `main` advances, retain **both** `source_commit` (the scanned snapshot) and `published_against_commit` or equivalent (the fresh base onto which the deterministic snapshot was laid). Never label the latter as the source snapshot.

A later freshness check can then compare the retained `source_commit` with conversation-source changes after that commit and distinguish `CURRENT`, `STALE`, and `UNKNOWN` without inferring from commit adjacency or file timestamps.

## What this establishes / does not establish

Establishes: durable autotag output now exists; exact machine-readable source-snapshot lineage is insufficient for artifact-local freshness determination.

Does not establish: current outputs are stale; tags are selective/correct; Nathan Direct packaging is semantically authoritative; theory claims are correct; duplicate collapse policy is globally complete.

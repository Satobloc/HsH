# Tern-managed literature-review workflow

**Status:** PROVISIONAL PROCESS OVERLAY, effective 2026-11-02. This is a workflow specification, not a new automation, tool, task, or standing assignment.

## Scheduler decision

The literature-review function is integrated into Tern's existing Comptroller work through bounded stages distributed across the existing hourly leases. No task prompt was amended. No task ID, enabled state, DTSTART, hourly recurrence, minute phase, or worker ring was changed.

Live readback:
- :00 Archive — enabled, task ID `6aa1fe0de5e48191b886496095b1343f`.
- :12 Mind — disabled, task ID `6aa61b3b2e4081918927a35b61007acc`.
- :24 Geometry — enabled, task ID `6abda4c8eda88191bf23a6f2849e9a17`.
- :36 Worldtube — enabled, task ID `6a9f52b69ec08191b0a2ba24a074f781`.
- :48 Review — enabled, task ID `6aa6c3bc02b48191b8a91a30d2a155e0`.

There are four enabled hourly leases and one disabled phase. No sixth task exists or is to be created. The four active leases retain their existing schedules and lane-specific prompts.

## Stage model

Each accepted review question receives one bounded stage per suitable existing worker appearance. Tern maintains the scope, stage state, owner, and next cursor.

0. **Intake and internal-first recovery (Tern).** State the decision question, target claim, intended use, scope, date range, inclusion/exclusion rules, and known project sources. Search the existing archive, source index, and active review queue before external discovery. Record duplicate checks and unresolved source genealogy.
1. **Search protocol and discovery (Tern/Hale).** Record platform or database, exact query, search date/time, filters, date range, result count, and export/record identifiers. Use existing SciSpace discovery/triage and ordinary publisher or repository sources. A single search is a pilot, not a systematic review.
2. **Identity and citation checks (existing tools; Mira only if currently authorized).** Use Scholar Sidekick for title/identifier matching and retraction checks. Use the existing citation workflow for primary-record retrieval, page anchors, and public-usable citations. A DOI/title match is metadata verification only; it does not establish that the primary record or full text was retrieved. Academic Writing Toolkit can check BibTeX syntax and citation consistency against supplied notes; it is not a substitute for primary-source verification.
3. **Primary-source retrieval and extraction (Hale or domain specialist).** Record the exact version, publication status, full-text access, pages/sections read, system/task, sample and sampling unit, model/provider/version, prompts/tools, controls, outcome definitions, uncertainty, statistical tests, null results, limitations, and data/code availability. Distinguish measured observations, model outputs, calibrations, predictions, and fits.
4. **Evidence graph and claim map (Tern plus domain owner).** Keep source ancestry separate from exposure ancestry. Record who supplied which source, what each agent/model saw, when communication occurred, which outputs were revised, and who evaluated/adjudicated the result. Distinguish independent calls from distinct model families. Agreement alone is not independence; observed provenance separation is not statistical independence.
5. **Independent review and synthesis (worker other than discovery lead).** Check extraction against the primary text, look for contradictory and disconfirming results, and preserve analysis-unit ambiguities. The domain owner retains interpretation and authorship. The :48 Review lease is available for independent QC only when its selected worker's charter and current workload fit; it is not permanently reassigned.
6. **Close, park, or publish (Tern).** Record status, checksum/readback where applicable, unresolved blockers, owner, and exact next cursor. Public-safe research output uses the existing issue publisher. If the publisher blocks before creation, report that exact state; do not bypass it or duplicate a submission.

## Evidence states

- `LEAD_ONLY`: discovery result or citation metadata, no primary record.
- `PRIMARY_RECORD_RETRIEVED`: publisher/repository record retrieved, version and identity checked.
- `FULL_TEXT_READ`: exact primary text and read extent recorded.
- `EXTRACTED`: methods, results, limitations, and claim-to-evidence mapping recorded.
- `INDEPENDENTLY_CHECKED`: another reviewer or reproducible data/code check has verified the extraction.
- `REPLICATED`: an independent measurement or reanalysis supports the result.

Do not promote a record merely because a search engine or citation checker returns a match.

## Role boundaries

- **Tern:** intake, scope, scheduling, stage allocation, duplicate control, provenance ledger, next cursor, and Python offload where useful.
- **Hale:** external literature discovery, primary-source retrieval, and quantitative/methodological extraction. Existing work takes priority; optional handoffs do not create new obligations.
- **Mira:** quarantine-safe citation/prior-art work only when her current authorization and content boundary permit it. No internal-review payload or inbox access is assumed.
- **Cross:** factual/provenance chronology only, and only when a specific task requires it. No theory interpretation or general literature assignment.
- **Orson Vay:** retains ownership of the cognition/P1 work and the protected cognition allocation. External evidence is optional context, not a transfer of authorship or decision authority.
- **Morrow and other archive workers:** source chronology and identity checks within their own charters; no blanket reassignment.

## Reporting standard and tool budget

For a full systematic review, use PRISMA-S search reporting (16 items) and PRISMA 2020 selection/reporting. Do not call a one-query evidence map or pilot a systematic review. Use existing SciSpace, Scholar Sidekick, Academic Writing Toolkit, GitHub/archive search, and free publisher/repository access. No new code, dependency, paid service, or automation is required for this workflow.

## Current pilot cursor

Question: distinguish passive peer-answer exposure from reciprocal multi-LLM deliberation, and determine whether post-discussion private re-ratings can count as independent evidence.

Pilot result and limitations are recorded in `WORKSPACES/TERN/2026-11-02T0624Z_LITERATURE_REVIEW_PIPELINE_INTEGRATION_AND_PILOT.md`.

Next bounded steps:
1. Hale may, after his current publisher-retry work, check whether the OSF lead's primary record/full text and the deliberation preprint's promised data/code are accessible.
2. Orson retains the P1 decision and may decide whether the new extraction belongs in his existing evidence map.
3. Mira's quarantine-side stage remains `NOT_ENGAGED` under the current boundary; no inbox write or research payload was sent.
4. Cross was not needed for this pilot.

This overlay is provisional. Reassess after Hale/Orson feedback and two Tern appearances. Do not alter the four existing task prompts or schedules without explicit authorization.

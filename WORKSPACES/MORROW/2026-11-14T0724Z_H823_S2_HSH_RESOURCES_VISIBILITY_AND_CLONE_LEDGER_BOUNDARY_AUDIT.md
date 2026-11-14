# Morrow h823:s2 | HSH_RESOURCES visibility and clone-ledger custody audit

**Disposition:** SOURCE-CUSTODY BOUNDARY CONFLICT IDENTIFIED; NO PRIVATE LEDGER WRITE; NO PUBLIC TELEMETRY COPY; MORROW THEORY-FREEZE PRESERVED.

## 1. Selection and scope

- Nominal slot: 2026-11-14T07:24:00Z.
- Rotation: h=823; seq=5h+2=4117; 4117 mod 19=13.
- Selected routing label: **Morrow**, ring index 13.
- Next routing label: **Kestrel**, ring index 14.
- This deterministic selection is not authentication of a historical Morrow instance or current ChatGPT thread.

Morrow's controlling historical remit is Team Archivist: broad corpus appraisal, source custody, preservation, and GitKeeper coordination. The original source locator is conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, raw-export blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`, with direct user-role messages:
- `402ade01-7116-4efb-9b14-31e477754458` (2026-09-08T03:25:36.187Z): provisional Team Archivist remit.
- `934e87de-4e61-4622-a0ea-e5047aa235c6` (2026-09-13T00:11:10.939Z): direct theory stop and quarantine.
- `99ae959b-fbeb-4c1e-9326-a6723c2b9557` (2026-09-13T15:31:22.757Z): bounded archive/maintenance trial.

No standalone signed Morrow charter was recovered. The later archival-maintenance trial does not expressly lift the earlier theory stop. The current Lane 24 research direction is supported here only through provenance, source custody, and measurement-documentation boundaries. No physical calculation, CODATA comparison, theory integration, equation correction, Lean rerun, paper work, or BEDROCK promotion was undertaken.

## 2. Three-repository orientation

The current onboarding distinguishes:
- `Satobloc/HsH`: live project and workflow control.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25`: historical SAT preservation, provenance, and source recovery.
- `Satobloc/HSH_RESOURCES`: external-reference, extraction, bibliography, and exposure-evidence surface, with a private-reference boundary.

The HsH onboarding and the HSH_RESOURCES root README both direct workers not to create public HsH/archive documents that depend on private HSH_RESOURCES URLs. The root README describes HSH_RESOURCES as private research infrastructure and excludes it from the public cross-link surface.

## 3. Access-control mismatch

A current GitHub repository-metadata read returned `visibility=public` for `Satobloc/HSH_RESOURCES`, while its own root README and the three-repository onboarding treat the resource surface as private/internal and not for public cross-linking.

This is a real access-control/documentation mismatch. A README instruction is not an access-control mechanism. If the intended policy is private storage, the repository's actual visibility does not enforce that policy. If the repository is intentionally public, the documentation and any restricted-content placement need owner review and a deliberate separation.

**No repository visibility setting was changed.** No source file was copied, moved, deleted, or overwritten. No HSH_RESOURCES URL was added to a public HsH document. No raw scientific source or `PRIOR_ART` payload was opened in this Morrow pass.

Boundary correction: a preliminary WH-01 operational preflight, before the Morrow-specific root-only rule was recovered, had already read the source-inventory workflow definition and a bounded set of generated run-manifest metadata. Those reads were operational metadata, not scientific source payload. After recovering Morrow's root-only boundary, further HSH_RESOURCES payload reads stopped. No run IDs, source revisions, manifest bodies, or private source content were copied into HsH.

## 4. Clone-ledger consequence

HsH's `WORKSPACES/COMMON/CLONE_LEDGER_STANDARD.md` defines event-level provenance, and public issue #1703 requests a machine-readable append-only ledger spanning HsH, the historical SAT archive, and HSH_RESOURCES, plus daily Traffic reconciliation.

The ledger's exact event key necessarily carries repository, workflow run, attempt, job, checkout step, and source revision. No approved private storage destination was identified that can safely hold the HSH_RESOURCES portion while preserving its declared boundary. The public HsH workspace is not an appropriate substitute for restricted telemetry.

Therefore:
- No new ledger was created.
- No HSH_RESOURCES run IDs, job IDs, source revisions, or exact event records were copied into HsH.
- The public issue #1703 and its existing aggregate were not edited.
- No duplicate issue or publisher submission was created.
- The connected GitHub tools expose no dedicated repository Traffic API or complete workflow-run-list action; a complete 14-day Actions census and daily Traffic reconciliation were not performed.
- No clone/view counts, unique-cloner totals, or daily snapshots were inferred from checkout steps.

A bounded operational sample is not a period-wide census. An `actions/checkout` step is a checkout event; it is not automatically a confirmed GitHub Traffic clone. Keep `UNKNOWN` until the actual Traffic measure and the event-classification rule can be compared.

## 5. Scope and control state

- Morrow remains Team Archivist/source-custody only; no theory or physical work.
- Tern retains scheduler, task-graph, and workflow-health authority.
- P0 Code Grurple remains ACTIVE.
- P1 cognition remains Orson-owned / OVERDUE / NOT READY.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- FIE next review: November 24, 2026.
- All four Mersearch lanes remain occupied/requested; no request was overwritten, retried, released, or duplicated.
- No task, task ID, enabled state, schedule, phase, cadence, branch, PR, dependency, or automation was changed.

## 6. Reading and next cursor

Unrelated reading completed: `SAT Mark V/TheTANGLE.txt`, lines 2001-2040. Next cursor: **2041**.

**Next useful operation:** obtain an owner decision on the HSH_RESOURCES access class and designate an actually private location for the cross-repository event ledger. Until then, preserve the existing public aggregate and do not persist restricted run-level telemetry in HsH.

**Publication:** not submitted. This is an internal source-custody/control finding, not a scientific result. No existing publisher trigger was invoked.


## Amendment 01 — repetition check / existing S09 record

The visibility mismatch is **not a new discovery**. The live [Phase Steering 2026-10-26](../COMMON/PHASE_STEERING_2026-10-26.md), blob `0ddce5ac7fade329f491927b5cbeb53d325f2d7a`, already records it under **S09 — Licenses / publication permissions**: HSH_RESOURCES is public in GitHub repository metadata despite older private/reference-only documentation, with an explicit legal/visibility review and urgent exposure check. S08 already owns the broader traffic/analytics and privacy-controlled collection programme.

This run therefore confirms an existing S09 control item and documents its consequence for clone-ledger storage. It does **not** create a new issue, task, escalation, or competing privacy workstream. The existing S09 owner/review route remains authoritative; no visibility or licensing setting was changed. The report's original “identified” wording should be read as “confirmed by this bounded pass,” not “newly discovered.”

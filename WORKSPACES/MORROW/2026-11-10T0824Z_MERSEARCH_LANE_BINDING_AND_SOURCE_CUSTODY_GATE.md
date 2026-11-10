# Morrow h728:s2 | Mersearch lane binding and source-custody gate

**Nominal time:** 2026-11-10T08:24:00Z  
**Run key:** `REVROT3-19-20261011:728:s2`  
**Disposition:** SOURCE-CUSTODY / WORKFLOW-ROUTING QA COMPLETE. Four live Mersearch lanes remain occupied. One additional request file is unbound to any workflow. No theory work, physical calculation, new Mersearch request, publication, or scheduler mutation.

## 1. Deterministic selection and identity boundary

The controlling fixed ring gives:

- (h=728), nominal UTC hour since 2026-10-11T00:00Z.
- (seq=5h+2=3642).
- (3642\bmod19=13): Morrow, ring index 13.
- Successor: Kestrel, ring index 14.
- Next slot key: `h728:s3`.

This is deterministic label selection only. No authenticated live Morrow conversation/thread was established. The current scheduler record has `chat_ref=null`. No cross-thread delivery or participation claim is made.

## 2. Historical specialist authority

The source is conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, raw 697-node snapshot blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`; the earlier 465-node snapshot blob is `362075c5e32ec9e97579bd1de58fba7f612cb6bb`. These are two snapshots of the same conversation, not independent witnesses.

Three original user-role messages were checked directly:

- `402ade01-7116-4efb-9b14-31e477754458`: Nathan provisionally addresses Morrow as Team Archivist, asks for a flexible corpus-appraisal plan, and describes coordination with GitKeeper.
- `934e87de-4e61-4622-a0ea-e5047aa235c6`: direct stop on theory work and quarantine of produced unique artifacts.
- `99ae959b-fbeb-4c1e-9326-a6723c2b9557`: later invitation to the recurring archive, maintenance, training, and reconstruction trial. It permits bounded source comparison and equation checking, but does not expressly lift the earlier theory stop.

The current Morrow README and h724:s3 receipt preserve the same boundary. The current Lane 24 charter is therefore handled as source custody and provenance routing only. No theory integration, physical prediction, fit, paper work, equation correction, Lean rerun, or BEDROCK promotion is authorized or performed.

## 3. Live repository and workflow state

Read snapshot: HsH `main` at `d76f6080b687375faaa97484f20c005d7e44a5d6` (2026-11-10T07:58:28Z). Live BEDROCK blob: `0253ace674bbc361464b7bbaac2c41aa3d8e8867`. Task graph blob: `eafcf5d640f06ae7119e2ea2a697c0606205446c`, updated 2026-11-10T04:33:20Z.

The task graph still declares 16 branches while carrying 18 branch records. This remains Tern-owned and unresolved. No active Morrow branch is assigned in the task graph. Seven historical Morrow-named branches exist; none was changed or treated as a current assignment.

The older 2026-09-14 Coordination statement that Morrow had been removed from recurring automation is historical and superseded for this run by the newer explicit 19-person revival ring and the live enabled :24 task. No schedule or task configuration was changed.

## 4. Mersearch dispatch audit

Pinned Mersearch remains `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`. No Mersearch connector is exposed in this runtime and no local three-repository checkout exists. The repository's existing four-lane GitHub Actions bridge is available, but all four actual request lanes are occupied. No new query was submitted.

| Actual lane | Workflow input | Request ID | Current file status |
|---|---|---|---|
| 1 | `MERSEARCH_REQUEST.json` | `calder-angle-geometry-source-fidelity-20261102-1337` | `requested` |
| 2 | `MERSEARCH_REQUEST_LANE_2.json` | `archive-harvest-20261025-optics-01` | `requested` |
| 3 | `MERSEARCH_REQUEST_LANE_3.json` | `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001` | `requested` |
| 4 | `MERSEARCH_REQUEST_LANE_4.json` | `kestrel-finite-core-geometry-source-fidelity-20261102-2200` | `requested` |

The matching workflow paths are:

- `.github/workflows/mersearch-request-bridge.yml` for lane 1.
- `.github/workflows/mersearch-request-bridge-lane-2.yml`.
- `.github/workflows/mersearch-request-bridge-lane-3.yml`.
- `.github/workflows/mersearch-request-bridge-lane-4.yml`.

The current `indexes/mersearch_requests` directory contains no request-scoped output folder for these four current request IDs. No current manifest or compact receipt was found. Lane 2 has a historical execution recorded in issue #582, but its 352.48 MB raw JSON push failed GH001 and it has no current request-scoped receipt; it must not be blindly retriggered.

### New dispatch-binding discrepancy

An additional file exists:

`WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_1.json`

It contains request ID `june-2025-big-paper-interpretive-modes-20261103-1200`, but has no `status` or `lane` field. There is no matching lane-1-specific workflow, no path filter for this file in the generic lane-1 workflow, and no request-scoped output directory.

**Classification:** `UNBOUND_REQUEST_FILE / NO_WORKFLOW_TRIGGER / NO_OUTPUT`. It is not a fifth active lane. The actual lane-1 input remains the legacy `MERSEARCH_REQUEST.json`. Preserve the unbound file; do not delete it, trigger it, overwrite it, or treat it as an active lane. This is a new precise mismatch beyond the four-lane topology already documented in issues #597, #1199, and #1211. It is routed to Tern for owner-side disposition, with no task or response obligation.

The current lane 1, lane 3, and lane 4 queries already cover SAT-O/Blockwave source paths and related geometry/equation terms. Repeating those searches would duplicate occupied work. No SAT-O or Blockwave equation was recovered, transcribed, or corrected in this run.

## 5. CODATA and measured-system carry-forward

The existing Morrow source-custody publication, issue #1328, remains the correct non-duplicated reference:

- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-codata-vortex-source-custody-20261104t0024z-s2-001.md`.
- Artifact blob: `7f92bca3cd0122ae0f693ca3723b9d38d6f84fc9`.
- SHA-256: `080772ccb85ed86b43e6a14e46aa236c1d80db21202f21cd54a3931f03031913`.
- CODATA source: 2022 set, NIST web version 9.0 dated 2024-05-09; Mohr, Newell, Taylor and Tiesinga 2025 adjustment paper.
- The packet records the heterogeneous 133-input/79-adjusted-constant evaluation, the separate G weighted mean of 16 measurements, three correlated pairs, and the 3.9 uncertainty expansion.
- The air-water vortex paper's acquisition geometry and stated PIV/PTV uncertainties are recorded, but the cited Figshare raw-data metadata, version, inventory, and checksums remain unverified. The dispersion comparison is fit-conditioned, not a blind holdout.

No CODATA numerical comparison, physical calculation, fit, prediction, or independent measurement was performed. P2 still has no selected measured system. The existing packet was reviewed as carry-forward context, not repeated.

## 6. Tool and source-navigation preflight

The HsH, SAT archive, and HSH_RESOURCES onboarding/front doors were reviewed, including the HSH_RESOURCES index and Tool Chest. Existing resources include archive tools, the H(s)H Toolkit, DATA, Math Hopper, and Whirligig. Existing Math Hopper issue #578 / draft PR #991 remains an extraction/provenance pilot marked NOT VERIFIED; the Whirligig kernel remains SANDBOX ONLY. SciSpace is available as an external academic-search connector but is not a substitute for internal Mersearch retrieval. No new tool, fork, dependency, paid service, or branch was created.

The current HSH-PUBLISH-V1 issue publisher was not used: this is a bounded internal workflow-routing notice, not a new scientific result or public submission. Existing issues #597, #1199, and #1211 were checked to avoid duplicate publication. No new issue or PR was created.

## 7. Freshness and unrelated reading

- FIE rereview was completed by Aldus on 2026-11-10T00:17Z; next review due 2026-11-24. No duplicate review was performed.
- Babbage reading remains parked at lines 1701-1740, next 1741, pending the old/new blob crosswalk.
- To change lens rather than repeat a blocked cursor, the unrelated Project Gutenberg text *The Book of Tea* by Kakuzo Okakura (eBook #769) was read at lines 625-1092. This overlaps the earlier 625-780 range and extends the previously recorded 821-860 reading. Next cursor: line 1093. No analogy or theory premise was imported.
- This automation runtime cannot take a physical walk or stand break; none is claimed.

## 8. Campaign and final boundaries

- P0 Code Grurple: ACTIVE.
- P1 cognition, November 9: OVERDUE / NOT READY / Orson-owned.
- P2 measured-system geometry, November 30: HOLD.
- P3 full theory, December 14: INCOMPLETE.
- Orson's cognition remit remains protected. No paper gate was advanced.

No task, ID, schedule, phase, cadence, branch, signet, or conversation name was changed. No sixth task was created. No raw Mersearch output was opened. No restricted source was accessed. No BEDROCK or theory status was changed.

## 9. Next exact operation

Tern may decide whether to reconcile the unbound `MERSEARCH_REQUEST_LANE_1.json` file and the related documentation drift. Do not alter it in this run. When one of the four actual lanes is genuinely released and its completion is verified, use pinned stable 1.0 across all three repositories to recover original SAT-O/Blockwave equations, exact source dates and blob SHAs, preserving verbatim originals and any corrections in separate artifacts. Morrow remains source-custody only unless Nathan explicitly changes the specialist boundary.

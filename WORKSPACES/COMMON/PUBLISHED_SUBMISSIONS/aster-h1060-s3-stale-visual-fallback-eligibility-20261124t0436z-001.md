# Aster h1060:s3 | stale visual fallback eligibility cross-read

**Run key:** REVROT3-19-20261011:1060:s3  
**Nominal UTC:** 2026-11-24T04:36Z  
**Disposition:** NEW_COMPANION_REGRESSION_GAP / SOURCE_MATCHED_BRANCH_REPLAY_PASS / NO_CODE_CHANGE / P0_ACTIVE.

## 1. Selection and source authority

\[
h=1060,\quad seq=5h+3=5303,\quad 5303\bmod19=2.
\]

- Selected routing label: **Aster**, index 2.
- Next ring label: **Ariadne**, index 3.

Aster's historical source is raw-export blob 1bf6e65c4ac1650297acb67d7e39f700454a03c8, with 39 direct user-role messages in the existing parsed source record. No standalone signed specialist charter was recovered. Direct-user source anchors recorded there include:

- d15369d1-1412-4f4a-9460-702d2de573ea (2026-09-22T05:37:41.366Z): test whether a claim reads like Nathan, appears elsewhere, or contradicts earlier statements.
- 01505af7-37cd-491f-a951-1822934e36ff (2026-09-22T19:03:08.093Z): historical Paper A review assignment, superseded by the current roster.
- e3067f7b-f1c2-45fb-ab98-075d4a798ae5 (2026-10-11T12:00:14.494Z): prior-art review-team clarification.

The raw export's embedded conversation ID 6ab006ce-23a8-4e11-8c7a-3b04d6b7a51e differs from workspace pointer 6ab006ce-e358-83ea-b3dd-7b23a26c00fa; they remain unresolved and are not equated. The connector returned an empty body for the raw-export fetch despite the known blob SHA, so this run relies on the already-parsed source-backed role record, not a fresh raw parse.

Current Code Grurple authority is **REVIEW FROZEN / CROSS-READ OPEN**. This is a bounded cross-read of a new P0 implementation finding, not a formal Paper A review, approval, or reopening of the frozen manuscript lane. Aster h1056:s4 Review-MIND cross-graph work was read and not repeated. Its HSH_RESOURCES access stop remains controlling; no HSH_RESOURCES payload was accessed.

No authenticated current Aster thread was established. The candidate manual-thread pointer remains unverified. No direct-thread delivery, historical-instance participation, or cross-thread acknowledgment is claimed.

## 2. New companion finding: stale visual fallback bypasses current eligibility

This extends, rather than duplicates, Mercer's document-record finding in https://github.com/Satobloc/HsH/issues/2467.

At PR #2009 exact head f638cb3ce94006609b4ba3f7c6e2c5724048c45d:
- tools/site_discovery.py blob 2c2db5f7f4878555d8031e6bb14b1e846de0cbe5 (10,707 bytes).
- tests/test_site_discovery.py blob c828f2af42c036ec63c7bf9814be35711f043b04 (6,809 bytes).
- PR-head discovery-doc blob 55d6a3fa80fea4d09719238177bef147fa0fdffc.

Current main at readback was 2a96eea4b307c7244fa9b6125d04786a7939ab78; main's tools/site_discovery.py remains pre-PR blob 97ff9c6d00544251c05bd6bb6053907805438f3e. PR #2009 is OPEN / DRAFT / UNMERGED, with no formal reviews.

The fresh visual scan applies a current path predicate: blob under SAT_VISUALS/, not matched by the current EXCLUDED regex, and suffix in .png/.jpg/.jpeg/.webp. EXCLUDED is the current case-insensitive pattern for prior-art, quarantine, and the removed Science Made Stupid material. A square image() record can carry path, sha, dimensions, thumbnail, title, classification, and source_url.

When the HsH repository tree is stale, however, the fallback executes:

    visuals.extend(previous.get('visuals', []) if name == 'hsh' else [])

It does not reapply the current visual predicate. PR #2009 sanitizes workspace document records, but the parallel visuals collection is carried forward unchanged. A last-good visual whose path is now excluded can therefore remain in the stale discovery manifest, including old thumbnail/source-URL fields.

The current PUBLIC_SITE/AUTOMATIC_DISCOVERY.md says the Glass Sausage Factory consumes PUBLIC_SITE/generated/discovery.json and copied gallery thumbnails. The stale visuals collection is therefore a distinct discovery surface.

### Executed bounded reproduction

A Python control-flow replay used the exact source predicate and stale-fallback operation with synthetic placeholders:

| Prior visual path | Current fresh-scan eligibility | Stale fallback |
|---|---:|---|
| SAT_VISUALS/QUARANTINE/figure.png | False | Retained unchanged |
| SAT_VISUALS/approved/figure.png | True | Retained unchanged |

Both assertions passed. This is a source-matched minimal branch replay, not a full-module test, repository snapshot finding, CI run, or live browser observation. No actual quarantined image, private asset, or generated thumbnail was fetched. No evidence establishes that a currently excluded visual exists in the live generated snapshot.

### Smallest corrective rule

Factor the fresh predicate into visual_eligible(path), then apply it to both fresh and last-good visuals. In the stale HsH fallback, retain only prior visual records for which visual_eligible(record.path) is true. Add a regression test seeding one excluded visual and one eligible positive control, force the HsH tree stale, and assert only the eligible record remains in the manifest.

Do not delete orphaned thumbnail files in this narrow fix; asset cleanup is a separate retention/deployment decision.

The proposed invariant is:

\[
\forall v\in V_{\mathrm{stale}},\quad
\operatorname{visualEligible}_{\mathrm{current}}(v.\mathrm{path}).
\]

This is a proposed source-level invariant, not a Lean theorem. Existing PR #1471's discovery projection model does not presently supply a visual-record/path predicate. This runtime has no local lean, lake, or elan; I did not modify another worker's formalization branch or create a parallel abstract theorem that would not verify the Python translation.

### Adjacent documentation boundary

The discovery documentation says PRIVATE resources are excluded, while the inspected EXCLUDED regex has no literal private term. The repository allowlist scans only HsH and the public SAT archive, and a bounded search found no SAT_VISUALS/PRIVATE path. This is a documentation/predicate question, **not** evidence of private-resource exposure.

## 3. P0 and campaign boundaries

Parent P0 issue #1747 remains active. Tern retains release/standdown authority; Meridian retains implementation ownership; Mercer retains independent Paper A/B presentation QA. Aster remains cross-read only. No owner change, merge, deployment, route acceptance, or standdown is claimed.

The generated discovery snapshot was not independently fetched and parsed in this run. The stale visual finding is conditional on a last-good manifest containing a record now excluded by policy; it does not establish a currently exposed record or live visitor rendering.

Tern h1058:s4's Primary Workflow Health deep review is already complete and published at issue #2468; it was read, not repeated. No PWH queue or task-graph mutation was made.

- P1 November 9 cognition paper: overdue, frozen, Orson-owned, not ready.
- P2 November 30 major paper: HOLD; the November 23 first-draft/hostile-review gate is not demonstrated.
- P3 December 14 full-theory paper: incomplete.
- FIE next full review: December 4, 2026.
- Mersearch was not callable; all four request lanes remain occupied/requested. No lane was overwritten or retriggered.
- HsH onboarding/root README, SAT archive root README, BEDROCK, Steering Charter, Three Paper Campaign, Aster BOOT/CURRENT_WORK/INBOX, revival/thread-first controls, Code Grurple roster, current main, predecessor receipts, PR #2009 and issue #2467 were consulted.
- HSH_RESOURCES payload was not accessed, respecting Aster's recorded access stop.
- Existing Math Hopper #578 / PR #991, Whirligig Kernel 0 and available SciSpace capability were checked. No new tooling, dependency, fork, subscription, or expenditure.
- No physical system, dataset, fit, prediction, uncertainty propagation, SAT-O/Blockwave equation correction, manuscript review, or BEDROCK promotion.

## 4. Return position

**NOW:** A second stale-fallback surface is identified: PR #2009 sanitizes document records but carries the prior visual collection forward without current eligibility revalidation. A bounded synthetic branch replay reproduces the conditional behavior.

**NEXT:** Meridian should reapply the current visual predicate in stale fallback, add the excluded/eligible visual regression pair, and run exact-head tests/CI. Tern decides P0 acceptance. The generated manifest and live visitor rendering must be inspected independently before any exposure or safety claim.

**STOP:** No code edit, PR merge, live route probe, deployment, formal Paper A review, task reassignment, scheduler change, physical inference, or theory promotion.

**Source return:** PR #2009, Mercer issue #2467, P0 issue #1747, and Tern PWH issue #2468.

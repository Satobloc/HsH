# Amendment 01 | Hale h773:s0 source-fidelity and routing reconciliation

**Observed:** 2026-11-12T05:26:56Z reconciliation invocation  
**Nominal slot:** 2026-11-12T05:00Z  
**Run key:** REVROT3-19-20261011:h773:s0  
**Ring:** Hale (index 8) → Elias Kern (index 9)  
**Canonical receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-12T0500Z_s0_hale.md`  
**Existing handoff:** `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-12T0500Z_from_s0_to_s1_elias_kern.md`  
**Existing public issue:** #1625, submission `hale-h773-cs-scaffold-equivalence-contract-20261112t0500z-s0-001`  
**Original artifact:** `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h773-cs-scaffold-equivalence-contract-20261112t0500z-s0-001.md`  
**Original artifact SHA-256:** `c34373d7f8bc55cc4ab1a3e4f0f8f3c9ad0ed39d7c8eccf0388718c9a93c9ca1`  
**Publisher comment:** #6815534019, commit `90643f70e869af0bb646f19757b2f0b5f0c3a8df`, exact readback verified.  
**Additive source-correction comment:** #6815848654, posted 2026-11-12T05:49:54Z and independently read back.  
**Main branch before this amendment:** `d9977a9fe942319733ab2c72e0d8a31d9c09b780`.

## Idempotency and publication

This was a duplicate invocation of an already published h773:s0 run. The canonical receipt, outgoing handoff, Elias inbox pointer, issue #1625, and fixed-destination artifact already existed. No second issue, submission, receipt, or handoff was created. The existing artifact was not overwritten. The correction was appended as a comment to the original issue; the original artifact and its SHA-256 remain unchanged.

## Source-fidelity corrections

The public correction comment #6815848654 contains the full source-locator and attribution correction. The key findings are:

1. The issue's `a96d56d7-32cc-40b9-9e88-7f3f93ef1ef7` locator is invalid. `a96d56d7-59bc-48cc-8338-0a37240e8fd4` exists at 2026-10-10T02:25:38.537Z, but is explicitly a Morrow/Kestrel cross-post. “SAT is worldlines; H(s)H is worldtubes” must not be treated as independent Nathan-origin evidence. The mixed message `59c5c4c6-c914-48d4-af4c-5f53a1698f37` at 2026-10-10T03:15:17.286Z contains a direct continuation after “One additional important detail...”: worldlines do not wrap; the proposed core worldtube is tentative ER/Kerr, with a Kerr shell as a surface-interaction boundary. It does not define a map. The 2026-10-09 direct messages `6f00a97a-aa84-45bf-9429-4ff70736014a` and `3c657387-b80b-4982-a61a-8e6d8568b8d1` remain the stronger evidence for one physical core/hollow outer coil and the worldtube-curvature/inertia proposal. Message `5a929b5e-515e-4f77-a32a-e49feef42812` is mixed-source; only the user's own segment counts as Nathan Direct.

2. Ravel snapshot custody: `c49367b0faa424491e7b3520a034b9e44fe6897f` is the shorter 2026-09-06 to 2026-09-10 snapshot. The full snapshot is HsH blob `17cfe3feb830f70009557d063482b35adba0834b`; its 12,408,770-byte Library raw export SHA-256 is `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`. The issue's `b3be09f1...` is not the verified full-export checksum. `WORKSPACES/RAVEL/STATE.md` records this distinction.

3. The correct source blobs are `57d249bb6eb2bbd8c4585fe5bb74e523877e1db1` for `LIBRARY/presented/SAT_HowTo_AnalogueToCalibration.tex` and `902b7dfb10647b5f19bd0bb4997b1bcafe52b104` for `WORKSPACES/STORYO/SOLVER_PACKAGE_2026-09-28/geometry_engine.py`. The original method-note equation is `X(s) = C(s) + R(s)[N1(s) cos θ(s) + N2(s) sin θ(s)]`; `X_C(s)` is an assistant relabeling. The coauthored 2026-09-28 note is a method/analogue, not a validated physical model. The engine is 3D arbitrary-unit geometry/rendering; `same_c_advance_fraction` is a global `L_parent/L_child` ratio, not a local parameter-time map.

4. The 2026-09-07 Ravel mutual-accommodation language is historical. Nathan Direct messages `090f5160-1020-486d-9c42-df3d7dff2063` and `c5525f53-b7cc-4444-8102-3bf6fdb1c892` on 2026-10-21 explicitly retire reciprocal deformation of two independent objects and describe one 4D Klein Fabric with two aspects. Do not treat the earlier Ravel formulation as the current ontology.

5. “Normal-bundle map” overstates the mathematical result. The report contains a dimension/type check: a 1D embedded centerline in M⁴ has a rank-3 normal quotient; an orthogonal normal bundle requires a metric. No source-defined projection, bundle map, connection, local transport, or physical 4D worldtube construction is supplied. A 1D × 3D local product is full-dimensional in M⁴, so a 3D Kerr section is not automatically the normal bundle. The equivalence contract is an assistant-proposed checklist, not a Nathan Direct equation or established physical theorem.

6. PR #1133 run #43109180575 succeeded, but the job log explicitly checked out `refs/remotes/pull/1133/merge` at `e4c4636e`, not PR head `19479ee3`. It is a merge-reference build, not an exact-head standalone build. The PR remains draft/open/unmerged. The existing Lean module checks an abstract formalized statement, not the source translation or physical premises. Aster's current-work note says exact-head; the job log contradicts that claim. The report's merge-ref classification is correct.

## Mersearch and three-repository coverage

The previously cited completed cross-repo receipt was recovered at historical HsH commit `8c6f49d846af9f99b6314e84e47f76c7ff2b6dfc`: `indexes/mersearch_requests/sable-j3-j2-original-source-crosswalk-20261101-0128/`. Its manifest records a three-repository scan of SAT_THEORY_ARCHIVE_2023-25, HsH, and HSH_RESOURCES: 16,185 files, 20,860,801 records, 64,145 hits, 212 distinct sources. Its query was broad and focused on Tourist Tailor, Blockwave, SAT4D, and 2-form/3-form terminology; it is navigation only, not a geometry-specific search or evidence. Raw search results were withheld.

The four live Mersearch request lanes remain occupied/requested; none was overwritten or retriggered. No dedicated Mersearch connector or local executable was available in this runtime, and the HSH_RESOURCES `tools/` listing contained no Mersearch tool. This run used existing Mersearch navigation receipt, GitHub code search across all three repositories, and Files retrieval of original conversation exports. No new request, tooling, fork, or paid service was created.

## Rotation and handoff reconciliation

- Expected incoming predecessor for h773:s0 is h772:s4, Calder. No matching 2026-11-12T0448Z Calder receipt or `from_s4_to_s0_hale` handoff was present in the current main tree or issue search. Record **HANDOFF_MISSING_OR_IN_FLIGHT**; do not claim it was received or consumed.
- The canonical outgoing handoff and Elias inbox pointer already exist. The inbox entry explicitly says OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_RESPONSE_OBLIGATION / NO_REVIEW_REQUEST / NO_OWNERSHIP_TRANSFER / NO_CHAT_DELIVERY. No authenticated Hale or Elias ChatGPT thread, direct chat delivery, reading, acknowledgement, or ownership transfer is claimed.
- The ring successor is Elias at h773:s1, run key `REVROT3-19-20261011:h773:s1`. The :12 automation is disabled; the repository pointer is optional context only and no automatic scheduled consumer is guaranteed. Do not change the schedule or enable a task.
- Four relay slots (:00, :24, :36, :48) remain enabled; :12 remains disabled. No task ID, cadence, phase, or branch-graph change was made. Tern retains branch-graph reconciliation authority.

## Guardrails and unchanged gates

- Hale's historical remit is reconstructed from the 2026-09-12 check-in and REV-006 re-entry packet; no standalone signed specialist charter or authenticated Hale thread was found. This run followed the explicit geometry-fidelity lane charter while retaining the role's source/provenance discipline.
- The previous receipt's synthetic speed-profile fixture remains classified PROTOCOL_VIOLATION / NOT_EVIDENCE because it was calculated without the required specific prior permission. It was not reused. No new data-free physical fixture or calculation was performed.
- No physical calculation, measured-data fit, CODATA scoring, observational validation, or theory promotion was performed. No new Lean code or run, PR, branch, tool, or software was created.
- P0 Code Grurple remains active; reader presentation pending/not observed. P1 Nov 9 remains overdue / NOT READY and Orson-owned. P2 Nov 30 remains HOLD. P3 Dec 14 remains incomplete. Orson's protected cognition remit was untouched.
- FIE rereview completed Nov 10; next due Nov 24. Latest shared lateral-reading cursor remains Babbage lines 2061–2100, next 2101. No unrelated source reading was added this run.
- No SAT-O or Blockwave equation was edited, corrected, promoted, or re-versioned in this geometry-fidelity reconciliation.

**Status:** AMENDMENT_01 appended; original issue #1625 and artifact preserved; source-correction comment #6815848654 verified; no duplicate submission, receipt, or handoff.
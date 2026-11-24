# Amendment 02 | h942:s0 | Code 000 invocation, three-filament provenance, and helical-clearance scope

**Status:** ADDITIVE_SOURCE_FIDELITY_CORRECTION / DUPLICATE_RUN_KEY_RECONCILIATION / ORIGINAL_REPORT_UNCHANGED / NO_NEW_ISSUE / NO_PRIVATE_PAYLOAD_REPUBLICATION / NO_PHYSICAL / NO_CODATA / NO_THEORY_PROMOTION.

This is a narrow amendment to the existing h942:s0 run. The canonical receipt already exists, and its publication status was superseded by Amendment 01. No second canonical receipt or publisher submission is created.

## 1. Run identity and source of the amendment

- Nominal run key: REVROT3-19-20261011:942:s0.
- Nominal UTC hour: h=942; seq=4710; ring index 17, Ravel. Next ring identity: Orson Vay.
- Actual amendment work occurred after the original h942 publication. The nominal slot remains h942; wall-clock delay does not create a new run key.
- Existing canonical receipt: 2026-11-19T0600Z_s0_ravel.md.
- Existing publication: issue #2067, submission assistant-h942-s0-oct23-worldtube-map-fidelity-20261119t0600z-001.
- Existing publisher verification: Amendment 01, issue comment #7001458959. The original artifact remains byte-identical.
- This additional source discovery materially refines the source genealogy and one sentence in the original report. It therefore warrants an additive amendment, not a new issue or replacement artifact.

## 2. Direct-source chronology and corrected reading

The Library-custodied raw conversation “Worldtube Geometry Comparison” was re-materialized for this pass:

- Conversation ID: 6adb1940-de2c-83e9-ba5b-876af47a0046.
- Raw JSON: 3,004,307 bytes.
- SHA-256: c23a681f5712e9294c249a284bdb23306ea1ba1e4a02c27d48d7e56abac24502.
- The re-materialized copy matches the hash recorded in the canonical h942 receipt.
- The original image attachment still has no separate Files result in either conversation or Library search. No image bytes were recovered and no pixel-level inspection is claimed.

Direct-message sequence:

1. 2026-10-23 08:25:50Z, message 3729d3d3-15ff-49f1-a32c-3c3852a5226e: “Three Kerr black holes intertwined.”
2. 2026-10-23 08:42:51Z, message f09d5452-372c-4b46-8965-fd1de6835b5b: Nathan Direct says the exercise is mapping existing mathematics, not deriving or proving something new.
3. 2026-10-23 08:50:45Z, message f383dd0c-d6db-4698-b098-a2f3688bec2c: the corrected illustration has two intertwined tubes, one changing red-to-blue, green rather than yellow under the chosen iconography, and the string-theory vibration mode restored.
4. 2026-10-23 13:18:41Z, message 64760641-33f8-4171-8b70-6409febd1058: the user later says “Ok. CODE 000 invoked.”
5. A subsequent assistant/tool-generated three-strand diagnostic appears in the same archived branch. Its underlying reference object belongs to the private resource corpus. It was not reopened from that repository in this pass, and its detailed body, path and parameters are not reproduced here.

**Correction to the original report’s wording:** the sentence that the three-strand construction was “not authorized” is too broad if read as denying any later diagnostic exercise. The two-tube correction still controls the source-faithful reading of the illustration. The later CODE 000 invocation authorized a separate diagnostic exercise; it did not make the assistant-selected three-strand geometry or parameterization Nathan Direct, and it did not supply a map from the three Kerr-labelled structures to the two depicted tubes.

The correct distinction is therefore:
- not a source-faithful rendering of the corrected two-tube illustration;
- a later, separately invoked assistant diagnostic;
- not a Nathan Direct equation, source-defined reconciliation, or physical result.

## 3. Earlier three-filament proton motif: separate historical context

A second source was recovered by comparing the HsH mirror with the SAT archive:

- SAT archive path: SAT XYZ/SAT-Y 4D.txt.
- SAT archive Git blob: 9806853dd09ca6b36bcfc530d8333bed53d956c5 (see the live repository blob for the authoritative value).
- Cross-repository verification: the SAT archive file and HsH mirror were re-fetched after the initial amendment write; both returned this same blob SHA. The first transcription was corrected by a compare-and-swap update before final readback.
- HsH mirror path: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT-Y 4D.txt.
- The HsH mirror and SAT archive copy have the same Git blob SHA.
- The SAT archive file index records creation 2025-05-31 01:21:08 and modification 2025-10-27 20:26:08; timezone unspecified. These are file metadata dates, not the original conversation’s message dates.

The flattened transcript contains embedded-role user text specifying that each proton and neutron should be a tight bundle of three filaments and requesting a proton three-coil visualization. The assistant’s visualization code labels its third plotted coordinate “Z (Time Dimension).”

Source grading:
- The three-filament proton/neutron description and request for a three-coil visualization are direct-user text within a flattened transcript.
- The exact plotted curve and coordinate label are assistant reconstruction.
- The transcript has no recovered raw conversation UUID, message UUIDs, or message-level timestamp ancestry. Its provenance is therefore weaker than the raw role-tagged October 23 export.
- This source establishes a distinct historical proton three-filament motif. It does not identify that motif with the three Kerr-labelled structures, the two corrected tubes, or the later CODE 000 diagnostic.

## 4. Separate assistant-generated three-helix comparator

The existing Calder report, WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/calder-20261024-0824-three-helix-trace-maxwell-001.md (Git blob 598c3439d106e61d54e28f885f7d6a9e536dd5bf), defines three spatial material centerlines:

\[
X_j(s)=(R\cos(ks+2\pi j/3),R\sin(ks+2\pi j/3),s),\quad j=0,1,2.
\]

It separately defines a global pairwise minimum over relative axial displacement \(\tau\):

\[
d_{\min}^2=\min_\tau\left[2R^2\left(1-\cos(2\pi/3+k\tau)\right)+\tau^2\right].
\]

At \(\tau=0\), the equal-parameter squared spacing is \(3R^2\). If zero belongs to the minimization domain, then \(d_{\min}^2\leq 3R^2\). Consequently, an equal-parameter cross-section separation is not itself a global minimum or a proof that complete helical tubes remain disjoint.

This is a separate assistant-authored geometric sandbox. It is not Nathan Direct, not the same construction as the October 23 illustration, and not a physical model. No numeric rerun was performed.

## 5. Stable typed object ledger

| Label | Object | Provenance | Unresolved map |
|---|---|---|---|
| PB3 | Proton/neutron three-filament bundle | Direct-user description in flattened SAT-Y transcript | Exact embedding and relation to later constructions |
| K3 | Three Kerr-labelled structures | Direct October 23 text | Relation to the two depicted tubes |
| T2 | Two intertwined tubes; one red-to-blue | Direct October 23 correction | Carrier type, topology, and relation to K3 |
| C3 | Later three-strand CODE 000 diagnostic | Assistant/tool-generated after direct user invocation | No source-defined map to K3 or T2 |
| H3 | Three spatial helical centerlines | Separate Calder assistant sandbox | No source-defined map to PB3, K3, T2 or C3 |

Color count is not object count. The three-color proton motif, the three Kerr-labelled structures, the two-tube corrected illustration, and the two separate assistant-generated three-helix diagnostics must not be collapsed into one geometry.

## 6. Formal, empirical, and Factory Floor status

- The archived CODE 000 branch contains no Lean 4/Mathlib compile or actual Lean run.
- No Factory Floor mathematical clearance is recorded for the three-strand diagnostic.
- Local lean, lake and elan executables are unavailable in this runtime.
- Existing PR #873 contains conditional torus/product-intersection work; it does not formalize the global helical-clearance expression above. PR #1133 is a separate readout-factorization effort and does not supply this result.
- No new Lean module, PR, branch, CI run, or theorem was created.
- The global-clearance relation is recorded as a conditional mathematical comparison between existing assistant-authored formulas, not as a physical result.
- The current BEDROCK ND-2026-10-25 rule requires genuine measured systems and prohibits new data-free calculations without Nathan’s specific prior permission. The historical 2026-10-23 CODE 000 invocation is not standing permission to rerun arbitrary fixtures under the later rule.
- No physical calculation, numerical fixture, fit, prediction, independent measurement, CODATA scoring, paper-gate advancement, or theory promotion occurred.

## 7. Image and repository-access boundary

- Files search was repeated across conversation and Library surfaces for the original image filename and attachment identifier. Results returned the raw JSON conversation copies, not a standalone image file.
- No materialization was attempted using an attachment identifier that Files did not return as a file result.
- No live HSH_RESOURCES fetch was performed. The only information about the later diagnostic came from the historical tool-return text already embedded in the Library-custodied raw conversation. Its private repository path and detailed body were not republished in the issue comment or this receipt.
- Mersearch has no callable action in this runtime. All four canonical request files remain status requested: lane 1 Calder angle geometry, lane 2 optics inventory, lane 3 Calder IRI geometry, lane 4 Kestrel finite-core geometry. No lane was overwritten, reset, or retriggered. GitHub/Library/SAT-archive fallback was used; this is not three-repository Mersearch coverage.
- The SAT archive and HsH were consulted. HSH_RESOURCES remained unopened at the live repository level.

## 8. Preflight, role, and operational state

- Read current BEDROCK and the controlling Nathan Direct methodology, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, workflow orientation, revival rotation, thread-first rule, duplicate-run-key guard, automation workflow control, scheduler authority, autonomy/handoff protocol, no-conversation-renaming policy, current hypothesis status, coordination, handoffs, check-ins, current task graph, current main branch, current receipts, and Ravel workspace README/STATE/CONTINUITY/INBOX.
- Preflight ordering deviation: initial read-only source discovery preceded retrieval of the automation workflow-control and autonomy/handoff must-reads. No write occurred until the required control documents, publication workflow, and write route had been checked.
- Ravel’s historical direct role-setting message is 2026-09-08T17:27:54Z, message c5639160-5631-4373-90c2-68d7c4c022de: conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, specialization/tool-workshop design, and coordination with Janus. “Primary co-theorist” is assistant-maintained shorthand. No standalone signed Ravel charter or authenticated current Ravel thread was recovered.
- Ravel STATE/README/CONTINUITY still point to h934:s2; this amendment does not rewrite worker-local state or imply authenticated Ravel participation.
- HsH main immediately before this amendment: 23180c14190d4d67185857dc47bc86b1663d3634.
- Task graph blob: 48cfe002495cabae9ff5a67cd72fc210b4fbfd36. It remains ACTIVE_SEED with 16 declared branches and 18 records. No graph repair.
- P0 Code Grurple remains ACTIVE; P1 Nov 9 cognition paper remains OVERDUE / NOT READY / Orson-owned; P2 Nov 30 remains HOLD; P3 Dec 14 remains INCOMPLETE. FIE review next due Nov 24. No paper gate advanced.
- Unrelated reading break: SAT archive “fun break - lx.txt”, lines 1881–1920 read; next cursor 1921.
- Selected ring identity Ravel, index 17; next identity Orson Vay, index 18. No handoff or assignment to Orson. His protected cognition remit remains intact.

## 9. Publication correction and receipt write

- Original report issue #2067 remains open and unchanged.
- Original published artifact remains byte-identical: SHA-256 2f622b199bf5851dba48524f96685c0ff2d07257c9a0702382fe24bedfffe762; publisher commit 466af0233e55227a7bd8d87cded33f7f5673104f.
- Additive issue comment #7002388823 was updated in place with the source-fidelity clarification. Readback verified. No new issue, new submission, or replacement publication was created.
- The issue-publisher workflow triggers on issues.opened; it is not a general receipt writer. The existing provenance-batch workflow is specialized and unsuitable for this receipt.
- No authenticated local Git checkout was present. No general approved Actions receipt writer was available. House route status: HOUSE_WRITE_ROUTE_UNAVAILABLE.
- Used the permitted GitHub connector fallback to create this uniquely named amendment on main. The path was checked absent immediately before creation. No existing file was replaced.
- Receipt amendment path: WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-19T0600Z_s0_ravel_AMENDMENT_02_CODE000_THREE_COIL_SOURCE_CLARIFICATION.md.
- Independent readback and SHA-256 verification are required before marking this amendment WRITE_VERIFIED.

## 10. Scheduler and delivery boundary

- Existing :00 automation ID 6aa1fe0de5e48191b886496095b1343f remains the same. The roster lists it enabled; the stored schedule remains DTSTART;TZID=America/New_York:20261001T140000 / RRULE:FREQ=HOURLY.
- No automation, ID, prompt, cadence, phase, or enabled-state mutation; no sixth task. The existing :12 task remains disabled.
- A fresh ID-specific scheduler peek was unavailable in this runtime; no fresh peek is claimed. No scheduler write was attempted.
- No cross-thread delivery, handoff consumption, acknowledgment, or recipient response is claimed. No signet or conversation rename.

## Next cursor

1. Recover the original October 23 drawing through an authorized Files attachment reference if one becomes available; until then, preserve IMAGE_BYTES_NOT_AVAILABLE and do not claim visual inspection.
2. Recover a raw role-tagged source for the older SAT-Y proton three-filament conversation; the current transcript is flattened.
3. Define separate source-grounded maps, if any, for PB3, K3, T2, C3 and H3. Do not infer identity from a shared count, color scheme, helix shape, or “tube” label.
4. If the global helical-clearance proposition is pursued, formalize the exact conditional statement in Lean 4/Mathlib and run it on an exact head. Do not create arbitrary numerical fixtures or rerun the historical sandbox without specific prior permission.
5. Keep all results outside Factory Floor clearance, H(s)H candidacy, physical verification and BEDROCK promotion until their separate gates are satisfied.

# Nadir h1016:s3 | Typed candidate-to-packet binding and shared-readout admission

**Nominal slot:** 2026-11-22T08:36:00Z  
**Run key:** `REVROT3-19-20261011:1016:s3`  
**Selected ring label:** Nadir Voss, index 10  
**Next ring label:** Enheduanna, index 11  
**Disposition:** EXISTING PR #2330 EXTENDED / EXACT FILE READBACK VERIFIED / LEAN RUN PENDING / NO PHYSICAL RESULT / P2 HOLD.

## 1. Selection, authority, and source limits

For h=1016, `seq=5h+3=5083`; `5083 mod 19 = 10`. The selected label is Nadir Voss. This is deterministic routing metadata, not authenticated worker or ChatGPT-thread identity.

The historical source family is “Quantum Gravity and Experiments”, conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, raw export blob `d828fef5352045cb4d9486fdbeabd04043c4c119`. I re-fetched and parsed the raw JSON from `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/26.06.23•26.10.01•Quantum Gravity and Experiments — raw.json`: eight user messages, last dated 2026-10-01T21:20:56Z. The source supports broad independent mathematical/theory-playground intent and source/invention separation. It does not name Nadir, supply a signed standalone specialist charter, or authenticate a currently usable Nadir conversation. The current Nadir role description is an assistant-maintained reconstruction. Newer data-free-calculation, proof-first, and Lane 36 controls remain controlling.

Nadir's h1012:s4 receipt was read. Lane 24 Cycle 08/08 remains COMPLETE / BACKSEAT / HOLD; its one-run Lane 36 overlay does not reopen Cycle 09. The incoming Elias h1016:s2 → Nadir h1016:s3 packet was read as `PRESTART_OPTIONAL_CONTEXT_ONLY`; it carried no task, review request, response obligation, or ownership transfer. Its observation about PR #2330 was independently rechecked against the live PR source.

The 2026-11-08 human-intelligibility/model-selection statement is available only through `NATHAN_DIRECT_2026-11-08_METHODOLOGY_AND_MODEL_OVERVIEW.md`, an assistant-prepared transcription. That file explicitly says the original conversation has no recovered immutable message UUID or export locator. I therefore treat the intelligibility preference as source-attributed methodology with that provenance limitation, not as a verbatim transcript or a Nathan Direct theorem. The current change is an assistant-proposed type-level implementation only.

## 2. Preflight and current branch

Read live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, New Instance Start Here, three-repository onboarding, current workflow orientation, Revival Rotation v3, V4 not-found revival, thread-first rule, navigation preflight, worker autonomy/handoff, scheduler authority, active automation roster, reference desk, cross-repository execution safety, and shared-state write safety. Read Nadir README, BOOT, CURRENT_WORK, INBOX, prior h1012:s4 receipt, and the addressed h1016:s2 handoff.

Read the HsH, SAT archive, and HSH_RESOURCES root navigation surfaces. HSH_RESOURCES access was limited to its root README / AI start guide; no private payload was opened.

Mersearch was checked first. No callable Mersearch action is exposed in this runtime; all four canonical request lanes remain occupied/requested. No lane was overwritten, released, or retriggered. GitHub search/fetch was a bounded fallback, not Mersearch. The current Reference Desk and Archive Math Hopper documents were checked. Math Hopper issue #578 and PR #991 remain unverified for a complete three-repository run; Whirligig Kernel 0 remains sandbox-only and was not used. SciSpace is available but unnecessary for this internal type-design question. No new tool, dependency, fork, subscription, or expenditure was introduced.

No local checkout, `git`, `lean`, `lake`, or `elan` executable is present. The existing Lean Actions workflow is a verification route, not a suitable source-write route. Following house-write-first and compare-and-swap controls, the current PR file was re-fetched and updated through the GitHub Contents API fallback using its exact current blob SHA. The write and independent readback succeeded.

## 3. Substantive architecture improvement

Existing PR [#2330](https://github.com/Satobloc/HsH/pull/2330) previously declared:

- `candidateModelReadoutBinding : Prop`
- `candidateModelReadoutBindingEvidence : candidateModelReadoutBinding`

Because the proposition was not parameterized by the comparison fields, a constructor could choose `True` and provide `True.intro`. The structure therefore did not enforce the advertised link between source-system/dataset/readout identity, candidate, model maps, and one frozen measurement packet. This was a type-level specification gap, not a compiler failure or physical counterexample. The issue was also independently noted in incoming optional context and PR comment #7076591159.

The new source replaces that free proposition with concrete records:

1. `NonEmptyText` rejects blank identity/digest/locator fields; it does not validate their format.
2. `SourceArtifactRef` carries repository, commit, path, and blob identity.
3. `IdentifiedCandidate`, `IdentifiedLatentFieldModel`, and `IdentifiedStateSet` keep each candidate/model/state-set value alongside its declared source locator.
4. `FrozenMeasurementPacket` carries one packet ID and digest, source-system ID, dataset ID, shared-readout ID, manifest/source/dataset/readout locators, and the evidence-gated readout itself.
5. `CandidateModelReadoutBinding` carries the candidate, H(s)H and standard model maps, admissible state sets, their source locators, and the packet ID/digest to which they are bound.
6. `EvidenceGatedModelComparison` requires the fixed conjunction equating the binding's packet ID and digest to the packet actually used for the detector readout. Detector separation is computed through `packet.readout`, not a separately supplied readout.

The evidence-gated tie-break now additionally requires both candidates to reference the same packet ID and digest, as well as equal source-system, dataset, shared-readout identities, and exact readout-contract equality. The projection theorem exposes both packet-binding equalities and both detector-separation witnesses.

This is a type-level improvement: the required relation is now fixed by the API rather than selected by the constructor caller. It is not cryptographic or source authentication. Lean does not check that a blob SHA is well-formed, that a locator resolves, that a digest matches bytes, or that a source artifact implements the associated Lean value. Candidate hard-gate propositions and the readout evidence propositions remain supplied external evidence obligations. The legacy ungated `Candidate` and `intelligibilityTieBreak` APIs remain available; this is still an opt-in safe surface, not a global downstream migration.

## 4. Exact code and verification status

- Existing PR: [#2330](https://github.com/Satobloc/HsH/pull/2330), OPEN / DRAFT / UNMERGED.
- Branch: `research/relay36-evidence-gated-candidate-admission-20261122t0736z`.
- Prior head: `5b46e59d278f95b903a9ef9329b32d254fb99fa0`.
- New commit: `263333fdb1e11d9942c88568934b8ad7da98ece7`.
- Updated module blob: `96e18d803180b5c6b30561d6d670984b0791f4a8`.
- Independent file readback: PASS, 12,251 characters.
- Parent/base branch head remains `c20eb516e5e214ef948d621d721fb060b410831e`.

GitHub Actions run [#45004451168](https://github.com/Satobloc/HsH/actions/runs/45004451168), job `137152806860`, was observed `IN_PROGRESS` at the last check. Lean compilation has not yet been confirmed. No theorem-specific axiom output, exact-head result, merge-reference result, or test result is claimed for the new commit. The prior successful run #45001461928 applies to the previous source blob only. The current branch has not been rebased or merged; no independent review or approval is claimed.

## 5. Physical and campaign boundaries

No measured physical system or dataset was selected. No numerical calculation, fit, calibration/holdout comparison, physical prediction, falsification threshold, independent measurement, SAT-O/Blockwave equation transcription or correction, worldtube-thickness/twist/contact-surface claim, or BEDROCK promotion occurred. The type design is not a physical model and does not advance P2.

P0 Code Grurple remains ACTIVE. P1 cognition remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED. P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE. November 9 minor gate MISSED; November 30 major gate HOLD; December 14 full-theory gate INCOMPLETE. FIE next review is November 24; the November 20 unrelated-reading break remains current, so no duplicate break or premature FIE rereview was performed.

## 6. Continuity and next step

The existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its exact hourly America/New_York :36 schedule, original prompt, and Lane Charter 36 phase. No scheduler mutation, sixth task, signet, or conversation rename occurred.

Next label: Enheduanna. No authenticated Nadir thread, direct-thread delivery, consumption, acknowledgment, or ownership transfer is claimed. The next useful action is to inspect the new Lean run, record the exact checked-out commit and theorem-specific axiom output, then obtain independent review of the fixed packet-binding contract. Do not merge or promote the opt-in API without reviewed downstream integration. P2 remains HOLD.

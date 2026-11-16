# Enheduanna h887:s3: output-artifact occurrence and scoped completeness contract

**Nominal slot:** 2026-11-16T23:36:00Z  
**Run key:** `REVROT3-19-20261011:887:s3`  
**Selected ring label:** Enheduanna, index 11  
**Next ring label:** Tern Rook, index 12  
**Disposition at publication:** EXISTING PR #1619 EXTENDED / LEAN RUN PENDING / NO PHYSICAL RESULT / P2 HOLD.

## 1. Scope and authority

The fixed rotation gives:

\[
h=887,\qquad seq=5h+3=4438,\qquad 4438\bmod19=11.
\]

The selected label is a routing calculation, not authentication of a historical or current Enheduanna thread.

The historical source review found no standalone Nathan-authored Enheduanna specialist charter. The direct source locator remains MARLOWE conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, user message `11399ca2-5bd6-4203-9e19-e8e044fbc736`, dated 2026-09-23T02:04:49.417Z. The established reading is broad archive-revival guidance, not a detailed technical mandate. The current work is an assistant-executed contribution under Lane Charter 36, not historical-instance participation.

Mersearch-first was respected. No callable Mersearch action or local pinned checkout was available, and all four request lanes were already occupied. No request file was overwritten or retriggered. The prior completed three-repository Mersearch receipt `enheduanna-temple-hymns-nathan-source-20261030-1340` records 15,618 files, 20,810,723 records, 27 hits and 18 distinct sources across the SAT archive, HsH and HSH_RESOURCES. It is a bounded navigation receipt, not an exhaustive result listing; detailed private-root paths and excerpts are withheld. It was reused as prior discovery, not represented as a new search.

Direct GitHub fallback search located the message UUID in duplicate HsH conversation-export containers. The current contents connector returned zero content bytes for those large raw JSON files, so the raw message text and adjacent ancestry were not newly re-read in this activation. Prior source-census and receipt findings are retained with that limitation. HSH_RESOURCES root documentation was read; no private payload was opened.

## 2. Existing work continued, not duplicated

Extended the existing open/draft PR #1619, `Enheduanna: formalize source attestation vs context exposure`. No new branch or PR was created.

The existing module already separated:
- source-side attestation;
- run/snapshot context inclusion;
- output-level source-span attribution.

Its own documented next cursor identified a missing independently observed output-artifact occurrence witness and a completeness/integrity boundary for negative absence claims.

The new addition is therefore a direct continuation of that declared cursor, not a second source-attestation model.

## 3. New typed evidence objects

Added `FORMAL_VERIFICATION/HsHVerification/EnheduannaOutputOccurrence.lean` and registered it in the existing formal-verification root.

PR branch: `research/enheduanna-source-context-exposure-20261112t0148z`  
New module blob: `8c2a3feddb9f5d67e782a7994a9f59cbde504404`  
Aggregator blob: `b9876eb5ac283c6144e6d0d19aa0f950ebc400c3`  
Latest pushed PR head at publication: `275b5396a97d4f7efc4d7d2248bfa08218f01b35`.

The module adds four structures/relations:

1. `OutputArtifactOccurrenceWitness`: a positive capture record indexed by exact run, context snapshot and output ID, with a nonempty artifact digest, nonempty artifact locator and typed capture-time value.
2. `OccurrenceBoundAttribution`: a claim-specific join of source attestation, output-attribution record and positive occurrence witness. It requires exact equality of run, snapshot and output identifiers, plus the existing source/digest/span attribution relation.
3. `OutputCaptureIndex`: a manifest-backed list of output IDs with no completeness guarantee.
4. `CompleteOutputCaptureIndex`: the same scoped index plus a supplied coverage proof for every occurrence in that exact run/snapshot and an opaque integrity-certificate value.

The evidence architecture is a **partial relation graph, not a mandatory linear chain**. Source attestation, context inclusion, output occurrence and output attribution can exist independently. A joined witness is required only for a claim that needs those relations together. Semantic support and causal influence remain separate evidence obligations.

## 4. Formal consequences

The module states three theorems:

- `occurrence_bound_attribution_has_exact_key`: a joined attribution cannot silently refer to a different run, snapshot or output than its occurrence witness.
- `absence_from_complete_capture_excludes_scoped_occurrence`: if an output ID is absent from a complete capture index, no occurrence witness exists for that output within the index's exact run/snapshot scope.
- `partial_index_absence_is_compatible_with_occurrence`: a partial index can omit an output even when a positive occurrence witness exists. Absence from an incomplete index therefore remains UNKNOWN.

The negative implication is deliberately scope-bounded:

\[
\operatorname{CompleteIndex}(r,s)\land o\notin I_{r,s}
\;\Longrightarrow\;
\neg\operatorname{Occurred}(r,s,o).
\]

It does not imply that the output never existed in another run, snapshot, time interval or repository.

## 5. Verification status

At publication time, the new exact-head Lean workflow run was still in progress:

- PR #1619 head: `275b5396a97d4f7efc4d7d2248bfa08218f01b35`.
- Actions run: #43981958006.
- Lean result: PENDING at publication.
- Vercel preview: PENDING at the same observation.

No successful compilation or theorem-specific axiom result is claimed in this artifact. A later verification amendment must record the actual run, checked-out head, full-library result, theorem axiom reports and skipped checks. The prior PR run #43339533568 failed in an unchanged `MovingPlaneTraceGeometry.lean` module on an older base snapshot; the live `infra/lean4-verification-20261023` base now contains the `noncomputable` correction, but that does not predict the outcome of the new run.

The code requires only existing Lean 4 / Mathlib infrastructure. No new tool, package, fork, subscription or expenditure was introduced.

## 6. Formalization limits

The module checks only the encoded propositions and supplied fields.

It does **not**:
- validate that `artifactDigest` is a correctly formed SHA-256;
- prove that `artifactLocator` is immutable or resolves to the claimed bytes;
- authenticate the capture timestamp, clock domain, time uncertainty or chronology;
- authenticate the integrity certificate, its signer, independence or signature;
- establish that the coverage proof corresponds to a complete real-world acquisition process;
- prove actual historical context inclusion, semantic support, attention, causal influence or worker identity.

The `coversEveryOccurrence` field is a supplied completeness premise. The opaque integrity-certificate type requires a certificate value but does not authenticate it. These are explicit external verification obligations, not results of Lean compilation.

## 7. Relationship to adjacent work

This addition is distinct from:
- PR #1823, which types PIV count-stage and aggregation scope;
- PR #1828, which adds set-valued attempted-acquisition lineage for derived counts;
- PR #1858, which binds P2 evidence to a source bundle and comparison freeze;
- PR #1860, which formalizes bounded temporal ordering and pre-unblinding conditions.

No dependency or equivalence among those unmerged branches is claimed. A later integration would need explicit projection and composition maps from the occurrence manifest into the source-bundle/comparison-freeze contract, with exact identity and time-scope conditions. The present PR does not yet implement that composition.

## 8. Physical and theory status

No measured physical system or dataset was selected. No physical calculation, fit, prediction, uncertainty propagation, independent measurement or numerical falsification threshold was produced. No SAT-O or Blockwave equation was transcribed, corrected or changed. No worldtube thickness, twist, contact surface or physical timesheet is forced by this information-architecture result.

P2 remains HOLD. No BEDROCK theory promotion or paper-gate advancement occurred.

## 9. Workflow and continuity

- P0 Code Grurple remains ACTIVE; issue #1747 remains open under Tern's P0 authority. Its latest readback still distinguishes discovery-index evidence from actual live reader-route verification. No protected source, presentation gate, site or manuscript object was changed.
- P1 Orson cognition remains OVERDUE / NOT READY and Orson's ownership was not touched.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- FIE next review remains 2026-11-24; no early rereview was claimed.
- The task graph retains 16 declared branches versus 18 branch records. The mismatch remains unresolved by design.
- All four Mersearch request lanes remain requested/occupied. No new request was created.
- The existing :36 automation ID, hourly schedule and phase were not changed. No automation mutation, sixth task, signet or conversation rename occurred.

Unrelated reading was continued in the SAT archive file `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, blob `f33eb29fbac65efa1db054239bb9c28a04a13a42`, lines 2302-2341 inclusive. The passage compared basic vocabulary across older Germanic languages. Next cursor: line 2342. No physical break is claimed.

A repository-only optional handoff to Tern Rook is prepared for h887:s4. It creates no task, deadline, response obligation, review request or ownership transfer. No direct-thread delivery, consumption or acknowledgment is claimed.

**Return pin:** `H887:S3 / ENHEDUANNA-LABEL / TERN-NEXT / PR1619-EXTENDED / OUTPUT-OCCURRENCE-WITNESS / COMPLETE-INDEX-ABSENCE-BOUNDARY / LEAN-RUN-43981958006-PENDING / NO-PHYSICAL-RESULT / P2-HOLD / P0-ACTIVE / P1-OVERDUE / P3-INCOMPLETE / FIE-NOV24 / MERSEARCH-FOUR-LANES-OCCUPIED / READING-2342 / AUTOMATION-UNCHANGED / NO-SIXTH-TASK`.

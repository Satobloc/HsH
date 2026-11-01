# Enheduanna :36 | Claim-relation typing and source genealogy

**Run key:** REVROT3-19-20261011:507:s3  
**Selected label:** Enheduanna (ring index 11; deterministic selection only)  
**Next label:** Tern Rook (index 12)  
**Disposition:** SOURCE_GRAPH_REFINEMENT / PUBLICATION_SUBMITTED_PENDING_READBACK / NO_BRANCH_MUTATION

## 1. Identity and control state

The fixed 19-person ring gives h=507, seq=5h+3=2538, and seq mod 19=11. The next identity is index 12. Selection does not authenticate a historical Enheduanna instance or current ChatGPT thread.

No standalone historical Enheduanna role charter or usable historical conversation ID was recovered. The 2026-10-12 source-layer census is an assistant-authored role reconstruction, not a verbatim user charter. No Nathan Direct statement about the ancient Temple Hymns manuscript-placement question was recovered in this scope. No intent or authorship claim is attributed to Nathan.

The preceding Nadir :36 handoff from 2026-10-31T2336Z was read. The current Nadir :24 execution for 2026-11-01T0324Z remained in progress at inspection; no new addressed handoff was available. This is not classified as a missed check-in.

## 2. Controls and live state read

Read or rechecked: complete live BEDROCK (568 lines), Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, New Instance Start Here, Revival Rotation V3, V4 not-found revival, thread-first rule, navigation preflight, scheduler authority, automation workflow control, workflow branching map, task branch graph, Mersearch worker guide/request lanes, Code Grurple roster, reference-desk overview, Tool Chest, relevant receipts and handoffs.

Current HsH main head at final branch inspection: 4019ae87bdb5af13fb8311bce2a9f658ddb524f1.

The existing :36 automation is enabled with its original ID 6a9f52b69ec08191b0a2ba24a074f781 and its hourly :36 America/New_York phase unchanged. No sixth task or scheduler mutation.

The :36 execution was still in progress at final scheduler readback. The current :24 Nadir execution was also in progress. No terminal scheduler completion or missed firing is inferred.

## 3. New source-critical finding

The new improvement is not a new witness count. It is a correction to the **relation types** in the claim-provenance graph.

### Helle 2020

Appendix 3.1, pp. 326–328, reports A and Q with the attribution before the hymn count, B after the count, and O with its count not preserved. Helle reports Black's grouping of O with A/Q and B as divergent, then challenges the inference: O's missing count leaves its placement unclear; the line counts differ (A 15, B 13, Q 14); and Q has rulings above and below the attribution that the other manuscripts lack. Helle separately argues that physical placement inside the final hymn would not alone prove that the attribution's semantic scope is limited to that hymn.

### Sövegjártó 2022

Page 39 note 61 reports a three-of-four body / one-subscript aggregate and explicitly cites Black 2002, p. 3. The note does not identify the individual manuscript assigned to the subscript category. The main text renders the relevant line as “The compiler of the tablets was Enheduana” and treats her as an originator of written tradition.

The 2022 bibliography contains Black 2002 and Helle 2019 references; no Helle 2020 The First Authors entry was found in the inspected bibliography. This is a bounded bibliographic observation, not proof that the author never read the dissertation.

### Arithmetic

Helle's explicitly classifiable report is 2 before / 1 after / 1 unresolved. The two possible completions are:

- O before: 3/1.
- O after: 2/2.

A Python exhaustive check returned exactly those two cases. Sövegjártó's 3/1 aggregate is compatible with the first completion, but is not entailed by Helle's explicit 2/1/unknown report. No probability or prior is assigned.

### Bibliographic locator

The cumulative N.A.B.U. index resolves “2002/4” as item 4 in issue 2002-1, pp. 2–4. The correct locator is N.A.B.U. 2002, no. 1 (March), item 4, pp. 2–4. This confirms the citation correction already present in the current PR branch. The original Black PDF itself was not retrieved.

### Translation and scope

Helle's “weaver of tablets” and Sövegjártó's “compiler of the tablets” are translation/interpretation choices for the same line, not manuscript variants. Placement, attribution scope, attribution role, and composition/transmission chronology must remain separate.

The ETCSL editing protocol explicitly states that its electronic line numbers number the composite text, not any individual exemplar. CompositeLine therefore requires an explicit, potentially partial or many-to-many map to WitnessLocus; it must not be treated as a tablet line number by default.

## 4. Architecture improvement

The existing EnheduannaBlack2002Inference.lean module uses a Boolean Publication-to-link relation. It records that Helle discusses Black and Sövegjártó cites Black, then proves that both later publications have a recorded link to Black.

The theorem is valid as a weak link-existence statement. The Boolean nevertheless collapses distinct relations:

- Helle 2020: discusses and challenges Black's inference about O and B.
- Sövegjártó 2022: explicitly cites Black 2002 p. 3 alongside its 3/1 aggregate.

A common citation is not proof of dependence, identical readings, statistical dependence, or independent tablet inspection.

Proposed source-faithful graph:

**Node types:** Publication, BibliographicEntry, Claim, PhysicalWitness, WitnessLocus, Reading, PreservationState, CompositeEdition, CompositeLine, TranslationChoice, AttributionScope, AttributionRole, SourceLocator.

**Edge types:** cites, discusses, challenges, endorses, reports, interprets, translates, directlyCollates, mapsCompositeLineToWitnessLocus.

Keep dependsOn separate and require affirmative evidence. Do not infer it from a shared citation. This is an architectural proposal, not a canonical theory change.

## 5. Existing Lean evidence and limits

PR #890 is open, draft and unmerged. Its branch is 64 commits ahead and 5,716 behind current main; it has no recorded PR reviews. No branch mutation or merge was attempted.

Actions run #41012299180 completed a merge-ref build of 8,952 jobs. It checked out merge commit 6fc6a054f766d450b8a299d12b6c0112c1e89513, merging PR head 7e75fb3ee6a36fb6bf4e92654481724e27e58be8. The EnheduannaBlack2002Inference and EnheduannaPlacementCompletion module blobs were identical at PR head and merge ref. The log contained zero sorryAx and zero admit occurrences; standard propext appeared in several source-encoding theorems. A separate automated axiom audit was not run. This is MERGE_REF_BUILD_SUCCESS, not an exact-head checkout claim.

The existing theorem observed_report_allows_both_aggregates proves both completions of its encoded finite data. It does not prove the actual physical placement of manuscript O. The new typed relation graph has not been formalized or compiled. No new Lean proof is claimed.

No local HsH checkout or Lean/Lake/Elan executable was present. Existing PR #890 and Math Hopper were inspected; no new tool, dependency, branch or paid service was introduced.

## 6. Mersearch and source limits

All four current Mersearch lanes were occupied or unreconciled (Calder, optics, Sable, Nadir). No new request, overwrite, or substitute GitHub code-search run was made.

The current work uses the existing PR/source records plus public scholarly sources. The original Black 2002 article, Sjöberg & Bergmann 1969, p. 49 and plates, and the physical tablets were not directly inspected in this run. No direct tablet collation, independent physical witness count, or historical authorship verdict is claimed.

## 7. Publication and continuity

New public-safe submission:

- Issue #1192.
- Submission ID: enheduanna-claim-relation-typing-20261101t0336z-s3-001.
- SHA-256: 4ff964b6855a15f2d35bea9f18ed2315567d6cc2cc76d744fe7954a40e43f0c1.
- Expected artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-claim-relation-typing-20261101t0336z-s3-001.md.
- At this report's creation, publisher readback was pending. Do not duplicate; verify issue #1192 and the exact destination.

The preceding issue #1182 was already closed as PUBLISHED_VERIFIED by receipt amendment 01. This run independently confirmed exact issue-payload/artifact equality and the declared SHA-256. No resubmission or duplicate was made.

Optional Tern Rook handoff is context-only, no task transfer, no response obligation, and no ChatGPT-thread delivery claim. Tern's existing inbox route is used only for a repository pointer.

## 8. Boundaries and next cursor

- BEDROCK unchanged.
- No SAT-O or Blockwave equations changed.
- No theory promotion, physical calculation, fit, experiment or measurement.
- No manuscript, reader or paper-gate change.
- Code Grurple remains ACTIVE.
- November 9 P1, November 30 P2 and December 14 P3 remain separate.
- Orson's cognition ownership remains protected.
- FIE review is not due; last full review October 27.
- No unrelated reading break repeated; Enheduanna's last completed break was Jacoby, Astronomer Talks, lines 473–512; next cursor 513.

Next exact research operation: recover the original Black item 4 and Sjöberg & Bergmann 1969, p. 49/plates, then establish the actual O witness locus before extending the claim graph. The next formalization should distinguish citation, criticism, report and direct collation as typed relations.

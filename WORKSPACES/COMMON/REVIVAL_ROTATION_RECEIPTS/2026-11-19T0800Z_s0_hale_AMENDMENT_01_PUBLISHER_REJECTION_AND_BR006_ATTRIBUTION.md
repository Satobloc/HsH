# AMENDMENT 01 — Publisher rejection and BR-006 equation-attribution correction

**Parent receipt:** `2026-11-19T0800Z_s0_hale.md`  
**Parent issue:** [#2076](https://github.com/Satobloc/HsH/issues/2076)  
**Date:** 2026-11-19  
**Disposition:** `PUBLISHER_REJECTED_NOT_PUBLISHED / SOURCE_ATTRIBUTION_CORRECTED / NO_RETRY / NO_DUPLICATE`

This amendment supersedes the base receipt's `PUBLISHER_PENDING` state and corrects an equation-approval claim in the submitted report. The base receipt and issue body remain intact for audit history.

## 1. Publisher result

- Submission ID: `hale-h944-s0-interbraid-elastic-memory-fidelity-20261119t0800z-001`
- Issue: [#2076](https://github.com/Satobloc/HsH/issues/2076)
- Publisher run: [#44488478477](https://github.com/Satobloc/HsH/actions/runs/44488478477)
- Publisher job: `135438254922`, conclusion `success` as a validator execution, but its result was **REJECTED**, not published.
- Publisher comment: [#7003999921](https://github.com/Satobloc/HsH/issues/2076#issuecomment-7003999921), `REJECTED: SHA-256 mismatch`.
- Declared SHA-256 in the issue payload: `957e290e35e1d725efa7716c08dd2013bfb14cb996a4fd3cc33f079af667c865`.
- Independently recomputed SHA-256 of the exact stored `content` string, UTF-8 including its final newline: `fd99d373d07bbd31c25081bc9b8e66c5346cb75854e6a4b7fddc1b010952d4ca`.
- Exact content length: 24,416 UTF-8 bytes.
- Expected artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h944-s0-interbraid-elastic-memory-fidelity-20261119t0800z-001.md`: not present (404 on readback).

The publisher script hashes `content.encode("utf-8")`; a successful workflow/job conclusion does not convert a rejected payload into a publication. The issue body remains visible, but there is no published artifact. No issue edit, reopen, retry, replacement issue, duplicate submission, or direct artifact write was made. The issue remains open with the publisher rejection and the additive status comment.

## 2. BR-006 scalar equation: approval label withdrawn

The h944 report and earlier Hale/Calder reports described the scalar phase-count equation as assistant-formalized and Nathan-approved. That approval label is too strong on the source evidence now recovered.

The controlling correction is [Calder's source-attribution Amendment 01 for issue #1426](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/calder-interbraid-readout-null-design-20261106t1936z-s3-001-amendment-01.md):

> **Assistant reconstruction in the current BEDROCK register; exact equation-level source and approval chain not yet authenticated.**

What remains Nathan Direct:

- `4d62333e-9a90-4aee-a3cf-2513149fe84e`: each completed release revolution adds braid history, with long-term planetary-to-galactic rotation behavior as a required outcome.
- `c293bf0e-6a8a-4f59-8e9a-c76ebb12a1f1`: interbraid is a physical constraint on admissible configurations of continuously interlocked worldtubes.

The displayed scalar relation first appears in assistant message `e7001fa7-1b3e-41a3-bdb7-5cbd06eee29f`. The sign-off messages `cc6c2d1d-21e4-44bf-9ba3-26df718e81bf` and `99f483a6-e8a3-443e-90fc-e68800dd7cd5` have a different parent, `2ce8335d-1984-4ddb-8343-a514f64a0efa`, a file-update notice. The local file content referred to by that notice is not present in the recovered raw export. The BEDROCK update commit `0404351fe41b882da0ec16c20526bba43c3e0110` is attributed to Nathan in Git metadata, but GitHub reports its signature as **unverified / unsigned**. Neither the commit label nor the separate-branch sign-off authenticates equation-level approval.

Therefore:

- The qualitative BR-006 premises remain direct.
- The scalar `B(t)` relation remains an assistant reconstruction in the current BEDROCK register.
- Its exact original message locator and equation-level approval chain remain unresolved.
- The October 2 paper's `B_bend` remains a bending modulus and is a different typed quantity from the scalar `B(t)`. The symbol distinction survives; the scalar must not be called Nathan-approved.

Additive issue comments were read back:

- [#1426 comment #7004408961](https://github.com/Satobloc/HsH/issues/1426#issuecomment-7004408961) links the source-attribution correction.
- [#1369 comment #7004409547](https://github.com/Satobloc/HsH/issues/1369#issuecomment-7004409547) supersedes the earlier Nathan-approved label in the raw-source recovery report.
- [#2076 comment #7004410187](https://github.com/Satobloc/HsH/issues/2076#issuecomment-7004410187) corrects the h944 report's attribution and records the publisher rejection/hash result.

No original raw source, published artifact, BEDROCK entry, SAT-O equation, or Blockwave equation was edited.

## 3. Next-cursor reconciliation

The h944 report's suggestion to repeat the October 17 BR-006 raw-source recovery is stale: the relevant chunk-1 source segment and message locators were already recovered and published in [issue #1369](https://github.com/Satobloc/HsH/issues/1369), then reused in the P3 braid-history audit and issue #1426. Do not repeat that recovery.

The following gaps remain:

1. **BR-006 chunk 2:** no matching `Calculation Relay :36` `chunk_0002_of_0002` file was found in the current HsH code search or Library search. The October 15 raw JSON is an earlier snapshot, not proof of the October 17 tail. Do not claim the entire long conversation was recovered.
2. **Equation approval chain:** recover the exact local amendment/file content referenced by `2ce8335d...` and its source-message chain. The current BEDROCK commit is a candidate file-update record, not cryptographic signature verification or proof that the user saw the assistant equation.
3. **October 2 paper drafting conversation:** still not recovered. The LaTeX artifact `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_23/interbraid_elastic_memory.tex` is a bylined, AI-assisted artifact; no raw drafting conversation or equation-by-equation authorship record was located.
4. **Typed map:** only after source recovery, define the admissible worldtube-history space, finite-core support/framing, observer projection, configuration-space path, braid/topological label, and instrument readout/coarse-graining maps. The existing fiber-constancy/factorization result is a conditional gate, not an instantiated H(s)H map.

## 4. Adjacent source pointer recovered this run

A separate August 26–27, 2026 `Calder Construction Story Retelling` conversation contains later direct clarifications about the w-axis and a pointer to early H(s)H expansion/double-shell material. It is not folded into the h944 interbraid report:

- HsH raw path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_14/26.08.26•26.08.27•⚗️ CALDER [Construction Story Retelling] — raw.json`; Git blob SHA-1 `92454acdaad701193e2a0c6cf64a7d7b70a03dbb` (later 2,207-node snapshot; 479-node current ancestry).
- Earlier Library snapshot: 12,004,300 bytes, SHA-256 `5f879420996f7bbc92b2cc187bfd28ec498094c88a1ee072d0ea3a898207d66a` (older 2,081-node snapshot; 353-node current ancestry; not byte-identical to the later HsH blob).
- Direct message `5b46e4d9-a51e-4281-904b-f74e41702f1b`: block representation treats temporal extent as a spatial w-length, described in prose as temporal duration times c. `Δw≈cΔτ` is assistant notation, not a verbatim direct equation.
- Direct message `95319111-ba02-4b45-885a-6e44bd5fed7d`: w-orthogonality is inferred from sphericality and varies; exact only in perfect vacuum, approximate for stationary particle helices, not necessarily true of H(s)H helical worldtubes. `θ₄` is described as instantaneous and associated with intersectional oblateness, but no complete map is given.
- Direct message `90f07e71-81db-4b04-85ec-a93f98b65b69`: block-universe representation is optional; its equivalence to dynamic/block or worldline-only descriptions is stated as doctrine/assumption, not a proved gauge equivalence.
- Direct messages `964e31f7-1c4e-43a0-8734-92cc4498d623`, `04dd5822-04cd-4ac4-83dd-5e452002d3ea`, and `cd960b2e-2f84-4cd6-a6ae-a02301479b60` point to H0/c, `++++`, and double-shell source material. The later NotebookLM export is role-ambiguous; podcast SRTs are autogenerated publication derivatives, not direct-message evidence. Existing Mira/Tern dimensional-repair work should be reused rather than duplicated.
- This historical `Δw≈cΔτ` proposal is not silently equated with current BEDROCK `cw=t`, branch-specific `w=ct`, or any H0+c expression. Current methodology does not promote universal information-retention claims from the earlier black-hole/Big-Bang speculation.

This is an additional future source cursor, not a theory update or physical result.

## 5. Formal, empirical, and operational status

- PRs #1064 and #1066 remain open/draft/unmerged; their existing exact-head Lean CI runs were successful. They do not prove the physical worldtube-to-braid map.
- No new Lean theorem or local Lean run was made; the source-defined history, projection, framing, and readout maps remain incomplete.
- No physical calculation, fit, prediction, independent measurement, or CODATA scoring.
- No BEDROCK edit, paper-gate advancement, or theory promotion.
- Mersearch was not callable in this runtime; all four request lanes remain occupied. GitHub/Library fallback only; no claim of fresh Mersearch coverage.
- HSH_RESOURCES README and AI start/bibliography index were read; no private payload was opened.
- Task graph remains ACTIVE_SEED with 18 branch records and 16 declared branches; no repair.
- P0 Code Grurple ACTIVE; P1 November 9 OVERDUE / NOT READY; P2 November 30 HOLD; P3 December 14 INCOMPLETE. FIE rereview next due November 24; not yet due.
- Unrelated reading break: *The Moonstone*, Project Gutenberg #155, raw-text lines 292–391 read; next cursor 392.

## 6. Relay controls

- Nominal selection: h944:s0, ring label Hale (index 8); next ring identity Elias Kern (index 9).
- No authenticated Hale instance/thread or cross-thread delivery, handoff consumption, or acknowledgment is claimed.
- Existing :00 task ID `6aa1fe0de5e48191b886496095b1343f` remains enabled with its exact hourly schedule and phase. No task, prompt, ID, cadence, branch, or enabled-state change; no sixth task.
- No signet or conversation rename.

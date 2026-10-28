# Elias Kern Track A | Publisher event-state versus semantic receipt | 2026-10-28 23:12 UTC

**Status:** EXECUTED LIVE GITHUB RECEIPT TEST; six conditional Lean propositions submitted on draft PR #951; CI status tracked separately. This is a source-grounded current-assistant reconstruction of Elias's **protected Track A switchboard operator** remit, not an authenticated historical Elias ChatGPT turn. No production workflow, scheduler, TOP guard, physics claim, or theory status was changed.

## Selection and controls

Run key `REVROT3-19-20261011:431:s1`; h=431, seq=2156, index 9 Elias Kern; successor index 10 Nadir Voss at 2026-10-28 23:24Z. Existing :12 task ID `6aa61b3b2e4081918927a35b61007acc` preserved. No sixth task or new recurrence.

Read live:
- HsH `BEDROCK.md`, Git blob `4cabda482c48c217614b868a2138409275df9bf7`, 86,946 chars; governing opening and methodological restrictions examined, **not** full line-by-line read.
- Steering Charter `b9b8de55f8d5add7c42cf80be7c34677ee36305e` and Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`, full texts.
- Onboarding `7d78afd95654bd9d41bbbcc6ba56db1fd10b3110`, Revival V3 `90863a2a2b82b2d8e37ba1bd9f796389066f5409`, thread-routing `d9ea7c3a04e03822c65ee231d0b9545bf37907bd`, relevant sections.
- Elias role `WORKSPACES/ELIAS_KERN/README.md`, blob `5546d022693920f6de9b375ba24e52513220bf92`, full; `CURRENT_WORK.md` and `INBOX.md` fetched, current inbox blob `8345d2e68979050ed1ca56585545d68c16da36a9`.
- Existing prototype `Satobloc/HSH_RESOURCES/tools/workflow_switchboard_demo.py` blob `49988a769389b2baf264a27d596ba7c3ff822b36`, inspected code around ACTORS, HYDRA receipt gate and self-test. Its README `e6b6bd6d413cddfcf43b37b1b1f01317c48caf86` and POC `0a708813bac6e1e7dc763779ed080b6d7e27fd42` read relevant sections. **Original Python POC was NOT executed**; only source-code inspection.
- Exact incoming Hale :00 -> Elias :12 addressed handoff `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-28T2300Z_from_s0_to_s1_elias_kern.md`, blob `1bf6e0742399cf7de32006eace309aae8a6b5eaf`, and sender receipt blob `6a244bebe588d838e120ebb2f99f41b51bddb153`, independently fetched. Handoff explicitly denies original-chat delivery.
- Mersearch worker instructions `086778737a004c467b0b52142d71aa5b961fc166`; all four request lanes were already occupied (Indicatrix, optics, chemistry, superconductors), not overwritten. Direct source reads were used as a disclosed fallback, **not** a three-root Mersearch execution.
- Existing Math Hopper, Lean PR #948, publisher code and intake standards inspected before selecting a method.

## Actual real-world workflow observations

Two GitHub issue-open events, **not two hypothetical fixtures**, are the test case.

| Field | Issue #949 | Issue #950 |
| --- | --- | --- |
| Created (UTC) | 2026-10-28 23:03:31 | 2026-10-28 23:05:57 |
| Submission ID | `hale-repeated-prompt-projection-20261028t23z-s0-001` | `hale-repeated-prompt-projection-20261028t23z-s0-r1` |
| Current decoded issue content | 4,762 characters | same 4,762 characters, exact equality |
| Current declared SHA256 | `9e2f2be2a0c3f13363c029dd123866b0a3b4ea879c16d43fbf0784d4101b454f` | same |
| GitHub Actions publish job | #123154502018, SUCCESS | #123155512380, SUCCESS |
| Semantic publisher comment | #6482981074: **REJECTED: SHA-256 mismatch** | #6483025330: **PUBLISHED**, commit `ec4217a9128f5704b553a247accdffff576323af` |
| Durable publication | no verified #949 publication | `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-repeated-prompt-projection-20261028t23z-s0-r1.md`, Git blob `c73db049e85e0d3ca9505cd7dcfbbac74c831329` |
| Current issue state | CLOSED | OPEN |

Actual connector JavaScript fetched both issue bodies, issue comments, publisher job logs, committed file, source code, and handoff. The committed file matched #950's decoded issue content exactly; it also matched #949's **edited current** decoded content. The original issue-open event payload for #949 was not separately recovered byte-for-byte. Its original checksum failure is evidenced by the publisher's job log and rejection comment, not inferred from its current edited body.

**Thirteen source-backed JavaScript checks passed**, covering current content/digest equality, different submission IDs, two green Actions jobs, different semantic outcomes, event-snapshot code path, rejection's zero exit code, existing prototype's job-name-only self-test, missing Elias actor registry entry, SAT source duplication, and addressed handoff. The two actual publisher logs were separately retrieved and inspected. This is a finite observed-record audit, not a statistical study of general publisher reliability.

## Mechanism isolated

The existing `tools/issue_publish.py` blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf` loads `GITHUB_EVENT_PATH`, validates `event["issue"]`, and on a validation rejection **prints REJECTED, writes a rejection comment and returns process exit code 0**. Therefore `GitHub Actions conclusion=success` indicates the publisher job ran to completion, **not** that the submitted artifact was published. Editing the issue body after opening does not rewrite the already captured opened-event payload. This exactly explains why #949 can now display the same valid content/digest as #950 yet retain a rejection receipt.

The existing switchboard prototype's `lease_has_receipt_gate` self-test checks only whether the planned job names `verify_durable_output_receipt` and `restore_displaced_lease` appear in a spawned plan. It does **not** read a GitHub issue, publisher comment, committed file or ChatGPT thread. The prototype's `ACTORS` mapping also omits Elias Kern. These are pre-existing design limitations confirmed by live source inspection, not newly executed Python failures.

**Discriminator:** A key composed solely of current content/digest or green Actions status cannot recover semantic publication outcome in these two actual records. Required fields include issue-open event identity, submission ID, validation receipt, committed-file path/blob, and independent readback. Conversation delivery and recipient acknowledgment remain separate downstream gates.

## Lean 4 conditional formalization

New independent draft PR **#951**:
`https://github.com/Satobloc/HsH/pull/951`

Branch `research/elias-tracka-publisher-status-20261028t23z` based on the existing `infra/lean4-verification-20261023`, not on Hale's draft branch. Head commit `e02e69cfa7ae00c74467697b9174a304ee1ab7cf`. Module `FORMAL_VERIFICATION/HsHVerification/EliasPublisherStatus.lean` and root import were committed and readback is required. Six propositions encode equality of current content, equality of Actions-success flag, different semantic outcomes, an observed successful-job rejection witness, and non-factorization of semantic outcome through either lossy projection. These are **source-conditional**, not GitHub or physical truth proofs. Lean CI **IN_PROGRESS at initial inspection**, run #40785458206; do not claim compiled before actual job log/axiom inspection.

## Historical SAT source fidelity, deliberately limited lateral recovery

The original July 2025 `SAT O Core Modules/SAT.O Official Directives.txt` was read in full (2,879 characters, Git blob `167136310cdf33ca8f986f33634692314c1a0946`). It describes 4D manifold `M`, 1D filaments and a propagating 3D wavefront `Σ_t ⊂ M`; formal statements must be derived inline or linked to a derivation. The independently addressed `SAT 4D Theory Work/SAT4D_6.txt` returned **exactly the same blob and text**, hence these are two archival paths for one textual witness, not independent evidence. Neither contains an evaluated physical prediction; no source geometry was silently converted to an equation, no physical calculation or invented fixture was run. Exact original speaker-turn authorship is not established by file paths alone.

FIE team reread Oct 27, so no >=14-day revisit trigger. No new unrelated-reading requirement forced into Elias's protected remit.

## Prototype disposition / next test

- Track A finding: **OBSERVED** semantic receipt and green job status are distinct; current-body content alone does not recover opened-event validation.
- Candidate transfer: **TEST**, not production promotion. Extend a *sandbox* switchboard receipt reducer to accept issue-open event ID, publisher validation comment, exact file/blob readback, and chat-delivery acknowledgment as distinct fields. Test on #949/#950 before considering Track B adoption. Do not modify the actual production publisher or scheduler on this evidence alone.
- Formal proof: check PR #951 exact-head CI, theorem-specific axioms and failures. If still pending, retain PENDING, no invented proof.
- P1 Nov 2 freeze / Nov 9 manuscript: Orson remains lead; P2 Nov 30 real-data, P3 Dec 14 source/physics remain open. No new SAT claim.
- Nadir Voss at :24 retains SILOED/PLAYGROUND remit; handoff should offer these routing observations as optional, not force production workflow duties. Original ChatGPT-thread delivery unavailable; GitHub packet is not an authenticated worker check-in.

**Publication:** This file is a GitHub research report, not an issue-publisher publication. Any public-safe issue publication must be independently verified; none is claimed here.

## Related original SAT/O status-fidelity cluster (later source read)

Three additional interrelated July 2025 archive documents were retrieved in full:

1. `SAT 4D Theory Work/SAT4D_3.txt`, blob `f2a2540da5bb399ed4218d65a65e3b983dc00d01`, 3,755 characters, labels SAT.O1–O8 rewritten/complete while explicitly listing D1–D6 derivations as **active tasks**.
2. `SAT 4D Theory Work/SAT4D_7.txt`, blob `597060293196a8017fbbb144a3393733e76ee267`, 2,818 characters, again labels all eight modules **complete** and lists D1–D6 as next-priority derivations.
3. `SAT O Derivations/SAT_DERIVATIONS_INDEX.txt`, blob `19610d8eb16878ace3a2cf50047bff9319ed1b27`, 1,506 characters, is a **template** with bracketed placeholder derivation descriptions (e.g. `[Short description, e.g. from eq. (2.3) to (2.7)]` and ellipses).

**Bounded source conclusion:** In this witness cluster, the adjective *complete* describes a clean-core **module rewrite stage**, not independently demonstrated completion of all D1–D6 derivations. The placeholder index is not a derivation receipt. This does **not** prove that no complete derivations exist elsewhere in the archive: code search returned path-index hits but did not establish exhaustive three-root coverage. The historical texts identify `SATO.4D Coherence Project` as author for two plans; Nathan's exact user-turn authorship and whether an LLM drafted their wording remain unverified. This distinction parallels, but does not prove equivalence to, the live publisher-stage result.

The independent Track A observation was also posted as an **additive comment**, not a new publisher submission, on existing issue #714: comment `6483140769`, independently fetched and matched. Track B review/acknowledgment remains unverified.

## Original SAT/O mathematical derivations and independent historical workflow controls (expanded recovery)

The 2026-06-09 archive folder summary `SAT O Derivations/..folder_summary.txt` (blob `9db94f237fce9ef038b2a0df1d40d94fe84f50b0`, 3,437 chars) explicitly lists substantive derivation files, correcting any temptation to infer absence from the template index. Actual original texts retrieved:

- `SAT O Derivations/CODE-LOCKED DERIVS.txt`, blob `783b05d39d59bf854b92090e15d205e6823b51c8`, 17,692 chars / 448 lines; **opening ~5,000 chars inspected**, not full. Contains D1–D6 mathematical statements, e.g. (S=\int d\lambda\,[\tfrac12m(\partial_\lambda\xi)^2-V(\xi)]), (\pi^\mu=\partial L/\partial\dot\xi_\mu), canonical commutators, D2 periodic mode (k_n=2\pi n/L) and (\omega_n=|k_n|\sqrt{T/m}), D3 (Q=L_{wind}+L_{link}+W_{writhe}) and (m_{eff}=m_0/Q), D4 strain-to-curvature and D5 linking-density couplings. These are **archived equations, not verified physical results**. The derivation has unstated choices of `lambda` as evolution versus filament coordinate, and Q quantization despite writhe contribution requires careful source-faithful mathematical and physical review. No new numbers or toy fixtures calculated.
- `SAT O Derivations/SAT_D1_CANONICAL_QUANTIZATION.txt`, blob `1720af778e962f265be531928f9ae350d7049851`, all 1,606 chars / 51 lines read. Includes canonical brackets and functional operator representation; contains a rendered filecite token, not independently verified source citation.
- `SAT O Derivations/SAT_D2_MODE_EXPANSION.txt`, blob `6844c72027e9569e4f8da3a85a24434e0ad080cf`, all 1,887 chars / 48 lines read. Explicit uniform-tension periodic boundary assumption and (\omega_n=|k_n|\sqrt{T/m}). This is a standard-mode conditional translation; not an independently established worldtube prediction.
- `SAT O Derivations/audit_results.txt`, blob `66da0983476329015b9e4d3394d3c28f53a15b16`, all 2,714 chars / 39 lines read. Historical auditor marks **FAIL** for context-hash stability, single-writer tracker safety, lint, perturbation handling, and observable postconditions. This is an actual archival audit document, not proof those issues were fixed.
- `SAT O Derivations/SAT_Completion_Protocol_v1.txt`, blob `e77728abf23c3aee476f5c32b9aa2a26ccf2b014`, all 4,920 chars / 113 lines read; internally dated **20 June 2025**. Specifies Producer → Verifier → Acceptor, SHA readback, explicit proof/code checks, and reverse-cascade invalidation. These are **requirements**, not evidence the checks actually ran.

**Cross-period insight:** The historical SAT.O workflow itself explicitly distinguished completed artifacts from verified/accepted artifacts and warned against hashes without a canonical context schema. The October 2026 publisher #949/#950 observation is an independently observed modern instance of *the same class of information-loss hazard*, not proof of any causal lineage or of a historical protocol implementation. This refines the earlier July 2025 “complete modules” label: actual D1/D2 derivation texts **do exist**; their mathematical and physical correctness and whether all required acceptance gates completed remain separately unverified. The exact original Nathan-authored versus LLM-authored wording remains unproven without role-tagged conversation turns.

**Next specialist cursor (optional):** D1/D2 first, source `CODE-LOCKED DERIVS.txt` beyond ~5,000 chars, then later corrections to parameter role and worldtube/time-slice geometry. Do not infer H(s)H physical equivalence from an archived canonical-QFT translation or label a missing verification receipt a mathematical refutation.

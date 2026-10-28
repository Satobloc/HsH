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

**Twelve source-backed JavaScript checks passed**, covering current content/digest equality, different submission IDs, two green Actions jobs, different semantic outcomes, event-snapshot code path, rejection's zero exit code, existing prototype's job-name-only self-test, missing Elias actor registry entry, SAT source duplication, and addressed handoff. The two actual publisher logs were separately retrieved and inspected. This is a finite observed-record audit, not a statistical study of general publisher reliability.

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

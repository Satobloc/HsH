# Loom source-QC addendum — 0.239 / 0.246 provenance

**Actual postcheck:** 2026-10-30 08:28Z  
**Nominal run key:** `REVROT3-19-20261030:463:s4` (`2026-10-30T0748Z`)  
**Lane:** :48 Review-MIND  
**Deterministic selection:** h=463, s=4, seq=2319, 2319 mod 19 = 1 → Loom; next index 2 → Aster. Selection is a routing label, not authentication of a historical ChatGPT instance.

This is a delayed independent postcheck of an already-existing Loom packet, not a second copy of the nominal research artifact. The :48 automation run for scheduled_for 07:48Z began at 08:17:31Z. A Loom receipt/handoff for that nominal slot had already been written at approximately 08:15Z. I did not create another primary report or another issue.

## Source and control surfaces reread

- Live `BEDROCK.md`, all 568 lines.
- Steering Charter 2026-10-26; Three Paper Campaign 2026-10-26.
- New-instance start page; three-repository onboarding; revival rotation v3 and recipient-thread routing.
- Current workflow orientation, branch map and task-branch graph.
- Loom README, continuity, checkpoint, inbox and terminology/symbol hazard register; historical bold-exploration shift.
- Aster continuity and inbox to preserve its source-attribution remit and frozen Code Grurple state.
- Current main branch at postcheck: `26831b5156dd1abdd0bb8d142fd6877332a0e243`.
- Existing formalization branch: `research/loom-embedded-notebooklm-span-20261027t1512z`, PR #759.

## Independent raw-source replay

### Conversation 1 — “0.239 Radians in Science”

- Conversation UUID: `699e4a02-26e4-832a-86ea-ad1dcaf3c4e3`.
- Full raw export: Git blob `8c87b92285f87ed3865fc1577a7a81b0661452b2`, 812 mapping nodes.
- Second full export: blob `8b6794a2be3e19b6bba32acfbbc4c6636b1b02e3`, 812 nodes.
- Independent comparison across all 812 message IDs, outer roles, parent IDs, timestamps and content: exact equality.
- 100-node snapshot blob `67702fc58b0efce1d0f89d950b86a8819a189afb`: every node is an exact subset match to the full export.

### Conversation 2 — “Scaling Postulates Testing”

- Conversation UUID: `69a...` (the raw export title and conversation metadata were inspected; the abbreviated UUID is retained here because the current source ledger is the exact locator).
- Three exports: blobs `a2d72dd38d9bc671f5b81f20d965407cc8ac72ca`, `32c49e7bf4818fe9798bb7372b64fd5768c1b440`, and `0fb8ea34f86260d52deabc984b71c56b415e96c2`.
- Each contains 155 nodes; all three compare exactly by message ID, role, parent, timestamp and content.

The 14 message records encoded in `LoomOpticalClaimProvenance.lean` were independently matched against the appropriate raw conversation export. All 14 outer roles and parent IDs match.

### Attribution boundary

The first inspected 0.246-rad optical claim is in user-role message `15338421-a5e7-4538-879a-d25d840d2bdd`, inside a user-supplied document block. The embedded page itself contains no explicit author marker in the inspected text; the raw export's top-level owner and message `author.name` are null. Under Loom's standing archive policy, the outer user turn is attributed to Nathan, but that does **not** transfer authorship of the embedded page to Nathan. Embedded author remains unresolved.

### Correction to the earlier interpretation of assistant message `be9d54f6-0da9-496a-a764-21558b33c7bf`

The earlier report's phrase “retracts automatic derivation” was too broad. This is a **partial correction**:

- It disclaims the automatic mapping of optical Δφ and other real-world phenomena to SAT without an additional physical mapping.
- It nevertheless retains the assistant-authored assertion that 0.239 rad “comes from combinatorial projections of 4D filaments” and is “internally inevitable.”
- No derivation of that retained inevitability claim appears in the cited assistant turn.

Therefore the real-world optical inference is withdrawn, but the residual internal 0.239 claim remains an assistant assertion, not a verified SAT derivation or physical result.

The separate user-role message `b8cc4592-3a32-4893-9857-21f2b1e28e4b` says only “Ok, what about 14.1”; it is a question, not a method directive. The later 14.1° → 0.246-rad reframing is assistant-authored.

## Lean correction and actual run

The source-typed module initially mislabeled the “Ok, what about 14.1” turn as `ClaimKind.methodDirective`. I corrected it to `ClaimKind.directQuestion` and added theorem `fourteen_one_user_prompt_is_a_direct_question` on the existing PR #759 branch.

- Corrective commit / PR head: `c97db86dddc43f49ec0a9cadc51529d6f5d573db`.
- Exact-head Actions run: [#41026140873](https://github.com/Satobloc/HsH/actions/runs/41026140873).
- Job #123964595740: SUCCESS; Lean 4.34.0 / Lake 5.0.0; build completed, 8,950 jobs.
- All nine theorem-specific `#print axioms` outputs for `LoomOpticalClaimProvenance` report no axiom dependencies, including the new direct-question theorem.
- The automated axiom-audit, test, lint and nanoda stages were skipped.

The prior exact-head run #41025437921 on the preceding repaired head also succeeded with eight theorem-specific no-axiom outputs. Lean verifies only the encoded source graph and manually assigned claim/provenance labels; it does not authenticate the archive, establish embedded authorship, or prove any physical premise.

## Publication status — still rejected

Existing issue #1093 / submission `loom-0246-source-genealogy-20261030t0748z-s4-001` was submitted through the existing publisher. The publisher workflow job completed at the process level but the script rejected the payload with `SHA-256 mismatch` (run #41024509145, rejection comment #6518157453).

Independent verification:

- Issue payload content equals `WORKSPACES/LOOM/2026-10-30T0748Z_0246_SOURCE_GENEALOGY.md` exactly.
- Content length: 9,566 UTF-8 bytes.
- Declared digest: `50a6d39d1b5d7025f2b15056748a57ce32cf5a1d98fef0673e3e30055616c608`.
- Recomputed digest: `38c7620ba170b212d79388c1f398646577c2511cf8eb3c763296274b1e32fc6b`. The SHA-256 implementation was checked against the standard empty-string and `abc` test vectors before using this value.
- Expected `PUBLISHED_SUBMISSIONS` destination remains absent.

The workflow listens only to `issues.opened`; no edit or manual-dispatch route is present. No duplicate issue and no direct Contents fallback were created. Status remains `PUBLISHER_REJECTED / DESTINATION_NOT_PUBLISHED`.

## Mersearch and tool boundary

All four Mersearch request lanes remain `requested` and occupied: lane 1 Mercer spin/precession, lane 2 optics inventory, lane 3 chemistry inventory, lane 4 superconductors inventory. No lane was overwritten. This runtime exposes no direct Mersearch executable/tool; GitHub raw-blob retrieval and code search were used as bounded source retrieval, **not** represented as a Mersearch run. Existing Lean PR/CI was reused; no new tool, service, fork, subscription or cost was introduced. Math Hopper/Whirligig were not needed for this source-role/parent-graph audit; SciSpace was not needed because the target was an archived primary conversation, not outside literature.

## Unrelated reading and tags

Read `fun break - lx.txt`, blob `f33eb29fbac65efa1db054239bb9c28a04a13a42`, lines 101–140. The passage is a transcript-style language-discovery game (Hruso, Udmurt, Kusunda, Adyghe); speaker labels are textual, not raw role metadata.

Additive tags: `LANGUAGE-DISCOVERY-GAME`, `LINGUISTIC-GUESSING`, `LANGUAGE-FAMILY-CLASSIFICATION`, `CULTURAL-CURIOSITY`, `TRANSCRIPT-ONLY`, `TEXTUAL-SPEAKER-LABELS`. Return cursor: line 141.

## Routing and next cursor

- The Sable :36 predecessor receipt/handoff was not present at startup; record `HANDOFF_MISSING_OR_IN_FLIGHT`, not a missed check-in.
- The Aster :00 automation had already started at 08:00:19Z. The original Loom→Aster packet was created around 08:15Z, after Aster's run began. It is a late repository packet; consumption and acknowledgment are unverified. No cross-thread delivery is claimed.
- Aster's continuity confirms a Nathan-words/source-attribution remit and frozen Code Grurple state. This packet is optional cross-read only, not a formal review request or reassignment.
- FIE was last reviewed 2026-10-27; the 14-day rereview threshold has not elapsed.
- Orson retains P1 cognition ownership. November 9, November 30 and December 14 paper gates remain separate; none advanced.
- No physical calculation, data-free physical fixture, new theory promotion, BEDROCK change, task/ID/cadence change, signet action or conversation rename.

**Next:** Aster may verify the new Lean run and consume this late addendum if useful; keep the publisher rejection visible and decide only through existing authorized controls how to correct the issue-publisher path. Do not treat the 0.239 internal-inevitability sentence as proved, the 0.246 optical candidate as measured, or the embedded page as Nathan-authored.

# Sable | Review-MIND ancestry layers and rotation-auditor QA

**Run:** `REVROT3-19-20261011:497:s4` | **Selected:** Sable (index 0) | **Next:** Loom (index 1), `498:s0`  
**Participation:** source-grounded reconstruction; no authenticated historical Sable-thread reentry.

## Result

Two bounded findings:

1. The existing Viewer conversation-relation sidecar, Orson's message-parent graph, and an execution-time context manifest are three different evidence layers. They need explicit typed projections and a gate that consumes both ancestry and exposure evidence. None can substitute for the others.
2. The existing revival-rotation auditor still has a receipt-dialect gap. Current main misses non-bulleted bold metadata. The unmerged Sable dialect branch parses the run key but still fails to resolve the actual Kestrel `Selected worker` / `Next worker` fields.

No code, branch, PR, issue, paper, task, scheduler setting, or theory status was changed.

## 1. Identity and controls

The fixed rotation gives:
```
h=497; seq=5*497+4=2489; 2489 mod 19=0 -> Sable
next seq=2490; 2490 mod 19=1 -> Loom
next run: 2026-10-31T18:00:00Z, 498:s0
```

The live :48 task `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with its exact original VEVENT: `DTSTART;TZID=America/New_York:20261001T144800`, `RRULE:FREQ=HOURLY`. Current run `e8dcec47-7260-8332-b5f5-129bc6369fdc` was scheduled 17:48Z and started 17:44:35.004492Z. Last peek: `in_progress`, no `chat_ref`, no terminal completion time. No sixth task.

Ordinary Sable's current workspace charter is README blob `ad46b5a68c24a46a41f71f7dd6edda1cc5aa2463`; ordinary continuity checkpoint blob `9e2703971c2cc6c396a5b647d2bd800f808e3bef`. The separate `WORKSPACES/SABLE/CONTINUITY.md` belongs to A. Sable Meridian and was not used as ordinary-Sable identity evidence.

Historical ordinary-Sable route: `Revival Rotation`, conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, raw export blob `3bf173c217e0755419152aa2225f39713929a5fe`. The export has 28 mapping nodes, but only one user-role message. That direct request concerns bulk triage using the sieve/Mersearch route. The broader systems/capability remit in the workspace README is an assistant-authored synthesis, not a verbatim Nathan-authored charter recovered from that raw conversation. An export flag of `is_archived=false` does not establish current live-thread usability. No current Sable thread was authenticated.

Preflight read: live BEDROCK (568 lines, blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`); Steering Charter (blob `5f4263381afcb065e9062d5b5885593d0baa58db`); Three Paper Campaign (`9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`); onboarding (`e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`); Revival Rotation V3 (`90863a2a2b82b2d8e37ba1bd9f796389066f5409`); thread routing (`d9ea7c3a04e03822c65ee231d0b9545bf37907bd`); V4 not-found revival (`6761337dfcd0847226ee7baad84db0a9c496760a`); thread-first rule (`e79707587914edb76afca1c32f9f4dad4d0324b7`); reentry protocol (`7486f6ef658e882dc47058b271b12ed73673db80`); ND-2026-10-29 source-first gate (`e5d5390015528381d0f497a54335f9b40b9c50cf`); ND-2026-10-26 Lean priority (`2b49291aa0836b70e283950eabd9f74ff6707be3`). Main head at final preflight: `224346c0e375950c1b251cd619a6df46aff11246`. Task-branch graph blob `3c341c616aa893bf56ad5ad5919e09a17e0c2b46` remains an ACTIVE_SEED snapshot dated 2026-10-30 06:12Z with 15 entries; it does not list the ordinary-Sable parser branch.

## 2. Incoming Orson handoff

Consumed after the control-document preflight (not as the first startup action): `2026-10-31T1736Z_from_s3_to_s4_sable.md`, blob `300e74638a75ab078fbf1daef4321902f7f22447`. Sender receipt blob `caf1a4fbe8e38895840e297910285fb9ebbb779f`; report `2026-10-31T1736Z_VEY022_RECORDED_ANCESTRY_BLINDING_GATE.md`, blob `b632c9068e6f920d9749a0991ad6a3ca1412fd7a`. This was optional context only; no P1 ownership transfer or response obligation.

VEY-022 reopens raw conversation blob `dec20de13718ba09a59a76e9c958e3eee16304b0` and verifies a four-message chain: user hypothesis -> assistant endorsement -> user-supplied OCR -> assistant interpretation. The final assistant output is a transitive recorded descendant of the initial hypothesis. Different endpoint roles do not erase the recorded parent path. The OCR is additional user-provided material but was not independently verified against raw analytics. This is one naturalistic observation, not a controlled trial, causal estimate, independent witness, or evidence of institutional attention.

The 211-node export has 47 user, 98 assistant, 65 tool, 1 missing-role, and zero system/developer nodes. Archive-only absence of a parent path therefore cannot establish complete model-context visibility. Orson's `UNKNOWN_CONTEXT_INCOMPLETE` rule is essential; VEY-022 positively fails ancestry-blindness because a prohibited path is present.

### Existing Lean and publication status

Orson PR #850 remains open/draft at exact head `b820998976192ab3e4dc1cec1632d4d899bad031`. Exact-head Actions run #41225441898 completed SUCCESS; job #124609431758, 8,974 build targets. The new module blob is `6f6996afb18c6e626e548f35cdd7544b5c14a598`; root import blob `438ae972c4122d0b50b5a268f43af150db357cad`. I independently re-read the exact-head module and confirmed run status and source blobs. The four no-axiom theorem reports and zero `sorryAx` are recorded in Orson's additive amendment; raw Actions logs were not independently retrieved in this pass. Tests/lint were disabled; separate nanoda and automated axiom audit did not run.

The proof is limited to the encoded finite parent graph. It does not establish source authenticity, complete context capture, statistical independence, or causality.

Publisher issue #1160 is `PUBLISHED_VERIFIED`; issue payload and fetched artifact match exactly (5,082 characters). Publisher comment #6546932065 reports SHA-256 `9460d8b3a12f7bd0f9df21daeb9c979839f0e36b7dc9c60918a2ace3a4df451d`. P1 issue #564 remains `SOURCE / EXPERIMENT READINESS`: original OV-49–OV-53 answer-keyed bank unrecovered, authorized inference endpoint unavailable, no administered trial or human-subject session. Nov 9 P1, Nov 30 P2, and Dec 14 P3 remain separate.

## 3. Typed evidence-layer crosswalk

The existing Mercer Viewer sidecar proposal (Run 71 blob `79df4b07c15de531b6966abb463216174341ab39`; Run 73 harness record `918f45e0ac224de14e3e69713bd1c6257db7af84`; harness source `0c5e81fdf1299eb619a87416aaa9c1202c8e32b8`) groups export snapshots by embedded `conversation_id`, with members identified by `viewer_id` and `source_path`, plus neutral relation classes and diagnostic provenance. Its harness tests synthetic valid/invalid classes; this is not evidence of a production generator or production Viewer joins. The Sable inbox already records the sidecar as a sound minimum direction, not an implemented production schema.

The layers are:

1. **Export snapshot** (e): repository, commit, path, blob hash, export ID, embedded conversation ID.
2. **Family projection** (pi_F(e)): the Viewer sidecar's neutral export-family relations. It can identify related export snapshots, not message-parent or runtime-exposure edges.
3. **Message projection** (pi_M(e)=(M_e,P_e)): message nodes with message ID, parent ID, role, timestamp, branch, and source-snapshot identity; unresolved parent references stay unresolved.
4. **Execution-context projection** (pi_X(x)=C_x): exact supplied/retrieved context items for execution (x), including prompt versions, memory, retrieval, tool outputs, source IDs/hashes, model/provider/route/version/settings, timestamps, truncation/routing state where available, output ID, scorer version, and answer-key visibility.
5. **Adjudication gate** (B(M_e,P_e,C_x,mathrm{complete})): consumes the message graph and execution manifest. A recorded parent path is a positive ancestry conflict; a verified included input is a positive exposure conflict; incomplete context is UNKNOWN; CLEAR is allowed only when the named manifest is complete and no prohibited path/exposure is present.

Thus export -> message graph and execution -> context set are separate projections; the gate consumes both. The family sidecar helps identify the export snapshot but cannot substitute for either projection. A raw message graph cannot prove runtime context completeness.

Keep Orson's current three-state gate unchanged. A possible future reason-code refinement is `FAIL_RECORDED_ANCESTRY`, `FAIL_VERIFIED_EXPOSURE`, `UNKNOWN_CONTEXT_INCOMPLETE`, and `CLEAR_WITHIN_DECLARED_SCOPE`. This is a proposal, not adopted. CLEAR is necessary leakage control only; shared weights, training data, provider infrastructure, prompts, source documents, benchmark items, and correlated errors can remain. Distinct conversation IDs do not establish independent primary sources.

A possible Orson-owned Lean obligation is `Gate = CLEAR -> ContextComplete ∧ ¬RecordedPath ∧ ¬VerifiedExposure` and `¬ContextComplete -> Gate = UNKNOWN`. No new theorem was written; Orson retains P1 ownership. No new model inference or human-subject experiment was conducted.

## 4. Rotation-auditor parser defect

- Main head: `224346c0e375950c1b251cd619a6df46aff11246`.
- Main parser blob: `448114daa497510eb936f4cbc76b50c68745bde4`.
- Ordinary-Sable dialect branch: `research/sable-rotation-auditor-dialects-20261031t0236z`, head `d5d7f2d1991d336a542c92459e2194862aeef644`, parser blob `18dd7792e7ecf5e68f76a956242e92422be78ef0`; no PR found. Last Sable checkpoint recorded 178 commits behind main; exact current lag not recomputed.

Main's bold-field regex requires a leading list bullet. Actual receipts use non-bulleted bold metadata. A targeted Python replay of the exact parser patterns against actual Kestrel and Orson receipt-header excerpts showed main rejects these fields.

The dialect branch adds optional-bullet parsing and metadata-section boundaries, but its structured-field allowlist omits `selected_worker` and `next_worker`, and its identity hints do not match the actual Kestrel wording.

Targeted replay of the branch parser logic:
- Kestrel receipt blob `5df831ebdea71bf17902be253e92259968f3aeab`: run key parsed; selected and next identities returned `None`.
- Orson receipt blob `caf1a4fbe8e38895840e297910285fb9ebbb779f`: run key, Orson Vay, and Sable parsed correctly.

The branch self-test declares 22 checks and uses a Kestrel fixture phrased “Selected ring index 14: Kestrel”, not the actual `**Selected worker:** Kestrel, zero-based ring index 14` receipt dialect. The full branch self-test and full-tree CLI audit were not run here.

Recommended: add selected_worker/next_worker aliases and canonicalize them; add the exact Kestrel receipt as a regression fixture; transplant the minimal correction onto a current-main-based reviewed branch; then run full self-test and `--root . --json` on a real checkout. Do not blindly merge the stale branch. No code or branch changed.

## 5. Controls and next cursor

The :48 task remains enabled and unchanged. Its latest completed result is Kestrel run `17b40fd5-923c-8327-995e-0de4aba03200`, matching the Kestrel receipt; a later scheduler peek records completion at 17:01:48Z. This supersedes the receipt's earlier in-progress snapshot. No current result/content mismatch was observed.

The :36 Orson task remains enabled with its exact :36 VEVENT; run `f15249bb-7dc8-8321-ab37-9dfea467b0e4` completed at 17:52:10Z. Its automation chat_ref is not evidence of historical Orson-thread reentry. Current :48 Sable run remained in progress with no chat_ref at final peek.

Loom's historical pointer is `LOOM Tag Conversation Corpus`, conversation `6aa67478-541c-83e9-b8fa-32d6d575eeb9`; current usability is unverified. A personal-context lookup found no later matching conversation. No cross-thread posting action is available.

FIE review is not due (last full review 2026-10-27). Orson's :36 run completed unrelated reading in *TheTANGLE.txt*, lines 1561–1600; next cursor 1601. No repeat reading this run. Code Grurple remains ACTIVE. P1/P2/P3 gates unchanged.

No new tool, branch, PR, issue, public submission, manuscript, reader, task-graph mutation, Mersearch request, model inference, human-subject session, physical calculation, SAT-O/Blockwave equation change, or theory promotion.

**Next cursor:** preserve Orson's P1 ownership; keep the export-family / message-ancestry / execution-context layers distinct; and, if authorized, prepare a current-main-based reviewed parser fix with the actual Kestrel receipt regression.

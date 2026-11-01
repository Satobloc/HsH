# Orson Slot Replay: External Study Taxonomy and Receipt Integrity Audit

**Observed:** 2026-11-01 13:02:47.837589Z  
**Nominal scheduled occurrence:** 2026-11-01 12:36Z  
**Run key:** REVROT3-19-20261011:516:s3  
**Selected ring identity:** Orson Vay, index 18  
**Successor:** Sable, index 0  
**Participation class:** assistant reconstruction in the deterministically selected Orson lane; no historical Orson instance or thread is authenticated.

This is a second execution associated with the same nominal scheduled occurrence. A primary receipt already existed before this live task run began. This document is a supplement, not a second primary receipt.

## 1. Substantive source-genealogy correction

Three research objects must remain distinct:

1. **HsH P1**, issue [#564](https://github.com/Satobloc/HsH/issues/564): the Orson-protected November 9 LLM-cognition methods manuscript. Its current status is **SOURCE / EXPERIMENT READINESS**.
2. **ConsistencyBench**, the separate 17-model fixed-item archive used in the passive reanalysis. Its evaluator is a common measurement instrument; the archived primary path does not expose peer answers to the evaluated model. This is not a new HsH trial.
3. **Main Lobe Labs' Pauper Consensus repository**, pinned at commit **c328dab5ca1f1101b5ec56e2e92e3592898ceadf**: an external two-study research program. It is a methodological comparator, not the HsH P1 dataset and not ConsistencyBench.

### The external repository contains two studies

The pinned [firstpass/README.md](https://github.com/mainlobelabs/pauper-consensus/blob/c328dab5ca1f1101b5ec56e2e92e3592898ceadf/firstpass/README.md), blob **626a99747814530ae69c93296cde0f7a584ac476**, says that firstpass is imported from mainlobelabs/waveconv1, branch e1-results-and-paper, at commit 76d005d. It describes the imported material as Study 1, using ProofWriter reasoning traces. It also warns that root-level paper/final.md and paper/preregistration.md are Study 2 documents, not the corresponding files inside firstpass.

The root [paper/final.md](https://github.com/mainlobelabs/pauper-consensus/blob/c328dab5ca1f1101b5ec56e2e92e3592898ceadf/paper/final.md), blob **05a9d8b7ad00ad9b59fa4b1a17691040e1d99ca6**, is an integrated two-study draft:
- Part I: Study 1, sourced from firstpass/paper.md.
- Part II: Study 2, sourced from root paper/draft-v4.md.

Study 2 uses a separate news-article / claim / vote corpus. Its reported 200 articles, 8,000 claims and 96,000 votes are not the 17-model ConsistencyBench archive.

### Mapper identities and the Lean theorem's exact scope

At the same pinned commit:

| Artifact | Blob SHA-1 | Role |
|---|---|---|
| firstpass/exp/e1.py | 4c34a238afd4a86f1b6cbabe6f7da383b40ed906 | Study 1 E1 primary path; calls align_anchored |
| firstpass/wct/cluster.py | 45ad33fff02bb065cfdd2f1a1d2cd70f073da1f3 | Contains exploratory align_free closure |
| firstpass/wct3/align.py | b7370728f62168db3a00135fac9b15b0c4ee1fd0 | Later align_instances claim-instance-preserving path |

The primary E1 path uses a canonical proposition set and align_anchored. The align_free union-find closure is explicitly exploratory. The later align_instances path preserves pre-collapse claim instances and is a distinct implementation.

HsH PR [#850](https://github.com/Satobloc/HsH/pull/850) currently formalizes the algebraic closure properties of the exploratory align_free path in OrsonNLIClusterClosure.lean. It does **not** formalize the primary align_anchored implementation, the later align_instances implementation, the ConsistencyBench evaluator, or an HsH P1 experiment. It does not validate the Python code or establish empirical results.

This crosswalk sharpens the existing [P1 mapper/aggregation report #1207](https://github.com/Satobloc/HsH/issues/1207). It does not reverse that report's distinction between exploratory and primary paths. It makes the separate study and dataset identities explicit so that “Study 1,” “P1,” and “ConsistencyBench” cannot be silently conflated.

## 2. Existing Lean verification independently inspected

PR #850 head: **265a469ee7f28718d16320e75edd1b6d42662223**  
Module blob: **6e720ecbc8e1f4b36fcb1d3a86c0e12873777bff**  
Root aggregator blob: **41004eb179e42b2c8f8097c0b458a1b098d1f2e3**

Actions run [#41290611880](https://github.com/Satobloc/HsH/actions/runs/41290611880), attempt 2, job 124852022587, was independently inspected.

- Actual checkout: merge commit 6710221e..., merging PR head 265a469... into base 598a45b....
- Full library build: 8,976 jobs, successful.
- New module built.
- sorryAx: 0 in the retrieved log.
- admit: 0 in the retrieved log.
- Theorem-specific axiom output: clusterClosure_equivalence reported no axioms; the other inspected results used standard propext / Quot.sound dependencies.
- Tests, lint, nanoda and the separate automated axiom audit were skipped.

Classification: **MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_STANDALONE_NOT_RUN**. The proof establishes the encoded closure algebra only. It does not validate source translation, the external Python implementation, or any physical or cognitive premise.

No new theorem was needed for this source-genealogy correction.

## 3. Original Orson bank and experiment status

The operational Orson role charter was read. Its exact original October 9 raw role-reset message and message UUID remain unrecovered.

The OV-49–OV-53 pointer is inconsistent with the recovered source inventory: those numbered artifacts are geometry material, not the described neutral-versus-false-authority matched cognition bank. The recovered OV95 / OV96 files are synthetic confidence/verification fixtures and scorer material, not administered model sessions. The recovered Orson LLM Cognition Lab export contains an OV95 package but no original OV-49–OV-53 bank. A bounded search of the Orson Free Build export also found no user-role bank instruction matching the claimed framing.

The Library search and repository search did not recover the original bank. This is a bounded negative result, not proof that the bank never existed.

All four Mersearch request slots were occupied at inspection. No request was overwritten and no new request was opened.

No model calls, human-subject sessions or new trial administrations occurred. No authorized endpoint was identified. P1 issue #564 remains open and at **SOURCE / EXPERIMENT READINESS**. The November 2 protocol decision must not be represented as an administered-trial freeze unless the original bank and authorized route are recovered, or a new bank is explicitly created and preregistered. No paper gate is advanced here.

## 4. Receipt identity and preflight correction

The existing primary receipt is:

WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-01T1236Z_s3_orson_vay.md

Its GitHub creation commit is **baef5f1c918db5998501ec2590504cbfb1e5d9ac**, committed at 2026-11-01 12:58:50Z, with parent **abc9c1dc7b29e1e416bffae46cf63d20a8b899af**.

The current live automation run is a separate run:
- Task ID: **6a9f52b69ec08191b0a2ba24a074f781**.
- Run ID: **626365fe-0c98-8324-87d6-c5fd4ed7dd2c**.
- Scheduled for: 2026-11-01 12:36:00Z.
- Started: 2026-11-01 13:02:47.837589Z.
- Status at final inspection: **in_progress**.

Therefore the primary receipt commit predates this live run. It cannot be attributed to this execution.

The primary receipt's Execution run ID field is malformed, and its separate current-run identifier does not match the live task run ID. The claimed pre-run main commit **d988be5b5d2193e1666c3ce7a70f34a8d5f7a4b1** returned GitHub API 422, “No commit found for SHA.” The actual parent of the receipt commit is **abc9c1dc7b29e1e416bffae46cf63d20a8b899af**.

At that parent commit, the following source blobs were independently fetched. The same blob identities were observed at current main during this audit:

| Source | Verified blob SHA-1 |
|---|---|
| BEDROCK.md | 38a5b8f4c9d573e54ca4a449be70d0a7d94a484c |
| Steering Charter 2026-10-26 | 5f4263381afcb065e9062d5b5885593d0baa58db |
| Three Paper Campaign 2026-10-26 | 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0 |
| New Instance Start Here | e1fa2fb7c582a1b4528e9507644bd3f481fce8e0 |
| Revival Rotation V3 | 90863a2a2b82b2d8e37ba1bd9f796389066f5409 |
| Revival Rotation Thread Routing | d9ea7c3a04e03822c65ee231d0b9545bf37907bd |
| Orson LLM Cognition Role Charter | ee3342c463be0d5970602e58f68bc49f7c25eee1 |
| Orson cumulative findings | 752fb94eb2a862f324925b1153b59a5b3dd89571 |
| Orson inbox | a7f1c5cdacc0b8d5873232adfae3b4a29b19a238 |

The SHA values and claimed main commit in the primary receipt do not match these independently fetched repository objects. They are now classified **UNVERIFIED / INCONSISTENT**, not silently accepted.

### Publisher result is separate and remains verified

The existing publisher artifact for issue #1207 remains intact:
- File blob: **e2c8aaa3bdb303fe03e848548e161663c319a992**.
- 7,604 characters.
- Issue #1207 payload content exactly matches the file content.
- Publisher comment #6558238087 records SHA-256 and readback.
- An independent SHA-256 recomputation was not performed in this runtime.

The publisher artifact's PUBLISHED_VERIFIED state is not invalidated by the separate receipt preflight defect. No duplicate publisher issue or artifact was created.

## 5. BEDROCK review

Full BEDROCK.md was read (568 lines; verified blob above).

- The ND / FB / WB / TF / OC / SS distinctions remain in force. This run does not promote an assistant reconstruction, operational record or external comparator into Nathan Direct or foundational theory.
- ND-2026-10-25-01 remains controlling for real data and the prohibition on data-free calculations without explicit permission. No new numerical or physical calculation was performed.
- BR-007 Mersearch-first was followed. All four request slots were occupied, so only bounded direct source reads and Library searches were used.
- BR-003 prohibits promotion by AI consensus. No promotion is proposed.
- ND-2026-10-29 source-first is preserved. The original Orson role-reset source and bank remain unresolved.
- No BEDROCK theory statement, SAT-O equation or Blockwave equation was changed.

## 6. Boundaries and next cursor

- No new primary receipt; this is an amendment to the existing nominal-slot record.
- No new PR, branch, issue or dependency.
- PR #850 remains open, draft and unmerged.
- P1 remains source/experiment readiness; no trial, PDF or reader gate advanced.
- Code Grurple and P2/P3 remain untouched.
- FIE review is not due; last full review October 27.
- No unrelated-reading break repeated; the existing Orson cursor remains Astronomer Talks, lines 661-720, next cursor 721.
- The next ring identity is Sable. Its immediate s4 appearance already completed, so any packet is **LATE_FOR_CURRENT_RECIPIENT_RUN / NEXT_APPEARANCE_ONLY**. No ChatGPT-thread delivery or recipient acknowledgment is claimed.

The existing :36 automation remains enabled with its original task ID, hourly America/New_York :36 schedule and phase unchanged. No sixth task was created. This live run had not reached a terminal scheduler state at final inspection.


## Amendment 01: independent publisher checksum verification (2026-11-01T13:22:43.357Z)

The publisher artifact for issue #1207 was re-fetched from current main and checked against the issue payload.

- Artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-p1-mapper-aggregation-identity-20261101t1236z-s3-retry1.md
- Git blob: e2c8aaa3bdb303fe03e848548e161663c319a992
- UTF-8 character count: 7,604
- Issue #1207 JSON payload content: exact match to fetched file
- Independently recomputed SHA-256: 9d99f6b2d0307b5cb55719fa1a44027d72413bd6e40e2753cf6d1b0644fdfa79
- Publisher comment: #6558238087 records the same SHA-256 and readback.

The in-runtime SHA-256 implementation was checked against the standard empty-string and "abc" test vectors before hashing the artifact. Both test vectors matched their published SHA-256 values.

**Correction:** this independently verified checksum supersedes the earlier statement in Section 4 that independent SHA-256 recomputation was not performed. The artifact is now independently checksum-verified and readback-verified. No new publisher issue or artifact was created.

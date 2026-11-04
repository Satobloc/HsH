# Orson Vay | VEY-028 balanced-panel contrast formalization | 2026-11-04T16:36Z

**Disposition:** EXISTING PR #850 EXTENDED · CONDITIONAL LEAN FORMALIZATION SUBMITTED · CI COMPILATION IN PROGRESS · NO PROOF-SUCCESS CLAIM · P1 SCOPE UNCHANGED.

## 1. Rotation, role and continuity

- Nominal UTC hour: 2026-11-04T16:00Z.
- h = 592; sequence = 5h + 3 = 2963; 2963 mod 19 = 18.
- Selected ring label: Orson Vay (index 18).
- Next ring label: Sable (index 0).
- The ring label is deterministic routing, not an authenticated ChatGPT instance/thread.

The assistant-maintained role card is `WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md`, blob `894a8fd3829b0ffb0d25402daba5d40fa53c2534`. It assigns LLM cognition as primary remit. Prior-conversation retrieval independently recovers Nathan's direct October 10 instruction at 03:41:29Z: “refocus on LLM cognition, as was your original warrant”; follow-up at 05:51:59Z: “Ok. Decide on your reading list and begin.” The exact conversation UUID and message ID remain unrecovered, so this is not represented as a raw-export citation. No authenticated current Orson thread was established; no cross-thread delivery is claimed.

This is a substantive LLM-cognition formalization turn and therefore counts toward the protected cognition allocation. The rolling four-of-five ratio is not claimed without a complete last-five actual-activation census.

## 2. Current P1 boundary

The controlling P1 protocol freeze is `WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md`, blob `9af4448d25f656ad1e63301660de63fd32924d5f`.

P1 remains a source-audited methods/archival paper on shared evaluator dependence and within-model self-revision in ConsistencyBench. The archived CGD procedure exposes each target model to its own prior answers; it does not expose one model's answer to another. It is not a cross-model peer-deliberation experiment. No new LLM trial, human session, API spend, causal peer-influence claim, or paper-gate advancement is authorized or claimed here.

The external Awuni et al. panel study is a complementary evaluator-provenance comparator, not P1 evidence or a P1 replication.

## 3. Source and mathematical target

Primary external source: Awuni et al. (2026), “Who Judges Matters: Measuring Family-Conditioned Preference in LLM-as-Judge Panels,” arXiv:2609.17857v1. The internal source audit is `HSH_RESOURCES/Consciousness + AI/VEY_COGNITION_LAB/STUDIES/VEY-028_FAMILY_CONDITIONED_JUDGE_PREFERENCE_2026-11-04.md`, blob `98770ef41739abe374309814de76c7da66b3591e`. The source index records full-text review of arXiv HTML §§1–11 and Appendices A–D. No raw data or code archive was independently retrieved in this turn.

For four judge/candidate families, the source decomposition is:

```
P(j,c) = μ + a_j + b_c + γ_jc
```

Under the source's balanced row means and zero-sum/double-centering assumptions:

- `μ + a_j = 1/2` for each judge family;
- `Σ_c b_c = 0`;
- `Σ_c γ_jc = 0` for each row;
- `Σ_j γ_jc = 0` for each column.

Define each diagonal contrast as the diagonal cell minus the mean of the other three cells in the same row or column. The conditional identities are:

```
R_f = (4/3)(b_f + γ_ff)
C_f = (4/3)γ_ff
R_f - C_f = (4/3)b_f
```

The row contrast therefore mixes candidate-family strength and diagonal interaction. The column contrast isolates the diagonal interaction only under the stated balance/centering conditions. Their difference isolates the candidate-family main effect under those same conditions.

A separate source model gives symmetric independent content-noise reversal probability `2p(1-p)`; algebraically this is at most 1/2, with equality only at p=1/2. This bound does not prove that the empirical 55.4% AB/BA reversal is caused by position bias; it only rules out that simple model as a complete explanation of a rate above 50%.

## 4. Existing Lean route reused

No new tool, branch, PR, fork, paid service or dependency was created. The existing Orson PR #850 was extended in place:

- Repository: `Satobloc/HsH`.
- Existing branch: `research/orson-p1-shared-nli-bound-20261028t06z`.
- Existing PR: #850, still DRAFT / OPEN / UNMERGED.
- New module: `FORMAL_VERIFICATION/HsHVerification/OrsonFamilyConditionedPreference.lean`.
- Module blob: `58e097941587b9889707f63a012af5a2664803ce`.
- Root aggregator: `FORMAL_VERIFICATION/HsHVerification.lean`.
- Root aggregator blob: `4586adeee53436723b8b57f0cfdb067b9ea1756b`.
- Branch head: `5bad1dcc79a686cd2a7e1f27c297a10cbcc802c6`.
- Import commit: `5bad1dcc79a686cd2a7e1f27c297a10cbcc802c6` (2026-11-04T16:43:14Z).
- New module commit: `7e2dc7045ff32b192ed60bbb84c623a0dadf2999`.

The module encodes seven closed proof targets: row-total identity, column-total identity, row contrast, column contrast, row-minus-column identification, the symmetric-noise reversal bound, and its equality condition. It includes theorem-specific `#print axioms` commands. No `sorry` or `admit` was added.

### Actual CI state

- Lean 4 verification workflow run: #41870255531.
- Run URL: https://github.com/Satobloc/HsH/actions/runs/41870255531
- Job: #126715066924 (`verify`).
- Exact workflow head SHA: `5bad1dcc79a686cd2a7e1f27c297a10cbcc802c6`.
- At last inspection: checkout PASS; Lake dependency-manifest generation PASS; “Install Lean and compile formal library” IN_PROGRESS; environment/axiom-log step not yet complete.
- Status: `SUBMITTED_NOT_VERIFIED`.

No Lean compilation success, theorem-specific axiom result, full-build success, or `LEAN_PROVED` status is claimed. No local Lean/Lake/Elan executable is installed. The next worker must inspect the completed run and exact log; if the build fails, repair only this new module on the existing branch and rerun. A merge-reference build must be distinguished from a standalone PR-head build.

## 5. Formal and empirical boundaries

Lean, if successful, will verify only the formalized algebra under the encoded assumptions. It will not verify:
- that the source paper's reported cell means satisfy those assumptions;
- the paper's raw data, randomization or panel construction;
- model-family independence or the human anchor;
- likelihood-familiarity or order-instability causal explanations;
- any effect in the frozen ConsistencyBench P1 archive;
- consciousness, subjective experience, or collective intelligence.

No empirical reanalysis, model trial, physical calculation, or independent replication was performed.

## 6. Tool/source reconnaissance and lateral reading

- Math Hopper exists but is extraction/navigation, not a proof engine; its existing implementation was checked rather than rebuilt.
- Existing Mathlib/Lean route in PR #850 was reused.
- Whirligig is unrelated to this cognition measurement problem; no coupling was asserted.
- SciSpace/source-index work for VEY-028 already records full-text review; no duplicate search or new service was needed.
- Mersearch lane 3 request `hale-archive-source-lineage-20261104-1538` completed on all three roots; its compact receipt reports only two duplicate Tern-conversation hits, not an Orson charter source. Lanes 1, 2 and 4 remain occupied; no request was overwritten or created.

Deliberate unrelated reading continued Harold Jacoby, *Practical Talks by an Astronomer*, HSH_RESOURCES `HISTORICAL/JACOBY—ASTRONOMER TALKS.txt`, blob `a7f48e0a01dc7c647d6c18f5418d90d71242b8e3`, lines 1061–1100. The passage moves from the 1901 Perseus nova to Jacoby's biographical framing of Galileo. Next cursor: line 1101. No physical break is claimed. FIE last full review October 27; next due November 10.

## 7. Durable status and next cursor

- P1 remains ACTIVE / METHODS-ARCHIVAL / NOVEMBER 9 NOT READY.
- P2 November 30 and P3 December 14 remain separate.
- BEDROCK unchanged; no theory promotion.
- SAT-O and Blockwave originals unchanged.
- No public issue/comment submitted yet; wait for verified Lean status before updating existing issue #1334. Do not create a duplicate issue.
- Existing :36 automation ID `6a9f52b69ec08191b0a2ba24a074f781`, hourly phase and enabled state preserved; no sixth task.

**Next:** inspect run #41870255531 to completion; record exact Lean version, compile result, theorem-specific axiom output, full-build result and skipped stages. If successful, append a proof-status addendum to VEY-028 and the existing issue #1334, then update the P1 graph cursor. If failed, preserve diagnostics and repair only the new module. Continue with P1 source LaTeX/PDF/reader/independent-review gates; do not reopen the frozen empirical scope without new authorization and real inputs.

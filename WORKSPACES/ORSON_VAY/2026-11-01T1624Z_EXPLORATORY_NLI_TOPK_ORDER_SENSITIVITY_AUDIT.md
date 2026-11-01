# Orson Vay | 2026-11-01 16:24 UTC
## Exploratory NLI top-k candidate-order sensitivity audit

**Status:** SOURCE-CODE FINDING FORMALIZED IN EXISTING PR #850 / NEW LEAN CI IN PROGRESS / NO DATASET-LEVEL EFFECT MEASURED / P1 PRIMARY ANALYSIS UNAFFECTED ON AVAILABLE SOURCE EVIDENCE.

### 1. Rotation, identity and controls

The fixed :24 rotation gives:

- Nominal UTC hour since 2026-10-11T00Z: **h = 520**.
- Sequence: **5h + 2 = 2602**.
- Ring index: **2602 mod 19 = 18**.
- Selected label: **Orson Vay**.
- Next label: **Sable**, ring index 0.
- Current run key: `REVROT3-19-20261011:520:s2`.
- Immediate successor key: `REVROT3-19-20261011:520:s3`.

Selection is deterministic only. No historical Orson ChatGPT instance/thread was authenticated.

The existing :24 automation remains enabled and unchanged:

- Task ID: `6abda4c8eda88191bf23a6f2849e9a17`.
- Recurrence: hourly, America/New_York, original :24 phase.
- No task, prompt, ID, cadence or phase mutation; no sixth task.

The actual current execution is run `2de0f31d-cb2c-8320-acef-b0fd2862bedf`, scheduled 2026-11-01 16:24:00Z, started 16:21:32.738630Z. At final inspection it remained `in_progress`, `completed_at=null`, `chat_ref=null`. The automation's `latest_result` still belongs to the preceding Morrow run `defb72d6-8bac-8329-b971-f61cfcfc74be`, scheduled 15:24Z and completed 15:46:33Z; it is not this Orson result.

### 2. Preflight source set

Read the live main-branch sources and the current Orson records:

| Source | Blob SHA |
|---|---|
| `BEDROCK.md` (568 lines) | `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` |
| Steering Charter 2026-10-26 | `5f4263381afcb065e9062d5b5885593d0baa58db` |
| Three Paper Campaign 2026-10-26 | `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0` |
| New Instance Start Here | `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0` |
| Revival Rotation V3 | `90863a2a2b82b2d8e37ba1bd9f796389066f5409` |
| Task Branch Graph | `3c341c616aa893bf56ad5ad5919e09a17e0c2b46` |
| Orson LLM Cognition role charter | `ee3342c463be0d5970602e58f68bc49f7c25eee1` |
| Prior Orson :36 receipt | `e7684ba94b64a3517aaccd2d170679088d736612` |
| Prior Orson source-taxonomy report | `339a5a680d28097f315a11565d119835aae21abe` |
| Orson inbox | `d3a4e7928c74a9d08ef0e230198e9a95bfe21482` |

The role charter preserves Orson's protected LLM-cognition assignment and the target of at least four of five actual substantive Orson appearances on genuine cognition research. The exact original October 9 role-reset conversation remains unrecovered; the live role charter is an operational record, not a substitute for that raw source.

P1 issue #564 remains **OPEN / SOURCE-EXPERIMENT READINESS**. The original OV-49–OV-53 neutral-versus-false-authority answer-keyed bank remains unrecovered; the old OV-49–OV-53 pointer resolves to geometry/finite-core material, not that bank. OV-55/56 are assistant-authored analytic/simulation notes, not administered trials. No authorized model-inference endpoint was identified. No model call, human-subject session, new trial, API spend, semantic adjudication, manuscript edit or paper-gate advancement occurred.

The shared Mersearch request slot is occupied by Morrow's `morrow-sep13-dashboard-common-source-recovery-20261101-1524` request, whose run #41321508369 was still in progress at inspection. No lane was overwritten and no duplicate request was submitted.

### 3. Pinned external source and exact algorithm

Repository: `mainlobelabs/pauper-consensus`  
Commit: `c328dab5ca1f1101b5ec56e2e92e3592898ceadf`

Relevant source identities:

- `firstpass/wct/cluster.py`, blob `45ad33fff02bb065cfdd2f1a1d2cd70f073da1f3`.
- `firstpass/exp/e1.py`, blob `4c34a238afd4a86f1b6cbabe6f7da383b40ed906`.
- `firstpass/wct3/align.py`, blob `b7370728f62168db3a00135fac9b15b0c4ee1fd0`.
- `firstpass/tests/test_wct3_align.py`, blob `90b72538774684f3069290fa24382376477f8182`.

In exploratory `align_free`:

- Row-wise top-k neighbors are computed at `cluster.py:182` from the symmetric embedding-similarity matrix.
- Candidate generation discards every `j <= i` at `cluster.py:187`.
- Only after that candidate filter are forward and reverse NLI scores computed at lines 193–194.
- Accepted edges are then merged by union-find and transitivity violations are counted later in the function.

The candidate set is therefore:

```
E = {(i,j) | i < j and j is in TopK(i)}
```

It is not, by construction, the union-kNN graph `TopK(i,j) OR TopK(j,i)`, nor the mutual-kNN graph `TopK(i,j) AND TopK(j,i)`.

A symmetric cosine-similarity matrix does not imply a symmetric row-wise top-k relation: local rank neighborhoods can be asymmetric. If such an asymmetric pair occurs, the `j > i` filter consults only the lower-index endpoint's outgoing neighbor bit. Reordering the two claim instances swaps which directed bit is consulted. The subsequent bidirectional NLI scoring cannot restore a pair omitted at candidate generation.

### 4. Critical scope boundary

This finding applies only to the exploratory `align_free` candidate-generation path.

The pinned primary E1 function `firstpass/exp/e1.py:67` calls `cluster.align_anchored`, which maps claims to a canonical proposition set. The later `firstpass/wct3/align.py` `align_instances` path preserves pre-collapse claim-to-target assignments while keeping the anchored observation output. Its tests compare that path with `align_anchored`; no `align_free` test appears in the inspected `test_wct3_align.py`.

Accordingly:

- No effect on the registered primary E1 result is established.
- No effect on the separate ConsistencyBench archive is established.
- No effect on HsH P1's primary evidence is established.
- No dataset-level asymmetric-neighbor count, order-permutation replay, cluster-change rate or transitivity-violation rate was computed.
- The actual embeddings and raw candidate lists were not retrieved or run.

This is a static source-code risk, not an empirical result.

### 5. Lean formalization added to existing PR #850

Existing draft PR reused; no new branch or PR:

- PR: `#850`.
- Branch: `research/orson-p1-shared-nli-bound-20261028t06z`.
- Commit: `6b08ffbcc7ca64d5a9a55447b586e31aaef34a5b`.
- Module blob: `72609ead71293dc889da07ecd5832d4bc7cdb8af`.
- Module: `FORMAL_VERIFICATION/HsHVerification/OrsonNLIClusterClosure.lean`.

Added generic, conditional theorems:

1. The current lower-index filter consults the lower-index endpoint's directed neighbor bit.
2. Swapping the two positions makes it consult the reverse directed bit.
3. If the directed top-k relation is asymmetric for the pair, candidate selection changes under the swap.
4. Explicit union-kNN and mutual-kNN candidate definitions are symmetric in their endpoints.

No new three-node fixture or numerical example was added. The pre-existing illustrative three-node closure witness remains in the module and is not empirical data.

**Lean status at final inspection:** Actions run #41326800775, job #124908336445, was `in_progress`. Checkout and Lake dependency-manifest generation succeeded; the Lean compile step was still running. No compile success, theorem-axiom output or `sorryAx` audit is claimed for the new commit. The preceding run #41290611880 succeeded on the prior PR head `265a469ee7f28718d16320e75edd1b6d42662223`; that does not verify the new commit.

The PR remains open, draft and unmerged. No merge or theory promotion.

### 6. Tooling and inference feasibility

Existing PR #850 and its Mathlib pipeline were reused. SciSpace was used for literature discovery; it surfaced a possible OSF peer-exposure study, but its primary full text could not be independently retrieved, so it is not used as evidence or cited as a verified result. The already-integrated Hossain et al. paper (arXiv:2609.22512) was not duplicated.

This runtime has no Lean/Lake/Elan binary, no Ollama/llama-server/llamafile/vLLM, no Transformers or llama.cpp package, no CUDA GPU, and no local OpenAI-compatible endpoint at 127.0.0.1:1234. The installed Python `openai` package is not an authorized inference endpoint. No provider credentials were used and no model call was made.

### 7. Unrelated reading and review cadence

Completed the next unrelated reading segment: Harold Jacoby, *Practical Talks by an Astronomer*, lines 721–780, in HSH_RESOURCES `HISTORICAL/JACOBY—ASTRONOMER TALKS.txt`, blob `a7f48e0a01dc7c647d6c18f5418d90d71242b8e3`.

The passage distinguishes apparent superposition of the 1885 temporary star on the Andromeda nebula from a genuine physical association, then contrasts the Orion nebula's spectroscopic gas evidence with an unresolved star-cluster interpretation. It is unrelated reading, not H(s)H evidence.

Next cursor: line 781. Last full FIE review remains October 27; the 14-day rereview is not due.

### 8. Disposition

The new result is a conditional, source-level algorithmic warning about an exploratory NLI mapper. It should not be described as a defect in the registered primary analysis, a measured cluster instability, an HsH cognition result, or a causal peer-influence finding.

For any future use of `align_free`, the candidate-edge semantics should be explicitly chosen and preregistered: union-kNN, mutual-kNN, or another justified rule. An order-permutation test should be run on actual archived embeddings before claiming empirical order sensitivity. No such test was run here.

**Final state:** PR commit pushed and read back; Lean CI pending; no dataset-level replay; no model trial; P1 remains source/experiment readiness; no task changes; no theory promotion.

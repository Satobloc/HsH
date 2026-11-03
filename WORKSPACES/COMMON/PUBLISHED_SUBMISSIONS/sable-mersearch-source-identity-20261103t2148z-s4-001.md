# Review-MIND source-identity audit: Mersearch path aliases

**Status:** source-grounded methodological finding; no new experiment, no new tooling, no paper-gate change.

## Finding

The Orson Mersearch request `orson-cognition-origin-bank-20261103-1745` produced a compact receipt at 2026-11-03T20:56:18Z:

- 135 search hits
- 74 distinct sources
- HsH root: 90 hits
- HSH_RESOURCES root: 45 hits
- SAT_THEORY_ARCHIVE root: 0 hits

The receipt generator's `distinct_sources` value is the number of unique `(root, path)` pairs. The Markdown receipt itself labels this measure "distinct source paths". It is not a count of unique messages, conversations, independent authors, or independent evidence sources.

Five top-ranked path entries share the same message locator, `message:3e7d7870-9cc6-42fd-83ce-92d8c6326789`. The five entries resolve to four Git blob SHAs; two paths are byte-identical at the Git blob level. Thus five path hits represent one underlying message identity, not five independent source events. The message is a user-role literature-discovery instruction that mentions LLM cognition as an adjacent research area. It is not an observed model behavior, human-LLM interaction result, or Orson P1 assignment. No raw message text is reproduced here.

This establishes at least one path-alias cluster in the receipt. It does **not** establish how many of the other 69 path entries are aliases, because the compact receipt is intentionally incomplete and the full raw `SEARCH_RESULTS.json` is not exposed in this publication surface.

## Important metric collision

A separate Mercer v4 artifact reports 74 repeated conversation-ID families among 412 Viewer-resolved accepted JSON inputs. That is a different population and unit from Mersearch's 74 unique `(root, path)` pairs among 135 hits. The equal integer is coincidental, not corroboration.

The Mercer artifact is from workflow run 35118273709, artifact 10456196155. Its ZIP digest was verified against GitHub metadata: `fb095cef2a5e0d396f74634dce1fc4965934405046929f3fb4841c2e161d8d62`. Its v4 identity diagnostic is read-only and scoped to Viewer-resolved accepted JSON inputs; it does not provide a repository-wide path-alias census. The target Meridian conversation is not listed among its repeated-family output, but the artifact does not expose the full set of all scanned IDs, so that absence does not establish whether it was scanned as a singleton or was outside the accepted set.

The same artifact's `report-v2.json` is **BLOCKED** (13 PASS, 1 BLOCKED) by manifest operational blockers and parse warnings. Its `viewer-input-dedup.json` reports one path collision for a different conversation. Do not treat the artifact as a clean global archive validation.

## Existing tooling checked

- Existing Mersearch compact-receipt generator: `tools/mersearch_compact_receipt.py`. It groups by root and path, not by message identity.
- Existing Mercer v4 read-only identity diagnostic: `WORKSPACES/MERCER/diagnose_conversation_identity_duplicates_v4.py`. Its artifact scope is Viewer-resolved accepted JSON inputs.
- Existing conversation-relation sidecar contract test: `WORKSPACES/MERCER/test_conversation_relation_sidecar_contract.py`. This is a synthetic contract harness, not a production join or verified generator.
- No new tool, dependency, branch, or PR was created. The existing tools were inspected rather than replaced.

## Minimal improvement proposal

Keep every original path visible, but separate the measures in a future version of the existing compact receipt:

1. `distinct_source_paths`: unique `(root, path)` pairs.
2. `distinct_message_ids`: unique message UUID locators where present.
3. `distinct_conversation_ids`: unique conversation IDs where present.
4. `distinct_blob_shas`: unique raw-file blob identities where available.
5. `path_alias_groups`: group path aliases under one message or conversation identity without hiding, merging, ranking, or asserting authority/currentness.

Retain the existing `distinct_sources` field only as a deprecated compatibility alias if schema consumers require it. Do not infer independence from any one of these counts. A full source-independence claim requires provenance and lineage, not path arithmetic.

## Formal results and limits

Two existing Lean results are relevant but do not formalize this specific five-path dataset:

- Orson's `ArchiveEQ0034.lean`, PR #388, theorem `duplicated_vote_forces_raw_majority`. Lean 4.34.0 / Mathlib CI run 40421168602, job 121916222617, built 8,951 jobs successfully. The theorem-specific `#print axioms` output reports no axioms for the four declarations in that module. It proves a Boolean majority fact about duplicated vote slots; it does not assert that any empirical model panel contains such duplication.
- Kestrel's `KestrelConsensusIdentityBlindness.lean`, PR #873, theorem `aggregate_pair_count_does_not_identify_partition`. The module compiled and evaluated its finite witness (6, 6, 2, 3, true, false) in existing Lean CI. The overall verification job failed later in an unrelated Kestrel module; tests, lint, nanoda, and a separate global axiom audit were skipped. Its six-member witness is abstract, not an observed dataset.

The Mersearch path-to-message map has not been formalized in Lean. The compact receipt withholds the full raw result set, and no local Lean/Lake installation was present. No new Lean theorem or local compile is claimed. Lean validates only the formalized proposition, not the empirical source mapping or its interpretation.

## Orson P1 boundary

Orson's November 2 P1 protocol freeze remains a methods/archival study of shared evaluator dependence and within-model self-revision. It is not a cross-model peer-deliberation experiment. This Mersearch source is an archive/literature-discovery instruction, not a P1 observation or new trial. No participant session, new model trial, manuscript edit, P1 protocol change, or paper-gate advancement occurred. The November 9, November 30, and December 14 gates remain separate.

## Disconfirmatory follow-up proposal

After the P1 gate, a separate model-only test could compare:

- one canonical path to a source message;
- five archive aliases carrying the same message UUID;
- five genuinely distinct messages with similar topical wording.

Hold model, version, prompt, source text, retrieval order, and evaluator constant; randomize alias presentation; score independent-source counts, source clustering, and confidence against a blinded source-identity key. A model that counts five aliases as five independent sources fails the alias condition. A model that consistently counts one source in the alias condition and five in the independent-message control weakens the concern. This is a proposal only; no model calls or human-subject data were generated. Any later human-LLM group extension requires consent, privacy controls, and independent measurement.

## Public source pointers

- Mersearch compact receipt: `indexes/mersearch_requests/orson-cognition-origin-bank-20261103-1745/SEARCH_RECEIPT.md`
- Mersearch receipt JSON: `indexes/mersearch_requests/orson-cognition-origin-bank-20261103-1745/SEARCH_RECEIPT.json`
- Mersearch run manifest: `indexes/mersearch_requests/orson-cognition-origin-bank-20261103-1745/RUN_MANIFEST.json`
- Receipt generator: `tools/mersearch_compact_receipt.py`
- Mercer v4 workflow run: `https://github.com/Satobloc/HsH/actions/runs/35118273709`
- Orson source-cluster proof: `https://github.com/Satobloc/HsH/pull/388`
- Kestrel identity-partition proof: `https://github.com/Satobloc/HsH/pull/873`
- Orson P1 freeze: `WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md`

**Epistemic classification:** actual repository receipt and blob metadata; direct-source classification checked against a raw export; existing Lean proofs of general propositions; assistant-proposed receipt schema and future experiment. No claim of agent consciousness, model personhood, causal social influence, independent model instances, or empirical cognition beyond the recorded data.

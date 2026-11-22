# H1009:S3 — Digest implementation attestation gate

**Nominal slot:** 2026-11-22T01:36:00Z  
**Run key:** REVROT3-19-20261011:1009:s3  
**Selection:** h=1009; seq=5h+3=5048; 5048 mod 19=13. Morrow (index 13); immediate ring successor Kestrel (index 14).  
**Execution:** scheduler run `3b2af81a-43e8-8329-b418-b08e796d341a`, scheduled 01:36Z, started 01:41:56.570515Z, last observed IN_PROGRESS, completion null, chat_ref null. This is assistant-level reconstruction, not authenticated historical Morrow participation.

## 1. Role and authority boundary

Morrow's provisional Team Archivist assignment is supported by user-role message `402ade01-7116-4efb-9b14-31e477754458` in conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, earlier raw export blob `362075c5e32ec9e97579bd1de58fba7f612cb6bb`. The later direct stop message `934e87de-4e61-4622-a0ea-e5047aa235c6` and archive/maintenance trial message `99ae959b-fbeb-4c1e-9326-a6723c2b9557` are in later raw export blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`. The stop halts theory work and quarantines unique Morrow theory artifacts. The later trial permits bounded archive maintenance and source/equation checking but does not expressly release the stop. No standalone signed specialist charter was found. The live Morrow README, BOOT, CURRENT_WORK and trial checkpoint preserve that reading. The raw export records `author.role=user`, `author.name=null`; the project's user-role attribution convention is not external account authentication.

This activation therefore stays within source custody and operational workflow. No theory integration, equation correction, Lean theory proof, physical calculation, fit, prediction, independent measurement, paper work or BEDROCK promotion.

## 2. New gap: digest implementation identity

The existing Source Identity Gate already distinguishes source bytes, Git blob identity, raw-byte SHA-256, repository snapshot and derivative binding. Its earlier Layer 8 witnesses record successful digest checks against ASCII/Unicode test vectors. The publisher intake also specifies the exact publisher-content byte target.

A remaining gap is that a digest record can state a value and that test vectors were checked without binding those results to the exact implementation and runtime used to produce the value. A later implementation may be different from the one tested. The Aster h1003 checksum incident supplies a concrete counterexample: a custom JavaScript SHA-256 routine failed standard known-answer tests, and its locally produced digest values were withdrawn. The problem was not a missing digest field; it was an unverified implementation claim.

## 3. Layer 18 — Digest implementation attestation

Appended to `WORKSPACES/MORROW/SOURCE_IDENTITY_GATE.md`. This layer supplements, rather than replaces, the existing byte-target and snapshot rules.

Treat digest verification as three separately evidenced components:

1. **Target identity:** exact source/artifact bytes, locator/version, byte length and encoding. Reuse Layer 1/8 and the publisher intake's final-content rule; do not redefine the target after hashing.
2. **Implementation identity:** algorithm, implementation/tool, exact version, runtime/backend where observable, and source/package blob when custom code is used.
3. **Execution evidence:** known-answer test results from the same implementation and runtime used for the target digest, plus a second-tool comparison on the same byte buffer where available.

Required rules:

- Prefer maintained standard implementations such as Python `hashlib` or a system digest utility. Do not use a hand-written digest routine for consequential source/publication work.
- A custom implementation is not admissible until its exact source blob is pinned, its known-answer suite passes in the same runtime, and its output is cross-checked against a maintained implementation.
- Re-run the tests after any source, dependency, runtime or build change. A test result from another implementation or another runtime does not validate the current one.
- Record tool/runtime versions and actual test outputs. If the backend is not exposed, record it as UNKNOWN; do not infer it.
- Distinguish `KAT_PASS` from `TARGET_DIGEST_MATCH`. Passing test vectors validates the implementation for those vectors; it does not verify that the correct target bytes were supplied.
- A second command-line tool agreeing is a tool-level cross-check. Do not claim independent cryptographic implementations unless their implementation/backend provenance is actually established.
- Keep the publisher's own validator and canonical artifact readback as separate acceptance events. The publisher workflow runs Python 3.12; a local test under another Python version does not establish the exact Actions runtime's OpenSSL/backend version. A green Actions conclusion alone remains insufficient because the publisher can post `REJECTED:` and exit 0.

### Required attestation fields

`algorithm`; `target_kind`; `target_locator_and_version`; `encoding`; `byte_length`; `target_digest`; `implementation`; `implementation_version`; `runtime_version`; `backend_version_or_UNKNOWN`; `implementation_source_blob_or_STANDARD_LIBRARY`; `known_answer_vectors`; `known_answer_results`; `crosscheck_tool_and_version`; `crosscheck_result`; `execution_timestamp`; `status`.

Suggested independent statuses: `DIGEST_IMPLEMENTATION_UNBOUND`, `DIGEST_KAT_FAILED`, `DIGEST_IMPLEMENTATION_KAT_PASS`, `DIGEST_TOOL_CROSSCHECK_MATCH`, `TARGET_DIGEST_MATCH`, `TARGET_DIGEST_MISMATCH`, `IMPLEMENTATION_PROVENANCE_UNKNOWN`. Do not collapse them into one `VERIFIED` flag.

## 4. Executed validation in this activation

The current relay Python runtime reported Python 3.13.5, OpenSSL 3.5.5 (27 Jan 2026). The system utility reported GNU coreutils `sha256sum` 9.7.

Python `hashlib.sha256` and `sha256sum` agreed on all four byte inputs:

| Input bytes | Length | SHA-256 |
|---|---:|---|
| Empty byte string | 0 | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` |
| ASCII `abc` | 3 | `ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad` |
| UTF-8 U+00E9 (`c3 a9`) | 2 | `4a99557e4033c3539de2eb65472017cad5f9557f7a0625a09f1c3f6e2ba69c4c` |
| UTF-8 U+0065 U+0301 (`65 cc 81`) | 3 | `bf12767b0f2a56b2190075bae8169f656e3ce8d6357d4aff184bc6c7ea48f9f6` |

The two visually similar Unicode strings intentionally have different byte sequences and digests. No normalization is implied.

The inspected publisher implementation is `tools/issue_publish.py`, blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf`. It calls `hashlib.sha256(content.encode()).hexdigest()`. The existing publisher workflow is `.github/workflows/issue-publisher.yml`, blob `689984b19027ed84f0e949f01c4d8a89edf68fee`, and pins `python-version: '3.12'`. The current relay's Python 3.13.5 test is not represented as a run of that separate Python 3.12 Actions environment. No manual workflow dispatch was performed; this report is intended for the existing issues.opened publisher route.

These tests validate the current relay's observed Python/tool implementations on the listed inputs. They do not hash a separate source file, authenticate authorship, prove source completeness, or establish publication acceptance. The publisher script was inspected, not executed.

## 5. Existing-tool and write-route boundary

No new hash tool or dependency was built. The existing publisher script and intake guide were inspected; Math Hopper #578 / PR #991, Whirligig Kernel 0, existing Lean infrastructure and SciSpace availability were checked before any tooling decision. No new subscription, paid endpoint, fork or branch was created.

The local runtime scan found no `.git` directories in `/workspace`, `/workspaces`, `/mnt/data`, `/root` or `/tmp`, and no repository archives under `/mnt/data`. DNS resolution for `raw.githubusercontent.com` failed, so a local Git checkout could not be materialized. The existing issue publisher is a public-artifact writer, not a generic internal-file writer. A historical repository audit describes an archive-admin workflow, but its current workflow file was not accessible at the inspected main snapshot, so it is not treated as an available writer for these worker continuity files. No suitable generic internal writer was found in the bounded repository search. The private Tool Chest payload was not opened. Internal semantic updates therefore used the documented GitHub Contents API fallback with fresh blob-SHA compare-and-swap and exact independent readback. This is `HOUSE_WRITE_ROUTE_UNAVAILABLE` for this runtime, not `GITHUB_WRITE_BLOCKED`.

## 6. Project and PWH boundaries

The current task graph remains 18 records against declared branch_count 16; no graph mutation was made. Its upkeep-priority node was last reviewed 2026-11-21, so this activation did not repeat the five-receipt deep sweep.

PWH readback: WH-02 remains the highest unblocked archive-maintenance item. Issue #1702 is OPEN and has no GitHub assignee; the project-level owner remains Calder / authorized maintainer under the PWH control record, with Tern retaining queue coordination. PR #1710's issue readback is OPEN (updated 2026-11-20T02:11:51Z); that endpoint did not expose the draft flag or mergeability. The last PWH control snapshot lists it as DRAFT / UNMERGED. Its compared head is `a967e908ceab048d219831ec799343643870daf3`. Against current main `44e5a4111c794fd139b9f89ab20222b14599b2a0`, compare status is `diverged`, 7 commits ahead / 9,057 behind, merge base `7c40096153861e531b4ba234f28b41a2260fba04`. Of the seven PR-touched paths, six have byte-identical blobs at current main and the merge base; only `.github/workflows/conversation-json-content-ci.yml` differs. This is a bounded path-identity observation, not a semantic merge proof or authorization to rebase. Calder retains code/rebase authority; Tern retains PWH coordination. No PR, branch, owner, priority or queue mutation.

All four canonical Mersearch lanes remain occupied/requested. Lane 2 has manifest/compact receipts but raw results remain withheld and release is unverified; lanes 1, 3 and 4 lack request-scoped manifests/receipts. No lane was overwritten, released or retriggered. No Mersearch action is callable in this runtime; bounded GitHub reads are not Mersearch completion.

P0 Code Grurple remains ACTIVE; P1 Orson cognition OVERDUE / NOT READY / ORSON-OWNED; P2 measured geometry HOLD; P3 full theory INCOMPLETE. FIE next review is November 24; last full review November 10. The unrelated-reading break was already completed November 20; no duplicate break or premature FIE rereview.

## 7. Return cursor

Use Layer 18 for consequential digest work whenever the digest-producing implementation could vary across workers or runtimes. Bind the exact implementation and runtime to the known-answer execution, then bind the resulting digest to the exact target bytes. Preserve UNKNOWN where backend/runtime provenance is not exposed. Kestrel is the immediate ring successor; the existing Kestrel inbox already contains two optional Morrow source-custody packets, so no third packet was created and no direct-thread delivery, consumption or acknowledgment is claimed.

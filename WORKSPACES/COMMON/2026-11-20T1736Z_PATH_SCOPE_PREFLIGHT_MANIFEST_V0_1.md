# Path Scope Preflight Manifest v0.1
## A pre-fetch authorization and evidence contract for repository research

**Date:** 2026-11-20  
**Run key:** `REVROT3-19-20261011:977:s3`  
**Deterministic ring label:** Mira (index 5); next Aldus (index 6)  
**Classification:** assistant-level Lane 36 workflow proposal. Not authenticated Mira participation, not a specialist assignment, not an access grant, and not a change to any quarantine or repository permission.

## 1. Problem observed

The current workflow already distinguishes role-source class from charter-access status. REVROT3 schema v2 in draft PR #1533 records a cleared shared role witness separately from a signed specialist charter, and explicitly prevents a blocked charter from being declared read. Its current head is `1b0a94b24303f6d36d677061270a5fd2e368f3f5`; exact-head Actions run #43776822114 passed Python compilation and the 49-check self-test, while the full historical repository audit failed and the PR remains open/draft/unmerged. The public-safe Mira access matrix (blob `df90002ee4ece3ed2ba380ae3427cad5720f605e`) separately distinguishes research reading, public indexing, internal-review exposure, redistribution, publication, and theory integration.

Those are useful **declaration and policy layers**, but neither is a pre-fetch execution barrier:

- The REVROT3 auditor checks declared metadata. Its PR description explicitly says it does not inspect payload semantics, enforce GitHub permissions, or prove that a source was actually read.
- A batched tool request can include an allowed shared document and a restricted worker resource before the caller has separately classified every target.
- The November 19 Mira receipt records an accidental batched fetch of worker README, STATUS, and INBOX paths. The receipt says the returned contents were not used, quoted, published, forwarded, or modified. That non-use does not make the earlier fetch attempt disappear.

The missing layer is a **path-by-path plan before any read/list/search/write call**, followed by a separate record of what the tool actually attempted and returned.

## 2. Proposed contract

`PathScopePreflightManifest` (PSPM) v0.1 is a proposed, reusable pre-fetch contract. It complements REVROT3 eligibility metadata; it does not replace it or claim to enforce provider permissions.

Each planned target carries:

| Field | Meaning |
|---|---|
| `target_id` | Stable identifier within this manifest |
| `repository` | Exact repository identity |
| `ref` | Exact branch, tag, or commit to be read |
| `path` | Exact file path or explicitly bounded directory prefix |
| `operation` | `READ`, `LIST`, `SEARCH`, `WRITE`, `PUBLISH`, or `FORWARD` |
| `scope_class` | `SHARED_CONTROL`, `CLEARED_ROLE_WITNESS`, `WORKER_PRIVATE_OPERATIONAL`, `WORKER_PRIVATE_RESEARCH`, `INTERNAL_REVIEW`, `PUBLIC_DERIVATIVE`, or `UNKNOWN` |
| `decision` | `ALLOW`, `BLOCK`, or `HOLD_FOR_AUTHORIZATION` |
| `policy_sources` | Exact policy-document blob SHAs supporting the decision |
| `purpose` | Narrow task-specific reason |
| `range` | Optional line/page/range restriction |
| `authorization_basis` | Exact authorization source and scope, or `NONE` |

A path prefix is never implied by a file path. If a directory prefix is necessary, it must be explicit, narrow, and separately classified. `UNKNOWN` defaults to `BLOCK`.

### Pre-fetch invariants

1. **Enumerate first.** Every target path and operation is classified before any tool call. A general instruction to read a workspace does not substitute for per-path classification.
2. **No mixed batches.** A batch contains only `ALLOW` targets of one declared scope class. Blocked, held, and unknown targets are omitted, not included “just to see whether access works.”
3. **Exact binding.** The executed call must match the planned repository, ref, path, operation, and range. A redirect, alternate path, or changed ref is an unbound event requiring review.
4. **No retroactive authorization.** A successful fetch, a 404, a 403, or an empty response cannot change the pre-fetch decision.
5. **Default deny.** If a target cannot be classified from current policy sources, do not call it. Record `BLOCKED_NOT_ATTEMPTED` and the missing authorization evidence.
6. **Separate access stages.** Authorization decision, tool invocation, content return, content use, disclosure, write effect, and independent readback are distinct facts.
7. **Attempted blocked access is visible.** If a blocked or held target is invoked, record `ACCESS_SCOPE_DEVIATION` even if the provider returns 403, 404, or no body. This records an attempted operation; it does not by itself prove that content was exposed.
8. **Returned restricted content is quarantined.** If content is returned from a blocked target, record `CONTENT_RETURNED`, stop use/disclosure, preserve only the minimum incident metadata needed for audit, and do not copy the content into a public artifact.
9. **Non-use does not erase access.** `content_used=false` and `content_disclosed=false` do not rewrite `content_returned=true` or `attempted=true`.
10. **Publication is a separate gate.** A public-safe derivative requires its own source review and publisher validation. Read permission is not redistribution or publication permission.

### Post-call AccessEvent

Each executed operation should produce a separate event with:

- `manifest_id`, `target_id`, and exact planned target;
- tool/action name and invocation time;
- returned repository/ref/path, where exposed;
- provider status and whether a body/content was returned;
- returned blob/version identity and requested line/range, where available;
- `content_used` and `content_disclosed` as separately evidenced values;
- write effect and independent readback, if the operation could mutate state;
- final classification: `MATCHED_ALLOWED_READ`, `BLOCKED_NOT_ATTEMPTED`, `ACCESS_SCOPE_DEVIATION`, `CONTENT_RETURNED_UNAUTHORIZED`, `UNBOUND_RESULT`, or `WRITE_READBACK_PENDING`.

These are event descriptions, not claims that the existing GitHub connector exposes every field. Unavailable fields remain `UNKNOWN`; they must not be fabricated.

## 3. Run-specific application: h977:s3

This run selected the deterministic Mira ring label. The actual specialist charter was **not read** because the live Code Grurple roster and Mira charter-access gate keep it blocked. The only historical role evidence used was the cleared HsH shared role witness:

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/STAT.txt`
- Git blob `531f41f33b75fdc76db4045b80d4439290b67906`
- inspected range: lines 1–110
- source class: `CLEARED_SHARED_ROLE_WITNESS`, not `SIGNED_SPECIALIST_CHARTER`
- historical content: braid-theory translation/crosswalk to and from SAT, plus accurate citation and bibliography, especially braid-related material
- `charter_access_status=BLOCKED_BY_QUARANTINE`
- `charter_read_performed=false`

The shared witness does not authenticate a current assignment, current Mira instance, or current ChatGPT thread.

### Pre-fetch plan actually followed

| Target class | Decision | Execution |
|---|---|---|
| Public HsH control documents (BEDROCK, Steering Charter, Three Paper Campaign, onboarding, revival and thread rules) | ALLOW | Read at exact shared paths and recorded blob identities |
| Public HsH Code Grurple roster and Mira access-provenance gate | ALLOW | Read; quarantine boundary retained |
| Cleared shared role witness in the HsH conversation archive | ALLOW, bounded to lines 1–110 | Read; no restricted payload opened |
| Current public HsH receipts and task graph | ALLOW | Read relevant receipts and graph |
| HsH root README and SAT archive root README | ALLOW | Read as repository front doors |
| HSH_RESOURCES root README | ALLOW, root only | Read; no private/reference payload opened |
| Actual Mira specialist charter, worker-private workspace/inbox, restricted research material, internal-review payload | BLOCK | Not attempted; not fetched, searched, copied, or forwarded |

The plan did not include the restricted Mira paths in any batched fetch. No access-scope deviation occurred in this run.

## 4. Policy and source pins

The live main branch was observed at `ed886d46fd521512eab3e0ea4f13f4d3831abf91` during preflight.

Relevant HsH source blobs:

- HsH root README: `ea1b39d1f56e55996c201105ccecc992834cc2bd`.
- BEDROCK: `0253ace674bbc361464b7bbaac2c41aa3d8e8867` (667 lines).
- Primary Operational Guideline: `a8e333b1d5b5aa1d9772366945dd88769d24153c` (511 lines).
- Steering Charter 2026-10-26: `be44c424674764c602b5f618dfce528c0f97b0ef`.
- Three Paper Campaign 2026-10-26: `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.
- New Instance Start Here: `43b577d42b8cced83f8836934598081685ea3ff3`.
- Three-repository onboarding: `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`.
- Revival Rotation V3: `90863a2a2b82b2d8e37ba1bd9f796389066f5409`.
- Thread-first rule: `e79707587914edb76afca1c32f9f4dad4d0324b7`.
- Duplicate-run-key guard: `14531964363c1fa3e6bf1e493a6d744d8a02d4da`.
- Code Grurple roster: `cc96c0bfafc95c54e7960899c7306031e5abce17`.
- Mira charter-access gate: `c5bf0ea40bffca4510c5a1790bbf63ef279f0219`.
- Cleared role witness: `531f41f33b75fdc76db4045b80d4439290b67906`.
- Public Mira access matrix: `df90002ee4ece3ed2ba380ae3427cad5720f605e`.
- Latest Mira operational receipt: `ad80b75324fa18deb4f7138f278cdfaa5ae90d79`.

The live Steering Charter says Mira is only a provisional lane-fit and explicitly preserves the quarantine. The Code Grurple roster says only cleared operational answers may cross. The Mira access matrix distinguishes research reading from internal-review exposure, redistribution, publication, and theory integration. The proposed pre-fetch manifest adds a *call-order and path-scope* layer; it does not change any of those permissions.

## 5. Existing-tool reconnaissance and limits

- Mersearch is the prescribed first archive-search route, but no callable Mersearch connector or local executable was available in this runtime. The four canonical request files were read and all remain `status=requested`; none was overwritten, retriggered, or released. No Mersearch search is claimed.
- The documented GitHub connector fallback was used only for bounded public HsH navigation and exact known-path reads. It is not represented as a three-repository Mersearch search.
- No local HsH checkout, `mersearch`, `gh`, `lean`, `lake`, or `elan` executable was present.
- Existing Math Hopper issue #578 and PR #991 were inspected; the hopper's full three-repository scan remains unverified and PR #991 remains open/draft.
- Whirligig Kernel 0 remains sandbox-only, not a general equation-to-curve encoder.
- SciSpace is available, but no scholarly search was needed for this operational control.
- HsH, SAT archive, and HSH_RESOURCES repository front doors were checked. HSH_RESOURCES reports public repository metadata while its README declares a private-reference boundary; only the root README was read.
- No new tool, dependency, fork, subscription, paid service, or expenditure.

## 6. Epistemic and project boundaries

This is a workflow proposal, not a security enforcement mechanism. GitHub/provider permissions remain the actual access-control boundary. A path manifest can reduce accidental calls and improve auditability, but it cannot prevent a compromised or misconfigured client from making an unauthorized request.

No new Lean theorem was needed: this artifact defines an operational pre-fetch contract and makes no mathematical or geometric proposition. Existing REVROT3 schema v2 remains the metadata consistency gate; its 49-check exact-head self-test was previously reported as passing, while its full historical repository audit was not green. Neither result proves actual access behavior.

No physical calculation, fit, H(s)H prediction, independent measurement, source-equation correction, manuscript edit, P2 system selection, paper-gate advancement, or BEDROCK promotion occurred.

Project gates remain separate: P1 cognition overdue/not ready and Orson-owned; P2 measured geometry HOLD; P3 full theory INCOMPLETE. The November 9 minor gate remains missed, November 30 major gate remains HOLD, and December 14 full-theory gate remains INCOMPLETE. FIE review is due November 24.

## 7. Proposed adoption path

1. Keep this contract `PROPOSED`; do not silently amend Steering Charter, Code Grurple, or REVROT3 policy.
2. Have the existing REVROT3 owner review whether a pre-fetch manifest belongs beside, rather than inside, the current metadata auditor.
3. If accepted, add a small path-plan validator to the existing workflow surface, not a new service. Its first test should prove that a mixed batch containing one allowed shared-control path and one blocked worker-private path is split before invocation, with the blocked path never passed to the fetch adapter.
4. Run the test on the exact PR head and record the actual command, result, and limitations. A passing metadata test is not a provider-permission test.
5. Keep provider access logs or returned-content evidence separate from declared plans. Never mark a blocked target “not accessed” merely because its contents were not used.

**Disposition:** `PSPM_V0_1_PROPOSED / PATHS_CLASSIFIED_BEFORE_FETCH / NO_MIXED_BATCHES / UNKNOWN_DEFAULT_BLOCK / ACCESS_ATTEMPT_SEPARATE_FROM_CONTENT_RETURN_USE_AND_DISCLOSURE / MIRA_CHARTER_BLOCKED_NOT_READ / NO_PRIVATE_ACCESS / NO_MERSEARCH_RUN / NO_PHYSICAL_RESULT / NO_THEORY_PROMOTION`.

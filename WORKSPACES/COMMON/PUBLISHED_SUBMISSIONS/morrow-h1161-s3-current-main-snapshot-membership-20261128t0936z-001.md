# Morrow h1161:s3 — current-main snapshot membership witness for the historical raw export

**Nominal slot:** 2026-11-28T09:36:00Z  
**Run key:** `REVROT3-19-20261011:1161:s3`  
**Disposition:** `SNAPSHOT_MEMBERSHIP_VERIFIED / RAW_BLOB_REPARSED / SOURCE_CUSTODY_ONLY / THEORY_STOP_PRESERVED`

This is assistant-level, source-grounded execution under the deterministic Morrow routing label. It is not an authenticated historical Morrow instance or live thread. No direct-thread delivery, cross-thread acknowledgment, or ownership transfer is claimed.

## 1. Authority and scope

The historical raw export contains three direct user-role messages on the exported current ancestry:

- `402ade01-7116-4efb-9b14-31e477754458`: Team Archivist / broad archive-appraisal remit.
- `934e87de-4e61-4622-a0ea-e5047aa235c6`: explicit theory stop and quarantine instruction.
- `99ae959b-fbeb-4c1e-9326-a6723c2b9557`: later trial invitation for archive maintenance, provenance, chronology, source comparison, theory-material reading/note-taking, and bounded mathematical/equation checking.

The later trial does not expressly revoke the theory stop. No standalone signed Morrow charter was found. Permitted work here is source custody only: no theory integration, equation correction, physical prediction, Lean theory proof, paper work, or BEDROCK promotion.

## 2. Composite source identity

A raw source locator must bind separate identities:

`(repository, commit SHA, tree SHA, exact path codepoints, blob SHA, byte size)`

Retrieval-channel status and authorship evidence are separate fields. A branch name alone is not an immutable snapshot; a path alone does not identify content; a blob alone does not establish where that content occurs in a particular repository snapshot.

### Current-main snapshot witness

- Repository: `Satobloc/HsH`.
- Observed main commit: `3953e9a52481a1e5499e957afe798580ea437797`.
- Commit parent: `e67494e9cc2d0001ad10e46e3d1c132a521ca3a2`.
- Commit date: 2026-11-28T09:33:33Z.
- Commit message: automatic public-display docket and square-artwork refresh.
- Commit verification: unsigned; the GitHub Actions bot commit is repository snapshot metadata, not source authorship.
- Root tree: `4994afdb8f05ac69389fba06db0f6d68a9602615`.

A non-recursive tree walk found the exact entry through three complete, non-truncated trees:

| Tree | SHA | Entries | Truncated |
|---|---|---:|---|
| Repository root | `4994afdb8f05ac69389fba06db0f6d68a9602615` | 154 | false |
| `DEVELOPMENT_FULL_CONVOS` | `6daff191bed5c1a35549c706e729ac687cec589e` | 123 | false |
| `SAT_CONVOS_18` | `b3bc3b73d90a60dbc857281ff4ca0a6c3bab8653` | 22 | false |

Exact path:

`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.07•26.09.13•🧗_♂️ MORROW ALDUS [Reconstruct H(s)H Synthesis] — raw.json`

The path uses `U+1F9D7 U+005F U+2642 U+FE0F` for the climber/underscore/male-sign/variation-selector sequence. It is not the visually similar `U+1F9D7 U+200D U+2642 U+FE0F` ZWJ variant.

The exact tree entry is a blob with SHA `ee394b446b2e36d35fd1e5ecd004685c0422457b`, size `3,017,953` bytes. This matches the blob pinned in Layer 21. The path and blob are therefore verified as members of the observed 2026-11-28 main snapshot.

### Raw-blob readback

Fetching the blob by its exact SHA succeeded. JSON parsing returned:

- Conversation ID `6a9ee7ca-d340-83ea-b99d-6a3097429f36`.
- 697 mapping entries.
- 696 message-bearing nodes.
- 697 nodes on the exported current ancestry.
- All three direct user-role records listed above are on that ancestry.
- Each has `author.name = null`; the role/ancestry evidence supports source attribution within the export but does not externally authenticate the human account.

No raw message text is republished here. The 3,017,953-byte Git object was not rehashed to SHA-256 in this pass; its Git blob SHA-1 is the verified object identifier. No new raw-source version was found. This is a later repository-snapshot membership witness for the same blob, not an independent conversation witness or new source version.

## 3. P0 and shared-state boundary

Discovery run [#46130857204](https://github.com/Satobloc/HsH/actions/runs/46130857204) completed SUCCESS on event head `dee413ae17c670aba2aa743d3b1cf26655bf1873` and generated commit `3953e9a52481a1e5499e957afe798580ea437797`.

Navigation run [#46130857199](https://github.com/Satobloc/HsH/actions/runs/46130857199) remained PENDING with no jobs at readback. The P0 disposition remains: source-level presentation safety FAIL; Paper A/B live routes NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED.

All four Mersearch request lanes remain occupied. No query, retry, overwrite, release, or retrigger was made. No private `HSH_RESOURCES` payload was opened.

Morrow `CURRENT_WORK`, `BOOT`, and `TRIAL_CHECKPOINT` pointers remain stale (latest recorded execution h1138, with BOOT's top pointer older). The active P0 interlock prohibits worker-local checkpoint/INBOX writes; they were left unchanged. The append-only Source Identity Gate is the appropriate source-custody ledger.

No PWH queue, task graph, worker INBOX/checkpoint, scheduler, or task state was changed.

## 4. Return cursor

Keep Layer 21's exact Unicode path correction. Reuse the composite locator above for later snapshot checks. Do not repeat this tree walk unless a new main snapshot, path variant, or blob version gives a specific reason.

No physical calculation, fit, prediction, uncertainty propagation, Lean theory proof, equation correction, manuscript work, theory integration, or BEDROCK promotion occurred.

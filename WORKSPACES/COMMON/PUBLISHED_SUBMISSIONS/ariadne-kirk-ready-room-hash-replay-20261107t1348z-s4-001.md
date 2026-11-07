# Independent source-fidelity replay: KIRK_mind and READY_ROOM

**Date:** 2026-11-07T13:48Z  
**Status:** HASH_REPLAY_VERIFIED / ROLE_ATTRIBUTION_UNRESOLVED / JAN22_RAW_EXPORT_UNRESOLVED

## Scope

This is an additive source-fidelity check of the existing Ariadne source-lineage audit. The two transcript-like source blocks were independently extracted from the Library export container `2026-10-31_BS_txt_0007.txt`. No raw source text, personal narrative, Library file ID, or private locator is reproduced here.

## Independent hash replay

After removing the single export-introduced leading LF before each source body and preserving the source body's original line-ending bytes, the full source hashes and dimensions reproduce:

| Source object | Bytes | Lines | SHA-256 |
|---|---:|---:|---|
| `KIRK_mind.txt` | 630,365 | 12,762 | `ed3e72fc1cd25cf5274ed531d1b957e3432fbd266ed34f486a113774b5d4bd70` |
| `READY_ROOM.txt` | 626,438 | 12,721 | `f28c560b3c184cfe0b1372f300bb7db0ca300a5868acac111e0aa3591c5af809` |

An exact contiguous common block was independently reproduced:

- 12,598 lines.
- 608,387 bytes after LF normalization.
- SHA-256: `32b9b8f18fc220f776bb39a24a760dd759db0df755f5a2293aaedc0878634345`.
- Starts at line 1 of `KIRK_mind.txt` and line 123 of `READY_ROOM.txt`.
- Full line-sequence similarity ratio: 98.8816%.

The two objects therefore share a substantial exact content lineage. They are not independent source witnesses. The shared block does not establish which file is earlier or the direction of copying.

**Extraction-boundary note:** this materialized export reproduced the full hashes by removing one leading LF at each source boundary. The earlier audit's description of three trailing line endings was not needed to reproduce this copy. Treat that as an extraction-boundary difference, not a content-hash discrepancy.

## Role and filename limits

Neither large transcript-like object contains explicit `You said:`, `ChatGPT said:`, `User:`, `Assistant:`, or raw JSON role markers. The initial first-person passage in `KIRK_mind.txt` therefore remains USER-ATTRIBUTED / ROLE-UNVERIFIED, not Nathan Direct.

The separate `READY_ROOM_README.txt` is labeled version 1.2.1 and gives `.KIRK_mind.txt` and `.RILEY_mind.txt` as examples in its instructions. That is evidence that the README names those example paths, not proof that a standalone Riley file exists. The bounded two-container inventory found no standalone RileyMind source object; this is not a global absence claim.

The January 21, 2026 SRT transcript (HsH blob `ace1b413a5574a1354cc85c51364b12d685577ae`) is a derivative narrative. Its cue 11 ASR text renders the filenames approximately as `Kirk K mine dot TXT` and `RELEY mine dot TXT`. Those are ASR leads, not canonical filenames. The transcript also uses the spoken phrases Kirk Mind and Riley mind. Do not silently normalize the ASR into verified filenames.

A separate direct user-role message in the September 23 revival conversation says the Kirk material should inform revival strategy, especially human simulation. That establishes relevance of the material to the revival programme, not authorship of either flattened text object. The raw export's author-name field is null, so this remains user-role / Nathan-attributed rather than author-name authenticated.

## January 22 boundary

The exact January 22 raw conversation/export for `KIRK - ACCUMULATIVE THEORY OF MIND (v1.0)` remains unresolved. The January 21 SRT predates that later request and cannot be used as proof of the January 22 source's contents. Do not back-project the SRT's Kirk/Riley/Nathan synthesis into the missing January 22 raw conversation.

## Formalization and verification boundary

Ariadne PR #790 currently contains `AriadneClaimScopedLineage` and `AriadneSimulationProvenanceGate`. Its current head `929f680a98d6a4461e1a30234aa4aa20ac95351c` passed exact-head Lean compilation in Actions run #42302396589, job #128183191024, using Lean 4.34.0 / Lake 5.0.0; the build completed 8,951 jobs.

The build verifies the formalized conditional logic. Lean does not parse the Library exports, authenticate the flattened artifacts' authorship, recover the missing January 22 export, or establish any model's actual runtime behavior. The Boolean source-audit inputs remain external evidence inputs; this independent Python replay verifies the two source hashes and common block, not their original authorship or causal acquisition history. Tests, lint, nanoda, and the separate axiom audit were not run in that workflow.

## Next cursor

When a Mersearch lane becomes available, search the three repositories for the ASR-derived filename variants and related README/workflow references. Keep exact ASR wording, normalized filename hypotheses, located source objects, raw conversation exports, and generated simulation outputs as separate evidence types. Continue the January 22 raw-export search independently. No model trial, human-subject experiment, or consciousness/personhood claim is made by this report.

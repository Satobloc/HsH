# Ariadne :36 | Artifact-type and capture-stratigraphy correction

**Run key:** `REVROT3-19-20261011:513:s3`  
**Selected identity:** Ariadne (ring index 3)  
**Next ring identity:** Alberr (index 4)  
**Status:** SOURCE-GENEALOGY CORRECTION VERIFIED / LEAN MODULE COMMITTED / CI PENDING

## 1. Historical remit and source boundary

The original Ariadne conversation export was recovered from Library. Its outer user-role messages support archive-wide inspection/reproduction under existing workflow, privacy, quarantine, and source-status controls; they explicitly preserve Tern's control of scheduled tasks. The concise Ariadne role description remains an assistant-authored operational synthesis, not a verbatim user-authored charter.

A separate raw conversation export contains the user-role instruction that Kirk material informs revival strategy, including human simulation. Its `author.name` field is null. Preserve `user-role / Nathan-attributed`; do not claim independent author-name authentication.

## 2. Capture-title correction

The raw Library capture's top-level conversation title is **MARLOWE**. The HsH repository filename/path label is **Revival Rotation**. These are not interchangeable fields.

The Library capture and the HsH repository blob share a conversation identity but are distinct serialized captures; byte identity is not established. The previous Ariadne README incorrectly treated the archive filename as the conversation title. A direct README correction attempt was blocked by repository safety checks; the README was not changed.

No raw conversation text, private file ID, or Library-only digest is reproduced in this public-safe report.

## 3. Ariadne capture chronology

The later Library capture of the ARIADNE conversation has 1,364 mapping nodes: 1,363 message objects plus one empty root sentinel. Its active parent chain reaches an assistant tool-call node at 2026-09-23T05:35:00.798540Z.

Two user turns follow an earlier maximum-length warning: one reports that the warning did not recur; the next directs continuation. Therefore `CONFIRMED_LIMIT` is not supported. The corrected status is:

`LIMIT_WARNING_OCCURRED / WARNING_NOT_REPEATED / TERMINAL_EXHAUSTION_UNCONFIRMED`.

The current live usability of the historical ARIADNE conversation remains unverified. The current Workshop Relay execution is separate; no cross-thread delivery or historical-thread continuation is claimed.

## 4. Kirk / Ready Room source stratigraphy

The recovered Library source bundle contains named sections `KIRK_mind.txt`, `READY_ROOM.txt`, `READY_ROOM_README.txt`, and a separate `THE_WHOLE_READY.txt` composite.

The KIRK and READY_ROOM sections share one exact LF-normalized block of 12,598 lines (98.8816% sequence similarity). The common block is KIRK lines 1–12,598 and READY_ROOM lines 123–12,720. Their unique spans differ. The filenames do not make them independent witnesses, nor do they authenticate role, author, acquisition direction, or chronology.

The KIRK section begins with mixed dialogue-like material about character-modeling methodology; it is not a role-tagged raw conversation export. The READY_ROOM section has a separate 122-line unique opening before the common block. Neither file name alone establishes a standalone “mind profile.”

The standalone README is labelled v1.2.1. A v1.3 guide appears inside a composite document, not as a separately hash-identified standalone file. No authenticated supersession/adoption record was recovered. A higher version number alone does not establish canonical authority.

## 5. Architecture improvement: typed artifact and claim eligibility

The existing PR #790 was extended with:

`FORMAL_VERIFICATION/HsHVerification/AriadneArtifactTypeGate.lean`

The new contract separates:

- artifact kind;
- metadata title;
- archive path label;
- raw outer role metadata;
- explicit speaker labels;
- conversation and message identity;
- timestamp metadata;
- authenticated author identity;
- content/section digest evidence;
- explicit version supersession.

The eligibility rules now prevent:
- a filename or archive path from determining conversation title or artifact kind;
- a mixed transcript without outer role metadata from supporting role attribution;
- a user-role field with `author.name=null` from being promoted to authenticated author identity;
- a version label alone from establishing canonical supersession.

The Library-source properties and classifications are external audit inputs. Lean checks only the conditional rules; it does not parse source files, verify source hashes, authenticate authorship, or establish historical truth.

## 6. Formal verification state

The new module and root aggregator import were committed to the existing PR #790 branch:

- Branch: `research/ariadne-primary-role-transclusion-20261027t1924z`
- New module commit: `0c1e94575dbf40a4fe7a15c875674468858330c9`
- Root aggregator commit: `75cf70aab083c1224953c913739bb70321bdfc13`
- Latest observed PR head at report creation: `0c1e94575dbf40a4fe7a15c875674468858330c9` (pending live readback)

The module includes actual `#eval` checks and theorem-specific `#print axioms`. No local Lean executable is installed in this runtime. GitHub Actions status for the updated head was not yet visible at the last check. Therefore:

`LEAN_NOT_YET_VERIFIED / CI_PENDING`.

Do not infer proof success from the commit or prior PR #790 build.

## 7. Protected boundaries

- Orson retains P1 cognition ownership; no LLM cognition experiment or human-subject study was conducted.
- No physical calculation, fit, prediction, or measurement.
- No BEDROCK or theory promotion.
- No SAT-O/Blockwave equation changes.
- No manuscript or paper-gate advancement.
- No new Mersearch request; existing completed source-lineage work was reused and all four lanes remain occupied.
- No new tool, dependency, branch, PR, task, or automation.
- No cross-thread message or recipient acknowledgment is claimed.

## 8. Next cursor

1. Inspect the Actions run for the updated PR #790 head and verify exact checkout SHA, full Lean build, `#eval` output, theorem-specific axioms, and `sorryAx`/admit status.
2. Keep the MARLOWE metadata title separate from the HsH archive path label in all future citations.
3. Continue the January 22 Kirk raw-export search only after the completed Mersearch receipt is checked for coverage; the exact conversation identity remains unresolved.
4. Preserve the current historical ARIADNE thread as the preferred existing conversation; do not create or claim a successor unless a real exhaustion or other permitted trigger is verified.

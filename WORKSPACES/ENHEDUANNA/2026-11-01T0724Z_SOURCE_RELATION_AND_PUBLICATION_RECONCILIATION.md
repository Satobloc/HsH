# Enheduanna source-relation and publication reconciliation

**Run:** 2026-11-01T07:24Z  
**Rotation:** h=511; s2; seq=2557; selected index 11 = Enheduanna; next index 12 = Tern Rook.  
**Participation:** `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`; historical Enheduanna thread/instance not authenticated.  
**Status:** SOURCE RELATION CORRECTION PUBLISHED TO EXISTING ISSUE / PRIOR O=N 4179 CROSSWALK VERIFIED / BLACK ORIGINAL READ / O-LAYOUT LEAN MODULE STILL UNCOMPILED / NO THEORY PROMOTION.

## 1. Identity and role boundary

The 2026-10-12 `SOURCE_LAYER_CENSUS_AND_EXPOSURE_BOUNDARY.md` was read (blob `8d6b08dac9e169f529f1b43cbd8c3cbf0cc78478`). It explicitly says it is a bounded assistant-authored reconstruction, not an original Enheduanna check-in, not historical-person emulation, not theory authority, and not evidence of identity transfer or conversation continuity.

No standalone historical Enheduanna specialist charter, original worker-authored check-in, or usable historical Enheduanna ChatGPT conversation was recovered. The census is the current source/exposure boundary, not a historical charter. No first-blush was attributed to the historical worker. This run is source-grounded reconstruction only.

## 2. Control preflight

Read live BEDROCK in full (568 lines; blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`), Steering Charter 2026-10-26 (blob `5f4263381afcb065e9062d5b5885593d0baa58db`), Three Paper Campaign (blob `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`), New Instance Start Here (blob `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`), Revival Rotation V3 (blob `90863a2a2b82b2d8e37ba1bd9f796389066f5409`), recipient-thread routing (blob `d9ea7c3a04e03822c65ee231d0b9545bf37907bd`), V4 not-found revival (blob `6761337dfcd0847226ee7baad84db0a9c496760a`), Mersearch worker guide (blob `086778737a004c467b0b52142d71aa5b961fc166`), and the universal shape-to-Lean / original-statement-first directives.

Main HEAD at inspection: `584453fa5f0845df6fd808a8bfd9d85c39fb5fd6`.

Existing PR #890 remains OPEN / DRAFT / UNMERGED. Branch `research/enheduanna-third-physical-witness-du8-20261028t1212z` is 64 commits ahead and 5,835 behind main. No branch, PR, task, or schedule was changed.

## 3. Primary-source reread and source-typed correction

This run directly retrieved and read Jeremy A. Black, “En-hedu-ana not the composer of The temple hymns,” N.A.B.U. 2002 no. 1 (March), note 4, pp. 2–4. The shorthand “N.A.B.U. 2002/4” denotes note 4, not issue 4. Black's p. 2 says O's hymn line-count is not preserved. His p. 4 prints O, reverse column ii', lines 16–22: Nisaba praise at 18, the Enheduana attribution at 19, and damaged continuation at 20–22. Black's p. 2 citation “TCS 1” is a probable bibliographic miscitation; the 1969 edition is TCS III.

I also read Sophus Helle, *The First Authors* (2020), Appendix 3.1, pp. 326–328, and Szilvia Sövegjártó, “Originators in the Old Babylonian Sumerian Literary Tradition,” *Hungarian Assyriological Review* 3 (2022), p. 39 n. 61.

The source relations must be typed more narrowly than the previous public report's phrase “source-dependent on Black”:

- Sövegjártó 2022 **REPORTS** the 3/1 body/subscript aggregate.
- Sövegjártó 2022 **CITES** Black 2002, p. 3 (“On this issue see Black 2002, 3”).
- The footnote does not name the one subscript witness or state that its aggregate was derived from Black.
- The citation alone does not establish a **DEPENDS_ON** edge; it also does not prove an independent second collation.

The public record was corrected accordingly in issue #1192, comment #6554946743. Exact comment readback was verified. No new issue or duplicate submission was created.

### Keep three documentary variables separate

1. **Body/subscript classification:** Sövegjártó's 3/1 report.
2. **Count position:** Helle reports A and Q before the count, B after it, and O unresolved because its count is missing.
3. **Ruling status:** Helle reports Q bracketed by rulings above and below; the other manuscripts, including O, have no such ruling reported.

These are related evidence fields, not interchangeable labels. Helle separately argues that even if the attribution is physically part of the final hymn, its semantic scope could still be the entire collection; the use of `dub` for a subsection needs supporting parallels.

### Reproducible finite checks

Python exhaustive enumeration of Helle's count-position data (A=before, Q=before, B=after, O=unknown) gives exactly two completions:

- O before count → 3 before / 1 after.
- O after count → 2 before / 2 after.

This is a count-position completion, not a derivation of the separate body/subscript classification.

A second finite model check constructs two interpretations with identical encoded O-layout fields but different semantic scopes (final hymn only versus whole collection). It returns: same layout = true; different scope = true; a single deterministic layout-only decoder satisfying both = false. This is a finite model check, not a Lean proof, historical collation, or decision about the actual scope.

## 4. O = N 4179 crosswalk: prior publication verified, not repeated

The object crosswalk already exists in published issue #1086 and was independently rechecked:

- Sarah Glaz 2020, Figure 2 caption: Tablet O = N 4179, TCS III Plate XXXI, copied by E. Bergmann S.J.
- CDLI P279044 / Literary 000750 / example 027: museum number N 4179, Penn Museum, Temple Hymns witness, TCS 3 reference p. 15.
- CDLI's Witness field is blank and its separate Accession Number field is blank. N 4179 is the museum number, not a separately supplied accession number.

Issue #1086's payload content equals the published artifact byte-for-byte. Its publisher comment records SHA-256 `02b2e4bd681520c6d5bce37911f739aee4ecd02b48d468bc6469dd70a6f80cf1` and readback verification.

Limits: the original 1969 TCS III volume/Plate XXXI was not directly inspected. The Glaz figure caption was text-read, but the PDF screenshot timed out. The CDLI image endpoint rejected the 12.4 MB image as too large for this route, and the Penn Museum object page returned 403. No direct clay collation, break-edge inspection, or ruling trace is claimed.

## 5. Lean status: source module exists but remains uncompiled

The source-conditional module `EnheduannaOLayoutScopeSeparation.lean` exists on PR #890 (blob `850851f8ee5f3372d4392775375f943f84d8a88c`). The branch's `FORMAL_VERIFICATION/HsHVerification.lean` import list does **not** import it. Therefore the successful Actions run #41012299180 (8,952 build jobs) did not compile this module; the issue #1086 verification comment explicitly confirms the module and its theorem reports are absent from that build log.

The module's proposed theorem is a conditional non-identifiability result about the encoded layout model. It remains `LEAN_NOT_RUN / UNCOMPILED`. No Lean proof is claimed. The prior imported placement modules compiled on the recorded merge-reference build; that does not transfer compilation status to this unimported module. No local Lean run, new module, root-import edit, or CI run was attempted in this turn.

## 6. Mersearch and tool state

The completed Enheduanna request `enheduanna-temple-hymns-nathan-source-20261030-1340` has a verified request-scoped manifest and compact receipt: three permitted repositories checked out; 15,618 files and 20,810,723 records scanned; 27 hits; 18 distinct sources; 25 hits in HsH and 2 in HSH_RESOURCES. Post-containment raw results were withheld, so the compact receipt is not an exhaustive hit listing.

At this inspection all four shared bridge lanes were occupied or unreconciled: shared lane 1 Calder, lane 2 optics, lane 3 Aster staged but explicitly NOT_DISPATCHED because the shared request slot is Calder, lane 4 Tern. No new Mersearch request was submitted and no lane was overwritten. The Aster :36 result independently records the bridge dispatch limitation.

## 7. Publication, controls, and next cursor

- Existing issue #1086: publication and exact artifact readback verified.
- Existing issue #1192: payload equals published artifact; publisher comment and readback verified.
- New additive source-relation correction: issue #1192 comment #6554946743; exact readback verified.
- No duplicate issue, new PR, branch, or theory artifact.
- No physical calculation, CODATA comparison, fit, prediction, or measurement.
- No BEDROCK promotion or paper-gate advancement.
- Code Grurple remains ACTIVE; P1 November 9, P2 November 30, P3 December 14 unchanged.
- FIE rereview not due; last full review October 27.
- Unrelated-reading cursor remains Jacoby, *Practical Talks by an Astronomer*, lines 473–512; next cursor 513. No redundant break was repeated.

The existing :24 lease remains enabled with its original identity, hourly phase and schedule unchanged; no sixth task. The :12 lease was observed disabled and was left untouched. The :36 lease remains enabled and unchanged.

**Next identity:** Tern Rook, run key `REVROT3-19-20261011:511:s3`, nominal 2026-11-01T07:36Z. A separate recipient-addressed optional context packet records the scheduler/source status; it does not assign a task or claim ChatGPT-thread delivery.

**Final classification:** SOURCE_RELATION_REFINED / ORIGINAL_BLACK_READ / O_N4179_PRIOR_PUBLICATION_VERIFIED / PYTHON_FINITE_CHECKS_PASS / O_LAYOUT_LEAN_MODULE_UNCOMPILED / NO_PHYSICAL_OR_THEORY_PROMOTION.

# Meridian P3 primary-target spot-check — 2026-09-23

**Task/branch:** `CODE-GRURPLE-20260922 / GRURPLE-A`
**Worker:** Meridian
**Bounded operation:** direct-primary verification of P3, the 28 Dec 2025 public archive-release proposition targeted by the frozen A2/A5 citation patch.
**Disposition:** `PASS / FEED_FORWARD`

## Primary target checked

Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`

Path: `__SAT_Public_Record_Transcripts/Debating A.I. On Science - Theoretical Physics Archive Release.txt`

Direct inspection confirms:

1. The surviving transcript header says `Published: December 28, 2025 at 11:34 AM`.
2. The opening identifies the subject as a `live, very public, working archive` of Scalar Angular Torsion.
3. It then says `It really is the repository. It's all public on GitHub.`
4. The automated transcript visibly garbles the repository proper name, so the repository identity should come from the archive/path metadata rather than quoting the ASR rendering of that name.

## Claim boundary

The direct primary target supports the narrow proposition used by the R1 citation patch: on 28 Dec 2025 a public-facing archive-release record presented the SAT repository as a public working GitHub archive.

It does **not** by itself establish repository creation on that date, completeness of the then-current tree relative to later states, the first-ever public availability of any SAT material, or scientific validity of archive contents. Those exclusions remain necessary.

## Patch disposition

The frozen `R1_A2_A5_CITATION_PATCH_2026-09-23.diff` reference [11] is source-aligned at the proposition level. P3 therefore joins P1 and P2 as direct-primary spot-checked.

Nathan Words feed disposition: `NOT RELEVANT` — this is public-record chronology/provenance verification, not intended-object semantics or terminology reconstruction.

## Next cursor / handoff

P1–P3 have now received direct-primary checks. Apply the already-frozen A2/A5 citation patch to `DRAFT_R1.tex`, then rerun only A2/A5 against the resulting exact manuscript blob. If clean, freeze that exact R1 blob for the next Grurple review/staging gate. No new provenance excavation is needed for these three targets unless a contradiction appears.
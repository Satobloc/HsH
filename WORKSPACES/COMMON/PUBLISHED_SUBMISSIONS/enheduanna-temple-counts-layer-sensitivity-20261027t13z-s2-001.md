# Enheduanna :24 | Temple Hymns numerical-pattern layer sensitivity | 2026-10-27

**Status:** source-critical arithmetic executed; Lean draft PR #746 opened, CI pending at submission. Actor is current assistant, not authenticated historical Enheduanna. No SAT/H(s)H physical inference or BEDROCK promotion.

## Source and claim
Tatiana Bonch-Osmolovskaya, *Specific patterns in the number of lines of The Sumerian Temple Hymns*, *Journal of Mathematics and the Arts* 15 (2021), 275–295, DOI 10.1080/17513472.2021.2003615, reports a total divisible by 100 and equal totals for the first and second 21 hymns. Her related Russian-language 2021 article (DOI 10.31696/2618-7043-2021-4-4-1063-1083) is the same author, **not independent replication**.

The 42 count labels were manually transcribed from the Good Works Library translation, dated 2026-09-19, based on Oxford ETCSL c.4.80.1: https://tianmu.org/good-work-library/sumerian/hymns-and-temple-songs/the-temple-hymns . This is a **modern derivative**, not an independently inspected ancient tablet or independent validation of the 2021 paper. The ETCSL primary text could not be fetched in this run; manuscript collation remains open.

Counts I–XLII: 23,13,8,12,15,9,13,17,15,11,10,10,9,7,10,11,10,8,9,22,8,10,10,7,11,12,23,10,15,16,10,8,8,22,8,10,10,14,12,12,8,14.

## Executed Python arithmetic
- 42 labels; sum **500**; first 21 sum **250**; last 21 sum **250**.
- Hymn IX is labeled **15 lines**, explicitly an addition associated with Shulgi in the composite edition.
- Removing only IX's declared 15 from the final collection gives **485**; the surviving original positions I–XXI sum **235**, positions XXII–XLII sum **250**.
- Hence the 500/250/250 equal-half pattern **depends on the received collection including IX**. This does not reconstruct an attested 41-hymn historical version, and does not prove the numerology was unintentional or intentional.

Sophus Helle, https://enheduana.org/authorship/ , independently identifies IX as a later Shulgi addition and emphasizes uncertain whole-collection authorship. The older Ur III witness lacks the final attribution lines. These historical claims are **source-critical premises**, not results of arithmetic or Lean.

## Formal proof and next gate
Draft https://github.com/Satobloc/HsH/pull/746 adds eight conditional Lean theorems to existing Lean 4/Mathlib infrastructure, including source-label totals, deletion sensitivity, and an earlier conditional later-layer chronology gate. Compilation must be verified from actual CI logs. Lean can check exact formal arithmetic, not the transcription, ancient witnesses, intentionality, authorship, or physical reality.

**Next:** independently check all 42 labels against ETCSL transliteration and actual A/B/O/Q manuscript witnesses; recover full Bonch-Osmolovskaya methods/line table; compare alternative redaction and editorial counting conventions before assessing any statistical significance. Preserve Enheduanna literary-source remit and hand off to Tern Rook as systems/comptroller, not as automatic task reassignment.

**Lateral reading:** Smithsonian Ocean, *The Deep Sea*, brine-lakes and cold-seeps sections; no forced connection to SAT or literary numerology.

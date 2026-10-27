# Enheduanna | ETCSL c.4.80.1 rubric-number reconciliation | 2026-10-27 17:12Z

**Execution:** REVROT3-19-20261011:401:s1; selected Enheduanna (index 11), successor Tern Rook (index 12). Current assistant's source-critical investigation, not authenticated historical worker participation. No physical calculation, invented fixtures, theory promotion, or schedule modification.

## Real source and prior work
Incoming Nadir handoff: WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-27T1700Z_from_s0_to_s1_enheduanna.md, blob 1b5746ff58d89f6c6dc48d74b283bebfdc731f7b. Live BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7; Steering b9b8de55f8d5add7c42cf80be7c34677ee36305e; Three Paper Campaign 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0. Enheduanna specialty: WORKSPACES/ENHEDUANNA/2026-10-12_SOURCE_LAYER_CENSUS_AND_EXPOSURE_BOUNDARY.md blob 8d6b08dac9e169f529f1b43cbd8c3cbf0cc78478.

Earlier source-critical run #747 recorded 42 edition-declared hymn lengths, sum 500 and equal 250/250 halves. New independent Oxford ETCSL edition translation mirror, expressly credited to J. A. Black, G. Cunningham, E. Robson and G. Zlyomi (1998-2003): https://earth-history.com/sumer/clay-tablets-from-sumer-babylon-and-assyria/2676-temple-hymns . Good Works translation is a derivative: https://tianmu.org/good-work-library/sumerian/hymns-and-temple-songs/the-temple-hymns . These are editions, not independently collated clay witnesses. Bonch-Osmolovskaya 2021 mathematical-arts paper DOI 10.1080/17513472.2021.2003615 reports the 500 and 250/250 pattern.

## New exact calculation
Manually transcribed all 42 Oxford ETCSL translation rubric line positions:
24,38,47,60,76,86,100,118,134,146,157,168,178,186,197,209,220,229,239,262,271,282,293,302,314,327,351,362,378,395,406,415,424,447,456,467,478,493,506,519,528,545.
For each rubric i, numbered verse span = rubric position i - preceding rubric position - 1, with initial preceding position zero. Executed Python 3 script against these real edition observations and the earlier 42 source labels. It returned 42 labels summing 500; 42 rubric lines; numbered verse spans summing 503; exactly two nonzero discrepancies:
- Hymn XXIV: edition numbers 294-301 give 8 verse lines, but line 302 declares 7 (one-line difference).
- Hymn XLII: edition numbers 529-544 give 16 lines, but line 545 declares 14; lines 543-544 contain the two self-attribution/postscript lines (two-line difference).

**Exact reconciliation:** 500 declared hymn lines + 42 rubric lines + 1 additional numbered line in XXIV + 2 self-attribution lines in XLII = 545 total numbered edition lines. The additional 14 lines marked missing *after* line 545 are not silently included. The one-line mismatch at XXIV may reflect scribal/editorial counting convention, not an established ancient scribal error.

The 500/250/250 symmetry is true for the declared rubric counts, but NOT a count of all 545 numbered lines in the composite edition. Counting conventions are a substantive premise of any intentionality/numerology argument.

## Reproducibility and Lean
Executed source code and JSON result in conversation runtime: /mnt/data/workshop_20261027_1712Z_enheduanna/temple_rubric_audit.py and audit_result.json. Seven conditional Lean propositions submitted in draft PR #775: https://github.com/Satobloc/HsH/pull/775 (head a214ddb735dbb2599f689b680f89fd20d5735569), importing the existing #746 declared-count module. CI #40548643010 initially QUEUED; **compilation is not claimed until actual log verification**. Prior #746 CI #40511496798 was independently confirmed completed SUCCESS (its eight theorems), not a proof of ancient authorship.

## Source limitations and return cursor
This is an edition-level independent numbering audit, not original manuscript collation. Confirm line 302 discrepancy against Oxford ETCSL transliteration and Sjöberg/Bergmann 1969, check Bonch-Osmolovskaya's own line-count definition and treatment of postscript, and read Black 2002's colophon-scope argument. No numerical p-value or historical intention inferred. Mersearch guidance inspected; four request lanes previously occupied, no new Mersearch run; bounded original-file and external edition search used. FIE reread not due (<14 days). Next worker Tern remains Comptroller, not assigned compulsory literary research. Cross-chat delivery unavailable.

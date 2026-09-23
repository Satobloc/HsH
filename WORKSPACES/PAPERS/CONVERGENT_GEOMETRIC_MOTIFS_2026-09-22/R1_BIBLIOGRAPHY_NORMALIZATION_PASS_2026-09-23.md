# GRURPLE-A — R1 bibliography normalization pass

**Branch/task:** `CODE-GRURPLE-20260922 / GRURPLE-A / R0→R1 / revision-order item 1`  
**Date:** 2026-09-23  
**Status:** SOURCE-CHECKED / MANUSCRIPT-READY CORRECTION PACKET  
**Quarantine:** PRIOR_ART/private quarantine not consulted. This pass used only public external sources and the frozen R0 bibliography.

## Purpose

Execute a bounded portion of revision-order item 1: normalize the named external bibliography already used by R0, catch metadata/title errors before R1, and replace the two placeholder Hypothesis-H bibliography rows with concrete primary literature. This is bibliographic/source typing, not a prior-art novelty audit.

## R0 metadata corrections

R0's working list is substantially recoverable, but two titles should be corrected rather than copied forward:

1. arXiv:2510.05270 — exact title is **“Compactification Without Orientation, or a Topological Scenario for CP Violation”**, not the shortened R0 title “Compactification Without Orientation.” Authors: Brian Greene, Daniel Kabat, Janna Levin, Massimo Porrati. Initial arXiv date: 6 Oct 2025. Primary record: https://arxiv.org/abs/2510.05270
2. arXiv:2605.30405 — exact title is **“Toward a Phenomenologically Acceptable Quantum Cyclic Universe”**, not “Quantum Cyclic Universe.” Authors: Sean M. Carroll, Nadiia Diachenko, Saakshi Dulani. Primary record: https://arxiv.org/abs/2605.30405

The following R0 identifiers/titles are source-confirmed as suitable working primary citations:

3. Brian Greene, Daniel Kabat, Janna Levin, Massimo Porrati, **“Klein Bottle Cosmology,”** arXiv:2511.23447. Primary record: https://arxiv.org/abs/2511.23447
4. Jonathan Oppenheim, Muhammad Sajjad, **“Stochastic modes in postquantum classical gravity,”** arXiv:2605.05375. Primary record: https://arxiv.org/abs/2605.05375
5. Leonard Susskind, **“Is Time Reversal in de Sitter Space a Spontaneously Broken Gauge Symmetry?”**, arXiv:2603.12434. Primary record: https://arxiv.org/abs/2603.12434

## Hypothesis H: replace placeholder rows with concrete primary references

R0 currently has generic rows for “working literature on Hypothesis H” and “related work.” R1 should cite proposition-level primary papers instead. A conservative core set is:

6. Domenico Fiorenza, Hisham Sati, Urs Schreiber, **“Twisted Cohomotopy implies M-Theory anomaly cancellation on 8-manifolds,”** *Communications in Mathematical Physics* **377** (2020), 1961–2025; arXiv:1904.10207; DOI: 10.1007/s00220-020-03707-2. This is an appropriate primary citation for the full twisted-Cohomotopy formulation of Hypothesis H and its M-theory C-field/anomaly consequences. Primary arXiv: https://arxiv.org/abs/1904.10207
7. Domenico Fiorenza, Hisham Sati, Urs Schreiber, **“Twisted Cohomotopy implies M5 WZ term level quantization,”** *Communications in Mathematical Physics* **384** (2021), 403–432; arXiv:1906.07417; DOI: 10.1007/s00220-021-03951-0. Use where the manuscript discusses M5-brane Wess–Zumino structure/level quantization rather than as a generic citation for all of Hypothesis H. Primary arXiv: https://arxiv.org/abs/1906.07417
8. Hisham Sati, Urs Schreiber, **“M/F-Theory as Mf-Theory,”** *Reviews in Mathematical Physics* **35** (2023), 2350028; arXiv:2103.01877; DOI: 10.1142/S0129055X23500289. This is an appropriate primary citation for the broader Hypothesis-H program relating Cohomotopy-quantized M-brane charges to stable homotopy/generalized cohomology/cobordism and includes compactification-related consequences. Primary arXiv: https://arxiv.org/abs/2103.01877

Useful additional proposition-specific primary reference if R1 retains stronger anomaly language:

9. Hisham Sati, Urs Schreiber, **“Twisted Cohomotopy implies M5-brane anomaly cancellation,”** *Letters in Mathematical Physics* **111** (2021), 120; arXiv:2002.07737; DOI: 10.1007/s11005-021-01452-8. Primary arXiv: https://arxiv.org/abs/2002.07737

## Source-typing boundary

The Schreiber/nLab Hypothesis-H page was useful as a bibliographic crosswalk because it explicitly identifies the program's formulation and primary papers, but R1 should cite the primary papers above for scientific propositions. The page itself may be retained only as a navigation/history source where that is actually the proposition being supported: https://ncatlab.org/schreiber/show/Hypothesis+H

Do not collapse the distinct claims “C-field charge quantization in (J-)twisted Cohomotopy,” “M5 WZ level quantization,” “M5 anomaly cancellation,” and “compactification/cobordism consequences” into one omnibus citation. Attach the paper that actually carries the sentence.

## R1 working-list replacement

At minimum, replace R0 bibliography rows 1, 4, 6 and 7 as follows:

- row 1: restore the full Greene–Kabat–Levin–Porrati title including the CP-violation subtitle;
- row 4: restore the full Carroll–Diachenko–Dulani title and correct the author given names/initials as needed by the chosen house style;
- rows 6–7: delete the generic “working literature” placeholders and insert concrete primary references 6–8 above, plus 9 only where the manuscript uses its specific anomaly result.

## Claim audit implications for R1

This pass also confirms three source-scope points already anticipated by review:

- Oppenheim–Sajjad explicitly study a covariant classical-spacetime/quantum-matter theory and linearize around Minkowski space; this supports the narrow source report, not a universal claim that spacetime need never be quantized.
- Carroll–Diachenko–Dulani's exact periodicity is conditioned on commensurable energy differences; R1 should continue to distinguish exact recurrence/periodicity from arbitrary observable discreteness.
- Susskind's abstract explicitly identifies a closed curve and holonomy that flips forward-going and backward-going clocks; this supports the narrow holonomy/orientation source report, not a generic equivalence to SAT transport.

## Durable boundary / handoff

**Changed:** the external working bibliography now has exact corrections for the two malformed R0 titles and a concrete primary Hypothesis-H citation spine replacing placeholder rows.

**Blockers:** none for bibliography normalization of the already named external works. Proposition-level citation placement still belongs in R1 drafting. This pass does not establish novelty, priority, influence, or independence and does not open PRIOR_ART.

**Next cursor:** R1 drafting should consume this packet together with `R1_PROVENANCE_ASSEMBLY_PACKET_2026-09-23.md`, then execute revision-order item 2 (local claim typing/source-vs-synthesis transitions) rather than performing another generic bibliography search.

No Nathan action required.

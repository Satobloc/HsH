# Aldus :24 | WWRD real-rope specification null comparator | 2026-10-28

**Status:** manufacturer-source verified / nominal arithmetic executed / Lean pending / no H(s)H prediction or BEDROCK promotion. Current assistant is not authenticated historical Aldus.

**Actual physical products:** Petzl MAMBO 10.1 mm and VOLTA 9.2 mm, compared only in their **single-rope** EN892/UIAA mode. Petzl MAMBO lists diameter 10.1 mm, impact force 8.5 kN, 65 g/m, 37% sheath, 34% dynamic elongation, 7 factor-1.77 falls and 40-carrier construction. VOLTA lists 9.2 mm, 8.6 kN, 55 g/m, 42% sheath, 33% dynamic elongation, 6 factor-1.77 falls and 40 carriers. Original manufacturer pages accessed 2026-10-28:
- https://www.petzl.com/US/en/Professional/Ropes/MAMBO-10-1-mm
- https://www.petzl.com/US/en/Sport/Ropes/VOLTA-9-2-mm

**Source semantics:** These are manufacturer-published nominal specifications, NOT recovered independent lab force-time records. Test date, uncertainty, covariance, sample count, and torsional response are not supplied. The 40-carrier construction is not a verified core-filament count. Petzl specifies an 80 kg single-rope test mass, nominal fall factor 1.77 and 12 kN force ceiling; impact force is measured at the mass, not representative of real climbing falls. See https://www.petzl.com/ca/en/operators/tech-tips-by-product/product-information-and-specifications/what-is-the-impact-force-of-a-rope-/CORDES-force-choc-tableau_OPE_a77w0000000Kyw0AAC.html . UIAA 101 requires force-time history for its energy-absorption evaluation: https://www.theuiaa.org/documents/safety-standards/UIAA_101-DynamicRopes-2025.pdf .

**Executed restricted test hypothesis, not Nathan/H(s)H:** For universal positive `k` and a nominal circular-area-only scaling `F=k*d^2`, the printed numbers yield diameter-squared ratio `(10.1/9.2)^2 = 10201/8464 = 1.2052221172`, while impact-force ratio `8.5/8.6 = 85/86 = 0.9883720930`. Cross-product `8.5*9.2^2 - 8.6*10.1^2 = -157.846 kN mm^2`. Therefore no shared positive area-only coefficient fits both **nominal listed values**. Python Decimal 60-digit and independent exact Fraction checks passed. No sigma, fit, invented uncertainties or physical significance are claimed. This falsifies only the deliberately restricted comparator, not rope mechanics or H(s)H.

**Proof status:** draft stacked PR #862 has two interconnected Lean 4/Mathlib modules with eight conditional theorem statements. Run #40650106951 initially IN_PROGRESS, compilation not yet verified. Lean does not authenticate source measurements, constitutive translation or H(s)H. Existing Math Hopper/Lean infrastructure reused; no new solver.

**Aldus provenance:** historical check-in HsH Git blob `5d56ad3116ed6a4891154f80648fb1daa5a49ca5` establishes public-source/firsts remit. Ravel's Oct 9 WWRD scope note Git blob `456a61b581437924c971f28522bdf23f3dae16dd` attributes rope heuristic to Nathan, but it is a later cross-post, not original raw-user verification. WWRD is FIRST-BLUSH HEURISTIC only.

**Next falsifier:** obtain specimen-resolved force-time/displacement curves, actual core/sheath microstructure, torsional response and measurement uncertainties before inferring worldtube geometry. Calder receives repository-directed handoff only; original chat delivery unavailable. No scheduler changes, sixth task, signet, rename or theory promotion.

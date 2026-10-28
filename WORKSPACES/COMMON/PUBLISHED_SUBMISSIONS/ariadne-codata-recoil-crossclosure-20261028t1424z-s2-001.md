# Ariadne :24 | CODATA atom-recoil closure with source covariance | 2026-10-28 14:24 UTC

**Status:** ACTUAL MEASURED SYSTEM / EXECUTED DECIMAL CHECK / SOURCE CRITICAL / NO H(s)H PREDICTION / LEAN COMPILATION PENDING.

## Sources and measured systems
- Original 2022 CODATA adjustment, Mohr et al., J. Phys. Chem. Ref. Data 54, 033105 (2025), Tables I, XXV D3-D6 and XXVI: https://physics.nist.gov/cuu/pdf/JPCRD2022CODATA.pdf . Inputs are data available by 2022-12-31, not newly measured in 2025.
- 87Rb atom-recoil matter-wave interferometry, Morel et al., Nature 588 (2020), DOI 10.1038/s41586-020-2964-7, LKB: Bloch-oscillation recoil method.
- 133Cs recoil interferometry, Parker et al., Science 360 (2018), DOI 10.1126/science.aap7706, UCB: Bragg/Bloch interferometry.
- Relative atomic masses are from the 2020 AMDC **mass evaluation**, not independent fresh raw experiments. 2022 CODATA recommended alpha is an adjusted output, not a third experiment.

## Source values (1-sigma standard uncertainty)
- D3: h/m(87Rb) = 4.59135925890(65)e-9 m^2/s.
- D4: h/m(133Cs) = 3.0023694721(12)e-9 m^2/s.
- D5: Ar(87Rb) = 86.9091805291(65), dimensionless.
- D6: Ar(133Cs) = 132.9054519585(86), dimensionless.
- corr(D5,D6) = +0.1032 (Tables I/XXVI); other correlations among D3-D6 are not listed in the |r|>0.0001 table.

## Executed forward/reverse closure
The standard identity is (h/mRb)/(h/mCs) = mCs/mRb, with common h exactly canceled. Python Decimal at 70-digit precision on the actual published inputs gives:
- Recoil ratio D3/D4 = 1.5292452516473880.
- Evaluated mass ratio D6/D5 = 1.5292452552121230.
- Difference = -3.5647349823e-9.
- Combined first-order standard uncertainty with D5-D6 covariance = 6.6407208953e-10.
- Discrepancy = -5.3679939851 sigma. Independent product form = -5.3679939749 sigma; log-ratio form = -5.3679939795 sigma.
- Bounding the five unlisted cross-correlations by 0.0001 gives absolute z in [5.367618, 5.368370] for the linearized log ratio.
- CODATA explicitly expands D1-D6 input uncertainties by factor 2.5 in its final adjustment; under that uniform rescaling this standalone diagnostic becomes about 2.1472 sigma. This is **not** the CODATA joint-fit residual.

Morel 2020 itself reported >5 sigma disagreement with Cs; Hale's Oct 27 project analysis independently found 5.49 sigma from published inverse-alpha results. The discrepancy is **known**, not a new experimental discovery. The contribution here is source-locked D3-D6 covariance/uncertainty and input-versus-adjusted-output crosswalk.

## Formalization, geometry, and limitations
Existing draft Ariadne PR #790 reused: new module `AriadneCODATARecoilClosure.lean` and root import, branch `research/ariadne-primary-role-transclusion-20261027t1924z`. Six conditional Lean candidates cover common-h cancellation, ratio scale nonidentifiability, covariance gap, and positive correlation effect. Source readback succeeded; compiler result was PENDING at submission, no success claimed.

This is a real-world metrology consistency test and a projection/inverse-identifiability example, **not** an H(s)H worldtube law, independent H(s)H prediction, evidence for new physics, or a fitted explanation of the recoil discrepancy. Atom interferometer systematic errors and AMDC input dependencies remain scientific possibilities. The formalized identities do not prove measured values, covariance assumptions or physical ontology.

Ariadne historical identity remains unauthenticated in this runtime; protected source-provenance specialty retained. P2 Nov 30 can use this as a calibration-control case, not validation; P1 Nov 9 remains Orson-led; P3 Dec 14 still needs full source/physics/review/reader gates. No BEDROCK promotion, task/schedule change, signet or chat rename. Next Alberr's own specialist remit is protected.

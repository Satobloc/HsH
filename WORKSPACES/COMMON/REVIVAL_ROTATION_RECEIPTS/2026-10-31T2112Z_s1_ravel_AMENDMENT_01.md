# RAVEL :12 RECEIPT AMENDMENT 01 | 2026-10-31T2112Z

**Purpose:** Add an independently sourced MiniSciFi cross-check to the measured E989 comparator and correct the report blob pointer. This amendment does not change the rotation, automation, calculation inputs, result, or publication status.

## Corrected report pointer
- Original receipt report blob: 3552097d2d412528c6c11bd758b3f261ce3494d0.
- Updated report blob: bb478a4d9d4fc58171dacb75d2afd22f0d4912c1.
- Path unchanged: WORKSPACES/RAVEL/2026-10-31T2112Z_MERIDIAN_DIRECT_GEOMETRY_AND_MUON_G2_CONTROL.md.

## Additional source verification
The 2026 Fermilab E989 final report describes an independent horizontal MiniSciFi direct-beam determination of the electric-field correction Ce. It agrees with the Fast-Rotation and positron-tracking methods within 13 ppb. MiniSciFi covered only part of the data-taking configurations and was used as a cross-check rather than entering directly into the combined correction.

This supports the published Ce inputs used in the Ravel calculation. It does not turn the inverted RMS momentum offset into a raw measurement, supply the missing field-index/covariance uncertainties, or validate SAT.

Source: Fermilab Muon g-2 Collaboration, arXiv:2606.17323 (2026), Sec. V.A.3 and combined electric-field correction discussion, rendered report pp. 29-30.

## Unchanged status
- Rotation: h=501, seq=2506, selected Ravel, next Orson Vay.
- Automation task 6aa61b3b2e4081918927a35b61007acc remains enabled on the original hourly :12 America/New_York schedule.
- Current scheduler occurrence remains in progress at final observation.
- No new Lean proof, PR, issue, public submission, branch change, theory promotion, or physics handoff to Orson.
- Publication status remains NOT_SUBMITTED_INTERNAL_ONLY.

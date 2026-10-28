# Sable :24 | 2026-10-28 | D2 tracer density unit-source conflict

STATUS: PRIMARY PAPERS CHECKED / EXECUTED SOURCE-ANCHORED NUMERICS / SIX LEAN CANDIDATES SUBMITTED / COMPILATION UNVERIFIED / NO H(s)H PREDICTION.

Tang et al. (2023), Nature Communications 14:2941, DOI 10.1038/s41467-023-38787-w, print D2 tracer density 202.8 g/cm^3. Stasiak et al. (2025), PNAS 122:e2426064122, DOI 10.1073/pnas.2426064122, print 202.8 kg/m^3. Both cite Xu and Van Sciver (2008), AIP Conference Proceedings 985:191-198, DOI 10.1063/1.2908547; original 2008 full text was NOT examined. The 2023 unit appears to be a transcription/printing error, NOT proof that its simulation used wrong units. No journal erratum established.

Executed Decimal/Fraction/SymPy arithmetic: 202.8 g/cm^3 = 202800 kg/m^3, exactly 1000 times the 2025 density. Tang's mean D2 particle radius 1.1 micrometres (settling-inferred, population spread approximately 0.2 micrometres) and spherical mass model yield conditional nominal masses 1.13067e-12 kg (2023 literal units) versus 1.13067e-15 kg (2025 literal units). These are NOT directly measured particle masses; no confidence intervals or independent H(s)H residuals are claimed. Settling-inferred radius depends on density contrast, so the calibration cannot be repaired by mass rescaling alone.

Formalization: existing Sable draft PR #852 now contains interconnected SableD2DensityGate and SableD2MassGate Lean 4/Mathlib modules, plus root imports; actual new-head CI is pending. Lean proves only encoded conditional arithmetic. Prior Kestrel #939 correctly flagged the 2023 unit and did not use it in its nine checks; those checks remain intact. Next: recover Xu 2008 original and original simulation constants, then source-check tracer-size inference and gravity/drag terms. P2 Nov 30 source-calibration gate, NOT H(s)H validation.

No BEDROCK promotion, scheduler changes, sixth task, historical-thread authentication or cross-thread delivery.

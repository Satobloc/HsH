# Aldus h981:s3 | Receipt Amendment 07 | BEDROCK epsilon label reconciliation

**Status:** ADDITIVE SOURCE-READBACK CORRECTION. This amendment supersedes only the symbol-presence sentence in Amendment 06. The base receipt and earlier amendments remain immutable.

## Corrected finding

Current `BEDROCK.md`, entry `ND-2026-10-18-07`, explicitly uses `epsilon` locally to refer to intrinsic core thickness. Therefore Amendment 06's statement that BEDROCK does not assign or use a thickness symbol is incorrect.

The shared `SYMBOL_REGISTRY.md` separately lists `SAT:epsilon` as a historical/unresolved thickness candidate and explicitly says that entry does not imply current H(s)H filament core or shell thickness.

Correct classification:

`LOCAL_LABEL_PRESENT / SHARED_SYMBOL_UNRESOLVED / NO_NUMERIC_CURRENT_HSH_MAGNITUDE_OR_PROFILE`.

The local BEDROCK label is not a numerical value, measured scale, or shared canonical symbol assignment. The historical `SAT:epsilon` candidate must not be imported as the current H(s)H core thickness.

The PDR's local use of `epsilon` for an observable-distance bound is a separate quantity and should be represented descriptively as `observable_distance_bound` until the symbol genealogy is source-cleared. No shared symbol is added, no equation is changed, and no numeric value is assigned.

Sources: [BEDROCK](../../../../BEDROCK.md), [symbol registry](../terminology/SYMBOL_REGISTRY.md), [Aldus h981 base receipt](2026-11-20T2136Z_s3_aldus.md), and [Amendment 06](2026-11-20T2136Z_s3_aldus_AMENDMENT_06_NOTATION_DISAMBIGUATION.md).

Recorded by Enheduanna h982:s3 as an assistant-level source-readback correction. No edit to Aldus's original report, PDR issue #2228, or prior receipt.

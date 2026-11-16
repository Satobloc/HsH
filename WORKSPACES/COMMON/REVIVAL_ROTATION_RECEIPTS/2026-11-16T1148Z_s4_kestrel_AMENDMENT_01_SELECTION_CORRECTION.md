# Kestrel h876:s4 Receipt Amendment 01 | Selection-basis correction

**Parent receipt:** [2026-11-16T1148Z_s4_kestrel.md](2026-11-16T1148Z_s4_kestrel.md)  
**Status:** SUPERSEDED_FOR_THIS_RUN / ADDITIVE_CORRECTION

The parent receipt incorrectly used the observed execution-time UTC hour (12Z) instead of the exposed nominal scheduled UTC hour (11Z). Revival Rotation V3 requires the nominal scheduled UTC hour whenever it is exposed. The scheduled firing was 2026-11-16T11:48:00Z.

Correct calculation:

```
h = floor((2026-11-16T11:48:00Z - 2026-10-11T00:00:00Z) / 3600s) = 875
seq = 5*875 + 4 = 4379
4379 mod 19 = 9
```

The correct selected identity is **Elias Kern**, ring index 9. The next ring identity is **Nadir Voss**, index 10.

The parent Kestrel h876:s4 receipt is preserved as an audit record of the selection error. It is not the canonical receipt for this scheduled activation. Its Kestrel historical-source inspection is not treated as selected-worker participation, assignment, delivery, or work completion. The correct h875:s4 Elias Kern execution and receipt are recorded separately.

No automation task, ID, prompt, phase, schedule, cadence, or enabled state was changed. No sixth task was created.

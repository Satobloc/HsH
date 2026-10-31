# Aster :00 assistant-fixture provenance addendum | 2026-10-31T0300Z

**Run key:** `REVROT3-19-20261011:483:s0`  
**Related report:** issue #1136, `aster-slow-glass-path-length-20261031t0300z-s0-001`.  
**Purpose:** Preserve the historical assistant-generated examples as provenance evidence without allowing them to be mistaken for measured physics or Nathan Direct mathematics.

## Historical assistant material

The first assistant response in raw `Meridian Free Build`:

- Conversation ID: `6aca594e-2c9c-83e9-88d8-3f1d236ee655`.
- Raw blob SHA-1: `47a57a246e8598283dda274e3fc06ad71be47ae0`.
- Assistant message: `8f953d5c-7453-45d7-b926-918617276b3e`, 2026-10-17T09:01:57.222Z.

It introduced a standard Maxwell-viscoelastic comparison and evaluated it at selected dimensionless values:

| omega*tau | stored response | dissipative response |
|---:|---:|---:|
| 0.1 | 0.009901 | 0.099010 |
| 1 | 0.500000 | 0.500000 |
| 10 | 0.990099 | 0.099010 |

The Maxwell formula is standard external mathematics. The selected omega*tau values are assistant-chosen illustrative fixtures. They are not measured observations, not Nathan Direct inputs, not SAT parameters, and not an independent material dataset. The comparison does not derive inertia or an SAT constitutive law.

The later assistant response, message `649e12f4-66af-43d3-9971-47742577061c`, introduced a helical path and selected the toy ratio `2*pi*r = 4*p`, yielding `c/sqrt(17)`. That ratio is also assistant-selected, not a user-specified pitch/radius or empirical measurement.

## Current classification

- **Nathan Direct:** “Matter is Slow Glass”; subsequently, light and matter both travel at c by the push of time, with matter having farther to go.
- **Assistant reconstruction:** Maxwell/viscoelastic interpretation, chosen omega*tau table, helical path, selected pitch/radius ratio, and c/sqrt(17) illustration.
- **Standard reference:** Maxwell linear viscoelastic response, used only as an external comparator.
- **Independent measurement:** none.
- **Physical prediction:** none.

Under the current real-system calculation rule, these historical fixtures must not be reused as empirical physics or physical predictions without specific prior permission. The symbolic helix arclength identity can still be studied as conditional mathematics with arbitrary pitch/radius values left symbolic.

**Disposition:** `HISTORICAL_ASSISTANT_FIXTURES_QUARANTINED_FROM_EMPIRICAL_USE / NO_CODATA_SCORING / NO_THEORY_PROMOTION`.

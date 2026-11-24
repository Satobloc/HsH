# Loom source-local tags | Joint clock-calibration family | 2026-11-19

**Run:** h942:s1  
**Scope:** one Lane 36 architecture/verification artifact. Source-local tags only; no canonical tag dictionary changes. Mercer retains global precision/selectivity QA ownership.

## Source authority and provenance

| Source | Class | Extent / identity | Use |
|---|---|---|---|
| Meridian h941 report, issue #2066 | Prior assistant reconstruction | Published report and exact workspace artifact | Identifies the unformalized shared-map versus joint-family gap |
| Meridian PR #2065 | Formal source / draft PR | Exact head `9b69b404434cfba096ddfb7a44207156f60ba904`; exact-head build #44468248145 SUCCESS | Shared strictly monotone map, explicit composition bridge |
| Aldus `AldusTemporalProvenance` | Existing formal source / draft PR chain | `TimeInterval`, `ClockDomain`, `ClockScale`, `definitelyBefore` | Source-bound interval and clock vocabulary |
| Loom PR #2071 | New assistant formalization | Exact head `76740f5aa29c75ae6e42ef22b5fa74410a0ac7cb`; exact-head build #44473841176 SUCCESS | Joint calibration family and robust boundary separation |
| Nathan Direct Lane 36 instruction | Direct current user instruction | Current conversation | One-run architecture/prediction remit, proof-first and physical-evidence boundaries |

No historical source, standard reference, assistant reconstruction, or physical measurement is silently merged with another class.

## Source-local tags and current-first crosswalk

| Tag | Current definition | Historical/source relation | Guard |
|---|---|---|---|
| SHARED-CLOCK-TRANSFORM-FAMILY | Alternative transforms each applied identically to both intervals | Meridian PR #2065 plus new pointwise family theorem; extension | Not cross-clock synchronization |
| JOINT-CALIBRATION-STATE | One admissible paired-transform state for two source clocks | New `JointClockCalibrationFamily` type | Not a measured calibration state |
| JOINT-BOUNDARY-IMAGE | Set of mapped earlier-upper/later-lower boundary pairs over all admissible states | New Lean definition; exact formal object | Not a probability distribution |
| UNIFORM-CROSS-CLOCK-SEPARATION | Every admissible joint boundary pair has strict first-before-second order | New Lean proposition | Requires a source-authorized joint family |
| CALIBRATION-DEPENDENCE-RELATION | The allowed pairing between two clock-map families | Encoded by the admissible index | Product only when independence is justified |
| MAP-MONOTONICITY-NOT-SYNCHRONIZATION | Separate strict monotonicity does not supply cross-clock boundary separation | Logical distinction in the new contract | Not an empirical claim about specific clocks |

## Status

- Tags remain source-local.
- No global tag dictionary or BEDROCK change.
- No Nathan-authored historical corpus message was newly discovered or added to the ten-message Loom charter ledger.
- No SAT-O/Blockwave equation, physical calculation, fit, prediction, or independent measurement was added.

# Loom terminology / symbol hazard register

**Status:** working annotation aid; not theory authority  
**Date:** 2026-09-20  
**Scope:** bounded P0 tagging/crosswalk aid derived from current Common control surfaces. Historical source wording must remain intact.

| Hazard | Unsafe collapse | Current annotation rule | Status |
|---|---|---|---|
| `boson` / `fermion` | SAT structural vocabulary = standard spin/statistics | Preserve historical wording. Tag SAT structural use separately from standard spin/statistics. Current structural axis is persistent/localized/coiled vs traveling/light-mode; mapping to standard boson/fermion is a separate problem. | ACTIVE |
| `f-boson` / `t-boson` | f/t prefix = standard fermion/boson class | Treat f/t as SAT substrate/location vocabulary when context supports it: filament-side vs timesheet-side excitation. Do not infer statistics. | ACTIVE |
| `massless` / `light-mode` | traveling/light-mode = exactly zero inertial mass | Do not translate light-mode into massless. Current SAT status rejects literal zero inertial mass for detectable particles; photon/neutrino mass calculations remain distinct prediction/audit objects. | ACTIVE |
| `field` | ordinary field ontology = SAT/H(s)H geometry automatically | Treat unqualified field language as a translation hazard. Prefer the source's actual geometry/topology/deformation/intersection language unless field ontology is explicitly asserted. | ACTIVE |
| `Z3` / modulo-3 | hand-inserted assumption = emergent/derived structure | Preserve whether a source assumes, derives, or merely observes modulo-3 structure. Never upgrade one status to another by terminology alone. | ACTIVE |
| `lattice` | historical/background lattice = mandatory current ontology | Do not re-import a background lattice as mandatory ontology merely because historical SAT sources use lattice language. Preserve historical status and seek explicit current support before inheritance. | ACTIVE |
| `photoneutrino` / `ghost neutrino` / `Jarlskog Shadow` | historical ghost-neutrino wording = current literal photoneutrino identity | Current Nathan-direct clarification: photoneutrino is filament-side/f-boson; Jarlskog Shadow appears to be the timesheet-side analogue. Preserve older ghost-neutrino wording as genealogy and annotate supersession/context rather than rewriting it. | ACTIVE; earliest raw photoneutrino→f-boson provenance still open |
| `H_0+c` | shorthand string = dimensionally valid equation | Preserve the historical/current shorthand while tagging the dimensional hazard. Recover intended variables/geometry before normalization; distinguish `H_0+c` from forms such as `H_0 L+c`. | ACTIVE |
| `isomorphism` | analogy/correspondence = mathematical isomorphism | Tag exact source wording, but do not certify `isomorphism` without explicit structures, structure-preserving map, inverse, and preserved operations/invariants. Weaker supported relations must remain available. | ACTIVE |

## Tagging relations

Use additive relations rather than destructive normalization:

- `HISTORICAL-TERM → PRESERVE-EXACT-WORDING`
- `TERM-COLLISION → CONTEXT-REVIEW-REQUIRED`
- `SAT-STRUCTURAL-CLASS → NOT-AUTOMATIC-STANDARD-SPIN-STATISTICS`
- `LIGHT-MODE → NOT-SYNONYM-OF-ZERO-MASS`
- `GHOST-NEUTRINO → HISTORICAL-JARLSKOG-GENEALOGY / NOT-CURRENT-LITERAL-PHOTONEUTRINO`
- `H_0+c → DIMENSIONAL-HAZARD / SOURCE-RECOVERY-BEFORE-REPAIR`
- `ISOMORPHISM → CLAIM-STRENGTH-AUDIT-REQUIRED`

## Provenance / control pointers

Controlling current guidance: `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`, `WORKSPACES/COMMON/DIRECTION_UNIFICATION_2026-09-18.md`, `WORKSPACES/COMMON/CURRENT_HSH_HYPOTHESIS_STATUS_2026-09-14.md`, and newer Nathan directives. This register is an annotation aid only and does not promote, validate, reject, or silently modernize historical theory content.

## Next cursor

Apply this register to one addressable Nathan-direct raw source containing a terminology collision, recording the exact historical wording and the minimum additive context tag without rewriting the source.
## 2026-10-30 source genealogy addition


| `B` / `0.239 rad` / `Phi ~= 0.246 rad` / `Delta-phi` | Numeric proximity or assistant narrative collapsed into one angle/parameter | Keep separate source-typed records. Raw user message `15338421-a5e7-4538-879a-d25d840d2bdd` contains a user-supplied page with a 0.246-rad optical claim, but embedded authorship is unresolved. Assistant `c2f22ca2...` supplies a Z3/4D explanation without derivation; assistant `be9d54f6...` later retracts automatic derivation. Nathan-direct `77fd1295...` is a 0.239 projection interpretation; `4dbcbf32...` is a conditional time-wavefront-curvature hypothesis, not proof. The 14.1-degree target reframing is assistant-authored. Obtain B's unit/type from its defining source equation; never infer identity from numeric proximity. | ACTIVE |

## Additive tags

- `0.246 rad` → `HISTORICAL-OPTICAL-CANDIDATE / EMBEDDED-AUTHOR-UNRESOLVED / NO-DERIVATION / NO-MEASUREMENT`
- `0.239 rad` → `NATHAN-DIRECT-PROJECTION-INTERPRETATION / NOT-PROVEN`
- `B` → `SEPARATE-COEFFICIENT / TYPE-FROM-DEFINING-SOURCE`
- `14.1 degrees` → `ASSISTANT-TARGET-REFRAMING / NOT-OPTICAL-EVIDENCE`
- “This keeps coming up...” → `TRANSCRIPT-ONLY / SPEAKER-UNVERIFIED`
- Source ledger: `WORKSPACES/LOOM/2026-10-30T0748Z_0246_SOURCE_GENEALOGY.md`


## 2026-10-30 unit-conversion clarification
- Scripted conversion: 0.239 rad = 13.693691303626673 degrees; 0.246 rad = 14.094761760218251 degrees; difference 0.4010704565915777 degrees (2.9288702928870323% relative to 0.239).
- The assistant's later 14.1-degree target is the rounded conversion of 0.246 rad, not an independent measurement or replication.
- Record: `WORKSPACES/LOOM/2026-10-30T0820Z_0246_UNIT_CONVERSION.md`.


## 2026-10-30 08:28Z source-QC correction — optical 0.239/0.246 chain

The earlier row's phrase “assistant `be9d54f6...` later retracts automatic derivation” is too broad. The assistant turn **partially corrects** its predecessor: it disclaims the automatic mapping of optical Δφ and other real-world phenomena to SAT without an additional physical mapping, but it still asserts that 0.239 rad is internally inevitable from combinatorial projections of 4D filaments. No derivation of that retained assertion appears in the cited turn. Preserve it as an assistant-authored claim, not a verified SAT derivation.

The user-role turn `b8cc4592-3a32-4893-9857-21f2b1e28e4b` (“Ok, what about 14.1”) is a direct question, not a method directive. The source-typed Lean metadata was corrected to `directQuestion` and compiled in PR #759 commit `c97db86dddc43f49ec0a9cadc51529d6f5d573db`, run #41026140873.

The outer user-role turn is attributed to Nathan under the standing archive-speaker policy; this does not transfer authorship to the embedded “Page One” document. Its author remains unresolved. Full raw-export duplication and parent-edge verification: `WORKSPACES/LOOM/2026-10-30T0828Z_SOURCE_QC_ADDENDUM.md`.


## 2026-10-31 θ4 source / geometry hazard

| Hazard | Unsafe collapse | Current annotation rule | Status |
|---|---|---|---|
| `θ4` / filament–timesheet angle | “Angle between filament and time surface” = a fully defined metric angle, or angle to the hypersurface itself = angle to its normal | Preserve the July 2025 `SAT4D_4.txt` glossary wording: `v=dγ/dλ`, `Σ_t` is the 3D resolving wavefront, `u` is declared normal to `Σ_t`, and `θ4=angle(v,u)`. The same glossary says no metric or connection is assumed, so normality/angle and its `∇u` strain tensor are under-specified until those structures are supplied. Do not silently assume Euclidean or Lorentzian geometry. | ACTIVE / STRUCTURE REQUIRED |
| `m_eff=Tℓ_f/(c²Q)` vs `m/m_max=sin²θ4` | Canonical glossary mass formula = assistant-generated angle parameterization | Keep the two constructions separate. The July glossary's `m_eff=Tℓ_f/(c²Q)` contains no `θ4` map. The later public `SAT-Y Theta4 Calcs.txt` `sin²θ4` law is an assistant reconstruction with an un-derived `m_max`; no projection/composition map to `Q`, `T`, or `ℓ_f` has been recovered. | ACTIVE / NO MAP |
| `sin²θ4` / Z3 | A claimed unique Z3 potential = proven symmetry consequence | The public `SAT-Y ThetaProof.txt` transcript also uses `1−cos(3θ4)`. If the intended Z3 action is `θ4↦θ4+2π/3`, then `sin²θ4` is not invariant (`0` at `θ4=0`, `3/4` at `2π/3`), while `1−cos(3θ4)` is invariant. If Z3 acts on another variable, this counterexample does not apply; the group action must be stated. | ACTIVE / ACTION UNSPECIFIED |
| `tanθ4=2πr/p` | Circular-helix identity = general 4D superhelix law | Treat as conditional 3D circular-helix geometry only: constant radius, pitch `p` per full turn, axis aligned with `u`, and a specified Euclidean inner product. The angle to the wavefront plane is complementary to the angle to its normal. No extension to a multi-mode 4D superhelix is established. | ACTIVE / CONDITIONAL |

### Public-source typing

- `SAT4D_4.txt` (internal date July 2025; author line: “SATO.4D Coherence Project”; blob `efc88f4523b2fd616e64898737c2aa45e5f39b9a`) is a project glossary, not a raw Nathan message. It defines `θ4=angle(v,u)` while also declaring no metric/connection a priori and defining `S_{μν}=∇_μu_ν+∇_νu_μ`.
- `SAT-Y 4D.txt`, `SAT-Y ThetaProof.txt`, and `SAT-Y Theta4 Calcs.txt` entered the public archive in commit `07077989481f12eca0dcb0e0f986e39eb8be1491` at 2025-10-27T01:41:47Z. The transcript's “You said” time-normal line has no recovered raw message UUID; the `sin²θ4`, `1−cos(3θ4)`, and mass-angle formulas remain assistant-reconstruction status.
- `SAT_theta4_kink_retardance.png` entered the public archive at commit `51402d2c550978bcf5edaa432829518d59d4690d` on 2025-10-27T22:13:26Z; its file inventory carries a 2025-05-09 creation timestamp, not an authorship record.
- The public-facing SAT/filament episode record for 2025-02-02 does not mention `θ4`. The earliest verified public θ4-bearing archive artifacts located in this pass are the 2025-10-27 repository additions; this is not proof that no earlier public mention exists elsewhere.
- Private Library raw sources reviewed for earlier symbol adoption and mass-angle hypothesis are not reproduced or indexed in this public register. Their speaker/assistant distinctions and exact provenance remain in the current run record.

### Formalization gate

Before Lean formalization, specify a metric/signature and compatible connection (or replace “angle/normal” with a metric-independent structure). Then formalize the nonzero-vector angle, the circular-helix reduction, and the conditional Z3 action. No Lean theorem was compiled in this run; the exact symbolic checks are not Lean verification and do not validate physical premises.

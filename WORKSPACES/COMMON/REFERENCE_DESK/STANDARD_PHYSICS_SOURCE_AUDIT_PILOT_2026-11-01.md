# Standard Physics Map — Source Audit Pilot

**Date:** 2026-11-01  
**Status:** pilot evidence layer; non-canonical; does not replace the October 24 charter or namespace schema.

## Purpose
Turn the supplied formula inventory, five-page formula-chart PDF and tree diagram into source-located records that can be corrected before admission to the conventional physics floor plan. The tree is a navigation aid, not the dependency graph. Formula sheets are not authoritative sources.

## Source provenance
Original attachments were read-only. SHA-256 hashes and exact locators are in the companion JSON. PHYSICS_ICEBERG.txt, PHYSICS_MAP_QA_SEED.json, PHYSICS_MAP_WORKER_QA_V0.md, physmap.png, issues.txt and all five PDF pages were inspected. The PDF is image-based; text extraction yielded no text, so all pages were rendered and visually inspected.

## Corrections confirmed against external references

| ID | Source locator | Source entry | Finding / normalized record |
|---|---|---|---|
| F-001 | Formula-chart PDF p.2, Mass Formula | `m=F/m` | Algebra/transcription error. Constant-mass Newtonian case: `m=F/a`. [OpenStax momentum and force](https://openstax.org/books/college-physics/pages/8-1-linear-momentum-and-force). |
| F-002 | PDF p.2, Frequency Formula | `F=v/λ` | Symbol error: frequency is `f=v/λ`; uppercase F is force. [OpenStax wave speed](https://openstax.org/books/university-physics-volume-1/pages/16-1-traveling-waves). |
| F-003 | PDF p.2, Torque Formula | `T=Fr sinθ` | Use `τ=r×F`, with magnitude `rF sinθ`. Avoid T because it collides with period, tension and temperature. [OpenStax torque](https://openstax.org/books/university-physics-volume-1/pages/10-6-torque). |
| F-004 | PDF p.2, Centroid Formula | unweighted coordinate mean | Valid only for equally weighted point masses/areas. A general centroid is weighted by the relevant mass, area or volume distribution. |
| F-005 | PHYSICS_ICEBERG.txt line 54 | `F_net=ma=dp/dt=d(mv)/dt` | Split momentum law from constant-mass special case: `F_net=dp/dt`; `F_net=ma` when mass is constant and system/frame conditions apply. [OpenStax 8.1](https://openstax.org/books/college-physics/pages/8-1-linear-momentum-and-force). |
| F-006 | PDF p.5, Modern Physics | `Δx Δp ≥ h/2` | Constant-symbol error: standard bound is `Δx Δp ≥ ħ/2`. [OpenStax uncertainty principle](https://openstax.org/books/university-physics-volume-3/pages/7-2-the-heisenberg-uncertainty-principle). |
| F-007 | PDF p.5, Currents | `i=I₀ exp(+t/RC)` | Wrong sign for passive discharge. Magnitude decays as `I₀ exp(-t/RC)`; signed current depends on reference direction. [OpenStax RC circuits](https://openstax.org/books/university-physics-volume-2/pages/10-5-rc-circuits). |
| F-008 | PDF pp.1,5, constants | `μ₀=4π×10⁻⁷` treated as exact | Outdated SI exactness. Since 2019, μ₀ and ε₀ are experimentally determined; c is exact and μ₀ε₀=1/c² remains exact. [NIST SP 330](https://www.nist.gov/pml/special-publication-330/sp-330-section-2), [2022 CODATA](https://physics.nist.gov/cuu/pdf/all.pdf). |

These are source/reference comparisons, not numerical calculations. No fabricated physical system or data-free numerical calculation was used.

## Registry structure
The companion JSON follows the charter's flat-ledger direction with pilot records for theories, equations, objects, occurrences, identity edges, sources and tests. Theory cards remain skeletal; missing fields are not invented. Occurrences are local: the same glyph does not imply the same physical object.

## Provenance and execution gates
- Mersearch was **not dispatched** because all four request lanes were occupied. GitHub code-search fallback was attempted separately and is not represented as Mersearch.
- No authenticated original Nathan Direct message specifically defining this physics-map project was recovered in this pass. No SAT/H(s)H theory reconstruction was attempted; subject-specific interpretation remains blocked until direct statements are recovered.
- No numerical, dimensional, geometric, simulation or other data-free calculation was executed.
- Structural checks before publication: equation→theory references and occurrence→equation/object references resolve; object IDs are unique. This is data integrity, not physics verification.

## Next gates
1. Recover project-specific original user messages through Mersearch when a lane is free; retain exact source SHA and message locator.
2. Expand authoritative source coverage by sector, beginning with mechanics, waves, optics, EM, relativity, QM/QFT and cosmology.
3. Add complete theory cards and source-local occurrence coverage; do not bulk-import formula-sheet entries.
4. Attach worker results to specific equations/objects and independently inspect actual calculations or proof logs.
5. Only after the conventional floor plan is source-accurate, run the charter's two independent local traversals: mathematical plumbing and observational plumbing.

## Companion data
[Machine-readable source audit pilot](STANDARD_PHYSICS_SOURCE_AUDIT_PILOT_2026-11-01.json).

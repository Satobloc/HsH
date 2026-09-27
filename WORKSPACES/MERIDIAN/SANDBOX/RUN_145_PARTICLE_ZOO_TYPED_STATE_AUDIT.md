# Meridian Run 145 — Particle-Zoo typed-state audit

**Date:** 2026-09-27  
**Status:** SANDBOXED / source-typing result + mathematical discriminator  
**Primary source:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/SATv THE PARTICLE ZOO.txt`  
**Current terminology control:** `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`  
**Quarantine:** PRIOR_ART / nLab / quarantined comparison material not opened or used.

## Bounded operation

Test one question raised by Run 144:

> Can the historical SAT Particle Zoo assign particle identity from carrier topology/class alone, or does the source require additional state?

This run does **not** assign a physical particle model, fit masses, or promote the historical Zoo to current H(s)H.

## Source-derived structure

The historical source explicitly says:

- mass is associated with angular misalignment;
- spin with helical twist / rotational symmetry;
- charge with handedness, loop frequency, or coupling type;
- **flavor with a resonance mode / harmonic**;
- all six quark flavors are described within the broad class of short, high-curvature filament segments that must bind into composites;
- electron, muon and tau are described within the broad lepton-filament class, with muon/tau summarized as heavier harmonics / tighter curve or faster twist;
- neutrinos are described historically as near-aligned filaments;
- the historical document labels photons/gluons/W/Z/Higgs under a `bosons = ripples or transitions` vocabulary;
- baryons are described as three braided quark filaments.

These are source statements, not present-day mathematical validation.

## Current terminology correction

The historical `fermion = persistent filament` / `boson = ripple or transition` wording must **not** be silently promoted into current standard-physics language. Current project control distinguishes SAT structural categories such as persistent localized/coiled excitations and traveling/light-mode/spot excitations from standard spin/statistics boson/fermion classification.

Therefore this audit preserves the historical wording as provenance while using neutral structural terms in the generated state model below.

## Exact discriminator: carrier class alone is insufficient

Let `L` denote particle labels and let `C` denote only the broad carrier/object class supplied by the historical source.

The source assigns distinct labels

`electron`, `muon`, `tau`

to the same broad lepton-filament class while distinguishing them through harmonic/resonance and geometry. Likewise, multiple quark flavors share the broad short/high-curvature filament class.

Hence the source map

`f : L -> C`

is many-to-one on these families. Consequently there is no faithful inverse classifier

`C -> L`

without additional state.

This is the strongest source-level conclusion currently justified.

### Important limit

This does **not** yet prove that a sufficiently rich *topological invariant* could never distinguish the labels. The historical source does not define a complete topological state space or equivalence relation for open strands, framing, endpoints, ribbon/worldtube twist, or composite boundary conditions. Therefore:

- **carrier-class-only classifier:** ruled out by the source;
- **topology-only classifier in a fully specified framed/bounded state space:** presently underdefined, not ruled out;
- **unique particle-label -> knot/braid invariant map:** not recovered.

## Generated typed-state scaffold

A minimal bookkeeping state that can represent the distinctions actually named by the source is

`X = (C, F, G, E, B, P)`

with:

- `C` — carrier/object class;
- `F` — framing/topological/boundary data;
- `G` — metric/differential geometry (curvature, torsion, pitch, misalignment);
- `E` — excitation/resonance/phase state;
- `B` — binding/composite relation;
- `P` — persistence/event/traveling-state type.

This tuple is a **Meridian-generated representation scaffold**, not a Nathan-authored SAT definition.

## Mathematical representative showing same carrier topology, different geometry

For positive integer `n`, consider

`gamma_n(s) = (R cos(ns), R sin(ns), p s)`.

On a fixed interval domain every member has the same unframed carrier topology, while

`kappa_n = R n^2 / (R^2 n^2 + p^2)`

and

`tau_n = p n / (R^2 n^2 + p^2)`.

Thus harmonic/geometric state can vary without changing the underlying interval topology. This is a representative mathematical demonstration of the distinction the historical source requires; it is not a fitted electron/muon/tau model.

For the three-strand representative

`beta_j(z) = (R_b cos(2 pi z + 2 pi j/3), R_b sin(2 pi z + 2 pi j/3), z)`,

`j = 0,1,2`, the matched-`z` strand separation is exactly `sqrt(3) R_b`. This reproducibly realizes a three-strand braid geometry but does not by itself determine proton/neutron identity, braid equivalence class under boundary moves, framing, chirality, or binding dynamics.

## Disposition

**KEEP / source-grounded:** particle taxonomy requires more than broad carrier class; flavor/resonance and geometry are explicitly distinct source variables.

**KEEP / mathematics:** the harmonic helix family is a clean same-topology/different-geometry control.

**RETYPE:** historical `fermion` / `boson` structural language must be annotated rather than used as an unqualified current classifier.

**OPEN:** whether particle labels are distinguished by a small set of topology classes plus geometry/dynamics, or by genuinely distinct framed topological species.

## Next cursor

Recover the next source-level data needed to resolve the OPEN branch: explicit endpoint/framing/boundary/chirality rules for quarks and baryons and any flavor-specific topological assignments in `PARTICLE_SAVE.txt`, `PARTICLE_SAVE_FORMUL.txt`, or their source conversations. Build a particle-by-particle table with separate columns for source-stated carrier class, topology/framing, geometry, excitation/harmonic state, binding/composition, persistence/traveling status, and current-vs-historical terminology before touching the mass spreadsheet.

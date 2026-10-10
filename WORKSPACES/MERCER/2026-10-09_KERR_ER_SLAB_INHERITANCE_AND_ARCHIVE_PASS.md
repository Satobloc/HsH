# Mercer sandbox | SAT+ER/Kerr inheritance, active-slab EM fork, source pass
**Recorded:** 2026-10-09 EDT · **Authority:** Nathan's current direct message controls intended model scope; no claim of physical validation. **Status:** current hypothesis + sandbox geometry check.
**Source limitation:** the originating Nathan Direct message is present in the current ChatGPT discussion but lacks a recoverable raw message URL/ID. Do not fabricate one. This report is Mercer analysis and is NOT Nathan-authored.

## Current working model, in Nathan's terms

- SAT worldlines in Minkowski spacetime (w linear/radial) are foundational; H(s)H adds finite-core worldtubes. No Hopf carrier or imposed spherical ontology.
- ER-bridge-like worldtubes with Kerr-like structure are the **tentative core**. The ring singularity is hypothesized to be the intersectional trace of a higher-dimensional tube singularity, potentially enforcing exclusion. Shell intersections might be closed-string-like and shell topology might give a mode classification. These are **proposed correspondences**, not established string theory or spin-statistics.
- Worldtube continuity, back-tug and transtemporal interbraid forces remain inherited SAT **construction premises**, not measured confirmations of GR/QCD.
- Kelvin vortices/electrogravity are live H(s)H work. The **open constitutive fork** is whether any electromagnetic response physically persists in portions of the 4D block where the finite-thickness active timesheet has not yet or has already passed. Nathan tentatively favors a wavefront-local account, without excluding a medium/memory mechanism or historical soliton, t-boson / f-boson alternatives.
- Retain a finite-thickness active-update layer as operational starting point; allow no new imported primitive until a mathematical/empirical constraint requires it. Test internally before using CODATA.

**Project-status mapping:** ND for what is being studied; TF for the proposed Kerr/ER worldtube, string and exclusion maps; OC for EM temporal persistence and true derivation of Pauli antisymmetry.

## Two exact geometry tests | namespace LOCAL:MERCER-KERR-SLAB

Use ordinary Minkowski length coordinates (w,x,y,z), with local w=ct. No additional carrier. For a **test radius** a_test (NOT identified with the standard Kerr rotational scale a_K=J/(mc) or a hard particle-core radius), consider singular support:
```
X_sing(w,phi)=(w,a_test cos(phi),a_test sin(phi),0).
```
This is a **2D ring worldsheet** S1 × I in 4D. Its transverse intersection with a 3D constant-w timesheet is a 1D closed circle, by dimension 2+3−4=1.

A single **1D ring** tilted within 4D instead generically intersects a 3D timesheet at isolated points. A **3D shell worldvolume** generically intersects that timesheet in a **2D** spatial shell (3+3−4=2), *not* a 1D string. If shell intersection is to be identified with a string, the model must specify the relevant 2D defect/subshell/boundary, second constraint or other intersection law. A filled 4D tube generically has a 3D instantaneous footprint. These are topology/dimension tests, not a critique of the working conjecture.

Pre-existing [Ravel Kerr scale vs. intersection](../../WORKSPACES/RAVEL/KERR_SCALE_SLICE_TRIANGULATION_2026-09-16.md) separates hard core, coil radius and Kerr rotation length. [Ravel's particle-regime calculation](../../WORKSPACES/RAVEL/KERR_PARTICLE_REGIME_COLLISION_2026-09-16.md) finds ordinary electron-parameter Kerr-Newman strongly over-extreme, with no ordinary horizon or ergosurface. A physical H(s)H shell must therefore be *separately constructed*, not imported as an ordinary electron-sized black-hole surface.

**Exclusion challenge:** hard nonintersection of two tubes is not yet Fermi statistics. To recover a fermionic exchange rule, construct the operational amplitude of identical tube states and demonstrate its sign change under exchange, rather than equating impenetrability with antisymmetry. This is a missing derivation, not a reason to abandon the ER/Kerr candidate.

## Local wavefront and electromagnetism: minimal discriminator

For this test only define d_act = c Δt_act, a **timesheet thickness expressed as length**, and R = charge-intersection separation. With a causal disturbance **newly produced** on the sheet, local propagation speed ≤c, and **no field/state continuing beyond the same finite slab**, a necessary condition for same-slab causal influence is
```
R ≤ d_act = c Δt_act .
```
At R=1 metre this demands Δt_act≥3.34 ns. It is a *conditional geometric reach bound*, not a model prediction for sheet thickness and not a rejection of a global block-geometric interaction.

Test **three implementations** independently:
- A: finite-slab local propagation, no preexisting electromagnetic memory;
- B: instantaneous spatial **constraint** on a timesheet, e.g. Poisson's equation for static Coulomb potential, with the still-required causal dynamics of physical E and B;
- C: a persistent/inter-slab medium response represented provisionally by a kernel K(w,w').

Do not confuse an instantaneous scalar potential in a chosen gauge with an instantaneous observable signal. Full Maxwell/charge continuity must recover delayed changes in source currents, not just 1/R² static force. A global current-sheet constraint is different from an inherited material electromagnetic state.

**Failure condition:** if a chosen strictly local finite-slab mechanism cannot reach arbitrary charge separations or reproduce delayed electromagnetic changes **without extra primitives**, document the exact domain that fails. If it uses a nonlocal constraint, derive the correct cancellation/causal observable behavior. Do not solve by tuning sheet thickness to CODATA.

## Source ingestion this pass: directly read, versus inventoried

**HsH directly reviewed:** `BEDROCK.md`; `STATE_OF_THE_THEORY.md`; `WORKSPACES/COMMON/CURRENT_HSH_HYPOTHESIS_STATUS_2026-09-14.md`; Ravel's two 16 September Kerr articles linked above; `DEVELOPMENT_FULL_CONVOS/H(s)H TEMPORAL ISOTROPY.txt` (time-normalized wave propagation); `DEVELOPMENT_FULL_CONVOS/H(s)H TIME RESIDUALS.txt` (UI/Whirligig/Spheres/Graticule instrument division). A dated loose `Einstein-Rosen Bridges — raw.json` export was parsed into 96 messages; six keyword-relevant message portions were inspected, including Nathan's ER bridge question and physical-rope discussion. **This was a partial read, not full conversation coverage.**

**Historical SAT directly reviewed:**
- [RMS Spacetime Filaments](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/RMS%20Spacetime%20Filaments.txt): time surface, filament intersection and *forward/backward 4D tug*, a likely inherited construction worth exact-law recovery. Mixed historical provenance; do not attribute every paragraph to Nathan without turn evidence.
- [SAT20 Emergent Filament Surface Neutral](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%2020%20Build%20Plans/SAT20_Emergent_Filament_Surface_Theory_Neutral.txt): recoverable distributional filament-current candidate Jμ = Σ∫(dγμ/dλ) δ4(x−γ) dλ. Useful as a source-conserving finite-core regularization target Jμ_ε=Jμ*η_ε. The same document's metric/gauge/Planck derivation claims remain **unproved**.
- [timesheet_proj.py](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/MORE_PYTHON/timesheet_proj.py): elliptical oscillation and moving-dot intersection **visualization**. Retain as a code fixture, not literal filament motion in a block universe.
- [BOSONIC TIME AND TWO GRAVITIES](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOCK_lumped/BOSONIC%20TIME%20AND%20TWO%20GRAVITIES.txt): contains Nathan's explicit data-isolation/mapping-method remarks interleaved with assistant-generated overconfident claims. Need message-level authorship recovery before quoting as authority.
- [ELECTROGRAVACOUSTICS](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/ELECTROGRAVACOUSTICS.txt): older candidate wavefront/torsion constructions, but numerical claims not individually verified.

**Deterministic non-keyword old-archive walk:** stable hash sorting across 1,906 eligible textual source files with seed "2026-10-09 mersearch archive walk". Read:
- [SAT Mark V/THREAD1 ACTIVE INTERFACE](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20Mark%20V/THREAD1%20ACTIVE%20INTERFACE.txt): historical optical anomaly matrix. Its 0.125-rad phase claim is an **unverified statement in that source**, not to be conflated with 0.239/0.246 historical constants.
- [MORE_PYTHON/quark_4d_proj.py](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/MORE_PYTHON/quark_4d_proj.py): 3 helices with 120° offsets, **3 plotted spatial coordinates + parameter**, not a proven 4D solution. Recoverable phase-triple solver fixture, not a quark/QCD proof.
- [SAT_O REWRITE/4D COVARIANCE+SATO](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT_O%20REWRITE/4D%20COVARIANCE%2BSATO.txt): historical warning against importing formalism as internal mechanism. Its old background assumptions may differ from controlling newer Minkowski-SAT instructions.

**Toolkit familiarization** completed via its internal source index, bibliographic records, holonomy reference and equation roundup. The holonomy reference supplies ordinary parallel-transport definitions as **external math**, not physical model authority. The roundup includes gross-Pitaevskii-style and higher-mathematical constructions that must **not** be auto-imported into SAT. Private-resource source paths are retained in the private resource catalog, not published here as citations.

## Current conversation coverage audit (metadata, not full reading)

Actual 2026-10-09 HsH tree: 3,086 files within `DEVELOPMENT_FULL_CONVOS`, of which **16** are loose date-tagged raw JSON conversations directly in that directory and five large raw JSON files exist at the HsH repo **root**. Viewer catalog contains 788 conversation entries, including all 16 loose development raw conversations, 733 organized development entries, 14 live entries, and 24 other records. **None of the five HsH-root raw JSON exports are in the Viewer**. Inventory of complete tree is not equal to reading 788 conversations and thousands of source files.

**Research-only audit verification:** [GitHub Actions run 38019151059](https://github.com/Satobloc/HsH/actions/runs/38019151059) passed 3 tests against the current HsH checkout: exactly **5 root raw JSON candidates, 16 loose development raw JSON conversations, 14 loose live candidates, and 1 other unfiled raw JSON conversation**. The precise six candidates not in the public Viewer are the five root exports below plus `🔑/FODDER/Orson Free Build — raw.json` (1,719,754 bytes, metadata verified; an attempted connector read returned an empty response, which is an access/size diagnostic, NOT a conclusion that the source is empty). The workflow previously misidentified `CONVO DOWNLOAD TARGETS.txt` as conversation material; a content-opener check eliminated that false positive. These are source-location results, **not evidence all six contents were deeply read**. No public exposure was added.

Root-level unmapped exports (all metadata-only in this pass): `[A] Geometry in Physics — raw.json`; `[A] SAT Daily Action — raw.json`; `[A] ⚒️ Pulsar Glitch Modeling — raw.json`; `[B] ⚒️ Identify Eggplant Book — raw.json`; `[B] 🧮 0.239 Radians in Science — raw.json`. They must be reachable through **internal LLM research indexing**, but should not be automatically promoted into publicly served Viewer content without curation.

## Next cursors

1. **Research-only root/loose audit implemented and tested** via `tools/audit_research_conversation_locations.py` and the GitHub Actions evidence above. Next: verify structured parsing/source identity for each of six unfiled candidate exports using size-aware access; expose them to *internal* Mersearch discovery if missing, without auto-publishing them in Viewer.
2. Class P section tests for ring worldsheet, shell worldvolume, true 4D tube bulk; only then attempt ER/Kerr metric or exclusion mechanism.
3. A zero-fit *two-charge steady + perturbed source* calculation across EM branches A/B/C; check charge conservation, spatial Coulomb scaling, finite-speed source perturbation and medium-memory conditions.
4. Recover the t-boson/f-boson/sheet soliton candidate laws from older SAT conversations to see if they predict any EM memory.
5. Keep random SAT document pulls in already-authorized worker recurrence slots, with read coverage and failure conditions recorded; Comptroller controls scheduler changes. No new recurrence created here.

**Boundary:** Every proposed physical mechanism remains sandboxed. Nothing in this note is a CODATA fit, a validated particle spectrum, or a proof of QED/GR/QCD.

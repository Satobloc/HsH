# Kestrel → Meridian | Workshop Relay :24 handoff
**Target run key:** `REVROT3-19-20261011:466:s3`  
**Routing target:** Meridian (ring index 15)  
**Source receipt:** [Kestrel :24 receipt](../REVIVAL_ROTATION_RECEIPTS/2026-10-30T1024Z_s2_kestrel.md)  
**Delivery status:** Repository handoff only. No Meridian historical-thread delivery or acknowledgment is claimed.

## 1. Priority and non-duplication

Code Grurple remains active; both reader routes are still presentation-pending. Ordinary research branches remain backseat/hold until standdown. Do not modify PR #873, open a new issue, publish a new paper artifact, or promote BEDROCK from this handoff. The Kestrel receipt contains the source details and calculations.

Meridian's existing STAR_005 and STAR_006 work is protected:
- STAR_005: Kelvin axisymmetric circulation gate.
- STAR_006: Kelvin binormal dispersion versus SAT-D2 comparison, including the LIA/D2 scaling distinction.

Treat the new Kestrel readout module as optional empirical context for those existing gates, not as a replacement or duplicate derivation. No Meridian INBOX.md was found; this COMMON handoff is the available repository route.

## 2. Current Kestrel branch state

[PR #873](https://github.com/Satobloc/HsH/pull/873), branch `research/kestrel-original-slice-fidelity-20261028t0900z`, current head:
`16713547207702bdd85beb092c7d0c59ea8b8602`.

The current head imports `KestrelKelvinVortexReadout.lean` (12 theorem declarations). Exact-head CI [#41046794118](https://github.com/Satobloc/HsH/actions/runs/41046794118) failed:
1. `coreReadout` uses Real division in a computable definition; Lean cannot synthesize `Real.instDivInvMonoid`. Proposed minimal repair: mark `coreReadout` noncomputable.
2. In `recoverSides_after_coreReadout`, `simp` closes the goal; the subsequent `constructor <;> ring` reports “No goals to be solved.” Proposed repair: remove the redundant tactic or restructure the proof.

Both repairs are **untested**. Do not count any theorem from this module as compiled. The previous successful PR #873 run on head `bd359f...` is superseded by the current failing head.

Separate PR [#846](https://github.com/Satobloc/HsH/pull/846), head `5340af49f3a3cace8e5a749dd3ac1d62ecafbe97`, has successful exact-head CI [#40902356693](https://github.com/Satobloc/HsH/actions/runs/40902356693): 17 targets across four helium/isotope modules compiled. Tests, lint and automated axiom audit were skipped. This success does not transfer to PR #873.

## 3. New physical readout facts

The module combines two distinct experimental systems; keep them separate.

**Classical air-core water vortex:** Barckicke, Falcon & Gissinger, *Nature Physics* 22 (2026), DOI 10.1038/s41567-026-03175-w. Opposing interface contours yield `eta=(r_+-r_-)/2` and `a=(r_++r_-)/2`. The m=1 mode bends the axis. The m=2 mode changes core shape and is identified by the paper as a core-scale hydrodynamic mode a priori absent in quantum turbulence. Do not transfer m=2 to He-II.

Published WKBJ inputs reproduce:
- logarithmic bracket B = 1.6501600343812168;
- broadening delta_k/(2*pi) = 7.97370828446715 m^-1;
- delta_a/a0 = 0.5263158.

The paper calls the estimate rough; delta_a/a0 is not a small perturbation. The raw figshare dataset (DOI 10.6084/m9.figshare.30903347) was not retrieved. The Python check uses printed paper values, not raw data.

**Quantum He-II vortex:** Fonda et al., PNAS 111 (2014), DOI 10.1073/pnas.1312536110. The 8.2 mm / 512-pixel field, 54.3 Hz acquisition and 150 um laser sheet yield a 16.015625 um in-plane pixel pitch and 18.416206 ms frame interval. The 6 um/s value bounds the normal-component-driven tracer contribution (0.006895 pixel/frame), not the full tracer trajectory. The paper explicitly says tracer particles are not locked to a specific point on the vortex core; 3D orientations were free parameters, and LIA and Biot–Savart fits both agree within resolution.

The 2026 PRL paper (DOI 10.1103/t3bt-m431) reports six-wave resonant Kelvin-wave interactions in a classical vortex. Same research group as the Nature Physics paper; not an independent lab replication. Raw data not retrieved.

## 4. Geometry discriminator

Nathan Direct source (2024 DIMENSIONAL GRAVITY raw conversation, blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`) describes 1D filaments in 4D intersecting a 3D timesheet; generic transverse intersection is 0D. The later He-II vortex is a 1D curve in 3D whose history is a 2D worldsheet in 3+1; its time-slice intersection is a 1D vortex line. A 2D laser sheet then selects isolated points; finite thickness and camera projection lose depth.

A possible composition is a family of 1D worldlines `gamma_s(t)=(t,X(s,t))`, indexed by a line parameter s; their union forms a 2D worldsheet, and a time slice yields the vortex line. This is a **test map**, not an equivalence. The PNAS tracers are not core-locked material markers, so a tracer-response operator is required before camera projection. The current Lean module does not prove this composition.

Nathan's 2026-09-06 Kelvin-vortex statement is explicitly exploratory; live BEDROCK carries it as a mandatory tentative constraint, not established physics. Keep measured classical/quantum vortex distinctions and model-vs-measurement labels.

## 5. Source and tooling controls

The SAT4D / SAT.O / Blockwave source genealogy is already documented in the existing Mercer, Ravel, Tern and Kestrel crosswalks. Preserve the distinctions:
- Nathan-authored SAT4D Live Draft (June 2025): vector-like `J_mu` filament-flux average and a Maxwell-like RHS that is not yet `mu0 J_nu`.
- SAT4D project glossary/directives (July 2025): 1D `gamma`, 3D `Sigma_t`.
- Assistant-generated Blockwave compact action (first located 2025-10-19): conserved 2-form worldsheet current `J^{mu nu}`; not source-equivalent to the SAT4D vector current.

Mersearch lanes remain occupied and no local pinned checkout exists. Existing Math Hopper #578, Whirligig, Lean PRs and SciSpace were checked/reused; no new tooling or paid service. No CODATA constant enters the bounded readout conversions, so no CODATA comparison was made.

## 6. Next bounded actions after interlock standdown

1. Repair the two Lean errors in PR #873 only after the active interlock is lifted; run exact-head CI and inspect the separate axiom-audit stage.
2. Retrieve the Nature Physics figshare data and reproduce the contour/WKBJ inputs from raw data; propagate the stated core-radius uncertainty and identify missing uncertainty for delta_a and k0.
3. Compare the 2026 PRL six-wave result with Meridian's existing STAR_006 dispersion work without treating it as independent replication.
4. Formalize the worldsheet → time-slice → laser-sheet slab → camera map with explicit rank/transversality and finite-thickness conditions. Add the tracer-response map separately; do not identify tracer paths with core material worldlines.
5. Keep the He-II tracer experiment and classical air-core water-vortex experiment as distinct physical systems.

No new branch, issue, publication, BEDROCK promotion, task change or cross-thread delivery is authorized by this handoff.

# H926:S2 | Measured-parameter helix kinematics and geometry-map audit

**Run key:** `REVROT3-19-20261011:926:s2` | **Nominal UTC:** 2026-11-18 14:24  
**Ring:** Meridian (15) → Mercer (16). Ring selection is not authenticated historical-thread participation.  
**Status:** SOURCE-REPORTED PARAMETER DERIVATION / FIT-CONDITIONED / RAW DATA NOT ACQUIRED / P2 HOLD / NO H(s)H PREDICTION.

## Preflight

Read live BEDROCK, Steering Charter, Three Paper Campaign, three-repository onboarding, current orientation, revival V3/V4/thread-first/navigation/duplicate controls, publisher/write controls, main branch, task, receipts, Meridian workspace and continuity. Checked all three repository front doors; HSH_RESOURCES was limited to its README, with no private payload opened. Mersearch was unavailable and all four lanes were occupied/requested, so this is bounded GitHub source fallback, not a Mersearch or corpus-complete result. Historical Meridian remit is source-grounded geometry/solver engineering and representation-map fidelity; no signed standalone charter or authenticated current thread was found. Lane 24 is this run's overlay; Code Grurple P0 remains unchanged.

Main snapshot: `95a92d99aa75814a3bd4fa5e6fd40e9b95a89ffa`. No `h926:s2` receipt, handoff or publisher intake existed at the duplicate-key check. Morrow `h926:s0` receipt readback confirmed P0 ACTIVE, P1 Orson-owned/overdue, P2 HOLD, P3 incomplete, FIE next 2026-11-24. Existing :24 automation `6abda4c8eda88191bf23a6f2849e9a17` remains enabled with its exact original hourly :24 schedule, DTSTART and prompt; no task changes.

## Measured system and provenance

Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w), published 2026-02-10. Data locator: [Figshare 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). This is a classical air-core water vortex, not superfluid helium, a BEC, an H(s)H vacuum or a climbing rope.

Methods report a Basler contour camera, 300 fps/30 s, 12.5 cm axial window, 60 μm/px, 0.5 mm contour width and typical ~0.1 mm core-radius/position uncertainty; PIV (Phantom V1840, 6000 fps, 37×23 grid, 2.7 mm resolution) gives circulation uncertainty ~0.0051 m²/s; PTV axial velocity at the core has typical ~0.05 m/s uncertainty.

Fig. 3 m=1 fit parameters: `a0=1.9 mm`, `Gamma=0.022 m²/s`, `vz=0.57 m/s`. The Methods say `a0` is measured, then `(Gamma,vz)` are fitted to dispersion and checked a posteriori against PIV/PTV. They are fit-conditioned, not blind predictions; joint covariance/formal fit uncertainty is not reported. Figshare file inventory/version/raw bytes/run IDs/checksums were not acquired, so this is not raw-data reanalysis.

## Derived local-flow geometry

Under the Rankine solid-body-core reconstruction with constant `a0`, `Gamma`, and `vz`:

`Omega0 = Gamma/(2*pi*a0^2)`; `vtheta(a0)=a0*Omega0`; `X(t)=(a0*cos(Omega0*t), a0*sin(Omega0*t), vz*t)`.

| Derived | Nominal |
|---|---:|
| Core angular rate | 969.919 rad/s |
| Circumferential speed | 1.84285 m/s |
| Rotation period | 6.47805 ms |
| Axial pitch per turn | 3.69249 mm |
| `vz/vtheta` | 0.309304 |
| Total speed | 1.92899 m/s |
| Centripetal acceleration | 1.78741×10³ m/s² |
| Spatial helix curvature | 480.360 m⁻¹ |
| Spatial helix torsion | 148.577 m⁻¹ |

`kappa3 = a0*Omega0^2/(vtheta^2+vz^2)`; `tau3=Omega0*vz/(vtheta^2+vz^2)`. Pitch/circumference ratio equals `vz/vtheta`; local streamline curvature radius is about 2.081 mm.

The independent-corner sensitivity box uses the source typical scales (`a0±0.1 mm`, `Gamma±0.0051 m²/s`, `vz±0.05 m/s`), not a joint confidence region:

| Quantity | Sensitivity range |
|---|---:|
| Omega0 | 672.43–1331.20 rad/s |
| vtheta | 1.345–2.396 m/s |
| T | 4.720–9.344 ms |
| pitch | 2.454–5.793 mm |
| vz/vtheta | 0.2170–0.4610 |
| speed | 1.442–2.475 m/s |
| centripetal acceleration | 904.3–3189.8 m/s² |
| kappa3 | 412.36–530.57 m⁻¹ |
| tau3 | 113.94–196.65 m⁻¹ |

## Spatial curve vs spacetime worldline

For this low-speed, acceleration-perpendicular-to-velocity model, Minkowski proper acceleration is `alpha=gamma^2*a_perp`; proper worldline curvature is `kappa4=alpha/c^2`. CODATA source/version: NIST 2022 recommended values, Web Version 9.0. `c=299792458 m/s` is exact, so it has exact uncertainty and no adjustment covariance; no other CODATA constant is used. Nominal `gamma−1≈2.07×10⁻¹⁷`, `alpha≈1.78741×10³ m/s²`, `kappa4≈1.98876×10⁻¹⁴ m⁻¹`.

This is ordinary Minkowski material-worldline kinematics, not ambient Riemann curvature, not the vortex-core surface curvature, and not an H(s)H equivalence. A fluid particle path, Eulerian core, and two-contour observation map are different objects.

Explicit conditional map: `(a0,Gamma,vz) → (Omega0,vtheta) → reconstructed X(t) → (kappa3,tau3,p) → W(t)=(X(t),ct) → kappa4`. The source parameters are fit-conditioned and the trajectory is reconstructed from separate PIV/PTV summary channels. The current source does not provide synchronized raw tracks/covariance to validate this reconstruction. Future falsifier: freeze the map/parameters before a distinct holdout and compare directly acquired synchronized trajectories and spatial curvature/torsion. An H(s)H-specific forward map and independent prediction must still be defined.

## WWRD rope-like first-blush scout

Allan, Mishra & de Rooij, “Experimental analysis of contact forces between strands in three-strand ropes with varying twist parameters and filament counts,” DOI [10.1177/00405175251333381](https://doi.org/10.1177/00405175251333381), reports pressure-film contact-width/pressure measurements in nine aramid three-strand specimens, at least three per twist combination. Films were calibrated on sapphire blocks; accuracy ~±10%, thickness 110±5 μm. The analytical contact-force model initially overestimates and is corrected with a fitted helix-angle factor 0.74 across tested configurations. Data are available upon reasonable request, not acquired here. This is industrial aramid rope, not climbing rope. The mechanism depends on stiffness, friction, packing, twist and contact geometry; only a geometric heuristic is warranted. No universality, equivalence or numeric comparison is claimed; no author request was sent.

## Formal/tool check and disposition

Existing PR #873 `WorldtubeCurveCurvatureLift` and `KestrelKelvinVortexReadout`, and PR #1189 `NadirVortexTwoChannelReadout` / `NadirRotatingFluidPIVEnergyReadout` were checked; they do not formalize this specific material-helix curvature/torsion map. Archive Math Hopper #578 / PR #991 and Whirligig Kernel 0 checked. No local Lean/Lake/Elan is installed; no Lean compile or remote CI run. A future theorem should prove the conditional vector-kinematic identities and state the parameterization assumptions. Lean would verify only that formal statement, not source fidelity or physical validity.

**P2 HOLD.** No raw data acquired, system selected, H(s)H fit/prediction, independent measurement, theory promotion, or paper gate advanced. P0 ACTIVE; all task states unchanged.

Reproducible script: [`lane24_h926_material_helix_kinematics.py`](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/SANDBOX/lane24_h926_material_helix_kinematics.py) (Python standard library, algebraic sanity assertions). Script SHA-256 `0c3fd00aa906788151e38fb819ad69f7f6c0ba7dc474a0d7c03ab903e08366ce`; output JSON SHA-256 `82861b0ad98708fd7b008016f9ae1f8bae961fa6406fe7f2a5a80504f6a485b3`.

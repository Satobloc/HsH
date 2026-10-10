# Mercer sandbox: finite-core 4D contact gate (2026-10-10)
**Status:** sandbox, not theory authority. Local executable calculation and detailed note in the Mercer ChatGPT task thread.

## Source reading this run
- Historical primary, substantially read: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt` (~25k of 37.2k characters); worldline/time wavefront primitives, straight vacuum axis, angular geometry and active interaction as separate propositions.
- HsH Sept 30, complete: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`; substantial: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 PRE HsH/SAT 2026 WHIRLIGIG — Donut canon.txt`.
- Verified Mersearch 1.0 three-repo request result/manifest: `indexes/mersearch_requests/2026-10-10-orson-one-drop-universe-math-001/`; stable commit 89933c358b67ccbfbbaa680aadeb1f35d22d91b2; 272 hits, standard QUARANTINE/PRIOR_ART exclusions. Shared request slot not overwritten.
- Read controlling Common front door, Oct 9 scope, Reference Desk, War Room overview, HSH_RESOURCES toolkit/index/digestion/tool chest/BOOT and metadata of major reference drawers. Outside references were routing only; no forbidden source entered.

## Exact no-fit 4D geometry
Coordinates `(w,x,y,z)`, primary Euclidean metric, two infinite straight worldtube axes through origin with unit tangents `u1=(1,0,0,0)` and `u2=(cos φ,sin φ,0,0)`. Equal radius `a`, support tubes:
`T1: x²+y²+z²≤a²`;
`T2: (x cos φ−w sin φ)²+y²+z²≤a²`.
Changing variables in `(w,x)` gives **exactly**
`V4∞(a,φ)=2πa⁴/|sin φ|` for nonparallel axes.
Restrict `|w|≤L/2`: at `φ=0`, `V4L=(4π/3)a³L`; if `L≥2a cot(φ/2)`, `V4L=V4∞`. Gauss-Legendre quadrature confirms the exact nonparallel formula to <2e-9 relative at 10°,30°,60°,90° with sufficient L. For `L/a=20`, `V4L/a⁴` is 83.775804 at 0°, 57.323425 at 5°, 12.566371 at 30°, 6.283185 at 90°.
**Scale crossover:** at fixed L, parallel contact ∝a³L; fully contained transverse contact ∝a⁴. Fivefold core radius implies 125× vs 625× geometric contact in their respective regimes, if the saturation condition remains met.

## Necessary kinematic distinction
Intersection of a straight tube tilted θ from wavefront normal has spatial ellipsoid volume ratio `sec θ`. With straight kinematic worldline `w=ct,x=vt`, `tan θ=β=v/c`, so ratio `sqrt(1+β²)`, not special-relativistic `γ=1/sqrt(1−β²)`. At β=.99 these are 1.407160 and 7.088812. Straight timelike centerlines have θ<45°; a near-90° *local helix tangent* cannot silently be equated to the centerline's kinematic tilt. Thus bare Euclidean intersection volume cannot be claimed to derive Lorentz inertia.

## Constitutive no-go and two trial regimes
Raw scalar contact `C0=V4L` is maximal for aligned straight vacuum tubes, contrary to the proposed minimal-interaction vacuum reference. A coordinate-invariant orientation-weighted trial `C2=sin²φ V4L` vanishes for aligned tubes, but choosing this weight is an unproved physical assumption, not Avery necessity. Neither geometric contact is an energy; `E=C V4` needs an undetermined coupling with dimensions energy/length⁴. The two constitutive regimes reverse angular preference without fitting constants.

## Next exact test
Replace straight axes with finite-core *self-coiled* worldtubes; numerically compute overlap and tangent-bivector/normal-frame data. Derive the contact weighting from timesheet work rather than selecting it to fit vacuum behavior. Check standard Lorentz kinematics and conservation before any nuclear-energy comparison. No historical constants were targeted. No claim of nuclear binding, Pauli statistics or physical force has been established.

**Reproducible local artifacts in task thread:** `MERCER_FINITE_CORE_CONTACT_GATE_2026-10-10.zip`, containing `finite_core_overlap.py`, quadrature output, full note, and three precision geometry plots.
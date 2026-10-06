# UI Mapper — basic build

**Status:** SANDBOX / executable scaffold
**Owner lane:** Meridian / solver operationalization
**Purpose:** map a known four-coordinate system into the basic Universal Indicatrix representation without inventing unresolved spin/color/flavor physics.

## Sources

Project provenance:

- Satobloc/SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/UI CONFIGURATION (nolat).txt
- Satobloc/HsH/WORKSPACES/MERIDIAN/HANDOFF_NWTF_UI_UNIVERSAL_INDICATRIX_2026-09-21.md

The basic generator represented here is

y(lambda) = r(lambda) R(lambda) x0,
with R(lambda) in SO(4) and x0 on S^3.

The script intentionally distinguishes:

1. Minkowski calibration layer — a well-understood input curve in coordinates (ct,x,y,z), checked with eta = diag(-1,+1,+1,+1).
2. UI normalization layer — Euclidean R^4 norm and S^3 direction.
3. Sector scale policy — optional normalization for spin-like, color-like, flavor-like, or custom systems.

## Important limit

The spin/color/flavor menu entries are not physical derivations. They currently choose a relative normalization only. This is deliberate. Unknown sector-specific scales should be mapped/calibrated from a well-understood system before being promoted into UI/H(s)H interpretation.

Likewise, a direction curve does not uniquely determine the full SO(4) frame history. The basic mapper chooses a deterministic minimal-plane representative R(lambda); its remaining stabilizer freedom must stay visible when the tool is extended toward Hagalaz / Whirligig / frame-sensitive work.

## Run

Use:

    python WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/ui_mapper_basic.py

Dependencies:

- Python 3.10+
- numpy
- sympy
- optional matplotlib for plots
- tkinter for the desktop GUI

## GUI flow

1. Choose a preset or Custom.
2. Enter ct(lambda), x(lambda), y(lambda), z(lambda).
3. Choose the system/scale policy.
4. Choose the parameter range and sample count.
5. Run the map and choose an output directory.

Outputs:

- ui_mapping.csv
- ui_summary.json
- ui_minkowski_spatial_path.png
- ui_scale_history.png
- ui_angular_velocity.png
- ui_reconstruction_error.png

## Basic mathematical pipeline

Given a known input history X(lambda), the standard Minkowski tangent diagnostic is

    ds2/dlambda2 = -(dX0/dlambda)^2
                   +(dX1/dlambda)^2
                   +(dX2/dlambda)^2
                   +(dX3/dlambda)^2.

After the chosen global scale normalization,

    r(lambda) = ||X(lambda)||_R4
    u(lambda) = X(lambda) / r(lambda)  in S^3.

The code then constructs one reproducible R(lambda) in SO(4) satisfying

    R(lambda) x0 = u(lambda),

and checks

    r(lambda) R(lambda) x0 = X(lambda)

numerically.

The numerical angular-velocity matrix is

    Omega(lambda) = dR/dlambda * R(lambda)^(-1),

projected back onto so(4) to remove finite-difference roundoff.

## Next technical extension

Do not simply declare this basic representative to be full Hagalaz. The next extension should add explicit frame/director input, translation/unpinned origins, and declared system-specific calibration channels, then test the result through the existing Meridian solver harness.

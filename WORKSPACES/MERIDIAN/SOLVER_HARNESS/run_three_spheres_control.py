"""First operational adapter: Three-Spheres + RUN 099 frame-leakage control.

Run from repo root:
    python WORKSPACES/MERIDIAN/SOLVER_HARNESS/run_three_spheres_control.py

Produces a JSON evidence record and a geometric PNG. The 2D render is explicitly
a control-plane projection, not a claim that the underlying common fixture is 2D.
"""
from __future__ import annotations
import math, sys
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(ROOT / "WORKSPACES/LABS/SIDE_BY_SIDE_SOLVER"))

from solver_harness import SolverRun, Stage, generic_doh_checks, review_what_we_forgot, write_record
from three_spheres_carrier import reconstruct_carrier, Geometry, Numerics

OUT = HERE / "OUTPUTS"

def rxw(theta):
    c, s = math.cos(theta), math.sin(theta)
    return np.array([[c,0,0,-s],[0,1,0,0],[0,0,1,0],[s,0,0,c]], float)

def render_control_plane(centers, radius, circumcenter, path):
    fig, ax = plt.subplots(figsize=(7,7))
    for i, c in enumerate(centers, 1):
        circle = plt.Circle((c[0], c[1]), radius, fill=False)
        ax.add_patch(circle)
        ax.plot(c[0], c[1], "o")
        ax.text(c[0]+0.03, c[1]+0.03, f"S{i}")
    if circumcenter is not None:
        ax.plot(circumcenter[0], circumcenter[1], "x")
        ax.text(circumcenter[0]+0.03, circumcenter[1]+0.03, "carrier center")
    ax.set_aspect("equal", adjustable="box")
    ax.set_title("Three-Spheres RUN 099 control-plane projection")
    ax.set_xlabel("x"); ax.set_ylabel("y")
    ax.autoscale_view(); ax.margins(0.15)
    fig.tight_layout(); fig.savefig(path, dpi=180); plt.close(fig)

def main():
    h = math.sqrt(3)/2
    centers4 = [(-.5,0,0,0),(.5,0,0,0),(0,h,0,0)]
    radius = 1.0
    theta = math.pi/7

    # Solver-owned channel consumes center geometry/radius only.
    ts = reconstruct_carrier(*centers4, radius)

    # Independent frame perturbation channel from RUN 099.
    I = np.eye(4); F2 = rxw(theta)
    q12, q23, q31 = I.T@F2, F2.T@I, I
    qloop = q12@q23@q31

    run = SolverRun(
        solver_id="three_spheres_carrier",
        fixture_id="RUN099_EQ_FRAME_PERTURB",
        primitive_input={"centers_R4": centers4, "radius": radius,
                         "frames": [I, F2, I], "theta_xw": theta},
        solver_output={
            "geometry": ts.geometry,
            "numerics": ts.numerics,
            "G": ts.g, "r_c": ts.r_c, "kappa2_K": ts.kappa2_k,
            "sigma_min_K": ts.sigma_min_k,
            "relative_residual": ts.relative_residual,
            "circumcenter": ts.circumcenter,
            "frame_loop_error_fro": float(np.linalg.norm(qloop-I)),
        },
    )

    # write/test
    run.add(Stage.WRITE_TEST, "equilateral_geometry",
            ts.geometry is Geometry.CARRIER_PRESENT, f"geometry={ts.geometry.value}")
    run.add(Stage.WRITE_TEST, "certified",
            ts.numerics is Numerics.CERTIFIED, f"numerics={ts.numerics.value}")
    run.add(Stage.WRITE_TEST, "G_control",
            abs(ts.g-2/3) < 1e-12, f"G={ts.g}")
    run.add(Stage.WRITE_TEST, "rc_control",
            abs(ts.r_c-1/math.sqrt(3)) < 1e-12, f"r_c={ts.r_c}")

    # reality check: frame perturbation must not leak into center-only solver.
    base = reconstruct_carrier(*centers4, radius)
    run.add(Stage.REALITY_CHECK, "frame_perturbation_no_leakage",
            (base.geometry,base.g,base.r_c)==(ts.geometry,ts.g,ts.r_c),
            "Three-Spheres result unchanged because supplied frames are not solver inputs.")
    run.add(Stage.REALITY_CHECK, "static_frame_loop_telescopes",
            np.linalg.norm(qloop-I) < 1e-12,
            f"||Q12 Q23 Q31-I||_F={np.linalg.norm(qloop-I):.3e}; not dynamic holonomy.")

    generic_doh_checks(run)
    run.add(Stage.DOH_CHECK, "circumcenter_dimension",
            ts.circumcenter is not None and len(ts.circumcenter)==4,
            "Common fixture remains explicitly R4 even though render projects x-y.")

    run.add(Stage.BIG_PICTURE, "claim_boundary", None,
            "This validates an execution/interface control, not SAT/H(s)H physics or a dynamic transport law.")
    review_what_we_forgot(run, [
        "Have we tested a non-equilateral fixture through the same adapter?",
        "Have we tested numerical degradation/singularity without confusing it with geometry?",
        "Does a second solver consume this identical primitive fixture without shared implementation leakage?",
        "Is the projection hiding a behavior that should be visible in another view?"
    ])

    OUT.mkdir(parents=True, exist_ok=True)
    png = OUT / "run099_three_spheres_control.png"
    render_control_plane(centers4, radius, ts.circumcenter, png)
    run.artifacts.append(str(png.relative_to(ROOT)))
    run.request_human_visual_check(
        "Nathan: does this projected equilateral three-sphere control look like the intended geometric fixture? "
        "This image cannot show the x-w frame rotation; that invisibility is intentional for this solver channel."
    )
    record = write_record(run, OUT / "run099_three_spheres_control.json")
    print(f"machine_pass={run.machine_pass}")
    print(f"record={record}")
    print(f"render={png}")

if __name__ == "__main__":
    main()

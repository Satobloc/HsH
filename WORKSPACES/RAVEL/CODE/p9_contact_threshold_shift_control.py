#!/usr/bin/env python3
"""Move the acquisition ladder and test whether the P9 zero-curve cusp moves.

Sandbox-only control for p9_zero_curve_continuation.py.  If the sharp feature
tracks a sampled contact height h_j=rho_minus rather than staying at fixed
support asymmetry, it is a readout-grid morphology, not an intrinsic zero-set
singularity.
"""
from __future__ import annotations

import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import brentq

import p9_zero_curve_continuation as p

RATIO_INDEX = 11  # zero-based train-height index whose h crosses rho_minus
HREFS = (1.30, 1.31)


def critical_a(href):
    hs=href*np.geomspace(.14,1.55,16)
    return float(hs[RATIO_INDEX]-1.0),float(hs[RATIO_INDEX])


def roots_for(href, offsets):
    p.HREF=href
    ac,hc=critical_a(href)
    rows=[]
    for off in offsets:
        a=ac+off
        f=lambda o:p.response(a,o)["fit"]["F_B_over_A"]
        root=float(brentq(f,-.034,-.004,xtol=1e-7,rtol=2e-10,maxiter=32))
        rows.append({"href":href,"critical_a":ac,"critical_height":hc,
                     "offset_from_critical_a":float(off),"a":a,"root_o":root,
                     "F_at_root":float(f(root))})
        print(f"href={href:.2f} da={off:+.6f} a={a:.9f} o={root:+.9f}",flush=True)
    return rows


def main():
    offsets=np.array([-.0030,-.0015,-.0005,-.0001,0.,.0001,.0005,.0015,.0030])
    rows=[]
    for href in HREFS:
        rows.extend(roots_for(href,offsets))
    groups={str(h):[q for q in rows if np.isclose(q["href"],h)] for h in HREFS}
    # Compare in coordinates centered on the predicted contact threshold.
    aligned=[]
    for i,off in enumerate(offsets):
        aligned.append(abs(groups[str(HREFS[0])][i]["root_o"]-
                           groups[str(HREFS[1])][i]["root_o"]))
    shift=critical_a(HREFS[1])[0]-critical_a(HREFS[0])[0]
    minima={str(h):min(groups[str(h)],key=lambda q:q["root_o"]) for h in HREFS}
    observed_shift=minima[str(HREFS[1])]["a"]-minima[str(HREFS[0])]["a"]
    out={"status":"sandbox readout-grid discriminator; not canonical theory",
         "height_ladders":list(HREFS),"crossing_height_index_zero_based":RATIO_INDEX,
         "predicted_thresholds":{str(h):{"a_star":critical_a(h)[0],
                                             "h_star":critical_a(h)[1]}
                                 for h in HREFS},
         "predicted_threshold_shift":shift,"offsets":offsets.tolist(),"rows":rows,
         "summary":{"feature_locations":{str(h):{"a":minima[str(h)]["a"],
                                                        "offset_from_predicted_threshold":minima[str(h)]["offset_from_critical_a"]}
                                           for h in HREFS},
                    "observed_feature_shift":float(observed_shift),
                    "absolute_shift_prediction_error":float(abs(observed_shift-shift)),
                    "max_root_difference_after_threshold_alignment":float(max(aligned)),
                    "rms_root_difference_after_threshold_alignment":float(np.sqrt(np.mean(np.square(aligned)))),
                    "feature_location_tracks_shifted_height_ladder":bool(abs(observed_shift-shift)<2e-4),
                    "full_curve_shape_invariant_under_ladder_shift":bool(max(aligned)<.004)}}
    with open("p9_contact_threshold_shift_control.json","w",encoding="utf-8") as f:
        json.dump(out,f,indent=2)

    fig,axes=plt.subplots(1,2,figsize=(10.8,4.3))
    for href in HREFS:
        g=groups[str(href)]
        axes[0].plot([q["a"] for q in g],[q["root_o"] for q in g],"o-",label=f"HREF={href:.2f}")
        axes[0].axvline(critical_a(href)[0],ls="--",lw=.9)
        axes[1].plot([q["offset_from_critical_a"] for q in g],[q["root_o"] for q in g],"o-",label=f"HREF={href:.2f}")
    axes[0].set(xlabel="support asymmetry a",ylabel="P9 zero root o",title="Feature moves in absolute a")
    axes[1].set(xlabel=r"a-a* where sampled h=rho_minus",ylabel="P9 zero root o",title="Curves align at contact threshold")
    for ax in axes: ax.legend(fontsize=8)
    fig.suptitle("Acquisition-grid control for the P9 zero-curve cusp")
    fig.tight_layout()
    fig.savefig("p9_contact_threshold_shift_control.svg")
    fig.savefig("p9_contact_threshold_shift_control.png",dpi=180)
    print(json.dumps(out["summary"],indent=2))


if __name__ == "__main__": main()

# Nadir | Additional standard slow-roll control of historical Module 8-H | 2026-10-28

**Status: EXECUTED CONDITIONAL PHYSICS BASELINE / NOT ORIGINAL SAT DERIVATION / NOT FULL HISTORICAL MODEL / NO H(s)H PREDICTION / NO LEAN COMPILATION OF THIS ADDENDUM.**

This addendum follows the separate exact source-arithmetic gate `2026-10-28_0812Z_MODULE8H_BK18_SOURCE_ARITHMETIC_GATE.md`. It does **not** repair the original draft or introduce a new free fit parameter. It tests the **historical source's own potential** `V(theta)=Lambda^4[1-cos(theta/f)]` under a precisely declared, established-physics baseline: a canonical single field, standard Einstein slow-roll, and **zero effect from the draft's extra Chern-Simons curvature coupling**. The latter exclusion is a CONTROL ASSUMPTION, not a claim that the extra term vanishes in SAT.

Write `x=theta/f` and `F=f/M_P`. The source's stated slow-roll definitions imply

`epsilon = (1/(2 F^2)) cot^2(x/2)`

`eta = cos(x)/(F^2[1-cos(x)])`.

The standard number-of-e-folds integral is

`N = (1/M_P^2) integral_(theta_end)^(theta_star) V/V' dtheta = (2 F^2) log[cos(x_end/2)/cos(x_star/2)]`.

With end condition `epsilon_end=1`, one obtains

`cos(x_end/2)=1/sqrt(1+1/(2 F^2))`

`cos(x_star/2)=cos(x_end/2) exp[-N/(2 F^2)]`.

**Executed mpmath 50-digit source-input calculation**, `N=55`, `F=5` (both printed in the 20 June 2025 historical draft): `x_star=2.469850951832669`, `epsilon_star=0.002437385465676557`, `r=16 epsilon=0.03899816745082491`, `n_s=1-6 epsilon+2 eta=0.9502504581372938`.

**Real observations and provenance:**
- Tristram et al. (2022), Phys Rev D 105, 083524, Planck PR4 + BK18 + BAO: `r_0.05<0.032`, one-sided 95% CL. The conditional standard slow-roll baseline gives `r=0.038998`, **above** that bound, subject to consistent pivot convention and the standard model assumptions.
- Planck Collaboration (2020), A&A 641 A10, `n_s=0.9649 +/- 0.0042` (68% CL, Planck TT,TE,EE+lowE+lensing). Conditional baseline `n_s=0.950250`, difference `-0.014650` (about 3.49 nominal quoted sigmas **if** one divides by the marginal error; not a valid joint model likelihood or exclusion claim).

**Interpretation:** The historical draft's numerical table `r=0.029` is inconsistent with its displayed approximate formula (`r=0.000105785...` at its inputs). Separately, a standard canonical slow-roll integration of its stated potential yields a third result, `r=0.038998...` and `n_s=0.950250...`. This shows the need to recover the actual derivation, its curvature-coupling/backreaction and perturbation prescription, and the pivot/likelihood conventions. **No one of these numbers is hereby declared the physical H(s)H prediction.** The historical extra term could invalidate the canonical baseline, but no correction can be assigned without an explicit equation and data.

**Executed local code and output:** `/mnt/data/workshop_20261028_0812Z_nadir/slow_roll_standard_control.py` and `slow_roll_standard_control_stdout.txt`; independently verified symbolic derivative of the source's literal approximate formula with SymPy. No additional Lean theorem compiled for this standard slow-roll derivation. The existing source-arithmetic Lean PR is #868.

**Next:** Independent hostile review of the derivation and source-context fidelity; obtain original author/turn and any later correction; compare full CMB likelihood with covariance if an actual complete inflation model is defined. Keep this baseline separate from theory candidacy and manuscript completion.

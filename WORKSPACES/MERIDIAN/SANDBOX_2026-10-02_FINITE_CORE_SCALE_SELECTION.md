# Meridian XVII — finite-core regularization selects a helix scale

Status: SANDBOXED / speculative H(s)H construction, not canonical.

Fresh reads:
- SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/DERIVATIVE INDICATRIX (nolat).txt, all 18 extracted pages. Used: 4D superhelix, bending action proportional to |H''|^2, hypersphere constraint, and its own warning that self-consistency needs checking. Particle/mass claims not imported.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/RUN_141_GAUGE_SAFE_HAGALAZ_TRIANGLE_RESIDUAL.md, complete. Used after independent construction: ᚼ represented conditionally as oriented similarities and loop closure tested by gauge-safe residuals. No PRIOR_ART.

Independent construction:
The old bending-only SAT action does not select a nonzero coil wavelength by itself. For a Fourier mode H~exp(iqλ), positive bending gives energy ~A q^4, minimized at q=0. A prescribed superhelix therefore is not yet dynamically selected.

Minimal finite-core H(s)H extension:
E(q)=B q^6 + A q^4 - T q^2, B>0, A>=0, T>0.
Interpretation only as sandbox: B is finite-core/jerk regularization, A bending stiffness, and T an effective compressive/drive term. Setting y=q^2 gives
3B y^2+2A y-T=0,
hence the unique positive selected scale
q_*^2 = (sqrt(A^2+3BT)-A)/(3B).
The q=0 state is unstable because E≈-Tq^2, while Bq^6 bounds the energy below.

Limits:
B→0 gives q_*^2→T/(2A) when A>0.
A→0 gives q_*=(T/(3B))^(1/4).
Thus finite thickness can convert SAT's descriptive helix frequency into an H(s)H mechanically selected wavelength without targeting any historical constant.

ᚼ interpretation:
Use the selected wavelength as a scale component of the edge operator, then test recursive closure with Run 141's gauge-safe similarity residual. A candidate recursive fixed point is not 'same drawing at another scale' but q_{n+1}/q_n=s together with vanishing intrinsic loop residual after quotienting frame/origin artifacts.

Discriminator:
Fit or derive A,B,T independently, then perturb T. Prediction:
q_*^2(T)=(sqrt(A^2+3BT)-A)/(3B),
dq_*^2/dT=1/(2 sqrt(A^2+3BT)).
No free retuning of q is allowed.

Failure:
If the archived SAT action already contains a valid wavelength-selection mechanism omitted by this read, this extension is unnecessary. It also fails if finite-core mechanics does not generate a stabilizing higher-gradient term, or if measured/solver-selected q(T) does not follow the above law in the regime where the truncated gradient expansion applies.

Next solver:
Vary the full 4D curve numerically under bending + jerk + drive, starting from random perturbations rather than a helix ansatz. Test whether the attractor spectrum peaks at q_* and whether the resulting ᚼ triangle residual closes intrinsically.
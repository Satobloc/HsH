# Nadir Voss — 30SEP recovery collision pointer

**Date:** 2026-10-02
**Status:** PLAYGROUND / SANDBOX pointer only.

New crosswalk: `WORKSPACES/NADIR_VOSS/PLAYGROUND_004_30SEP_RECOVERY_COLLISION.md`

Key recovered antecedents from `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/`:

- `HAGALAZ_DEF+.txt` already uses candidate oriented similarities `H=(t,σ,Q)`, matching the newly rebuilt `Sim^+(4)` ᚼ grammar up to `φ=logσ`.
- `RUN_141_GAUGE_SAFE_HAGALAZ_TRIANGLE_RESIDUAL.md` supplies gauge-safe linear closure `D_lin=(logσ)^2+||Q-I||_F^2` and the intrinsic affine translation obstruction.
- `RUN_143_LAG_CONDITIONED_RECURRENCE_DISCRIMINANT.md` supplies exact two-rate identifiability `Δ_q(τ)`; combined with closure, the common closure period is exactly a recurrence-collision lag, so rate estimation and closure testing should use different sampling intervals.
- SPHERES4 already implements the exact equal-S^3 collapse singular values independently rederived in Nadir Playground 002.
- Runs 104–105 provide a distinct inverse/readout fold, motivating separate `J_geom` and `J_read` singular-value channels.

Fresh repair:

The old variable-radius Whirligig curvature does not need `R′≈R″≈0`. Exactly, for

`H=(R cosωλ,R sinωλ,r_h cosνλ,r_h sinνλ)`,

`||H″||²=(R″−Rω²)²+4ω²(R′)²+r_h²ν⁴`.

With `q=(logR)′`, this becomes

`||H″||²=R²[(q′+q²−ω²)²+4ω²q²]+r_h²ν⁴`.

So the discarded envelope terms are naturally the Scalar/dilation channel in the current Cartan/Weyl H(s)H reformulation.

Also flagged for repair rather than inheritance:

- wrong sign in the old BYO-Lagrangian extrinsic S^3 geodesic test;
- pure S^3 Laplace-Beltrami spectrum is `l(l+2)/R²`, not hydrogenic `1/n²`;
- curvature-squared geometric functionals should not be called Ostrogradsky-unstable unless the higher derivative is genuinely a physical time derivative in a nondegenerate dynamical action.

Please cross-check independently before promoting anything.
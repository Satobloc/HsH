# Meridian Run 103 — thin-slab identifiability discriminator

**Date:** 2026-09-25
**Status:** SANDBOX / bounded local geometry result
**Direct authority:** `WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md`
**Scope:** isotropic (B^3_\varepsilon), nondegenerate quadratic tangency, thin resolving slab (h/\varepsilon\ll1). No use of quarantined finite-thickness machinery; no particle or empirical interpretation.

## Result

At exact tangency set (K=|A_{\rm rel}|>0), (q(s)=Ks^2/2). For a thin slab (|\Phi|\le h), the fixed-s (B^3_\varepsilon) slab volume is, to leading order,

[
\frac{dM_4}{ds}=2h\pi(\varepsilon^2-q(s)^2),
]

so using Packet 002's thin-sheet (B^3) readout,

[
M_4=
\frac{16\pi\sqrt2}{5}h\varepsilon^{5/2}K^{-1/2}+\cdots.
]

This is dimensionally a four-volume.

Run 102's contact-span null direction preserves (R=\varepsilon+h). For (G=C h\varepsilon^{5/2}),

[
(\partial_\varepsilon-\partial_h)G
=C\varepsilon^{3/2}\left(\frac52h-\varepsilon\right).
]

Therefore this second observable breaks the span degeneracy locally except at

[
\boxed{h/\varepsilon=2/5}.
]

Fixing the span (R=\varepsilon+h),

[
G_R(h)=C h(R-h)^{5/2}
]

has a unique maximum at (h=2R/7), equivalently (h/\varepsilon=2/5). Generic submaximal (G) therefore corresponds to two parameter pairs with the same span.

## Discriminator

Contact span plus leading thin-slab (B^3) four-volume restores local identifiability away from the fold but does **not** provide global uniqueness. An inverse solver must report both branches unless an external branch restriction or third independent observable is supplied, and must flag loss of conditioning near (h/\varepsilon=2/5).

## Boundary

The (2/5) fold is a leading thin-slab result. Finite (h/\varepsilon) changes the exact ball/slab intersection function. The quarantined older finite-thickness packet was not used.

## Next cursor

Derive the exact dimensionless finite-slab function
[
M_4=\varepsilon^{7/2}K^{-1/2}F(h/\varepsilon)
]
from current ball/slab geometry and determine whether the fold persists and where it moves.

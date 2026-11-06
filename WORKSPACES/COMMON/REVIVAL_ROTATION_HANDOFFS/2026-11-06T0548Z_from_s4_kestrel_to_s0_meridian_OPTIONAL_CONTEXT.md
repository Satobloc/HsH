# Optional context only | Kestrel h629:s4 → Meridian h630:s0

**Target:** deterministic Meridian label, ring index 15, key `REVROT3-19-20261011:630:s0`.  
**Status:** POST_START / NOT_DELIVERED / REPOSITORY_ONLY. The h630:s0 :00 execution had already started at 2026-11-06T05:58:26Z before this handoff was written. Its chat reference is null. The Meridian workspace has no `INBOX.md`; no authenticated Meridian thread was established. This file is a repository artifact only.  
**Obligation:** NONE. No task, review request, response request, deadline, or ownership transfer. Meridian's existing P0 Paper A assignment remains controlling.

## Why this packet exists

Kestrel performed a narrow source-to-geometry check of two existing Meridian sandbox reports because the Review-MIND lane asks for independent QC of explicit geometric claims. The report is:

`WORKSPACES/KESTREL/2026-11-06T0548Z_REVIEW_MIND_GEOMETRY_FIDELITY.md`

Blob SHA-1: `04d9b5f02a5c72cdd1722b8c5a2cb284466063b6`.

## Two corrections worth preserving

1. **CME/GCS reach:** Mishra et al. (2026) define the aspect ratio as cross-section radius divided by heliocentric height of the flux-rope centre. That gives `chi = a/R_c`; it does not, by itself, establish that `R_c` is the local centreline radius of curvature. The cited GCS construction describes a pseudo-circular front. The local tube Jacobian requires the actual axis curvature `kappa_axis(s)`, with local condition `a(s) * kappa_axis(s) < 1`. Therefore `J_min = 1 - chi` and the report's “locally regular” conclusion are conditional on an unproved `rho_curv = R_c` identification. Keep the measured aspect-ratio trend; do not promote the reach margin without the explicit GCS centreline map and curvature.

2. **1-AU table semantics:** the bracketed 1-AU corrections in Table 2 are positive spacecraft-offset corrections (absolute increment and percentage), not symmetric statistical uncertainties. The current report writes values such as `0.110 ± 0.024`. Preserve the source meaning, e.g. `0.110 [+0.024, 21.8%]`, and distinguish raw from corrected central values. Replaying the existing code reproduces its central values; it does not make the correction a sigma.

## Solar report

The existing script replay reproduces the three reported maximum-shear central values and the 3.36% spread. The local shear formula is correct for the stated spherical metric. Keep the 3.36% result descriptive: Doppler and magnetic profiles use the same Mount Wilson observation archive, and the source warns that the `A+B sin²(lambda)+C sin⁴(lambda)` coefficient basis is non-orthogonal with B/C crosstalk. The affine principal stretches are effective local/finite-difference surrogates; exact area preservation is the stronger exact statement.

## Formal status

Existing PR #873 run #42153410233 completed SUCCESS on the current-base synthetic merge reference (PR head `1971e3d58a28f7c6de5cf024039dbcedb133121c` + base `61cc8b65ffed70296e0121dbae067892a79c81d4`). Exact-head-only verification remains unverified; separate tests/lint/nanoda/global axiom audit were skipped. The conditional Euclidean-lift theorem does not prove the GCS tube map or physical H(s)H geometry.

## Boundaries

- This is not a new P2 system selection, physical prediction, fit, CODATA comparison, or independent measurement.
- No source/report/script file was edited by Kestrel.
- No change to Meridian's P0 Paper A assignment, the Code Grurple interlock, the P2 hold, or any paper gate.
- No public issue or duplicate publisher submission was created.
- No ChatGPT-thread delivery, recipient access, comprehension, uptake, or acknowledgment is claimed.

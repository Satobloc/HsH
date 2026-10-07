# Morrow–Kestrel Quarry 147 — noncommuting SO(4) parity history

**Date:** 2026-10-07  
**Status:** SANDBOX / GEN-CANDIDATE, not canonical H(s)H.

## Result

After refreshing the project front door and spending this run on the newly added Ravel material-frame / signed-phase / twist-profile tomography work, I tested the next open point from Quarry 146: whether a parity-odd history channel survives genuinely noncommuting SO(4) transport.

For a four-pulse noncommuting history with generators in several SO(4) planes, define

[
Q=\prod_k \exp(A_k),\qquad \Omega=\log Q.
]

For a 4x4 antisymmetric matrix, use

[
I_2=-\tfrac12\operatorname{tr}(\Omega^2),\qquad
P_4=\operatorname{Pf}(\Omega).
]

Under proper frame changes, both are invariant. Under an orientation reversal R with det R=-1,

[
I_2(R\Omega R^T)=I_2(\Omega),\qquad
P_4(R\Omega R^T)=-P_4(\Omega).
]

The scripted noncommuting fixture returned, at full pulse strength,

[
I_2=1.3708045334,\qquad P_4=+0.4464587644,
]

and for the mirrored history

[
P_4=-0.4464587644.
]

Numerical mirror-even mismatch in I2 was 1.33e-15; mirror-odd mismatch in P4 was 2.22e-16.

A weak-history sweep gave

[
|P_4|\propto \epsilon^{2.00030},
]

so the parity-sensitive channel again begins quadratically in small ordered-history amplitude.

## Why this matters after the new Ravel work

Ravel's new twist-profile tomography independently shows that equal endpoint rotation can hide different distributed twist profiles, while complex modal phase can recover low-order internal history. The present result is complementary rather than duplicative:

- Ravel's complex mode phase is an observable tomography channel for distributed material-frame twist.
- This quarry's Pfaffian of the lifted/log history is a basis-safe parity channel for SO(4) ordered transport.
- Both say endpoint holonomy alone is insufficient.
- Both exhibit a magnitude/history distinction; the parity channel becomes weak quadratically.

This suggests a typed state should retain at least geometry/magnitude, distributed profile information, endpoint holonomy, and lifted ordered-history information until a proven compression preserves all discriminating data.

## Provenance actually read

Old SAT:
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/GRAVITY TWIST.txt`, contiguous opening through the historical relational-memory construction. Retained only the endpoint-state versus accumulated-history distinction; rejected the specific gravitational-aging/Oumuamua mechanism as authority.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, substantial contiguous read. Retained only 4D filament / SO(4) / superhelical / finite-core motifs; historical fitted constants and generated particle claims were not used as targets.

Current H(s)H:
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/WHIRLY.txt`, complete file. Retained the explicit six-component angular-velocity tensor and stiffness-supported finite-core dynamics; historical constants, particle assignments, lattice and mass claims were excluded.
- Ravel, `WORKSPACES/RAVEL/SANDBOX_2026-10-07_TWIST_PROFILE_TOMOGRAPHY.md`, complete via commit 86c9371.
- Ravel, `WORKSPACES/RAVEL/SANDBOX_2026-10-07_SO4_MATERIAL_FRAME_HOLONOMY.md` (commit 2efe3ed), substantial complete commit read.

The October-5 Reference Desk / HSH_RESOURCES routing surfaces were refreshed before construction. PRIOR_ART was not opened.

## Failure gate

This is still not enough if:
1. the sign of ambient orientation is physically conventional rather than consequential;
2. branch changes in matrix log alias long histories;
3. a path-level lift cannot supply a stable unwrapped Omega;
4. a real finite-core observable cannot couple to this parity channel.

The matrix logarithm is therefore a local diagnostic, not the durable state representation. The next test should compare the Pfaffian/Magnus hierarchy against Ravel's directly observable complex modal tomography on matched mirrored, noncommuting histories.

## Next cursor

Build matched histories with identical endpoint Q and matched low-order magnitude spectrum but different pulse ordering. Test whether:
- Ravel-style multimode phase distinguishes them;
- Magnus commutator terms identify the ordering;
- a parity-odd conjugacy-safe combination survives;
- the two diagnostics predict each other or carry genuinely independent information.

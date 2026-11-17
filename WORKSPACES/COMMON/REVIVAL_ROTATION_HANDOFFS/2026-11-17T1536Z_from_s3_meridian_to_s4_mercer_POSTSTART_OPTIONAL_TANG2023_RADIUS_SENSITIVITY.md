# H903:S3 → H903:S4 | Meridian to Mercer | POSTSTART_OPTIONAL_CONTEXT_ONLY

**Status:** POSTSTART_OPTIONAL_CONTEXT_ONLY. The successor :48 slot had already started before this packet was prepared. This packet is repository-only context; it is not a task, review request, deadline, response obligation, ownership transfer, or direct-thread delivery.

## Useful result

The h903:s3 Lane 36 run added a finite-difference Jacobian and coordinate-level variance attribution to the existing Tang et al. (2023) nine-particle superfluid-helium vortex-ring fit.

- 79.19% of propagated diagonal variance comes from reconstructed y/depth coordinates.
- The y coordinates of particle rows 3 and 1 contribute 61.18% together.
- Linearized SD 1.305610 µm versus same-assumption Monte Carlo SD 1.308872 µm: 0.2492% difference.
- Leave-one-particle-out ring-radius span: 0.414227 µm.

The result localizes the conditional uncertainty budget to the image-to-3D projection layer. It does not include full covariance, shared ellipse-fit uncertainty or circularity-model/systematic uncertainty.

## Geometry and epistemic boundary

The source-to-observation composition is:

F_circle ∘ P_circular ∘ E_ellipse ∘ I_camera ∘ T_tracer

The 3D particle positions are author-derived from an image-plane ellipse and a circularity/projection assumption; they are not independent 3D tomography. The fitted R_ring is the major radius of the vortex-ring centreline, not vortex-core thickness. D2 tracer-particle radii are not core radii. The classical air–water vortex core radius used in Kestrel/Nadir work belongs to a different physical system.

Historical Nathan-authored Meridian source messages distinguish the 4D filament from its 3D intersectional trace and distinguish ell_f from intrinsic filament thickness epsilon. No map from the SAT 4D filament/worldtube and timesheet to either ordinary-fluid vortex system is established. No additional thickness, twist, contact surface or responsive medium is forced. No H(s)H physical prediction or numerical falsification threshold exists; P2 remains HOLD.

## Existing proof/work references

- [Published h903:s3 report, issue #1907](https://github.com/Satobloc/HsH/issues/1907)
- [Workspace report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/2026-11-17T1536Z_H903_S3_TANG2023_RADIUS_SENSITIVITY_AND_PROJECTION_AUDIT.md)
- [Reproducible sensitivity script](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/audit_h869_tang2023_radius_sensitivity.py)
- [Result JSON](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/h903_tang2023_radius_sensitivity_output.json)
- Existing Kestrel readout/fiber work: issue #1906 and PR #873.
- Existing Nadir two-channel/quarter-turn readout: issue #1903 and PR #1189.

No new Lean theorem was attempted for the numerical Jacobian. Existing PR builds are conditional map proofs, not physical validation. No SAT-O/Blockwave equations were touched. Meridian's standing P0 assignment remains unchanged.

No acknowledgment or consumption is assumed. The successor retains full autonomy.

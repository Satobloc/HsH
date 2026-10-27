# Enheduanna source-critical lens | θ₄ projection-channel mismatch | 2026-10-27T21:00Z

**Run:** `REVROT3-19-20261011:405:s0`; Enheduanna selected by deterministic ring, Tern Rook next. Actor is a current assistant, not an authenticated historical Enheduanna conversation. This is a source-fidelity finding, **not physical validation**.

## Exact archived source

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT 2026 CONCEPTS/2026 NEW - Google py.txt`, Git blob `121b793380a541cd23ead84ac3f9a3a629ede0e3`, first 75 lines. The same blob occurs in HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 CONCEPTS/2026 NEW - Google py.txt`; duplicate copy, not independent evidence. Original author and creation timestamp of this composite code file remain unverified.

The Python `generate_4d_rotation_matrix` rotates x/w by θ. `primitive_coil_vector=(1,0,0,0)`; `projected_coil=R@primitive_coil_vector`. Hence `projected_coil=(cos θ,0,0,sin θ)`, `inertial_pushback_mass=|cos θ|`, and `hidden_w_component=|sin θ|`. **The code's own comment says mass is proportional to `sin of angle`, and its 90° neutrino comment claims maximum inertial pushback. Both are inconsistent with the implemented x-channel readout.** No code-generated physical data were run or claimed.

Nathan Direct BEDROCK BR-005 (blob `4cabda482c48c217614b868a2138409275df9bf7`) fixes θ₄ from the **time normal**, with θ₄=0 aligned vacuum. The code's θ is an angle applied to an x-directed *excitation*; identifying it with the filament-tangent θ₄ and identifying the x-coordinate amplitude with physical mass both require missing maps. The historical assistant SATx `m_eff∝sin²θ₄` is another candidate mathematical law, not a proof that the code must simply swap sine/cosine. Original SAT.O July 2025 directives blob `167136310cdf33ca8f986f33634692314c1a0946` require geometric source derivation.

**Typed map:** Nathan tangent/time-normal → [missing angle/basis map] → `R_xw(θ)e_x` → `P_x,P_w` → [missing physical observation law]. The code's x/w coordinate projection is not a timesheet intersection or measured inertial mass by itself.

**Five conditional Lean theorem targets:** draft PR #800, `EnheduannaAngleProjectionFidelity.lean` imported into existing Mathlib library. Theorems encode zero-angle x/w channels, nonzero code mass at zero, disagreement with sine-comment, and the incompatibility with any mass function zero at zero. CI run #40583032302 was **QUEUED** at initial check; no Lean proof claimed until actual logs. The module was read back; no `sorry`/`admit`. Compilation would verify only the formalized source transformation, not physical premises or translation fidelity.

**Search coverage:** Mersearch-first instructions and all four request lanes inspected; each lane occupied, none overwritten. Fallback GitHub searches were bounded separately in SAT archive, HsH, HSH_RESOURCES. No three-root Mersearch execution. No invented physical fixtures, CODATA scoring, BEDROCK promotion, scheduler mutation, extra task or cross-thread delivery.

**Next cursor:** Recover original code-author message and Nathan's raw θ₄ clarification, then specify filament tangent → excitation basis → rotation → timesheet observation → mass with conditions. Full local report contains glossary, source genealogy, diagram and seven-item discrepancy ledger. Preserve Tern's Comptroller remit on handoff.

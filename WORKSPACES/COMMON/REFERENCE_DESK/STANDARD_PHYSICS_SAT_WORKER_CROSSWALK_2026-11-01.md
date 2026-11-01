# SAT → Standard Physics Crosswalk: Direct-Source Recovery and Worker Audit

**Date:** 2026-11-01  
**Status:** source-grounded comparison; not physical validation, not a change to BEDROCK.

## Primary Nathan Direct source recovered

Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`  
Path: `Paper Restructuring Plan — raw.json`  
Git blob SHA: `4e49650f2a0b6960d5ce99d6484825b463637828`  
Locator: serialized lines 2185–2202  
Message UUID: `54674374-f032-4c85-a3b0-35cf1584d13c`  
Speaker: `user` (verified from the message's `author.role`)  
Timestamp: `2026-03-21T18:40:11.069Z`

This is an authenticated user-role archive message, not an assistant summary. It explicitly states the projection constant B, the helium-3 hyperfine-based filament scale, mass anchor, critical velocity, phase snap, proton/electron ratio with a bridge correction, a G relation, CP phase, Jarlskog invariant, and CKM angles. This authenticates provenance and wording, not the truth of the scientific claims.

## Important correction to worker interpretation: CKM

The original message explicitly labels `theta_12 = B(1-B²) ≈ 0.2251 rad`. It is therefore an **angle in radians**, not a source-ambiguous numerical sine.

In the standard CKM parameterization, the corresponding magnitude comparison is `|V_us| = sin(theta_12)` (with convention and phase details held fixed). The alternative of treating the source's numeric `theta_12` itself as `|V_us|` is a separate reinterpretation, not an equally source-supported reading.

The original mass-ratio statement is `mu = [3/(2 B^5)] (1 + Delta_bridge)`. Worker issue #411's raw-B comparison omits `(1+Delta_bridge)`; it therefore checks only the special case `Delta_bridge=0`, not the full direct source equation. The bridge term is not numerically specified in this message.

The source also gives `J_obs = J_eff B^5`, while #411 reports a separate `J_shadow` expression. Keep these as distinct formula branches until exact definitions and provenance are reconciled.

## Worker packet crosswalk

| Packet | Standard-physics map destination | Source / QA finding |
|---|---|---|
| [#410 EQ-0018](https://github.com/Satobloc/HsH/issues/410) | hyperfine spectroscopy; constants; length and mass scales | Direct source recovered. Worker reports upstream dimensional failure and downstream hbar numerical mismatch. Not rerun here. |
| [#411 CKM](https://github.com/Satobloc/HsH/issues/411) | proton/electron mass ratio; CKM flavour and CP observables | Direct source resolves theta12 as radians and preserves Delta_bridge. Worker comparison needs the qualifications above. |
| [#424 Navier–Stokes](https://github.com/Satobloc/HsH/issues/424) | continuum mechanics / incompressible viscous flow | Synthetic/dimensionless torus field, not measured physical system. Prior permission for data-free calculation not evidenced in issue body. |
| [#418 lattice dispersion](https://github.com/Satobloc/HsH/issues/418) | waves / dispersion / causality | Arbitrary model parameters and synthetic wavevector samples. Not empirical evidence. |
| [#430 SO(4) holonomy](https://github.com/Satobloc/HsH/issues/430) | differential geometry / frame transport | Chosen unit-radius loop and stabilizer parameter. Geometric comparator, not physical worldtube prediction. |
| [#433 finite-core helix](https://github.com/Satobloc/HsH/issues/433) | curve geometry / finite-core sections | Illustrative A and epsilon values. Not empirical evidence. |

For #424, #418, #430 and #433, the issue bodies do not evidence prior Nathan permission for calculations using no real-world data. This is a **permission/provenance review flag**, not a retrospective declaration of violation: exact timing relative to the October 25 directive must be checked. These calculations were not re-executed.

## Standard-physics sector links from the recovered source

- **Nuclear/atomic spectroscopy:** helium-3 hyperfine transition frequency as a proposed anchor.
- **Fundamental constants/metrology:** h, c, alpha, Rydberg constant.
- **Mass and particle properties:** proposed m0 and proton/electron mass ratio.
- **Special relativity:** proposed vcrit proportional to c.
- **Optics/quantum phase:** proposed obscuration/phase snap.
- **General relativity:** proposed G/c⁴ relation.
- **Standard Model flavour sector:** CKM angles, CP phase and Jarlskog invariant.

These are map destinations, not demonstrated equivalences. The standard observable definitions and conventions remain controlling on the standard-physics side; SAT expressions stay in their own namespace.

## Execution and provenance boundaries

- The direct message's author role, UUID, timestamp and blob SHA were independently read back.
- No new Mersearch run was possible because all four shared request lanes were occupied. Exact-path retrieval followed the issue's source locator; this is not exhaustive archive coverage.
- No calculations were performed or worker numerical outputs rerun in this crosswalk.
- No H(s)H candidate, physical validation, or BEDROCK promotion is asserted.

## Machine-readable companion

[Open the crosswalk JSON](STANDARD_PHYSICS_SAT_WORKER_CROSSWALK_2026-11-01.json).

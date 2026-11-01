# Meridian audit | Cruller local-inextensibility status and protocol correction | 2026-11-01

**Status: AUDIT / NOT PHYSICAL EVIDENCE / NOT H(s)H CANDIDACY.** This note corrects the interpretation and research status of the October 21 Cruller signed-mode and fixed-length sandbox calculations in light of BEDROCK ND-2026-10-25-01.

## 1. Protocol correction

The prior calculations used the explicitly selected mathematical fixture
`C(u)=(cos 2u,sin 2u,cos 3u,sin 3u)/sqrt(2)` on unit-radius S3, with chosen daughter modes. They did not apply sourced measurements from an identifiable physical system. Under ND-2026-10-25-01, the calculations were not authorized by prior Nathan permission and must be classified:

**PROTOCOL_VIOLATION / NOT_EVIDENCE** for empirical physics, SAT/H(s)H validation, CODATA comparison, or candidate promotion.

Their internal arithmetic and geometric conclusions remain historical sandbox calculations, not observations or physical predictions. This audit does not retroactively erase those files; it corrects their evidentiary status.

## 2. Local inextensibility: equations that remain to be solved

For a curve on the unit S3 parent with constant speed q, write
`X_h=C+hY+h^2 Z+O(h^3)`.
The sphere constraint and fixed local speed through second order require
```
C·Y = 0
C·Z = -|Y|^2/2
C'·Y' = 0
2 C'·Z' + |Y'|^2 = 0
```
The first-order tangential relabeling correction previously used was
`Y=V_m+b_m T`, with `b_m=5 sin(mu)/(2 q m)`, `q^2=13/2`. A sampled numerical derivative check reported near-zero first-order speed residual for the selected signed modes. This is not a second-order existence proof.

Set `Z=-(|Y|^2/2) C+U`, where `C·U=0`. The remaining second-order local-speed equation is
```
C'·U' = (q^2 |Y|^2 - |Y'|^2)/2.
```
The full periodic tangent vector field U has multiple independent components in the tangent space of S3. A previous computation restricted the correction to a pure tangential derivative `W'=g T`; its nonzero mean closure residual for m=-1 and m=+1 is only a failure of that restricted ansatz. It is **not** a proved obstruction for the full vector boundary-value problem. The exact symbolic residuals from that restrictive ansatz must not be interpreted as a no-go theorem.

A valid mathematical resolution would require solving the full periodic vector BVP for U, checking closure and all constraints, and evaluating the constrained second variation with the resulting second-order correction. Under current BEDROCK this data-free solver work itself requires Nathan's explicit prior permission, so it is **BLOCKED_PENDING_NATHAN_PERMISSION** unless reframed around a real measured system.

## 3. Correctly bounded existing results

The October 21 signed-mode and global-length-rescaling files contain conditional numerical second variations for a chosen S3 curve and a conventional comparison functional. Those numbers are specific to the declared geometric fixture, its ansatz, and constraints. The fixed-length rescaling case allows global radius change; it is not local material inextensibility at fixed S3 radius. Neither file establishes a physical superhelical instability, actual SAT constitutive law, conserved angular momentum, twist constraint, or H(s)H construction equivalence.

The parent geometry and Fourier-mode setup are useful as a future *mathematical test harness only if Nathan explicitly authorizes data-free calculation*. They must not be fed to CODATA or treated as empirical evidence.

## 4. Correct next route

1. Return to Mersearch and the original SAT/H(s)H archive for the historical Cruller/filament construction, local length constraint, action/stiffness, angular momentum and twist/holonomy definitions. Preserve exact source provenance and distinguish Nathan's own statements from LLM-generated extrapolation.
2. Identify an actual measured rotating/filamentary physical system and genuine source data before any empirical calculation. State values, units, uncertainties and observational constraints.
3. Recover the relevant historical mathematics and apply only what is supported to that real system. If the required data or construction are absent, state the gap; do not insert a convenient fixture.
4. Ask Nathan for explicit permission before resuming a purely mathematical, data-free periodic-BVP calculation.
5. Keep mathematical clearance, H(s)H candidacy and physical verification as separate gates.

## 5. Provenance and scope

This audit is based on the live `BEDROCK.md` (blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`), `STATE_OF_THE_THEORY.md` (blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`), and the existing Meridian sandbox files:
- `SANDBOX_2026-10-21_CRULLER_SIGNED_WINDING_INSTABILITY.md` (blob `15a2581850ff286e794f24d186c644ea38f84e1a`)
- `SANDBOX_2026-10-21_CRULLER_FIXED_LENGTH_RESCALING_GATE.md` (blob `66ffb622dc6a5b0e4b0b9068775d3d9dcb84907a`)

Authorship: Meridian assistant audit note. This is not Nathan Direct, not BEDROCK, and does not alter theory status.

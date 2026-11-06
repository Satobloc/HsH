# AMENDMENT 01 — Source-attribution correction for issue #1426

**Parent artifact:** `calder-interbraid-readout-null-design-20261106t1936z-s3-001`  
**Parent issue:** https://github.com/Satobloc/HsH/issues/1426  
**Date:** 2026-11-06  
**Disposition:** NARROW SOURCE-CRITICAL CORRECTION · NO CHANGE TO THE READOUT ARCHITECTURE OR FALSIFICATION MATRIX

## Correction

Issue #1426 described the BR-006 scalar phase-count equation as “Assistant-formalized, Nathan-approved.” That approval label is too strong on the source evidence currently recovered. Replace it with:

> **Assistant reconstruction in the current BEDROCK register; exact equation-level source and approval chain not yet authenticated.**

The qualitative interbraid premise remains Nathan Direct. The quantitative scalar equation must remain separately attributed.

## What the raw source establishes

Raw conversation: `6ad065ae-9b8c-83e9-8858-d99dd9a4a5e1`  
Raw Git blob: `40daedbf045ce16442fd493d2992062487b3c369`

- Nathan Direct message `4d62333e-9a90-4aee-a3cf-2513149fe84e`, 2026-10-17T07:49:42.233Z: every completed release revolution must add braid history; over a sufficiently long term, planetary-system rotation must approach galactic rotation-curve behavior.
- Nathan Direct message `c293bf0e-6a8a-4f59-8e9a-c76ebb12a1f1`, 07:51:09.865Z: interbraid is a physical constraint on the configurations available to continuously interlocked worldtubes.
- Assistant message `e7001fa7-1b3e-41a3-bdb7-5cbd06eee29f`, 2026-10-17T07:49:43.228859Z, is a separate assistant branch. It contains the assistant's proposed forms
  \[
  B(t)=\frac{\Phi(t)-\Phi(t_0)}{2\pi},
  \qquad
  \dot B=\frac{\Omega_{\rm rel}}{2\pi},
  \]
  followed by exploratory acceleration, orbital-balance, Keplerian-winding, and radial-power expressions. These are assistant proposals, not Nathan Direct equations.
- The user sign-off messages `cc6c2d1d-21e4-44bf-9ba3-26df718e81bf` (07:55:41.886Z) and `99f483a6-e8a3-443e-90fc-e68800dd7cd5` (07:55:53.096Z, “Excellent. Sign it”) both have assistant message `2ce8335d-1984-4ddb-8343-a514f64a0efa` as their parent, not `e7001fa7-1b3e-41a3-bdb7-5cbd06eee29f`. The parent is a separate file-update notice. The local file content it refers to is not present in the recovered raw export. Thus the sign-off does not establish explicit approval of the equations in the `e7001` branch, and the exact equation-level approval chain for the current BEDROCK difference form remains unverified.

## Exact equation-status separation

| Form | Provenance | Status |
|---|---|---|
| “Each completed release revolution adds braid history” | Nathan Direct, 2026-10-17T07:49:42.233Z | Direct qualitative premise |
| “Interbraid physically constrains admissible worldtube configurations” | Nathan Direct, 2026-10-17T07:51:09.865Z | Direct qualitative premise |
| \(B(t)=[\Phi(t)-\Phi(t_0)]/(2\pi)\) | Assistant message `e7001...`, 2026-10-17T07:49:43.228859Z | Assistant proposal; not a direct Nathan equation |
| \(\dot B=\Omega_{\rm rel}/(2\pi)\) | Same assistant message | Assistant proposal; additionally requires differentiability and the definition \(\dot\Phi=\Omega_{\rm rel}\); not separately established in BR-006 |
| \(B(t)-B(t_0)=[\Phi(t)-\Phi(t_0)]/(2\pi)\) | Current BEDROCK BR-006, `BEDROCK.md` blob `527924246cc25caf7fac02dce4b20f024013cd19`, lines 311-319 | Assistant reconstruction in the register; exact original message locator and equation-level approval remain pending |
| Acceleration, orbital-balance, Keplerian-winding, and radial-power expressions | Assistant branch `e7001...` | Exploratory proposals; unpromoted |

The first and second scalar forms coincide only under the additional normalization \(B(t_0)=0\). That normalization must not be silently assumed. The derivative form requires its own regularity and angular-rate definitions. No corrected physical equation is asserted here.

## Scope of the correction

1. The qualitative Nathan Direct BR-006 premise is unchanged.
2. The two-stage readout architecture \(R=C\circ O\), fiber-constancy condition, and null-design matrix in issue #1426 are unchanged. They do not depend on treating \(B\) as a validated equation.
3. No SAT-O or Blockwave equation is involved in this correction. No original SAT-O/Blockwave equation was changed, normalized, or replaced.
4. No physical calculation, data fit, independent measurement, Lean theorem, or BEDROCK theory promotion was performed.
5. The parent artifact remains intact for audit history. This amendment supersedes only its equation-approval wording.

## Required future handling

Keep the qualitative premise, assistant scalar reconstruction, and any later corrected equation in separate source records. Before promoting the scalar to a Nathan Direct equation, recover the exact signed amendment text and its source-message chain. Until then, use the scalar only as a clearly labeled assistant reconstruction, not as an independently authenticated physical law.

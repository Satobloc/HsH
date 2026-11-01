# Ravel :24 — source-equation and version-tension amendment

**Date:** 2026-11-01  
**Parent report:** WORKSPACES/RAVEL/2026-11-01T1224Z_SPATIAL_KERR_FIBER_TRANSPORT_SOURCE_AND_LEAN_AUDIT.md  
**Classification:** SOURCE TEXT PRESERVED / ASSISTANT RECONSTRUCTION SEPARATED / NO EQUATION CORRECTION ADOPTED

## 1. June 2025 SAT4D document: exact source and equations

Source file: SAT_THEORY_ARCHIVE_2023-25 / SATOBLOC / SAT4D_LIVE_DRAFT.txt  
Git blob: `2a79fe25018cce7e99a2c33786d88b0551db6ae7`  
Document: *SAT4D Canonical Summary | For Internal Use*  
Document-level byline: Nathan McKnight  
Date: June 2025  
Length: 2,304 lines.

The document states at line 60:

> SAT will be developed strictly under the assumption of a static 4D block universe. Filaments are treated as fixed 4D worldlines; the only real dynamical element is the movement of the time surface, Σ_t, slicing through this block along a time-flow vector field u^μ(x).

The displayed filament action (lines 170–178) is:

[
S[\gamma] = \int d\lambda\, L(\gamma^\mu,v^\mu)
]

[
L = \frac{1}{2}m v^\mu v_\mu - V_{\text{tension}}(\gamma).
]

This is historical document content, not automatically the controlling 2026 model.

The first geometric-current definition (lines 1072–1075) is:

[
J_\mu(x) =
\left\langle \text{Filament Flux and Linking Density} \right\rangle_{\mathcal F(x)}.
]

The immediately following inhomogeneous Maxwell source (lines 1080–1084) is verbatim:

[
\partial^\mu F_{\mu\nu}(x)
=
\mu_0
\left\langle \text{Filament Flux Density} \right\rangle_{\mathcal F(x)}.
]

**Source-level index issue:** the left side has the free index ν, while the displayed right side is a scalar average with no displayed free ν. No vector/covector component or map producing one is specified in that equation.

Later in the same document, the current is redefined as a Dirac bilinear (lines 1287–1290):

[
J_\mu(x)=e\,\bar\psi(x)\gamma_\mu(x)\psi(x).
]

The later inhomogeneous Maxwell equation (lines 1313–1316) is:

[
\partial^\mu F_{\mu\nu}(x)
=
\mu_0 e\,\bar\psi(x)\gamma_\nu(x)\psi(x).
]

This later equation is index-typed as a covector source, but the document does not derive the map from the earlier averaged filament-flux/linking-density object to the Dirac bilinear. Reuse of J_μ does not itself establish identity of the two constructions.

## 2. July 2025 SAT.O directive source

Source: HsH / DEVELOPMENT_FULL_CONVOS / 30SEP26_DUMP / SAT.O Official Directives.txt  
Git blob: `167136310cdf33ca8f986f33634692314c1a0946`  
Date: July 2025  
Length: 61 lines; no individual author field displayed.

The directive states that SAT.O is built on a 4D differentiable manifold M populated by 1D filaments, and that mass, charge, curvature, and interaction must emerge from filament geometry and intersection with a propagating 3D wavefront Σ_t. It prohibits unstated assumptions, extrinsic fields, and handwaved dynamics. All other extensions are tentative unless explicitly authorized.

## 3. September 2026 Nathan Direct source: later dynamical emphasis

In the original Ravel conversation 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f:

- User message `b9805319-9d77-4b43-874a-5af50c0b6ef7`, 2026-09-07T08:06:58.114Z, says filament and timesheet distortions mutually accommodate force and identifies force as the primitive.
- User message `496a15ea-0263-459d-b815-908f52155b90`, 2026-09-07T10:06:12.842Z, tentatively proposes an induction-current connection within timesheet thickness.

These later direct statements may represent a revision or a different interpretive mode relative to the June 2025 static-block / fixed-worldline formulation. No explicit versioned derivation or directive suspension was recovered that reconciles them. Preserve this as an **unresolved source-evolution tension**, not a silently repaired contradiction.

The “induction current” phrase is tentative. It supplies no tensor rank, component law, normalization, conservation equation, or constitutive response map.

## 4. October 2025 Blockwave equations: assistant-authored, not Nathan Direct

Source conversation: `68f4d9b5-b908-832e-940e-6782db174a4a`  
Raw conversation blob: `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`  
Assistant message: `3039b226-02d4-41a3-a2d3-c338e25204a9`  
Timestamp: 2025-10-19T12:31:03Z.

The assistant-authored Blockwave rank-2 current is used with:

[
\nabla_\mu J^{\mu\nu}=0
]

and the interaction term:

[
S_{\mathrm{int}}\supset
\frac{g_h}{2}F_{\mu\nu}J^{\mu\nu}.
]

These are not the SAT4D rank-1 geometric current and are not a Nathan Direct equation. The existing RavelTwoFormCurrentProjection module is a conditional algebraic projection of this assistant-authored rank-2 object using a chosen covector; it does not identify the SAT4D current or define the physical response.

## 5. Standard type reference and candidate repair — kept separate

For a covector current J_ν, the standard index-typed inhomogeneous Maxwell form can be written:

[
\partial^\mu F_{\mu\nu}=\mu_0 J_\nu.
]

This is a **standard-reference form**, not a correction adopted into SAT4D and not a recovered Nathan equation. Replacing the scalar average in the first SAT4D source equation with J_ν would require an independently defined component-valued current and a derivation from filament/timesheet geometry. That derivation is absent.

Likewise, in four dimensions the standard Hodge degree maps are:

[
*: \Omega^3\rightarrow\Omega^1,
\qquad
*: \Omega^2\rightarrow\Omega^2.
]

The September 2025 direct editorial preference for a 3-form presentation is distinct from assistant-authored detailed equations. A 2-form is not the Hodge dual of a 3-form in four dimensions.

## 6. Consequence for the current Ravel formalization

The new fiber-transport module formalizes only conditional dimension arithmetic and abstract transport non-uniqueness. It does not select between the rank-1 SAT4D current, the assistant-authored rank-2 Blockwave current, or any rank-3 current paste. It does not derive a current from the Kerr spatial section, timesheet intersection, or force primitive.

No source equation was altered. No corrected SAT4D equation was adopted. No Blockwave equation was promoted. No CODATA comparison or physical prediction was performed.

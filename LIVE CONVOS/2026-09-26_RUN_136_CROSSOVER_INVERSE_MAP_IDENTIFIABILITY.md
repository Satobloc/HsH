# Meridian Run 136 — crossover inverse-map identifiability theorem

**Date:** 2026-09-26  
**Status:** SANDBOXED / bounded local-geometry formalization  
**Dependency:** frozen `WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md`; Run 135.  
**Quarantine:** no PRIOR_ART, nLab, or quarantined comparison source opened or used.

## Bounded operation

Packet 002 defines, in the nondegenerate quadratic-contact regime,

\[
\ell_\parallel
=
2\sqrt{\frac{2\rho_{\rm eff}}{K}},
\qquad
\rho_{\rm eff}:=\rho_n+h>0,
\qquad
K:=|A_{\rm rel}|>0,
\]

and the crossover coordinate

\[
\Lambda
=
\frac{|\alpha|}{\sqrt{K\rho_{\rm eff}}},
\qquad
\alpha=n\cdot T.
\]

Run 135 eliminated \(\rho_{\rm eff}\) from the crossover test. The present operation asks the inverse question: for fixed measured \(K>0\), do the pair \((\ell_\parallel,\Lambda)\) uniquely reconstruct the latent effective support and incidence magnitude?

## Exact inverse map

From the span law,

\[
\boxed{
\rho_{\rm eff}
=
\frac{K\ell_\parallel^2}{8}.
}
\]

Substitution into the crossover law gives

\[
\boxed{
|\alpha|
=
\frac{\Lambda K\ell_\parallel}{2\sqrt2}.
}
\]

Therefore, for fixed \(K>0\),

\[
(\rho_{\rm eff},|\alpha|)
\longleftrightarrow
(\ell_\parallel,\Lambda)
\]

is one-to-one on

\[
\rho_{\rm eff}>0,\qquad |\alpha|\ge0.
\]

The inverse remains unique at exact tangency: \(\Lambda=0\) forces \(|\alpha|=0\).

## Signed smooth form and Jacobian

Absolute value intentionally discards which side of the resolving-sheet orientation carries the incidence sign. To state smooth local invertibility, define the signed crossover coordinate

\[
\Xi
:=
\frac{\alpha}{\sqrt{K\rho_{\rm eff}}}
=
\frac{2\sqrt2\,\alpha}{K\ell_\parallel}.
\]

For fixed \(K>0\), define

\[
F_K:(\rho,\alpha)\mapsto(\ell,\Xi)
=
\left(
2\sqrt{\frac{2\rho}{K}},
\frac{\alpha}{\sqrt{K\rho}}
\right).
\]

Its Jacobian determinant is

\[
\det DF_K
=
\frac{\ell}{2\rho\sqrt{K\rho}}
=
\boxed{\frac{2}{K\rho}}
>0.
\]

Hence \(F_K\) is locally nonsingular everywhere on \(\rho>0\). The explicit inverse,

\[
\boxed{
\rho=\frac{K\ell^2}{8},
\qquad
\alpha=\frac{\Xi K\ell}{2\sqrt2},
}
\]

shows that it is in fact globally one-to-one between

\[
(0,\infty)\times\mathbb R
\quad\text{and}\quad
(0,\infty)\times\mathbb R
\]

for fixed \(K>0\).

Thus the crossover variables are not merely a regime label: they form a complete coordinate system for the leading latent pair \((\rho_{\rm eff},\alpha)\) once relative curvature is supplied.

## Exact limit of the identifiability statement

This does **not** reconstruct \(\rho_n\) and \(h\) separately. The inverse identifies only

\[
\boxed{\rho_{\rm eff}=\rho_n+h.}
\]

Therefore the leading inverse has a precise structure:

- \(K,\ell_\parallel,\Xi\) uniquely determine \(\rho_n+h\) and signed incidence \(\alpha\);
- \(K,\ell_\parallel,\Lambda\) uniquely determine \(\rho_n+h\) and incidence magnitude \(|\alpha|\);
- no algebraic reuse of these same observables separates \(\rho_n\) from \(h\).

An independent thickness-sensitive observable remains necessary for that decomposition.

## Differential consistency law

The explicit inverse also gives a first-order regression relation:

\[
\boxed{
\frac{\delta\rho_{\rm eff}}{\rho_{\rm eff}}
=
\frac{\delta K}{K}
+
2\frac{\delta\ell_\parallel}{\ell_\parallel}.
}
\]

For the signed incidence,

\[
\boxed{
\frac{\delta\alpha}{\alpha}
=
\frac{\delta\Xi}{\Xi}
+
\frac{\delta K}{K}
+
\frac{\delta\ell_\parallel}{\ell_\parallel}
}
\]

away from \(\alpha=0\). These are implementation checks, not new dynamics.

## Publication-facing theorem candidate

**Crossover inverse-map theorem.**  
Within the frozen nondegenerate quadratic-contact model, the leading map from effective normal support and signed incidence to contact span and signed crossover coordinate is globally invertible for every fixed \(K=|A_{\rm rel}|>0\):

\[
(\rho_{\rm eff},\alpha)
\leftrightarrow
(\ell_\parallel,\Xi).
\]

Its Jacobian determinant is \(2/(K\rho_{\rm eff})>0\), and its explicit inverse is

\[
\rho_{\rm eff}=K\ell_\parallel^2/8,
\qquad
\alpha=\Xi K\ell_\parallel/(2\sqrt2).
\]

The only retained thickness non-identifiability is internal to \(\rho_{\rm eff}=\rho_n+h\); it is not a non-identifiability of effective support or incidence.

This is a local geometric/readout theorem inside the declared quadratic-contact model. It does not establish empirical realization, physical carrier identity, constitutive dynamics, particle interpretation, or equivalence to another formalism.

## Control / provenance disposition

Freshly read before this operation from repository sources:
- direct War Room declaration;
- Meridian live `TRIAL_CHECKPOINT.md`;
- frozen Packet 002;
- Tool Library `workflow_switchboard_demo.py`.

Fresh GitHub searches for `CURRENT_WORKFLOW_ORIENTATION_V2`, `ROT5`, `ACTIVE_EDGE_SIGNAL_QUEUE headline`, and `Tool Library switchboard operationalization` returned no matches in the queried HsH/HSH_RESOURCES default branches. Those materials are therefore not represented as freshly read; no remembered version was substituted.

The live checkpoint keeps direct theory-bearing work sandboxed and PRIOR_ART/nLab quarantined. The switchboard continues to type Meridian toward reconstructible solver geometry and forbids workflow state from promoting sandboxed theory.

No quarantined source was opened.

## Durable next cursor

Use this theorem immediately after the observable crossover variable in the finite-core note. It sharpens the language from “thickness ambiguity remains” to the exact statement: effective support and incidence are identifiable; only the internal decomposition \(\rho_{\rm eff}=\rho_n+h\) is not.

# Meridian source-fidelity audit | Worldsheet current → timesheet-slice readout

**Run:** `REVROT3-19-20261011:459:s0` · **Nominal UTC:** 2026-10-30 03:00Z  
**Selection:** Meridian → Mercer. Ring selection does not authenticate a ChatGPT instance or thread.  
**Status:** `SOURCE-FIDELITY COMPLETE | NATIVE MAP NOT FOUND | CANDIDATE CONTRACTION CONDITIONAL | LEAN EXACT-HEAD CI PENDING`

## Finding

No source-authenticated Nathan Direct equation, SAT-O derivation, or existing native solver artifact was found that maps the finite-core worldtube to an electromagnetic current, or maps the Blockwave worldsheet two-form current to a timesheet-slice vector current.

The candidate contraction

\[
j^\mu_\Sigma=J^{\mu\nu}_{\rm ws}n_\nu
\]

is tensor-type compatible. If \(J^{\mu\nu}_{\rm ws}\) is antisymmetric, then \(n_\mu j^\mu_\Sigma=0\), so the resulting vector is tangent to the timesheet. This is a proposed readout map from Kestrel's 2026-10-30 handoff, **not a Nathan Direct equation and not yet an electromagnetic current**. Its support, charge normalization, coupling, and conservation conditions remain open.

A common carrier could in principle support separate geometric, electromagnetic, and other response operators. But each needs an explicit domain, codomain, support, symmetry, conservation law, coupling, and observation map. The current sources do not supply that complete architecture.

## Nathan Direct geometry: original source genealogy

The raw Ravel conversation is `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.06•26.09.10•🎼 Ravel [H(s)H] Syncmathcek — raw.json`, Git blob SHA `c49367b0faa424491e7b3520a034b9e44fe6897f`, conversation window 2026-09-06 to 2026-09-10. Role-authenticated excerpts are preserved in verified batches 04 and 05, SHA `7d35aa1ea4c2752b78d4ffcab8eb51022b8c7cd8` and `0d948062a064ee3db0d5bc39ce0ad46829e222d4`.

Relevant user-role messages:

- `2a34f106`: Kerr core, then an ergosphere or other layer structure, then coiling. A nested set relation such as K ⊂ S is a plausible translation, not a verbatim equation.
- `b282ba5d`: “Coiling is periodicity.” No period, parameter domain, or full-history closure condition is specified.
- `8471543a`: a four-dimensional extension of a worldtube with Kerr cross-section; shell distortion is to be examined as a possible force-carrier along the worldtube.
- `3d0ad680`: choose a spatial Kerr section and extend that section along the filament; do not use the full 4D Kerr spacetime as the cross-section of another 4D object.
- `ce837c4f`: the intersection angle with the timesheet depends on coil pitch and motion in 3-space.
- `b9805319`: filament distortion and timesheet distortion mutually accommodate one another; force is the primitive.
- `496a15ea`: three representations remain distinct: a 3D diagrammatic/block representation, a full 4D bulk representation, and the actual 4D view with our 3D slice. The 4D slinky may look ring-like in cross-section without being a full unbroken ring.

These statements do not specify the Kerr-section dimension, an embedding map, a current, a charge normalization, or projection maps between the three representations.

## Historical SAT4D versus Blockwave equations

The following SAT4D files are historical sources; their authorship is not independently established as Nathan-authored.

| Source | Date | SHA | Relevant content |
|---|---|---|---|
| `SAT 4D Theory Work/SAT4D_4.txt` | July 2025 | `efc88f4523b2fd616e64898737c2aa45e5f39b9a` | Defines a 1D filament \(\gamma:\mathbb R\to M\), a 3D timesheet \(\Sigma_t\), and a normal/direction. |
| `SAT 4D Theory Work/SAT4D_Covariant_Field_Equations.tex` | June 2025 | `c2493431c743ab14e677aae0a18bce7fb32880da` | Defines a vector-current expression \(J^\mu=e\bar\psi\gamma^\mu\psi\) and \(F_{\mu\nu}=\partial_\mu A_\nu-\partial_\nu A_\mu\). This vector current is not a two-form worldsheet current. |
| `SAT 4D Theory Work/SAT4D_DERIVATIONS_MASTER.tex` | June 2025 | `e2db11592040fd6962d3b7a9528e1386275eb830` | One-parameter filament action \(S=\int d\lambda[\frac12m(\frac{d\xi^\mu}{d\lambda})^2-V(\xi)]\) and mode expansion \(\xi^\mu(\lambda)=\sum_k a_k^\mu e^{ik\lambda}\). |

The Blockwave action is an **assistant reconstruction**, not Nathan Direct. The file `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt` has SHA `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`. Its source conversation `25.10.19•25.10.19•Full action definitions — raw.json` has SHA `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`. The raw message chain shows the assistant generated the unified action at 2025-10-19 12:29:46.539Z (message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`) in response to a user request at 12:29:43.994Z. A later user re-pastes a positive-sign action for review; that is not independent authorship of the original synthesis.

The assistant-generated Blockwave file includes

\[
u_\mu u^\mu=-1,\qquad P^\mu{}_{\nu}=\delta^\mu{}_{\nu}+u^\mu u_\nu,
\]

\[
J^{\mu\nu}_{\rm ws}\text{ (conserved two-form worldsheet current)},\qquad
\nabla_\mu J^{\mu\nu}_{\rm ws}=0,
\]

and the trace construction \(\gamma=W\cap\Sigma\), with closed-loop quantization such as \(\oint_\gamma A=2\pi k\). The assistant's further claim that gauge redundancy makes this trace slice-independent is not established by those equations.

## Type and projection gates

The objects must remain distinct:

- SAT4D historical filament: 1D \(\gamma\).
- Nathan Direct finite-core worldtube: 4D-embedded carrier with Kerr cross-section; fiber dimension unspecified.
- Blockwave \(J^{\mu\nu}_{\rm ws}\): two-form current associated with a 2D worldsheet.
- Timesheet \(\Sigma_t\): 3D hypersurface in a 4D ambient.
- Candidate \(j^\mu_\Sigma\): vector tangent to the timesheet after contraction with its normal.

For transverse submanifolds in \(M^4\), \(\dim(A\cap B)=\dim A+\dim B-4\). Thus a 2D worldsheet intersecting a 3D timesheet generically gives a 1D trace; a 3D worldtube gives a 2D slice; a 4D bulk region gives a 3D slice. The Nathan Direct source does not fix the Kerr-section dimension, so the target slice dimension cannot be selected by analogy.

Kestrel's existing PR #873 formalizes the projection gate: projection of a true intersection is contained in the intersection of projections, and equality requires injectivity on the relevant support. Its exact-head CI run `40971039093` succeeded; the two projection/incidence theorems printed with no axioms. The separate automated axiom-audit step was skipped. This is a formal set-map result, not a physical mapping.

Gauge redundancy under \(B\mapsto B+d\Lambda\) concerns potential representation. It does not establish that \(W\cap\Sigma_{t_0}\) and \(W\cap\Sigma_{t_1}\) are identical or that an observable is invariant when the slicing changes. That requires an explicit transport/isotopy/homology map and conditions preserving the observable. Closed-loop quantization also requires the actual trace to be closed; “coiling is periodicity” does not establish closure of the full 4D history or every timesheet trace. Meridian's prior PR #750 formalization already distinguishes periodic spatial projection from a non-closing full 4D history; that prior result is credited.

## Candidate contraction: exact conditions

For a torsion-free connection, the product rule gives

\[
\nabla_\mu j^\mu_\Sigma
=(\nabla_\mu J^{\mu\nu}_{\rm ws})n_\nu
+\frac12J^{\mu\nu}_{\rm ws}(dn)_{\mu\nu}.
\]

Therefore \(\nabla_\mu J^{\mu\nu}_{\rm ws}=0\) does not alone imply \(\nabla_\mu j^\mu_\Sigma=0\). An additional condition is needed:

\[
J^{\mu\nu}_{\rm ws}(dn)_{\mu\nu}=0.
\]

A sufficient special case is a closed normal one-form \(dn=0\). A normalized normal \(n=N\,d\tau\) generally has \(dn=dN\wedge d\tau\), which need not vanish. The actual timesheet-normal convention and normalization must be specified before current conservation is claimed. The contraction also does not by itself define distributional support, restriction to the slice, charge normalization, or coupling to electromagnetism.

The Blockwave sign convention \(u^2=-1\), \(P=\delta+u\otimes u\) assumes Lorentzian signature. Current BEDROCK/Meridian continuity specifies a native positive-definite Euclidean 4D ambient, with Lorentzian structure a separate derived readout. The corresponding Euclidean unit-vector projector is \(P^A{}_B=\delta^A{}_B-u^A u_B\) for \(u_Au^A=+1\). The Euclidean-to-effective-Lorentzian map is not supplied in the Blockwave source.

## Lean and workflow status

- Existing Meridian PR #750 branch: `research/meridian-s2-ui-origin-gauge-20261027t1412z`. Prior exact-head CI `40520272971` succeeded on the prior module state; it does not verify the new contraction lemmas.
- New component-level Lean source in `MeridianUIOrigin.lean`: commit `10d695f10c19240f1aadd8c115b8562cfc2ac49a`, file blob `ab79ceb86cfa9c35f6a839ac36eca15fbd345ca4`. It states `antisymmetric_contraction_is_tangent` and `antisymmetric_pairing_uses_only_antisymmetric_derivative`.
- The first exact-head attempt (`40995992014`) failed because a redundant `rw [Finset.sum_comm]` ran after `dsimp` had already closed that goal; this was a proof-script sequencing error, not a mathematical counterexample. The redundant rewrites were removed in commit `10d695f10c19240f1aadd8c115b8562cfc2ac49a`. Exact-head CI runs `40996473245` and `40996473246` were queued/in progress at report preparation. **Compilation is not yet verified.** The source formalizes finite-dimensional component identities only; it does not formalize a manifold, distributional support, foliation, covariant derivative, or physical current.
- A temporary CI-only draft PR #1070 targets a pinned base branch containing the existing Lean workflow because current `main` no longer contains that workflow file. Do not merge it; close it and delete its temporary base after exact-head CI is checked. Canonical research remains in PR #750.

## Current branch, tools, and next cursor

The active logical branch remains `HAGALAZ-SOLVER-UNIFICATION`, owned by Meridian. Current solver runs 097–100 and the existing Whirligig/UI-mapper and Lean/Mathlib projects were inspected. No source-authenticated native solver or rotating-material artifact defining \(J^{\mu\nu}_{\rm ws}\mapsto j^\mu_\Sigma\) was found. No new tool was built. Mersearch's four request lanes were occupied (Calder worldtube, optics, chemistry, superconductors), so no lane was overwritten and no new request was submitted. SciSpace was available but unnecessary for this internal archive-source task. No new paid service, subscription, or infrastructure was introduced; existing repository CI was used.

The first-pass BEDROCK emphasis on time-wavefront thickness remains ahead of claims about electromagnetic persistence ahead/behind the wavefront. No physical calculation, measured-system fit, CODATA scoring, EM-persistence claim, or new H(s)H prediction was performed. Morrow issue #1068 and Kestrel issue #1069 were independently read back as published; neither was duplicated. FIE rereview was not due (last recorded 2026-10-27). An unrelated reading break covered `SAT Mark V/TheTANGLE.txt`, lines 791–830; return cursor 831.

**Next worker: Mercer.** First verify exact-head CI runs `40996473245` and `40996473246` and inspect `#print axioms`; then close temporary CI PR #1070 and delete its pinned base branch. Continue the HAGALAZ path-dependent-transport question without identifying the candidate contraction with an EM current or a holonomy operator. Recover a source-authenticated timesheet-normal convention and Kerr-section dimension before extending the map. No physical calculation without a measured system/dataset and prediction-vs-fit separation; no new Mersearch request until a lane is genuinely free.

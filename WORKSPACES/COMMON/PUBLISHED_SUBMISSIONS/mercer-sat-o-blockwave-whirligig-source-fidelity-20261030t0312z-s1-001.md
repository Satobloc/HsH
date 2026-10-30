# SAT-O / Blockwave / Whirligig source-fidelity crosswalk

**Run:** `REVROT3-19-20261011:459:s1`  
**Nominal slot:** `2026-10-30T0312Z`  
**Worker selection:** Mercer; next ring member Ravel  
**Status:** source audit completed; no theory promotion or physical calculation. No new Lean theorem or code was authored; existing exact-head CI was independently verified.

## Executive result

A primary Nathan-authored geometry source and two earlier direct conversation sources are now cross-linked to the later SAT.O and Blockwave equation families. The recovered material is substantial, but it is not one continuous derivation. The largest provenance hazard is treating assistant- or NotebookLM-generated equations as if they were direct user statements.

The most reliable primitive layer currently recoverable is:

- 4D filament-like objects;
- an evolving 3D time wavefront / resolving surface;
- observed events as intersections;
- mass as an emergent interaction/readout, qualitatively described as drag;
- no recovered direct constitutive coefficient or unique action.

Finite-core worldtubes, a responsive medium, Lorentzian signature, tension-derived mass, string oscillator fits, and later field equations must remain separately versioned until their source and mapping are established.

## 1. Primary source anchors

### A. May 4, 2025 raw conversation

`HsH` 30SEP26_DUMP raw JSON export titled `Fundamental Physics Explanations`

- Git blob SHA: `9bcd42a355d05ebbbe6b6edec9744d1409d0cfd9`.
- Conversation ID: `6816e398-14e4-4b29-a44b-3db07a83cf00`.
- Direct user message ID: `2b40efe6-7e93-4d4f-b2f2-2f7fef6b61b1`.
- Created: May 4, 2025.
- Nathan directly describes fundamental particles as intersection points of 4D filament-like structures with a time wavefront that constitutes the now.
- A separate direct user message in the same conversation explicitly says SAT is a framework he has been working on.

This is the strongest recovered raw-message anchor for the basic filament / timesheet ontology. It does not specify a metric signature, action, constitutive medium, or mass equation.

### B. Blockwave mass / interaction conversation

`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SATO-BLOCK-INT.txt`

- Git blob SHA: `2cd00dec3a8464dc303fe96f14ae71d7fcf8f31e`.
- 13,688 lines.
- Lines 1-3: direct first-person turn says filaments and timesheet should both be massless unless evidence says otherwise, and describes mass as drag arising from interaction.
- Line 214 and following: direct first-person turn clarifies that the drag force was an intuitive interpretation and that no equivalent friction coefficient had been derived.
- This is a text transcript, not the raw JSON export; it has no message UUIDs. Attribution is by transcript turn structure, not raw message metadata.

The second statement is an important limit: do not attribute a quantitative drag law or friction coefficient to Nathan on the basis of the assistant's intervening derivation.

### C. Whirligig construction intent

`SAT_THEORY_ARCHIVE_2023-25/WHIRLIGIG -- REDEFINING SUCCESS.txt`

- Git blob SHA: `fa7d8d419eb1e7c1b356816d73eec5453915ae10`.
- Lines 1-5: direct user turn asks for an equation-to-curve construction, a composite curve from two originals, and an equation for the composite.
- A later direct user turn says the process is a matter of turning equations into oscillators and then back.
- The text export has no raw message UUIDs.

The assistant's later Lie-bracket construction and the separate 4D superhelical Lagrangian in `THE_WHIRLIGIG.txt` are assistant-generated formulations, not direct user equations. The direct requirement is a constructive, deterministic representation pipeline; it does not establish a unique universal derivative.

### D. Donut / mass-proxy source

`SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/FINDING THE DONUT (nolat).txt`

- Git blob SHA: `a788b5cc415f90de2d0382d3596ef07d68604687`.
- The extracted document identifies itself as Nathan's discussion of coarse-graining, Whirligig, braid smoothing, and related SAT material.
- It treats the angle between the filament tangent and the timesheet direction (`theta_4`) as a useful mass proxy, while describing mass as emergent.
- The extraction is not a raw chat export; original PDF binary was not independently re-opened in this run.

The extraction contains an earlier He-3 `Q=6` value. The later project correction is `Q=9`; preserve the chronology and do not reuse the earlier value.


### E. Two October 29 raw conversation exports that prevent equation misattribution

`HsH` 30SEP26_DUMP raw JSON export titled `String SAT filament model`

- Git blob SHA: `61a250cea51a1d2c9377fd5c70651365d4d8cb8e`.
- Conversation ID: `69025957-1430-8324-95e1-bb83d783ca16`.
- User message ID: `17b15204-14fc-490e-805d-900d91c3656a`.
- Nathan supplied a Lean-like SAT/Blockwave/string-oscillator code artifact and asked what it contained. Subsequent direct turns state desired theory coverage and a goal of preparing it for Lean checking.
- This proves the code was user-supplied in that conversation. It does **not** prove Nathan authored every equation in the pasted code. The internal equations remain source-unresolved.

`HsH` 30SEP26_DUMP raw JSON export titled `Theory of Everything?`

- Git blob SHA: `6224b8dbd87f8c989beed657ced4da6dd6eee946`.
- Conversation ID: `69025fe7-3f6c-8333-94d1-72d523eecfa5`.
- User message ID `b1c9b3c6-19ee-4701-b5ab-21da21745bc5` explicitly corrects the assistant: the supplied document is a NotebookLM `LEAN SKELETON`.
- Later direct user message `0e631186-b0cb-4a41-a8c0-5d597a3c7356` proposes a cross-sector calibration loop.
- The skeleton's equations are NotebookLM-derived, not direct Nathan-authored equations. The cross-sector loop is a direct user methodology instruction.


## 2. The SAT-O preprint is recovered, but equation-level provenance remains qualified

`HSH_RESOURCES/PRIOR_ART/SUBMITTED SAT BIG PAPER.pdf`

- PDF Git blob SHA: `d1b110f42c80a951d4a759898f881cd549cab136`.
- Size: 5,489,504 bytes.
- Derived text: `derived/text/9e442ad3986bf75d392040c38b6ba43f85860ef63da2e90005265b21fb42391f.txt`.
- Derived-text Git blob SHA: `8f30313cd085c39d989d28cd521faab3591b604e`.
- DOI: `10.14293/PR2199.002803.v1`.
- First posted online: January 16, 2026.
- Page 1 identifies Nathan as author; page 2 carries the public byline Nathan McKnight and a June 2025 date. These are two byline forms within one PDF, not two witnesses.
- It explicitly says the work is a preprint, not peer-reviewed, and that portions of the mathematics were assisted by tools such as ChatGPT.
- HSH_RESOURCES `indexes/human_source_index/author__unknown__001.md` still classifies the paper as author-unresolved/provisional. The PDF front matter supplies author metadata, so this is an index gap. No index file was edited.
- A search hit labelled `topo.py` resolved to this PDF-derived text artifact, not an executable Python source file.

The preprint contains a large connected SAT.O set: O1 hyperhelical filament dynamics, O2 emergent gravitational action, O3 topological mass and gauge claims, O4 the `n <= 3` falsifiability condition, O5-O8 extensions, O9 string embedding, O10 two-sector / chiral-defect mass models, and O13 flavour topology.

Selected source-level distinctions:

- O1 defines 1D filaments and a propagating 3D resolving surface, but writes the embedding in `R^(3,1)` and adds a canonical Hamiltonian, tension potential, and intrinsic phase structure. These equations go beyond the May 2025 direct geometry statements.
- O2 defines an ensemble metric `g_tilde(mu,nu) = <v_mu v_nu>` and then an emergent Levi-Civita connection and Einstein equations. It assumes statistical isotropy and sufficient filament density; this is a proposed construction, not a recovered direct user equation.
- O3 defines `Q = L_wind + L_link + W_writhe`, assigns `Q = 1,2,3` to neutrino/meson/baryon classes, and gives `m_eff = m0/Q`. This is an early historical mass law, not a current universal mass rule.
- O4 asserts stable bundles terminate at `n = 3`; this is a falsifiable model claim, not evaluated here.
- O9/O10 use string oscillator level and winding fits. Their `Q` is a string winding label in this module family, not automatically the later fundamental-filament count.
- O10 later also appears as a chiral-defect suppression model. Same module label, different formal content.

The preprint's equation-level authorship is not resolved merely by its author line because the document explicitly acknowledges AI assistance. Treat its geometric narrative as author-attributed, but retain equation-level provenance labels.

Version boundary: O1 writes in `R^(3,1)`. The current HsH/SAT working baseline uses a positive-definite four-dimensional ambient geometry, with Lorentzian structure treated as a derived/readout branch; keep the preprint's Lorentzian construction separate rather than silently importing it. Likewise, the preprint's early `m_eff = m0/Q` rule and its `Q = 1,2,3` assignments are historical. Current user-attested project convention (not independently re-recovered in this run): `Q` counts fundamental filaments, a nucleon has `Q=3`, a nucleus has `Q=3A`, and He-3 therefore has `Q=9`; current mass gears are `m_B=(Q*m0)/(2B)` for baryons and `m_L=Q*m0*B^4` for leptons. The earlier He-3 `Q=6` and the preprint's `m0/Q` law must not be silently carried forward. Do not merge these versions by symbol name alone.


## 3. SAT-O / Blockwave derivative artifacts and integrity findings

- `SAT O Core Modules/SAT.O Official Directives.txt`, Git blob SHA `167136310cdf33ca8f986f33634692314c1a0946`, is duplicated in HsH and the SAT archive with the same blob. It is one document, not two independent witnesses. It has no raw message ID or author metadata.
- `O9.txt` SHA `676ce08c09226e4bde5a4d8efa3d7f4da228a1d8` and `O10.txt` SHA `4c2c0c481c04616ae1e1b961ad9b8e85d932885d` are module descriptions, not verified executable implementations. Their formulas are fits/calibrations, not independent predictions.
- `Module_O13.txt` SHA `faeea49a9ef84c29a4989f0bb95197c0d9e9572d` claims all PMNS targets are within 2 sigma, while its own table reports `-2.8 sigma` for theta_23 and `+4.6 sigma` for theta_13. This is an internal table/prose contradiction, not an external-data verdict.
- `O13_flavour.lean` and `O13_PMNS.nb` were not found in the searched repositories.
- `G35HWGRE.txt` claims O9/O10 Python packages under `sat_o/`, including `topo.py` and particle IDs. The archive root has no `sat_o/` directory; searches for `sat_o9.py` and `sat_o10.py` found only the snapshot reference. The claimed package is not recovered in the searched repositories.
- `SAT 4D Theory Work/O9.tex`, SHA `14240f3dd9d11eefa7e9154514a6737debcd5bfa`, and `O10.tex`, SHA `9f6793639c3370150193f122c87a8d9fba5502be`, are separate LaTeX module files. `Module_O10.tex`, SHA `f047267f952872ae72eb91936ac76118ee102f4e`, is not the same O10 model as `O10.tex`: one describes a two-sector mass-squared fit, the other chiral-defect exponential suppression. Preserve the O10 identity collision.
- `G35HWGRE.txt`, SHA `e4ea6173460a996fb1bb1427db89ef6452a7b611`, claims O9/O10 Python packages under `sat_o/`; the `sat_o/` directory and claimed Python modules were not found in the searched archive.
- `SATO-BLOCKWAVE_leancheck.txt`, Git blob SHA `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`, contains 23 `sorry` placeholders and one axiom. It is not a compiled Lean proof.
- `SATOBLOCK Full Theory & Predictions.txt`, Git blob SHA `3893ef0acf9009b01c58c736ec97b8df2ba74943`, is a NotebookLM-derived 50-source synthesis. It explicitly contains multiple formalisms (nonrelativistic density/velocity, 4D covariant, and topological mass), not one established unified action.
- `SAT Lagrangian and Variational Derivation.txt` SHA `9d5db44f16f1f2d853332efd8d91995a37e8d394` and `THE_WHIRLIGIG.txt` SHA `e244a2187ab3fbf0d55ddeffa71aa3e4cbc97057` are derivative equation documents without raw author/message provenance.
- `SAT MATH BACKBONE.txt` SHA `1854995be3311f565739f2be64269cbb0385a82f` is a large synthesis without author/message metadata.

## 4. Minimal source-faithful representation schema

This is an indexing / formalization schema, not a physical theory or a derived action:

```text
Ambient: M^4
Filament: gamma_i : Lambda_i -> M^4
Timesheet: Sigma_t subset M^4, a propagating 3D resolving surface
Readout: R_i(t) = gamma_i intersect Sigma_t
Optional later thickening: W_i = Tube_epsilon(gamma_i)
Optional readout: R_i^W(t) = W_i intersect Sigma_t
Mass readout: m_i = F(intersection geometry, relative orientation, interaction data)
Optional medium U: include only if source or measured evidence requires a constitutive response
```

Important qualifications:

1. The May 2025 raw source does not fix the ambient metric/signature.
2. The finite-core worldtube is a later extension; it is not contained in the earliest 1D-filament statement.
3. A transverse line/hypersurface intersection is point-like; a finite-core slice has a different dimension. The worldtube dimension must be declared before assigning the slice dimension.
4. `F` is not specified by the direct sources. The Blockwave transcript explicitly says no friction coefficient was derived.
5. A responsive medium is not a primitive in the recovered direct statements. Keep it optional.
6. Geometry-to-equation and equation-to-geometry are not unique without a declared parameterization, solution branch, observables, domain, and equivalence/gauge convention. No Lean proposition was attempted here.

## 5. Current Whirligig implementation split

These are distinct codepaths on `main`, not separate `Analemma` and `GrAnn` Git branches:

- Browser `PUBLIC_SITE/instruments/whirligig/index.html`, blob `c6c2edb52b09c94e9bfacf13458381c8fb423cf3`: inner-wall Analemma / Donomphulon contact. `rayHit` samples 100 intervals, brackets sign changes, then bisects 35 times. A sign-change search can miss an even-multiplicity tangency or multiple crossings within one sample interval; it does not prove the first forward root.
- Standalone `tools/whirligig_rq/whirligig.py`, blob `151259096e3ac8e5986ac8f61c6bd76ce199901d`: quartic-root route, selecting the smallest positive real root, but for the outer-wall model.
- `tools/whirligig_rq/grann_rotational_lock.py`, blob `320c808cfaf4e4916eb78d40d97ae7046c5b2887`: inner-wall helper, not a complete R/Q solver.
- `test_whirligig.py`, blob `505355e85d55d51756b33c799cca367265114f80`: 12 tests; no direct test of `ray_first_torus_hit`, tangency, multiple-root ordering, or first-root completeness.
- `ANALEMMA_CORRECTION_2026-10-21.md`, SHA `ac8b47e753911b3ed11df6d37a0d62a1cbec414e`, and `tools/whirligig_rq/README.md`, SHA `c969cb221058656b6b835b50b22beed1af3e9621`, explicitly distinguish the browser inner-wall path from the legacy outer-wall solver and leave branch continuity unresolved.

This is source-only review. No synthetic geometric fixtures were run because the standing data-free geometry permission gate was not satisfied.

The worker identity `WORKSPACES/MERIDIAN` is the rotating-material solver role. `CONSULTANTS/MERIDIAN` is a separate consultant identity labelled Alden Cross. Do not merge them.

## 6. Tooling and branch status

- All four Mersearch request lanes are still `requested`; no output manifests/results were recovered. No lane was overwritten and no new request was submitted.
- No local repository checkout, `mersearch` executable, `lean`, or `lake` was present in the runtime.
- Existing Math Hopper was inspected. PR #991 remains an open draft; CI run #40841280647 succeeded on its exact head. Its source-coverage preflight is heuristic: 1,563 token-bearing lines, 1,452 overlapped, 111 unspanned, 66 longer than 405 characters. This is not proof of formula completeness.
- PR #897 remains an open draft; its 11 theorem targets concern source-window/extraction logic, not physical SAT geometry.
- Meridian's exact-head Lean 4.34 runs #40996874378 and #40996878087 both completed SUCCESS on commit `b2eb585e492532feb6e2593f001461260a9d05e6`; `MeridianUIOrigin.lean` blob `6df643f19c1eb8c009832ad33358d0c5af805443`. Seven theorem targets compiled. The retrieved `#print axioms` output for all seven reports only `propext`; no `sorryAx` or `Classical.choice` appeared. This verifies encoding only, not physical correctness. Temporary CI-only PR #1070 was closed unmerged after both passes. The temporary base branch remains because this runtime has no branch-delete action. PR #750 remains open as a draft; no code was merged.
- Meridian's issue #1071 and its published report were already verified; no duplicate was created.
- SciSpace exists as a connector but was not needed for this internal repository provenance task. No new software or plugin was installed.

## 7. Disposition

- This is a source-recovery and integrity report, not a paper and not a theory promotion.
- P1 (Orson, November 9) was not touched.
- P2 (November 30) and P3 (December 14) remain open.
- No physical calculation, new Lean theorem, code modification, scheduler edit, or additional recurrence occurred. Existing exact-head Lean compilation was independently verified as described above.
- Next worker is Ravel. This handoff is informational and preserves Ravel's existing Kerr/worldtube remit; it does not assign Mercer or Meridian's source audit as a new general-physics task.

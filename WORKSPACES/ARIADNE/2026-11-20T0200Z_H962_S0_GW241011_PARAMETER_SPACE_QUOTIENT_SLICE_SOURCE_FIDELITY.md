# Ariadne h962:s0 | GW241011 Parameter Map: Quotient, Slice, and Geometry Boundary

**Status:** INTERNAL WORKSPACE SOURCE-FIDELITY NOTE. This is not a new publisher submission, physical calculation, H(s)H prediction, or theory promotion.

## 1. Scope and source hierarchy

This bounded audit follows the Lane 00 source-fidelity instruction and uses the post-start Aster packet only as optional context. The packet was not an assignment, did not transfer ownership, and created no response obligation.

Source classes are kept separate:

| Class | Material | Evidentiary status |
|---|---|---|
| Nathan Direct | The current Lane 00 instruction; no subject-specific user-authored GW241011-to-H(s)H geometric map was located in the bounded sources read | Direct task authority, but not a GW241011 geometry specification |
| External source | Das et al., arXiv:2604.09828v1, *Testing the Kerr hypothesis beyond the quadrupole with GW241011*, submitted 10 April 2026 | External GR / gravitational-wave analysis |
| Historical assistant reconstruction | The parameter-summary map Π and its kernel/fiber interpretation in Sable's and Aster's reports | Useful mathematical reconstruction, not a paper-defined physical projection |
| Existing formalization | HsH PR #873, KestrelProjectedIncidence.lean | Generic conditional projection theorem, not an instantiation of the GW241011 model |
| Independent measurement | GW241011 is an observed event used by the paper | No new measurement or independent reanalysis was performed here |

The primary external source is [arXiv:2604.09828](https://arxiv.org/abs/2604.09828). The existing source-currentness report is [HsH issue #2147](https://github.com/Satobloc/HsH/issues/2147), whose publisher readback is verified. The follow-on Aster QC is [issue #2150](https://github.com/Satobloc/HsH/issues/2150); its publisher attempt was rejected for a SHA mismatch. The rejection was read, and no retry or duplicate submission was made.

The Aster handoff packet at \`WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-20T0148Z_from_s4_aster_to_h962s0_ariadne_POSTSTART_OPTIONAL_GW241011_PARAMETER_FIBER_QC.md\` arrived after this scheduled run had started. It was read as optional context only.

## 2. What the external paper actually models

The paper tests deviations from the Kerr multipole relations for the binary event GW241011. Its component-level deviation parameters are δκ₁, δκ₂, δλ₁, and δλ₂. The κ and λ coefficients encode the spin-induced quadrupole and octupole deviations from their Kerr values.

The paper explains that simultaneously estimating all four component deviations is strongly degenerate, both among those deviations and with intrinsic binary parameters. It therefore studies a component-symmetric parameterization and sets the corresponding antisymmetric combinations to zero. This is an explicit model restriction. It implies equal component deviations within that restricted model; it is not a measurement establishing that the two objects physically have equal deviations.

The paper also considers a different parameterization in which only the primary object's deviations are free and the secondary is assumed to be a black hole. That is a different restricted model, not an equivalent representation of the component-symmetric model.

A separate terminology trap must be avoided:

- **Component-symmetric combinations** refer to the average of the two objects' deviations.
- **Symmetric priors** refer to prior ranges symmetric about zero.
- Positive-only priors are a third choice.

These are distinct operations. A prior symmetric about zero does not imply equal component parameters.

The paper reports no evidence for deviations from Kerr under the analyzed models and priors. Its zero-noise injection studies are synthetic recovery checks, not independent observations. The event is real, but this run did not download raw strain, posterior HDF5, calibration, or PSD files, and did not perform an independent parameter-estimation run.

## 3. The assistant-reconstructed parameter map

The assistant reconstruction can be written as a parameter-summary map:

\[
\Pi:\mathbb{R}^{4}\rightarrow\mathbb{R}^{2},
\qquad
(\delta\kappa_1,\delta\kappa_2,\delta\lambda_1,\delta\lambda_2)
\mapsto
\left(
\frac{\delta\kappa_1+\delta\kappa_2}{2},
\frac{\delta\lambda_1+\delta\lambda_2}{2}
\right).
\]

Under this chosen coordinate order, the antisymmetric directions form the kernel:

\[
K=\ker\Pi=\{(t,-t,s,-s):t,s\in\mathbb{R}\}.
\]

The vectors in K are kernel vectors, not a fiber. Each fiber is an affine coset:

\[
\Pi^{-1}(y)=x+K
\]

for any representative x in that fiber.

This is a useful algebraic reconstruction of the symmetric summary. It is not a map defined by the paper as a physical projection, detector projection, or H(s)H geometric readout.

### Quotient versus slice

Two related but distinct constructions must not be conflated:

1. The abstract quotient \(\mathbb{R}^{4}/K\) identifies parameter vectors that differ only along the antisymmetric kernel directions. It describes the information collapsed by the summary map Π.
2. The paper's condition that the antisymmetric combinations vanish selects the symmetric diagonal slice:

\[
S_{\rm sym}=\{\delta\kappa_1=\delta\kappa_2,\;
\delta\lambda_1=\delta\lambda_2\}.
\]

The paper's restricted inference is on this slice. It does not thereby assert that the full physical parameter space is a quotient or that the antisymmetric directions are a physical gauge redundancy.

The primary-only model selects a different slice:

\[
S_{\rm primary}=\{\delta\kappa_2=0,\;\delta\lambda_2=0\}.
\]

This distinction is important. A parameter-summary quotient, a chosen model slice, and a physical equivalence relation are not interchangeable.

The quotient/slice reading is an analytical clarification of the existing assistant reconstruction. It was not separately formalized or independently recomputed in this run.

## 4. Geometry-to-observation map diagram

The following diagram separates the missing H(s)H bridge from the external paper's parameter reduction and statistical inference:

\`\`\`text
H(s)H worldtube(s) + timesheet(s)
              |
              | G_HsH: NOT SPECIFIED
              v
Exterior metric / geometric invariants
              |
              | GR multipole extraction
              v
Component multipoles (M_i, J_i, M2_i, S3_i, ...)
              |
              | external GR parameterization
              v
Component deviations (dκ1, dκ2, dλ1, dλ2)
              |
              | Π: assistant-reconstructed parameter summary
              v
Symmetric summaries (dκ_s, dλ_s)
              |
              | paper's model choice: antisymmetric components = 0
              v
Waveform model + priors + GW241011 strain likelihood
              |
              v
Posterior distributions and Bayes factors
\`\`\`

Three maps remain separate:

- **G_HsH:** the missing map from H(s)H worldtube/timesheet geometry to exterior metric or multipole data.
- **Π:** a parameter-space summary map reconstructed from the paper's component definitions.
- **The waveform / detector / likelihood map:** the external statistical observation pipeline.

A non-injective parameter summary cannot recover distinctions it has collapsed. That generic fact does not show that the paper's parameter kernel is a physical equivalence, and it does not supply G_HsH.

## 5. Stable glossary

| Term | Meaning | Status |
|---|---|---|
| Worldtube | H(s)H finite-support carrier | H(s)H geometric vocabulary |
| Timesheet | H(s)H time-wavefront / hypersurface | H(s)H geometric vocabulary |
| G_HsH | Candidate map from H(s)H geometry to exterior metric / multipoles | Missing; not defined by the paper |
| κ_i | Component spin-induced quadrupole coefficient | External GR parameter |
| λ_i | Component spin-induced octupole coefficient | External GR parameter |
| δκ_i, δλ_i | Component deviations from Kerr values | External GR parameter |
| Symmetric component combination | Average of component deviations | Paper-defined parameterization |
| Antisymmetric component combination | Difference between component deviations | Paper-defined parameterization |
| Π | Assistant-reconstructed summary map to the symmetric pair | Parameter-space map only |
| ker Π | Antisymmetric directions collapsed by Π | Algebraic kernel |
| Fiber | Affine coset of ker Π | Algebraic preimage |
| Symmetric slice | Equal-component restriction | Paper's reduced model |
| Primary-only slice | Secondary fixed to Kerr, primary deviations free | Alternative paper model |
| Symmetric prior | Prior distribution symmetric about zero | Statistical prior choice |
| Posterior | Model- and prior-conditioned inference from data | Statistical result, not direct geometry |

## 6. Original propositions versus translated propositions

| Source proposition | Historical translation | Fidelity assessment |
|---|---|---|
| The paper defines component multipole deviations and symmetric/antisymmetric combinations | Assistant writes a linear map Π from four deviations to two averages | Faithful as a parameter-summary reconstruction, but Π is not a paper-defined physical projection |
| The paper sets antisymmetric combinations to zero because of degeneracy and model scope | Assistant describes a kernel and fibers | Kernel identification is useful; the kernel vectors are not themselves the fibers |
| The paper restricts inference to equal component deviations | Assistant may describe a quotient | The paper's operation is a slice restriction, not a physical quotient |
| The paper also studies a primary-only model with the secondary assumed Kerr | Assistant might treat it as another coordinate view | It is a different model slice |
| The paper uses priors symmetric about zero and positive-only priors | Symmetry can be read as component symmetry | Prior symmetry and component symmetry are independent |
| The paper analyzes a real GW event and performs zero-noise injection checks | Results can be read as direct measurements of H(s)H geometry | Not warranted; injections are synthetic and no H(s)H-to-multipole map is supplied |

## 7. Discrepancy ledger

1. **Parameter map versus physical projection:** Π summarizes parameter coordinates. It is not a geometric projection of worldtubes or a detector readout.
2. **Kernel versus fiber:** \(\{(t,-t,s,-s)\}\) is the kernel. A fiber is a coset of that kernel.
3. **Quotient versus slice:** quotienting by the kernel and restricting to the symmetric diagonal are distinct operations.
4. **Parameter null direction versus physical gauge:** statistical/model degeneracy does not establish a physical gauge equivalence.
5. **Equal deviations versus measured equality:** the paper's zero-antisymmetric restriction is a modeling choice, not an observation that the two components have equal multipole deviations.
6. **Symmetric components versus symmetric priors:** the two uses of symmetry refer to different mathematical objects.
7. **Primary-only versus symmetric model:** fixing the secondary to Kerr is not equivalent to imposing equal component deviations.
8. **Geometry versus inference:** the H(s)H geometry-to-exterior-multipole map is absent. The external paper cannot validate H(s)H geometry without it.
9. **Injection versus observation:** zero-noise injections are synthetic recovery tests, not independent measurements.
10. **Formal result versus physical truth:** the generic Lean projection theorem does not instantiate Π or establish the physical interpretation of its kernel.

## 8. Formal and empirical status

Existing formalization was inspected, not extended.

- [PR #873](https://github.com/Satobloc/HsH/pull/873), head \`94b6d96c91806a95505260a3c52220f4af294185\`, contains generic projection/fiber results, including \`downstream_readout_cannot_restore_coarse_collapsed_pair\`.
- Earlier exact-head run #44090154878 succeeded.
- The latest exact-head run observed, #44483178851, failed. Its jobs endpoint returned zero job records, so the failure stage was not inspectable in this read.
- The existing module includes \`Classical.choose\` in a factorization-existence construction. No fresh global axiom audit was performed.
- The generic theorem is conditional and does not instantiate the GW241011 map. The actual Π, quotient/slice interpretation, and H(s)H-to-multipole map have not been formalized in Lean.

No new Lean module or build was made. The current BEDROCK permission gate bars data-free mathematical fixtures/calculations without specific permission. No such permission was supplied, and no measured-system calculation was undertaken.

No raw GWOSC strain or posterior samples were downloaded. No fit, prediction, independent measurement, CODATA scoring, or H(s)H theory promotion was performed.

## 9. First-blush, explicitly provisional

The main risk in this cluster is **map-category collapse**: a parameter-space compression can be mistaken for a physical projection, and a modeling restriction can be mistaken for an observed equality. The useful next step is to type each map and keep the geometry-to-multipole bridge explicitly missing until it is actually specified.

This is an assistant reconstruction under the Ariadne ring label, not a claim of authenticated historical Ariadne participation.

## 10. Next deeper cursor

1. Search for a direct Nathan-authored instruction that specifically connects GW241011 or external multipoles to H(s)H geometry. None was located in the bounded source set used here.
2. If this event is to be used as an external comparator, specify G_HsH from worldtube/timesheet geometry to exterior metric and multipole invariants before comparing κ/λ parameters.
3. Keep Π, the symmetric slice, the primary-only slice, and the detector/likelihood map separately typed.
4. If formalization is later authorized, instantiate the parameter map in Lean 4 and prove its kernel/fiber/slice relations, then compile and run at an exact head. Do not treat the existing generic theorem as that proof.
5. Any physical reanalysis requires the identified GWOSC strain segments, H1/V1 provenance, calibration and PSD versions, units, quality flags, posterior files, waveform approximant, priors, uncertainty treatment, and a clear separation of fit from prediction.
6. Keep the November 30 major-paper gate on HOLD and the December 14 full-theory gate INCOMPLETE.

**Disposition:** SOURCE_FIDELITY_NOTE / QUOTIENT_VS_SLICE_DISTINCTION_ADDED / NO_NEW_LEAN_RUN / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION / NO_PUBLISHER_RETRY / NO_DUPLICATE_ISSUE.

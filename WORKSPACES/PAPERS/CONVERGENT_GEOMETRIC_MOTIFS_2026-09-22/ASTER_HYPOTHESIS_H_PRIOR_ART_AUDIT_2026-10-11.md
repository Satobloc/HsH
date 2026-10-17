# GRURPLE-A — Aster Hypothesis-H prior-art audit — 2026-10-11

**Worker:** Aster / Nathan-fidelity, provenance, prior-art review  
**Scope:** bounded comparator audit of Paper A's Hypothesis-H / Sati-Schreiber lane  
**Status:** `AUDIT_TRANCHE_COMPLETE`  
**Accepted manuscript checked:** `DRAFT_R1.tex`, blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`  
**Paper-A formal review state:** remains frozen. This artifact is prior-art/source verification, not a second manuscript review.

## 1. Retrieval / evidence path

In-house routes were used first:

1. `HSH_RESOURCES/PRIOR_ART/WORKSPACES/CROSS/SCHREIBER_HH_LINEAGE_RESEARCH_PLAN.md`
2. `HSH_RESOURCES/PRIOR_ART/MIRA/README.md`
3. `HSH_RESOURCES/PRIOR_ART/MIRA/PRIOR_ART_REGISTRY.csv`
4. HSH_RESOURCES human-source indexes for Schreiber/Sati/Fiorenza and strings/branes/higher-dimensions
5. HSH_RESOURCES AI prior-art index

The exact Paper-A references `1904.10207`, `1906.07417`, and `2103.01877` were not surfaced as reviewed HSH_RESOURCES catalog entries by those in-house index passes. GitHub fallback locator likewise returned no exact repository hit for those identifiers/titles.

Academic-literature connectors were then used only to verify the external source identities and source-level claims.

### Citation verification

Scholar Sidekick batch audit verified all three Paper-A references with high-confidence record matches and no retraction flags:

1. Domenico Fiorenza, Hisham Sati, Urs Schreiber, **“Twisted Cohomotopy Implies M-Theory Anomaly Cancellation on 8-Manifolds,”** *Communications in Mathematical Physics* 377 (2020), DOI `10.1007/s00220-020-03707-2`, arXiv:`1904.10207`.
2. Domenico Fiorenza, Hisham Sati, Urs Schreiber, **“Twisted Cohomotopy Implies Level Quantization of the Full 6d Wess-Zumino Term of the M5-Brane,”** *Communications in Mathematical Physics* 384 (2021), DOI `10.1007/s00220-021-03951-0`, arXiv:`1906.07417`.
3. Hisham Sati, Urs Schreiber, **“M/F-Theory as Mf-Theory,”** *Reviews in Mathematical Physics* 35 (2023), DOI `10.1142/S0129055X23500289`, arXiv:`2103.01877`.

### Evidence tier

The external-content inspection in this tranche is based on indexed abstracts plus connector-extracted findings for the exact records. It is stronger than bibliography-only verification but is **not represented as a page-by-page primary-PDF read**. A later full-text audit should preserve this distinction.

## 2. What the external sources actually establish

### A. 1904.10207 / CMP 2020

The paper considers the hypothesis that M-theory C-field 4-flux and 7-flux lie in the image of a non-abelian Chern character from **J-twisted cohomotopy**. For M2-brane backgrounds on 8-manifolds, it derives expected anomaly-cancellation consequences, including shifted C-field flux quantization, tadpole cancellation, DMW anomaly cancellation and the C-field integral equation of motion.

**Safe Paper-A use:** Hypothesis-H-related work genuinely supplies a concrete higher-geometric / generalized-cohomological charge-quantization programme for M-theory brane backgrounds.

**Not established:** any relationship to SAT/H(s)H; any four-dimensional SAT reduction; any equivalence between SAT geometry and cohomotopy.

### B. 1906.07417 / CMP 2021

The paper treats the full 6d Hopf-Wess-Zumino term of the M5-brane and proves a higher level-quantization/anomaly-cancellation condition under C-field charge quantization in twisted cohomotopy. The proof uses a twisted/parametrized generalization of the Hopf invariant and a twisted homotopy Whitehead integral formula.

**Safe Paper-A use:** the programme connects brane physics, homotopy-theoretic structure and quantization in an explicitly mathematical way.

**Not established:** SAT holonomy, SAT winding, or SAT reduction. Similar vocabulary is not object identity.

### C. 2103.01877 / RMP 2023

This paper is the strongest source for the reduction/compactification language actually used in Paper A. It states that Hypothesis H organizes M-brane charges into equivariant homotopy groups of spheres and develops correspondences with stable homotopy, generalized cohomology and cobordism. Its indexed abstract explicitly identifies:

- Cobordism in the third stable stem as witnessing **spontaneous KK-compactification on K3 surfaces**;
- the order of that stable stem with 24 NS5/D7-branes in M/F-theory on K3;
- relations among M-brane charges, fluxes, generalized cohomology, Hopf invariants, Pontrjagin-Thom constructions and cobordism.

**Safe Paper-A use:** it is source-supported to say that the Sati-Schreiber programme contains mathematically controlled compactification/reduction structure and explicit brane/topology/generalized-cohomology relations.

**Not established:** a route to SAT specifically, a 4D SAT effective sector, or a functor/map `R_4` of the kind Paper A proposes to seek.

## 3. Paper-A claim typing after audit

### PASS — source description

Paper A's description that the programme links branes, higher-geometric/topological structure, generalized cohomology/cohomotopy and dimensional reduction/compactification is materially supported, especially by `2103.01877`.

### PASS — conjecture firewall

Paper A correctly inserts the sentence:

> “Nothing in those source results by itself identifies SAT as such a reduction. The next step is a new comparative conjecture posed by this paper.”

That sentence is not decorative. It is the key provenance firewall and should be preserved.

### PASS — `R_4?` typing

Paper A explicitly defines `\mathcal R_4` as a **placeholder name for a map that does not yet exist**, with no assumed functorial structure or reduction prescription. This is the right epistemic typing.

### PASS — strongest warranted status

The formulation that SAT/H(s)H **may be investigated** as a candidate 4D effective realization/reduction/compactified shadow is correctly phrased as a research question, not a sourced conclusion.

### CAUTION — aggregate wording must stay aggregate

The sentence that Hypothesis H “organizes brane charges, higher gauge structures, equivariance and dimensional relationships” is a programme-level synthesis across several sources. It should continue to cite the programme collectively rather than making any one paper carry the whole sentence.

## 4. Prior-art / originality implications

The external lineage clearly predates SAT on:
- cohomotopy/generalized-cohomology approaches to M-theory charge quantization;
- higher-homotopical brane organization;
- Hopf/cobordism machinery in this context;
- explicit KK compactification/reduction in the Hypothesis-H/Mf-theory programme.

That is **external priority on mathematical formalism/programme**, not evidence of influence on Nathan's earlier SAT constructions.

Mira's current exposure boundary records Nathan's modern nLab/Hypothesis-H programme discovery on **2026-09-09**. Absent contrary source evidence, pre-2026-09-09 SAT/H(s)H material remains pre-exposure with respect to that modern programme.

The most defensible current relationship labels are therefore:
- `ANTECEDENT / PARALLEL_RESEARCH_PROGRAM` for the higher-geometric mathematics;
- `INDEPENDENT_PARALLEL` or `LATER_CONVERGENCE` where chronology supports independent SAT development;
- `FORMALISM_FOR_COARSER_INTERNAL_STRUCTURE` only after an actual object-level map is demonstrated;
- **not** `EXPLICIT_INFLUENCE` for pre-exposure SAT material;
- **not** `REDUCTION` or `COMPACTIFICATION_OF_SAT` as an established relation.

## 5. Result for Paper A

**No scientific manuscript defect found in the Hypothesis-H comparator lane in this tranche.**

The accepted R1's central discipline is correct:
- source mathematics first;
- SAT relation second;
- explicit statement that the source does not establish the SAT relation;
- `R_4?` kept failure-capable;
- reduction/compactification status left open.

Accordingly, this audit does **not** reopen Paper A's accepted manuscript state.

The separate residual “proliferation” wording defect recorded in `ASTER_POST_ACCEPTANCE_POLICY_DEFECT_2026-10-11.md` remains unaffected.

## 6. Bibliographic infrastructure gap

The three exact Paper-A comparator references are citation-verified but were not surfaced as reviewed HSH_RESOURCES records in the in-house source indexes checked here.

### Recommendation to Mira / bibliography lane

Add explicit registry/source-index representation for:
- arXiv:`1904.10207` / DOI `10.1007/s00220-020-03707-2`;
- arXiv:`1906.07417` / DOI `10.1007/s00220-021-03951-0`;
- arXiv:`2103.01877` / DOI `10.1142/S0129055X23500289`.

Suggested relationship typing:
- first two: `ANTECEDENT;PARALLEL_RESEARCH_PROGRAM`;
- third: `PARALLEL_RESEARCH_PROGRAM;INDEPENDENT_PARALLEL`, with explicit note that SAT reduction remains unestablished.

Do not treat source-index addition as theory incorporation.

## 7. Next prior-art cursor

Next high-value Paper-A prior-art tranche should move **backward**, not forward:

1. Hinton 1888/1904 moving-section / filament / apparent lower-dimensional motion;
2. Whately Smith 1920 thread/intertwining / lower-dimensional film;
3. professional geometry spine: Minkowski → Klein/Cartan → later braid/configuration-space machinery;
4. compare those exact older constructions against the **23 March 2024 SAT moving-section source**, concept by concept.

That tranche is more likely than further Hypothesis-H reading to change Paper A's eventual novelty/ancestry language.

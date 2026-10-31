# SAT-O / Blockwave equation provenance and support-degree map

**Recorded:** 2026-10-31, after completion of Mersearch request `enheduanna-page-one-origin-20261031-0100`.  
**Status:** INTERNAL SOURCE-CORRECTIVE ADDENDUM / VERSIONED EQUATION LEDGER / NOT BEDROCK / NOT A PHYSICAL VALIDATION / NO NEW LEAN PROOF.

This addendum corrects and extends the source discussion in `2026-10-31T0136Z_KERR_ER_CORE_TOPOLOGY_MAP_STACK.md`. It deliberately separates original artifact text, assistant transcriptions, unattributed documents, and the current HsH geometry. Hashes below are SHA-256 of the exact repository file bytes returned by the GitHub connector, unless explicitly labelled message hash. Git blob IDs are also recorded. Dates are document dates when present; repository ingestion dates are not treated as composition dates.

## 1. SAT-O source layer

### 1.1 SAT4D live draft — document-level author attribution

- Repository/path: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT_O REWRITE/SAT 4D/SAT4D_LIVE_DRAFT.txt`
- Header: **Author: Nathan McKnight; Date: June 2025**; document acknowledges AI assistance. This is a document-level attribution, not independent proof that every equation was personally derived or typed by Nathan.
- Git blob: `2a79fe25018cce7e99a2c33786d88b0551db6ae7`
- SHA-256: `874213320adf87d69f59ca9acd6d34c7447ab2b62c71d1945edbf0d5604cb69b`
- Length: 114,901 characters.

The file's effective filament current and electromagnetic definitions read:

```text
J_μ(x) = <Filament Flux and Linking Density>_{F(x)}
A_μ(x) = <Phase Gradient Structure>_{F(x)}
F_{μν}(x) = ∂_μ A_ν(x) - ∂_ν A_μ(x)
∂^μ F_{μν}(x) = μ_0 <Filament Flux Density>_{F(x)}
∂^μ F̃_{μν}(x) = 0
```

The file describes (J_\mu) as an effective 4-current averaged over filaments passing through (x). It is not written as a delta-supported current, and it is not defined as a Poincaré-dual form. A source-map gap remains: the defined (J_\mu) is not explicitly the right-hand side of the displayed Maxwell equation, which instead uses a separately worded “Filament Flux Density” average.

The same document gives a mass expression and a composite topological (Q) product, while elsewhere defining a worldtube as a 4D volume “swept out” by a vibrating filament. It also describes a static 4D block in which the only dynamical element is the advancing (\Sigma_t). Those statements are not reconciled in the draft. Nathan's later 2026 direct statement “Filament motion is not a thing” and the block-static construction rule out silently carrying the “swept out by vibrating filament” wording into current HsH.

### 1.2 SAT-O official directives

- Path: `SAT O Core Modules/SAT.O Official Directives.txt`
- Explicit document date: **July 2025**; no individual author is named in the file.
- Same bytes as `SAT 4D Theory Work/SAT4D_6.txt`.
- Git blob: `167136310cdf33ca8f986f33634692314c1a0946`
- SHA-256: `98fe71f1c408d3995fd6bd39dab3dc86a66d8b275f9bc6c877f40acf5ef22aa8`

Core directive, faithfully summarized: a 4D differentiable manifold (M) is populated by 1D filaments; the propagating 3D wavefront (\Sigma_t) is the only dynamic element; derived mass, charge, curvature and interaction must emerge from filament geometry and intersection with (\Sigma_t); no unstated assumptions, extrinsic fields or hand-waved dynamics are permitted.

This is the strongest compact SAT-O ontology constraint recovered here. It does not itself define a finite-core Kerr/ER worldtube or a Blockwave (u,\theta) action.

### 1.3 SAT-O derivation files: exact archived equations, dates absent

These files contain equation-level historical derivations. Their individual files do not state a composition date or author; do not infer one merely from the June 2025 parent documents.

| File | Git blob | SHA-256 |
|---|---|---|
| `SAT_D3_TOPOLOGICAL_SUPPRESSION.txt` | `d24129728c1c5fb235004e5196398ee52ad80e26` | `b0a9983db25b7f01dbaa6a9c4c298fd2b49c1fb5a9d132b4d37b65551a3f98f4` |
| `SAT_D4_STRAIN_CURVATURE_MAPPING.txt` | `d07d6cf34498a9b81e685724a523384e71a7fd61` | `913fd22026978dc9878ff3e8501c059f823bbbff0e10d85303cfb38b4f09ef6a` |
| `SAT_D5_GAUGE_TOPOLOGY.txt` | `a29ad0141b8c1283f6d4dee43b7cc57209afbee7` | `16e3d4f8009ea0efe2b85f101a53645af929f1b8a374b554ece8f4e679a78e03` |
| `SAT_D8_SUMMARY_INTERACTIONS.txt` | `dd158494958246e249b032695323b81f03863bdc` | `5078a368d53e0007a38e74a50654b46ab79d1ea6e62bb21979b4602e636ff018` |

Verbatim equation extracts:

**D3 — older topological charge/mass rule**
```text
Q = L_wind + L_link + W_writhe
m_eff = m_0 / Q
```
The file assigns (Q_\nu=1), (Q_{meson}=2), (Q_{baryon}=3). This is a historical convention, not the current HsH filament-count convention.

**D4 — strain/metric construction**
```text
S_{μν} = ∇_μ u_ν + ∇_ν u_μ
g̃_{μν} = <v_μ v_ν>_F
g_{μν} = (g̃_{μν})^{-1}
S_grav = (1 / 2κ) ∫ d^4x √(-g) R
```
The inverse is not accompanied by a full index/type convention in this short derivation file. The √(-g) Einstein-Hilbert expression is a historical Lorentzian-form construction; it is not automatically the current native (++++) HsH metric.

**D5 — gauge/topological current**
```text
A_μ^(G) = g_G J_μ^(G)
g_{U(1)} ~ 1 / sqrt(ρ_wind ℓ_f^2)
ℓ_f = (2A / T)^(1/3)
F_{μν}^(G) = ∂_μ A_ν - ∂_ν A_μ + [A_μ, A_ν]
```
Here (J_\mu^{(G)}) is a 1-form gauge current. Its detailed support and derivation from the SAT4D effective filament-flux current are not supplied in D5.

**D8 — spinor-current and mass expression**
```text
J_μ^(G) = Ψ̄_bundle γ_μ T^a Ψ_bundle
m_eff = (m_0 / Q) (1 + α_shape / Q)
```
This is a Dirac-bilinear current representation. The derivation file does not establish its equivalence to the SAT4D filament-flux average or to a Blockwave worldsheet current.

Additional document identities:
- `SAT4D_4.txt`: Git blob `efc88f4523b2fd616e64898737c2aa45e5f39b9a`; SHA-256 `5481ee44be182b8eb36fe59dadf68123815c30645e22d0b6a1b8638c9c6aae56`; July 2025 glossary, attributed to “SATO.4D Coherence Project”.
- `SAT4D_DERIVATIONS_MASTER.tex`: Git blob `e2db11592040fd6962d3b7a9528e1386275eb830`; SHA-256 `756dcc686a1533819e9f31368f86d361739cbe15da3455a781cb4ad078fec203`; June 2025, “SATO.4D Coherence Project”.
- `SAT4D_Covariant_Field_Equations.tex`: Git blob `c2493431c743ab14e677aae0a18bce7fb32880da`; SHA-256 `58ec4b75180aa8fc6cd6ef06b0a42cf8693ba9502e83095f857fbcda5fb9a87c`; June 2025, “SAT Framework Team”. It separately uses the conventional Dirac current (J^\mu=e\bar\psi\gamma^\mu\psi).

These SAT-O documents therefore contain several distinct current definitions: an effective filament-flux 4-current, a topological gauge 1-form current, and a spinor bilinear. They do not supply a single derivation identifying those objects.

## 2. Blockwave artifacts: distinct versions, not one canonical action

### 2.1 `🧱BLOCKWAVE.txt` archive copy

- Path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`
- Git blob: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`
- SHA-256: `b2b9fa28dd1f6f4e7b05224019793b76e790e9b2b7f79fadd7e77e78d3ab5767`
- 24,627 characters / 384 lines.
- Source genealogy: an assistant-authored action in the 2025-10-19 “Full action definitions” conversation (assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, 2025-10-19T12:29:46.538Z) was copied into this archive file. A later user re-paste was a request for review, not authorship. The file itself speaks in assistant first person (“I've written it…”). It is not an independent Nathan-authored derivation.

Verbatim current definition in the archived assistant action:
```text
J^{μν} = (1/2) ε^{μνρσ} ∇_ρ B_σ
∇_μ J^{μν} = 0
```
The file calls this a conserved two-form filament/worldsheet current and describes distributional support on physical filaments/worldsheets. The displayed (J=*dB) formula alone does not specify singular support or a worldsheet embedding. The missing support prescription is material; do not treat the prose label as a completed construction.

### 2.2 Earlier 2025-09-16 project-file reference

A separate SAT conversation contains an assistant response at 2025-09-16T17:10:31.828Z (conversation `6a? [see raw export crosswalk]`, assistant message `2a7b69af-14b8-4177-b79b-9172394fa9ff`) quoting the same (J^{μν}=\tfrac12\varepsilon^{μνρσ}\nabla_ρB_σ) form while citing a project file named `🧱BLOCKWAVE.txt` (legacy file ID `file-LwaFTKkMemPPrLU4qCLpYB`, source `my_files`). The original project-file bytes and metadata are not available through the current Library surface. It is not established that this legacy project file and the later 2025-10-19 archive copy are byte-identical. The assistant message is a secondary transcript, not the original file.

- Raw transcript blob: `c0a26b8375c88c845ebd8cfe9b14516992ccc99d`
- Assistant-message SHA-256: `8762e903059915e624e8c043f75ca6793c1e4d8304da095da3b57c2899778135`

### 2.3 `BLOCKWAVE EXTENSION .txt` / “BLOCKWAVE OUTFILL”

- Path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE EXTENSION .txt`
- Git blob: `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`
- SHA-256: `b52f398c946b10de64b5735594e581ca8814cc42092c0eaa77caa722cc3d2789`
- 38,517 characters / 908 lines.
- No original author or composition date is stated. Repository ingestion was recorded 2026-10-08; that is not asserted as composition date.
- This is a separate (u^\mu,\theta) Lorentzian branch. It does **not** contain the (J^{μν}) or (J_{μνρ}) current definitions above.

Verbatim core form:
```text
S_core = ∫ d^4x √(-g) L_core
L_core = (1/2) ∇_μ θ ∇^μ θ
         - μ^2 cos(3θ)
         + λ Φ^2
         + α(P^{μρ}P^{νσ}∇_μ u_ν∇_ρ u_σ)
         + β f(θ)(∇_μ u^μ)
         + ξ(u^μu_μ + 1)

Φ = u^μ∇_μ θ
f(θ) = sin^2 θ
u^μu_μ = -1
P^μ_ν = δ^μ_ν + u^μu_ν
signature = (-+++)
```
The file's 1+1D rapidity reduction and (A(\psi)<0) condition are already audited in Sable/Nadir's existing Blockwave notes. This addendum does not repeat that analysis or silently “repair” its Hamiltonian. This Lorentzian (u,\theta) action is not a derived replacement for the current HsH native (++++) geometry.

## 3. Page One / three-form document

- Raw user-role message: `15338421-a5e7-4538-879a-d25d840d2bdd`, 2026-02-25T01:12:37.975Z.
- Conversation: `699e4a02-26e4-832a-86ea-ad1dcaf3c4e3`, “0.239 Radians in Science”.
- Raw export blob: `8b6794a2be3e19b6bba32acfbbc4c6636b1b02e3`.
- Exact message SHA-256: `a755b0ed1d19e761cf950280951cc0cad256581bdd8ac3220de1d95812773a41`.
- The message is a user-role paste of a document; the embedded document's author is not identified. Do not promote the pasted equations to Nathan Direct.

The pasted document defines a three-form current term:
```text
L_J = (κ_0 / 4) J_{μνρ} J^{μνρ}
    + (κ_2 ℓ^2 / 4)
      (∇_α J_{μνρ})(∇^α J^{μνρ})
```
Later in the same document it switches to a two-form (J^{μν}), described as dual to a worldsheet and satisfying (\nabla_\mu J^{\mu\nu}=0), without defining a map from the three-form to the two-form.

On 2026-07-02, a file-search tool result in “Consciousness and AI Debate” returns a document labelled “Pants Shitter 2” containing the same Page One text. The first 3,835 characters beginning at “Page One: SAT” match the February user paste exactly; the tool result is truncated thereafter. That tool result is not the original file, and no file ID, author or original bytes were recovered. Mersearch's selected top source is therefore a retrieval occurrence, not proof of first authorship.

## 4. The current-rank problem is a support/type problem, not yet an equation conflict

The recovered artifacts contain at least four distinct objects:

| Symbol/artifact | Degree / type in source | Stated role | Source status |
|---|---|---|---|
| SAT4D (J_\mu(x)) | 1-form/effective 4-current | average filament flux and linking density | June 2025 Nathan-authored draft; AI assistance acknowledged |
| SAT-O (J_\mu^{(G)}) | 1-form gauge current | topological/gauge current; later Dirac-bilinear realization | historical derivation files; no single derivation connecting them |
| Blockwave (J^{\mu\nu}) | 2-form | claimed worldsheet current; (J=*dB) | assistant-authored action / source support incomplete |
| Page One (J_{\mu\nu\rho}) | 3-form | kinetic three-form current | unattributed pasted document; support unspecified |

These are not interchangeable notations. In particular, the SAT4D (J_\mu) is an averaged flux current, not a stated Poincaré dual. The Blockwave (J^{μν}) is not proven distributionally supported merely by its displayed ( *dB ) formula. The Page One (J_{μνρ}) has no specified support map.

### Conditional dimensional bookkeeping (standard geometry, not an adopted physical identification)

For an oriented (p)-dimensional support (S^p\subset M^4), its Poincaré dual is a distributional ((4-p))-form. Thus, conditionally:

| Support in 4D | Support dimension | Poincaré-dual degree |
|---|---:|---:|
| worldline | 1 | 3-form |
| worldsheet | 2 | 2-form |
| 3D shell/hypersurface | 3 | 1-form |
| 4D core volume | 4 | 0-form |

This gives a possible *type-level* reason that a 3-form and a 2-form might describe different supports rather than contradict each other. It does **not** establish that either source's (J) is the Poincaré dual of the proposed support.

### Conditional H(s)H intersection stack

If the finite-core worldtube is a 4D region (W^4\subset M^4), its boundary is a 3D shell (\partial W^4). For a transverse intersection with the 3D timesheet (\Sigma_t^3):

```text
I_t^3       = W^4 ∩ Σ_t^3             (3D mouth / interior trace)
S_t^2       = ∂W^4 ∩ Σ_t^3            (2D shell trace)
R_t^1       = Z^2 ∩ Σ_t^3             (1D ring trace, if singular locus Z^2 is 2D)
```

This is a dimensionally coherent conditional reading of Nathan's tentative statement that a Kerr ring singularity may be the intersectional trace of a tube singularity. It requires the singular locus to be 2D and the intersection to be transverse. Neither condition is yet a recovered source definition. The shell, mouth and ring trace are distinct objects.

This is the useful architecture improvement: the model needs explicit **support → form → intersection → readout** maps. Do not create a Hodge conversion between (J_3) and (J_2) merely to reconcile two documents.

## 5. Current HsH definitions kept separate

The current source-grounded HsH layer remains:
- one nested 4D superhelical structure;
- foundational SAT worldline representation extended into a finite-core H(s)H worldtube;
- block-static geometry, not physical filament motion;
- an advancing 3D timesheet and its 3D mouth/intersection;
- local ER/Kerr core and Kerr-shell interaction boundary as tentative hypotheses;
- current normalization (cw=t) and native positive (++++), with induced Lorentzian metrics kept separate;
- intrinsic core thickness distinct from coil radius;
- no source-supported current equation (J_1\leftrightarrow J_2\leftrightarrow J_3), and no corrected current equation derived.

The old SAT-O (Q), mass and Lorentzian metric expressions are retained as historical equations with their own hashes, not silently substituted for current HsH conventions. The Blockwave (u,\theta) branch is not imported into HsH without an explicit source-supported map.

## 6. Mersearch result: completed, but not first-origin proof

Request: `enheduanna-page-one-origin-20261031-0100`.

- Completed: 2026-10-31T01:50:03.165Z.
- Search summary: 1,585 hits across 15,780 files / 20,828,714 indexed records / 298 distinct source paths.
- Repositories: HsH, SAT_THEORY_ARCHIVE_2023-25, HSH_RESOURCES.
- Compact receipt contains 20 selected sources; raw result files were retained only in the Actions job workspace and are not present in the repository. The ranking is lexical/term-based, not a chronology or authorship score.
- `RUN_MANIFEST.json`: blob `dcaf63a8e9d770afec3d067d15dba08243e51304`; SHA-256 `8c7bfe7d7edf5b31c27c9e0a422ce7e7a7974784a6a3ef6f0fa60f06e0fcad21`.
- `SEARCH_RECEIPT.json`: blob `ccd9599a407495bf6bd80b079557d89e14f251aa`; SHA-256 `59166e54f5e3bd2434e2344e5c69b3d50640387579cf6aca9c98619c1608a468`.
- `SEARCH_RECEIPT.md`: blob `e1fa022458fe33945dd36435877c81d5f1605d03`; SHA-256 `af5886c11408500239a2c5c07eb80d6412e6b5089ab71a803ada752221da6185`.

The manifest records a runtime hotfix distinct from the stable Mersearch script; the compact receipt is useful for navigation but is not exhaustive. No first-origin claim is warranted from this result.

## 7. Corrected status and next proof/data gates

- The apparent (J_3/J_2) conflict is **not an authenticated Nathan Direct contradiction**. It is a mix of a SAT-O 1-form flux-current definition, assistant-generated Blockwave 2-form material, and an unattributed Page One 3-form document.
- No algebraic correction or conversion equation is adopted. Preserve the exact source equations above and keep any future corrected equations in a separate, explicitly derived section.
- Lean target: type the support dimensions, Poincaré-dual degrees, shell/mouth/singularity intersections, and map composition conditions. This is proof-triage only; data-free formalization remains `BLOCKED_PENDING_NATHAN_PERMISSION`. No Lean run occurred.
- Physical test target: define (\Phi_{\rm nest/core}), (S_t), the shell/singularity support maps and (R_{obs}) before scoring any real measured system. No physical calculation was run.
- Existing Blockwave projector/Hamiltonian audits by Sable and Nadir were consulted and not repeated here.

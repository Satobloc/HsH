# Mercer Calder | Independent hostile review #12 | 2026-10-11

**Status:** SANDBOXED / independent first pass / **MAJOR REVISION**.

**Mandatory question: Better or worse than the published paper? Why or why not?** **Worse as a demonstrated, testable explanation of coiled-coil packing; better only in claimed geometric scope and computational generality.** Crick (1953) specifies biologically constrained two- and three-stranded coiled-coil packing and diffraction consequences. The Meridian ᚼ manuscript supplies an internally coherent higher-dimensional reference-normalization grammar and exact similarity-group identity but neither predicts protein packing nor distinguishes itself experimentally from existing geometric registration/normal-frame methods. They do not attempt identical research problems. Do not rank a 2026 untested general algorithm above a published structural model merely because it is broader.

## 1. Primary-source and independent-review boundaries

- **Draft reviewed:** GitHub issue [#12](https://github.com/Satobloc/HsH/issues/12), full embedded 8 October 2026 Meridian technical core, including the \`E_{02}\` conjugation identity, Bishop-frame two-order reference helix, zero-reference ᚼ coordinates, counterexample, and six-scalar limitation. Also substantively read \`Satobloc/HsH/WORKSPACES/MERIDIAN/2026-10-05_FREE_BUILD_NORMAL_BUNDLE_HAGALAZ_LIFT.md\`, **complete** (5,951 chars, blob \`dacb57be62f5b4120eb70b71af82f79db125642f\`).
- **Historical SAT primary reads:** \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H TOOLKIT.txt\`, **complete** (3,721 chars; blob \`384b40a595d41daa4c573218022a0b802ad3deee\`); \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/SAT26 MATH ROUNDUP.txt\`, **complete** (4,425 chars; blob \`1f690930cdd585e0db6e7c29cdfcd6e25d49127e\`). The former calls for SO(4), higher-order framed curves and explicit geometric solvers; the latter presents UI rotation/expansion and a trial fourth-order curve action. Statements of established unification, constants and ontology in roundup are **historical draft claims, not adopted findings**.
- **September 30 HsH primary reads:** \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/4D THINKING PRIMER.txt\`, **complete** (4,291 chars, blob \`135bdf4bfc274de1388e5fe3c979e9810919b5d3\`); and \`.../FUNDAMENTAL INTUITIONS.txt\`, **complete** (9,258 chars, blob \`81ae23a106939cba7e3d134ed5c90a7d7a979a25\`). These distinguish complete 4D form, filament/time-surface intersection, geometric vibration and proposition-level hypotheses from a classical protein helix interpretation.
- **Published comparator:** F. H. C. Crick, *The packing of α-helices: simple coiled-coils*, *Acta Crystallographica* **6** (1953), 689–697, doi:[10.1107/S0365110X53001964](https://doi.org/10.1107/S0365110X53001964). Bibliographic metadata and DOI verified by Scholar Sidekick; title/abstract examined in SciSpace scholarly index (paper ID 2116441099). The abstract identifies roughly 20° helix misalignment, two- and three-strand rope models and diffraction consequences. Private routing copy: \`HSH_RESOURCES/REDISCOVERED/a00982.pdf\` (1,192,732 bytes, blob \`3f82342b55d2cefe68f714218da092a149d56080\`). **The full PDF was NOT successfully read**: its repository blob reader fails UTF-8 decoding of PDF binary. **Accordingly, no equation numbers or specific internal page claims are represented as checked.** The cited pp. 689–697 are the verified bibliographic span, not pinpoint citations. This limits historical-detail verdicts. Source is for comparison only, not SAT theory import.
- **Tool preference/coverage:** consulted controlling onboarding and Reference Desk; shared three-root Mersearch request was occupied by Orson's \`2026-10-11-orson-morrow-inspiral-package-001\` (\`requested-retry\`), so the slot was not overwritten. Used direct exact-path source reads rather than generic GitHub corpus search, local numerical verification and independent citation index. **No corpus-exhaustive search or earliest-priority claim**. Restricted Hypothesis H/directly Schreiber-authored sources not accessed.
- Independent first pass: no co-reviewer comments consulted.

## 2. Severity-ranked findings

1. **HIGH / insufficient calibration observables:** A reference-normalized six-number record, even combined with global \`(t,s,Q)\`, does **not** determine arbitrary changing inner/outer pitch, local phase, or material-frame variation. A six-dimensional chart *can* locally parameterize \`SO(4)\` (it has dimension six), so the statement that six numbers cannot capture arbitrary SO(4) rotations **solely due to angular degree count** is too broad. The real dimensional obstruction is that \`Sim^+(4)\` has 4 translations + 1 scale + 6 rotations = **11 real dimensions**, and a general framed curve additionally needs functions of arclength. The Meridian draft correctly limits its six-variable reduction to restricted families, but should state the precise objection and prove identifiability for that family.
2. **HIGH / phase is gauge-dependent:** For a normal-plane basis rotated locally by \`χ(s)\`, \`φ_new=φ−χ\`, while the connection \`A=E_2·∂_s E_1\` transforms \`A_new=A+χ'\`. The actual geometric winding rate is **\`D_s φ=φ'+A\`**, not \`φ'\` alone. A Hagalaz readout that changes when the transported normal frame is re-labelled does not measure an invariant. The issue draft does insist on retaining frame/phase records, which is a *partial mitigation*, not a proof of gauge-safe numerics. The exactly transported Bishop frame restricts gauge changes; use an explicit connection when comparing different chosen frames.
3. **HIGH / protein-specific packing absent:** The draft does not impose side-chain steric contact, interhelical separation, repeat structure, handedness constraints of the biological α helix, or diffraction observable. Crick's 1953 specific scientific problem was packing of α-helices of the same sense, tilted roughly 20° from parallel, into two/three-strand ropes and predicting diffraction behavior (verified **abstract-level**, not inner-page equations). A free 4D normal lift by itself cannot improve this packing model or claim to rediscover its prediction.
4. **MEDIUM / mathematical novelty:** \`E_02=B_01^{-1}E_12 B_01 E_01\` is the exact composition law of **reference-normalized similarity transformations**, not a novel force or topology theorem. Noncommutativity of translations/rotations belongs to the semidirect-product group. Static coordinate-only loop closure telescopes to the identity and is not physical holonomy. Manuscript accurately acknowledges much of this; the abstract should foreground registration rather than 'braiding' or physical consequences.
5. **MEDIUM / nested helix degeneracies:** A single centerline with two frequencies is not by itself two interacting strands. The normal-plane degeneracy when curvature vanishes, changes of chirality, self-intersections, and global phase slips need explicit failure/error diagnostics. Local positive speed or smooth Bishop frame is insufficient to establish no collisions or stable packing.
6. **MEDIUM / reference zero is calibration, not absolute physical zero:** Declaring ᚼ=[0,0,0,0,0,0] for the reference specimen is legitimate as an algorithmic origin, but its values and phase conventions change if the reference changes. Avoid proposing these six numbers as source-independent invariants without a normalization proof.
7. **MEDIUM / missing benchmark advantage:** No head-to-head reconstruction data against standard double-helical parametrizations, Bishop/material-frame reconstruction, or similarity registration with identical information budget and noise. No independent experimental measurements exist for claimed physical benefits.
8. **LOW / source genealogy:** Crick's physical coiled-coil geometry predates the 2026 workflow, but geometric similarity is not plagiarism, nor does it establish the chronology of Nathan's independent invention. Record dated SAT inputs separately from assistant-generated retrospective toolbox claims. Later coiled-coil parametrizations need individual citations before priority language.

## 3. Independent mathematical tests and most damaging counterexample

### 3.1 Gauge-equivalent descriptions of an identical curve

Write the local lift in a 4D normal two-plane:

\`X(s)=C(s)+a[cos φ(s) E_1(s)+sin φ(s) E_2(s)]\`.

Define \`E_1^*=cos χ E_1+sin χ E_2\`, \`E_2^*=−sin χ E_1+cos χ E_2\`, \`φ^*=φ−χ\`. Then

\`X^*(s)=X(s)\` **identically** while \`φ^*{}'=φ'−χ'\`.

A purported physical phase-gradient readout based only on \`φ'\` changes arbitrarily. In the moving frame \`A^*=A+χ'\` and \`φ^*{}'+A^*=φ'+A\`. One must record \`E_1,E_2\` or the connection/gauge class.

**Executed independent numerical check** using \`C(s)=(0,0,0,s)\`, \`a=0.2\`, \`φ=8s\`, \`χ=0.6sin 2s+0.2sin 5s\`, 2,001 samples:
- Maximum 4D difference between gauge descriptions: **7.35×10⁻¹⁶**.
- Maximum finite-difference covariant phase-gradient discrepancy: **3.14×10⁻¹²**.

The physical curve is identical but its raw phase gradient differs. This is a clean gauge-null control for Hagalaz.

### 3.2 Same scalar endpoint data, genuinely different nested shape

Compare \`φ_A(s)=8s\` to \`φ_B(s)=8s+0.25(1−cos 3s)\`, for \`0≤s≤2π\`. Both have identical radius 0.2, winding count 8, initial and terminal positions, initial and terminal tangents, underlying straight carrier and global similarity state. But their interiors differ.

For this straight carrier, **exact**

\`|X'|=sqrt(1+a²[φ'(s)]²)\`.

- Regular speed: **1.8867962264**.
- Modulated speed range: **1.7613914954–2.0155644371**.
- Maximum pointwise 4D curve separation: **0.0989615837**.

Therefore a six-scalar endpoint/winding summary cannot reconstruct both, unless it retains extra functional phase/strain data. **The manuscript's explicit full-frame/full-phase qualification prevents this from refuting its narrower theorem; it refutes extending that theorem to unrestricted coils.** No particle interpretation follows.

### 3.3 Pitch alone does not determine packing

For a coaxial superhelix parametrized by axial coordinate \`z\`, \`C(z)=(R cos ωz,R sin ωz,z)\`, pitch \`P=2π/ω\`, and tangent tilt \`tan ψ=Rω\`. Choosing the **illustrative** \`ψ=20°\` from Crick's abstract and \`R=1\` gives \`P=17.26290975\` dimensionless length. Two equal-frequency strands offset in phase \`Δ\` have separation \`d=2R|sin(Δ/2)|\`. Hence:
- \`Δ=60° -> d=1\`;
- \`Δ=180° -> d=2\`.

**The same pitch/tilt does not specify two-strand packing**. Strand phase, radius, relative separation, handedness and actual molecular constraints are extra observables. This is an elementary geometry comparison, *not* a reconstruction of Crick's protein atomic arrangement.

## 4. Published work better and worse: seven dimensions

| Dimension | Crick (1953) versus Meridian's current draft |
|---|---|
| Novelty | **Crick better established:** early specific structural packing proposal and diffraction application. ᚼ may be original as an internal operator nomenclature/solver orchestration, but algebraic novelty over moving-frame/similarity methods is unverified. |
| Correctness | **Different domains:** exact Meridian conjugation identity and Bishop lift pass mathematical inspection; Crick full-paper equations not reviewed here, so no global correctness rank. |
| Evidence | **Crick stronger scientific anchoring:** identifiable α-helical structural subject and diffraction consequences; **not** a claim this paper itself measured modern protein structure. ᚼ has synthetic self-tests only. |
| Testability | **Crick stronger now** for molecular packing/diffraction. ᚼ has potentially sharp reconstruction tests, not independently instantiated measurements. |
| Reproducibility | **Meridian clearer as a contemporary executable mathematical specification**, although a complete public implementation is still missing. Crick's abstract confirms model classes, but full-page computational recipe has not been verified in this review. |
| Economy | **Crick more economical** for narrow two/three-strand proteins. ᚼ carries extra SO(4) frame/normalization machinery appropriate only to a different, wider task. |
| Clarity | **Meridian stronger in source-boundary and transformation-type caveats**, but must replace the six-angles objection and specify invariant phase/connection; Crick's paper should not be judged stylistically without full text. |

## 5. Mandatory rewrite

**Proposed title:** \`Reference-Normalized Similarity Registration and Normal-Bundle Phase Transport for Restricted Two-Order Helices: A Numerical Benchmark\`.

**Replacement abstract:** \`We define a source-normalized registration workflow for selected two-order framed curves in Euclidean four-space. Similarity transforms satisfy a semidirect-product conjugation identity, while an independent normal-bundle lift encodes coil radius, winding phase, and a transported normal plane. We distinguish global reference alignment from local winding and show that raw phase derivatives are frame-gauge dependent; comparisons use retained frame data or a covariant phase derivative. Six scalar diagnostics are valid only for declared restricted families and do not determine arbitrary framed curves. A synthetic gauge-null and variable-pitch counterexample delimit those families. Proposed benchmarks compare reconstruction error, information budget and noise sensitivity with conventional coiled-coil and moving-frame parametrizations. No new force law, protein packing prediction, physical braiding holonomy, or empirical validation is claimed.\`

Required technical corrections:
1. Replace 'six parameters cannot describe SO(4)' with the exact local/global distinction: \`dim SO(4)=6\`; \`dim Sim^+(4)=11\`; variable nested curves are function-valued.
2. Add a reference-frame/gauge transformation section, \`φ' + A\` invariant, gauge-frozen Bishop conventions.
3. State which of the six ᚼ coordinates encode winding, pitch, radius, phase, separation, chirality, transformation and reference, and which *do not*.
4. Separate registration noncommutativity from curvature/parallel-transport holonomy and from Crick's intermolecular packing.
5. Compare numerical 3D 2/3-strand benchmarks and 4D generic counterexamples against standard parametrizations with same input data and same noise.
6. Do not claim protein diffraction or novel biological mechanics without source-linked atomic model and measurable predictions.
7. Obtain the full 1953 paper extract for equation/page-specific comparison before presenting this as a complete prior-art adjudication.

## 6. One decisive numerical test and failure criteria

**Pre-register** a benchmark on a held-out family \`φ(s)=ns+ε(1−cos ks)\` and arbitrary smooth frame gauges \`χ(s)\`, with a fixed information budget. The mapping must (a) reconstruct physical \`X(s)\` independent of the gauge at error <1e−10 in noiseless double precision; (b) preserve \`D_sφ\` and the worldline's curvature spectrum within specified numerical tolerance; (c) correctly distinguish regular and modulated helices when the corresponding functional phase is provided; (d) explicitly return **underdetermined**, not a false exact reconstruction, when offered only six endpoint/winding scalars.

**Kill criterion:** If claimed gauge-invariant reconstruction depends on arbitrary \`χ(s)\`, or if six scalars are advertised to reconstruct both curves uniquely without further input, the broad transport/calibration theorem fails. If full frame and phase records pass, the restricted registration framework survives, but must still demonstrate practical advantage and independent observable before any physical claim.

Numerical implementation in conversation artifact \`mercer_issue12_hagalaz_gauge_test.py\`; results \`mercer_issue12_hagalaz_gauge_results.json\`; script-rendered Class-P diagnostic \`mercer_issue12_hagalaz_counterexample.png\`. Each can be placed under a versioned solver folder without changing canonical symbols.

## 7. Disposition and handoff

**MAJOR REVISION**, not reject the exact algebra. Retain the identity and restricted lift as candidate computational tools; do **not** promote to canonical physical theory, proof of biological packing superiority, new SO(4) symmetry, measured holonomy, or priority claim.

**One outstanding blocker:** complete publisher PDF / faithful text extraction of Crick (1953) to audit page-specific equations and the original diffraction derivation. The current review is intentionally **limited on published full-text scrutiny**; it is complete on the tested synthetic mathematical claims.

*Mercer Calder | independent review #12 | SANDBOXED*
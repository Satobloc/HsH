# Proper Dimensionality: source-custody and geometry-fidelity addendum

**Status:** SOURCE-FIDELITY AUDIT ONLY. No theory adoption, BEDROCK change, physical calculation, CODATA scoring, or paper-gate change.  
**Audit date:** 2026-10-31.  
**Scope:** the “two flattening strategies” passage preserved in the `PROPER DIMENSIONALITY` archive family, compared against authenticated 2024 and 2026 Nathan-authored geometry messages and the assistant/NotebookLM translations surrounding them.

## Executive finding

The “two flattening strategies” passage is recoverable as a NotebookLM conversation transcript, but **not as a raw ChatGPT conversation with authenticated speaker roles or message UUIDs**. The earliest extant archive copy is `00 PROPER DIMENSIONALITY .txt`, uploaded to the SAT archive on 2026-06-10. Two later files added together on 2026-09-04 are byte-identical to each other; a larger companion contains the same passage. The 2026-10-08 NotebookLM export includes the June file as a source and reproduces the passage, but all 62 exported messages are labelled `role=user`, including answer-shaped generated text. That role field cannot authenticate authorship.

The passage is therefore classified **NOTEBOOKLM-TRANSCRIPT / USER-MESSAGE-LIKE / AUTHOR-NOT-AUTHENTICATED**, not Nathan Direct. Its geometry is nevertheless partly corroborated by independent raw Nathan messages from 2024 and September 2026. The strongest authenticated taxonomy is not “two flattenings” but **three active representations**: a reduced 3D diagram, the full 4D bulk, and the actual 4D view with its 3D slice.

## 1. Source genealogy and copy relationships

### A. Earliest extant archive artifact

- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- Path: `00 PROPER DIMENSIONALITY .txt`
- Git blob: `e4836ca1f57e9da5996cf1eaad10ee436e49545a`
- First located commit: `4ebbd669d65ba5d8b86ae6ab07aa30c603856b8f`
- Commit date: `2026-06-10T10:02:22Z`
- Commit author: `Satobloc` (repository-level upload identity only)

The file contains a NotebookLM-style exchange. An embedded interface label says “Monday, June 1” and a later turn says “Today • 2:14 PM”, but the passage itself has no year, timezone, author field, raw ChatGPT conversation ID, or message UUID. The June 10 commit establishes when this file entered the repository, not when the embedded prompt was originally authored. The account-level commit author establishes file-upload provenance, not turn-level authorship.

### B. September archive copies

The 2026-09-04 commit `01d90c0b8e3768ca06c933d1f69fad543760b118` added:

- `2026 discussions/PROPER DIMENSIONALITY.txt`
- `2026 discussions/SAT THEORY — PROPER DIMENSIONALITY copy.txt`
- `2026 discussions/SAT THEORY — PROPER DIMENSIONALITY.txt`

The first two are byte-identical (Git blob `1d8cd1574a6acdc0f86691599191b74428a2c086`). The larger `SAT THEORY — PROPER DIMENSIONALITY.txt` is distinct (blob `1ea1f8d506210202517aaeb0489c5950357fa39f`) but contains the same 3,144-character source segment (3,136 characters after whitespace normalization). These are later archive copies/derivatives, not independent witnesses to the original speaker.

### C. NotebookLM export

- Path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/[🗄️] MATHEMATICO__NotebookLM_export.json`
- Git blob: `3daab8ceb9cf1dd67a8d5a798bce045b470e4870`
- Capture time: `2026-10-08T04:36:24Z`
- Messages: 62
- Exported role counts: `user=62`

The export’s source panel explicitly lists `00 PROPER DIMENSIONALITY .txt` (twice, once with a `markdown` prefix). Its message index 33 contains the file’s passage as an exact text prefix plus a final sentence. Message index 34 is an answer-shaped continuation, but it too is labelled `role=user`. Later prompt-shaped corrections and answer-shaped replies are likewise flattened. The export is useful for transcript sequence and source-panel genealogy, not for speaker attribution.

### D. Search and coverage limits

The existing Mersearch lane-4 worldline/timesheet receipt and manifest were inspected. Its compact source list did not establish the `PROPER DIMENSIONALITY` passage’s raw origin. All four shared Mersearch request lanes were occupied or unreconciled, so no new request was opened or overwritten. A bounded GitHub code search across the public `HsH` and `SAT_THEORY_ARCHIVE_2023-25` repositories found the archive copies and NotebookLM export described above. This fallback search is not an exhaustive corpus proof. No raw ChatGPT message UUID or native role graph for the June passage was recovered.

## 2. Authenticated primary-source geometry

The following are separate raw conversation witnesses, not copies of the NotebookLM transcript.

### A. March 2024 — `DIMENSIONAL GRAVITY`

- Conversation ID: `252d05c0-22ed-4ea2-a474-7966ab13145a`
- Raw file blob: `2cea1924266418e19b825b95ae51e6b7cbace7e1`
- Raw export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`

Authenticated user messages:

- `aaa2269b-7eab-4781-9454-647098d6747f`, 2024-03-22 15:20:20.623Z: the static construction has a straight 1D line, a helical 1D line, and a 2D plane; each line meets the plane at one point. The user explicitly corrects an assistant claim that the helix-plane intersection forms a spiral pattern.
- `aaa20670-fd77-4577-8e31-0a33a9e358c6`, 2024-03-22 15:23:19.544Z: time is introduced by moving the plane along the two lines while keeping it perpendicular to the straight line.
- `aaa28a9a-dcfc-4835-8359-e7da7b36911c`, 2024-03-22 17:07:55.781Z: time is described as a 3D surface intersecting strings; “now” is the current intersection, with a propagating-wavefront analogy.
- `aaa246c9-e52c-4650-84e8-b078149df0cc`, 2024-03-22 18:05:42.011Z: the universe is described as 4D and static apart from propagation of the 3D time surface; apparent 3D dynamism arises from changing intersection positions.
- `aaa24791-27b2-4b58-8f1a-19ee7e30d650`, 2024-03-23 06:14:56.575Z: complexity is attributed to interactions among filaments/structures; time-surface interaction is described as the 3D manifestation, not the source of that complexity.

### B. June 2026 — `Geometry in Physics`

- Conversation ID: `6a25a665-3a10-83ea-a7c0-cebebfdcf1d9`
- Raw file blob: `2e0c8477873583b92f20a0a3f2af6528643b4a8a`
- Raw export: `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.06.07•26.06.10•Geometry in Physics — raw.json`

Authenticated user message `0a1829be-9bf1-4801-aba3-da5c0cb67344` (2026-06-09T01:37:16.817Z; 2026-06-08 21:37 EDT) corrects an older particle description: electron as a single-coil particle worldline/tube; quark composites described with two-/three-braid language; photons and true bosons are vibrations on filaments rather than filaments themselves. This does not, by itself, specify the dimension or boundary construction of a finite-core tube.

### C. September 2026 — `Ravel [H(s)H] Syncmathcek`

- Conversation ID: `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`
- Raw file blob: `c49367b0faa424491e7b3520a034b9e44fe6897f`
- Raw export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.06•26.09.10•🎼 Ravel [H(s)H] Syncmathcek — raw.json`

Authenticated user messages:

- `a63b981d-d614-4da8-9cd3-7a018ed221e3`, 2026-09-06T20:10:29.947Z: the filament is described as the totality of the 4D particle trajectory, not an object that itself has a separate trajectory. Deformation, motion and oscillation are allowed, while the block-universe picture is explicitly treated as a temporary construction method.
- `496a15ea-0263-459d-b815-908f52155b90`, 2026-09-07T10:06:12.842Z: three active representations are distinguished: a reduced 3D Minkowski-style diagram, the full 4D bulk, and the actual 4D view with our 3D slice. The message says the 3D Borromean-link picture is not quite right and offers a 4D slinky only as an exploratory analogy. It describes time as the outward direction from every point, allows dynamics at least at the intersectional surface/thickness and possibly throughout the 4D bulk, and mentions an induction-current/intersectional-thickness account tentatively.
- `3d0ad680-51db-4c79-ad4a-9bbacada24ef`, 2026-09-07T07:46:38.573Z: standard Kerr is recognized as a 4D spacetime solution; the proposed visualization chooses a spatial Kerr section and extends that section along the filament. The message explicitly warns against treating a 4D Kerr spacetime as the cross-section of another 4D object.

## 3. Geometry map: keep the representations typed

The source snapshot used HsH `main` at `0a3916bb5710c64b58960c9345b9793da1416551` and SAT archive `main` at `db32abc75a4a2cff3afc6de895cd7edb9eb62d82`. The diagram below is a source-fidelity reconstruction, not a canonical new ontology. Symbols are local to this audit.

```text
NATIVE / FULL-GEOMETRY VIEW
    4D bulk and 4D particle history
       ├── filament/worldline as a 4D history (direct Sep 2026 wording)
       ├── 3D time surface (direct March 2024 wording)
       └── actual 4D view with a 3D slice (direct September 2026 wording)

DIAGRAMMATIC / TOY REDUCTION
    1D straight line or helix + 2D plane in 3D
       └── one intersection point
             └── move the plane under the stated perpendicularity constraint
                   └── the intersection points change along their carriers

CURRENT H(s)H BEDROCK DISTINCTION (separate authority)
    1D worldline/centerline approximation  ≠  finite-core worldtube
    4D finite-core worldtube               ≠  its 3D timesheet section
```

### Candidate map composition (LOCAL: audit notation, not canonical)

| Map | Intended role | Conditions / missing source definition |
|---|---|---|
| `P_c : W⁴ → γ¹` | Project a finite-core carrier to a centerline/filament proxy. | Requires a specified tubular neighborhood, normal bundle, and retraction; it discards core thickness. No historical source here defines it. |
| `Q_t : Σ³_t → Π²` | Reduce a 3D timesheet to the 2D toy plane used in the diagram. | Requires a chosen chart or projection and a rule for the discarded coordinate. No source establishes that this projection preserves topology or angle. |
| `I_t = W⁴ ×_{M⁴} Σ³_t` | Form the actual carrier/slice intersection (fiber product/pullback). | Requires embeddings into the same ambient manifold and a transversality/regularity condition. The 3D result follows only if `W⁴` is a full-dimensional region and `Σ³_t` is a 3D hypersurface. |
| `O_t : I_t → D³` | Map the section to an observed 3D representation or data space. | No observation/readout map is defined in the recovered source cluster. |
| `p_t = γ¹ ∩ Π²` | Produce the 0D point in the toy construction. | Requires the line/plane intersection to be transverse. A finite-thickness slab instead of a plane generally gives a segment, not a point. |

The candidate composition is `O_t ∘ I_t : W⁴ ⇢ D³`, where the dotted arrow indicates that the required maps and domains are not yet established. The toy route `p_t` is a separate approximation through `P_c` and `Q_t`; no commuting diagram equating the two routes is present. In particular, no source proves that the point-plus-angle representation preserves the 3D section’s topology, curvature, or finite-core information.

The March 2024 toy plane is 2D in a 3D toy space; it is not the 3D timesheet in the 4D construction. The current BEDROCK snapshot (blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`) separately states that H(s)H extends a worldline as a finite-core worldtube and that a worldline/centerline approximation is admissible only where its limit and neglected terms are justified (`BEDROCK.md`, BR-005 and the finite-core/worldline clarification, lines 309–314, 391, 475). Do not backdate that current definition into every historical use of “tube”.

A conditional dimensional statement is available: if the carrier is a full-dimensional 4D region and the resolving object is a transverse 3D hypersurface in a 4D ambient manifold, their intersection is 3D. But that is not established merely by the word “worldtube”. If the carrier is a 1D centerline, the intersection is 0D; if it is a 3D boundary, the intersection with a 3D hypersurface is generically 2D. If “timesheet thickness” means a finite 4D slab rather than a zero-thickness 3D level set, the intersection is not automatically 3D. The source does not define which object is meant in every passage.

## 4. Original propositions versus translations

| Source proposition | Historical translation / fidelity finding |
|---|---|
| 2024: static 1D line and helix each meet a 2D plane at one point. | Assistant node `5f8f77b5-7fbc-4a5e-811e-0decef638139` incorrectly describes a spiral pattern of intersections; corrected in-thread by `aaa2269b`. |
| 2024: move the plane along the two lines while maintaining perpendicularity to the straight line. | Assistant node `2717a7f0-664a-45b3-a4a3-7834e42a4f4e` offers a plausible moving-intersection picture, but adds a specific kinematic reading: the plane itself moves along the helical line and point H combines linear and rotational motion. The direct message only says the plane moves along the two lines while remaining perpendicular to the straight line; it does not define a unique rigid-motion path. The assistant's description is an extrapolation, not a derived transformation. |
| 2024: time surface is 3D in a 4D universe. | Assistant node `6cbca29a-fc78-4fe0-a544-8396f4452864` calls it a 4D spherical surface, changing the stated dimension. |
| 2024: complexity comes from interactions among filaments; the time-surface intersection is the 3D manifestation. | Assistant node `155dec17-1860-498f-8cae-b078edf78ddb` reverses the causal attribution by making time-surface interaction the source of complexity. |
| 2024: user says “filaments, threads, ropes, etc.” | Assistant node `d8d4e087-fc96-4c07-8bd0-9ebb7327e0c4` expands this into a detailed taxonomy (twines, yarns, bundles, heloids, loops, tethers, etc.) and attributes the expanded list to the user. Those additions are assistant-generated. |
| September 2026: three active representations; 4D bulk and 3D slice remain distinct. | This is the strongest authenticated source for the representation hierarchy. It does not supply the full `PROPER DIMENSIONALITY` finite-thickness construction or a unique radial metric. |
| June NotebookLM passage: two flattenings, a 3D intersection manifold, and a cosmological outer shell. | Useful prompt-like material, but raw author/message identity is missing. Preserve as unverified source text, not Nathan Direct. |

**Versioned source tension:** March 2024 describes the 4D universe as static apart from propagation of the 3D time surface (`aaa246c9`). September 2026 allows dynamics at least at the intersectional surface/thickness and possibly throughout the 4D bulk (`496a15ea`), while the September 6 filament message also permits deformation and oscillation (`a63b981d`). This may be a refinement or a change of model; the archive does not yet state the reconciliation. Preserve both versions rather than harmonizing them silently.

## 5. NotebookLM response overreach and unresolved types

The answer-shaped continuation after the June prompt-like passage introduces, among other things, four “identical spacelike dimensions”, SO(4) rotations, U(1)/SU(2)/SU(3) gauge identifications, BV push-forward, 1D AKSZ, a 24-cell stabilization, a radial hyperspherical metric, Hopf/Borromean radial sectors, a Z3 fusion gate, and a mass integral involving `sin²(theta4)`. These are not established by the authenticated direct messages above. The prompt-shaped turn itself says not to settle on a formalism before more SAT documentation has been seen; the answer-shaped continuation immediately does so.

A later answer-shaped NLM message rejects a temporal axis in favor of a radial expansion parameter and introduces a “spherical halo” expanding from a center. A subsequent prompt-shaped turn challenges the categorical “not an axis” claim. Because every exported role is `user`, neither turn can be authenticated from the role field. The authenticated September 7 message says “time” is the outward direction from every point; that does not by itself authorize a single global center or the assistant’s specific hyperspherical metric.

The prompt-like passage also uses `H0+c`. As printed, this is dimensionally ill-typed if `H0` is a Hubble rate (inverse time) and `c` is a speed (length/time); a length conversion would have to be stated. No correction is source-authorized here. Its `theta4` also lacks a local angle convention. Current BEDROCK BR-005 defines SAT `theta4` from the time normal, but that current definition must not be silently backdated into an unverified June prompt.

The proposed “outer shell thickness” is a universe-scale hypothesis and must remain separate from the local particle intersection/mouth. The transcript does not establish that they are the same geometric object or that one derives from the other.

## 6. Proof-first triage and limits

Existing Sable PR #1098 already contains `SableCurrentSupportDegreeGate.lean` and conditional Poincare-dual degree / transverse-hypersurface dimension bookkeeping.

- PR head: `7666f2cb5b408be77e0c87f3b8ec18cc1950f55a`
- Actual CI run: `41176686005`
- Job: `124465590995`
- Conclusion: `success`
- Module blob: `0a92fcec0a51db65c68748f1c564667da9b785d5`

The generic dimension formula gives a 3D intersection when a 4D support region meets a transverse 3D hypersurface. The PR head is on `research/sable-current-support-degree-gate-20261030t0736z`. This is conditional arithmetic/formal geometry. It does not construct the physical finite-core tube, establish transversality, define the finite time-thickness, prove the intended projection, or validate the NotebookLM passage's authorship or physical premises. No new Lean theorem was added: the source statement is not sufficiently typed/authenticated for a faithful new formalization.

## 7. Glossary with authority labels

- **Toy plane (`SRC:2024-DIMENSIONAL-GRAVITY`):** 2D plane in a 3D illustration; not the 3D timesheet.
- **Timesheet/time surface (`SRC:2024-DIMENSIONAL-GRAVITY`):** 3D surface in a 4D universe, described as intersecting strings/worldlines.
- **Filament/worldline (`SRC:2026-09-06-RAVEL-SYNCMATHCEK`):** the totality of a 4D particle trajectory; not necessarily a material object moving through a separate background.
- **Single-coil electron (`SRC:2026-06-08-GEOMETRY-IN-PHYSICS`):** direct correction to older multi-strand descriptions.
- **3D slice (`SRC:2026-09-07-RAVEL-SYNCMATHCEK`):** one of three explicitly distinguished representations; exact finite-thickness construction remains open.
- **Finite-core worldtube (`HSH:BEDROCK`):** current H(s)H extension of a worldline; do not equate it automatically with the historical 1D centerline.
- **3D intersection manifold (`NLM:PROPER-DIMENSIONALITY`):** prompt-like, unverified wording; dimension depends on the actual carrier and slice definitions.
- **Global outer shell (`NLM:PROPER-DIMENSIONALITY`):** separate, unverified cosmological hypothesis; not the same object as a particle mouth.
- **theta4 (`HSH:BEDROCK BR-005`):** current convention measured from the time normal; the unverified NLM passage does not define its convention.

## 8. Discrepancy ledger and next cursor

1. Recover the original NotebookLM UI/native conversation export with trustworthy speaker metadata, or the underlying ChatGPT source if one exists. Until then, the June passage remains unverified.
2. Recover the raw October 29 conversation behind the existing paraphrase intake; do not treat the paraphrase as raw Nathan Direct.
3. Decide, from primary source, whether “timesheet thickness” means a 3D hypersurface, a finite-thickness 4D slab, a boundary, or a projection.
4. Type “filament”, “worldline”, “worldtube”, “tube boundary”, and “particle mouth” separately before composing maps.
5. Specify the diagram-reduction map, the carrier/slice intersection map, and the observation map; state regularity, transversality, and composition conditions.
6. Reuse the existing Lean gate for conditional dimension bookkeeping. Do not duplicate it or claim it proves the physical construction.
7. Keep the global shell / differential-expansion idea separate until its own primary source, dimensions, and map to the local particle section are recovered.

Related existing audits: #990 (4D/3D timesheet crosswalk), #1091 (March 2024 moving-slice source), #1112 (2024–2026 geometry-type genealogy), #1117/#1119 (worldtube/timesheet source maps), #1129 (mapping hierarchy), and #1138 (SAT-O/Blockwave current-rank source fidelity). This addendum does not replace those audits.

**Disposition:** source genealogy advanced; no new ontology, no physical calculation, no CODATA scoring, no paper-gate change, and no BEDROCK promotion.

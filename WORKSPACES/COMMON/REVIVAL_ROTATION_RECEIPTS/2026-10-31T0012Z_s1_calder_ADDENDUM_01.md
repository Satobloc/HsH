# Calder :12 source-recovery addendum 01 — Donut, physical worldtubes, Klein provenance

**Relation to prior record:** additive supplement to `2026-10-31T0012Z_s1_calder.md`. This is not a second rotation, worker activation, or new scheduled task. The original receipt and Hale handoff remain intact.

**Rotation identity:** nominal h=480; seq=2401; seq mod 19=7. Selected Calder; next Hale. Historical Calder-thread access remains unauthenticated. This is repository-grounded source work.

## 1. The Donut: original source and later formalization separated

Raw source:
- Repository: `Satobloc/HsH`
- Path: `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.06.23•26.07.05•SAT Overview — raw.json`
- Git blob SHA: `023ff77688672546aeff02deb3745289f6709c90`
- Conversation ID: `6a3a279a-10cc-83ea-9abf-4fc1dab9fb55`

Nathan Direct message `025057e3-ec0b-4ca4-a1dd-a3a3fe4fb7bc` at 2026-06-23T12:03:58.340Z explicitly identifies **FINDING THE DONUT** as the original formulation and describes the other documents as attempts to make it work.

Nathan Direct message `c4115122-1cb3-4d3d-98a7-7f28ad4562ed` at 2026-06-23T12:20:37.874Z distinguishes two claims: the closed composite curve is a proof in the geometric sense, while proving that the Donut itself functions as a prover is a separate task. Do not collapse these.

The 27-page `FINDING THE DONUT (nolat).pdf` is the primary document-level source:
- PDF SHA-256: `63b884c150954cd0f4eee5de55aef9db0c2c54d24fb7e972d61e26cae91a5dae`
- PDF Git blob: `b4be1420c4462c4cff3274475464a5beb7fd05ec`
- Extracted-text Git blob: `a788b5cc415f90de2d0382d3596ef07d68604687`
- 27 pages; PyMuPDF text extraction, no OCR.

The source develops a three-dimensional toy construction involving sphere curves, a crossbar/guide vector, the Great Annulum, a toroidal path, and the composite `Curvy_Lisa` curve. It explicitly presents this as a 3D toy, not a complete 4D physical derivation.

The later `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 2/SAT CORE — Donut canon.txt` (Git blob `be985c292bfcae7352983d596c38e7f172f6029d`) is assistant-generated. It introduces an SO(3) connection, holonomy, rational torus flow, and Fourier/spectral reconstruction. Those are formalization proposals, not Nathan Direct equations. Its claims of uniqueness or reversibility are not licensed by the original document or the June 23 source messages.

## 2. Earlier direct physical-worldtube source

Raw conversation:
- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- Path: `Gravitational Changes and Motion — raw.json`
- Git blob SHA: `8fbded973df263d24b2c1346f0f96e28ded415e7`
- Conversation ID: `69fa47d5-01c8-83ea-a5e8-6e622e87624c`

Key Nathan Direct messages:

- `2596b402-66c2-4465-a290-eac605083ef7`, 2026-05-05T20:08:36.489Z: particles are explored as four-dimensionally extended structures physically connected through past, present, and future, with a possible cross-temporal tug alongside standard gravity.
- `34b4d236-6396-4bf6-baf9-dba85a7851bb`, 21:04:44.352Z: a worldline alone omits important features; the proposed twisting depends on tube/rope diameters and winding.
- `0d2d941e-a718-4bd7-a92c-3e719fac3307`, 21:14:06.481Z: literal wrapping of two physical tubelike structures, with time treated as space.
- `6bd287bd-209a-4733-8a1c-454fae29395e`, 21:35:11.045Z: explicit rejection of passive bookkeeping; physical four-dimensional tubes/filaments twist like ropes, can continue winding after contact, and may be affected by intersection angle, other bodies, and prograde/retrograde orientation.
- `5c81580f-797c-4d4a-91a3-be53e33b7b0d`, 21:37:01.452Z: this is the intended picture for that exploratory branch; isolate it for calculation while allowing standard gravity to operate alongside it.
- `d6a8caae-cdc3-4bdc-8a04-6948f7747b4e`, 22:02:50.053Z: an older exploratory decomposition distinguishes an EM-residual contribution from winding; preserve as historical hypothesis, not current core.

The assistant's schematic `F_total = F_GR + F_aux`, history-dependent coupling constant, and later topological-linking language are assistant-generated formalizations. They are not Nathan Direct equations.

The same conversation contains a speculative filament-tension value of order `10^44`; Nathan explicitly flags that number as needing verification and questions its provenance. It is not a measured input and was not used in a calculation.

## 3. Klein-bottle chronology and source-fidelity correction

### 3.1 Earliest located Klein-bottle use is cognitive, not cosmological

Raw source:
- Path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_3/25.03.11•25.03.14•Russia's Nuclear Arsenal Maintenance — raw.json`
- Conversation ID: `67d078fd-7ff0-8003-a6a5-da87b26a2f60`
- Git blob SHA: `8cef441a6d22a38a468cba55edc7c218a87832e3`
- Canonical raw-file SHA-256: `1ad88f933c999ea20e9d8c0eb178b7773172f08b26900737026e3799a994d9b5`
- Extended-export SHA-256: `afc33b74b5bbd01de82ffa2c3c384ed94bcee6f669fcc645e1b31cf5a5d14f60`
- Nathan Direct message: `b3c31ea5-3368-41c0-88a9-06b62c356cb0`, 2025-03-12T01:32:47.489Z.

The assistant first suggested a Klein-bottle analogy for cognition; Nathan then agreed that the unities under discussion felt “Klein-bottleish.” This predates the 2025 Greene/Levin papers, but it is a cognitive metaphor, not a cosmological Klein-fabric proposal. Do not use it as evidence that the cosmological model predates those papers.

### 3.2 NotebookLM prompt: user question versus generated construction

`SAT PRE-H(s)H TIGHTENING.txt`:
- Git blob SHA: `054a76d76cd8a44b18fa4c545ece4e0e3f9f4e8e`
- Same blob appears in the archive root and the 30SEP26 dump.

It contains a user-authored prompt asking to explore a four-dimensional complex manifold with Klein-bottle-like paths through black holes and possible ER-bridge filaments, and asking how a Klein bottle might become a pervasive fabric of wormholes with Möbius connections.

The file header says `15 sources · Nov 15, 2024`, but the prompt itself has no preserved timestamp; the same file is present in the 30SEP26 dump and includes later material. The header is notebook metadata, not proof that this particular prompt was entered on that date. Do not use 2024 as the prompt date.

The detailed response proposing Möbius ER bridges, image-charge tiling, condensate walls, symmetric eversion, and causal foam is NotebookLM/assistant-generated. No explicit Nathan adoption of that detailed construction was recovered.

### 3.3 2026 candidate and supersession markers

- `WORKSPACES/SABLE/PRIORITY_BEC_KLEIN_ER_KERR_2026-09-18.md`, Git blob `ec068e534bb0f5af34eb96d9849bd5a3167026c2`, says Klein-fabric cosmology must remain an active candidate alongside other source-supported geometries; it must not be settled prematurely.
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/IMAGE_IDENTIFICATION.txt`, Git blob `cf1d2faf5d669b6b50995ad25de7675374a9986f`, is duplicated identically in another dump path. It labels the September 27 images as a tentative Klein-fabric cosmological wrapping-angle first guess and contains a first-person uncertainty note about whether the Greene/Levin headlines were seen before proposing the model.
- Image blob SHAs: September 12 thumbnail candidate `c47275f28107f8b41a4e6717b5111f77e2a43b5c`; September 27 model candidates `84c5ba2d153ff56df2a5da4730baf4ed95968bae` and `a1c4627573688a0dfd283bcb320d387cae954607`. The binary images could not be retrieved in this runtime; their contents were **not visually inspected**, and no wrapping angle was extracted.
- Raw Meridian conversation path: `LIVE CONVOS/26.10.20•26.10.21•Meridian Minkowski Ring Analysis — raw.json`; Git blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`; conversation ID `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`. Nathan Direct message `090f5160-1020-486d-9c42-df3d7dff2063`, 2026-10-21T00:17:23.235Z, says the older reciprocal filament/timesheet deformation model is no longer being used since the Klein Fabric model became common. This is a supersession marker, not a definition of the Klein Fabric.

### 3.4 External-paper date comparison

The two relevant Greene/Kabat/Levin/Porrati papers are:
- arXiv:2510.05270, first submitted 2025-10-06: `Compactification Without Orientation, or a Topological Scenario for CP Violation`.
- arXiv:2511.23447, first submitted 2025-11-28: `Klein Bottle Cosmology`.

The latter explicitly studies a (3+1)-dimensional Minkowski spacetime product with a two-dimensional non-orientable Klein bottle. It is not a four-dimensional network of ER-bridge worldtubes. The NotebookLM prompt may refer to these works, but its timestamp is unresolved; the 2024 notebook header cannot settle the chronology. The May 11, 2026 entry in `SAT TIMESTAMPS.txt` is a secondary timeline, not a raw Nathan Direct proposal. No independent-priority or influence conclusion is warranted.

Podcast SRTs contain Klein-fabric narrative but do not preserve speaker identity; they are derivative presentation artifacts, not primary Nathan Direct evidence.

## 4. Minimal representation and current Lean boundary

The source-supported candidate interface is:

`(M^4, G_frame, K, {Σ_τ}, U?, O, Π, Γ)`

- `M^4`: ambient four-dimensional domain.
- `G_frame`: explicit metric/control-frame choice; do not conflate metric frames with diagrammatic representations.
- `K`: finite-core worldtube as primary object; a centerline is optional, not a replacement.
- `{Σ_τ}`: labelled timesheet family.
- `U?`: optional responsive medium; no constitutive law is inferred.
- `O_τ(K)=K∩Σ_τ`: minimal candidate readout.
- `Π`: provenance map for source statements, equations, choices, and derivations.
- `Γ`: labelled component/interacting-system graph; an unlabelled union loses component identity and multiplicity.

The forward geometry-to-equation map depends on metric/frame, chart, parameterization, core profile, medium law, and boundary conditions. The reverse map is a relation/set of admissible geometries, not generally a unique function. Composition should preserve component labels and interaction edges rather than only taking an unlabelled union.

Existing PR #1061 evidence:
- Exact head: `8b428c5151228dc7e08e94c18e0621fe789f90e0`.
- Workflow run: `41032035940`; job: `123984395542`; overall run failed.
- `CalderWorldtubeTimesheetIncidence` compiled in the exact-head run. Its set-theoretic theorems establish slice inclusion, union distribution, bijective relabeling covariance, and conditional non-injectivity of reverse reconstruction when off-slice content is added. The theorem-specific `#print axioms` output shows only standard Lean axioms (`propext`, `Quot.sound`, and `Classical.choice` where used); no `sorryAx` appeared for these targets. The workflow did not run a separate axiom-audit stage.
- `CalderObliqueTubeSlice` did not compile: `Real.sqrt` definitions require noncomputable treatment and the module retains unsolved goals/`sorryAx` evidence. It is a synthetic Euclidean cylinder/oblique-plane fixture, not a measured physical system. It was not repaired.
- No new Lean theorem or physical calculation was performed. No named permission for a data-free geometric calculation was recovered; the explicit data/permission gate remains in force.

## 5. Operational controls

- Mersearch lane 1 has a completed requester-owned Orson cognition receipt and remains protected; lane 2 has no execution manifest/receipt and remains pending; lanes 3 and 4 have completed manifests/receipts. The request JSON `requested` field is trigger metadata, not completion evidence. All four lanes remain occupied; no new request was issued and no lane was overwritten.
- Code Grurple remains the active emergency publication interlock. Orson's cognition work and November 9 P1 were not touched. P2 November 30 and P3 December 14 remain unchanged.
- No issue-publisher action, manuscript/site change, new branch, software, fork, plugin, or theory promotion. Existing issue #1118 remains the prior verified source-identity correction; no duplicate submission.
- Unrelated reading completed: `SAT Mark V/TheTANGLE.txt`, lines 1201–1240; next cursor 1241. FIE last full review was October 27; the 14-day revisit threshold is not due.
- Existing relay task remains enabled and unchanged. No additional recurrence or cross-chat delivery is claimed.

## 6. Next source-recovery cursor

1. Locate the raw prompt/thread that produced the September 27 Klein-fabric wrapping-angle images, if retained; visually inspect the images only through an approved binary route.
2. Resolve the earliest timestamped **cosmological** Klein-fabric proposal separately from the March 2025 cognitive metaphor.
3. Recover the exact raw October 17 source for BEDROCK BR-006 before treating its wording as a direct quotation; the May 5 physical-filament conversation is an earlier direct anchor but does not by itself establish the later interbraid formulation.
4. Continue source-first worldtube/timesheet/medium mapping. Do not promote the Klein candidate, infer a constitutive law, or repair the data-free oblique-tube fixture without the required authorization.

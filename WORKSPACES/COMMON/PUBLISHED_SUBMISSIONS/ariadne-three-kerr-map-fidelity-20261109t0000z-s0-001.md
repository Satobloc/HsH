# Three-Kerr mapping and geometry-fidelity addendum

**Run key:** `REVROT3-19-20261011:696:s0`  
**Lane:** 00, Nathan Direct geometry fidelity  
**Status:** source-fidelity addendum only. No physical derivation, calculation, CODATA scoring, or theory promotion.

## Executive finding

A direct user-authored source dated 2026-10-23 describes three Kerr black holes as intertwined and states that the braid generates Kelvin vortices by disturbing surrounding vacuum tubes. The user's subsequent clarification explicitly bounds this as a **mapping, not a derivation**, and as representative grammars rather than new proofs.

That clarification controls the interpretation. The assistant's B3 braid relation and fluid-vorticity equations are recognizable mathematical grammars, not a derived physical mechanism. The exact braid object, braid word, closure, embedding, timesheet projection, and constitutive map to the medium remain unspecified.

The image attachment itself was not retrievable in this run. I inspected the user text and the historical assistant description, not the image pixels. No visual feature attributed by the assistant is independently verified here.

This is a distinct addendum to the earlier Kerr and geometry work in issues #1271 and #1351, the finite-slab braid gate in #238, the worldline/worldtube audits in #1323 and #1477, and the source-attribution work in the published Mira and Orson reports. It does not replace those artifacts.

## Source custody and authorship

A later speaker-labelled self-attestation identifies **Fundamental Intuitions** as the only document in the older technical stack written by Nathan. The public source audit is in the Mira geometry-fidelity report. The document is dated 2025-02-02 and was updated 2026-02-26; its current extracted-text copy is:

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`
- Git blob SHA-1: `81ae23a106939cba7e3d134ed5c90a7d7a979a25`
- SHA-256 of repository text: `88c358110900a105aed3032e569b16965192404b75b3dfc92b9410b4212698e3`

The 2025-10-22 user message in the Blockwave conversation reproduces the Fundamental Intuitions geometry, but the separate self-attestation is the stronger document-authorship witness.

The following equations and documents must not be relabelled Nathan Direct:

| Artifact | Date/provenance | Git blob SHA-1 | SHA-256 | Classification |
|---|---|---|---|---|
| `SAT4D_LIVE_DRAFT.txt` | June 2025 byline; archive timestamp not reconciled | `2a79fe25018cce7e99a2c33786d88b0551db6ae7` | `c3f90cdeda667f20c7ab9ab33eea2e23c5245d94c1e4f99f3aec5e3e7f1f6cb7` | Historical formalization. Its byline does not override the later authorship self-attestation. |
| `SAT O1 4D.txt` | Unbylined; first extant archive commit 2025-10-27T00:40:28Z | `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937` | Historical formalization. |
| `🧱BLOCKWAVE.txt` | User-supplied attachment uploaded 2025-09-16T16:31:26.687Z; first extant HsH Git path 2026-10-08T02:42:49Z | `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` | `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664` | User-supplied artifact, internal authorship unresolved. |
| `SAT—Blockwave Ideal Model.txt` | Unbylined; first extant HsH Git path 2026-10-08T02:42:49Z | `dd0631bc0b25c951dc5e1d6738280e08487b46b2` | `b14f59c982c94839f23c0a5de24979fcbb7bd346fe0ae902ca097a26e6afc681` | Historical model document. |
| Blockwave assistant transcript | Assistant generated the unified action on 2025-10-19; user later requested that its sector summary be saved | `82ff09f14367ffb872d22b7c3cc108e2473a92d0` | `4bafe35cdfbd50d038481bb572d3516726adbe9b5931da35b634876816fb814d` | Assistant reconstruction, not Nathan Direct. |

The assistant's 2025-10-19 unified action merged material from a user-supplied attachment and an unbylined model document. The 2025-10-22 memory request copied the assistant's four-sector summary; it is not independent authorship of those equations. The assistant's later affirmative claim that this Lagrangian was enough to derive essentially all physics was unsupported and is not retained as a result.

The 2026-10-23 geometry-comparison conversation is a separate direct user-authored visual message. Its raw export fingerprint and message timestamps are retained in the run receipt; private conversation identifiers are not reproduced in this public artifact.

## Nathan Direct geometry, with claims bracketed

The authored Fundamental Intuitions text gives the strongest stable descriptive core:

1. A physical filament is represented as a one-dimensional worldline in four-dimensional spacetime.
2. A three-dimensional time wavefront or time surface intersects that worldline.
3. A particle is associated with the intersection event.
4. Interactions can transmit energy or influence in both directions along the extended filament, with tension, tensile strength, and finite flexibility proposed as limits on backward transmission.
5. The interaction can feed back on the time surface and contribute to curvature.
6. The intersection geometry, including a proposed theta_4 angle, is associated with particle mass and properties.
7. Helical or twisted filament traces are proposed as a geometric vocabulary for particle structure and interactions.
8. Bosonic/light-like behavior is described as energy transfer or ripple behavior; the vacuum is proposed as an aligned filament structure; string theory is treated as a partial geometric mapping.

These are direct descriptive propositions, not a specified metric, action, constitutive law, particle spectrum, or empirical result. The source does not define a unique theta_4 convention, a quantitative mass map, or a measured prediction.

## Historical equations preserved verbatim, with corrections kept separate

### SAT4D historical curve/action

The author-attributed but non-Nathan-Direct `SAT4D_LIVE_DRAFT.txt` records:

```text
gamma^mu(lambda) = (
  lambda,
  A_x sin(k_x lambda + phi_x),
  A_y sin(k_y lambda + phi_y),
  A_z sin(k_z lambda + phi_z)
)

v^mu = dot(gamma)^mu
S[gamma] = integral d lambda L
L = (1/2) m v^mu v_mu - V_tension(gamma)
```

The separate unbylined SAT O1 module calls the worldtube the four-dimensional volume swept by a vibrating filament. That is one historical use of the word, not proof that every later use of “worldtube” denotes the same object. The sweep/thickening map from a one-dimensional curve to a four-dimensional volume is not specified in that module.

### Blockwave historical artifact

The user-supplied, authorship-unresolved `🧱BLOCKWAVE.txt` records:

```text
A_mu(theta) = alpha_* nabla_mu theta
F_munu(theta) = nabla_[mu A_nu](theta)
L_holonomy = (g_h / 2) F_munu J^munu
nabla_mu J^munu = 0
J^munu = (1/2) epsilon^munurhosigma nabla_rho B_sigma
```

The unbylined `SAT—Blockwave Ideal Model` instead presents the field set `g, u, theta` and a compact-phase/winding/holonomy block without this `J^munu` current. The two source versions are not silently merged.

### Separate mathematical correction

Under the standard normalized antisymmetrization convention:

```text
nabla_[mu A_nu] = (1/2)(nabla_mu A_nu - nabla_nu A_mu)
```

The assistant's expanded Blockwave transcript switches between the bracket form and the full difference form. Those differ by a factor of two unless the bracket convention is explicitly changed.

For a smooth scalar phase and a torsion-free connection:

```text
A_mu = alpha_* nabla_mu theta
F_munu = alpha_* (nabla_mu nabla_nu theta - nabla_nu nabla_mu theta) = 0
```

The existing Morrow formalization covers this conditional local exactness result. A nonzero local curvature contribution would require a specified torsionful connection, nontrivial patching, or a different connection structure. None is supplied by the historical equation alone.

Likewise, if theta is circle-valued with winding number n:

```text
oint_gamma A = 2 pi alpha_* n
```

The claim that this is automatically in 2 pi Z requires a normalization or quantization condition on alpha_*. Compactness of theta alone does not supply that condition.

The direct theta_4 intersection angle, the Blockwave compact phase theta, and the current local Triswale theta_4 registry convention remain separate namespaces. No source-defined map identifies them.

## Three-Kerr mapping: original versus translation

**Direct user proposition, 2026-10-23:** three Kerr black holes are intertwined; the braid is associated with Kelvin vortices generated by disturbing surrounding vacuum tubes. The user later states that this is a mapping, not a derivation.

**Assistant translation:** a three-strand braid grammar, the B3 relation, and standard fluid vorticity/circulation identities were offered as representative descriptions. These are standard mathematical structures. They do not establish that the Kerr objects are literal braid strands, that the vacuum tubes are ordinary-fluid vortex cores, or that a physical Kelvin-vortex mechanism has been derived.

The assistant's earlier question about whether the drawn rings are themselves braided or are cross-sections of braided worldtubes was not resolved in the inspected text. The exact object type therefore remains open. The assistant's QED/QCD labels and visual details are not independently verified because the image itself was unavailable.

The current Primary Operational Guideline explicitly prohibits analogy transfer: an H(s)H/SAT worldtube is not an ordinary-fluid vortex core. The medium response remains provisional. The 2026 mapping is therefore a test hypothesis connecting geometric grammars, not a physical equivalence or new derivation.

## Glossary and dimensional map

| Term | Type | Source status |
|---|---:|---|
| gamma, worldline/filament | 1D curve in 4D | Nathan Direct descriptive geometry |
| Sigma_t, timesheet/time wavefront | 3D hypersurface in 4D | Nathan Direct descriptive geometry |
| W, SAT O1 worldtube | 4D volume in that historical module | Unbylined historical definition |
| dW, tube boundary | 3D hypersurface | Distinct from the 4D volume |
| S, worldsheet | 2D surface in 4D | Blockwave current-support interpretation |
| J^munu | Antisymmetric 2-form current | Historical Blockwave artifact |
| theta_BW | Compact scalar phase | Historical Blockwave artifact |
| theta_4_FI | Proposed intersection angle | Nathan Direct, convention incomplete |
| B3 | Three-strand braid group | Standard mathematical grammar |
| omega, Kelvin vorticity | 3D fluid vorticity field | Standard fluid-mechanics object |
| Kerr geometry | Lorentzian GR solution family | Standard reference, not a specified three-body solution |
| UI/jig | Configurable study tool | Tool, not a physical primitive |

Under transversality in a four-dimensional ambient manifold, the dimension count is:

- 1D worldline intersecting a 3D timesheet: 0D event.
- 2D worldsheet intersecting a 3D timesheet: 1D trace.
- 3D tube boundary intersecting a 3D timesheet: 2D surface.
- 4D tube volume intersecting a 3D timesheet: 3D volume.

This is conditional dimension bookkeeping. It does not establish transversality, identify the source object, or provide the missing projection maps.

### Mapping diagram

```text
Nathan Direct:
  gamma (1D worldline) --intersects--> Sigma_t (3D timesheet)
                                      |
                                      v
                               particle event (0D)

Historical SAT O1:
  gamma + unspecified transverse/vibrational sweep
                 -- T ? --> W (4D worldtube volume)
                              |
                              +--> boundary dW (3D)

Historical Blockwave:
  S (2D worldsheet) --Poincare duality--> J^(mu nu) (2-form current)
  S intersect Sigma_t (3D) --> 1D trace

2026 mapping proposal:
  three Kerr objects -- braid word beta in B3 ? -->
  3-strand braid -- projection P ? --> v(x) on a selected Sigma_t
  -- curl --> omega -- circulation/readout R ? --> proposed QED/QCD correspondence
```

Every question mark is a missing source-defined map or condition. The current source does not specify the sweep T, the braid word and closure beta, the slice projection P, the constitutive map to v(x), or the downstream readout R.

## Discrepancy ledger

| ID | Mismatch | Current disposition |
|---|---|---|
| G1 | 1D worldline, 2D worldsheet, 3D boundary, and 4D volume are used near one another | Keep distinct; define sweep, boundary, and slice maps |
| G2 | SAT O1 calls a 4D volume a worldtube; some assistant translations discuss a 3D tube/surface | Historical term is source-dependent; current HsH finite-core object still needs an explicit type declaration |
| G3 | Blockwave J is a 2-form current, not a 4D volume current | No map from J to W is defined |
| G4 | theta_BW phase and theta_4_FI intersection angle are conflated in some translations | Separate namespaces; no identification |
| G5 | Antisymmetrization bracket versus full difference changes F by a factor of two | Preserve source form; normalize before comparing coefficients |
| G6 | Compact phase is used to assert quantized A-holonomy | Specify alpha_* normalization and global bundle/patching data |
| G7 | Three-Kerr braid object, word, closure, and embedding are unspecified | Mapping only; image not independently inspected |
| G8 | Kelvin-vortex response is mapped onto the SAT worldtube | No constitutive projection; current guideline forbids identifying the two objects |
| G9 | QED/QCD labels appear in assistant interpretation | Not confirmed as direct source propositions; no derivation |
| G10 | SAT4D draft byline suggests Nathan authorship | Later direct self-attestation identifies only Fundamental Intuitions as his authored document |
| G11 | Assistant asserted that the historical Lagrangian could derive essentially all physics | Unsupported overclaim; withdrawn as a result |

## Formalization status and CI correction

Existing formal work is sufficient for the currently explicit mathematical gates; no new Lean module was added.

- **PR #1135:** the local scalar-Hessian exactness theorem compiled in successful merge-reference Actions run #41164589389, job #124429317733, source commit `4d7b0fb...`, 8,944 build jobs. Exact-head-only verification was not established. This formalizes the stated symmetric-connection condition, not the source translation or physical premises.
- **PR #873:** the generic fiber-factorization theorem compiled in run #42153410233, job #127681789766. The job log checked out synthetic merge commit `a2c3304edafa5274530ce5286cbe15ac1ed47b0b`, with parents `c7dc2c...` and PR head `1971e3d...`; the PR's current base at inspection was `61cc8b...`. The target module blob matched the PR head, but the root aggregator/import closure differed. The 8,955-job build succeeded, while tests, lint, nanoda, and the separate axiom audit were skipped. Correct status: `MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_ONLY_BUILD_UNVERIFIED / CURRENT_BASE_MERGE_BUILD_UNVERIFIED`.
- The h677 report in issue #1477 called this run exact-head. That classification was wrong. Issue #1443 established the checkout-identity method; this addendum applies it to the later #1477 claim.
- **PR #1098:** run #41328086467 was a merge-reference build, not an exact-head build.
- **PR #1133:** run #41246994835 was a merge-reference build; the later current PR head was not verified by that run.
- **Issue #238:** the finite-slab braid result is a conditional mathematical theorem for its stated configuration-space assumptions. It is not a Kerr/vacuum physical model.

The factorization criterion already formalized in PR #873 is useful once actual maps exist:

```text
exists h, g = h after f
iff
for all x1,x2, f(x1)=f(x2) implies g(x1)=g(x2)
```

It says that a readout factors through a projection exactly when it is constant on every fiber of that projection. It does not instantiate the SAT/H(s)H projection or establish physical truth. No local Lean/Lake/Elan installation was available; the statuses above are verified existing Actions runs, not a new local run.

## Next deeper cursor

1. Recover the image asset or retain the explicit visual-evidence limitation.
2. Declare whether each Kerr object is a worldline, worldsheet, tube boundary, or tube volume.
3. Specify the ambient 4D geometry and the exact three-strand braid word, endpoints, crossing convention, and closure.
4. Define the worldtube-to-timesheet projection f, then define the downstream observable g. Apply the existing fiber-compatibility theorem only after both maps are source-defined.
5. Define a constitutive map from the selected slice to medium response and vorticity. Do not identify the SAT worldtube with an ordinary-fluid vortex core.
6. Keep theta_BW, theta_4_FI, and the local Triswale theta_4 convention separate until an explicit map is supplied.
7. Only then consider a further Lean formalization. Physical calculation still requires an identifiable measured system, dataset, provenance, units, uncertainties, and prediction-versus-fit separation.

**Epistemic disposition:** direct geometric mapping recorded; mathematical grammars identified; translation gaps and assistant overreach recorded; no physical equivalence, derivation, prediction, fit, independent measurement, or theory promotion claimed.

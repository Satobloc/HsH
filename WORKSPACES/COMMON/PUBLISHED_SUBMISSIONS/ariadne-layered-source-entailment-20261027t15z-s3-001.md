# Ariadne :36 - layered-source entailment gate (Archive EQ0042)

**Run:** `REVROT3-19-20261011:399:s3`. Selected continuity handle Ariadne; next Alberr. This is current assistant reconstruction, not authentication of Ariadne's historical thread.

## Architecture improvement

The earlier centerline audit was correct at the equation layer but too weak to settle the whole source stack. The old SAT-O file displays a centerline, tangent, and centerline action, yet it also names the swept vibrating-filament volume a “Worldtube.” A later Nathan-direct passage says thickness, bending, and interaction had already been modeled and that the transition was toward explicit finite-core boundary/intersection description.

Therefore:

1. An equation-only model without thickness is a countermodel to the claim that the **displayed equations alone** force thickness.
2. It is not automatically a countermodel to the combined current source stack.
3. To refute combined-source entailment, one witness must satisfy every declared controlling source layer and still violate the claimed property.

This prevents both source inflation (“the word worldtube proves a constitutive radius”) and source erasure (“the equation omits radius, therefore the project never committed to thickness”).

## Mersearch-first and original sources

Existing Mersearch result:
`indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`, blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`, generated 2026-10-07; coverage 3,987 files / 6,597,201 records / 224 hits.

Historical SAT-O source:
`Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT O1 4D.txt`, complete read, 3,521 characters, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; internal authorship/date unresolved.

Verbatim mathematics:

```tex
\gamma^\mu(\lambda) =
\left( \lambda,
A_x \sin(k_x \lambda + \phi_x),
A_y \sin(k_y \lambda + \phi_y),
A_z \sin(k_z \lambda + \phi_z) \right)
```

```tex
v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}
```

```tex
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu),
\qquad
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
```

The same source's prose defines “Worldtube” as “The 4D volume swept out by the vibrating filament, representing its real, physical presence in spacetime.” That is a historical source claim; the displayed state/action still do not type a radius field, cross-section, normal frame, twist, or contact surface.

Later Nathan-direct source:
`DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/H(s)H 2026 STARTUP DOCS.txt`, complete fetched file 75,885 characters, blob `68200d849152dcb0c4fc1814f8b1789d499ebca8`; relevant passage begins at character offset 18,076. Verbatim opening:

> “Well... we *have* been treating the filament as having a thickness, bending, and so on. Cross-sectional geometry is perhaps a bit of a misnomer...”

It continues that accessible geometry may be thickness and interaction properties and that bridge interior remains uncertain. The internal timestamp is only “Today 4:09 AM”; the file is in the 30 September 2026 dump, so a more exact message date is unresolved.

## Exact Lean module core

```lean
def Entails {Model : Type*}
    (admissible claim : Model → Prop) : Prop :=
  ∀ model, admissible model → claim model

def Combined {Model : Type*}
    (first second : Model → Prop) : Model → Prop :=
  fun model => first model ∧ second model

theorem entailment_monotone_under_added_source
    {Model : Type*}
    (equationLayer sourceLayer claim : Model → Prop)
    (hentails : Entails equationLayer claim) :
    Entails (Combined equationLayer sourceLayer) claim := by
  intro model hadmissible
  exact hentails model hadmissible.1

theorem equation_countermodel_refutes_equation_entailment
    {Model : Type*}
    (equationLayer claim : Model → Prop)
    (model : Model)
    (hequation : equationLayer model)
    (hnotClaim : ¬ claim model) :
    ¬ Entails equationLayer claim := by
  intro hentails
  exact hnotClaim (hentails model hequation)

theorem equation_countermodel_excluded_by_combined_entailment
    {Model : Type*}
    (equationLayer sourceLayer claim : Model → Prop)
    (model : Model)
    (hcombined : Entails (Combined equationLayer sourceLayer) claim)
    (hequation : equationLayer model)
    (hnotClaim : ¬ claim model) :
    ¬ sourceLayer model := by
  intro hsource
  exact hnotClaim (hcombined model ⟨hequation, hsource⟩)

theorem combined_countermodel_refutes_combined_entailment
    {Model : Type*}
    (equationLayer sourceLayer claim : Model → Prop)
    (model : Model)
    (hequation : equationLayer model)
    (hsource : sourceLayer model)
    (hnotClaim : ¬ claim model) :
    ¬ Entails (Combined equationLayer sourceLayer) claim := by
  intro hentails
  exact hnotClaim (hentails model ⟨hequation, hsource⟩)
```

## Actual compilation

Existing draft PR #388, branch `codex/eq0015-elias-20261024`.

- head `0d22b8335b7625cfb6eff19455a7f38db17ac818`
- module `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0042.lean`
- module blob `202b89427e284485dd76d88a57157ac3a110670f`
- aggregate import blob `93bd7afe7257a24979e0464bcfc7a9e26c859275`
- GitHub Actions run #40532424074, job #122289288161
- Lean 4.34.0; Mathlib `5ed2965256430c3649e86755f9576b54eca72435`
- log: `Built HsHVerification.ArchiveEQ0042 (5.7s)`
- all four target theorems: `does not depend on any axioms`
- log: `Build completed successfully (8960 jobs).`
- automated axiom-audit action remained disabled/skipped; these results come from explicit `#print axioms`.

No compile failure occurred in this quantum.

## Forced / optional / empirical matrix

| Question | Equation layer | Additional source layer | Current result | Required falsifier |
|---|---|---|---|---|
| Is nonzero thickness forced? | No radius variable is typed | Historical prose says worldtube/volume; later Nathan says thickness was already modeled | Project commitment may be present, but magnitude and constitutive law remain unselected | A model satisfying all controlling source requirements with zero/effectively absent thickness |
| Are twist/framing/contact forced? | Not typed in displayed SAT-O action | Later sources discuss them with mixed status | Open individually; do not bundle them with thickness | Separate full-stack countermodel for each typed claim |
| Does any extra structure predict data? | No end-to-end readout | No selected shared-parameter forward law | Empirically blocked | Frozen calibration/holdout prediction versus a standard comparator and measured likelihood |

The incoming real-data anchor remains S2 around Sgr A* from GRAVITY Collaboration, A&A 636 L5 (2020), Table E.1. Its fitted orbit can calibrate a centerline/base trajectory, but without a source-selected constitutive worldtube law and independent orientation/thickness-sensitive readout, it cannot determine which source-layer commitment is physically realized. No physical calculation was performed.

## Status and handoff

Claim status: **LEAN-COMPILED CONDITIONAL SOURCE-LOGIC / SOURCE TRANSLATION OPEN / EMPIRICALLY BLOCKED**. This does not promote thickness, ER identity, Kerr structure, twist, contact, or any physical prediction.

Ravel's previous publication issue #756 is now verified: publisher commit `4d48daf4b3345181343191140a7d3c068dfb03f3`, SHA-256 `c28317ef9f01b2838d4b47435db2cb5641bb87b9ea1ad07f341948d981e41aba`, published blob `fa02f92e166f283e6e03b46b27a072e72134c7cb`.

**Alberr cursor:** build the first explicit model-class table: centerline-only, swept-volume, finite-radius tubular neighborhood, framed/twisted tube, and contact-enabled tube. For every inclusion, state the projection map, added types, compatibility hypotheses, and one countermodel. Do not treat inclusion names as physical derivations.

No task, cadence, phase, access, license, signet, chat, or BEDROCK change; no sixth recurrence and no cross-thread delivery claim.

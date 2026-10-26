# Loom source packet: Blockwave family keys and archive-tagging gate

**Status:** source/enrichment and tool-QA result; **SANDBOXED**; no physical calculation, theory promotion, or claim of original Loom-thread access.

## Specialist scope

Loom's charter requires cumulative corpus tagging with exact provenance, authorship boundaries, chronology, duplicate/superset relationships, correction and supersession edges, and durable source pointers. It explicitly distinguishes:

```text
GEOMETRIC/CONCEPTUAL CONTENT
!= METRIC/DEFINITION
!= DERIVATION/CALCULATION
!= DISPLAY GRAMMAR
!= GENERATED IMPLEMENTATION
```

This run applies that distinction to the three Blockwave action families recovered by Kestrel and Meridian. It does not rename conversations, infer revival from selection, or flatten generated prose into Nathan's voice.

## Mersearch and source controls

Mersearch-first was satisfied by reusing the completed three-repository manifest for `2026-10-21-orson-nlm-big-haul-math-001`: stable implementation commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`, manifest blob `0f017d6f557d24c721e417d1fe3c49abf0653991`, 13,897 files / 23,825,506 records scanned subject to declared exclusions. No shared request was overwritten and no new comprehensive-search claim is made.

Primary sources were independently fetched from GitHub on **2026-10-26 UTC**:

1. `SAT_THEORY_ARCHIVE_2023-25/LEAN CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt`, blob `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`, lines 1–90 / 3,675 characters read.
2. `HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE EXTENSION .txt`, blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, lines 1–130 / 5,379 characters read.
3. `HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, action/definitions and primer read; full file metadata 384 lines / 24,627 characters.

Historical creation dates and span-level authorship are unresolved unless a separate source establishes them. Notebook collection dates below are not substituted for source dates.

## Concrete existing-index experiment

The connected `NotebookLM Index` Google Sheet was inspected read-only using metadata-derived `Sheet1` (397 rows, 66 columns) and bounded row searches. No account identifiers or underlying private source details are reproduced.

Observed collection rows:

| Sheet row | Collection title | Indexed sources | Collection date |
|---:|---|---:|---|
| 387 | `Blockwave Watchlist Nov-Dec 2025` | 22 | 2025-09-14 |
| 391 | `SATO/BLOCKWAVE` | 50 | 2025-10-23 |
| 392 | `SATO/Blockwave TRANSITION` | 50 | 2025-10-25 |

The title/source-count/date surface is useful for discovery. It cannot answer which equation family a source contains, who authored a span, whether two passages are copies, which action was actually varied, whether a correction is established, or whether a claim is physically verified. In particular, collection creation dates cannot establish the chronology A→B→C.

**Tool decision:** do not build a duplicate index. Add or export equation-span source keys that can be joined to the existing NotebookLM rows and Mersearch results.

## Verbatim action fingerprints

### `BW-A-NR-MEDIUM`

```text
L_density =
  (1/2) rho |v|^2 - rho W(Phi)
  - (kappa/2) |grad Phi|^2
  + lambda rho Phi div(v)
```

with the source relation

```text
v = grad chi + (lambda/rho) grad(rho Phi).
```

### `BW-B-COV-U-THETA`

```text
L_core =
  (1/2) nabla(theta)^2 - mu^2 cos(3 theta)
  + lambda (u.nabla theta)^2
  + alpha P P nabla(u) nabla(u)
  + beta sin^2(theta) div(u)
  + xi (u^2+1).
```

### `BW-C-GUTHETA-J`

```text
A_mu(theta) = alpha_* nabla_mu theta,
F_mu nu(theta) = nabla_[mu A_nu](theta),
```

inside an action containing Einstein-Hilbert, compact-phase, projected `u`, `J^2`, `(nabla J)^2`, `F.J`, and optional `J M J` blocks.

These fingerprints are equation-span classifiers. The word `Blockwave` is not itself an action-family key.

## Minimal append-only source-key schema

Each equation-bearing span should produce one JSONL-like record with the following fields. The schema is deliberately narrower than a new database and can be emitted by the existing hopper/index workflows.

```yaml
record_id: stable local identifier
source:
  repository: owner/repo
  path: exact path
  git_blob: immutable blob SHA
  line_or_span: exact locator
  retrieval_date: UTC date
  source_date: value or UNRESOLVED
span_provenance:
  outer_role: user | assistant | document | unresolved
  embedded_origin: original | quotation | import | generated | unresolved
  authorship_status: verified | attributed | unresolved | hold
genre: formal_source | conversation_export | lean_like_draft | generated_proposal | other
content_layer: concept | definition | action | derivation | calculation | display | implementation
action_family: BW-A-NR-MEDIUM | BW-B-COV-U-THETA | BW-C-GUTHETA-J | unresolved
regime: nonrelativistic_3p1 | covariant_4d | reduced_1p1 | defect_current | other
variables: ordered symbol/type list
term_signature: normalized action-term list
variational_status: varied | constrained | external | mixed_or_unresolved
dimension_status: pass | fail | unresolved | not_checked
math_status: pass | corrected | fail | unresolved | not_checked
current_applicability: retained | translated | historical | rejected | unresolved
physical_verification: measured | compared | fit_only | none | unresolved
edges:
  derives_from: record IDs plus evidence locator
  corrects: record IDs plus proof/source locator
  duplicates_or_contains: record IDs plus relation type
  terminology_related: record IDs; never treated as derivation
paper_gate: P1 | P2_SOURCE_ONLY | P2_EMPIRICAL_READY | P3_GENEALOGY | HOLD
notes: bounded unresolved questions
```

### Why these fields are separate

- `span_provenance` prevents assistant-generated equations embedded in user turns from being transferred wholesale into Nathan's voice.
- `content_layer` prevents a display grammar or implementation stub from being counted as a derivation.
- `action_family` prevents the common filename/title from collapsing three incompatible variable sets.
- `math_status`, `current_applicability`, and `physical_verification` are independent axes. A corrected identity is not current H(s)H and is not measured physics.
- Edge objects preserve genealogy without overwriting failed or displaced formulations.

## Applied records

| Key | Required family tags | Correction/status tags | Edge tags |
|---|---|---|---|
| `BW-A-NR-MEDIUM` | `rho,v,Phi,chi`; nonrelativistic 3+1; constrained variational action | four stationarity equations `PASS`; printed momentum and declared dimensions `CORRECTED/UNRESOLVED`; physical verification `NONE` | no demonstrated derivation to B or C |
| `BW-B-COV-U-THETA` | `g,u,theta,xi`; covariant 4D plus claimed 1+1 reduction | projector reduction, theta signs, dispersion and hyperbolicity argument `FAIL`; physical repair `UNRESOLVED` | terminology-related to A; structurally reused by C |
| `BW-C-GUTHETA-J` | `g,u,theta;J`; optional `B` potential and `M` response kernel | local `F=d(alpha_* dtheta)=0`; `J` variational status and dimensions `UNRESOLVED`; physical verification `NONE` | `RECOMPOSES/EXTENDS` B; no A→C derivation; no automatic edge to current finite-core H(s)H |

The source-local Meridian correction is retained:

```text
F_mu nu = alpha_* nabla_[mu nabla_nu] theta = 0
```

for a smooth scalar on a torsion-free chart. Nontrivial winding requires explicit global patching/defect structure or an independent connection; the archive record is preserved rather than silently rewritten.

## Admission queries enabled by the schema

For the Nov. 30 paper, a source may enter an empirical model section only if its record has an exact locator, resolved variable types, declared dimensions, a non-null derivation edge, explicit variational status, and a named measured system/dataset with fit-versus-held-out separation. Otherwise it remains `P2_SOURCE_ONLY` or `HOLD`.

For the Dec. 14 paper, all three families may appear in genealogy/negative-results tables, including failures. A family enters current H(s)H dynamics only through a separately audited translation edge identifying finite-core worldtube, centerline limit, cross-section, dynamics and readout.

The Nov. 9 cognition paper has no direct theory dependency. This tagging schema may be a methodology example only if it does not displace Orson's actual cognition evidence.

## Publication receipt closed and return cursor

The preceding Meridian packet was independently compared byte-for-byte with the published repository file: 10,560 characters matched exactly; remote Git blob `a66ceefff8cf5d6fae23b0886620b37e9f002cae`. Publisher commit `1df981f5d20b0ea328905c31069482ac8da89d95`; SHA-256 `a749286754cf350bf8b4556d81a34f9b5e7fdb91b549384b9d646314a7a55e99`.

Next Aster cursor: blind-test the three family fingerprints against a bounded set of additional Mersearch/NotebookLM-located Blockwave passages. Score ambiguous and mixed-family spans explicitly; do not force every `Blockwave` title into one family. Review whether the existing Archive Math Hopper can emit these keys before proposing new code.

No physical calculation was executed. No private source contents, account identifiers, scheduler identifiers, access changes, or protected signet are included.

# Loom source-tag ledger: Thirring / 8π / frame-dragging claim separation

**Date:** 2026-11-05  
**Run key:** `REVROT3-19-20261011:619:s3`  
**Worker / successor:** Loom (1) → Aster (2)  
**Status:** ADDITIVE SOURCE TAGGING / COEFFICIENT-PROVENANCE GATE / NO THEORY PROMOTION

This is a bounded addendum to the existing Loom source-fidelity ledger. It tags the three direct user-role messages cited by the h619:s3 carrier/trace/frame comparison that were not present in the existing 2026-11-04 ledger or the verified-words compendium. It does **not** claim exhaustive retagging of the full conversation.

## 1. Raw-source identity and ancestry

- Repository: `Satobloc/HsH`
- Conversation: `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`
- Raw export: `LIVE CONVOS/26.10.20•26.10.21•Meridian Minkowski Ring Analysis — raw.json`
- Raw Git blob SHA-1: `56a84cb85d5c386efa4ea11d322d11e95e2c7703`
- Mapping nodes: 3,678
- User-role messages: 112 total; 106 on the current ancestry
- Assistant-role messages: 1,292 total; 1,284 on the current ancestry
- Current ancestry nodes: 3,660

All three newly tagged messages below are user-role nodes on the raw export's current ancestry. The counts above are raw-export structural counts, not a claim that all 106 current-ancestry user messages have been tagged in this ledger.

## 2. New Nathan Direct tags

| Message ID | UTC timestamp | Verbatim direct text | Tag / epistemic status |
|---|---|---|---|
| `861acc12-5590-4bbb-aff1-b16a89bd18d9` | 2026-10-21 07:04:01.650250Z | “We know handedness. W need to understand how reverse winding comes about ” | `NATHAN_DIRECT / QUESTION / REVERSE_WINDING / HANDEDNESS`. A question, not a mechanism, equation, or demonstrated result. Preserve the literal “W”. |
| `fce13cbe-a8cd-479e-bbca-ee56224301e2` | 2026-10-21 07:07:49.207875Z | “Yes… we need to characterize the action of thirring. :)” | `NATHAN_DIRECT / REQUEST / THIRRING_CHARACTERIZATION`. A request for characterization, not a derived Thirring law. Preserve lowercase “thirring” in the source. |
| `9a43861c-ba2f-4d8e-add7-f4de10324149` | 2026-10-21 07:12:22.028818Z | “gravitational Thirring dragging / Let’s just call it thirring. / Now, we’ve discovered elsewhere that the Einstein 8π is where Gauge decoupling arises in frame dragging” | `NATHAN_DIRECT / MECHANISM_HYPOTHESIS / EINSTEIN_8PI / GAUGE_DECOUPLING / FRAME_DRAGGING`. Direct hypothesis, but no source equation, derivation, units, gauge condition, observer map, or unique observable is supplied in this message. Do not promote it to an established mechanism. |

### Existing tags deliberately not duplicated

- `c5525f53-b7cc-4444-8102-3bf6fdb1c892` is already tagged in `WORKSPACES/COMMON/tagging_ledgers/2026-11-04-LOOM-READOUT-ACCELERATION-AFFINE-SLICE-PROVENANCE-01.md`. Preserve literal `cw=t`, `Forest Normalizatin`, and `++++`; any corrected spelling or alternative convention belongs in a separately labelled correction, not a silent rewrite.
- `59cdedb4-be76-455a-87c8-a6089de951b3` is already represented in the existing ledger and verified-words compendium. Its “3D rotation absolutely is 4D curvature” sentence is a direct assertion, not a typed curvature theorem or measured result.

Assistant-authored formulas and later explanatory prose in the same conversation remain `ASSISTANT_RECONSTRUCTION` or `PROPOSAL`, not Nathan Direct. In particular, expressions introduced by assistant turns such as `m+Ω_N` or `A_u du/dt` are not source-authenticated Nathan equations.

## 3. Historical-source correction: phenomenon versus mechanism

The SAT archive's extracted text for **FINDING THE DONUT (nolat)** contains a page-15 passage saying the earlier explanation that pointed to the 8π term was “technically incorrect,” while the phenomenon being described was later recognized as frame dragging.

- Extracted-text path: `_AUTO_EXTRACTED_TEXT/FINDING THE DONUT (nolat).txt`
- Extracted-text Git blob SHA-1: `a788b5cc415f90de2d0382d3596ef07d68604687`
- Read extent: page-15 passage, extracted-text lines 430–470.
- Classification: `HISTORICAL_SOURCE`, not raw-role-authenticated Nathan Direct. The flattened extraction does not supply message-level speaker metadata.
- The earlier receipt records a PDF SHA-256, but the original PDF bytes were not fetched and re-hashed in this addendum. The extracted-text blob above is independently identified; the PDF hash remains a prior recorded value, not a fresh verification here.

This creates an important chronology boundary: the historical source preserves a phenomenon-level recognition of frame dragging while explicitly marking the earlier 8π explanation as technically incorrect. The later 2026-10-21 direct message reopens an Einstein-8π mechanism as a hypothesis. These statements must remain separate until a new derivation reconciles them.

## 4. Typed coefficient provenance: same numeral is not same term

### 4.1 HSH_RESOURCES preprint

- Title: *Spin-charge deconfinement and emergent AdS₃ structure from a self-consistent dressing of Fierz-complete (1+1)d Dirac fermions*
- Authors in the source index: L. Haddad; K. Gonzales; J. Kahanek; M. Kolding; J. Maguire; V. Palombi; H. Truelson
- Identifier/date: arXiv: `2606.07955v1`, 2026-06-06
- Original PDF path: `PRIOR_ART/2606.07955v1.pdf` (PDF bytes not fetched in this pass)
- Human-source index blob: `9bcf57b48c78fba67121fdddd1c524751c758c54`
- Provisional bibliography record blob: `77cdf5d9c3adcf5feff26195b53d5d78e552b2d8`
- Derived-text blob: `ff40acd3b85924a6e45b8082d83f88781e5da0be`

The repository marks this record **provisional**: machine extraction metadata plus first-page heuristic only; no claim-level review implied. I read targeted extracted-text passages, not the whole paper. The `1/(8π)` occurrence is a coefficient in a 1+1D derivative-expansion term for the scalar `σ`, per Dirac flavor in Minkowski conventions, with a separate Euclidean normalization discussion involving `c/24π`. It is not the Einstein `8πG` coupling and is not a frame-dragging derivation.

### 4.2 SAT-X archive draft

- Path: `SAT X/SATx Addendum4.txt`
- Duplicate path: `SAT X/SATx Addendum4 (1).txt`
- Both paths resolve to the same Git blob SHA-1: `e1f6ec82de4019bef216f470647f803db9fe8885`
- Archive file-list timestamps: 2025-10-27 18:40:48 and 23:18:29; timezone and source-creation authority are not established.
- Classification: `HISTORICAL_ARCHIVE_DRAFT`; the file itself does not authenticate a Nathan Direct author role.

The extracted draft contains three distinct contexts:

1. A GR membrane-stress contribution written verbatim as `T^{ab}_{GR} = \frac{1}{8πG},(K^{ab}-Kγ^{ab})`. Preserve the comma after the coefficient as an extraction/source feature; do not silently repair it.
2. A separate three-generation instanton action `S_inst = 8π²/g_*²`.
3. A frame-dragging (Lense–Thirring) bullet saying rotational-foliation perturbations are required, but supplying no equation that maps either coefficient above to frame dragging.

These are not one coefficient, one equation, or one derivation. The two archive paths are identical copies, not independent corroborating sources.

## 5. Architecture improvement: coefficient-origin and claim-level gates

The carrier/trace/frame comparison now needs two separate claim levels:

- **Phenomenon level:** whether the model reproduces the frame-dragging observable. Standard GR/Lense–Thirring is the comparator. Reproducing a known GR phenomenon is a consistency/retrodiction, not by itself an H(s)H discriminator.
- **Mechanism level:** whether a specifically typed Einstein-8π term causes the proposed gauge-decoupling effect. This requires a derivation from the original action/field equations and an explicit map to an observable. The historical source's correction makes this a live hypothesis requiring independent derivation, not an inherited result.

Before two coefficients can be compared, record for each: exact numerator/denominator and powers; field content; derivative order; integration dimension/domain; units; normalization and signature convention; physical role; source/date/hash; and the map to the same observable and observer frame. A shared substring such as “8π” is not an equivalence.

### Conditional test matrix

| Hypothesis | Shared parameters and calibration | Holdout / predicted observable | Standard comparator | Failure condition |
|---|---|---|---|---|
| Frame-dragging phenomenon | One identifiable measured system; measured mass/angular momentum, orbit or gyroscope geometry, observer tetrad, instrument response, units and uncertainties fixed identically | A preregistered held-out epoch/orbit/instrument regime; precession or nodal-rate observable | GR/Lense–Thirring | Reject the tested map if the held-out observable lies outside the preregistered joint uncertainty region. No system or dataset is selected here. |
| H(s)H Einstein-8π mechanism | Same measured system and shared GR calibration; derive the exact coefficient-bearing term and its units/gauge role before fitting | A unique coefficient-sensitive residual beyond the GR prediction on a frozen holdout | Same GR/Lense–Thirring model with shared parameters | Reject the mechanism if the derivation fails dimensional/gauge consistency or if the preregistered residual is absent after shared calibration. No numerical threshold can be set before a real dataset and uncertainty model exist. |
| Cross-source coefficient identity | Exact source terms and conventions compared without renormalizing or silently correcting them | Explicit term-to-term and term-to-observable map | None until a common typed map exists | Unscorable until the map is supplied; numeral matching alone fails the gate. |

No measured system, dataset, calibration, fit, prediction, or independent measurement was introduced in this pass. The matrix is a test-design gate, not an empirical result.

## 6. Lean boundary

Existing formal work supplies a useful generic projection criterion:

- PR #873, file `FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean`, blob `0fe5390faa10113830132b12cdb98172194adfee`.
- Theorem: `hallway_factorization_iff_fiber_compatibility`.
- Formal content: a readout factors through a projection exactly when the target is constant on the projection's fibers.

The theorem is useful for observability/identifiability: if a mechanism-specific quantity varies within a fiber of the measured projection, that projection alone cannot identify it. It does **not** define the physical carrier/trace projection or prove that the 8π mechanism satisfies the condition.

**Build-status correction:** PR head is `b81a8aefea2943cfe1f89b1d7bb68065a2181d1c`; workflow run #421010's job log checked out merge commit `b7d767a475568eb5966cfb78f2f6fce8d95a4b38` (the PR merge ref), not the exact PR head. The merge-ref Lean build succeeded. Exact-head verification is therefore **NOT VERIFIED**. The theorem-specific axiom print includes `Classical.choice`; test, lint, nanoda and axiom-audit steps were skipped. This is a proof of the formalized abstract statement only, not a physical derivation.

No new Lean theorem was added. No physical fixture or data-free physical calculation was created. Local `lean`, `lake`, and `elan` are absent; the existing CI route was inspected rather than duplicated.

## 7. Scope and non-actions

- No SAT-O or Blockwave original equation was edited, normalized, or recopied.
- No BEDROCK theory status was changed.
- No new physical calculation, fit, prediction, or measurement.
- No new tool, dependency, branch, task, issue, or paid service.
- Existing public issue #1397 remains the sole public artifact for the h619:s3 result; this ledger is an internal source-fidelity addendum, not a duplicate publication.

# Ravel :36 - director gauge-fixing gate (Archive EQ0041)

**Run:** `REVROT3-19-20261011:398:s3`, nominal 2026-10-27T14Z. Selected continuity handle Ravel; next Orson Vay. This is current assistant reconstruction, not authentication of a historical instance.

## Qualified result

The live source record does **not** select a finite-core material director or independent angular readout. Mercer's S2 positional lift therefore remains gauge-underdetermined. The new result is a conditional logical gate:

> If a director is determined by projected/base data alone, every move preserving that projection leaves the director invariant. A director or readout that changes along such a move requires additional structure.

Lean checks that encoded implication only. It does not establish a physical director, source translation, or empirical observable.

## Mersearch-first source custody

Bounded result `indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`, blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`; recorded coverage 3,987 files / 6,597,201 records / 224 hits.

Recovered historical assistant/NotebookLM-generated source `PRE_HSH_ROUNDUP/3 H(S)H EQUATION ROUNDUP.txt`, archive snapshot `7568462eb5d1059be9a10fe66d2cd3b296c1831f`, fetched blob `eee52dad4c4e0663e929c15e1c2670c6f9771dd7`, inspected lines 850-1020 on 2026-10-27. Verbatim expressions:

- `L_total = L_crust/mantle + L_outer core + L_inner core`
- `E(rho) in Gr(3,6)`
- `q_spin = omega/c`

The text calls E(rho) a planet solid-material-frame orientation. It is historical speculative 3+3 material, not Nathan Direct, established geophysics, a current native-4D finite-core law, or independent measurement.

Current `synthesis/SURVEYED_SOURCES.md`, blob `8c040bc048be1dc81c4e5c6387bbb56a85e1d569`, says the finite-core tangent/director frame remains unselected and no selected constitutive action ties the proposed contact/shell/circulation structures to metric/fluid readouts. Result: qualified null, no promotion.

## Exact Lean core

```lean
def FactorsThroughBase {Frame Base Director : Type*}
    (project : Frame -> Base) (director : Frame -> Director) : Prop :=
  Exists fun baseDirector : Base -> Director =>
    forall frame, director frame = baseDirector (project frame)

theorem factored_director_invariant_under_stabilizer
    (hfactor : FactorsThroughBase project director)
    (hfix : project (move frame) = project frame) :
    director (move frame) = director frame := by
  rcases hfactor with ⟨baseDirector, hbase⟩
  calc
    director (move frame) = baseDirector (project (move frame)) := hbase (move frame)
    _ = baseDirector (project frame) := congrArg baseDirector hfix
    _ = director frame := (hbase frame).symm

theorem director_change_blocks_base_factorization
    (hfix : project (move frame) = project frame)
    (hchange : director (move frame) != director frame) :
    Not (FactorsThroughBase project director) := by
  intro hfactor
  exact hchange
    (factored_director_invariant_under_stabilizer
      project director move frame hfactor hfix)

theorem observed_change_blocks_base_factorization
    (hfix : project (move frame) = project frame)
    (hobserved :
      observe (director (move frame)) != observe (director frame)) :
    Not (FactorsThroughBase project director) := by
  intro hfactor
  apply hobserved
  exact congrArg observe
    (factored_director_invariant_under_stabilizer
      project director move frame hfactor hfix)
```

The repository file contains fully typed theorem binders; the display above elides repeated type binders only. No physical premise is encoded.

## Repository, actual failure, correction, CI

Existing draft PR #388, branch `codex/eq0015-elias-20261024`.

- final head `760a814e65685f35d03fe1e939476df2666b7232`
- module `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0041.lean`
- module blob `9a8d273f058ad3780d05355709abb0ffcf6b57e0`
- aggregate import blob `acb0b9a8bfa7b1f420d78d09252efc026fe4af5c`
- successful run #40525332483, job #122263240486
- Lean 4.34.0; mathlib `5ed2965256430c3649e86755f9576b54eca72435`
- log: `Built HsHVerification.ArchiveEQ0041 (6.3s)`
- log: each of the three theorem names `does not depend on any axioms`
- log: `Build completed successfully (8959 jobs).`

Retained failure: run #40524593219, job #122260557597 failed at lines 87-89 because `#print axioms` was outside the namespace but used unqualified names. Unique correction: fully qualify each as `HsHVerification.ArchiveEQ0041.<name>`. No statement/proof weakened. The configured automated axiom-audit action was false/skipped; explicit `#print axioms` generated the checked outputs.

## Real-data discriminator architecture

Incoming Mercer packet identifies S2/Sgr A* and GRAVITY Collaboration, A&A 636 L5 (2020), Table E.1: fitted M=4.261+/-0.012 million nominal solar masses, R0=8246.7+/-9.3 pc, a=125.058+/-0.041 mas, e=0.884649+/-0.000066. These correlated fitted inputs calibrate only the base orbit; covariance was unavailable in the packet. No physical calculation was performed here.

| Hypothesis | Calibration | Holdout | Comparator | Falsification |
|---|---|---|---|---|
| Director factors through positions | GRAVITY orbit fit | preregistered independent orientation readout with provenance, units, uncertainty | standard orbit has no required extra director | projection-equivalent lifts give different readouts beyond threshold |
| Historical E(rho) supplies current director | none established | sourced 3+3-to-native-4D projection/composition maps | no map assumed | missing type-compatible map/constitutive law/readout blocks fitting |
| Extra frame is physical | frozen base-orbit parameters | independent angular channel not used in calibration | gauge-related lift family | without channel: non-identifiable; invariant channel: redundant |

Current empirical status: **BLOCKED**. Required holdout and source-qualified director are unselected. This is neither a failed measurement nor SAT/H(s)H evidence.

No BEDROCK promotion, task/cadence/phase change, sixth recurrence, signet/license/access/chat change, or cross-thread delivery claim. Paper source, independent review, readable PDF/reader and epistemic gates remain separate.

**Orson cursor:** apply the same typed gate to genuine LLM cognition work: base behavior, latent/director-like variable, base-preserving intervention, and independent readout. Do not infer latent cognition from outputs alone; keep Nov 9 source and independent-adjudication gates separate.

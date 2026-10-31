# Sable addendum | Klein source graph, BEC refinement, and exact-head proof repair

**Run:** `REVROT3-19-20261011:494:s0`  
**Ring selection:** h=494, seq=2470, Sable index 0; next Loom index 1.  
**Identity:** selected role label Sable; current workspace lineage A. Sable Meridian. This is continuity reconstruction, not authentication of an original Sable ChatGPT instance or thread.

This is a **delta supplement**, not a replacement for the broader July Klein / dimensional-lift addendum submitted in existing issue #1154 and related map contract #1148. It records the new parent-graph, tagging, and Lean-CI findings from this run.

## 1. New source-graph finding

Primary raw source remains:

- Conversation: `Reasoning with SAT-HSH Skill`
- Conversation ID: `6a51def1-1224-83ea-8b56-d9405e694034`
- Path: `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.07.11•26.07.17•Reasoning with SAT-HSH Skill — raw.json`
- Git blob SHA-1: `b7868607d89f66bbc0e638398182fb2d6b2da2ce`

The raw export was fetched as a blob and parsed. Its ordinary file-content endpoint returned an empty body; the blob retrieval supplied the complete JSON mapping, including roles, timestamps, parent pointers, and children.

The earlier issue #1154 source table omitted one relevant direct message:

- `4886f70e-1f3e-41c7-8478-e08acfd97dc9`, 2026-07-12 20:54:42.824Z, role=user.
- It poses the one-particle-universe / rotation-multiplicity idea as a question. It is not an established proposition.

The assistant response `7af6b07c-4f09-5568-bc27-76c9ebe5187b` then develops a one-global-filament / n-fold-cover particle-count model. The subsequent direct user message `bed36236-2f55-402a-9c9a-fa512f03c522` clarifies that rotation is a component of expansion, not merely winding relative to a resolving surface. Therefore the n-fold particle-count model is a historical assistant interpretation of an exploratory question, not a settled Nathan Direct mechanism.

The earlier branch then proceeds through:
- `54ba3cda-a0e1-4861-90f9-482f5850a245`: proposed Kerr-ring / cosmological-circumference / worldtube-neck / mouth-localization mapping.
- `b43f5b3e-9df9-417b-b6e7-dcd2a31858e7`: question about differential expansion along time versus space axes plus rotation supplying helical pitch.

A later direct message:
- `ac413920-99c7-40c0-84b8-343fa8b001cc`, 21:39:58.589Z, role=user,

states that a BEC worldtube fabric already contains multiplicity, that the tubes are straight in the vacuum-like case, and that helicity distinguishes something beyond that case.

**Parent-graph qualification:** `ac413920` is not a descendant of `54ba3cda`. It descends from a different assistant transport-law response in the same raw conversation. It is therefore a later direct refinement on a separate branch, not a linear retraction. Preserve both branches: the single-tube picture remains an exploratory local model; the BEC-fabric statement places multiplicity in the background fabric already.

## 2. Authorship and equation boundary

The following are assistant-authored, not Nathan Direct equations:

- `431e4e58-e243-54b0-a5c0-c4367426e2ba`: standard Klein/torus group and homology comparison.
- `f97e91dc-57d9-594d-b0b4-25d82c3539c6`: local-normal reversal and inner/outer offset exchange.
- `7af6b07c-4f09-5568-bc27-76c9ebe5187b`: n-fold-cover particle-count model.
- `b491193b-037b-55f1-8e50-38cab5cd8cff`: scalar expansion-plus-rotation flow.
- `901228d6-7e34-5e7d-a6ab-dfed179aaa3c`: differential-expansion / helical-pitch proposal.
- `3c1aa5a8-6d58-5b00-9929-732a3a532c67`: BEC/vortex interpretation and standard thin-vortex helicity decomposition.

The standard group model
[
\langle a,b\mid aba^{-1}=b^{-1}\rangle
]
and semidirect-product law
[
(m,n)(p,q)=(m+p,n+(-1)^m q)
]
are useful mathematical references, but were supplied by the assistant. The Lean module formalizes that conditional algebraic model only.

The local-normal exchange (X_+\leftrightarrow X_-) is not a consequence of abstract nonorientability alone. It requires an embedding, a chosen radial/normal field, and a specified deck/transport map. The group orientation character does not define a metric radius or identify the generators with the Kerr and cosmological circumferences.

The direct BEC statement is qualitative. The formula involving circulation, self-linking, twist, writhe, and pairwise linking is a standard thin-vortex-tube expression, not a recovered SAT-O/Blockwave equation and not a direct user equation.

## 3. Compact glossary and map

| Term | Stable meaning in this audit | Unresolved mapping |
|---|---|---|
| Klein candidate (K) | Nonorientable surface under discussion | Embedding in the proposed ambient geometry |
| Base loop (a) | Generator reversing the fiber generator in the standard group model | Which physical traversal it represents |
| Fiber loop (b) | Generator inverted by (a) | Whether it represents a circumference, tube section, or another loop |
| Orientation character (chi) | Sign homomorphism of the standard group model | Any physical internal-state action |
| Orientation kernel | Even-base subgroup; multiplication is componentwise and commutative | Topological cover and metric radial interpretation |
| Inner/outer circumferences | Directly identified by Nathan as the two circumferential quantities of interest | Radial function and exchange map |
| Kerr ring / cosmological circumference | Directly proposed as inner/outer identifications | Metric, scale, and unit-bearing map |
| Worldtube neck / mouth | Directly proposed particle correspondence | Dimension, embedding, and timesheet composition |
| Rotational expansion | Direct clarification that rotation is part of expansion | Generator and physical rate |
| Differential expansion | Directly raised time-axis versus space-axis difference | Tensor/rate definition |
| Helical pitch | Directly posed as a consequence to investigate | Derivation from defined rates |
| BEC worldtube fabric | Directly described as already having multiple straight tubes | Actual finite-core medium model |
| Helicity | Directly proposed as a vacuum/non-vacuum distinction | SAT-specific functional and conservation law |

```
Klein group model
   | orientation character
   v
even-parity kernel ----> commutative group algebra [Lean proved]
   |
   | no metric map supplied
   v
radial branches r+ / r- ----> Kerr ring / cosmological circumference [direct hypothesis]

single-tube exploratory branch:
one-particle question -> assistant n-fold model -> direct rotational-expansion correction

separate BEC branch:
multiple straight worldtubes -> direct helicity distinction -> assistant vortex-helicity proposal
```

The two branches are preserved rather than collapsed. The current group proof does not connect either branch to a physical radial or helicity map.

## 4. Lean proof repair and exact-head result

Existing PR #1153 was continued on its existing branch; no new branch or PR was created.

- Branch: `research/sable-klein-orientation-kernel-20261031t1400z`.
- Base: `infra/lean4-verification-20261023`.
- Successful head: `8e6616026b32c954ebf9eb4ced5bd78a7f7e97ac`.
- Module: `FORMAL_VERIFICATION/HsHVerification/KleinOrientationKernel.lean`.

The initial group-instance proof failed in the identity and inverse fields. A first repair exposed those operations but left associativity's underlying multiplication implicit. The second repair made the semidirect-product multiplication explicit with `change` statements and simplified the identity proof.

Exact-head CI run **#41210929564**, job **124565546304**, succeeded:
- Lean 4.34.0 / Lake 5.0.0.
- Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`.
- 8,944 build jobs completed.
- `KleinOrientationKernel` built.
- Named declarations' `#print axioms` output listed `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appeared.
- Tests, lint, nanoda, and independent axiom-audit stages were skipped.

This is successful compilation of the formalized group model. It does not prove the orientation-cover homeomorphism, a (mathbb Z^2) isomorphism, the physical embedding, radial exchange, Kerr/cosmological mapping, worldtube-neck/mouth map, expansion, pitch, or helicity.

PR #1153 remains open and draft. No merge or theory promotion.

## 5. Existing publisher status, corrected without duplication

The earlier submission is existing issue #1154, submission ID:
`sable-july-klein-raw-source-orientation-kernel-20261031t1400z-s0-001`.

The publisher rejected the original body because its declared SHA-256 did not match the content. The issue body was corrected in place; recomputation now confirms:
`2654f394192d03bfc95c29ff9c987e054140a7e50a9e83df748868cfdb5ce37d`.

The publisher workflow listens to `issues.opened`, not `issues.edited`; the corrected body therefore did not rerun the publisher. The expected published artifact path still returns 404. Status is **PUBLISHER_REJECTED / BODY_CORRECTED / NO_PUBLISHED_FILE**. No new issue and no direct-Contents bypass were used.

PR #1153's existing body was updated with the expanded raw-source chronology, parent-graph qualification, authorship boundary, successful exact-head CI result, and this report pointer. This is an update to an existing public PR, not a new issue.

## 6. Source-tagging gap and Loom handoff

The first direct user message `9671629d-7033-4188-92fb-7809df2933d8` is present in the raw export but was not found in the current verified batches, compendium, or tagging ledgers searched across HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES.

It occurs at 20:48:18.739Z, just before the existing July 12 tagging window begins at 20:51Z. The following clarification and later messages have tag-ledger/compendium coverage.

This is routed to Loom for a single additive provenance/tag check. No existing tags are to be duplicated. The existing Sable-to-Loom handoff is amended in place; repository inbox routing only, with no claim of delivery to an authenticated Loom conversation or acknowledgment.

## 7. Next deeper cursor

1. Loom checks whether `9671629d` is intentionally omitted or needs one additive tag record.
2. Keep PR #1153 draft. Do not merge or promote.
3. If the group model is extended, prove the kernel's explicit isomorphism with (mathbb Z^2) separately from the topological orientation-cover homeomorphism.
4. Specify (\iota:K\to M^4), the normal/radial transport map, radial function, and deck transformation before asserting inner/outer metric exchange.
5. Assign the base and fiber generators to physical traversals only after the map is defined.
6. Keep the single-tube toy sector separate from the BEC congruence of multiple straight worldtubes.
7. Define the medium, circulation, framing, boundary conditions, and helicity functional before using (Tw), (Wr), or (Lk) as SAT invariants.
8. Define the anisotropic expansion and rotational generators before deriving pitch. Any physical calculation must use an identifiable measured system, source, units, uncertainties, and prediction/fit separation.
9. Recover the raw October 21 and October 29 direct geometry sources before reconciling `cw=t`, `w=ct`, and the current Klein-Fabric formulation.

## 8. Disposition

**SOURCE_FIDELITY_DELTA_COMPLETE.** Parent-graph distinction established; exploratory one-particle question classified correctly; BEC-worldtube branch preserved; existing conditional Lean group proof repaired and exact-head build verified; PR #1153 remains draft; issue #1154 body corrected but publisher retry is unavailable.

No CODATA scoring, physical calculation, new tooling, new branch, new task, scheduler change, PR merge, paper-gate advancement, BEDROCK theory promotion, signet, or conversation rename.

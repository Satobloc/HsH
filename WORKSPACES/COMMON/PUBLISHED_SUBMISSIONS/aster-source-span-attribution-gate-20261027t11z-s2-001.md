# Aster source-span attribution gate | 2026-10-27T11Z

Run `REVROT3-19-20261011:1978:s2`: Aster selected; Ariadne next. This is an assistant reconstruction under Aster's historical provenance remit, not authenticated participation by a historical ChatGPT instance.

## Source custody and read extent

- Control documents read from live `Satobloc/HsH`: BEDROCK blob `4cabda482c48c217614b868a2138409275df9bf7`; Steering Charter blob `b9b8de55f8d5add7c42cf80be7c34677ee36305e`; Three Paper Campaign blob `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`; onboarding blob `7d78afd95654bd9d41bbbcc6ba56db1fd10b3110`; revival rotation blob `90863a2a2b82b2d8e37ba1bd9f796389066f5409`.
- Aster historical charter/re-entry read at `WORKSPACES/ASTER/2026-10-17_SOURCE_GROUNDED_REENTRY_AND_BEDROCK_REVIEW.md`, blob `7d8a57addef8c17a2bab67aa96d25e637cc8b5ad`; historical specialization: Nathan-fidelity, exact wording, chronology, disclosure, source ancestry, and prior-art review. Selection does not authenticate historical-thread access.
- Aster's earlier receipt and publication were checked rather than duplicated. Issue #675 is published and checksum/readback verified; PR #674 follow-up run `40447650215` succeeded. The new work therefore changes lens from angle convention to source-span attribution.
- Mersearch lanes were already occupied, so no request was overwritten. A bounded original-blob fallback read the complete `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT O3 4D.txt` (all 81 logical lines in the returned file), blob `589219f60a8102cf7b07791b94fcdcd119e9bb8c`, archive locator date `2026-09-30`, read at repository ref `ed83de1e4ae853b4f204a0aace137811806668f4` on `2026-10-27`.

## Verbatim historical mathematics and status

The source states the phase-locking equation

\[
\phi_i - \phi_j = \frac{2\pi k}{n}
\]

for integers `i != j`, `k in Z`, and `n >= 2`, and defines

\[
\mathcal S(n)=1 \text{ for } n=1,2,3, \qquad \mathcal S(n)=0 \text{ for } n\ge 4.
\]

It then maps `n=1,2,3` to `U(1), SU(2), SU(3)`. These are historical-source claims, not current established mathematics or empirical physics.

Source-critical discriminator: the same file types the filaments as one-dimensional objects embedded in full `R^(3,1)` but describes Hopf and Borromean links with three-dimensional “cannot be separated without cutting” language. That transfer is not licensed as written. A repair must state the ambient category and allowed deformations:

1. If all loops and isotopies are constrained to a specified three-dimensional spatial slice, classical 3D link invariants may be relevant.
2. If ambient isotopy is allowed in the full four-dimensional manifold, the source must provide a high-codimension link classification; a 3D Hopf/Borromean picture is not itself proof of stability.
3. Lorentzian causality, open worldlines versus closed loops, and whether the objects are instantaneous spatial filaments or spacetime histories must be typed separately.

Therefore the O3 gauge-group conclusion remains `UNRESOLVED / ILL-TYPED AMBIENT TOPOLOGY`, not disproved or promoted by this packet.

## Formal proposition

Let `Span` and `Author` be types. A provenance record has a container author and a map `Span -> Author`. `containerProjection` forgets the span map. The packet proves:

- one span whose author differs from the container refutes uniform attribution;
- if `Author` has distinct `a` and `b` and a span `s` exists, two provenance records can have the same container projection but differ at `s`, so the projection is not injective;
- one deterministic reconstruction from the container label cannot assign both distinct authors to the same span.

Exact Lean module:

```lean
import Mathlib

namespace HsHVerification.SourceSpanAttributionGate

variable {Span Author : Type*}

def UniformAttribution (container : Author) (spanAuthor : Span → Author) : Prop :=
  ∀ s, spanAuthor s = container

theorem embedded_different_author_refutes_uniform
    (container : Author) (spanAuthor : Span → Author) (s : Span)
    (hDifferent : spanAuthor s ≠ container) :
    ¬ UniformAttribution container spanAuthor := by
  intro hUniform
  exact hDifferent (hUniform s)

structure ProvenanceRecord (Span Author : Type*) where
  containerAuthor : Author
  spanAuthor : Span → Author

def containerProjection (record : ProvenanceRecord Span Author) : Author :=
  record.containerAuthor

theorem containerProjection_not_injective
    (s : Span) (container a b : Author) (hab : a ≠ b) :
    ∃ r₁ r₂ : ProvenanceRecord Span Author,
      containerProjection r₁ = containerProjection r₂ ∧ r₁ ≠ r₂ := by
  let r₁ : ProvenanceRecord Span Author := ⟨container, fun _ => a⟩
  let r₂ : ProvenanceRecord Span Author := ⟨container, fun _ => b⟩
  refine ⟨r₁, r₂, rfl, ?_⟩
  intro hRecords
  have hSpan := congrArg
    (fun r : ProvenanceRecord Span Author => r.spanAuthor s) hRecords
  exact hab hSpan

theorem no_single_container_reconstruction
    (recover : Author → Span → Author) (container a b : Author) (s : Span)
    (hab : a ≠ b) :
    ¬ (recover container s = a ∧ recover container s = b) := by
  rintro ⟨ha, hb⟩
  exact hab (ha.symm.trans hb)

#print axioms embedded_different_author_refutes_uniform
#print axioms containerProjection_not_injective
#print axioms no_single_container_reconstruction

end HsHVerification.SourceSpanAttributionGate
```

## Execution and epistemic boundary

- Live draft carrier: PR #388, branch `codex/eq0015-elias-20261024`.
- Common-carrier module blob, independently read back: `36e97a417b95583055eb56136a7ed24641166e23`.
- Common-carrier head: `13a384cb022601f3f991ac72ad14671315e7a21e`.
- GitHub Actions run `40498650531`, job `122171021299`: `COMPLETED SUCCESS` on Lean `4.34.0`. The full Lake build completed `8,958` jobs. Log step `[8925/8958]` built `HsHVerification.SourceSpanAttributionGate`; all three `#print axioms` outputs say “does not depend on any axioms.” The automated `axiom-audit` action itself was skipped, so this claim is limited to the explicit Lean outputs for these three theorems.

Lean can establish only these encoded information-loss propositions. It does not determine the author of any historical span, validate the archive segmentation, establish the O3 topological premises, derive gauge groups, or validate physics.

## Workflow consequence

Any archive ingestion that labels an entire turn “Nathan” must retain span-level provenance or explicitly assert and justify uniform attribution. Container-only author labels are insufficient for pasted audit blocks, quoted material, or embedded generated text. This is a failure criterion for source custody, not an authorship classifier.

## Next-worker cursor

Ariadne should protect her own specialist remit. If she touches O3, require an explicit map from source objects to typed ambient embeddings and specify the allowed isotopies before evaluating any `n -> gauge group` implication. Repository handoff does not imply cross-thread delivery.

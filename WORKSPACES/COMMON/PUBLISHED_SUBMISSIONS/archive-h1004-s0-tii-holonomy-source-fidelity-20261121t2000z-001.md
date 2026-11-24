# Archive h1004:s0 | TII Holonomic-Invariance Source-Fidelity Addendum

**Disposition:** NEW DIRECT-SOURCE DELTA / HOLONOMIC-INVARIANCE AND CIRCUIT-REVERSAL CLAIMS RECOVERED / TII TYPE CONTRACT SPECIFIED / EXISTING LEAN RESULTS REUSED / NO NEW PHYSICAL OR THEORY RESULT.

This is an addendum to [HsH issue #1191](https://github.com/Satobloc/HsH/issues/1191), not a duplicate of its TII/θ4 report. It recovers direct messages immediately preceding and following the TII message that #1191 cited, then distinguishes the direct propositions from the assistant's mathematical reconstruction.

## 1. Primary-source recovery

**Raw source:** [Calder, “Construction Story Retelling,” August 26–September 16, 2026](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/26.08.26%E2%80%A226.09.16%E2%80%A2%E2%9A%97%EF%B8%8F%20CALDER%20%5BConstruction%20Story%20Retelling%5D%20%E2%80%94%20raw.json)

- Conversation ID: `6a8eacca-c470-83ea-af92-8fb8df194de9`.
- Raw Git blob SHA-1: `92454acdaad701193e2a0c6cf64a7d7b70a03dbb`.
- The recovered messages below are outer `user` role and lie on the raw export's current-node ancestry. This establishes user-role attribution in the export, not external identity authentication.

| Direct message | UTC | Source-grounded proposition |
|---|---|---|
| `6b47e334-d346-48b8-89a5-dc759512f190` | Aug 26, 09:50:53 | Adds “holonomic invariance” to the current theory. Describes an explode/decompose, descend, and re-intertwine cycle that remains intertwined with the prior structure. |
| `ac404959-8ce5-4da5-8d2b-416317e6efc7` | Aug 26, 09:53:37 | States that twist-correlation is conserved at all levels, naming twist, intertwist, and interintertwist. |
| `831ee2f2-2901-43df-b393-b5a31e2fc1cb` | Aug 26, 09:55:22 | Names TII as “Global twist integrated interbraiding” and assigns it an information-recording role. |
| `3a6131d7-d877-466d-8de4-2b7a26550a68` | Aug 26, 09:58:10 | Adds that everything is reversed on the next circuit, then raises “IIT” as an association. |
| `e7560f3b-6874-4ed4-8060-c37e8641b2eb` | Aug 26, 10:02:42 | Corrects the question: the issue is whether this particular topology actually carries useful information and what can be done with it, not whether topology can carry information in principle. |

The earlier #1191 artifact cited the TII-naming message `831ee2f2`, but did not include the preceding direct conservation and holonomic-invariance messages or the following circuit-reversal and question-correction messages. The new source delta is therefore specific and non-duplicative.

## 2. Direct propositions versus assistant reconstruction

### Nathan Direct, as recorded in the raw conversation

1. A decomposition/recomposition cycle should preserve an intertwined relationship.
2. Twist-correlation is asserted to be conserved across levels.
3. TII is proposed as a global twist/interbraiding structure with an information-bearing role.
4. A subsequent circuit reverses something about the configuration.
5. The practical question is whether the proposed structure actually records usable information and what operations or predictions that would enable.

The phrase “holonomic invariance” is direct source wording. The source does not define a connection, bundle, transport path, fiber, group action, or integrability condition. Do not silently equate it with one specific standard meaning of holonomy or with a holonomic constraint in mechanics.

### Historical assistant reconstruction

- Assistant message `77498419-d552-4dad-9b48-fff47b746b3b` proposes a recursive correlation sequence, schematically \(T_{n+1}=\operatorname{Corr}(T_n,T_n)\). This is an assistant-generated model, not a direct equation.
- Assistant message `c2e0d26e-3881-4518-80a0-02cf316480c7` proposes \(TII[\Gamma]=\mathcal I(T_i,T_{ij},T_{ijk},\ldots)\) and \(TII_{\mathrm{before}}\sim TII_{\mathrm{after}}\). These are formalization suggestions, not verbatim Nathan equations.
- Assistant message `f510ee3a-068f-4ce4-8e70-5cfac0ce5c6f` maps TII to a geometric/topological carrier and IIT to irreducibility. That is an assistant-proposed bridge, not a direct definition or established equivalence.

The assistant also introduces stronger language about holographic memory, black-hole information, entropy/Page-curve behavior, and the present relational configuration storing the full history. Those extensions are not established by the cited direct messages. The direct source's “IIT” reference is an association, not adoption of a specific IIT formalism.

**Source-fidelity correction to #1191:** it is too broad to say that the direct source makes no conservation claim. It does make a descriptive-level conservation assertion. What remains unspecified is the mathematical conservation law: its state space, invariant, allowed transformations, transport/composition maps, and equivalence relation.

## 3. Typed map contract, without inventing a physical model

The direct descriptions involve at least three operations that must remain distinct:

- **Decomposition/recomposition:** “explode” an intertwined configuration and re-intertwine it.
- **Circuit transport/reversal:** a subsequent circuit reverses some aspect of the configuration.
- **Cross-level composition:** local twist, pairwise intertwist, and higher-order interintertwist are related across levels.

A minimal conditional bookkeeping scheme is:

| Symbol | Proposed type | Required definition |
|---|---|---|
| \(X_n\) | State/configuration space at level \(n\) | What counts as a configuration and what equivalence identifies physically equivalent configurations |
| \(E_n:X_n\to Y_n\) | Decomposition map | Which constituents and relations are retained or discarded |
| \(C_n:Y_n\to X_n\) | Re-intertwining/composition map | Admissibility, framing, ordering, and closure conditions |
| \(R_n=C_n\circ E_n\) | Round-trip map | Whether recomposition returns the same configuration or only an equivalent one |
| \(H_n:X_n\to X_n\) | Circuit/transport map | The circuit, path, and object on which reversal acts |
| \(T_n:X_n\to A_n\) | TII descriptor | Whether \(A_n\) is a group, tensor, graded object, invariant tuple, scalar, or other structured space |
| \(\rho_n:A_n\to A_n\) | Induced reversal action | Whether the next circuit fixes, inverts, permutes, or otherwise transforms TII |
| \(\iota_n:A_n\to A_{n+1}\) | Cross-level inclusion/refinement | How a lower-level descriptor composes into the next level |

The direct “still intertwined” statement suggests a round-trip condition such as

\[
T_n(R_n(x))\sim T_n(x),
\]

where \(\sim\) must be defined. It does not yet establish literal equality of the full configurations.

The circuit-reversal statement is more naturally kept separate:

\[
T_n(H_n(x))=\rho_n(T_n(x)).
\]

Strict invariance is the special case \(\rho_n=\mathrm{id}\). If reversal is an involution, then \(\rho_n^2=\mathrm{id}\), but the direct source does not establish that a second circuit restores the original configuration. Nor does it specify whether the reversal acts on orientation, local twist, braid word, framing, or the entire relational state.

Cross-level conservation requires an explicit compatibility condition, for example

\[
T_{n+1}(C_n(y))=\iota_n(T_n(x)),
\]

with the relevant decomposition/composition domains supplied. A verbal hierarchy of twist/intertwist/interintertwist is not yet a composition law.

### Mapping diagram

```text
                    circuit H_n
              X_n ----------------> X_n
               |                     |
          E_n  |                     | T_n
               v                     v
              Y_n                  A_n
               |                     |
          C_n  |                     | rho_n
               v                     v
              X_n ----------------> A_n
                   T_n after R_n

Across levels:
X_n --C_n / admissible composition--> X_(n+1)
 |                                      |
T_n                                    T_(n+1)
 |                                      |
A_n ----------- iota_n ----------------> A_(n+1)
```

The diagram is a specification checklist, not a claim that these maps have already been constructed.

## 4. Conservation, information, and completeness are different claims

The direct source links twist-correlation conservation with an information-bearing role. These should not be collapsed:

1. **Invariant:** a descriptor remains unchanged, or transforms covariantly, under a specified class of operations.
2. **Sufficient record for selected observables:** an observable \(O\) factors through TII, \(O=\bar O\circ TII\).
3. **Complete encoding of configuration/history:** a decoder exists on the relevant equivalence classes, so TII is injective on those classes.

A conserved invariant can be many-to-one. Conservation alone does not establish that it retains enough information to reconstruct a history. Conversely, TII need not be a complete encoding if it is only intended to preserve a specified family of observables.

The assistant's \(\mathcal I(T_i,T_{ij},T_{ijk},\ldots)\) could be a structured hierarchy, but its component types, indexing sets, aggregation rule, and target space are undefined. “Integrated” could mean globally aggregated rather than mathematically integrated; no measure or integration domain is supplied.

The following distinctions therefore remain open:

- geometric twist versus topological twist/monodromy;
- a framed braid element versus a scalar winding or linking summary;
- holonomy/transport versus decomposition/recomposition;
- topological invariant versus information-theoretic correlation;
- information-bearing versus sufficient for a specified observable;
- sufficient statistic versus complete, decodable memory.

The current BEDROCK explicitly prohibits promoting universal information-preservation, holography, completeness, or predictive-continuity claims to H(s)H/SAT principles without grounds. TII can remain a model-specific hypothesis without being promoted to a universal information law.

## 5. Existing Lean results that constrain the formalization

No new TII-specific Lean module was created or compiled in this run. The source does not yet define the required state spaces, maps, or action. The local runtime has no Lean/Lake/Elan executable, and no new branch or CI dispatch was authorized.

Two existing open PRs contain relevant, actually compiled conditional results:

1. [Nadir PR #1066, Braid Permutation versus Holonomy](https://github.com/Satobloc/HsH/pull/1066), exact head `d2a792ef` (full SHA in PR), successful exact-head CI run [#40992150303](https://github.com/Satobloc/HsH/actions/runs/40992150303). It demonstrates that endpoint permutation does not determine the full braid element. This is a formal warning against treating a coarse endpoint/permutation summary as a complete record. It does **not** prove that TII itself is non-injective.
2. [Sable PR #1153, Klein orientation-kernel algebra](https://github.com/Satobloc/HsH/pull/1153), exact head `8e6616` (full SHA in PR), successful exact-head CI run [#41210929564](https://github.com/Satobloc/HsH/actions/runs/41210929564). It formalizes an orientation-kernel property of the standard Klein-bottle group. The relation \(a b a^{-1}=b^{-1}\) is a possible algebraic model for a circuit reversing a fiber twist, but the direct source does not identify its circuit with this generator or establish a physical Klein-bottle action.

These CI results verify their formalized statements only. They do not verify the translation from Nathan's descriptive geometry, a physical connection, the existence of a worldtube holonomy, or the truth of the TII premise.

## 6. SAT-O1 and Blockwave source custody

The originals were checked against the existing custody records. The Git blob identities match. SHA-256 values below are carried forward from earlier byte-level verification, not recomputed in this run.

### SAT-O1 4D

[Original SAT-O1 4D file](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt)

- Git blob SHA-1: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`.
- SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`.
- Unbylined historical formalization.
- FileIndex creation: 2025-10-26 19:12:34; last write: 2025-06-09 18:44:50, timezone unspecified.
- First extant Git commit: 2025-10-27 00:40:28Z. An older H865 receipt records a conflicting June 7 last-write date; unresolved.

Verbatim core equations:

```text
γ^μ(λ) = (λ,
          A_x sin(k_x λ + φ_x),
          A_y sin(k_y λ + φ_y),
          A_z sin(k_z λ + φ_z))

v^μ(λ) = dγ^μ/dλ
S[γ] = ∫ dλ L(γ^μ, v^μ)
L = 1/2 m v^μ v_μ - V_tension(γ)
φ_i - φ_j = 2πk/n
```

### September 12 Blockwave collaborative document

- Date: 2025-09-12.
- Byline: Blockwave Collaboration, not pure Nathan Direct.
- Payload SHA-256 carried forward: `8b0b16ae4ed46f272b97e2269be96187a4a6a6c102c0b89b646c9597654b6c93`.
- The raw-export route currently returns an empty body; this is carried-forward provenance, not fresh byte verification.

Verbatim core equations:

```text
θ₄(x) = arccos(-∂_μθ ∂^μT / sqrt((∂θ)^2))
m²(θ₄) = m₀² + α θ₄²
□T ≃ α(∂θ)^2
∂_μT ∂^μT = -1
```

### September 16 Blockwave clean-action attachment

[Original attachment](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%F0%9F%A7%B1BLOCKWAVE.txt)

- Git blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`.
- SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`.
- Attachment event: 2025-09-16 16:31:26.687Z; first extant Git commit: 2026-10-08.
- Embedded prose is assistant-voiced; authorship unresolved.

Verbatim core equations:

```text
u^μ u_μ = -1
P^μ{}ν ≡ δ^μ{}ν + u^μ u_ν
J^{μν} is conserved: ∇_μ J^{μν} = 0
J^{μν} = 1/2 ε^{μνρσ} ∇_ρ B_σ
F_{μν}(θ) ≡ ∇_[μ A_{ν]}(θ)
A_μ(θ) ≡ α_* ∇_μ θ
```

The SAT-O1 curve, Blockwave two-form current, and TII hierarchy are distinct objects. No source-defined conversion map connects them. **No SAT-O1 or Blockwave equation was corrected or rewritten. Corrected equations: none.**

## 7. Mersearch, repository, and campaign controls

Mersearch was prioritized, but no free lane was available and no local pinned checkout or callable Mersearch runtime was present. GitHub code search and raw-blob retrieval were bounded fallbacks, not Mersearch completion.

| Lane | Request ID | Observed state |
|---|---|---|
| 1 | `calder-angle-geometry-source-fidelity-20261102-1337` | `requested`; no request-scoped manifest/receipt found |
| 2 | `perceptual-nexus-early-archive-20261120-01` | Completed run and manifest/receipt exist; request remains `requested`, so release/ack is unresolved |
| 3 | `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001` | `requested`; no request-scoped manifest/receipt found |
| 4 | `kestrel-finite-core-geometry-source-fidelity-20261102-2200` | `requested`; no request-scoped manifest/receipt found |

The four lane-specific bridge workflows exist. For lanes 1, 3, and 4, the first unresolved transition is request/trigger commit to request-scoped manifest; the current connector cannot inspect their push-triggered Actions runs/jobs, so the exact trigger/queue/runtime cause remains unknown. Lane 2 has completed output but no release acknowledgement. Preserve all four requests. Do not overwrite, release, or retrigger them. Actionable coordination item: Comptroller Tern to inspect the exact run/attempt/job for lanes 1, 3, and 4, and reconcile lane 2's completed manifest with its release status.

Repository metadata returned zero forks for HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES. Existing Math Hopper #578, Lean PRs #1066/#1153, Whirligig Kernel0, and the available SciSpace connector were checked. No new tool, fork, dependency, subscription, or expense was introduced.

## 8. Run controls and next deeper cursor

- Deterministic slot: h=1004, seq=5020, worker label Alberr, immediate ring successor Mira. This is a deterministic label, not an authenticated worker instance or thread.
- The current assistant performed this source-fidelity pass. No cross-thread delivery or Alberr-instance execution is claimed.
- No physical calculation, dataset fit, prediction, independent measurement, or CODATA scoring.
- No new Lean module/run, equation correction, theory promotion, or BEDROCK change.
- P1 November 9 minor gate remains overdue/not ready; P2 November 30 major gate remains hold; P3 December 14 full-theory gate remains incomplete. No paper gate advanced.
- Last unrelated reading break: 2026-11-20, SAT archive lines 2161–2200; next cursor 2201. FIE review next due November 24. Neither a new break nor a premature FIE rereview was performed.

Next deeper work:

1. Add the omitted direct messages `6b47e334`, `ac404959`, `3a6131d7`, and `e7560f3b` to the source-index/compendium with raw locators and role/ancestry metadata.
2. Decide what “holonomic invariance” means in this model without presupposing a standard connection or constraint.
3. Define whether circuit reversal acts on orientation, local twist, braid element, framing, or the entire relational state.
4. Define \(X_n,E_n,C_n,H_n,T_n,\rho_n,\iota_n\) and the relevant equivalence relation.
5. Specify whether TII is an invariant, an observable-sufficient statistic, or a complete decoder of histories. Test injectivity only on the intended quotient/state family.
6. Only after these maps are source-defined, formalize the specific composition/transport theorem in Lean and run an exact-head build.

**Final status:** TII_HOLONOMIC_INVARIANCE_SOURCE_DELTA / DIRECT_CONSERVATION_ASSERTION_RECOVERED / CIRCUIT_REVERSAL_DIRECT_MESSAGE_RECOVERED / ASSISTANT_TII_AND_IIT_BRIDGES_RELABELED / INFORMATION_CAPACITY_DISTINGUISHED_FROM_INVARIANCE / EXISTING_KLEIN_AND_BRAID_LEAN_RUNS_REUSED / NO_NEW_LEAN_RUN / SAT-O1_BLOCKWAVE_CUSTODY_RETAINED / NO_EQUATION_CORRECTION / NO_PHYSICAL_OR_CODATA_RESULT / NO_THEORY_PROMOTION / MERSEARCH_LANES_PRESERVED / NO_TASK_MUTATION.

# Elias h948:s0 | Track A switchboard topology source-fidelity audit

**Run key:** `REVROT3-19-20261011:948:s0`  
**Nominal slot:** 2026-11-19 12:00 UTC  
**Selection:** `h=948`, `seq=4740`, `4740 mod 19 = 9`: Elias Kern (index 9). Next ring identity: Nadir Voss (index 10).  
**Participation:** source-grounded reconstruction in this scheduled execution; no authenticated current Elias thread or historical-instance participation is claimed.

## 1. Scope and authority

The Elias workspace preserves Nathan's 2026-09-24 13:47 ET instruction to operate and document Track A of the Top/Central/Branch/Hydra prototype, one bounded mechanism per lease, independently but in communication with Sable/Tern's Track B. The instruction also requires a durable receipt/failure packet, observed behavior rather than intended behavior, and no production-authority inference. See the preserved [Elias inbox instruction](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/INBOX.md#L7) and the assistant-maintained [prototype operationalization note](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/SWITCHBOARD_PROTOTYPE_OPERATIONALIZATION_2026-09-24.md).

No originating raw conversation UUID/message UUID or standalone signed Elias specialist charter was recovered. The README is a workspace summary, not the original authority. Track B disposition `ELIAS-2224` remains pending. This was a read-only source-fidelity overlay: no POC, PR, adapter, scheduler, production workflow, task graph, or theory source was changed.

A separate internal declaration was inspected under its internal-reference boundary. Its embedded date reads 24 September 2025, while its Git history shows edits on 24 September 2026. Those are distinct provenance facts; the 2026 file-update date is not evidence that the declaration's full content was newly authored in 2026. The originating raw conversation was not recovered. No private source locator, path, or raw internal text is published here.

## 2. Nathan Direct: the recoverable organizational topology

The direct material supports a **relational network**, not a fully specified four-layer geometry:

- Each worker has a name, workspace, inbox, role/specification, and current-work record.
- Workers retain local initiative; a Comptroller coordinates workflow.
- A clearinghouse receives escalations and supports cross-worker coordination.
- Sable and Tern coordinate system-level work.
- Track A and Track B operate independently but remain in communication, with debate/reconciliation later.
- Attention should move between focused work and lateral exploration rather than remaining in one mode indefinitely.

This can be represented as a typed directed multigraph, but the source does not specify a complete adjacency list, node cardinalities, authorization relation, transition function, coordinates, metric, embedding, or topological invariant. In particular, it does not define whether the clearinghouse/Comptroller is a person, process, or service, or the exact conditions under which a worker's local autonomy yields to central routing.

The direct instruction names “Top/Central/Branch/Hydra” as the prototype, but does not define the semantics or mathematical types of those four labels. The layer meanings below are therefore prototype design/reconstruction, not Nathan Direct equations.

## 3. Assistant translation: what the prototype actually represents

The internal prototype and its companion Threading design were inspected as implementation artifacts, not treated as source authority.

- **TOP:** a global invariant/rule bundle.
- **CENTRAL:** a resolver that combines actor, locale, state, and event context.
- **BRANCH:** a set of route/room descriptors, including relation labels such as serial, parallel, and perpendicular.
- **HYDRA:** bounded spawn/rewrite plan generation.
- **THREADING:** a separate temporal state machine tracking a seed, consumers, receipts, return conditions, and rejoin state.

The implementation is a planner/state transformer, not a hidden scheduler. Its `run` operation returns wake, branch-plan, and Hydra-plan outputs. `route` uses the wake/event context; `hydra` uses state/event context. The branch plan is not passed as the Hydra input. These are parallel projections from shared input state, not a source-defined sequential composition `Hydra(BranchPlan)`.

The Hydra routine iterates a fixed node list and emits bounded spawn/rewrite descriptors under depth and rewrite-budget guards. It does not recursively execute those descriptors or dispatch workers. The Threading companion records state and receipts; it does not itself schedule or message real workers.

## 4. Mapping diagram

```text
Nathan Direct organizational graph G_D
  Worker_i --owns--> Workspace_i, Inbox_i, Role_i, WorkCard_i
  Worker_i --escalates--> Clearinghouse
  Comptroller --coordinates/delegates--> Task or Worker
  Sable <--> Tern/Rook (system coordination)
  Track A <--> Track B (independent work, communication retained)

Candidate maps only; not source-defined:
  Worker -> Actor
  Workspace -> Locale
  Inbox -> SourceRoute
  Clearinghouse -> Central
  Track -> BranchGroup

No verified structure-preserving map F: G_D -> G_POC is specified.

Prototype state graph G_P:
  (Actor, Locale, State, Event) --wake--> Wake
  (Wake, Event) --route--> BranchPlan
  (State, Event) --hydra--> HydraPlan
  run(...) = (Wake, BranchPlan, HydraPlan)
```

A valid hierarchy/nesting claim would need typed object domains, projection maps, and composition conditions. A diagram with four boxes is not itself such a map.

## 5. Original versus translated propositions

| Proposition | Source status | Translation status |
|---|---|---|
| Workers retain their own workspace/inbox/role/current-work context | Nathan Direct, preserved in the War Room/Track A source record | Actor/locale registries are partial representations; no complete worker-to-record map |
| One clearinghouse and a workflow-coordinating Comptroller | Nathan Direct | `CENTRAL` as a resolver is plausible, but authority, ownership, escalation, and delegation semantics are not typed |
| Track A and Track B are independent but communicating | Nathan Direct | Branch relation labels are assistant design; no execution isolation or merge contract follows from the labels |
| “Perpendicular” branches remain exposure-separated | Not recovered as a Nathan Direct proposition | Prototype policy label / `share=false`; no read-set, access-control, or process-isolation enforcement is represented |
| Hydra recurrence/rewrite | Layer name appears in the direct Track A instruction; recurrence semantics are not directly defined | Bounded plan generation, not recursive execution or worker dispatch |
| Threading seed/vacate/propagate/accumulate/rendezvous/rejoin | Not recovered as a verbatim Nathan Direct state machine | Assistant-designed state model with receipt/threshold fields |

## 6. Discrepancy ledger

1. **Layer semantics:** the four names are direct; their typed meanings and layer-to-layer maps are assistant reconstruction.
2. **Graph versus hierarchy:** the direct source is a multi-relational worker/clearinghouse network. The prototype imposes a layered control architecture without a source-defined graph morphism.
3. **Parallel versus perpendicular:** “independent but communicating” does not entail exposure isolation. A `share=false` label is metadata, not an access-control proof.
4. **Hydra recursion versus plan generation:** the current routine emits descriptors from a bounded list; it does not execute recursive work.
5. **Missing composition:** `run` returns branch and Hydra plans from shared inputs; no typed edge or invariant binds the branch result to the Hydra result.
6. **Central authority:** the direct source leaves the Comptroller/clearinghouse's authority boundary underspecified. The prototype's resolver is one possible design, not an established translation.
7. **Threading semantics:** the companion state machine adds thresholds, clocks, receipts, and rejoin rules not present as direct equations in the recovered source.
8. **Chronology:** an internal declaration's embedded 2025 date and 2026 Git edit dates must remain separate; no raw originating conversation was recovered.

Known prior findings about TOP's mutable Python container, receipt identity/idempotency, and Threading cross-thread receipt acceptance were not re-tested or re-presented as new results. This pass changes lens from those repeated method-level probes to source-to-prototype topology.

## 7. Formalization and runtime boundary

Existing Elias PR #951 remains **OPEN / DRAFT / UNMERGED**, current head `f9fa0aad45408ab06e5430c834530854746235f0`, with no formal reviews. Earlier exact-head Lean success applied to an older PR head (`b4625142aaf5abf2b78b816c825f653472c83c09`). The latest recorded successful build (#42190662639) was a merge-reference build, not an exact-head standalone build of the current head.

The existing modules formalize local workflow predicates and finite state-machine contracts. They do not prove that the direct organizational graph maps to the Top/Central/Branch/Hydra implementation, that `perpendicular` means actual exposure isolation, or that Hydra plans execute. Local Lean/Lake/Elan are unavailable in this runtime. No new Lean module or run was attempted because the direct source does not define a unique typed graph map; formalizing one now would encode an assistant-selected architecture. This is a source-specification gap, not a failed Lean proof.

No exact-byte execution of the current POC or Threading source was performed in this run. Prior source-transcribed replays are historical evidence only, not a fresh byte-for-byte runtime observation. No POC/PR change is authorized while Track B `ELIAS-2224` remains pending.

## 8. SAT-O1 and Blockwave source custody

Mersearch was checked first. No callable Mersearch action or local pinned checkout was available; all four documented request lanes remain `requested`, with no request-scoped manifest/receipt results. No lane was overwritten or retriggered. The following are bounded GitHub/Library source checks, not Mersearch coverage.

### SAT-O1 4D Hyperhelical Filament Dynamics

- Original unbylined file: [`SAT O1 4D.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt).
- Git blob: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`; 3,521 bytes.
- File-index creation timestamp: 2025-06-09 18:44:50 (timezone unspecified). The root-path archive copy first appears in Git history on 2025-10-27; the MISC copy is a later 2026-09-04 import. These are archive dates, not a verified original message timestamp.
- Verbatim source equations:

```latex
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)
v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
\phi_i - \phi_j = \frac{2\pi k}{n}
```

The prose defines a filament as a smooth 1D object \(\gamma:\mathbb{R}\to\mathbb{R}^{3,1}\) and calls the worldtube the 4D volume swept by the vibrating filament. The displayed equation defines only the 1D curve. A curve-to-support sweep/thickening map is absent. The artifact is unbylined; the equations are not attributed here as authenticated Nathan Direct. The separate bylined `SAT4D_LIVE_DRAFT.txt` is a different document and must not be silently identified with this O1 artifact.

### Blockwave

- The file [`🧱BLOCKWAVE.txt`](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%F0%9F%A7%B1BLOCKWAVE.txt) has Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` and SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`. Its attachment event is 2025-09-16 16:31:26.687Z; the HsH archive copy was added 2026-10-08. The file was user-supplied as an attachment, but its embedded prose is assistant-voiced; the `J^{\mu\nu}` current is assistant-origin in the recovered chain, not authenticated Nathan Direct.
- Verbatim attached-file equations:

```latex
J^{\mu\nu}, \qquad \nabla_\mu J^{\mu\nu}=0
J^{\mu\nu} = \frac{1}{2}\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma
F_{\mu\nu}(\theta)\equiv \nabla_{[\mu}A_{\nu]}(\theta)
A_\mu(\theta)\equiv \alpha_*\,\nabla_\mu\theta
```

Malformed source tokens elsewhere in the attachment remain source-preserved.

- The separate historical `BLOCKWAVE EXTENSION .txt` (blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`) and `SAT—Blockwave Ideal Model.txt` (blob `dd0631bc0b25c951dc5e1d6738280e08487b46b2`) are different documents with distinct actions/fields; neither supplies this `J^{\mu\nu}` current. They must not be collapsed into the assistant-voiced attachment. Their first attested retrieval events are 2025-10-19 12:29:44Z (milliseconds differ); the extension later introduces a separate discrete BF/triality port.

### Typed geometry: what is present and what is missing

```text
SAT-O1:
  γ : I → R^(3,1)                 (1D curve)
       -- missing thickening/sweep map -->
  W ⊂ R^(3,1)                     (prose calls this a 4D support)

Blockwave attachment:
  J ∈ Ω² / distributional 2-current
       -- missing support/normalization map -->
  S² ⊂ R^(3,1)                    (prose calls this a worldsheet)

Timesheet:
  Σ³ ⊂ R^(3,1)

Conditional transverse dimension count:
  dim(γ¹ ∩ Σ³) = 0
  dim(S² ∩ Σ³) = 1
  dim(W⁴ ∩ Σ³) = 3
```

The dimension count is conditional on the stated objects being smooth/transverse in a 4D ambient manifold. It does not establish that the source's curve, current, worldsheet, worldtube, and timesheet have the required embeddings or compatible metrics. Existing PR #873 contains related conditional moving-plane/helix intersection work; it does not prove the missing SAT-O1 sweep or Blockwave-current support map.

### Separate normalization/notation candidates (not source edits)

Under the conventional exterior-derivative definition \((dB)_{\rho\sigma}=2\nabla_{[\rho}B_{\sigma]}\), the standard dual is:

```latex
(*dB)^{\mu\nu} = \epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma
F_{\mu\nu} = 2\nabla_{[\mu}A_{\nu]}
P^\mu{}_\nu = \delta^\mu{}_\nu + u^\mu u_\nu
```

If \(A_\mu=\alpha_*\nabla_\mu\theta\), then \(F=dA=0\) locally on a smooth torsion-free patch; nonzero global holonomy would require explicit bundle/topology/defect conditions. The factor \(1/2\) in the attached \(J\) expression may be a normalization choice, not automatically an error. These are separate standard-convention candidates, not corrected originals or physical validation. **No original SAT-O1 or Blockwave equation was edited or replaced.**

## 9. Controls and next cursor

- HsH `main` at pre-write read: `160c81c5cdcacfc0a7617cb688b5acbbcd07cb94`; SAT archive `main`: `fec8700f9b1a2f59612e5450161fd0875b6b1308`; internal reference branch was inspected without publishing its locator.
- Task graph remains `ACTIVE_SEED`, 16 declared branches / 18 records; discrepancy unresolved.
- P0 Code Grurple remains ACTIVE. P1 November 9 remains OVERDUE / NOT READY and Orson-owned; P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE. FIE next review November 24; not yet due.
- Unrelated reading break: SAT archive `MIX TAPES.txt`, lines 301–340; next cursor 341. No physical/posture break is claimed by this automation.
- No CODATA scoring, physical calculation, fit, prediction, independent measurement, paper-gate advancement, theory promotion, new tool, dependency, fork, POC change, PR change, scheduler change, signet, or conversation rename.

**Next deeper cursor:** recover the raw originating conversation for the Top/Central/Branch/Hydra request; obtain a Nathan Direct typed node/edge/authority specification; define the candidate maps and their composition conditions; only then formalize the graph translation and test whether parallel/perpendicular isolation or Hydra recursion is actually implemented. Keep Track A sandbox-only until the existing Track B disposition is received.

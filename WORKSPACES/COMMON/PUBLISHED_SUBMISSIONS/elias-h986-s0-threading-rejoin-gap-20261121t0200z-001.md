# Elias h986:s0 | Threading source-attribution correction and terminal REJOIN gap

**Run key:** `REVROT3-19-20261011:986:s0`  
**Nominal slot:** 2026-11-21T02:00:00Z  
**Selection:** `h=986`, `seq=5h=4930`, `4930 mod 19=9` -> Elias Kern, index 9.  
**Next ring identity:** Nadir Voss, index 10. The immediate :12 slot is disabled. The next active :00 selection is Kestrel at h987.  
**Disposition:** ADDITIVE SOURCE-FIDELITY CORRECTION / TERMINAL-TRANSITION GAP / NO PROTOTYPE CHANGE / NO THEORY PROMOTION.

## 1. Scope and source authority

Elias's historical remit is Track A prototype operation and documentation, one bounded real-work mechanism per lease, independently but in communication with Sable and Tern's Track B. The instruction requires a durable receipt or failure packet, observed behavior rather than intended behavior, and no inference that a prototype has production authority. The preserved [Elias inbox instruction](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/INBOX.md#L7) is a repository record. No standalone signed Elias charter or authenticated current Elias thread was recovered.

A second, previously underused source surface changes the attribution picture. The [Tern inbox record at 2026-09-24 13:48 ET](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/TERN/INBOX.md#L325-L326), headed “Nathan / Elias Kern -> Tern Rook,” says “ADD THREADING TO SWITCHBOARD EXPERIMENT” and describes the sequence:

`SEED -> VACATE -> PROPAGATE -> ACCUMULATE -> RENDEZVOUS -> REJOIN`.

It explicitly calls this an experimental primitive, not a required production design. It describes a bounded self-vacation, discretionary and diversified use by other workers, accumulated outputs, and a return when a state threshold or time cap makes the return turn more valuable. It also names displaced work, seed/version, consumers, exposure, output receipts, return condition, max-time fallback and return action as tracked items. The record lists starvation, dead seeds, tool monoculture, false diversity, premature return, stale versions and schedule expectations without receipts as failure modes. It separately says Orson's observer lane may prototype/thread at discretion, with interventions logged separately from observations.

**Provenance limit:** this is a Nathan-attributed, role-bearing repository record, not a recovered raw conversation turn. Its original conversation UUID and message UUID remain unavailable. It is stronger than an assistant-only proposal, but it is not raw-message authentication.

This narrows a statement in the earlier [h948 Track A report, issue #2093](https://github.com/Satobloc/HsH/issues/2093). The six-step experimental primitive is preserved in a Nathan-attributed record. The detailed state schema, operator definitions and code remain assistant reconstruction. The earlier [Threading fidelity audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/2026-10-31_S0_TRACKA_SWITCHBOARD_THREADING_FIDELITY_AUDIT.md) remains useful for the implementation boundary, but its source-attribution wording should be read with this correction.

## 2. What kind of structure is actually specified?

The recoverable structure is a **temporal coordination protocol**, not a spatial geometry. The source provides an ordered process and return condition. It does not specify coordinates, a metric, spatial embedding, a physical carrier, a topological invariant, or a map into H(s)H spacetime. No equivalence to a worldline, worldtube, timesheet or physical filament is asserted.

The most faithful abstraction is a labeled transition system whose transition relation is still only partially specified. The six labels are source-attributed; the formal state type, guards, effects and composition law are not.

## 3. Mapping diagram

```text
Nathan-attributed experimental sequence
SEED -> VACATE -> PROPAGATE -> ACCUMULATE -> RENDEZVOUS -> REJOIN
  |       |          |             |             |          |
  v       v          v             v             v          v
Seed    vacate()   no explicit   add_receipt()  readiness   MISSING
object             propagate()                 predicate   terminal
/constructor      or dispatch                  /mark-ready transition
```

The internal prototype snapshot was inspected under its internal-resource boundary. Its private path and code are not reproduced here.

| Source phase | Prototype representation | Fidelity assessment |
|---|---|---|
| SEED | Seed data object constructed by the demo | Represented as data, not a distinct transition |
| VACATE | Explicit `vacate()` state change | Present |
| PROPAGATE | Consumer and policy fields; no explicit propagation or dispatch operation | Partial |
| ACCUMULATE | `add_receipt()` appends output receipts | Partial |
| RENDEZVOUS | State-threshold or max-time readiness check; marks `rejoin-ready` | Present at eligibility level |
| REJOIN | No operation moves the author from `rejoin-ready` to `rejoined` or the thread from ready to complete | Absent |

The implementation has fields for `displaced_work`, `fallback` and `return_action`, but no terminal operation invokes them. The state vocabulary includes `rejoined` and `complete`, but the inspected code contains no transition that sets those terminal values. The readiness marker is not the return action.

The code does implement the source's “state threshold OR time cap” readiness condition. That is a real point of fidelity. It does not complete the subsequent rejoin.

## 4. Glossary

- **Seed:** the versioned tool, question, test or work object offered to other workers.
- **Vacate:** the originating worker temporarily deprioritizes its own recurrence so the seed can be used elsewhere.
- **Propagate:** eligible consumers use the seed under a stated policy and exposure boundary.
- **Accumulate:** outputs and their receipts are retained against the seed version.
- **Rendezvous:** a readiness decision based on accumulated state or a maximum-time cap.
- **Rejoin:** the originating worker actually returns, performs the return action and resolves displaced work. This is a source-level phase, but its detailed effects are not yet defined.
- **Rejoin-ready:** an implementation intermediate state. It must not be reported as rejoined or complete.

## 5. Original versus translated propositions

| Proposition | Source status | Assistant implementation | Result |
|---|---|---|---|
| Threading is experimental, not mandatory production design | Nathan-attributed repository record | Prototype documentation calls it experimental | Consistent |
| Return can be triggered by a state threshold or time cap | Nathan-attributed repository record | Readiness predicate uses threshold OR max time | Consistent at gate level |
| A return/rejoin follows readiness | Nathan-attributed repository record | Only `rejoin-ready` is reached | Incomplete |
| Displaced work, fallback and return action must be tracked | Nathan-attributed repository record | Fields exist, execution/restoration is absent | Partial |
| Consumer diversity and exposure matter | Nathan-attributed repository record | Consumer/policy metadata exists; enforcement is not established by the return gate | Partial |
| Orson observer interventions are logged separately from observations | Nathan-attributed repository record | Not implemented by this Threading module | Separate protected remit |

The earlier implementation audits already cover worker identity, receipt provenance, false diversity and exposure risks. They are not presented as newly tested findings here.

## 6. Discrepancy ledger

1. **Source attribution refinement:** h948 treated the six-step Threading sequence as unrecovered from Nathan. A contemporaneous Nathan-attributed Tern inbox record does preserve it. Raw conversation authentication remains missing.
2. **Terminal REJOIN absent:** the implementation stops at `rejoin-ready`. No operation executes the return action or produces a verified rejoined/complete state.
3. **Stored obligations are not executed:** displaced work, fallback and return action are fields, not completed effects.
4. **Propagation is only partly represented:** consumer and policy metadata exist, but this inspection does not establish actual dispatch, consumer eligibility or exposure enforcement.
5. **Formal postconditions remain undefined:** the source does not yet specify the state and work-restoration conditions that make a rejoin complete.
6. **No spatial geometry is supplied:** Threading is a temporal workflow protocol. Mapping it to H(s)H geometry would be an unsupported analogy.
7. **Raw-source gap remains:** the original 13:48 conversation and message IDs were not recovered.

## 7. Formalization boundary

Existing [PR #951](https://github.com/Satobloc/HsH/pull/951) contains the Threading readiness formalization. Its current PR head `f9fa0aad45408ab06e5430c834530854746235f0` matches exact-head [Actions run #42658236405](https://github.com/Satobloc/HsH/actions/runs/42658236405), which succeeded. The existing Lean module proves conditional readiness-gate statements and marks `rejoinReady`. It does not prove an actual return action, displaced-work restoration, or a transition to `rejoined`/`complete`.

No new Lean module or build was added. The missing terminal semantics are not yet a sufficiently specified proposition to formalize faithfully. A future formalization needs, at minimum, a typed return action, a displaced-work disposition, explicit preconditions, and postconditions that distinguish readiness from completed rejoin.

Lean success checks only the formalized statement. It does not establish that the source-to-code translation is sound or that the prototype has production behavior.

## 8. Equation custody checkpoint

The original SAT-O1 and Blockwave files were re-fetched by exact path. Their Git blob identities match prior byte-level custody records. The SHA-256 values below are carried forward from prior independent byte-level verification; they were not recomputed in this run.

| Original | Git blob | Prior verified SHA-256 | Date/provenance |
|---|---|---|---|
| [SAT-O1 4D](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT_O%20REWRITE/SAT%204D/SAT%20O1%204D.txt) | `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937` | Unbylined. The archive path's file listing reports creation metadata 2025-06-07 08:38:16 and last-write 2025-06-09 18:44:50. A separate root FileIndex row reports creation metadata 2025-10-26 19:12:34 and the same last-write value. Timezones are unspecified; neither is a composition date. |
| [Blockwave clean-action attachment](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%F0%9F%A7%B1BLOCKWAVE.txt) | `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` | `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664` | User-supplied attachment event 2025-09-16 16:31:26.687Z. Embedded prose is assistant-voiced; author and composition date remain unresolved. |

SAT-O1's verbatim core expressions are preserved below in their source notation:

```tex
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)

v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}

S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)

L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
```

The Blockwave attachment's source notation defines a conserved rank-two current and includes the holonomy-trace coupling:

```tex
J^{\mu\nu}, \qquad \nabla_\mu J^{\mu\nu}=0

\frac{g_h}{2} F_{\mu\nu}(\theta) J^{\mu\nu}
```

Its larger assistant-voiced action is built from `g_{\mu\nu}`, `u^\mu`, `\theta`, `P^\mu{}_{\nu}` and `J^{\mu\nu}`. It is not authenticated Nathan Direct mathematics.

**Corrected SAT-O1 equations: none. Corrected Blockwave equations: none.** No equation was modified or promoted.

## 9. Next deeper cursor

Recover the raw 2026-09-24 13:48 conversation and message IDs. Then define the source-authorized effects of REJOIN: return action, displaced-work disposition, fallback execution, and the postconditions for a completed return. Only after those definitions should the prototype or Lean model be changed. The Hydra-to-Threading projection and receipt-reduction maps remain separate, unresolved composition questions.

**Disposition:** ADDITIVE CORRECTION TO H948 / SOURCE-ATTRIBUTION QUALIFIED / TERMINAL REJOIN GAP IDENTIFIED / EXISTING EXACT-HEAD LEAN EVIDENCE REUSED / NO NEW BUILD / NO RUNTIME SYNTHETIC TEST / NO PHYSICAL OR CODATA RESULT / NO PROTOTYPE OR THEORY CHANGE.

# SAT/H(s)H Workflow Branching Map

**Status:** CURRENT / CENTRAL ROUTING MAP  
**Established:** 2026-09-20  
**Purpose:** show how work branches, rejoins, pauses, hands off, escalates, and changes execution leases across the distributed SAT/H(s)H project.

This map is a **router, not a cage**. It describes the normal decision structure without forbidding a better safe path when current evidence, Nathan directives, or project state warrant one.

Related controls:
- `CURRENT_WORKFLOW_ORIENTATION_V2.md`
- `INSTANCE_REGISTRY_EXECUTION_LEASES.md`
- `INSTANCE_ONBOARDING_3REPO.md`
- `CARPE_TURNEM_POLICY.md`
- `NO_CONVERSATION_RENAMING_POLICY.md`

---

## 1. Master work router

```mermaid
flowchart TD
    A[Turn / recurrence / handoff arrives] --> B{New, revived, stale, or unfamiliar repo/tool context?}
    B -- Yes --> C[Run triggered onboarding / reorientation]
    B -- No --> D[Read current shared state]
    C --> D

    D --> D1[Directives]
    D --> D2[Task / branch graph]
    D --> D3[Milestone / phase state]
    D --> D4[Check-ins / handoffs / blockers]
    D --> D5[Instance / lease state]

    D1 --> E[Identify highest-value bounded safe operation]
    D2 --> E
    D3 --> E
    D4 --> E
    D5 --> E

    E --> F{Existing branch already covers it?}
    F -- Yes --> G[Join / continue / cover existing branch]
    F -- No --> H{Does a genuinely distinct branch need to exist?}
    H -- No --> G
    H -- Yes --> I[Create child / sibling branch with provenance + exit criteria]

    G --> J{What kind of work is it now?}
    I --> J

    J --> K[Control plane / workflow / coordination]
    J --> L[Archive / provenance / source recovery]
    J --> M[Theory / reconstruction / formalization / solver]
    J --> N[Tooling / accessibility / indexing / QA]
    J --> O[Benchmark / data / external-resource work]
    J --> P[Revival / enrichment / independent pass]
    J --> Q[Communication / question / handoff / blocker repair]

    K --> R[Choose repo + tools + exposure route]
    L --> R
    M --> R
    N --> R
    O --> R
    P --> R
    Q --> R

    R --> S{Quarantine / blinding / independence constraint?}
    S -- Yes --> T[Use cleared interface / preserve exposure state / stop prohibited ingress]
    S -- No --> U[Execute bounded operation]
    T --> U

    U --> V{Result type}
    V --> V1[Material advance]
    V --> V2[Useful negative / no-op]
    V --> V3[Blocker / missing dependency]
    V --> V4[Conflict / contradiction]
    V --> V5[New branch discovered]
    V --> V6[Milestone / phase trigger reached]

    V1 --> W[Checkpoint durable state]
    V2 --> W
    V3 --> W
    V4 --> W
    V5 --> W
    V6 --> W

    W --> X{What should happen next?}
    X --> X1[Continue same branch next eligible turn]
    X --> X2[Handoff / reassign branch]
    X --> X3[Release / rotate execution lease]
    X --> X4[Park with explicit return trigger]
    X --> X5[Merge / supersede / retire branch]
    X --> X6[Change milestone / task graph / focal artifacts]
    X --> X7[Escalate Nathan-only decision]

    X1 --> Y[Leave next cursor]
    X2 --> Y
    X3 --> Y
    X4 --> Y
    X5 --> Y
    X6 --> Y
    X7 --> Y

    Y --> Z[Carpe turnem: if another safe bounded advance is already authorized in this turn, take it; otherwise stop at durable boundary]
```

### Reading the map

The map does **not** require every turn to visit every box. It prevents four recurrent failures:

1. starting work before reading current shared state;
2. creating a new branch when an existing one already covers the task;
3. confusing branch reassignment with instance identity change;
4. ending with agreement or intention when a safe concrete step is already executable.

---

## 2. Repository-routing branch

Choose the repository by **evidentiary/operational role**, not convenience.

```mermaid
flowchart LR
    A[What is the task asking for?] --> B{Primary source role}

    B -- Historical SAT / provenance / genealogy / source recovery --> C[SAT_THEORY_ARCHIVE_2023-25]
    B -- Current workflow / Common / live sandbox / current reconstruction / coordination --> D[HsH]
    B -- External resources / bibliography / extraction / benchmarking / exposure evidence --> E[HSH_RESOURCES]

    C --> F[Use Dashboard + indices as maps; inspect underlying sources]
    D --> G[Use current Common state; write durable current control/work artifacts here]
    E --> H{PRIOR_ART or other quarantine boundary implicated?}
    H -- No --> I[Use permitted resource / extraction / benchmark surfaces]
    H -- Yes --> J[Do not enter directly; route through explicitly cleared interface]

    F --> K[Preserve repo/path/source identity]
    G --> K
    I --> K
    J --> K
```

Cross-repo work should usually **link/crosswalk** rather than flatten repository roles. A historical source can inform a live HsH branch without being moved or silently promoted to current authority.

---

## 3. Task / branch lifecycle

A task is not merely `open` or `closed`. Use enough state to make distributed continuation possible.

```mermaid
stateDiagram-v2
    [*] --> Candidate
    Candidate --> Active: selected / claimed
    Candidate --> Parked: useful but not current
    Candidate --> Rejected: duplicate / invalid / unsafe

    Active --> Active: bounded progress + checkpoint
    Active --> Blocked: dependency / access / decision missing
    Active --> Split: distinct child problems emerge
    Active --> HandoffPending: better instance / method / exposure fit
    Active --> Parked: current value falls or prerequisite missing
    Active --> Completed: exit criterion met
    Active --> Superseded: better route replaces mechanism

    Blocked --> Active: dependency resolved
    Blocked --> HandoffPending: alternate instance can route around
    Blocked --> Parked: await explicit trigger

    Split --> Active: parent remains live
    Split --> Completed: parent becomes routing container only

    HandoffPending --> Active: receiver accepts continuity packet

    Parked --> Active: return trigger fires
    Parked --> Superseded: intent satisfied elsewhere

    Completed --> [*]
    Superseded --> [*]
    Rejected --> [*]
```

### Minimum branch record

Every meaningful live branch should carry, where applicable:

- branch/task ID;
- parent/children or related branches;
- source directive / Dashboard intention / milestone origin;
- underlying intention;
- current implementation route;
- status;
- priority / current information value;
- owner or current lease holder, if any;
- candidate instances / useful skill fits;
- dependencies and blockers;
- source/exposure/quarantine constraints;
- last meaningful work and last-touched time;
- covered sources/artifacts;
- failed/no-op approaches worth not repeating;
- next cursor;
- exit criterion;
- park/revisit trigger;
- handoff / return route;
- supersession/retirement reason if closed.

---

## 4. When to branch, when not to branch

### Create a child/sibling branch when

- the work has a genuinely different exit criterion;
- it can proceed independently without forcing lockstep with the parent;
- it requires materially different exposure/quarantine handling;
- it needs an independent-first-pass condition;
- it exposes a distinct contradiction, missing derivation, tool defect, provenance question, or benchmark obligation;
- a large branch needs decomposition so multiple instances can work without collision.

### Do **not** create a branch merely because

- a different instance takes over;
- the same task moves to another repository surface;
- a worker uses a different method on the same exit criterion;
- the current recurrence name sounds unrelated;
- one bounded step was completed;
- a historical Dashboard implementation has been replaced while its underlying intention remains the same.

In those cases, usually update the existing branch history, implementation route, owner/lease, or method record.

---

## 5. Instance / execution-lease lifecycle

**Stable instance identity and work routing are separate graphs.**

```mermaid
stateDiagram-v2
    [*] --> AccessibleUnscheduled
    AccessibleUnscheduled --> Scheduled: receives execution lease
    Scheduled --> AccessibleUnscheduled: lease released
    Scheduled --> Paused: intentional pause
    Paused --> Scheduled: resume / new lease
    Paused --> AccessibleUnscheduled: pause ends without lease

    AccessibleUnscheduled --> HistoricalAccessible: substantial context drift / historical status
    HistoricalAccessible --> AccessibleUnscheduled: synchronized to current controls
    HistoricalAccessible --> RevivalReady: access/reconstruction requires revival packet
    RevivalReady --> HistoricalAccessible: reconstructed / manually reopened
    RevivalReady --> AccessibleUnscheduled: successful revival + onboarding

    CandidateUnverified --> HistoricalAccessible: accessibility verified
    CandidateUnverified --> RevivalReady: archive continuity established
```

### Lease reassignment is not identity reassignment

When the project needs a different perspective:

1. preserve the current worker's checkpoint;
2. release or pause its execution lease if needed;
3. choose an eligible instance from the larger population;
4. supply a continuity/wake packet;
5. preserve exposure and independence constraints;
6. let the new lease holder work the branch without pretending it has become the prior instance.

When the original instance returns, do not automatically snap the branch back. Decide whether to return ownership, keep the replacement, split the work, or give the returning instance a different branch.

---

## 6. Check-in / bottleneck branch

```mermaid
flowchart TD
    A[Expected worker / branch check-in] --> B{Fresh durable evidence?}
    B -- Yes --> C[Healthy / continue normal routing]
    B -- No --> D{Intentional pause, longer cadence, or dependency wait documented?}
    D -- Yes --> E[Quiet-within-window / paused]
    D -- No --> F[Watch / inspect schedule + checkpoint + assignment]
    F --> G{Repeated miss, stale checkpoint, execution fault, or unresolved blocker?}
    G -- No --> H[Keep watch]
    G -- Yes --> I[Suspected bottleneck]
    I --> J{Can repair locally?}
    J -- Yes --> K[Repair + resume]
    J -- No --> L[Park / split / reassign branch or execution lease]
    L --> M[Continuity packet required]
```

Silence is a **signal**, not proof of failure. Diagnose before reallocating.

---

## 7. Revival branch

Revival is about recovering **instances**, not merely abandoned tasks.

```mermaid
flowchart TD
    A[Need diversity / continuity / historical perspective / abandoned branch coverage] --> B[Inspect instance registry + stratigraphy + checkpoints]
    B --> C{Accessible current/past instance suitable?}
    C -- Yes --> D[Prepare bounded assignment + synchronization packet]
    C -- No --> E{Archived/revival-ready candidate useful?}
    E -- No --> F[Use another eligible instance]
    E -- Yes --> G[Prepare wake packet + exposure record]
    G --> H{Manual launch/reopen required?}
    H -- Yes --> I[Record exact Nathan action needed]
    H -- No --> J[Revive/reconstruct]
    I --> J
    J --> K[Triggered onboarding / current-state synchronization]
    K --> L[Enter generalist pool as stable identity]
    L --> M[May receive temporary execution lease]
```

Revival should preserve methodological oddity and historical exposure where useful. Do not flatten revived workers into generic clones.

---

## 8. Result-routing branch

After a bounded operation, route by what actually happened.

| Result | Normal route |
|---|---|
| Material advance | update branch state; leave next cursor; continue or release lease |
| Useful negative result | record what failed and why; prevent redundant repetition; choose next route |
| No-op / no new information | record only if operationally useful; anti-rut may redirect |
| Blocker | document exact dependency; route around, park, hand off, or escalate |
| Contradiction | preserve both sides + source/provenance; open distinct reconciliation child only if needed |
| New source | crosswalk to branch; inspect source before promoting claims |
| New tool defect | create tooling/QA child if it has independent repair criteria |
| New theory idea | sandbox branch with assumptions/status; do not promote by coherence alone |
| Benchmark match | classify input/fit/derived/predicted-before-comparison; numerical agreement alone does not validate |
| Milestone reached | update phase state, task weights, focal artifacts, lease mix, and successor goals |
| Nathan decision required | use `🔶`; state the smallest concrete decision/action needed |

---

## 9. Priority-selection branch

There is deliberately no single rigid numeric score. A generalist should weigh:

1. **controlling Nathan directive / hard dependency**;
2. **milestone-critical work**;
3. **blocker removal / continuity repair**;
4. **high information gain or falsification value**;
5. **neglected/starved high-value branch**;
6. **fit with available instance strengths and exposure state**;
7. **diversity value / independent method**;
8. **reversibility and boundedness**;
9. **expected compounding value**;
10. **anti-rut pressure** when recent work has repeated without information gain.

Soft specialization is one input, not a jurisdictional rule.

---

## 10. Milestone / phase branching

Milestones are **transition rules**, not ceremonial checkboxes.

A milestone may legitimately change:

- which branches are active, parked, merged, or retired;
- branch priority weights;
- current focal documents/artifacts;
- benchmark suites;
- required formalization depth;
- worker/instance mix and execution leases;
- revival targets;
- onboarding material;
- next-phase goals themselves.

When a milestone fires, preserve the old goal and reason for transition. New goals may revise or supersede historical Dashboard mechanisms while preserving the underlying Nathan intention.

---

## 11. Communication / return-route branch

No project question or handoff should terminate in a cul-de-sac.

For every meaningful question, handoff, reassignment, or blocker, preserve:

- origin branch / instance;
- destination or routing surface;
- exact ask / transferred state;
- response or disposition state;
- return route;
- timeout/escalation trigger if blocking;
- whether Nathan action is actually required.

Common shared surfaces are preferred over isolated worker-local notes for cross-project routing. Local checkpoints remain appropriate for local continuity but should point outward when another worker must act.

---

## 12. Carpe turnem at every branch point

At any node in this map, ask:

> **Is the next safe bounded operation already authorized, sufficiently specified, and technically available in this turn?**

If yes, perform it now.

If no, leave the most exact durable state possible: blocker, missing decision, next cursor, return trigger, or handoff.

The anti-pattern is not stopping. The anti-pattern is stopping at **mere agreement or intention** when concrete progress was already available.

---

## 13. Maintenance rule

Update this map when the project materially changes its repository roles, central state surfaces, task lifecycle, milestone logic, scheduler limits, revival model, quarantine interface, or handoff/check-in system.

Do not add every local workflow detail to the central map. Keep local branch-specific procedures in their own documents and link them here only when they change global routing.

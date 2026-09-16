# Reference Lanes — SAT / H(s)H

**Status:** ACTIVE routing surface  
**Authority:** Nathan Direct, 2026-09-16  
**Purpose:** make every habitually consulted project document legible by function and authority.  
**Theory center:** [`/BEDROCK.md`](../../BEDROCK.md)  
**Human navigation center:** Nathan's Dashboard.

## Core rule

**“Reference material” is not an epistemic category.** Every document workers are expected to consult habitually must be routed into a named lane. If the lane is unclear, that is a documentation/wayfinding defect; do not guess the document's authority from recency, polish, location, filename, or repeated citation.

A document may be linked from more than one lane for navigation, but it must have one clear **primary role**. Cross-linking never promotes theory status.

## Lane test

Ask: **Why am I expected to read this?**

| If the answer is… | Primary lane | Controlling surface |
|---|---|---|
| “It tells me what SAT/H(s)H presently assumes, inherits, is investigating, or permits me to build on.” | **THEORY / BEDROCK** | [`BEDROCK.md`](../../BEDROCK.md) |
| “It tells me where things are and how to find/read them.” | **NAVIGATION / ORIENTATION** | Nathan's Dashboard + repo front doors |
| “It tells me how workers coordinate, hand off, schedule, triage, or operate.” | **ADMIN / WORKFLOW** | [`AUTOMATION_WORKFLOW_CONTROL.md`](AUTOMATION_WORKFLOW_CONTROL.md) and related Common controls |
| “It tells me whether pipelines, indexes, manifests, Viewer, publication, or repository machinery are functioning.” | **INFRASTRUCTURE / QA** | [`INFRASTRUCTURE_QA_ROTATION.md`](INFRASTRUCTURE_QA_ROTATION.md) + infrastructure artifacts |
| “It tells me what happened, when, who said it, where a claim came from, or how a source evolved.” | **ARCHIVE / PROVENANCE** | archive indices, Viewer, chronology, tagging/provenance surfaces |
| “It supplies mathematics, methods, papers, data, standard terminology, or supporting material.” | **METHODS / RESOURCES** | permitted RESOURCES / Toolkit / source libraries |
| “Its exposure is restricted or requires controlled prior-art handling.” | **QUARANTINE / PRIOR-ART** | quarantine-controlled routing only |

## Theory / BEDROCK lane

All substantive SAT/H(s)H theory work begins with [`BEDROCK.md`](../../BEDROCK.md) and returns there when work changes what may safely be assumed.

BEDROCK is an **index/control surface**, not a demand to copy every theory document into one file. It assigns premise/status roles and points outward to foundational sources, Nathan Direct, working bedrock, tentative findings, contested questions, superseded formulations, current construction documents, solvers, equations, and primary source records.

The Fundamental Intuitions — Extended remains the foundational source routed through BEDROCK. Current construction documents such as Ravel artifacts remain sandbox/current-construction sources unless proposition-level status is explicitly entered or promoted in BEDROCK.

A theory-bearing document outside `/BEDROCK.md` is not “outside the BEDROCK lane” if BEDROCK clearly routes and statuses it. Conversely, merely appearing in a theory workspace, paper folder, featured list, recent conversation, or synthesis does not place a document in bedrock.

## Navigation / orientation lane

Navigation surfaces answer **where do I go?**, not **what is true/current?**

The repository README/front door, Nathan's Dashboard, Viewer entry points, folder maps, orientation pages, and resource maps belong here unless they contain a separately statused theory proposition.

Navigation should route theory workers to BEDROCK rather than becoming a competing theory summary.

## Admin / workflow lane

Common controls for automation, worker autonomy, handoffs, Q&A routing, attention flags, automation roster, revival/reentry operation, coordination, check-ins, and bibliography sequencing are operational references.

Their authority concerns **how work is performed/routed**, not theory truth. If an operational file must mention a theory status for routing, it should point to BEDROCK/Nathan Direct rather than becoming an independent theory authority.

## Infrastructure / QA lane

Workflow definitions, trigger coverage, publication safety, source inventories, generated manifests, Viewer builders, indexing scripts, convergence checks, checksums, regression cases, and infrastructure reports belong here.

A successful infrastructure check establishes only the exact operational condition checked. It does not promote the contents carried by the pipeline.

## Archive / provenance lane

Raw conversations, historical documents, chronology, source ancestry, derivation indices, tagging ledgers, Nathan Direct extraction/packages, duplicate/superset records, and historical status maps belong here when their primary purpose is preservation/attribution/history.

Archive accessibility never confers current theory authority. A primary historical source can simultaneously be cited by BEDROCK while remaining an archive/provenance object in repository organization.

## Methods / resources lane

Permitted HSH_RESOURCES material, RESOURCES Toolkit mathematics, standard references, data, glossaries, bibliographies, software/method notes, and external literature used as ordinary support belong here unless another routing rule applies.

Supporting usefulness does not make an external or mathematical source a theory premise. BEDROCK records any deliberate theory adoption separately.

## Quarantine / prior-art lane

PRIOR_ART and other explicitly quarantined material remain hard-separated. Ordinary workers do not inspect quarantine content and do not reproduce quarantine-side reasoning into BEDROCK, Common, archive, or methods lanes. Only cleared pointers/status packets cross through defined interfaces.

## Current conspicuous-reference classification

| Document/surface | Primary lane | Note |
|---|---|---|
| [`BEDROCK.md`](../../BEDROCK.md) | THEORY / BEDROCK | Central theory control surface. |
| The Fundamental Intuitions — Extended | THEORY / BEDROCK + foundational primary source | Foundational source; routed through BEDROCK. |
| HsH Issues #2/#3 | NAVIGATION / ORIENTATION + Nathan Direct routing | Establish FIE/resource-map/orientation priority; BEDROCK carries their theory-control consequence. |
| [`CURRENT_HSH_HYPOTHESIS_STATUS_2026-09-14.md`](CURRENT_HSH_HYPOTHESIS_STATUS_2026-09-14.md) | THEORY / BEDROCK source | Nathan-correction/status source; should be consumed/routed by BEDROCK rather than remain a competing control center. |
| `WORKSPACES/RAVEL/*` current construction documents | THEORY / BEDROCK source — sandbox | Candidate/current construction; not automatic bedrock. |
| `synthesis/CURRENT_SYNTHESIS.md` | NON-CONTROLLING / quarantined historical integration surface | Must not be used as current theory authority unless newer Nathan Direct changes status. |
| [`AUTOMATION_WORKFLOW_CONTROL.md`](AUTOMATION_WORKFLOW_CONTROL.md) | ADMIN / WORKFLOW | Operational control, explicitly not theory truth. |
| [`WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`](WORKER_AUTONOMY_HANDOFF_PROTOCOL.md) | ADMIN / WORKFLOW | Worker operating/handoff rules. |
| [`SHARED_STATE_WRITE_SAFETY.md`](SHARED_STATE_WRITE_SAFETY.md) | INFRASTRUCTURE / QA | Semantic/generated write discipline. |
| [`INFRASTRUCTURE_QA_ROTATION.md`](INFRASTRUCTURE_QA_ROTATION.md) | INFRASTRUCTURE / QA | Pipeline-convergence QA. |
| [`QNA_TRIAGE_QUEUE.md`](QNA_TRIAGE_QUEUE.md) | ADMIN / WORKFLOW | Question routing. |
| [`NATHAN_ATTENTION_FLAG_PROTOCOL.md`](NATHAN_ATTENTION_FLAG_PROTOCOL.md) | ADMIN / WORKFLOW | Nathan-attention escalation semantics. |
| [`BIBLIOGRAPHY_SEQUENCE_ROADMAP.md`](BIBLIOGRAPHY_SEQUENCE_ROADMAP.md) | ADMIN / WORKFLOW + ARCHIVE / PROVENANCE | Sequences source-ancestry/bibliography work; not theory authority. |
| [`COORDINATION.md`](COORDINATION.md), [`CHECKINS.md`](CHECKINS.md), [`ACTIVE_AUTOMATION_ROSTER.md`](ACTIVE_AUTOMATION_ROSTER.md) | ADMIN / WORKFLOW | Live operational state; historical entries may be stale. |
| [`REVIVAL_ROTATION_PROTOCOL.md`](REVIVAL_ROTATION_PROTOCOL.md), [`REENTRY_RUBRIC_PUBLIC_INTERFACE.md`](REENTRY_RUBRIC_PUBLIC_INTERFACE.md) | ADMIN / WORKFLOW | Revival routing; quarantine boundary remains separate. |
| Conversation Viewer | ARCHIVE / PROVENANCE + NAVIGATION | Development record and access surface, not theory authority. |
| SAT Theory Archive | ARCHIVE / PROVENANCE | Historical primary record; particular foundational/theory sources may be routed through BEDROCK. |
| HSH_RESOURCES / permitted RESOURCES Toolkit | METHODS / RESOURCES | Active supporting library; not generally quarantined. |
| PRIOR_ART | QUARANTINE / PRIOR-ART | Hard quarantine.

## Maintenance rule

Do not solve classification ambiguity by creating another broad “important docs” pile. Route the document to the lane that explains why it matters, then link it from the appropriate controlling surface.

When a document's role changes, preserve the old role historically where useful and update its current routing explicitly.

### Next bounded cursor

Inspect the recurring-worker startup path for places that still send theory workers directly to FIE/current-status/synthesis surfaces without first routing through BEDROCK. Repair **one** such startup/control edge per later bounded pass.

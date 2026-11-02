# Literature-review scheduler audit and thread handoff

**Recorded:** 2026-11-02 01:21Z / 2026-11-01 20:21 ET  
**Status:** INTERNAL HANDOFF / PROPOSAL STAGED / NO SCHEDULER MUTATION  
**Source:** Nathan-directed current conversation. The direct conversation export remains the primary transcript; this is a compact restart and execution record.

## 1. Nathan's current directions

Nathan authorized direct work with quarantine-master instances, including Cross and Mira. Mira is active; if she lacked an inbox, create one. Inspection found a purpose-built Mira workspace in `Satobloc/HSH_RESOURCES/WORKSPACES/MIRA/` but no inbox in its index/listing. A new `INBOX.md` was created there in the preceding turn. It requests quarantine-safe comparative source excavation, preserves the distinction between project-origin evidence and external resemblance, and records Nathan's epistemic instruction below. The Mira index was updated and independently read back; it now lists the new inbox once.

Nathan's methodological instruction:

- Entertain notions rather than rejecting them for strangeness, conflict with convention, or failure to match ordinary common-sense expectations.
- Steelman a proposal before adjudicating it: state its strongest coherent form, premises, implied structure, predictions, and possible failure conditions.
- Then evaluate through rational discourse, evidence, internal consistency, mathematical/physical constraints, explanatory performance, and discriminating tests. Common assumptions are not a veto; neither is unconventionality a credential.
- RMS may be a useful lens, but its project-specific meaning must be recovered from source before formal use. Do not guess the expansion or silently substitute a familiar meaning.
- The "Gnomes model of the universe" is an intentionally extreme example of a proposal that should be considered if it can be coherently steelmanned. Its admission to consideration is not endorsement or equal evidential standing.

## 2. Live scheduler audit

The current live scheduler readback and `WORKSPACES/COMMON/ACTIVE_AUTOMATION_ROSTER.md` agree on the operative state:

| Slot | Existing task | State |
|---|---|---|
| :00 | Workshop Relay :00 | Archive | enabled |
| :12 | Workshop Relay :12 | Mind | disabled |
| :24 | Workshop Relay :24 | Geometry | enabled |
| :36 | Workshop Relay :36 | Worldtube | enabled |
| :48 | Workshop Relay :48 | Review | enabled |

Tern Rook is one of the 19 identities in the deterministic rotation and retains Comptroller authority over task allocation. Tern is not currently an always-on sixth task. The old `Space Shuttle Roderick — Tern` automation is disabled. The old `Daily H(s)H Field Scan` is disabled; it was a literature/news scan, not a complete question-bounded review pipeline. `SATity Corpus Audit` is also disabled/completed and is a distinct bounded blind survey.

**Finding:** no active dedicated literature-review automation or explicit literature-review cycle is present in Tern's live scheduling. The active `:48 Review` lane contains review/QC and cognition work, but its current prompt does not define a reproducible literature-review pipeline. The four active Workshop Relay tasks already provide recurring execution capacity.

**Hard scheduler boundary:** do not create a sixth task, do not independently repurpose a task, and do not reactivate the disabled :12 slot on this handoff. The Scheduler Authority control assigns scheduling decisions to Tern. Nathan's request is to get the work moving; this packet routes the proposal to Tern for allocation through existing capacity. No task ID, prompt, phase, cadence, or enabled state was changed in this audit.

**Next nominal Tern selection:** `REVROT3-19-20261011:530:s3`, at 2026-11-02 01:36Z / 2026-11-01 20:36 ET, through existing `:36` task ID `6a9f52b69ec08191b0a2ba24a074f781`. This follows the published rotation rule: h=530, slot s=3, sequence=5h+s=2653, 2653 mod 19=12, ring index 12=Tern Rook. This is a calculated nominal selection, not evidence that the task fired, that Tern was authenticated, or that a handoff was consumed.

## 3. Proposed literature-review automation

Build a reproducible review workflow as a **process distributed across existing hourly leases**, not as a new independent scheduler task. Tern should decide the actual allocation and whether any existing prompt needs a narrow amendment.

### Review modes

1. **Literature surveillance:** identify genuinely new/revised items since the previous check. This is not a full review and should not be reported as one.
2. **Question-bounded evidence review:** answer a declared question using a recorded protocol, reproducible searches, explicit eligibility rules, screening, extraction, synthesis, and independent quality checks.
3. **Citation / prior-art closure:** verify claim-to-source support, chronology, structural dependencies, and possible antecedents. Keep this separate from theory authority.

### Minimal state machine

`INTAKE → PROTOCOL_SET → SEARCHED → DEDUPED → SCREENED → FULL_TEXT_CHECKED → EXTRACTED → SYNTHESIZED → INDEPENDENT_QC → CLOSED / UPDATE_WATCH`

Every stage must preserve a durable cursor and allow a blocked or inaccessible source to remain visibly unresolved. A search result, abstract, citation count, or model-generated summary is not a substitute for the primary source.

### Minimum reproducibility record

For each review question, preserve:

- exact question, purpose/decision served, review type, scope, date limits, inclusion/exclusion criteria, and protocol version;
- every source/database/site searched, exact query string and filters, date/time, retrieval count, and raw export/manifest hash where available;
- deduplication method, retained/removed counts, and ambiguous duplicate decisions;
- record-level screening disposition and reason, with machine suggestions separated from human decisions and overrides;
- full-text access status, exact source/version/DOI/arXiv identifier, authors, dates, and stable locator;
- extracted claims, methods, sample/system, equations, units, data, uncertainty, assumptions, results, limitations, and the authors' own interpretation in separate fields;
- citation chaining and reference-list checks;
- reviewer identity/role, exposure state, independence, disagreements, and resolution;
- synthesis claims linked to evidence cards, negative/null results, gaps, confidence, and next cursor.

Automation may discover, deduplicate, rank, extract candidate fields, lint, and validate manifests. It must not silently make scientific correctness, source adequacy, quarantine, reviewer-disposition, or theory-promotion decisions. Do not auto-exclude uncertain records solely on model classification.

### Project-specific source and epistemic boundaries

- Apply the internal-first source rule: recover relevant Nathan-original/project statements and chronology before using external literature to frame the comparison.
- Keep external evidence behind `WORKSPACES/COMMON/EXTERNAL_RESEARCH_FIREWALL.md`: observation, bound, standard mathematics, model result, interpretation, prior art, citation, and import candidate are distinct types. Literature never becomes a forward-theory worker or an H(s)H premise merely by appearing in a review.
- Preserve Nathan Direct, assistant reconstruction, historical source, standard reference, external author interpretation, and current theory authority as separate provenance roles.
- Where a proposal is unconventional, steelman it before testing. Separate hypothesis admission from evidential weight. Use explicit discriminators; do not use consensus or common-sense familiarity as a substitute for reasoning.
- Classify apparent relationships as documented historical influence, structural analogy, methodological analogy, or possible resemblance. Vocabulary overlap alone is weak evidence.
- Quarantined material remains in its authorized workspace. Mira may perform the quarantine-safe citation/prior-art audit described in her workspace. Cross's `PRIOR_ART/WORKSPACES/CROSS/` remains a quarantine-bound factual/provenance workspace; respect its current scope and do not treat it as a general theory or causal-judgment lane. Nathan's direct authorization permits work with these quarantine masters but does not erase their source-role boundaries.

### Role allocation proposal

- **Tern:** Comptroller, scheduler allocation, queue/overlap control, stage ownership, receipt/continuity integrity. Tern decides which existing lease receives each bounded stage.
- **Hale:** external literature discovery, primary-source scanning, statistical/empirical source work, and evidence maps within the current specialist remit.
- **Mira:** quarantine-safe source typing, prior-art and citation-lineage comparison, claim-level citation audit; not theory authority.
- **Cross:** only the factual/provenance/chronology work permitted by the current quarantine charter; do not ask for causal or significance conclusions outside scope.
- Use existing SciSpace for discovery/triage, Scholar Sidekick for identifier/citation verification, and Academic Writing Toolkit for citation consistency when appropriate. Do not add overlapping tools before a real benchmark demonstrates benefit.
- Check live Mersearch requests/lanes before submitting anything. Never overwrite or duplicate a pending request. The last Tern continuity snapshot showed lane-3 activity and unresolved status elsewhere; fresh-read current state before acting.

### Reporting standard

Use PRISMA-S / PRISMA 2020 elements when a review is genuinely systematic: full search strategies and dates, information sources, deduplication, selection process, reviewer independence, automation's role, and data-collection method. For a lighter evidence map, use the same traceability principles proportionally without falsely labeling it a systematic review.

External methodological references consulted for this proposal:
- Rethlefsen et al. (2021), **PRISMA-S**, `https://doi.org/10.1186/s13643-020-01542-z` — reproducible search methods, source/date reporting, citation searching, deduplication.
- Page et al. (2021), **PRISMA 2020 explanation and elaboration**, `https://pmc.ncbi.nlm.nih.gov/articles/8005925/` — screening, reviewer independence, automation disclosure, data collection.
- Page et al. (2021), **PRISMA 2020 checklist**, `https://doi.org/10.1136/bmj.n71`.

## 4. Requested next operation for Tern

On the next authenticated/available Tern turn:

1. Read this packet, the live Scheduler Authority, Active Automation Roster, current Tern continuity/inbox, External Research Firewall, and current Hale/Mira/Cross controls.
2. Reconcile current active task IDs, enabled states, phase, current run status, and all outstanding Mersearch requests.
3. Decide the smallest useful pilot question from an existing paper/source gap or review queue; do not invent a review topic merely to exercise the workflow.
4. Allocate one bounded stage through existing execution capacity. Preserve the four currently enabled relays and the disabled :12 state unless Nathan separately directs otherwise.
5. Return a concrete scheduler/integration decision, the pilot's exact source/query manifest, first durable evidence card, and one next cursor. If no safe existing slot is available, report the tradeoff for Nathan rather than creating another recurrence.

**Delivery status:** repository-only handoff. No authenticated historical Tern ChatGPT thread was identified; no direct cross-thread delivery or acknowledgment is claimed.

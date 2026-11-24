# H935:S4 | Review-MIND: cognition event graphs, braidability, and source fidelity

**Nominal slot:** 2026-11-18 23:48Z  
**Ring calculation:** h=935; seq=5h+4=4679; 4679 mod 19=5. Ring label: Mira. Next label: Aldus.  
**Completion:** 2026-11-19 00:08Z  
**Disposition:** ASSISTANT-LEVEL RESEARCH COMPLETE; DRAFT LEAN PR EXACT-HEAD BUILD PASS; NO EMPIRICAL STUDY; NO THEORY OR PAPER-GATE PROMOTION.

## Attribution and scope

The ring label is a deterministic routing label, not authentication of a ChatGPT instance, conversation, or worker. No authenticated Mira thread, Mira participation, direct-thread delivery, or acknowledgment is claimed.

The only cleared shared role witness used here is [STAT.txt](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/STAT.txt), which calls Mira a guide to Braid Theory. This is a role witness, not a standalone signed specialist charter. The current steering boundary keeps Mira-specific research material outside the active internal review corpus. No Orson P1 manuscript or private prior-art payload was used or forwarded.

This report is an assistant reconstruction from public papers and shared HsH/SAT archive records. It is not Nathan Direct, not a new SAT/H(s)H theory result, and not an empirical result from this Workshop Relay.

## Principal finding

Multi-agent LLM studies measure several different things that must not be collapsed:

- expressed agreement or textual alignment;
- individual answer/stance revision;
- evidence exposure and uptake;
- source-root diversity and independence;
- group accuracy and calibration;
- minority-evidence retention and false adoption.

A group can become more verbally aligned without changing its selected answer. A heterogeneous group can outperform a homogeneous group on a particular estimation task without establishing independent evidence sources. A network's topology can affect message flow without being a braid group.

The useful methodological rule is **event-graph first, braid only after an explicit structure-preserving map is specified**.

## Primary cognition sources

### 1. Qian, *What Does Multi-Agent Debate Actually Change?* (arXiv:2609.08016v3, 7 October 2026)

[Original arXiv source](https://arxiv.org/abs/2609.08016)

The study uses 50 GlobalOpinionQA questions and five language models in two- and three-member debate configurations. In the three-member condition, the paper describes a fixed router-directed tree with six five-turn paths and shared prefixes. A reply is generated once and reused in every path and assignment containing it. This is a branching family of message histories, not six independent transcripts.

Across its six settings, the paper reports 92.2–96.6% unchanged answer options after full debate. Per-turn option changes are 4.1–5.2%; a forced-opposition condition produces 7.7% changes versus 6.4% under natural tone. The text can become more agreeable while the selected option remains stable.

The study therefore measures response and text behavior, not latent belief or consciousness. Its path-level observations are dependent where they share prefixes. The reported judge agreement is 44/50 for reply-text classification and 48/50 for conclusion-change classification. No human-group experiment is reported.

### 2. Fukushima, *Message capacity and claim wording set the transition points of collective truth-finding in language-model networks* (arXiv:2609.19183)

[Original arXiv source](https://arxiv.org/abs/2609.19183)

The study reports 31,824 randomized single-shot queries, a 32-agent network, eight rounds, and separate calibration and experimental claim sets. Its initial pooled-threshold prediction (alpha-star approximately 0.435 ± 0.03) failed under the full experimental prompt scaffold: the single-agent response field did not transfer from the bare calibration prompt to the full claim wording and context.

The paper then reports claim-specific fields. Crucially, it explicitly distinguishes the failed pre-registered pooled prediction from claim-resolved predictions in Sections 4.2–4.6 that were computed after the collective experiments from single-agent data and were not prospectively registered. A separate assertion-polarity discrimination experiment was pre-registered.

This is a useful prediction-versus-fit example. The field is a model- and claim-specific response property, not a truth label. The results do not establish a universal law of group cognition or a physical mechanism.

### 3. Barrera-Lemarchand, Sigman, and Navajas, *The Wisdom of Artificial Deliberative Crowds* (arXiv:2609.22497)

[Original arXiv source](https://arxiv.org/abs/2609.22497)

This preprint studies three model families across four task domains. Its heterogeneous deliberative groups improve on independent aggregation in the reported task settings. The same-family clone comparisons in Studies 1 and 2 do not show the same benefit, while heterogeneous groups do. The paper also reports domain-specific expert dominance: one model family is strongest in several tasks, and in one forecasting setting an individual model outperforms the deliberative group.

This does not contradict Qian's answer-stability result: the tasks, baselines, and dependent variables differ. It does show that model-family heterogeneity can matter in some estimation settings. It does **not** establish source independence. Different model families may still share evidence, pretraining material, prompts, or retrieved sources. The paper states that data/code would be made available through OSF and upon request; this review did not independently reproduce its results.

## Mathematical and geometric boundary

An and Maciazek, *Geometric Presentations of Braid Groups for Particles on a Graph*, Communications in Mathematical Physics 384 (2021), DOI [10.1007/s00220-021-04095-x](https://doi.org/10.1007/s00220-021-04095-x), treats graph braid groups through configuration spaces and motions of particles on graphs. Such groups are not arbitrary communication graphs.

A classical braid has persistent, non-branching strands. Pairwise crossings do not create or destroy strands. A communication history may instead contain:

- shared-prefix messages reused by multiple later paths;
- one-to-many exposure or broadcast;
- agent entry/exit;
- recursive or nested group interactions;
- directed message provenance and claim ancestry;
- partially ordered events whose linearizations need not be equivalent.

A braid encoding therefore requires explicit conditions and maps:

1. a fixed participant/strand set over the interval;
2. a defined strand assignment and over/under convention;
3. pairwise interaction events, or an explicit higher-arity extension;
4. preservation of shared event identity rather than silent duplication per path;
5. a causal partial order and a stated equivalence for permitted linearizations;
6. a projection from the event graph to the braid representation;
7. a readout map from that representation to the measured outcomes, with the invariants it preserves stated.

If a path family branches, it cannot be represented as one non-branching strand without an explicit split/replication construction. A tangle, cobordism, hypergraph, or multi-strand construction may be appropriate, but it is a different mathematical object. Until the maps and composition conditions are specified, a directed event DAG or interaction hypergraph is the more faithful representation.

## Lean formalization

A bounded necessary-condition lemma was added in [PR #2027](https://github.com/Satobloc/HsH/pull/2027), on a separate assistant-reconstruction branch based on the existing Lean-verification infrastructure.

The new module defines a faithful one-strand encoding as exact preservation of a history node's successor set. It proves that a node with two or more distinct downstream histories cannot satisfy that one-strand encoding. This is a theorem about the explicitly defined encoding, not a no-go theorem for all tangles, cobordisms, graph braid groups, or multi-strand representations.

**Exact-head verification passed:**

- Actions run [#44425845037](https://github.com/Satobloc/HsH/actions/runs/44425845037), job #135230347891.
- Expected and actual PR head both 0680f7e2521934adef742d30cca7e923280bcdf4.
- Lean 4.34.0; Lake 5.0.0-src+293d5d0.
- Full formal-library build passed; the log reports HsHVerification.CognitionTraceTyping built.
- Executable evaluation outputs: 1, 0.
- Axiom report for branching_history_not_single_strand: propext, Quot.sound.
- No sorry or admit in the new module. The workflow does not run tests, lint, or a global axiom audit.

The first attempt failed because a documentation comment was placed before a command; that was corrected and the second exact-head run passed. PR #2027 remains open, draft, and unmerged.

**Limits:** the module does not formalize B_n, graph braid groups, a cabling map, a physical H(s)H braid, or the source paper's raw event log. The source paper's routing-tree description motivates the abstraction; the actual raw event graph was not reconstructed. Lean verifies only the formalized statement, not the soundness of the source-to-model translation.

## SAT/H(s)H source-fidelity note

The SAT archive artifact [ORDERS.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/ORDERS.txt), blob 1f9cec2b7468a87e689239d7b0d00f8e8ad825a5, states that Q=3 is a quark/filament count and that He-3 is Q=9, described as a second-order supercoil. The file is 5,054 characters but has no visible byline, timestamp, or raw-message role metadata. Its Q=9 wording is therefore a repository artifact with unresolved authorship, not an authenticated Nathan Direct statement.

The shared [NATHAN_VERIFIED_WORDS_COMPENDIUM](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/NATHAN_VERIFIED_WORDS_COMPENDIUM.md) records a role-verified user message 357fae86-dd21-41fc-bf92-646bb4c336ac (11 July 2026, 12:34:41Z) supporting a Q=3 hadronic braid construction and He-3 as a holotype, and a separate user message 95993cdf-... distinguishing braid nesting from superhelical nesting. The raw JSON export could not be freshly reparsed in this run because the GitHub connector returned truncated JSON; the role attribution here is inherited from the existing compendium, not independently reauthenticated from the raw export.

Keep Q=3 (source-level filament/quark count), B3 (Artin braid group), S3 (endpoint permutation group), and C3 (cyclic symmetry) distinct. No mapping from the cognition event graph to SAT braids or superhelical nesting is asserted. No SAT-O or Blockwave equation was opened, changed, or corrected.

## Cross-lane quality control

- **Orson P1:** PR #1115 remains open/draft/unmerged and Orson-owned. Its current head 883003fef9ff77e771bce30eac8a112741728fbc has a successful Lean push run #43404565082; that run has no explicit exact-head checkout assertion. The later failure #43614075640 was a separate conversation-JSON workflow, not Lean. No paper, protocol, manuscript, dataset, or gate was changed. P1 remains OVERDUE / NOT READY.
- **Braid PRs #1064 and #1066:** their earlier PR-run builds succeeded, but those logs contain no exact-head checkout assertion. The prior source receipt identifies #1066's checkout as a merge-ref. They are not relabeled exact-head verified.
- **P2 PRs #1858 and #1860, and Review-MIND PRs #1959, #1974, and #1999:** exact-head checkout and Lean builds passed on their recorded heads. Some existing geometry modules report propext, Classical.choice, or Quot.sound; the workflow does not perform a global axiom audit. These build results do not establish physical validity.
- The H935:s3 producer-run crosswalk is a proposal, not an actual prediction run or physical measurement. No measured system, dataset, units, uncertainties, fit, or prediction was introduced in this run.
- Current task graph remains ACTIVE_SEED, 16 declared branches / 18 records, last updated 17 November 2026 19:04:45.809Z. It is stale relative to the current main branch and remains owner-controlled; no graph or priority was changed.
- P0 remains ACTIVE; P1 Orson-owned OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE. FIE review is next due 24 November 2026.

## Mersearch and tooling

Mersearch was not exposed as a connector or local executable. All four canonical request lanes remain requested; their request-scoped RUN_MANIFEST.json and SEARCH_RECEIPT.json paths returned 404. The first failing transition is invocation/trigger, not result parsing. No lane was overwritten, released, or retriggered.

SciSpace was used for discovery and the original arXiv texts were inspected directly. Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, and the existing Lean-verification infrastructure were checked before formalization. Math Hopper is not a Lean proof runner; Whirligig Kernel 0 is not an appropriate general-purpose proof runner. Local Lean/Lake/Elan were absent, so the existing GitHub Actions pipeline was used. Fork enumeration was unavailable through the GitHub connector. No new tool, subscription, paid API call, physical calculation, human study, or independent measurement was made.

## Next work

1. Obtain an authorized Mersearch invocation/trigger and a completed request-scoped manifest/receipt before claiming archive-wide coverage.
2. Keep cognition experiments event-graph-first. Separate model-family diversity from evidence-source diversity, and separate answer revision, textual agreement, evidence uptake, accuracy, calibration, and minority retention.
3. Pre-register claim-specific single-agent baselines under the exact experimental scaffold; preserve the distinction between prospective predictions and post-hoc claim-resolved fits.
4. Review PR #2027 independently before any merge. No BEDROCK or paper-gate promotion is requested.

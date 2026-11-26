# Calder h1114:s4 | RHEON topology, state/measurement boundary, and identifiability audit

**Run key:** `REVROT3-19-20261011:1114:s4`  
**Nominal selection:** Calder, ring index 7; next Hale, index 8.  
**Classification:** source-grounded assistant execution under the supplied Review-MIND charter; not authenticated historical Calder-instance participation.

## Executive result

The RHEON preprint offers a useful statistical-mechanics-inspired description of interacting LLM populations, but its geometry ladder does not isolate graph dimension from coordination number in the regular-lattice subset. For the 1D, 2D, and 3D lattices, coordination number is exactly `k = 2d`. An additive model with separate coefficients for dimension and degree therefore identifies only the combination `β_d + 2β_k`, not the two coefficients separately.

A new draft Lean PR, #2597, formalizes that non-identifiability by reusing the existing Nadir projection/factorization theorem in PR #1189. The new Lean run is still in progress; the new theorem is **not yet build-verified**.

A second finding concerns state and measurement: RHEON's semantic embedding is used in the interaction process, while its factual spin is a judge-derived label on the generated response. The factual label is not an input to the stated update rule. The two axes are useful joint observables, but the paper does not specify a physical two-spin Hamiltonian or establish a physical statistical-mechanics equivalence.

## 1. Historical authority and source custody

The Calder workspace identifies the 2026-09-12 CHECKINS entry as its historical role source. That entry is a worker-authored self-report, not a direct Nathan instruction or a signed specialist charter. No standalone signed Calder charter or authenticated current Calder thread was recovered.

The self-report describes an empirical angle-clustering role: preregistered angular windows, unrelated public measurement corpora, independent-unit discipline, local/shifted nulls, source-level bootstrap, multiple-comparison control, provenance separation, and explicit preservation of negative results. It records a negative/non-significant homogeneous galaxy pilot and canopy pseudo-clustering that collapsed under source/method controls. These are historical self-reports, not independently revalidated results or current theory authority.

The supplied Lane 48 Review-MIND charter governs this run. No SAT/H(s)H theory claim or physical calculation was made.

## 2. Primary source: RHEON

Emanuele Ricco, Elia Onofri, Vincenzo Sammartino, and Roberto Di Pietro, “Consensus and Factual Dynamics in Large Populations of Interacting Language Models,” arXiv:2609.39211 (30 September 2026): https://arxiv.org/abs/2609.39211

The preprint studies a homogeneous population of independent instances of one frozen Qwen3-14B model (4-bit), answering one fixed question per run. It sweeps six prompts, four interaction graphs, twelve population sizes, and six generation temperatures: 432 configurations, five trials each, 2,160 runs, and 4,767,840 model calls.

The graph families are:
- 1D ring: coordination number `k = 2`.
- 2D torus: `k = 4`.
- 3D torus: `k = 6`.
- Mean-field: all-to-all, `k = N_a - 1`.

Each agent's state is its current text response. The semantic spin is a whitened, unit-normalized sentence embedding. The factual spin is a binary judge-derived correctness label. The asynchronous update shows an agent its own previous response and the current responses of its graph neighbours, then asks it to rewrite. The stated update does not feed the factual label back into generation.

The paper reports that consensus generally increases, but correctness is not guaranteed. At the coldest temperature, each denser geometry locks into a shared hallucination on two of five trials; the 1D ring does not lock in. The authors also report that semantic cohesion and accuracy are only weakly associated overall (mean correlation rising from about 0.09 to 0.15, with a maximum around 0.36; half of configurations are not significant).

The authors exclude Prompt 1 from pooled factual analysis because the judge agreed with the reference annotator on only 34% of audited responses (`κ = 0.025`), compared with 98.58% average agreement across annotators on prompts 2–6. This is an important demonstration that an external correctness channel can itself fail, especially on false-premise questions.

## 3. Statistical and geometric QC

### 3.1 Dimension and coordination are confounded

For regular periodic lattices, `k = 2d`. Thus an additive predictor

`y = α + β_d d + β_k k`

reduces on those rows to

`y = α + d(β_d + 2β_k)`.

Only the combined coefficient is identifiable from the regular-lattice rows. The design matrix for the three lattice points is

`X = [[1,1,2], [1,2,4], [1,3,6]]`.

A scripted exact-rank check gives rank 2, not 3, with null direction `(0,-2,1)`. The separate dimension and coordination coefficients cannot be recovered from those rows alone. The mean-field graph is a distinct all-to-all topology, not a fourth spatial dimension, and does not create a clean matched factorial contrast.

This does not invalidate the reported descriptive geometry comparisons. It limits any claim that an effect is caused by spatial dimension independently of degree, graph diameter, clustering, spectral gap, population size, or all-to-all status.

### 3.2 State versus measurement

A faithful minimal representation is:

- `r_i(t)`: agent text response.
- `G = (V,E)`: communication graph.
- `s_i(t) = φ(r_i(t))`: semantic embedding observable.
- `σ_i(t) = ψ(r_i(t), q)`: externally adjudicated factual label.
- `r_i(t+1) ~ K(· | q, r_i(t), {r_j(t): j ∈ N_G(i)}, T)`.

The update kernel receives text responses, not `σ_i`. The factual spin is therefore a post-generation measurement of the response, not a demonstrated dynamical state variable in the update kernel. “Two coupled spins” is defensible as a joint descriptive representation; it should not be read as a specified physical spin-spin interaction.

Likewise:
- The graph is a communication topology, not physical space.
- The sampling temperature is a decoding hyperparameter, not thermodynamic temperature.
- “Glauber-like” describes an asynchronous update analogy; no physical Hamiltonian, partition function, or calibrated thermodynamic temperature is established.

The paper itself presents RHEON as borrowing descriptive apparatus from statistical physics. No physical equivalence is claimed here.

### 3.3 Small trial count

For each denser geometry at the coldest temperature, the paper reports two lock-ins among five trials. Recomputing an exact two-sided 95% Clopper-Pearson interval for `2/5` gives approximately `[0.0527, 0.8534]`. This is a conditional binomial interval based on five trials, not an author-reported interval or a new empirical measurement. It illustrates the uncertainty of the lock-in frequency.

The correlation table reports 150 runs per geometry/size, pooled over five prompts, six temperatures, and five trials. Those are repeated design cells, not 150 independent prompts or model families. The correlations are useful descriptive summaries; generalization should use prompt- and configuration-aware hierarchical or cluster-respecting analysis.

The full Eraclitus corpus and code are described as forthcoming in the paper. A public raw-data release was not independently verified in this run, so no raw-data reproduction is claimed.

## 4. Human-AI group comparison

Lin Chen, Ziyi Liu, Xia Hu, and Yong Li, “AI Agents Reshape Consensus Formation in Human Groups,” arXiv:2609.02122: https://arxiv.org/abs/2609.02122

This is a genuine human-AI group-interaction study, but its outcome is emergent linguistic convention in a tangram description game, not factual accuracy. It uses random pairings over 40 rounds, a fully mixed interaction network, one model family at two capability levels, and a single abstract visual referent.

The supplementary allocation reports 127 humans across eight conditions. Each session contains 24 total participants (humans plus agents); the published counts therefore imply one 24-member session per condition, with no reported independent session replication. Error bars are described as participant-level within-session SEM. The group/session is the treatment unit for agent proportion, so these data should be treated as a mechanism demonstration rather than a replicated estimate of population-level group-composition effects.

This comparison reinforces the need to separate:
- semantic convergence,
- factual correctness,
- who authored or shaped the convention,
- perceived legitimacy,
- actual adoption and incorporation.

## 5. Lean formalization

Draft PR: https://github.com/Satobloc/HsH/pull/2597  
Base dependency: PR #1189, `research/nadir-affine-translation-quotient-20261101t0324z`  
New module: `FORMAL_VERIFICATION/HsHVerification/CalderLatticeIdentifiability.lean`  
Head: `5d31534af5ac4154a51efb0f440577f4583f18c5`

The module defines the identified combination `β_d + 2β_k`, proves the regular-lattice predictor factorization, and uses the existing Nadir fiber-mismatch theorem to show that neither coefficient separately descends through that combination.

Lean Actions run #45800334064 is **IN_PROGRESS**. Source checkout identity passed; Lake dependency-manifest generation was still running at last inspection. The new theorem is therefore `SUBMITTED_NOT_VERIFIED`, not a completed proof result. PR #2597 is draft, open, unmerged, and stacked on #1189. The separate Vercel deployment-rate-limit failure is not a Lean failure.

Existing related builds were independently checked:
- Nadir PR #1189 exact-head run #45616238757: PASS, Lean 4.34.0; global axiom audit and additional tests/lint/leanchecker/nanoda were skipped.
- Loom PR #2052 exact-head run #44447977440: PASS, Lean 4.34.0; global axiom audit and additional checks were skipped.
- Sable PR #2446 exact-head run #45797216596: PASS, Lean 4.34.0; global axiom audit and additional checks were skipped.

These builds verify their formalized statements only. They do not verify RHEON's empirical results, model assumptions, source labels, or any physical interpretation.

## 6. Disconfirming follow-up experiment

A useful next study would separate topology, degree, peer exposure, and agent composition rather than bundling them:

1. Obtain blind independent baseline responses before any peer exposure.
2. Randomize graph topology while matching population size and degree where possible; use degree-preserving rewiring and report degree, diameter, clustering, and spectral gap.
3. Randomize peer-message exposure after baseline, with sham/no-exposure controls.
4. Randomize shared-source versus independently sourced evidence while matching source quality.
5. Use multiple independent groups per condition; randomize at group/session level and analyze groups as the experimental unit.
6. Include multiple model families and human participants, with consent and privacy safeguards.
7. Use independent, blinded human adjudication plus a separate audit channel for correctness.
8. Measure semantic alignment, factual accuracy, confidence calibration, minority-evidence retention, uptake, influence, and incorporation separately.

Disconfirmation criteria:
- If topology effects disappear under degree matching, do not attribute them to dimension.
- If peer exposure does not change outcomes relative to blind baselines, do not infer contagion.
- If shared-source assignment does not increase dependence, do not infer a source-sharing effect.
- If semantic consensus rises without a corresponding independently adjudicated accuracy gain, agreement is not a correctness proxy.
- If effects do not replicate across independent groups, do not generalize the group-level result.

No human sessions or model trials were run in this relay. This is a design proposal, not an empirical result.

## 7. Operational and continuity status

- HsH main at latest read: `1949611756d6d3f4c497ebea5845813734b78d75`.
- SAT archive and HSH_RESOURCES front doors and onboarding were read. HSH_RESOURCES remains a private reference repository; no private payload was opened.
- All four canonical Mersearch request lanes remain occupied. No request was overwritten or retriggered. Direct repository search is not full three-repository Mersearch coverage.
- PWH: strict ledger 10 completed work products against the five-product review trigger; Tern's deep review remains due. Tern retains queue/task-graph authority.
- P0: latest full discovery parse recorded 11,067 workspace records, all with generic browse-reader routes and missing `presentation_state`. Freshness passed at the 10:16:43Z source cut; after Loom h1113:s3's publication and receipt, a postwrite refresh is pending. Presentation safety remains FAIL; live Paper A/B route acceptance is NOT_OBSERVED; deployment is NOT_VERIFIED. Tern retains release/standdown authority; Meridian retains implementation; Mercer retains independent A/B QA.
- WH-02: last verified strict navigation audit failed; last verified counts remain 1,040 dated/correct, 2 undatable, 877 skipped non-conversation/bad-JSON records, zero unresolved collisions. Calder retains implementation authority.
- Orson P1 remains overdue, NOT READY, frozen, and Orson-owned. P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- FIE was last rereviewed November 24; next due December 8. The unrelated-source break was completed November 26; no duplicate break was needed.
- No physical calculation, measured-system fit, prediction, CODATA comparison, SAT-O/Blockwave equation modification, manuscript advancement, or BEDROCK theory promotion occurred.
- No task, ID, schedule, phase, cadence, signet, or conversation-name change; no sixth task.

## Tocktick

**Focus:** separate communication topology, model state, and measurement maps.  
**Immediate action:** obtain the Lean run result for #2597 and preserve its dependency on #1189.  
**Stop:** no physical equivalence, no theory promotion, no P0 route release, no PWH adjudication.  
**Return:** PR #2597 / run #45800334064; RHEON arXiv:2609.39211; human-AI group study arXiv:2609.02122; HsH main `1949611756d6d3f4c497ebea5845813734b78d75`.

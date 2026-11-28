# Ravel h1158:s3 | Independent spatial-plus-time dimension gate

**Disposition:** SOURCE-GROUNDED REVIVAL COMPLETED / CONDITIONAL DIMENSION THEOREM ADDED TO EXISTING RAVEL PR / EXACT-HEAD LEAN BUILD PENDING / NO PHYSICAL CALCULATION / P0 HOLD PRESERVED.

## 1. Selection and continuity

The nominal 2026-11-28 06:36 UTC slot gives:

\[
h=1158,\qquad seq=5h+3=5793,\qquad 5793\bmod19=17.
\]

- Selected routing label: **Ravel**, index 17.
- Immediate next ring label: **Orson Vay**, index 18.
- Run key: `REVROT3-19-20261011:1158:s3`.

The current automation run has no authenticated run-level ChatGPT thread reference. A bounded personal-context search found the latest usable Ravel-associated conversation as an archived repository export, not a live continuation target. The historical `Ravel [H(s)H] Syncmathcek` raw export is catalogued as a 694-message conversation, but the GitHub connector returned an empty content body for the 12.4 MB raw JSON. I therefore did not claim a fresh raw-message read or authenticated Ravel participation.

Historical role evidence was read from `WORKSPACES/COMMON/RAVEL_CHECKIN_2026-09-16.md`, Ravel's `STATE.md` and `CONTINUITY.md`, the h1139 receipt, h1151 source addendum, and the existing Ravel formalization modules. These support a provisional primary-co-theorist remit emphasizing finite-core/Kerr geometry, source fidelity, conceptual cohesion, drift detection, methodological risk and public accuracy. No standalone signed specialist charter was found.

Ravel's local pointers are stale: `STATE.md` h1059, `CONTINUITY.md` h1082 and the existing inbox last updated around h1063. No Ravel-local state, continuity or inbox file was rewritten under the active P0 interlock.

The prestart optional Mercer h1158:s2 packet was read. It supplied P0 currentness only; it did not assign work or change this geometry lane.

## 2. Source distinction

The existing Ravel source anchor in `RavelKerrSectionSweepRankGate.lean` identifies Nathan Direct message `c0520975-02a0-408f-a250-364b88ab7b30` (2026-11-08T20:18:10.172Z). The existing source crosswalk records a fourth spatial direction \(w\), with proper time described as distinct or possibly emergent along \(w\). It does not choose whether proper time is an independent coordinate factor.

The h1151 Ravel source addendum preserves the same distinction. The primary operational guideline (2026-11-08) requires the exact types and relations of worldtube and timesheet to be specified rather than inferred from their names. It also treats the current Minkowski geometric grammar as revisable and requires real data for physical calculations.

**Source limitation:** the direct-message locator and interpretation were recovered from the existing formal module and h1151 source audit; the original large raw export could not be freshly read through the current connector. This report does not upgrade the source interpretation to a newly authenticated direct quote.

## 3. Substantive improvement: independent-time dimension gate

The existing formalization already establishes:

- a 3D section swept by a 1D parameter can have a 4D product domain;
- a 4D spatial carrier crossed with a 1D time line adds one dimension;
- a history projection can be non-injective when the same spatial point persists at different times.

The missing step was a differential/rank consequence for the independent 4D-spatial-plus-time branch.

Let \(V_{\mathrm{sp}}\) be a four-dimensional spatial tangent carrier, let \(\mathbb R_t\) be an independent one-dimensional parameter factor, and let \(V_{\mathrm{target}}\) be any four-dimensional target tangent space. No metric signature is specified.

For a candidate linearization

\[
dF:V_{\mathrm{sp}}\times\mathbb R_t\longrightarrow V_{\mathrm{target}},
\]

the product domain has dimension five:

\[
\dim(V_{\mathrm{sp}}\times\mathbb R_t)=4+1=5.
\]

Rank-nullity gives:

\[
\dim\ker(dF)=5-\operatorname{rank}(dF).
\]

Since the target dimension is four:

\[
\boxed{\dim\ker(dF)\geq1.}
\]

Consequences:

1. No injective differential, hence no immersion, exists from this five-dimensional product into a four-dimensional target.
2. If the map has full target rank four, exactly one local direction is collapsed.
3. If its rank is at most three, at least two local directions are collapsed.

This is the minimum explicit projection constraint missing from the independent-time interpretation. It does **not** identify the kernel direction as time; it may mix spatial and temporal directions. A global quotient additionally requires constant-rank and integrability conditions, which are not proved here.

### Conditional representation branches

| Branch | Domain dimension | Consequence |
|---|---:|---|
| 3D spatial section × 1D evolution parameter | 4 | A lossless 4D sweep is dimensionally possible; this matches the existing Ravel sweep gate |
| 4D spatial carrier × independent 1D proper-time parameter | 5 | No injective map into 4D; at least one direction must be identified or discarded |
| 4D spatial carrier with time emergent/reparameterized along an existing coordinate | 4 | Possible only after an explicit \(t=f(w,\ldots)\) or equivalent map is specified |
| 4D spatial carrier × time into a 5D target | 5 | No dimension loss is required, but the ambient model is 5D |
| Standard 3+1 spacetime worldtube | 4 | A 3D spatial body swept through one temporal parameter; not the same type as 4D spatial space plus time |

The source leaves the independent-versus-emergent choice unresolved. This theorem is conditional bookkeeping, not a choice of H(s)H ontology or a physical prediction.

## 4. Lean formalization

Extended the existing Ravel formalization in:

`FORMAL_VERIFICATION/HsHVerification/RavelCarrierSliceReconstruction.lean`

New structure: `IndependentSpatialTimeLinearization`.

New theorems:

- `domain_dimension`
- `rank_add_nullity`
- `kernel_dimension_at_least_one`
- `no_injective_four_dimensional_target`
- `full_rank_forces_exactly_one_kernel_dimension`
- `rank_at_most_three_forces_two_kernel_dimensions`

This reuses the existing `product_with_time_line_adds_one_dimension` theorem and the current PR's existing Mathlib infrastructure. No new module, tool, dependency, fork or automation was created.

First exact-head attempt `8512153a874d1f9a2c4c690d619808883912aff3` failed in Lean build [#46118636799](https://github.com/Satobloc/HsH/actions/runs/46118636799). The error was a Lean structure-parameter/scoping mistake (`S.spatialDimension_eq` was not resolved; subsequent field-notation goals remained unsolved), not a counterexample to the mathematical claim. The failed run and its log are preserved.

Corrected the structure to declare `SpatialCarrier` and `TargetTangent` explicitly and used the fully qualified existing product-dimension theorem. Corrected exact head: `fa8959e2c82657cd8f07fdfd41840a2619f5ecd5`; module blob: `ae08e0408266d7c5a4047b3ba09a1641520c7d83`.

[Existing Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133) remains OPEN / DRAFT / UNMERGED. Its base is `infra/lean4-verification-20261023`, not main; no rebase, merge or promotion was attempted.

Corrected exact-head Lean run [#46119013419](https://github.com/Satobloc/HsH/actions/runs/46119013419) was IN_PROGRESS at last readback, with checkout/dependency preparation underway and formal-library compile not yet reached. Therefore no theorem compile pass is claimed yet. The separate conversation-JSON workflows #46118633046 and #46119008886 failed with zero jobs; neither is evidence of a Lean theorem failure.

No `sorry`, `admit`, `axiom` or `#eval` appears in the newly added section. The final theorem-specific axiom report remains pending the corrected Lean build. Existing repository-wide lint, nanoda and global axiom-audit limits must be reported separately.

## 5. What this does and does not establish

**Established mathematically if the formal build passes:** the dimension/rank-nullity consequences for the stated finite-dimensional linear map.

**Not established:**

- that Nathan Direct intended an independent time factor;
- that \(w\) is identified with time;
- that a physical 5D history exists;
- that a 4D quotient is globally smooth;
- which direction a projection discards;
- a metric signature, proper-time normalization or causal structure;
- any Kerr/worldtube physical observable, fit, prediction, uncertainty or holdout.

No measured physical system or dataset was admitted. No physical calculation, numerical fixture, fit, prediction or falsification threshold was produced. This is a formal representation gate, not Factory Floor admission and not a P2 result.

## 6. Source/tool and governance checks

- Mersearch was checked first. All four request lanes remain occupied/requested; the current geometry-source request has no terminal result. No new query, retry, overwrite or lane release occurred.
- The HSH_RESOURCES private payload was not opened.
- Math Hopper issue #578 remains open; Mercer PR #991 remains open/draft. Its smoke CI and full three-repository scan are still not verified. No replacement hopper was built.
- Whirligig Kernel 0 remains sandbox-only and was not changed.
- SciSpace was checked in the available tool directory; no callable SciSpace action schema surfaced in this execution, so no literature query or paid use occurred.
- The Ravel PR head and base both remain in `Satobloc/HsH`; no fork was used.
- No local repository checkout or dedicated project write route was available. The existing GitHub connector was used as the bounded fallback for the existing Ravel PR branch; public reporting will use the existing issue publisher.
- No SAT-O or Blockwave equation was retrieved, corrected or modified.

P0 remains FAIL/HOLD: source-level presentation safety FAIL, Paper A/B live routes NOT_OBSERVED, deployment NOT_VERIFIED and release NOT_AUTHORIZED. The latest Mercer h1158:s2 P0 packet and issue #1747 updates were read; no P0 action was taken.

P1 cognition remains overdue/frozen and Orson-owned. P2 November 30 remains HOLD, with no selected measured system and seven blockers. P3 December 14 remains incomplete. FIE rereview is due December 8; the last recorded review was November 24.

PWH remains Tern-owned. Its deep review was completed at h1157; this run does not meet the next five-activation trigger. The canonical queue cursor remains h1081:s3 and the task graph remains 18 records against 16 declared branches. No queue or graph mutation occurred.

The latest unrelated-source break was completed by Morrow h1157:s4 at `fun break - lx.txt`, lines 2361–2400; shared return cursor is line 2401. An incidental read of lines 1841–1880 in this run used a stale cursor and is not counted or used to move the shared cursor. FIE was not due.

## 7. Successor and scheduler

The immediate next ring label is **Orson Vay**. The :48 Review-MIND task has already started its h1158 run, with no authenticated run-level chat reference. No geometry handoff was sent into Orson's protected cognition remit; no assignment, response obligation, ownership transfer, direct-thread delivery, consumption or acknowledgment is claimed.

The existing :36 Worldtube automation remains enabled with task ID `6a9f52b69ec08191b0a2ba24a074f781` and its original hourly America/New_York :36 schedule. No task ID, schedule, phase, prompt, enabled state, signet or conversation name was changed. No sixth task was created.

**Return cursor:** resolve whether the source intends an independent proper-time factor or an emergent/reparameterized relation to \(w\). If independent, specify the required 5D ambient or the exact 1D kernel/quotient map; if emergent, supply the source-authorized relation and its regularity conditions. Do not choose a branch from analogy.

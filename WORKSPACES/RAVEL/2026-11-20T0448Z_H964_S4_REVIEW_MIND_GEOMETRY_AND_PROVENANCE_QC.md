# Ravel h964:s4 | Review-MIND geometry and provenance QC

**Run key:** `REVROT3-19-20261011:964:s4`  
**Nominal UTC occurrence:** 2026-11-20 04:48Z  
**Selected ring label:** Ravel (index 17)  
**Immediate ring successor:** Orson Vay (index 18)  
**Next scheduled :00 selection:** Morrow (index 13), because the scheduled stride advances five ring positions.  
**Identity status:** assistant-level run; the ring label is not an authenticated ChatGPT instance or thread.

## 1. Disposition

- **Geometry:** same-slice chord is not the global inter-helix centerline clearance for the equal-radius/equal-pitch phase-offset family when `N >= 3`.
- **Lean:** a conditional global-infimum bound is formalized in draft PR #2162. Code head `f45b1bb` built successfully; later comment-only head `6e07ee5` passed exact PR-head checkout but its dependency-manifest step remained in progress at the final read.
- **Review-MIND:** three P0 reports share the same principal code/PR roots. Their agreement is repeated source-grounded analysis, not independent cross-agent consensus.
- **P0:** ACTIVE. The current discovery snapshot still assigns raw reader targets to every workspace record. No live route observation was made.
- **Campaign:** Orson P1 remains protected and Orson-owned; P2 HOLD; P3 INCOMPLETE.
- **Automation:** the existing four-task configuration was not changed; no sixth task.

## 2. Source and authority boundary

The historical Ravel raw export is `Ravel Syncmathcek`, blob `17cfe3feb830f70009557d063482b35adba0834b`.

Nathan Direct messages `a03e61e8-929b-4758-8bba-71af0766b9fa` (2026-09-06T08:14:51Z) and `af313567-c917-4188-86b0-caea0f3398e2` (2026-09-06T08:21:54Z) ask for first-order helix metrics and explicitly raise multiple first-order helices superimposed / a non-round barrel.

Assistant message `ac8e4285-a104-4621-ad26-e4f2fcce0bce` (2026-09-06T20:56:20Z) introduces equal-radius, equal-pitch, phase-offset co-helices and the same-parameter chord formula `d_N = 2 R sin(pi/N)`. That formula is assistant reconstruction, not Nathan Direct. The parameterization below is also an assistant reconstruction.

Ravel's historical remit is supported by the September 16 check-in and current continuity material: source-grounded reconstruction, geometric and mathematical audits, measurement triangulation, and equation/theory-state provenance. No standalone signed specialist charter or authenticated current Ravel thread was recovered.

The prior [Ravel h961:s0 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-h961-s0-helical-packing-scope-20261120t0100z-001.md) and existing [single-helix reach script](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/RAVEL/CODE/ravel_helix_tube_reach_gate_20261013.py) address adjacent-turn self-contact of one helix. The script does not compute clearance between distinct phase-offset helices. It was read but not modified.

The existing Mersearch result `2026-10-08-ravel-transported-helical-tube-001` contains 451 hits / 3,988 files. A bounded scan of its result text found no exact `d_N`, co-helix, phase-offset, or same-slice-clearance match; this is not an exhaustive search of all indexed material. No Mersearch tool action was callable. The active `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` belongs to Calder's angle-geometry request (`status=requested`, lane 1); it was not overwritten. No new request was created.

The SAT archive's `RMS Spacetime Filaments.txt` was read as historical context only. HSH_RESOURCES' root orientation was read; no restricted prior-art payload was opened. No SAT-O or Blockwave original was changed.

## 3. Assistant-reconstructed phase-offset geometry

Take equal-radius, equal-pitch helices around a common axis:

\[
H_j(t)=(R\cos(t+\phi_j),\;R\sin(t+\phi_j),\;bt),
\qquad \phi_j=\frac{2\pi j}{N}.
\]

Here `b` is axial rise per radian, `P = 2 pi b` is pitch per full turn, and

\[
q=\frac{b}{R}=\frac{P}{2\pi R},\qquad
\Delta_\phi=\frac{2\pi}{N},\qquad u=t-s.
\]

For adjacent phase-offset helices, the exact normalized squared centerline distance is

\[
F_q(u;\Delta_\phi)
=\frac{D^2}{R^2}
=2\bigl(1-\cos(u-\Delta_\phi)\bigr)+q^2u^2.
\]

The same-parameter slice `u = 0` gives the transverse chord

\[
d_{\rm chord}=2R\sin\left(\frac{\Delta_\phi}{2}\right)
=2R\sin\left(\frac{\pi}{N}\right).
\]

But the global inter-helix centerline clearance is

\[
d_N(q)=R\sqrt{\inf_{u\in\mathbb R}F_q(u;\Delta_\phi)}.
\]

### 3.1 Analytic result

For `N >= 3`, `0 < Delta_phi < pi` and

\[
F'_q(0;\Delta_\phi)=-2\sin(\Delta_\phi)<0.
\]

Therefore `u = 0` is not even a local minimum: a sufficiently small positive relative-parameter shift gives a smaller separation than the same-parameter chord. For `q > 0`, the quadratic term makes `F_q` coercive, so a global minimum exists.

The stationary equation is

\[
q^2u_*=\sin(\Delta_\phi-u_*).
\]

On `0 < u < Delta_phi`, define `g(u)=q^2u-sin(Delta_phi-u)`. Then `g(0)<0`, `g(Delta_phi)>0`, and `g''(u)=sin(Delta_phi-u)>0`. The analytic argument gives one crossing and one interior minimum. The global minimizer can be restricted to `[0, Delta_phi]`: negative representatives are beaten by their positive counterparts (modulo `2 pi`), while `u > Delta_phi` has axial term alone greater than the `u=Delta_phi` candidate.

For `N = 2`, `Delta_phi = pi` and the derivative at zero vanishes. The special case is:
- `q >= 1`: the global minimum is the same-slice value `2R`;
- `0 < q < 1`: `u=0` is a local maximum and the minimum is interior, solving `q^2 u = sin(u)`, so the clearance is below `2R`.

This all-pitch derivative / uniqueness argument is an assistant analytic derivation, **not yet Lean-formalized**.

### 3.2 Small-gap asymptotic

For `Delta_phi -> 0`,

\[
F_q(u;\Delta_\phi)
=(u-\Delta_\phi)^2+q^2u^2+O(\Delta_\phi^4),
\]

so

\[
u_*\approx\frac{\Delta_\phi}{1+q^2},
\qquad
\frac{d_N(q)}{R}\approx
\frac{q\,\Delta_\phi}{\sqrt{1+q^2}}.
\]

This is an asymptotic, not an exact finite-gap formula.

### 3.3 Scripted dimensionless check

A Python root solve of `q^2 u = sin(Delta_phi-u)` for `N >= 3` and `q^2 u = sin(u)` for the `N=2, q<1` branch reproduced the stationary equation with residuals at floating-point roundoff.

| `q` | `N` | `u*` | global `d_N/R` | same-slice chord / `R` |
|---:|---:|---:|---:|---:|
| 0.5 | 2 | 2.474577 | 1.399836 | 2.000000 |
| 0.5 | 3 | 1.665061 | 0.935212 | 1.732051 |
| 1.0 | 2 | 0 | 2.000000 | 2.000000 |
| 1.0 | 3 | 0.921771 | 1.440206 | 1.732051 |
| 2.0 | 2 | 0 | 2.000000 | 2.000000 |
| 2.0 | 3 | 0.240015 | 1.670337 | 1.732051 |

These are illustrative dimensionless parameter values, not measurements, fitted parameters, or physical fixtures.

The earlier `sqrt(3) R < d_f <= 2R` comparison uses same-slice chords, not global centerline clearances. For a two-versus-three occupancy test, the relevant candidates are `d_3(q) < d_f <= d_2(q)`, with `d_N(q)` obtained from the global minimization. The ordering and chosen-q interval must be checked for the intended parameter regime before use. Finite-core tube disjointness additionally requires local reach / curvature control and an explicit cross-section model. No finite-core theorem is claimed.

For a non-round cross-section, replace the circular transverse map with an explicit periodic curve `C(theta)` and recompute the pair-distance function. The present circular model does not settle the Nathan Direct non-round-barrel case.

## 4. Lean 4 / Mathlib formalization

Draft [PR #2162](https://github.com/Satobloc/HsH/pull/2162) adds `FORMAL_VERIFICATION/HsHVerification/RavelPhaseOffsetHelixClearance.lean` on the existing `infra/lean4-verification-20261023` branch. It does not modify main or the existing Ravel self-contact script.

The module formalizes:
- the normalized pair-distance function;
- same-slice chord and axial-shift candidate identities;
- nonnegativity of the distance set and its global infimum;
- the conditional theorem that the global squared-distance infimum is strictly below the same-slice chord when

\[
q^2\Delta_\phi^2<2(1-\cos\Delta_\phi).
\]

The condition is sufficient, not necessary. For example, the condition fails at `q=1, N=3`, even though the Python root solve gives a global clearance below the same-slice chord. That is an explicit gap between the current Lean theorem and the stronger analytic derivative result.

**Earlier code head:** `f45b1bbdff2ec4ddae8521b9d9ca7c2ebd0fd394` passed exact-head checkout and `lake build` in Actions run [#44677347685](https://github.com/Satobloc/HsH/actions/runs/44677347685), job `136092237470`: Lean 4.34.0 / Lake 5.0.0, 8,948 build jobs. The five `#print axioms` outputs list `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appeared in the build log. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped.

A subsequent comment-only pitch-convention clarification moved the branch to `6e07ee588bc7a3ff0b9344a36e86f76322eefca3`. At the final read, the new exact-head checkout assertion had passed, but Lake dependency-manifest generation was still in progress; compilation of that newer head is therefore **PENDING**, not verified.

Lean checks only the formalized conditional statements. It does not validate the source translation, the all-pitch derivative argument, physical premises, or a finite-core reach claim.

## 5. Review-MIND: source lineage and apparent consensus

Three recent assistant-level reports reviewed the same P0 reader-gate work:

- Tern h963:s4, issue [#2158](https://github.com/Satobloc/HsH/issues/2158);
- Meridian h964:s2, issue [#2160](https://github.com/Satobloc/HsH/issues/2160);
- Mercer h964:s3, issue [#2161](https://github.com/Satobloc/HsH/issues/2161).

A bounded extraction of exact source-file and issue/PR references found four shared roots in each pair: `tools/site_discovery.py`, `tests/test_site_discovery.py`, `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md`, and PR #2009.

| Pair | Shared extracted roots | Jaccard on extracted path/reference set |
|---|---:|---:|
| Tern / Meridian | 4 | 0.500 |
| Tern / Mercer | 4 | 0.364 |
| Meridian / Mercer | 4 | 0.444 |

This is a lower-bound, incomplete reference-set calculation, not an independence score or probability. The reports also share the repository, common policy, user prompt, and P0 issue context. None has an authenticated distinct worker thread. Different ring labels and report files therefore do not establish independent agent instances or independent corroboration.

The existing [CognitionSourceOverlap.lean](https://github.com/Satobloc/HsH/blob/infra/lean4-verification-20261023/FORMAL_VERIFICATION/HsHVerification/CognitionSourceOverlap.lean) module on the infra branch formalizes shared-source relations under bijective relabeling and shows how non-injective source-ID normalization can create false overlap. It does not prove cognitive dependence, agent identity, or independent analysis. Its exact-head infra build was successful at `368f9af8` (run #43948452979; 8,947 build jobs); tests, lint, and global axiom audit were skipped.

A useful future provenance record should keep these dimensions separate:
1. report label and immutable scheduler run ID;
2. authenticated conversation/thread reference, if available;
3. model family/version and prompt hash, if actually exposed;
4. primary source IDs and source-acquisition event IDs;
5. analysis execution identity;
6. independent human-review identity and consent status.

Source overlap, acquisition independence, analysis independence, model independence, and human-review independence are different variables. Do not collapse them into a single `independent=true` flag.

### 5.1 Disconfirming experiment proposal (not executed)

A bounded future study could randomize reports into:
- shared-source-packet conditions;
- independently acquired source conditions;
- blinded attribution conditions with one planted citation discrepancy.

Measure claim-level citation accuracy, error correlation, source overlap, correction propagation, and novelty. Preserve run/thread/model metadata only when actually available. Use blind human review with consent if human participants are involved. This proposal is not Orson's P1 result and does not transfer P1 ownership. No human-subject or multi-agent experiment was conducted in this run.

## 6. Cross-lane P0 QC

Mercer's h964:s3 [PairReleaseWitness proposal](https://github.com/Satobloc/HsH/issues/2161) is a useful pair-level composition of two route witnesses plus common deployment/manifest identity and currentness attestation. It remains a proposal, not a deployed gate or route observation.

One temporal condition should remain explicit before `pairObservedPass` is instantiable: both route captures must be tied to one immutable provider snapshot, or the currentness attestation must cover both capture times under a site-owner-defined maximum observation skew. Matching deployment ID and manifest digest alone, with only point-in-time currentness, does not establish that both route captures were current at a common snapshot. The report correctly leaves the skew policy to the site owner; no value is invented here. No gate was changed.

At current main `e87e970b0e6d55e0b1ec92d035399f2b6d692925`, the [automatic discovery snapshot](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/generated/discovery.json) was updated `2026-11-20T05:00:29Z` and records source HsH commit `013845bd01698d8c6843426986f7ac7b2692230c` and SAT archive commit `fec8700f9b1a2f59612e5450161fd0875b6b1308`.

Snapshot counts:
- 16,443 documents;
- 9,511 `WORKSPACES/` records;
- 9,511 workspace records with raw reader targets;
- 9,280 workspace excerpts;
- 48-item docket;
- 6 reported errors.

Specific records:
- Paper A `DRAFT_R1.tex`: raw reader target, no excerpt;
- Paper B `DRAFT_R1.md`: raw reader target and excerpt;
- Mercer h964:s3 report: raw reader target and excerpt;
- Ravel INBOX: raw reader target, no excerpt.

Neither Paper A nor Paper B appears in the 48-item docket. This is a full-catalog source/presentation mismatch, not evidence of a live route exposure. No browser route was probed.

[PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains open/draft/unmerged, head `ee582b8de93f88f49445c211892529c40b47fded`, 3 commits ahead and 1,630 behind current main, merge base `d47be7cfacfa182aedaad17a9e0841eb80fdfddb`. The three PR-touched paths remain unchanged on main since that merge base. Mergeability metadata varied between peeks and is advisory; no exact-head Actions run was found for the PR head. No rebase, merge, deployment, route probe, or P0 gate change was attempted. Tern retains release authority. **P0 remains ACTIVE / LIVE_ROUTE_NOT_OBSERVED.**

## 7. Mersearch, campaign, and safeguards

- No callable Mersearch action was available. The active Common request belongs to Calder's angle-geometry request and remains `requested`; it was not overwritten or retriggered. Existing Ravel Mersearch results were reused as a bounded check; no new request was created.
- HSH_RESOURCES root orientation only; no restricted prior-art payload accessed.
- An unrelated SAT-archive break was completed by reading the active branch of `Kodacolor VR film info — raw.json` (blob `0ef46172cdbe6f88e2ccb022b3d66e191bddb7fd`): 30 active nodes, 10 visible user/assistant messages. Return cursor: active-branch `current_node` `dc08443e-e4be-4930-92af-7898ed9a76e2` (30 active nodes, 10 visible user/assistant messages). The exchange's initial format misidentification and subsequent user correction were read as an archive break, not reused as technical evidence.
- FIE last review November 10; next review November 24. Not stale.
- P0 ACTIVE.
- Orson P1: OVERDUE / NOT READY / ORSON-OWNED. No Orson research files were modified and no P1 result is claimed.
- P2 November 30: HOLD.
- P3 December 14: INCOMPLETE.
- No physical dataset, units/uncertainties analysis, fit, prediction, or independent measurement was used for the helix model. It is mathematical geometry only.
- No H(s)H theory promotion, SAT-O/Blockwave equation change, new tooling dependency, paid service, or automation change.

## 8. Optional packet and scheduler integrity

Mercer's optional P0 packet to Ravel was read. The :48 task's per-ID peek showed the current run started at `2026-11-20T04:43:55.379282Z` for the `04:48Z` occurrence, with `chat_ref=null`. The packet commit `6116367a2b297f131cf3bd48093553e347700ff5` was timestamped `04:50:22Z`, after this run began. Its status for this run is therefore `POSTSTART_OPTIONAL_CONTEXT_ONLY`. The Ravel INBOX records this timing correction. This is assistant-level repository readback, not authenticated Ravel-thread delivery, consumption, or acknowledgment. No assignment, response obligation, review request, or ownership transfer was accepted.

The :00 scheduled selection is Morrow, not Orson; the immediate ring successor is Orson. No successor handoff was created.

The existing :48 task remains enabled with its exact saved ID, hourly schedule, prompt, and phase unchanged. The four enabled relay tasks remain; the :12 task remains disabled. No sixth task, task mutation, signet, or conversation rename.

At the last read, this :48 execution remained `IN_PROGRESS`, with no completion timestamp and `chat_ref=null`. Research and publication work are complete only when the publisher receipt below is independently verified; terminal automation completion is not claimed.

## 9. Epistemic status and next cursor

- **Historical source:** direct Nathan messages ask about multiple first-order helices and a non-round barrel.
- **Historical assistant reconstruction:** equal-radius/equal-pitch phase-offset co-helix family and same-slice chord formula.
- **Current assistant analytic derivation:** global centerline-distance function, stationary equation, N=2/N>=3 distinction, and dimensionless numerical sweep.
- **Lean formalization:** conditional infimum bound only; exact-head build pending for the comment-only latest head.
- **Proposal:** extend to non-round cross-section curves and finite-core tube separation only after explicit cross-section, normal-bundle, and local-reach maps are specified.
- **Independent physical measurement:** none.
- **H(s)H physical equivalence:** none asserted.

Next geometry cursor: formalize the all-finite-pitch derivative and minimizer-location/uniqueness result; then generalize the transverse circle to a specified periodic cross-section curve. Do not promote the two-versus-three occupancy interval until `d_2(q) > d_3(q)` is established for the chosen model and local tube reach is included.

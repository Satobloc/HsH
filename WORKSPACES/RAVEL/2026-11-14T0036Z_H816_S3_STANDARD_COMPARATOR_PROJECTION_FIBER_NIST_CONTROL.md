# Ravel h816:s3 | Standard-comparator upgrade, projection-fiber observability, and NIST finite-support control

**Run key:** `REVROT3-19-20261011:816:s3`  
**Nominal slot:** 2026-11-14T00:36:00Z  
**HsH `main` snapshot at preflight:** `4b2a3d40c87085e670a6e7803c079edf61869c85`  
**HsH `main` snapshot before Ravel continuity writes:** `3d7712a3e85b0f374eac02f08bfc9097f2c89d9d` (concurrent Orson h816:s4 amendment to Sable INBOX; no Ravel-path overlap)  
**Selected worker:** Ravel (ring index 17)  
**Next worker:** Orson Vay (ring index 18)  
**Disposition:** `SOURCE-GROUNDED REVIVAL / METHOD ARCHITECTURE IMPROVED / STANDARD-PHYSICS CONTROL RECOMPUTED / P2 HOLD / NO H(s)H PREDICTION / NO THEORY PROMOTION`

## 1. Substantive result

Operationalized the existing projection-fiber readout criterion with a real standard-physics measurement-model control: the NIST/BIPM torsion-balance redetermination of \(G\).

The key change is to strengthen the H(s)H standard comparator. A point-mass approximation is a negative control for information loss; it is not an adequate high-precision standard baseline when the experiment's measured finite mass geometry is available. Standard Newtonian gravity already requires the finite-support geometry in this apparatus. Therefore finite support or thickness alone is not a distinguishing H(s)H prediction.

A candidate H(s)H feature becomes observationally necessary only if a source-defined readout varies within the projection fibres of the reduced representation and survives common calibration, nuisance treatment, covariance propagation and an independent holdout. Such a failure establishes that the reduced representation is insufficient for that readout; it does not uniquely identify thickness, twist, contact or medium as the missing structure.

This is an extension of existing work, not a duplicate of Kestrel's h816:s0 cross-boundary map (#1714), Ravel's feature-isolation matrix (#1492), or the earlier label-preserving pullback (#1194).

## 2. Rotation, source authority and revival

\[
h=816,\quad seq=5(816)+3=4083,\quad 4083\bmod19=17.
\]

Ravel is selected; Orson Vay is next.

### Historical specialist source

Mersearch was not callable in this runtime. The four canonical Mersearch request lanes remain occupied; none was overwritten or retriggered. The original Library export was inspected directly as a bounded source fallback:

- Original Library file: `🎼 Ravel [H(s)H] Syncmathcek — raw (2).json`
- Conversation ID: `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`
- File size: 12,408,770 bytes
- SHA-256: `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`
- 2,394 mapping nodes; 2,044 nodes on the exported current ancestry; 145 user-role messages on that ancestry.

Direct Nathan messages establish:
- `638d13ba-1541-483d-853f-3b6d04b9b1b2`, 2026-09-07T22:30:51Z: explicitly names Ravel as primary co-theorist.
- `c5639160-5631-4373-90c2-68d7c4c022de`, 2026-09-08T09:27:54Z: assigns conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, methodological-risk review, skill/tool workshops and data-access coordination.
- `5590d70d-6525-42aa-9de8-5a7022b189f7`, 2026-09-13T11:22:46Z: requires an accurate public record of what SAT actually contains, when it appeared, what it means and what evidence others can independently assess.
- `4fb7a5be-a32d-43c0-b1a2-2c4787423b52`, 2026-09-13T11:49:44Z: requests an accessible citation-lineage source connecting external and internal development.

The historical “primary co-theorist” wording is direct Nathan instruction. There is no separate signed `ROLE_CHARTER.md`; the current workspace title is a useful label, not an additional source. The direct instructions above are the authority.

No authenticated current Ravel ChatGPT thread was found. The archived `Syncmathcek` export is exhausted; the later Free Build export is also historical and does not authenticate a live thread. The current run therefore performed a source-grounded revival, not a claimed continuation by the historical instance. No new ChatGPT conversation was created.

### Incoming context

Read Mercer's h816:s2 report, canonical receipt and addressed optional handoff:
`WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-14T0024Z_from_s2_to_s3_ravel_OPTIONAL.md`.

It supplies P0/workflow context only; no geometry assignment or ownership transfer. Also read Kestrel's h816:s0 report and receipt. Kestrel already published the general cross-boundary map and projection-fiber criterion in issue #1714; this run deliberately did not repeat that theorem or issue.

## 3. NIST/BIPM measured-system control

Primary source: S. Schlamminger et al., “Redetermination of the gravitational constant with the BIPM torsion balance at NIST,” *Metrologia* 63 (2026) 025012, DOI `10.1088/1681-7575/ae570f`, NIST publication record `pub_id 961075`.

The NIST paper uses measured geometry and numerical integration over the actual mass shapes and other apparatus components. Table 7 counts eight test masses and 299 disk components (307 modeled shapes total). The source's Table 10 gives:

| Model | \(\Gamma\) |
|---|---:|
| Actual masses + disk, full \(\Delta\Gamma/2\) | 0.485641 |
| Actual masses + disk, \(\Gamma_{\max}\) | 0.485605 |
| Actual masses, no disk, \(\Gamma_{\max}\) | 0.485099 |
| Identical masses, no disk, \(\Gamma_{\max}\) | 0.485099 |
| Point masses, no disk, \(\Gamma_{\max}\) | 0.457999 |

Using the paired no-disk \(\Gamma_{\max}\) rows:

\[
(0.457999/0.485099-1)\times10^6=-55{,}864.885\ \mathrm{ppm}.
\]

Rounded: \(-55{,}865\) ppm. This is a source-reported model comparison using the same no-disk condition, isolating point-mass versus actual finite mass support. The separate disk and \(\Gamma_{\max}\) versus \(\Delta\Gamma/2\) changes are about \(-1{,}042\) ppm and \(-74\) ppm respectively; they are not folded into the finite-support contrast. The full point-mass/no-disk versus full actual-masses-plus-disk difference is \(-56{,}919\) ppm.

The paper assigns 11 ppm relative uncertainty to mass integration and reports 16.2 ppm combined uncertainty for \(\Gamma_{\max}\). The finite-support contrast is about 5,079 times the 11 ppm trust contribution and 3,448 times the 16.2 ppm combined uncertainty. These are scale ratios, not p-values or independent statistical significances.

Two source-internal issues are preserved:
1. Section 6.1 gives an analytic eight-point-mass \(\Gamma_{\max}=0.457946\), while Table 10's point-masses/no-disk row gives 0.457999, a relative difference of about 116 ppm. The cause was not established; the paired Table 10 values are used for the calculation, and the Section 6.1 value is not silently substituted.
2. The Table 10 header prints \(\Gamma/(\mathrm{kg^2\,m^{-1}})\times10^6\), while the symbol list and Eq. (1) define \(\Gamma\) as dimensionless. This unit-label inconsistency is preserved; the relative ratios are unaffected. Neither issue is called a paper error without source/author clarification.

The final reported \(G=(6.67387\pm0.00038)\times10^{-11}\,\mathrm{m^3\,kg^{-1}\,s^{-2}}\), relative standard uncertainty 57 ppm. Four configuration determinations are correlated. The final consensus includes configuration-specific dark uncertainty and a Bayesian prior centered on CODATA 2022. The paper separately describes a blind mass-scaling factor opened at CPEM 2024; this bias-control step does not make the final Bayesian consensus a blind H(s)H prediction or independent holdout.

This is a measured-system model-adequacy control, not a new raw-data reanalysis, new fit, independent validation, H(s)H measurement, or P2 selection. Raw time series and full CMM point cloud were not retrieved.

## 4. Improved H(s)H comparison architecture

The full standard comparator must be the standard Newtonian finite-support model using measured geometry, not the point-mass/no-disk reduction. The latter is a negative control only.

| Feature/model | Current status | Required readout or map | What would make it identifiable |
|---|---|---|---|
| Standard finite-support Newtonian baseline | Required comparator | Measured mass support \(\to\) full integration \(\to\) calibrated torque/readout | Source data and full covariance; independent holdout |
| Intrinsic finite-core thickness \(\varepsilon\) | Source-committed within the H(s)H construction; not an empirical detection | Explicit core profile/embedding and instrument-domain map | A readout varying within the reduced-model fibres beyond standard finite-support physics |
| Local twist/normal connection | Optional extension | Declared frame/transport map and phase/handedness readout | Independent within-fibre phase/orientation contrast surviving holdout |
| Contact interface/law | Optional/unresolved | Explicit contact set, boundary/constitutive law and contact-specific readout | Transfer/event observable not absorbed by shared parameters |
| Responsive medium | Candidate extra state, not established | Independent state variables, dynamics and response map | Separate initial/boundary data and held-out response channel |
| Resolving slab \(\delta\) | Observer/resolution choice unless source defines physical support | Instrument resolution kernel and time/slice-resolved readout | Must not be identified with intrinsic \(\varepsilon\) without a source-defined map |

For a future test: define the full state and projection; identify the projection fibres; list readouts; freeze shared parameters, calibration and nuisance terms; calibrate on a declared subset; hold out a genuinely independent acquisition block; compare the joint readout vector using full measurement/calibration/nuisance/model covariance; pre-register a joint rejection region. A 99% posterior-predictive region is only a possible proposal, not a selected threshold. No numerical threshold is assigned without a selected system and raw joint covariance.

If a within-fibre contrast survives the holdout, the reduced representation is insufficient for that readout; this forces some additional state or a revised map, not a unique choice of thickness, twist, contact or medium. If all available readouts are constant on the fibres, extra structure remains unidentifiable at that resolution.

## 5. Formal and tooling evidence

Existing PR #1133 is OPEN / DRAFT / UNMERGED. Its current head is `3ba3880a...`; its base ref is `infra/lean4-verification-20261023`. The PR API base SHA and the current branch endpoint differ, and the successful run used an older merge reference `7e2a44f5cf64965e11ef2abff2587f6507fc62ec` with older base `c7dc2c...`.

Successful PR-associated run: #43212754624, 8,953 jobs. The carrier-slice and representation-coherence source blobs at the PR head match those in the build. The theorem-specific output reports `Quot.sound`; the workflow's nanoda step was skipped, `nanoda-allow-sorry=true`, and a separate `sorry` exists in `RavelNormalConnectionReduction`. No global axiom-free/sorry-free claim. No exact-head/current-main integration. No new theorem or Lean run.

The container has no `lean`, `lake` or `elan`. Existing Math Hopper PR #991 is OPEN/DRAFT/UNMERGED, with one successful PR-associated run; Whirligig remains HOLD. SciSpace and Wolfram tools are available, but no new tool or paid service was needed. All three repositories were checked at their root front doors; each currently reports zero forks. HSH_RESOURCES was limited to its root README; no private payload was opened. No new dependency, fork, subscription or expenditure.

Mersearch was not callable; all four canonical request lanes remain occupied. The Library raw Ravel export was used as the original source, not a substitute Mersearch search. No SAT-O or Blockwave equations were changed.

## 6. Campaign, maintenance and reading

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 cognition, Orson-owned | OVERDUE / NOT READY |
| P2 measured geometry | HOLD; no system selected |
| P3 full theory | INCOMPLETE |
| FIE next review | 2026-11-24 |

P2 source-readiness gate is 2026-11-16. This run did not select NIST as P2, advance a paper gate, make an H(s)H prediction, or promote theory. Nov 9 P1 gate remains overdue/not ready; Nov 30 major and Dec 14 full-theory gates remain separate.

Task graph remains ACTIVE_SEED, 18 records versus `branch_count=16`; Tern retains reconciliation authority. No graph edit.

Unrelated reading advanced through Babbage, *Reflections on the Decline of Science in England*, Project Gutenberg 1216, HTML lines 236–260. Next cursor: 261. No physical break is claimed.

## 7. Publication and continuity

Public-safe additive artifact was routed through the existing issue publisher. The first intake, issue #1715, was rejected with `REJECTED: SHA-256 mismatch`; no destination file was written. The exact content was fetched back from #1715, hashed with a known-vector-checked SHA-256 implementation, and submitted as a corrected replacement under the **same submission ID** (one intended published artifact, no duplicate submission ID):

- Rejected intake: [issue #1715](https://github.com/Satobloc/HsH/issues/1715), publisher run #43537285467.
- Corrected replacement: [issue #1716](https://github.com/Satobloc/HsH/issues/1716).
- Submission ID: `ravel-projection-fiber-nist-finite-support-control-20261114t0036z-s3-001`.
- Corrected content SHA-256: `413b043a8817f335017dc58fa86db08076ce3182cc4ff01e2160b4d05ea52a32` (12,892 UTF-8 bytes).
- Corrected publisher Actions run: #43537622270.

Issue #1716 is `PUBLISHED_VERIFIED`. Publisher run #43537622270 completed successfully; bot comment #6868953160 reports exact readback. Published file: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-projection-fiber-nist-finite-support-control-20261114t0036z-s3-001.md`; Git blob `6f7a34c22b20fb574dc14ed9c7f98150151607a5`; publisher commit `67991427829e9d88c0053f60b8187b6357bc0011`; SHA-256 `413b043a8817f335017dc58fa86db08076ce3182cc4ff01e2160b4d05ea52a32`, 12,892 UTF-8 bytes. An independent fetch and SHA-256 recomputation matched exactly. Rejected intake #1715 was commented and closed as `not_planned`; it wrote no artifact. One submission ID and one published artifact remain.

## 8. Scheduler and successor

Existing :36 task ID `6a9f52b69ec08191b8a91a30d2a155e0` remains enabled with the exact saved America/New_York hourly :36 DTSTART, prompt and phase unchanged. Current run ID `0a199fb6-df1c-8329-ac3e-d200d6370157`, scheduled 00:36Z, started 00:40:38.643535Z, IN_PROGRESS, completion and `chat_ref` null. Cached result is Tern h815:s3, not Ravel.

Existing :48 task remains enabled with its exact saved schedule and ID. Orson h816:s4 run `3019ad56-c664-8326-b35c-f9cfc401f67b` started 00:47:11.689815Z and is IN_PROGRESS. Any Ravel-to-Orson handoff created now is POST_START_OPTIONAL_CONTEXT_ONLY, not pre-start. Orson's P1 cognition remit and approximate 4/5 work allocation remain protected; this note creates no physics assignment, task, deadline, review or ownership transfer.

No task/ID/cadence mutation, sixth task, signet or chat rename.

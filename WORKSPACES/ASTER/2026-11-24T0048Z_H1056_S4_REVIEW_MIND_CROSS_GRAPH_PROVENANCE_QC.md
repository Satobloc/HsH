# Aster h1056:s4 | Review-MIND cross-graph provenance and source QC

**Disposition:** bounded source-fidelity cross-read completed; historical response/work-stream mirroring strengthened; body-only provenance loss connected to an existing Lean theorem; current physical-source claims qualified; Orson P1 protected.

**Scope:** assistant-level Aster routing-label reconstruction under the current Review-MIND charter. This is not an authenticated historical Aster instance, not a formal Paper A review, not an experiment, and not a new physical calculation.

## 1. Ring selection and authority

- Nominal hour: h=1056.
- Sequence: 5(1056)+4 = 5284.
- 5284 mod 19 = 2.
- Selected routing label: Aster, index 2.
- Next ring label: Ariadne, index 3, h1057:s0.

### Historical Aster source

The original Aster export was re-read from HsH blob `1bf6e65c4ac1650297acb67d7e39f700454a03c8`. It contains 1,818 mapping entries and 39 direct user-role messages. Those messages establish a historical source-fidelity and contradiction-checking remit, including questions about whether a claim reads like Nathan, whether Nathan previously said it, and whether it contradicts prior statements. They also document an earlier Paper A review assignment.

The raw export's embedded conversation ID is `6ab006ce-23a8-4e11-8c7a-3b04d6b7a51e`. The current workspace pointer instead records `6ab006ce-e358-83ea-b3dd-7b23a26c00fa`. These are not the same ID. The discrepancy remains unresolved; this report does not silently equate them.

No separately signed Aster specialist charter was recovered. The current Code Grurple roster supersedes the historical Paper A assignment: **REVIEW FROZEN / CROSS-READ OPEN**. The present user request explicitly authorizes this bounded cross-read. No Paper A formal review was reopened.

### Existing-thread-first result

I checked Aster BOOT, CURRENT_WORK, CONTINUITY, INBOX and NEW_INSTANCE_START_HERE; the h1018:s4 report and receipt; the h1045:s2 current-work checkpoint; the candidate manual-thread pointer `6aecede1-4c08-83e9-abc4-da64f59a4f51`; and bounded HsH/SAT archive references to that ID.

The candidate remains unverified, with no authenticated current Aster thread established. The current scheduled execution also had no run-level chat reference. No new ChatGPT conversation was created, and no direct-thread delivery or cross-thread participation is claimed. Aster's separate :24 Geometry checkpoint remains intact.

Aster's current HSH_RESOURCES boundary was respected. I read the repository root README, public AI start page and HSH toolkit index only. No HQ Tool Chest or private/internal research payload was opened.

## 2. Aldus/Morrow cross-graph source recheck

The existing [Aldus report, issue #2450](https://github.com/Satobloc/HsH/issues/2450), was rechecked against three exact raw-export blobs:

| Export | Git blob | Mapping entries | Message nodes | User-role messages |
|---|---|---:|---:|---:|
| Aldus | `2f5ea91a449446f64d298b50b0c2ef0d8533900a` | 1,578 | 1,577 | 47 |
| Morrow, earlier snapshot | `342b50c3927c3466783b091234647f338990a113` | 107 | 106 | 4 |
| Morrow, later snapshot | `362075c5e32ec9e97579bd1de58fba7f612cb6bb` | 465 | 464 | 14 |

The Aldus and Morrow conversation IDs are distinct: `6a9dea2e-bb98-83ea-a74f-4beb4baa3153` and `6a9ee7ca-d340-83ea-b99d-6a3097429f36`.

### Three bounded exemplar episodes

| Episode | Directly rechecked evidence | Qualification |
|---|---|---|
| A | Aldus node `31d813b1-9797-542e-9568-38f483e0c147` and Morrow node `12959526-2797-5c4c-9e5f-4dc23c465a04` have exactly equal 4,148-character bodies. The Morrow representation follows by 31.259568 seconds. | Model/async metadata differs. Equal body is not proof of one invocation. |
| B | The user-prompt bodies in nodes `6de1c746-6789-4ea5-82c2-47437e64a83e` and `46c4efd0-7acd-4701-a274-b2ec4d5c0de5` are identical and 53 characters in the exported string, including trailing whitespace. The matching final bodies in nodes `c7cb2977-a576-5dbd-a887-abc468ecd4cf` and `5ef864b2-4718-541d-82ed-b8e337a6854c` are exactly 5,027 characters and are 0.187571 seconds apart. | The earlier report's 58-character prompt count is corrected to 53. The Morrow preamble and first tool action/result precede the later Aldus prompt. |
| C | Aldus node `f5233d71-6caf-5af9-ad5c-c598cd94b255` and Morrow node `407f4a8f-90c5-5e5a-890e-36121c77d93c` have exactly equal 848-character bodies, 9.691747 seconds apart. | The Morrow node is absent from the 107-entry earlier snapshot but present in the 465-entry later snapshot. The earlier snapshot's absence is not evidence that no Morrow representation existed. |

For Episode B, six distinct `exec-...` work-item IDs occur in both graphs within the bounded 2026-09-08 11:07:00Z to 11:11:40Z window:

1. `exec-10689270-6bfc-4566-8c86-15c20f2d854a`
2. `exec-21ea2584-97af-493c-b089-9451f1a3470b`
3. `exec-c31e1fe1-e439-462b-ae3f-cbd53b49ab4c`
4. `exec-e751a989-b48d-4972-accb-5e70d17daf2d`
5. `exec-87c0fb50-2d2c-47e5-a106-90e2bb72ece3`
6. `exec-cee3233d-f530-422e-9ea2-2086b5aa5a5d`

This recheck covers three exemplar episodes and the six IDs in the specified window. It does **not** independently re-audit the earlier report's full 23-record ordered sequence.

**Interpretation:** the evidence supports historical response/work-stream mirroring across distinct serialized conversation graphs. It does not establish one shared model runtime, one invocation, authenticated agent identity, or the number of external side effects. Different message IDs and turn IDs establish different representations, not necessarily independent generations. Shared work-item IDs establish overlap in recorded work items, not independently verified external actions. Backend invocation IDs and external action receipts would be needed to distinguish those possibilities.

## 3. Formal information-loss statement

Let B(e) be the exported message-body projection of a record e, and let P(e) be its provenance tuple, including conversation, message, parent/turn and async-source fields.

For the Episode B final pair, the raw records establish:

- B(x) = B(y)
- P(x) != P(y)

If provenance factored through body alone, there would be a function f such that P = f composed with B. Then equal bodies would imply equal provenance, contradicting the observed pair. Therefore **full record provenance cannot be recovered from message body alone on this observed domain**.

This is a source-grounded finite witness, not a claim about the backend cause of the mirroring.

The general criterion already exists in [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189), current head `9e563ee330c8bdbdcf16f746eb1baff931751677`. Exact-head Actions run [#45284099363](https://github.com/Satobloc/HsH/actions/runs/45284099363) succeeded with 8,962 build jobs and an exact-head checkout assertion. The target factorization theorem and mismatch obstruction compiled. Retrieved target-theorem axiom output includes `Classical.choice` and `Quot.sound`; no `sorryAx` or `admit` appeared in the job log. The global axiom audit, tests, lint, nanoda and leanchecker were skipped.

The theorem verifies the abstract fiberwise factorization criterion. The raw-export-to-formal-record translation and the causal interpretation of these historical records are not themselves formalized. No new Lean module or case-specific build was created.

## 4. Cross-lane Lean and geometry QC

| Work | Current evidence | Limit |
|---|---|---|
| Meridian PR #2458 | Current head `8c524ae5cb17c29f14c30a65ac9ad10e2b8e9b5e`; exact-head run [#45299647699](https://github.com/Satobloc/HsH/actions/runs/45299647699) succeeded with 8,949 jobs and an exact-head assertion. | Target axiom output includes `propext`, `Classical.choice` and `Quot.sound`; no `sorryAx` or `admit` in the retrieved log. Global axiom audit and auxiliary checks were skipped. |
| Orson PR #2375 | Current head `f5b5babe6754363db93ba0ecb947de22522b9caf`; later PR-triggered merge-reference run #45264406040 succeeded. | No exact-head assertion. No `sorryAx` or `admit` in the retrieved log; global axiom audit skipped. The older failure #45186293778 was on an earlier merge-reference state and is superseded as a current-status claim. Orson retains ownership; no intervention. |
| Aster PR #2416 | Current head `897fe3ae0faa4b1b64ad735cf7c88b262d60ca56`; merge-reference run #45184293786 succeeded. | No exact-head assertion or formal review submission. PR remains open/draft; no change. |

Meridian's current `PairedSampleProvenanceGate` is a finite mathematical covariance-pairing counterexample. It shows that matching marginal summaries need not determine a joint covariance. It is a pure mathematical result, not a measured dataset, physical fixture, human-team model or SAT/H(s)H equivalence. The separate covariance-composition module also compiles at the current PR head. No new calculation was performed here.

## 5. Physical-observable source QC: Kelvin-wave paper

I independently checked the source cited in Loom h1056:s3:

Barckicke, Falcon and Gissinger, “Kelvin wave propagation in a macroscopic hydrodynamic vortex,” *Nature Physics* 22, 409–414 (2026), [publisher article](https://www.nature.com/articles/s41567-026-03175-w), [DOI](https://doi.org/10.1038/s41567-026-03175-w).

The paper describes a real classical air-core vortex in an inner Plexiglas cylinder 21 cm in diameter and 45 cm tall, within a 50 cm cubic tank. The vortex is approximately 0.4 m high. The relevant observables include core radius a(z,t), lateral displacement eta(z,t), azimuthal and vertical velocity profiles, circulation Gamma, and the Kelvin-wave dispersion relation omega(k).

### Measurement and uncertainty provenance

- The optical contour camera is positioned normal to the vortex axis and uses two lenses, 8 mm and 12 mm, for complementary views. The reported contour acquisition is 300 fps over 30 s, with approximately 60 micrometres per pixel. The Methods give typical core-radius and position measurement uncertainty of about 0.1 mm.
- A separate Phantom V1840 camera views from above for PIV, at 6,000 fps. The reported velocity grid is 37 by 23 with 2.7 mm spatial resolution. The circulation uncertainty is approximately 0.005 m^2/s.
- PTV uses 1.5 mm particles; the reported vertical-velocity uncertainty is approximately 0.05 m/s.
- The PDF streams are separate: a(z,t) is recorded at 100 fps for 10 minutes, while eta(z,t) is recorded at 360 fps for 3 minutes. The article does not supply acquisition keys that would establish paired a/eta samples. They must not be treated as a paired time series without raw acquisition provenance.

### Two source qualifications

1. The Results refer to “two orthogonal cameras” for the m=1 counter-rotating-wave evidence. The Methods describe one optical contour camera with two lenses plus a separate top-view PIV camera. These are plausibly the two physical cameras, but the Methods do not explicitly map the PIV view to the counter-rotation inference. This is a documentation ambiguity, not a demonstrated contradiction and not fully resolved by the text.
2. The dispersion procedure fixes measured a0, fits Gamma and vertical velocity to the stated relation, then checks those fitted parameters a posteriori against measured values. This is a fit plus a posteriori consistency check, not an independent blind prediction or holdout validation. Extended Data Fig. 4 calls the a0 measurement uncertainty negligible, while the Methods give a typical 0.1 mm uncertainty for core radius and position; the difference in scope is not explained in the material inspected.

The paper cites a Figshare dataset, DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347), but the file manifest, version and checksums were not retrieved. No raw data, acquisition records or supplementary dataset were analyzed here. No new physical calculation, fit, uncertainty propagation, prediction or observational validation was performed.

The paper presents a **classical hydrodynamic analog**, not an equivalence to quantum vortices, SAT, H(s)H, GR or string theory. No cross-theory mapping is proposed.

## 6. Mersearch and archive access

No Mersearch query was run. The connected runtime exposed no Mersearch action, all four canonical request lanes remain occupied, and no local pinned Mersearch checkout was present. A full clone of the three repositories would be approximately 4.9 GB; no full clone or partial synthetic corpus was created.

Current lane diagnosis:

- Lane 1, Calder angle/geometry: request remains requested; no request-scoped result manifest/receipt found.
- Lane 2, perceptual-nexus: compact manifest and receipt exist, but raw result files are withheld and the request remains requested. The compact receipt is navigation evidence, not the underlying source result.
- Lane 3, Calder IRI/worldtube: request remains requested; no request-scoped result manifest/receipt found.
- Lane 4, Kestrel finite-core: request remains requested; no request-scoped result manifest/receipt found.

The bridge's runner-shutdown and lane-release problems are already tracked in [issue #1704](https://github.com/Satobloc/HsH/issues/1704). No request was overwritten, retriggered or released. Direct retrieval of the exact HsH raw exports was used as a bounded source fallback; this is not represented as a Mersearch search or exhaustive three-repository search.

Repository orientation read:
- HsH at the run-start main snapshot and refreshed main snapshot.
- SAT theory archive root README, orientation and AI-file index.
- HSH_RESOURCES root README, public AI start page and HSH toolkit index.
- No private HSH_RESOURCES payload or HQ Tool Chest was opened.

No new tooling, dependency, subscription or paid service was introduced.

## 7. PWH and protected campaign state

The latest verified PWH deep review is Meridian h1055:s3. The central PWH queue still points to Elias h1054:s2; that pointer is stale and Tern-owned. Two durable products follow Meridian (Sable h1056:s2 and Loom h1056:s3); this Aster product is the third. The next five-product deep review threshold is not yet reached, so no deep review was repeated.

The current task graph remains 18 records against 16 declared branches, with five completed, twelve active, one blocked, seventeen reachable and one unreachable.

The pre-write clone ledger contained 513 rows, 510 unique populated event IDs, three legacy entries without IDs, zero parse errors and zero duplicate populated IDs.

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE / RECORD SAFETY FAIL; no new full payload parse or live-route acceptance |
| P1 November 9 cognition | OVERDUE / NOT READY / FROZEN / ORSON-OWNED |
| P2 November 30 | HOLD |
| P3 December 14 | INCOMPLETE |
| FIE | Last full review November 20; next December 4 |
| Unrelated-source break | Last completed November 21; not due again |

Orson's primary cognition research and P1 manuscript were not modified. No human-subject session, model trial, manuscript intervention, physical calculation, SAT-O/Blockwave equation change, BEDROCK promotion or theory change occurred.

## 8. Revival seed for a future Aster thread

The following is a paste-ready role seed, not a claim that a new thread was created:

> You are Aster, an assistant-level source-fidelity and contradiction-checking specialist. Work from original role-tagged records and exact source locators. Distinguish direct Nathan statements, assistant reconstructions, historical sources, standard references, proposals and independent measurements. Preserve conflicting conversation IDs rather than silently merging them.
>
> Current Code Grurple authority is REVIEW FROZEN / CROSS-READ OPEN. Do not reopen formal Paper A review or take P0 implementation ownership. Perform bounded cross-read only when explicitly requested or when a concrete post-acceptance defect is identified.
>
> For Review-MIND, analyze actual documented human/LLM/agent interactions and alternative explanations. Do not infer independent agents from labels, distinct message IDs, matching outputs or agreement. Keep source identity, invocation identity, representation identity, side-effect identity and verification identity separate.
>
> Use Mersearch first. Never overwrite occupied request lanes. If blocked, diagnose the first failed transition and route the issue to its owner. Use existing Lean/Mathlib results for explicit formal structure; a Lean build verifies only the formalized statement, not source translation or physical premises. Do not create synthetic physical fixtures or data-free calculations.
>
> Physical calculations require an identifiable measured system, dataset, provenance, units, uncertainties and a clear prediction-versus-fit distinction. Preserve Orson's P1 ownership. Respect HSH_RESOURCES access boundaries. Do not change task IDs, schedules, phases, signets or conversation names. Make no cross-thread delivery or acknowledgment claims.

## 9. Succession and nonclaims

- Next ring label: Ariadne h1057:s0.
- An optional repository context packet and inbox pointer are prepared separately. They create no assignment, deadline, response obligation, ownership transfer or direct-thread delivery.
- The original four enabled Workshop Relay tasks and their schedules/phases remain unchanged. The :12 task remains disabled. No sixth task was created.
- No direct Aster or Ariadne thread delivery, consumption or acknowledgment is claimed.
- The current scheduled host record remained in progress at the last inspection; repository artifacts and readbacks are the evidence of completed work in this report.

# Sail/plane source-fidelity correction and constitutive-law boundary

**Date:** 2026-10-31  
**Classification:** source audit / assistant reconstruction; not a new SAT/H(s)H physical result  
**Scope:** Alberr's original May 11, 2025 dialogue, the historical RMS Spacetime Filaments text, the existing finite-core sandbox chain, and PR #734.

## Executive result

The original user-role source corrects an initial cord/rope image to a **sail / sheet / plane** image for the time surface. It then clarifies that time is the sail passing through a matrix of worldline-like things, with particle readout associated with intersections.

The source does **not** specify a material membrane, surface tension, surface-energy functional, gradient coefficient, bending modulus, viscosity, or relaxation law. The October 11 scalar surface-energy sandbox is a later assistant-generated model on a separate finite-core fixture. Its positive gradient coefficient is not forced by the May 2025 source.

This yields a useful type boundary:

**source metaphor → typed carrier/interface → intersection readout → optional finite-core thickening → optional constitutive law → observable map**

Each arrow needs its own source or derivation. A sail metaphor does not by itself supply a membrane constitutive law.

## 1. Primary raw source

- Repository: `Satobloc/HsH`
- Original conversation: `Alberr [äüïöëÿ]`
- Conversation ID: `68205d60-2848-8003-b37f-77558247f108`
- Raw export Git blob: `c98f63fa861b0df478a5fa98dff54d731348c81f`
- Export contains raw mapping nodes with outer `author.role` and timestamps.
- The relevant records have `author.role=user`; `author.name` is null. Attribution is therefore based on the conversation's user-role provenance and surrounding context, not a populated author-name field.

| UTC timestamp | Message UUID | Source content, paraphrased |
|---|---|---|
| 2025-05-11 09:03:39.883 | `fbbf13ad-70f5-40b5-b694-dee31bcca8dc` | Tentative idea that a particle worldline may be an extended four-dimensional structure or filament, with particle form associated with intersections. The first image uses an ambiguous cord-like analogy. |
| 2025-05-11 09:27:36.447 | `7edbc632-5e42-4fb3-8aab-c31e1bf6b9c6` | Explicit correction: not cords/ropes; the intended image is a ship's sail, a sheet of paper, or a plane in a diagram, with particles as intersecting lines. |
| 2025-05-11 09:53:48.682 | `82dd95c8-d444-4d4a-9da2-1e1e6f3693c4` | Clarifies that time is the sail passing through a matrix of worldlines that are themselves “things”; rejects reducing the idea to generic contact between objects. |
| 2025-05-11 10:19:02.427 | `e4700493-b35b-48da-bef1-b0beacbab1ef` | Calls earlier images imprecise and tentatively extends the filament question to stones, rivers, trees, air, planets and possibly vacua. |
| 2025-05-11 10:27:07.318 | `a10f13d7-e347-41c5-8162-b2341e7799ec` | Asks whether the proposed filamentary form could be learned, seen or used through apparatus; this is a question, not a defined mechanism. |
| 2025-05-11 10:34:57.293 | `557f3cbc-e3e3-4238-8b5c-10e8b4c95b33` | Explicitly asks how to make the ideas testable and find an operational key. |

These are exploratory statements, not a finished mathematical definition. The 09:27 correction supersedes the earlier ambiguous cord image for the time-surface analogy.

## 2. Assistant reinterpretation is a separate source layer

The same raw export contains assistant-role responses that reintroduce rope/tension language:

- `02262c6a-ff9a-4aa2-836b-3404842709de`, 08:55:29.804Z: assistant discusses Maxwell's “tension of lines of force” before the user's filament proposal.
- `79e281eb-d7ea-403e-a607-c08e2fce35ee`, 09:27:37.395Z: assistant interprets the corrected sail image as a tensioned line through wind.
- `1bde60c2-ef3e-4113-94e8-965a6c297b48`, 10:01:55.216Z: assistant introduces “tension in your Seil” in a later notebook metaphor.

These assistant messages are not Nathan user-role equations or constitutive instructions. The assistant's 09:53 roleplay response later paraphrases the time-sail idea more faithfully, but remains assistant-authored.

## 3. Historical SAT archive: a separate use of “Ropes”

- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- File: `RMS Spacetime Filaments.txt`
- Blob: `0323682e7a49278b5a76d0c6a5a7787a13eb17d6`

This archival text describes a four-dimensional speculative structure, a three-dimensional time surface, and filaments whose intersections with that surface represent particles. It explicitly frames SAT as a speculative “toy theory” / heuristic, not an assertion of established physical truth.

The same file uses **Ropes** as a later composite-strand category: large cohesive groups of bundles. That is a distinct object in its hierarchy. It does not make the time surface itself a rope, nor does it supply a rope-tension law for the sail/plane.

The file contains a duplicated second presentation of much of its text; those two blocks are one file witness, not independent corroboration. Its author and original composition date were not authenticated in this pass.

## 4. Downstream finite-core and energy models

### Ravel finite-core packet

- File: `WORKSPACES/RAVEL/SANDBOX_2026-10-11_FINITE_TUBE_SHEET_TOPOLOGY_GATE.md`
- Blob: `47bd753bd233394cd393a420c0086cfdd5148c9c`

This is an assistant-generated local Euclidean finite-tube / resolving-hyperplane construction. It introduces a finite core, a lateral shell and candidate intersection-support types. It explicitly says that kinematic intersection alone supplies no constitutive law or particle identity.

It is not the May 11 raw user source.

### October 11 scalar surface-energy sandbox

- File: `WORKSPACES/ALBERR/SANDBOX_2026-10-11_TENSION_LIFTS_OPEN_SUPPORT_DEGENERACY.md`
- Blob: `bf107661d04e581cde65d074a957b4a71282cf8c`
- Existing status: `GEN/DERIVED` within a declared scalar surface-energy fixture; not canonical SAT/H(s)H theory and not a particle claim.
- Continuity status: `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`; not an authenticated contribution by Alberr's historical ChatGPT instance.

It adds a trial functional with a positive gradient term, schematically

`E_B[h] = 1/2 ∫_S (A_s h² + B_s |∇_S h|² + D_s (Δ_S h)²) dA,  B_s > 0.`

That is a constitutive choice inside the sandbox. The May 11 user-role messages do not define `h`, `A_s`, `B_s`, `D_s`, `η_s`, a material surface, boundary conditions, a physical unit system, or a measured calibration for them.

The sandbox's mathematical conclusions are conditional on that chosen functional and its assumptions. They are not consequences of the sail/plane source alone.

The sandbox predates the current BEDROCK data-free-calculation permission gate. This audit does not retroactively characterize its original execution; it does classify it as **historical sandbox only, not empirical evidence, and not reusable for new calculations without specific prior Nathan permission**.

## 5. Typed geometry/readout boundary

A faithful reconstruction may keep the following interfaces distinct without claiming that the source supplied all their mathematical definitions:

1. **Carrier:** a filament/worldline-like support, whose precise dimension and finite thickness remain to be specified.
2. **Resolving interface:** the time-sail / plane / timesheet representation.
3. **Intersection readout:** the support's intersection with the interface. The existing PR #734 abstracts this as a set trace.
4. **Optional finite-core thickening:** a separate normal-bundle/profile choice, not implied by the original image alone.
5. **Optional boundary shell:** a derived boundary of a chosen finite-core object, not identical by default to the sail.
6. **Optional constitutive law:** an independently specified action/stress/energy with metric, field variables, units, boundary conditions and coefficients.
7. **Observable map:** a defined map from the intersection/current to a measured quantity, with calibration and uncertainty.

The source-level idea supports the conceptual carrier/interface/intersection sequence. It does not by itself force steps 4–7.

A proposed surface-energy coefficient such as `B_s` becomes a genuine prediction parameter only if it is derived from the frozen geometry or independently calibrated on a real measured system and then held fixed for an independent observable. If it is freely adjusted against the same data, the result is a fit, not a geometry-forced prediction.

## 6. Existing Lean work and exact-head status

Existing draft PR: [HsH PR #734](https://github.com/Satobloc/HsH/pull/734)

- Head branch: `research/alberr-sail-ontology-fidelity-20261027t12z`
- PR head: `fbf286be602a7b707e0171188008d1837c231bd7`
- Base branch: `research/alberr-multimodal-source-projection-20261027t08z`
- Base SHA: `8e748315fde1399f956d442ab4b3c96318ad017d`
- Existing module: `AlberrSailTraceFidelity.lean`
- Module blob: `83b7cbe1bfa92a005565b2c2252dbb121b848ee6`

The module formalizes five conditional set-theoretic statements: trace inclusion, recovery under full sheet coverage, failure to recover an unseen support point, mapped-trace inclusion, and equality under an injective map. It explicitly does not formalize time, topology, dimension, the original drawings or physical existence.

Historical CI run [#40803845029](https://github.com/Satobloc/HsH/actions/runs/40803845029) completed successfully, but its job log identifies source commit `4da6a6e6864d32ac6f6f6ff40c5bca52623501e6`, a merge commit of PR head `fbf286be...` into base commit `06aadd6...`. Therefore this is a **merge-ref build, not an exact-PR-head build**.

Observed build details:
- 8,947 build jobs; build SUCCESS.
- Five theorem-specific axiom reports: three report no axioms; two report standard `propext` and `Quot.sound`.
- Zero `sorryAx` occurrences in the inspected full job log.
- Tests, lint, nanoda and the separate axiom-audit step were skipped.
- PR remains open, draft and unmerged.

No new Lean module or data-free proof was created in this pass. The existing formalization is the correct place to continue; exact-head verification remains an open workflow obligation.

## 7. Proof and empirical disposition

- **Source geometry:** partially specified, exploratory.
- **Set-trace mathematics:** already represented in PR #734.
- **Finite-core thickening:** later assistant reconstruction / optional representation choice.
- **Surface-energy functional:** assistant-generated sandbox choice.
- **Positive gradient/tension coefficient:** not source-forced.
- **Physical constitutive law:** not established.
- **Measured system/data/units/uncertainties:** not supplied for the sandbox.
- **Independent prediction:** none.
- **BEDROCK change or theory promotion:** none.

No physical calculation, numerical fit, new Lean proof, or observational claim was made in this audit.

## 8. Search coverage and limitations

The original May 11 raw export and the cited historical RMS text were read directly. The existing Ravel and Alberr sandbox artifacts were inspected. The four shared Mersearch request lanes were occupied at preflight; no request was overwritten or submitted. Consequently this is **not** a three-repository exhaustive search and makes no global claim that no other source contains a surface-energy law.

The current archive search receipts are navigational aids, not independent source validation. Any future global absence claim requires an available Mersearch lane or an authorized pinned three-repository local run.

## 9. Next exact cursor

1. Preserve the May 11 raw user-role sail/plane correction as the controlling source for that metaphor.
2. Keep the later 4D-filament / 3D-time-surface archive text as a separate historical witness.
3. Do not attribute the October 11 energy functional or `B_s` to Nathan Direct or historical Alberr.
4. If a material membrane or tension law is proposed, first recover its original user-role source; otherwise classify it as a new constitutive hypothesis requiring explicit permission and real-system evidence.
5. Reuse PR #734 rather than duplicating the set-trace theorem; exact-head CI remains unverified.
6. Any physical discriminator must freeze shared geometric/constitutive parameters on calibration data and test a held-out observable against a standard comparator with declared uncertainties.

**Bottom line:** the source says sail/plane and intersection. The finite-core shell and positive surface-gradient energy are later modeling choices. They may be explored only under their own source, permission and empirical gates; they must not be smuggled into the original geometry by metaphor.

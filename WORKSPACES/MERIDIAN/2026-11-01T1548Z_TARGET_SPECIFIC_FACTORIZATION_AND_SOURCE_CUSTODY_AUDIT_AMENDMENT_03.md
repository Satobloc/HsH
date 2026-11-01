# Amendment 03 | Exact theorem build scope and direct geometry-source boundary

**Parent report:** `WORKSPACES/MERIDIAN/2026-11-01T1548Z_TARGET_SPECIFIC_FACTORIZATION_AND_SOURCE_CUSTODY_AUDIT.md`  
**Parent report blob:** `0332825b3dbd4ce820a9530685215659e493280c`  
**Run key:** `REVROT3-19-20261011:519:s4`  
**Scheduler ID:** `6aa6c3bc02b48191b8a91a30d2a155e0`

## 1. Exact Lean log inspection: Ariadne's factorization special case

The prior report correctly classified Ariadne PR #945's build as a merge-ref build. I re-opened Actions run #40776838230 and its decoded job log.

- PR #945 head: `765ce3ac3cf5c21347dcbefba3c746704cf6394e`.
- Checked-out merge ref: `ead12fb94a34b5374a0450063d12d4729adeb7c4`, merging the PR head into base `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Lean: 4.34.0.
- Build: SUCCESS, 8,944 jobs.
- Exact theorem output: `positional_factorization_iff_history_constant` **does not depend on any axioms**. The two companion theorems in the same module also report no axioms.
- This is not an exact-head-only build. The PR head itself was not checked out by this run.

The encoded theorem is specifically fixed-position:
`g : Position → History → Force`, with a chosen reference history `h₀ : History`. At a fixed `p`, a position-only value exists for all histories iff `g p h` is constant across histories. It does **not** yet prove the fully general arbitrary-map criterion for every `P : X → Y` and `O : X → Z` on `range(P)`.

Calder PR #630's `CalderProjectionGate` separately proves conditional non-injectivity of a product projection that drops one coordinate. That establishes loss of the full state under its stated two-distinct-hidden-values premise; it does not show that every target observable fails to factor. Hale's formalization remains a finite parser-label result, not a model-cognition theorem.

## 2. Additional direct-source boundary in Meridian's historical geometry

Full raw source: *Meridian Minkowski Ring Analysis*, conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, Git blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`.

Two user-role messages deserve explicit status preservation:

- Message `f658b2db-32f0-45cd-828b-140691cc9afb`, 2026-10-20T23:53:30.041Z, says the 4D donut/curvature/cosmobarygenesis construction has **“no proof”** and is the **“working hypothesis.”** This is a direct statement of epistemic status, not evidence that the hypothesis is true.
- Message `59cdedb4-be76-455a-87c8-a6089de951b3`, 2026-10-21T23:53:03.096Z, asserts: **“3D rotation absolutely is 4D curvature. All 3D acceleration is.”** This is a direct user-role proposition. The message supplies no typed embedding, metric, parameterization, curvature definition or derivation. It is therefore a formalization candidate, not a proved theorem.

Related source qualifications retained:

- Message `090f5160-1020-486d-9c42-df3d7dff2063` (2026-10-21T00:17:23.235Z) is mixed-source; only its final correction that the reciprocal filament/timesheet model had been superseded by the common Klein-Fabric framing is treated as direct user content.
- Message `c5525f53-b7cc-4444-8102-3bf6fdb1c892` (2026-10-21T13:55:40.205Z) states `cw=t`, Forest Normalization and positive Euclidean signature `(++++)`, but explicitly marks the `±(c+H₀)/2` expression as uncertain (“or whatever the proper expression ... is”). It must not be promoted as a verbatim settled equation.

A definite Lean theorem for “3D rotation is 4D curvature” cannot yet be stated faithfully without the missing typed definitions and source-authenticated map. No circular trajectory, metric fixture, numerical values or physical system was invented. No new Lean module or calculation was created.

## 3. Current control boundary

- Code Grurple remains ACTIVE; its presentation-only interlock still outranks ordinary work.
- HAGALAZ remains BACKSEAT/HOLD.
- Meridian PR #895 remains OPEN / DRAFT / UNMERGED; its existing Orson-owned P1 files were not changed.
- No exact-head run was initiated; local `lean`, `lake` and `elan` are absent.
- No new issue, PR, branch, physical calculation, model inference, human-subject experiment, manuscript change, BEDROCK promotion, SAT-O/Blockwave equation change or scheduler change.

This amendment refines the proof/source status only. It does not alter the parent report's result or promote any geometry into BEDROCK.

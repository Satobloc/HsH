# Enheduanna h663:s2 — Bending-energy source recovery and conditional Lean bound

**Run key:** `REVROT3-19-20261011:663:s2`  
**Nominal UTC hour:** `h=663`  
**Selection:** `seq=5h+2=3317; 3317 mod 19 = 11`  
**Worker label:** Enheduanna (ring index 11)  
**Successor:** Tern Rook (ring index 12)  
**Identity boundary:** the ring label is not an authenticated historical person or ChatGPT thread. No dedicated usable Enheduanna thread or standalone Nathan-authored Enheduanna specialist charter was recovered. The README and source-layer census identify only a broad direct instruction to consider all archives when examining the Enheduanna case. Do not inflate that into a detailed charter.

## Executive result

A bounded, source-first recovery pass found several distinct historical bending-related objects, but **did not recover the particular historical maximum bending-energy calculation Nathan recalled on 2026-10-21**. It did recover a later assistant reconstruction's conditional reach-style upper bound. That bound has now been formalized in a draft Lean PR, with CI status tracked separately.

The main source-control finding is that the symbol `κ` has been used with incompatible dimensions across archive artifacts. The historical tension value, the user's later `10^44 J` recollection, the proposed curvature ceiling, the kink-energy normalization, and the conditional reach bound must remain separate. No numerical physical maximum can be assembled from them without a source-authorized constitutive law, arclength definition, and physical geometry map.

No measured system was selected. No physical calculation, fit, or prediction was performed. No CODATA comparison to H(s)H was performed. No theory or paper gate was promoted.

## Preflight and live control state

Read on current HsH main:

| Control | Blob SHA |
|---|---|
| `BEDROCK.md` | `527924246cc25caf7fac02dce4b20f024013cd19` |
| Steering Charter 2026-10-26 | `04822f3e48f746e9e464d893636ed4a670d68683` |
| Three Paper Campaign 2026-10-26 | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| New Instance Start Here | `43b577d42b8cced83f8836934598081685ea3ff3` |
| Three-repository onboarding | `fe40260cda5ce360909f2adfd64a3cc3e2c92a05` |
| Revival Rotation V3 | `90863a2a2b82b2d8e37ba1bd9f796389066f5409` |
| Thread-first rule | `e79707587914edb76afca1c32f9f4dad4d0324b7` |
| Task branch graph | `a0a818b89e4d04b0e9d7377b21113ca8e9ea19da` |

Current HsH main head at preflight: `91481cb3743a07c3f51eccf4cabae7a8c1a5384c` (2026-11-07T14:52:03Z). The task graph declares 16 branches but contains 18 records; discrepancy retained, not repaired.

The three-repository onboarding and all three repository entry surfaces were reviewed. HSH_RESOURCES is private research infrastructure, not a public cross-link target. Public HsH work must cite original external sources or public-safe extracts, never depend on private HSH_RESOURCES URLs.

### Enheduanna historical remit

- `WORKSPACES/ENHEDUANNA/README.md`: `d8e170b8169531cfb8f29a1b2c753b4f500189e9`.
- Source-layer census: `8d6b08dac9e169f529f1b43cbd8c3cbf0cc78478`.

Both explicitly say no standalone Nathan-authored specialist charter has been recovered. The only located direct instruction is broad archive consideration. The raw historical identity/thread remains unauthenticated.

### Mersearch and branch controls

All four current Mersearch request lanes remain occupied/requested. The twelve expected request-scoped `RUN_MANIFEST.json`, `SEARCH_RECEIPT.json`, and `SEARCH_RECEIPT.md` paths were checked and were not found. No live Mersearch action was available in this runtime. Direct GitHub code search was therefore used only as a bounded fallback; it is not an exhaustive Mersearch result. No request was overwritten, retriggered, or replaced.

Existing Lean PRs and the infrastructure branch were checked before adding code. The existing `FORMAL_VERIFICATION` package and its GitHub Actions workflow were reused. No new package, external tool, fork, subscription, or expenditure was introduced.

The :24 automation remains enabled under the same task ID `6abda4c8eda88191bf23a6f2849e9a17` and exact hourly DTSTART/phase. The :36 successor remains enabled under `6a9f52b69ec08191b0a2ba24a074f781` and its exact hourly DTSTART/phase. No automation, task ID, schedule, or phase was changed; no sixth task was created.

## Historical source ledger: what is and is not recovered

### 1. Nathan Direct recollection, not a formula

Raw conversation:

- Title: `Minkowski Ring Analysis`
- Conversation ID: `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`
- Raw export blob: `56a84cb85d5c386efa4ea11d322d11e95e2c7703`

Direct user messages:

- `2bef9e5d-cf4d-4cb2-959f-218e032e5263`, 2026-10-21T06:32:15.993Z: “We’ve calculated the tension in the past on the worldtubes as something in the 10^44J neighborhood. If we add that in, plus a maximum bending — which is probably going to be derivable from (or at least ceilinged by) some kind of minimum momentum measure.”
- `a0e0be28-5bd8-45da-9991-1e075f09728d`, 2026-10-21T06:34:36.336Z: “Maximum bending energy has been calculated in the past… Yes, and, we should always be working Planck units. That should be part of the reorganization directive in the bedrock document.”

These are direct recollections and a research instruction. They do not contain the remembered maximum's equation, assumptions, source date, or numerical value.

The intervening assistant statement at 2026-10-21T06:33:19.408Z cites an archive tension of about `1.2×10^44 N` and corrects the unit to newtons. That is assistant interpretation, not a substitute for the user's direct `10^44 J` wording. The conflict remains unresolved; do not silently replace J with N or vice versa.

### 2. Archive parameter records have incompatible dimensions

The SAT archive snapshot was searched at commit `521952bbe6ad078f9462b83cf7d7387a1630d993`.

| Source | Blob SHA | Recovered content | Status |
|---|---|---|---|
| `SAT METRICS — Basic.txt` | `6b0a0f6a45008e69262e702e6f3a5ba1e3921518` | `T≈1.2×10^44 N`; `κ≈1×10^-26 kg·m²/s²` (= J); `ε≈2×10^-21 m`; `ℓ_f≈0.7937 fm` | Short archive note; source date/author not stated in file |
| `Dim.txt` | `8f019606e52cbc8e45bd7638395f994777a3a446` | Proposed `κ_max∼1/(2ℓ_0)`, with `ε≥1/κ_max`; also carries `ε≈2×10^-21 m` and `ℓ_f≈0.7937 fm` | Archive derivation/diagnostic; not a measured curvature bound |
| `SAT 2026 PRE HsH/SAT 2026 — Unifall.txt` | `a9cf72582168f41dd8ae0d6e840ec0e0345bbe17` | `κ≈m_0 c² ℓ_f` | Assistant-era synthesis; this `κ` has units J·m |
| `Filament onto.txt` (archive path returned by the contents API; the root index also lists a similarly named `SAT THEORY — Filament onto.txt`, but that exact path returned 404 and is not inferred to be the same file) | `a13c67ff2b47cf178672804d91771e01d4c4a3e1` | Mixed-source text includes “10^44 Jules per filament tension” language and a maximum-collapse discussion, but no authenticated numeric maximum derivation | Unbylined composite; not a verbatim Nathan Direct source |
| `2026/AUDIT CYCLE 1-7.txt` | `c0d24191c7691ddbdb7ed67f5452f523f5801e91` | `E_bend∼(κ/2)∫||H''||²dλ`; explicitly notes no stress-energy coupling `T_{μν}[H]` or linearized metric coupling | Assistant audit/synthesis; functional remains internal, not an observable physical energy |

The old symbol `κ` is not dimensionally stable across these records: J, J·m, and N conventions appear in different artifacts. They cannot be combined into one energy calculation without resolving the source and convention. The `10^44 J` direct recollection and the `1.2×10^44 N` archive entry remain distinct.

### 3. Recovered kink-energy normalization is not the maximum

HsH assistant-era NLM material:

- `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt`, blob `33785afb8d46804122d79056b952169f99b325e2`.
- `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/MACHINE1.py`, blob `6b0d229108186861bda48c54472cacb60afd9dc5`.
- `🔑/B_IS_INVERSE_REFRACTIVE_INDEX.md`, blob `8946e37a6e3b07a7d1f89e6f95c64769e96b0855`.

These contain a sinusoidal-kink functional of the form

[
E_{kink}=\frac{κ}{2}\int_0^{ℓ_f}|H''|^2dλ
=\frac{κ(2π)^4ε^2}{4ℓ_f^3},
]

with the stiffness then defined by inversion so that

[
κ=\frac{4m_0c^2ℓ_f^3}{(2π)^4ε^2}
\quad\Longrightarrow\quad E_{kink}=m_0c^2.
]

The archived output `8.1871×10^-14 J` is therefore the selected mass-anchor rest energy by construction, not an independently predicted maximum bending energy. The Python artifact describes itself as an algebraic calculator, not a validation. This is assistant reconstruction, not a Nathan Direct derivation or physical measurement.

### 4. Earlier finite-core functional and later formal maxima

The raw `Meridian Free Build` conversation, blob `7af1561b321f4d9364da5eb111df689efc652827`, contains an assistant-derived finite-core model with a bending functional proportional to

[
E_b\propto E_4a^5\int κ^2 ds
]

and a torsional functional proportional to

[
E_t\propto G_4a^5\int |ω|^2ds.
]

This is a provisional finite-core model, not a maximum calculation or independent physical result.

The later Meridian recovery note, `WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_NLM_BENDING_ENERGY_RECOVERY.md`, blob `6c7e1a8843632f766151df0d466d1ab3f5f85b4e`, explicitly records that the remembered historical maximum was not positively located.

Ravel's arclength-gate report, `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-bending-arclength-gate-20261023t08z-001.md`, blob `d72b16f40b6cd6a6b30a016e17870e38ba405ebb`, later computes formal maxima for a historical harmonic ansatz. Those maxima are not physical: the parameterized harmonic is not unit-speed and the required arclength constraint is not enforced. The report also gives a conditional reach-style bound

[
E_b\le \frac{B_{line}L}{2a_{core}^2},
]

but only if fixed arclength (L) and the pointwise curvature ceiling (κ(s)\le1/a_{core}) are assumed.

The original `RMS Spacetime Filaments.txt` (`0323682e7a49278b5a76d0c6a5a7787a13eb17d6`) is a qualitative overview of filaments, mutual tugs and time-surface interaction, not a constitutive energy law. `SAT ALL TOGETHER SYNTHESIS.txt` (`86cf006ca5ebf58263552c7515a9c9d575caae37`) contains a qualitative generative ordering: mass ratios belong in worldline geometry, with filament-timesheet mutual distortion derived from those rather than vice versa. This is a historical synthesis statement, not a defined map or proven equation.

**Source-recovery conclusion:** the specific prior maximum recalled by Nathan remains unlocated. Recovered objects are (i) an unresolved direct `10^44 J` recollection, (ii) a separate archive `1.2×10^44 N` tension entry, (iii) a proposed curvature ceiling, (iv) multiple dimensionally inconsistent `κ` conventions, (v) a normalized kink energy equal to (m_0c^2) by construction, (vi) a finite-core bending functional, and (vii) a later formal but non-arclength-constrained harmonic maximum. None is the authenticated remembered physical maximum.

## Conditional Lean formalization

A new draft PR was opened against the existing Lean infrastructure branch, not main:

- PR: #1455 — Enheduanna: conditional curvature-capped bending-energy bound.
- Branch: `research/enheduanna-bending-energy-bound-20261107t1524z`.
- Base branch: `infra/lean4-verification-20261023`, base SHA `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- Latest source commit after correction: `c330f5d28bb3b41cb9a17bc70751563c5357f274`.
- Module: `FORMAL_VERIFICATION/HsHVerification/EnheduannaBendingEnergyBound.lean`.
- The module is wired into the existing library aggregator. It is a draft, unmerged, and does not alter main or another worker's PR.

The formalized functional is

[
E_B=\frac{B}{2}\int_0^L κ(s)^2ds.
]

Under explicit assumptions (B\ge0), (L\ge0), continuity, and (κ(s)^2\le K^2) on ([0,L]), the theorem proves

[
E_B\le\frac{BLK^2}{2}.
]

A reach-style corollary substitutes the *assumed* ceiling (κ(s)\le1/a). A constant-curvature scalar function attains the bound, establishing sharpness only in the unrestricted scalar-function class.

CI history:
- Run #42389823456 failed because the continuity integrability theorem was not applied to interval endpoints.
- Commit `c330f5d28bb3b41cb9a17bc70751563c5357f274` supplied the endpoints, but run #42390279872 then failed because the interval-integrability function application needed parentheses.
- Commit `606e5a012139d12b411a43ca1ab960fc09f940c0` parenthesized the interval-integrability proofs and uses `continuous_const.intervalIntegrable 0 L`.
- **Corrected run #42390677035: SUCCESS.** Job #128457402086; merged test ref `80ad815d85c71054f61d1bbfdb29e18d5b49bdee`; Lean 4.34.0; Lake 5.0.0; Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`; full `lake build` completed successfully (8,945 jobs).
- The new module built as `HsHVerification.EnheduannaBendingEnergyBound`. Its `#eval` arithmetic sanity check printed `48`.
- `#print axioms` for `bendingEnergy_le_of_curvature_bound`, `bendingEnergy_le_of_reach_radius`, and `constant_curvature_saturates` returned only `[propext, Classical.choice, Quot.sound]`; **no `sorryAx`** appeared for these theorems.
- The workflow ran `lake build` only. Tests, lint, nanoda, and the global axiom audit were disabled/skipped in the existing workflow.

The conditional mathematical module is now successfully compiled and executed in the recorded CI environment. Lean verifies only the formalized conditional statements. It does not prove the source-to-formalization translation, derive the curvature ceiling, establish physical arclength, supply a constitutive law, validate a worldtube map, or recover the historical maximum.

## CODATA source/version audit

The current public NIST recommendation page still identifies CODATA 2022, version 9.0, as the latest published recommended set. The 2022 adjustment paper explains that the 16 input measurements of (G) are treated in a separate weighted-mean calculation, with three correlations among input pairs and a 3.9 uncertainty expansion factor to account for scatter. (G) is treated separately from the other constants; that does not mean all 16 (G) inputs are mutually independent.

Recommended value: (G=6.67430(15)×10^{-11}\,m^3kg^{-1}s^{-2}), with the published relative standard uncertainty rounded to (2.2×10^{-5}).

The `2.2474×10^{-5}` value in the existing Double Pulsar supplement is the quotient of the rounded table entries (0.00015/6.67430). Hale's existing table-level reconstruction gives approximately (2.2141×10^{-5}). Both round to the published (2.2×10^{-5}); this is a precision-label qualification, not a discrepancy. The existing CODATA/NIST and Double Pulsar submissions already cover the substantive evaluation. No new public issue is warranted.

No H(s)H prediction of (G) is currently defined. No numerical H(s)H-versus-CODATA comparison was performed.

## Existing measured-system candidate status

Aster's 2026-11-06 evidence delta (`WORKSPACES/ASTER/2026-11-06_CODATA_NIST_G_EVIDENCE_DELTA.md`, blob `64e3e5fd46faa63f971f0da159af53db726a3aaa`) and the existing Hale, Ravel and Morrow submissions already document the 2026 NIST BIPM torsion-balance candidate. It is a concrete finite-support/rotation geometry-to-torque system, with four final configuration estimates, a published 4×4 correlation matrix, and a Bayesian hierarchical dark-uncertainty model whose prior is centered on CODATA 2022. It is not part of CODATA 2022, and eligibility for a future adjustment is not evidence of inclusion. No public raw torque time series or machine-readable CMM geometry was located. The 2026-11-05/06 CODATA meeting working documents were login-gated in Aster's audit. No new raw data, H(s)H map, P2 selection, or duplicate issue was created in this run.

## Project gates and physical evidence

- Code Grurple: P0 ACTIVE.
- November 9 P1: Orson-owned; no work displaced.
- November 30 P2: HOLD.
- December 14 P3: separate full-theory gate.
- Task graph: 16 declared / 18 actual records; discrepancy not modified.
- FIE: last full review October 27; next review due November 10. No full FIE rereview performed today.

No measured system, dataset, provenance-complete physical calculation, calibrated parameter, independent prediction, fit, holdout, or null result was generated. No new CODATA comparison, no SAT-O/Blockwave equation alteration, no BEDROCK promotion, and no paper-gate advancement.

## Unrelated reading break

Read 40 lines, 1281–1320, of Charles Babbage, *Reflections on the Decline of Science in England*, in the existing HSH_RESOURCES archive. Next return cursor: **line 1321**. This was an unrelated reading break, not physics evidence. The source's archive text was read at the stated line extent; no larger reading claim is made.

## Next useful work

1. Check corrected Lean CI run #42390279872. If it fails, inspect the exact diagnostic and fix only this draft branch; do not claim proof until the full build succeeds and axiom output is clean of `sorryAx`.
2. Continue source recovery for the specific historical maximum, with Mersearch first when a lane is available. Search original source nodes and equation provenance, not more assistant summaries.
3. Resolve the historical `κ` dimensional conflict and the direct `10^44 J` versus archive `1.2×10^44 N` distinction before any physical energy calculation.
4. Do not calculate a numerical maximum until the source-authorized stiffness, arclength/length, curvature bound, and physical worldtube-to-observable map are recovered.
5. Do not create a new public issue for this source audit; the existing CODATA and bending-gate submissions already cover the public material. Keep PR #1455 draft pending review.

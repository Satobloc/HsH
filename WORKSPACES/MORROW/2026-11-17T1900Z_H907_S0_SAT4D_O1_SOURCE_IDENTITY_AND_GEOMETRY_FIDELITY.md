# Morrow h907:s0 | SAT4D O1 source identity and geometry-fidelity correction

**Nominal slot:** 2026-11-17T19:00:00Z  
**Run key:** `REVROT3-19-20261011:907:s0`  
**Selected ring identity:** Morrow, index 13  
**Next ring identity:** Kestrel, index 14  
**Status:** source-custody addendum; no theory integration, physical calculation, CODATA scoring, or BEDROCK promotion.

## 1. Scope, authority, and access

The live HsH main branch, BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3, active task roster, task graph, recent receipts, and Morrow README/BOOT/CURRENT_WORK/INBOX/TRIAL_CHECKPOINT were inspected.

Morrow's historical remit remains Team Archivist / source custody. The recovered direct-user role history records the Team Archivist appointment, the September 13 theory stop, and a later archive/maintenance trial invitation. The later invitation permits source comparison, chronology/provenance work, theory-material reading/note-taking, and mathematical/equation checking; it does not itself lift the theory stop. No authenticated current Morrow thread was established. This is assistant-level source-grounded work, not participation by the historical Morrow instance.

Mersearch was not executable in this runtime. The four canonical request lanes were independently read and remain `requested`:
- Lane 1: `calder-angle-geometry-source-fidelity-20261102-1337`
- Lane 2: `archive-harvest-20261025-optics-01`
- Lane 3: `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
- Lane 4: `kestrel-finite-core-geometry-source-fidelity-20261102-2200`

No request was overwritten or retriggered. No local pinned Mersearch checkout was available. GitHub retrieval from HsH and the SAT archive was therefore a bounded fallback, not a Mersearch run or exhaustive three-repository search. HSH_RESOURCES was limited to its root README; no private research payload was opened.

## 2. New source-custody result: SAT-O1 is duplicated inside the live draft

Two distinct SAT archive artifacts were fetched from their current paths:

| Artifact | Source status | File-index dates | Git blob SHA-1 | Recorded SHA-256 |
|---|---|---|---|---|
| `SATOBLOC/SAT O1 4D.txt` | Unbylined historical file | created 2025-06-07 08:38:16; modified 2025-06-09 18:44:50; imported 2025-10-27 23:18:35 | `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937` |
| `SATOBLOC/SAT4D_LIVE_DRAFT.txt` | Document-level byline: Nathan McKnight; header June 2025; explicitly marked DRAFT / development bible / theory to be redeveloped | created 2025-06-08 18:40:32; modified 2025-06-09 18:53:29; imported 2025-10-27 23:18:35 | `2a79fe25018cce7e99a2c33786d88b0551db6ae7` | `c3f90cdeda667f20c7ab9ab33eea2e23c5245d94c1e4f99f3aec5e3e7f1f6cb7` |

The O1 module occupies lines 133-207 of the live draft. The standalone O1 file has 75 lines. After normalizing line endings, removing the two different section-heading strings, and trimming per-line outer whitespace, all 58 nonblank O1 body lines match exactly.

This establishes that the live draft's O1 module is a duplicate of the standalone O1 body, not an independent second mathematical witness. The complete files are not identical. The file-index timestamps are consistent with the standalone O1 file existing before its body was incorporated into the larger draft, but these index timestamps do not prove the direction of copying or equation-level authorship.

The document-level byline on the larger draft does not establish that every equation in it was authored directly by Nathan. Although the file title uses `Canonical Summary`, the body labels it a DRAFT, development bible, and theory to be redeveloped; the draft status controls. The archive's June 8 NotebookLM entry labelled `SAT4D: Emergence from Filament Topology / 1 Source` is an index clue, not a raw authoring conversation or independent corroboration. No raw conversation that independently establishes the O1 equations' authorship was recovered in this bounded pass. The file-index timestamps are filesystem-index evidence, not an authenticated authoring log or Git commit history.

## 3. Original O1 equations, unchanged

The following strings are retained from the historical O1 source. They are not corrected or silently rewritten here.

```tex
\gamma^\mu(\lambda) =
\left(\lambda,
A_x \sin(k_x\lambda+\phi_x),
A_y \sin(k_y\lambda+\phi_y),
A_z \sin(k_z\lambda+\phi_z)\right)

v^\mu(\lambda) = \frac{d\gamma^\mu}{d\lambda}

S[\gamma] = \int d\lambda\,L(\gamma^\mu,v^\mu)

L = \frac{1}{2}m v^\mu v_\mu - V_{\text{tension}}(\gamma)
```

The standalone file and the copied live-draft O1 section contain the same body. Their different headings do not make them independent sources.

The Blockwave attachment remains a separate source object, not a Nathan-Direct equation set merely because it was user-supplied. Its embedded authorship is unresolved. The original attachment event is recorded as 2025-09-16; the earliest accessible HsH repository copy is 2025-09-18. Its blob SHA-1 is `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; recorded SHA-256 is `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`.

Verbatim central Blockwave strings, preserved separately:

```tex
J^{\mu\nu} = \frac{1}{2}\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma

\nabla_\mu J^{\mu\nu}=0

A_\mu(\theta)=\alpha_*\nabla_\mu\theta

F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta)
```

The original equation custody and earlier local-exactness analysis remain in the [Morrow h888 source-custody report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MORROW/2026-11-17T0000Z_H888_S0_LANE00_SOURCE_CUSTODY_AND_GEOMETRY_FIDELITY.md) and [public issue #1865](https://github.com/Satobloc/HsH/issues/1865). No original equation was changed.

## 4. Cross-version geometry: what is and is not mapped

### June 2025 O1 artifact

The displayed object is a one-parameter curve `gamma: R -> R^(3,1)`. The surrounding prose describes a worldtube as a four-dimensional volume swept out by a vibrating filament. The displayed curve alone does not define that volume. No cross-section, normal-bundle thickening, sweep parameter, or embedding map from the curve to the claimed 4D support is supplied in the O1 module.

This is a source-level type/map gap, not a claim that the proposed worldtube is impossible.

### July 2025 SAT4D glossary and directives

`SAT 4D Theory Work/SAT4D_4.txt` is a separate July 2025 document, bylined `SATO.4D Coherence Project`, blob SHA-1 `efc88f4523b2fd616e64898737c2aa45e5f39b9a`.

It defines:
- `M` as a smooth 4D manifold, with no metric, gauge field, or connection assumed a priori;
- `gamma: R -> M` as a 1D filament;
- `Sigma_t` as a propagating 3D wavefront;
- `u^mu` as a local normal time-flow vector;
- `theta4` as a misalignment angle;
- `S_{mu nu} = nabla_mu u_nu + nabla_nu u_mu` as a strain tensor.

The last definition requires a connection for the covariant derivative and a metric or other specified lowering map to obtain `u_nu`. Those structures are not supplied by the glossary's opening declaration that no metric or connection is assumed a priori. This is an internal definition gap in that historical document. It is not repaired by silently importing a metric or connection.

`SAT 4D Theory Work/SAT4D_6.txt` is a separate, unbylined July 2025 directive document, blob SHA-1 `167136310cdf33ca8f986f33634692314c1a0946`. It says derived behaviors must emerge from filament geometry and intersection with a propagating 3D wavefront, prohibits unstated assumptions, and marks material outside the clean core as tentative. It does not supply the missing metric, connection, or thickening map.

### Assistant reconstruction

`SATOBLOC/SAT4D_MATHEMATICAL_BACKBONE.txt`, blob SHA-1 `6e387df84ef93d8308795020f4cb4fa286a41feb`, opens as a synthesis "based on the provided sources." It introduces an ensemble co-metric `g-tilde_{mu nu}=<v_mu v_nu>`, an inverse metric, an emergent connection, scalar fields, and additional field equations. These are assistant-level reconstructions or proposals, not independent source witnesses. The artifact does not provide the missing source-authorized map from the O1 curve to a 4D tube, nor does it derive the glossary's metric/connection dependencies from the stated no-a-priori-structure condition.

### November 2026 direct geometry

The November 8 direct-source cluster is conversation `6aecede1-4c08-83e9-abc4-da64f59a4f51` (raw export SHA-256 `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d`). User message `bcbe9ee8-b621-4a40-9edb-b34c17783be5` (2026-11-08 18:05:28.410Z) describes a 4D tube around a 1D core, a 3D boundary, and a mouth opening onto the timesheet. User message `f9356192-0ec6-4a9c-ab53-ab76bf75c42e` (18:36:17.730Z) says pair-of-pants is one particular split, not the generic geometry, and keeps Horned Sphere / 4D-3D-2D correspondences as proposals. Another direct message, `c0520975-02a0-408f-a250-364b88ab7b30` (20:18:10.172Z), distinguishes spatial `w` from proper time `t` and leaves the global toroidal/Crullerverse proposal tentative. These are later Nathan-Direct source materials, not retroactive definitions of the June 2025 O1 map. They do not supply a map from the O1 `R^(3,1)` action to the later positive-signature spatial-`w` description. The source distinction is preserved in the h888 report.

## 5. Original versus translated propositions

| Source proposition | Historical translation or inference | Fidelity result |
|---|---|---|
| O1 displays a 1D curve in `R^(3,1)` | The curve is treated as if it already defines the full 4D worldtube | Missing thickening/sweep map |
| O1 prose calls the worldtube a 4D swept volume | The later 2026 tube-around-core geometry is read back into O1 | Version conflation; no source map |
| Standalone O1 and live-draft O1 lines match | Hold as separate corroborating sources | Duplicate witness, not independent confirmation |
| July glossary says no metric/connection a priori | Its strain tensor uses `nabla` and a lowered vector index | Internal structure dependency is unstated |
| July directives prohibit unstated assumptions | Assistant backbone presents emergent metric/connection as derived | Derivation and source lineage are absent |
| Live draft carries a document-level byline and AI-assistance context | Every equation is attributed to Nathan Direct | Authorship overreach |
| June O1 uses `R^(3,1)` and a metric contraction | Current 2026 `++++` / spatial-w geometry is substituted | Representation map missing; keep versions separate |

## 6. Mapping diagram and formalization status

```text
June 2025 O1:
  gamma^1 in R^(3,1)
       |
       |  thickening / cross-section / sweep map NOT DEFINED
       v
  claimed 4D worldtube T^4

July 2025 glossary:
  M^4 + gamma^1 + Sigma_t^3 + u^mu + theta4
       |
       |  metric, connection, and angle convention NOT FULLY DEFINED
       v
  S{_mu nu} and derived geometry

November 2026 Nathan Direct:
  1D core gamma^1 -> 4D tube T^4 -> 3D boundary
                                       |
                                     | possible mouth/gluing map OPEN
                                     v
                                  3D timesheet Sigma^3
  optional 2D worldsheet W^2; reduction/projection map OPEN
```

**Proof-first disposition:** `FORMALIZATION_BLOCKED_SOURCE_MAP_AND_STRUCTURE`. The exact O1 text comparison is a source-custody result, not a Lean proof. The geometric curve-to-tube map is not defined by the historical source, and the July glossary does not supply the missing metric/connection contract. Existing PR #262 formalizes the separate 2024 helix/moving-plane construction; it does not prove the 2025 O1 tube construction. No source-defined projection, thickening, or composition map exists to admit as a faithful Lean target. No new Lean theorem or build was warranted from the source as currently typed. No compilation, counterexample search, observational validation, or physical calculation is claimed.

No corrected O1 or Blockwave equation is proposed. The original equations remain unchanged; missing dependencies and maps are recorded separately.

## 7. Operational and campaign state

- HsH default branch: `main`, observed head `aadaf288e21f7a6f484903081cdcc8df064c8932`.
- Task graph: 16 declared branches / 18 records; 5 completed, 12 active, 1 blocked. No graph edit.
- Existing :00 Archive task ID `6aa1fe0de5e48191b886496095b1343f` remains enabled with its exact stored hourly recurrence: `DTSTART;TZID=America/New_York:20261001T140000`, `RRULE:FREQ=HOURLY`, phase :00. No task, ID, cadence, phase, or prompt change; no sixth task. The :12 lease remains disabled.
- Tern's slot-attribution correction [issue #1917](https://github.com/Satobloc/HsH/issues/1917) records the current h907:s0 Morrow run as `e3dda9aa-8568-8323-b381-db7ddd6eba33`, started 2026-11-17T19:01:38.282352Z, `IN_PROGRESS`, `chat_ref=null`; the cached latest-result pointer was stale at that readback. This is scheduler evidence, not authenticated Morrow-thread participation.
- Next ring label Kestrel is the disabled :12 phase. The next enabled :24 phase selects Meridian. No handoff or response obligation was created.
- P0 remains ACTIVE; P1 cognition remains Orson-owned and OVERDUE / NOT READY; P2 remains HOLD; P3 remains INCOMPLETE. FIE review is next due 2026-11-24. No November 9, November 30, or December 14 paper gate advanced.
- Morrow's unrelated-reading cursor remains Okakura, *The Book of Tea*, line 1352. No new reading quantum or physical break is claimed in this source-custody pass.
- No new tool, fork, subscription, expense, branch, PR, equation correction, physical calculation, CODATA scoring, theory integration, or BEDROCK promotion.

## 8. Next deeper cursor

1. Recover the actual authoring source or raw conversation for the June 2025 O1 module, if one exists; do not treat the NotebookLM one-source index as a conversation.
2. Search for any Nathan-Direct definition of the 3D cross-section or thickening map from `gamma^1` to the claimed `T^4`.
3. Recover the metric/connection decision and the representation map between the June `R^(3,1)` action and the later positive-signature 4D spatial description.
4. Keep the November 2026 tube-around-core construction separate until a source-authorized map connects it to O1.
5. Only after those definitions exist should a source-faithful Lean target be admitted.

**Final disposition:** `H907_S0 / MORROW_SOURCE_CUSTODY / O1_BODY_IDENTITY_VERIFIED_AFTER_HEADING_NORMALIZATION / FILE_DATE_ORDER_NOT_AUTHORSHIP / JULY_GLOSSARY_METRIC_CONNECTION_GAP / CURVE_TO_TUBE_MAP_UNDEFINED / NO_NEW_LEAN / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION / TASKS_UNCHANGED`.

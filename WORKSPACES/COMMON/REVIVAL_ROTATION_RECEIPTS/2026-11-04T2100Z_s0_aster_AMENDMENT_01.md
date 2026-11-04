# Aster h597:s0 receipt amendment 01 — expanded IRI provenance and native-geometry context

**Run key:** `REVROT3-19-20261011:597:s0`  
**Ring selection:** h=597; seq=5h=2985; 2985 mod 19 = 2; selected label Aster (index 2); next label Ariadne (index 3). The labels are deterministic routing only, not authenticated ChatGPT instances or threads.  
**Amendment type:** internal source/provenance supplement to the existing h597 receipt. The original receipt and public issue #1366 remain unchanged.

## 1. Additional primary-source context for the 2026-10-21 curvature statement

Raw source: *Meridian Minkowski Ring Analysis*, conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, raw Git blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`.

The raw role graph confirms these user-role messages are on the same ancestor branch leading to `59cdedb4-be76-455a-87c8-a6089de951b3`:

- `f658b2db-32f0-45cd-828b-140691cc9afb`, 2026-10-20 23:53:30Z: expanding-Minkowski rather than purely linear Minkowski; a small slice may be approximately equivalent; the 4D curvature of the donut is proposed as acceleration; bending may occur without expansion; explicitly labelled a working hypothesis with no proof.
- `090f5160-1020-486d-9c42-df3d7dff2063`, 2026-10-21 00:17:23Z: the earlier back-hallway programme remains, but its “corridors” are mathematical/metaphorical. The older reciprocal filament/timesheet description is explicitly said to be no longer the current approach since the Klein Fabric model became common.
- `2bef9e5d-cf4d-4cb2-959f-218e032e5263`, 2026-10-21 06:32:15Z: recollection of a prior worldtube-tension calculation near (10^{44},mathrm J), plus a possible maximum-bending ceiling related to a minimum-momentum measure. No source calculation, dataset, units convention, uncertainty, or derivation was recovered in this pass.
- `c600f65f-4e3b-480f-bfce-304ffd1ad49c`, 2026-10-21 06:34:56Z: says to work in Planck units and incorporate that into the Forest reorganization directive.
- `c5525f53-b7cc-4444-8102-3bf6fdb1c892`, 2026-10-21 13:55:40Z: states the native conventions `cw=t`, Forest Normalization, and `(++++)`; the accompanying expansion-rate expression is tentative.
- `c8ce3474-de6e-4c00-b307-00c7de0724e6`, 2026-10-21 14:06:39Z: says simultaneity is approximate and varies with altitude above mass.
- `59cdedb4-be76-455a-87c8-a6089de951b3`, 2026-10-21 23:53:03Z: directly states, “3D rotation absolutely is 4D curvature. All 3D acceleration is.”

This context tightens, but does not complete, the source interpretation. The 2026-10-21 assertion is a direct statement, but it does not name a curvature tensor, define the material-flow object, define an affine parameter, or supply the slice/readout maps. The earlier `f658` message explicitly marks the donut-curvature/acceleration relationship as an unproved working hypothesis. The later statement is stronger wording, but it does not itself supply the missing mathematical definitions.

The earlier filament/timesheet reciprocal construction must be retained as historical context, not silently treated as the current Klein Fabric architecture. The direct `090f` correction is material to that chronology.

The direct `59cd` message's immediate parent chain passes through an assistant Householder-metric calculation and retrieval of an Alberr sandbox. Its only text-bearing assistant descendant is commentary `e26ef2c0-c360-46ee-8444-72f9a34ec044`; that commentary interprets the claim as material-history/worldtube bending rather than necessarily ambient Riemann curvature. There is no final assistant answer or direct user confirmation in that raw branch. That interpretation remains assistant reconstruction.

## 2. IRI source and code provenance: additional recovery

The phrase family “worldtube bending is acceleration / resistance is inertia / angle is speed / helicity is orbit or oscillation” appears in flattened `KEY CONCEPT - IRI.txt` material. The raw role graph for that IRI conversation was not recovered.

Verified copies and objects:

| Object | Path | Blob | Finding |
|---|---|---|---|
| Flattened IRI text | `DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/KEY CONCEPT - IRI.txt` | `ba94d51313fb94fb6af69cb76ccfc84141838abe` | No role graph |
| Second IRI text copy | `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/KEY CONCEPT - IRI.txt` | same `ba94d51313fb94fb6af69cb76ccfc84141838abe` | Byte-identical duplicate, not independent corroboration |
| Curated key | `🔑/B_IS_INVERSE_REFRACTIVE_INDEX.md` | `8946e37a6e3b07a7d1f89e6f95c64769e96b0855` | Derived key document, not raw role source |
| Model wrapper | `DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/MACHINE1.py` | `6b0d229108186861bda48c54472cacb60afd9dc5` | Embedded script wrapper; same blob as `MOSTLY_EARLY_NLM/MACHINE1.py` |

The GitHub upload commits list Nathan as the committer/uploader for these files. That metadata does not establish authorship of every embedded passage or code block. `MACHINE1.py` is visibly a wrapper containing `script = r'''...’’’` and writing an embedded `sat_model.py` to `/mnt/data`; it is not itself a raw conversation export or an equation-catalog original. The referenced “your file” from the flattened IRI exchange was not independently located.

Static code inspection finds:

- `B0 = 3/(4*pi)`.
- `B_eff` is one scalar, either `B_override` or `B0*(1+delta_lattice)`; there is no (Q)- or topology-indexed state.
- `theta_12 = B_eff*(1-B_eff^2)`.
- `hbar = m0*c*ell_f*B_eff`.
- The mass-linear method hardcodes `Q = 1.0`.
- `lambda_s = lambda_s_hat*kappa/ell_f**4` is explicitly described in the code as a modeling convention, not an equation from the source catalog.
- The model is static; it contains no collision/dynamical response or observable map for the proposed worldtube bending response.

The flattened IRI text contains a direct-looking proposal that (B) should vary with (Q) and topology: a lepton-level fixed point, rules for (Q=2,3) bundling, atomic-scale braiding dependence, and a bulk-averaged limit. Because the role graph is absent, retain this as **FLATTENED_TEXT / ROLE_UNVERIFIED**, not Nathan Direct. If that proposal is later authenticated, the scalar `B_eff` implementation is structurally insufficient to represent it.

The same flattened text includes an assistant-authored kinematic comparator identifying worldline curvature with proper acceleration and worldline angle with rapidity. That is not the same as a source-defined map from the native all-plus Cruller geometry to an effective metric or an empirical (B(Q,mathrm{topology})) law. The phrase “angle is speed” has no source-defined rapidity/Euclidean-angle convention in the recovered raw branch.

No historical script was executed in this pass. The transcript's old output used a selected (ell_f) chosen to make its (hbar) relation match; it is historical output, not a fresh calculation or independent validation. No CODATA scoring, fit, prediction, or physical calculation was performed.

## 3. Geometry map and discrepancy ledger

```text
Native construction M⁴, G₊ (++++)
   ├─ material labels / flow (not recovered)
   │    └─ marked histories Xₐ(λ) and finite-core worldtube W (not defined)
   │          └─ material-history curvature κW
   └─ approximate, altitude-dependent simultaneity family Σt
        └─ W ∩ Σt
             └─ projection/readout Pt (not defined)
                  └─ observed x(t), aobs

Separate assistant proposal:
unit director u → geff = G₊ − 2u⊗u, signature (−,+,+,+)
native-to-effective map: missing

Flattened IRI proposal, role unverified:
B(Q, topology) → worldtube bending response relative to timesheet medium
current MACHINE1 implementation: scalar B_eff, no Q/topology map, no dynamics
```

Keep distinct:
- material-history curvature (kappa_W);
- ambient Riemann curvature (R[G_+]);
- effective-metric curvature (R[g_{m eff}]);
- slice extrinsic curvature (K);
- moving-frame connection curvature (F);
- readout acceleration (a_{m obs}).

The Householder expression (g_{m eff}=G_+-2uotimes u) for unit (u) has a Lorentz-signature ((-+++)) layer. Nathan Direct's recovered native convention is ((++++)). No source-defined map identifies these metrics. A fixed affine slicing in the Euclidean lift is a useful conditional control, but it does not encode the direct approximate, altitude-dependent simultaneity family.

## 4. Formalization status

Existing PR #1245 already formalizes the conditional Euclidean lift (X(w)=(x(w),w)), its Gram-determinant curvature reduction, and a circular-helix specialization. Its Lean 4.34.0 / Mathlib GitHub Actions run #41410202260 completed successfully on the PR merge reference (job #125161268669; 8,945 build jobs). The PR remains OPEN / DRAFT / UNMERGED; no exact-head-only build is established, and the separate tests, nanoda, and automated axiom audit were skipped. The theorem-specific `#print axioms` records contain standard dependencies and no `sorryAx` or `admit`.

This proves only the exact conditional mathematical statements in that assistant-authored Euclidean tuple model. It does not prove the native Cruller embedding, the finite-core worldtube, the altitude-dependent slicing, the Householder-to-native map, the IRI (B(Q,mathrm{topology})) proposal, or a physical inertia law. No new Lean module or CI run was created. Source-native formalization remains **FORMALIZATION_BLOCKED_DEFINITION**.

## 5. Mersearch, continuity, and controls

- All four Mersearch request lanes remain occupied. The request-scoped output directory had no manifests or receipts at this check. No Mersearch execution is claimed. Bounded GitHub searches were performed across HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES as fallback; no request lane was overwritten or retriggered.
- The exact IRI raw role graph remains missing. Do not infer it from the flattened text, the duplicate copies, the key summary, or uploader metadata.
- The existing h597 public artifact is issue #1366. The first publisher issue #1365 was rejected with “SHA-256 mismatch”; #1366 is the corrected accepted publication. No additional issue or public artifact was created by this amendment.
- Aster's historical workspace states its primary lane as Nathan Direct corpus/provenance. Its raw historical export contains 39 user messages; direct messages `d15369d1-1412-4f4a-9460-702d2de573ea` and `01505af7-37cd-491f-a951-1822934e36ff` preserve the source-fidelity questions and Paper A review assignment. Aster's current Paper A formal review remains FROZEN / cross-read OPEN; no review was reopened.
- Unrelated reading completed: Charles Babbage, *Reflections on the Decline of Science in England*, HSH_RESOURCES blob `fa52e41ab73566a13109a0a7aeaed3e895b41163`, lines 1161–1200. Return cursor: line 1201.
- FIE last full review remains October 27; fourteen-day rereview is due November 10, not yet due.
- Existing :00 task ID and hourly phase remain unchanged. No sixth task, task/ID/cadence change, branch switch, new branch, PR change or creation, signet, chat rename, theory promotion, Factory Floor admission, or paper-gate advancement. One internal receipt amendment was committed on the existing `main` branch.

## 6. Next deeper cursor

1. Recover the raw role-authenticated IRI conversation and the original file referenced by the flattened exchange.
2. Recover the actual source calculation for the recalled worldtube tension / maximum-bending ceiling, including system, provenance, units, uncertainty, and derivation.
3. Define native material labels/flow, the finite-core worldtube, the affine parameter, and the altitude-dependent simultaneity family.
4. Specify embedding, intersection, projection, and readout maps with domains, codomains, fibers, and composition conditions.
5. If the IRI proposal is authenticated, define `B(Q, topology)` and its measurable response before formalizing it.
6. Only then decide whether a source-faithful Lean target or real-data empirical test is defined.

**This amendment supplements the existing receipt; it does not change the published report, theory status, PR state, or scheduler.**

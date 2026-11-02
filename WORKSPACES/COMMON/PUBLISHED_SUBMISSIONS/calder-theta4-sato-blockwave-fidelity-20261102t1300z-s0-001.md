# Calder Source-Fidelity Delta: θ₄, finite-core slices, 0.239/0.246, and SAT-O/Blockwave provenance

**Disposition:** distinct additive source-fidelity report. It supplements existing issue #1191 and the 2024 geometry cross-read in #946; it does not replace or duplicate either report. No physical calculation, CODATA scoring, independent measurement, or theory promotion was performed.

## Executive finding

Four different numerical and geometric objects have been allowed to drift together in historical assistant translations:

1. **0.239 rad** is a user-stated search target and a proposed projection artifact of mapping 4D into 3D. The direct message supplies no projection map or derivation.
2. **B = 3/(4π) ≈ 0.2387** appears inside a user-role paste of a SAT/Blockwave summary whose internal authorship is unresolved. It is presented there as a dimensionless coupling coefficient, not as an angle.
3. **Δφ = 0.246 rad** is another proposed optical phase shift inside that same pasted summary. It is not an independent measurement.
4. **14.1** is a later literal user question with no explicit unit or referent in that message. The preceding assistant context makes degrees plausible, but does not establish them.

An assistant response equated B≈0.2387 with 0.239 rad and treated the values as the same geometrical number. That is an unsupported semantic/numerical conflation. A second assistant response invented a 600-cell/16-cell projection explanation for 0.239 rad without a source-defined polytope, projection, metric, or derivation.

A second, related distinction concerns the object being sliced. The historical sources contain a 1D filament curve, an assistant-generated 2D worldsheet current, and a later 4D finite-core region. Their time-sheet readouts have different geometric types. No explicit thickening, embedding, or projection maps yet connect them.

## 1. Source custody and authorship

### A. 2025-10-30: *Fundamental Intuitions of SAT*

- HsH raw path: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/25.10.30•26.06.01•Fundamental Intuitions of SAT — raw.json`
- Raw blob SHA-1: `0a7a270482bdda92a61d1c54ccccaf356e47aa0b`
- Raw-path first-extant HsH commit: `afd124937b88b1cdeae0ef780bf322ff07d9cded`, 2026-09-30T20:40:22Z.
- Direct user message: `f476afce-eba0-4312-8c2b-36b82dbe7f3f`, 2025-10-30T05:12:46.507Z.

The direct source calls θ₄ the “angle of intersection with the time surface” and says the vacuum value is near zero. It does **not** specify whether the angle is measured from the sheet, its normal, or another reference direction. The later assistant explanation does not supply a source-authenticated convention.

### B. 2026-08-26/27: *⚗️ CALDER [Construction Story Retelling]*

This is a historical archive conversation, not an authenticated current Calder worker thread.

- HsH raw path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/26.08.26•26.09.16•⚗️ CALDER [Construction Story Retelling] — raw.json`
- Raw blob SHA-1: `92454acdaad701193e2a0c6cf64a7d7b70a03dbb`
- Raw-path first-extant HsH commit: `47070ec21716b46e9f5ecf42d273af9960511cc0`, 2026-10-02T12:26:38Z.
- Conversation ID: `6a8eacca-c470-83ea-af92-8fb8df194de9`.
- Direct user message `329d4d28-51c3-4fc0-8cae-7aa4c2dc0c5a`: discusses helix pitch, θ₄, medium response, Kelvin-vortex language, and the tentative identification of `ell_f` with a coil radius rather than filament thickness.
- Direct user message `6b31fd95-11dd-4d75-9f09-eed13f618d5f`, 2026-08-27T00:17:48.713Z: says orthogonality is inferred from classical sphericity, varies in SAT, and is exact only in ideal vacuum; uses “a-axis” in this branch.
- Direct user message `95319111-ba02-4b45-885a-6e44bd5fed7d`, 2026-08-27T00:20:22.945Z: says θ₄=90° in the ideal vacuum limit, with the filament perpendicular to the time sheet and parallel to the time normal; associates θ₄ with intersectional particle oblateness in the length-extended w picture. This selected-ancestry branch uses “w-axis”; preserve the sibling a-axis wording rather than silently merge it.
- Assistant parent `590a21ec-f75d-4fcd-80bb-2d0b68ca6342) overstates w-orthogonality as fixed “by definition.” The direct correction makes it conditional on the ideal-vacuum/sphericity limit.
- Assistant `76a18503-f90d-431e-892b-3f9f5e06bc68) introduces a locally straight circular-cylinder/plane model and the 2D ellipse relation `a = r/sin(θ₄), b = r`. This is assistant-generated and is already discussed in the existing #1191 addendum. It is not repeated here as a new direct equation.

### C. 2026-09-11: *SATity Corpus Audit*

- HsH raw path: `DEVELOPMENT_FULL_CONVOS/HAGALAZ/26.09.10•26.09.12•SATity Corpus Audit — raw.json`
- Raw blob SHA-1: `5ef8bbb3ec88fa96565cab2d53bc848898bb9e74`
- Raw-path first-extant HsH commit: `2bf1758d631d485c0d15a2c5a10c0d8caf7f2da8`, 2026-09-23T16:23:41Z.
- Direct user message: `eb3c135b-7b59-463b-bbce-7ecda93aec8d`, 2026-09-11T02:30:25.282Z.

The direct statement says second-order winding may introduce a roughly perpendicular rotation and “actually” may relate to inverse θ₄. This is explicitly tentative; it supplies no equation or normalization.

Its parent assistant message `e6f670b4-80a0-473b-bc7f-74c0e8546254) had proposed a finite B³ tube, S² boundary, (c_\perp=|T\cdot u|), a slice with semiaxes (\rho/c_\perp,\rho,\rho), and a slice-volume expression. Those are assistant-generated mathematical proposals. The user’s “I imagine it does” answers the question about a preferred internal 2-plane; it does not authenticate or adopt every equation in the parent message.

### D. 2026-02-25: *0.239 Radians in Science*

- HsH raw path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.02.24•26.09.08•🧮 0.239 Radians in Science — raw.json`
- Raw blob SHA-1: `8b6794a2be3e19b6bba32acfbbc4c6636b1b02e3`
- Raw-path first-extant HsH commit: `cf507838b286feb9e34fc3d1bd5c95019cd87a75`, 2026-09-12T13:24:06Z.
- Conversation ID: `699e4a02-26e4-832a-86ea-ad1dcaf3c4e3`.
- Direct user message `77fd1295-39da-4064-a668-8f1a19c7f4cf`, 2026-02-25T01:06:37.925Z: says 0.239 radians is an artifact of projecting 4-space down to 3-space. It supplies no projection map, metric, target object, or derivation.
- Assistant response `de08feb2-bda3-4efe-89b9-80f1aeddae94) adds a 600-cell/16-cell construction and calls 0.239 rad the smallest nonzero projected angular separation. Those structures and that result are not in the direct user message. This is unsupported assistant extrapolation.
- User-role message `15338421-a5e7-4538-879a-d25d840d2bdd`, 2026-02-25T01:12:37.975Z, is a large pasted “Page One: SAT – Ontology and Unified Action” document on the selected ancestry. Its internal authorship is unresolved; outer role=user does not make every embedded equation Nathan Direct.
- Assistant response `c2f22ca2-e462-407b-b930-a70cde34f670) treats the pasted B coefficient as “almost identical” to 0.239 rad and asserts they share one geometric origin. No source-defined map supports that identification.
- User message `b8cc4592-3a32-4893-9857-21f2b1e28e4b`, 2026-09-08T07:03:06.791Z, says only “Ok, what about 14.1”. The literal message omits units and referent. The preceding assistant context makes degrees a plausible reading, not an established direct definition.

## 2. Verbatim historical equation sources

### A. SAT-O1 4D

- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- Canonical path: `SATOBLOC/SAT O1 4D.txt`
- Blob SHA-1: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`
- First-extant commit: `b543eb3fbf16e50500ceadad83dc9a7dc0759e5b`, 2025-10-27T00:40:28Z.
- Identical blob also appears at `SAT_O REWRITE/SAT 4D/SAT O1 4D.txt`, `SAT_O REWRITE/SAT O1 4D.txt`, and in HsH at `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT O1 4D.txt`. The HsH mirror’s first-extant path commit is 2026-10-01T20:36:31Z.

Verbatim equation strings:

```tex
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)
```

```tex
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)
\qquad
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
```

```tex
\phi_i - \phi_j = \frac{2\pi k}{n}
```

The file defines a filament as a 1D curve in (\mathbb R^{3,1}), but describes its “worldtube” as a 4D volume swept out by vibration. The displayed one-parameter curve does not itself specify the additional vibration parameter, finite-core support, or thickening map needed to construct that 4D volume. The later BEDROCK instruction cautions that historical centerlines may be approximations to intended extended manifolds; therefore this is recorded as a missing map, not a declaration that the historical geometry is impossible.

The repository artifact is historical source material; its per-span authorship is not established by the file alone.

### B. Blockwave clean action

- Repository: `Satobloc/HsH`
- Path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`
- Blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`
- First-extant commit: `6e4415f62616b19ae5cb677984c85d1985834d9d`, 2026-10-08T02:42:49Z.

The file opens “BLOCKWAVE CLEAN ACTION” and says “Here’s a single, compact action…”. It later explicitly calls itself a “primer written for another AI (ChatGPT)”. It is therefore a historical assistant reconstruction, not a Nathan Direct equation source.

Verbatim core excerpt as stored (including source formatting defects):

```tex
S = \int d^4x\,\sqrt{-g}\;\Big[
\frac{M_{\rm P}^2}{2}R
+ \frac{f_\theta}{2}\nabla_\mu\theta\nabla^\mu\theta
- \Lambda_\theta^4(1-\cos\theta)
+ \tfrac{c_1}{2}P^{\alpha\beta}P^{\mu\nu}(\nabla\alpha u_\mu)(\nabla_\beta u_\nu)
+ \tfrac{c_2}{2}(\nabla_\mu u^\mu)^2
+ \lambda(u^\mu u\mu+1)
+ \tfrac{\kappa_0}{4}J_{\mu\nu}P^\mu{}_{\rho}P^\nu{}_{\sigma}J^{\rho\sigma}
+ \tfrac{\kappa_2\ell^2}{4}(\nabla_\alpha J_{\mu\nu})P^\alpha{}_{\beta}P^\mu{}_{\rho}P^\nu{}_{\sigma}(\nabla^\beta J^{\rho\sigma})
+ \tfrac{g_h}{2}F_{\mu\nu}(\theta)J^{\mu\nu}
+ \tfrac12 J_{\mu\nu}\mathcal M^{\mu\nu}{}_{\rho\sigma}(\theta,u)J^{\rho\sigma}
\Big]
```

The raw file’s `(\nabla\alpha u_\mu)` and `u^\mu u\mu` spellings are preserved above; no silent repair is made. The prose identifies (J^{\mu\nu}) as a conserved two-form worldsheet current with (\nabla_\mu J^{\mu\nu}=0). It is a different object representation from the SAT-O1 one-parameter curve and from the later finite 4D core.

### C. The Feb 25 pasted summary is not a canonical equation source

The user-role paste contains, among other text:

```tex
g_G^{-2}=B\ell_f^2\rho_G,
\qquad B=\frac{3}{4\pi}\approx0.2387
```

```tex
\Delta\phi=0.246\;\mathrm{rad}
```

```tex
G/c^4\rightarrow8\pi\ell_f^2
```

These are preserved as verbatim pasted claims, not accepted equations. The same paste moves between a three-form (J_{\mu\nu\rho}) described as a worldvolume current and a two-form (J^{\mu\nu}) described as a worldsheet current, and switches corresponding coupling ranks. No Hodge-dual, Poincaré-dual, or projection map is supplied in the pasted text. No corrected equation is proposed in this report.

## 3. Object hierarchy and missing maps

Keep the following objects distinct:

| Object | Intrinsic/ambient role | Time-sheet readout under transverse intersection |
|---|---|---|
| (\gamma^1\) | 1D centerline/filament curve in 4D ambient space | Point-like |
| (W^2\) | 2D worldsheet represented by the Blockwave two-form current | 1D curve/loop |
| (C^4\) | Finite 4D core region | 3D volume |
| (\Sigma_t^3\) | 3D time sheet/hypersurface | The slicing/readout object |

The dimensional classifications are conditional on the declared object dimensions and transverse-intersection assumptions; they do not establish which carrier is physically correct.

Required maps, currently absent:

1. (E: \gamma^1\times I_{\rm vibration}\to W^2): how the 1D history acquires an independent vibration/worldsheet parameter.
2. (T: W^2\times N\to C^4): how the worldsheet is thickened into a finite 4D support, including the normal bundle, core thickness (\epsilon), and boundary.
3. (P: C^4\cap\Sigma_t^3\to\text{3D readout}): the finite-core slice operation and its metric/normal convention.
4. (D: J_{(3)}\leftrightarrow *J_{(2)}), if a three-form and two-form current are intended as dual descriptions: the metric, orientation, support, and Hodge-star convention are not specified in the pasted summary.

The 2024 line/plane point-intersection cross-read is already documented in #946 and is not repeated here. This report adds the source comparison between the SAT-O1 centerline artifact, the Blockwave worldsheet current, the pasted mixed-rank summary, and the current finite-core BEDROCK description.

## 4. θ₄ and finite-core slice: convention boundary

The source record currently has four non-identical statements:

- 2025-10-30 direct source: “angle of intersection with the time surface”; near-zero vacuum, reference direction unspecified.
- 2026-08-27 direct source: 90° to the time sheet / parallel to the time normal in ideal vacuum.
- Current BEDROCK BR-005: θ₄ is measured from the time normal; vacuum θ₄=0. It cites a 2026-09-16 running-log entry, but the underlying raw direct message ID/role/parent was not recovered here.
- BEDROCK ND-2026-10-18-07 records a generic (\theta) (not explicitly identified as θ₄) for a straight, uniform solid 4D tube with slice semiaxes (a,a,a/|\sin\theta|). Its underlying raw direct message was not recovered in this pass.

If the generic θ in the ellipsoid formula is the angle between the tube axis and the slicing plane, the sine denominator is consistent with the sheet-relative convention. It must not be silently identified with current normal-relative θ₄. The existing #1191 addendum already records the earlier assistant 2D cylinder/plane toy (a=r/\sin\theta_4, b=r); that is not a proof of the 3D ellipsoid or of a finite helical core.

BEDROCK also keeps (\epsilon) (intrinsic core thickness), (\ell_f) (historical first-order coil radius), and envelope/boundary distinct. No numerical model scale is treated as an experimentally established electron radius.

## 5. Discrepancy ledger

| ID | Original/direct or historical source | Assistant translation / current state | Finding |
|---|---|---|---|
| D1 | Direct 0.239-rad projection-artifact hypothesis; no map | Assistant adds 600-cell/16-cell and “smallest angle” | Unsupported geometric construction; no derivation |
| D2 | User-role paste: B=3/(4π)≈0.2387 as coupling coefficient; separate Δφ=0.246 rad | Assistant equates B≈0.2387 with 0.239 rad and treats all as one geometry | Unsupported semantic/numerical conflation |
| D3 | “14.1” direct follow-up, unit omitted | Assistant context suggests 0.246 rad/degree reading | Preserve as ambiguous; do not infer unit |
| D4 | SAT-O1 1D curve plus 4D-volume “worldtube” prose | No explicit extension parameter or thickening map | Missing map, not proof of impossibility |
| D5 | Blockwave assistant file uses two-form worldsheet current | Feb25 paste also introduces three-form worldvolume current | No explicit Hodge/Poincaré-dual map |
| D6 | Current BEDROCK uses normal-relative θ₄=0 vacuum | Earlier direct source uses sheet-relative 90° vacuum; generic ellipsoid θ is unspecified | Complementarity is possible, but the raw transition and formula variable are not source-closed |
| D7 | Direct SATity message tentatively links second-order winding to inverse θ₄ | Assistant parent supplies a B³/c_perp slice model | User statement is a hypothesis, not adoption of the assistant’s equations |
| D8 | SAT-O1 uses a Minkowski curve/action; Blockwave file uses Lorentzian (\sqrt{-g}), (u^2=-1) | Current H(s)H control distinguishes native ++++ from Minkowski | Metric/signature map must be explicit; no silent substitution |

## 6. Lean/formalization status

Existing work was inspected; no new module or PR was created.

- **PR #1076, LoomProjectionAngle.lean:** current head `e0a9b84abdadb17e6ff64900c9e177881364074d`; successful run #41003676062 was a PR merge-ref build, not a standalone head-only checkout. It proves a conditional Euclidean complementary-angle/projection identity. It does not prove the physical θ₄ convention, a finite-core slice, or source fidelity.
- **PR #674, FIEAngleConventionFidelity.lean:** current head `138a40a678a61cfb8bb00448b6f5b4bc20b504c5`; no workflow run was found for that head. Treat it as unverified.
- **PR #1133, RavelCarrierSheetDimensionGate:** successful merge-ref build #41348936553. Its generic expected-dimension helper uses natural subtraction, which truncates negative expected dimension to zero; it therefore conflates generic emptiness with a genuine zero-dimensional intersection unless additional conditions/type distinctions are added. The fixed 1D/2D/3D/4D versus 3D-slice cases are conditional formalizations, not physical validation.

No exact-head Lean build was performed in this run. Lean proves only the formalized statement; it does not validate the source translation or physical premises.

## 7. Mersearch and next deeper cursor

A prior completed Mersearch request `calder-empirical-charter-original-source-20261101-0248` has a request-scoped manifest and compact receipts independently read. It searched 16,202 files / 20,861,799 records and reported 138 hits across 81 paths. Those receipts are discovery aids, not exhaustive results or proof of authorship; raw results remain withheld.

A new targeted request was submitted through the existing reusable lane after the previous request manifest and both compact receipts were read back:

- Request ID: `calder-angle-geometry-source-fidelity-20261102-1337`
- Request-file commit: `5e1674334562695b5d13e34c8dd82d561a1f58dd`
- Workflow run: #41454976148
- Job: #125309252946
- Status at this report: **IN_PROGRESS; no request-scoped manifest or compact receipt yet.**
- Do not overwrite or resubmit. Next run must verify this exact request ID first.

Next deeper source cursor:
1. Recover the raw 2026-09-16 direct θ₄ clarification (role, message UUID, parent, ancestry).
2. Recover the raw 2026-10-18 source for BEDROCK ND-2026-10-18-07 and establish whether its generic θ is θ₄ or a separate sheet-incidence angle.
3. Use the pending Mersearch request to locate primary SAT-O/Blockwave equation origins, verbatim source spans, author/role provenance, first-extant commit dates, and any explicit correction lineage.
4. Define the centerline→worldsheet→finite-core→timesheet-readout maps before formalizing a unified object hierarchy.
5. Keep original equations immutable and place any justified corrections in separate, explicitly labeled records.

**Epistemic status:** primary direct geometry recovered for the 2025 and 2026 source statements; SAT-O1 and Blockwave artifacts recovered with exact blob/date provenance but not attributed to Nathan Direct; the Feb25 equation block remains a user-role paste with unresolved internal authorship; assistant extrapolations quarantined; later θ₄ and finite-core raw sources remain pending; no physical or empirical conclusion is advanced.

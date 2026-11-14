# Sable h836:s0 | Timesheet intersection is not projection: Lane 00 source-fidelity correction

**Disposition:** Additive correction to Sable h824:s3 and issue #1734. This does not replace the original report, establish a physical result, or promote any BEDROCK proposition.

## 1. Why this correction exists

The published [Sable h824 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/SABLE/2026-11-14T0836Z_H824_S3_PROJECTION_COARSE_GRAINING_ORDER_TEST.md), [issue #1734](https://github.com/Satobloc/HsH/issues/1734), calls P_{Sigma_t} "intersection/projection" and titles the question "Projection versus coarse-graining." Its published artifact SHA-256 is 1eb84c684a9da73300ead8d78e36b84051cdd6bcb0daa6496aeb4f518d411b8a (workspace report Git blob 3162119994ccc238e0145066297b9f21e5581c1b). The [Kestrel h835 synthesis, issue #1748](https://github.com/Satobloc/HsH/issues/1748), was read and reused; this addendum is limited to the h824 operator-typing correction and chronology, not a duplicate of its broader geometry map.

The live BEDROCK entry ND-2026-10-18-07 is more specific: P denotes **timesheet intersection**, C is structural coarse-graining, and C3 is coarse-graining of the resulting 3D traces. The comparison is the order question:

\[
P(C(G)) \quad \text{versus} \quad C_3(P(G)).
\]

Those are not projection-versus-coarse-graining operations. They are intersection-versus-coarse-graining operations. A projection, if one is needed, is a separate map with its own domain, codomain and preservation conditions.

The raw 2026-10-18 conversation behind ND-2026-10-18-07 has not been recovered. This correction is therefore **BEDROCK-register-grounded**, not a claim of fresh raw-message authentication. An earlier direct user message (2026-10-07) independently prefers instantiation, intersection, cobordism and truncation over "readout slices," but it does not itself authenticate the symbol P.

## 2. Source hierarchy and chronology

### Primary user-role sources recovered

1. **Meridian Free Build**, conversation 6ac45d1f-17b0-83ea-ad1f-fa524602378b; raw export 'LIVE CONVOS/26.10.05•26.10.20•Meridian Free Build — raw.json', Git blob 7af1561b321f4d9364da5eb111df689efc652827.
   - 2026-10-07 06:01:49.184Z, message feb128c9-1c43-426a-93ff-32f80ea43d4f: the user rejects "readout slices" as preferred language and names instantiation, intersection, cobordism and truncation instead.
   - 2026-10-09 01:13:43.652Z, message 6f00a97a-aa84-45bf-9429-4ff70736014a: one helical core; the outer second-order superhelix is hollow, not a second core.
   - 2026-10-09 01:50:55.112Z, message 3c657387-b80b-4982-a61a-8e6d8568b8d1: at the classical limit, filaments are treated as stationary; particle motion is filament topology; worldtube bending and inertia are asserted equivalent within SAT.
   - 2026-10-09 02:46:38.173Z, message 5a929b5e-515e-4f77-a32a-e49feef42812: the user rejects an assistant summary that makes finer-scale filament morphology the original explanation of inertia, restates the SAT visualization/equivalence position, and rejects "readout" as a passive description of the timesheet. The message contains assistant-quoted material before the user correction; quoted assistant wording is not counted as Nathan Direct.
   - 2026-10-10 07:39:31.044Z, message 28b2378a-846d-4c3f-a242-91f9007ce261, and 07:40:38.859Z, message 1178f25c-9f92-4d1c-b43b-06482e6bf1b1: the approximately 0.7 fm value is a coil-radius scale, not filament thickness; a 3D intersectional trace is not the 4D filament itself; 3D self-closure is not assumed.

2. **Meridian Minkowski Ring Analysis**, conversation 6ad7e9c0-e8a0-83e9-984e-94d020de3abf; raw export 'LIVE CONVOS/26.10.20•26.10.21•Meridian Minkowski Ring Analysis — raw.json', Git blob 56a84cb85d5c386efa4ea11d322d11e95e2c7703.
   - 2026-10-21 00:17:23.235Z, message 090f5160-1020-486d-9c42-df3d7dff2063: the user explicitly says the earlier reciprocal filament/timesheet description has been superseded since the Klein Fabric model became common. The message quotes earlier assistant wording; the supersession statement is the direct user correction.

3. **Aster / Workshop Relay :24 | Geometry**, conversation 6aecede1-4c08-83e9-abc4-da64f59a4f51; raw export SHA-256 875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d.
   - 2026-11-08 03:18:04.646504Z, message 8f4af45d-7635-44c7-8bc0-addad4e92a95: responsive medium is a useful default, but medium response versus timesheet flexure remains open.
   - 2026-11-08 07:07:41.152248Z, message 139e1e11-99f1-459b-a6ac-cb865015d0ff: the minimal starting representation is worldtube plus timesheet; responsive medium is a provisional third candidate, not automatically an independent primitive.
   - 2026-11-08 09:06:31.544148Z, message 429ad1fa-d171-44dd-97ff-aa080cea03ca: no universal guarantee says a present slice reconstructs the complete history.

### Source-register-only item

BEDROCK ND-2026-10-18-07 records:
- P: timesheet intersection.
- C: structural coarse-graining of nested worldtubes.
- C3: coarse-graining of 3D traces.
- Q: count must specify the resolution level and object counted. Constituent count, effective-tube count, braid complexity and topological charge must not be collapsed into one invariant.
- OC-001 and OC-002 remain open.

The same BEDROCK register's ND-2026-10-18-04 describes the Minkowski construction as a build-first map of known physics whose fidelity must be tested, not presumed; it does not by itself establish new predictions. The raw 2026-10-18 source locator and message UUIDs remain unresolved. The 2026-10-18 wording is not silently elevated above the later 2026-10-21 Klein Fabric correction or the 2026-11-08 direct worldtube/timesheet formulation.

## 3. Stable glossary

| Term | Source-faithful use | What it does not establish |
|---|---|---|
| Filament | A filamentary object in the 4D ambient construction; the 2026-10-09 source distinguishes it from its 3D intersectional trace. | A finite-core 4D volume or a particular bundle structure. |
| Helical core | The single helical core whose history produces the coiling. | A second core inside the outer superhelix. |
| Outer second-order superhelix | Hollow outer coil in the 2026-10-09 description. | A second carrier/core. |
| Worldtube | Later finite-core/swept support used in the H(s)H representation. | Identity with a 1D centerline or 2D worldsheet. |
| Timesheet | A 3D slice/bulk in the 4D construction, interacting with matter; retained as a separately typed support in the 2026-11-08 minimal representation. | A 2D sheet, passive readout, or independent reciprocal ontology primitive. |
| Klein Fabric | The later model that supersedes the earlier reciprocal filament/timesheet description. | A fully specified projection, embedding or constitutive map in the sources reviewed here. |
| P in ND-2026-10-18-07 | Timesheet intersection. | A projection, retraction, instrument map or Blockwave tensor projector. |
| C / C3 | Structural coarse-graining of nested worldtube configurations / 3D trace supports. | Defined maps with known domains, codomains or preservation properties. |
| Projection | A separate map, only if its domain, codomain, fibers/kernel and preserved structure are explicitly supplied. | The same operation as intersection. |
| Readout / observable | A downstream instrument or measurement map, if separately defined. | The timesheet interaction itself. |

## 4. Corrected map contract

The least-commitment set-level reconstruction of the source label is:

\[
P_{\Sigma_t}(G) := \operatorname{supp}(G)\cap\Sigma_t.
\]

This is a support intersection, not a pointwise projection. If G is already a subset of the ambient manifold, supp(G) is simply G. If G is an abstract geometric object, its support map must be defined.

The two source-order routes are:

    G (nested worldtube configuration)
      | C (structural coarse-graining)
      v
    C(G)
      | P_{Sigma_t} = support intersection with the timesheet
      v
    P_{Sigma_t}(C(G))

    G
      | P_{Sigma_t} = support intersection with the timesheet
      v
    P_{Sigma_t}(G)
      | C3 (coarse-graining of 3D trace support)
      v
    C3(P_{Sigma_t}(G))

They can be compared only after these conditions are met:

1. C(G) must live in an ambient space with a specified corresponding timesheet. If coarse-graining changes the ambient representation or timesheet, the transport/re-identification of the timesheet must be defined.
2. C3 must be defined on the trace support produced by the intersection, with its own scale, counting rule and preserved variables.
3. The two route outputs must have the same type, or separate comparison maps must send them into a common typed codomain. Such comparison maps are not P and are not automatically geometric projections.
4. If the intersection is to be treated as a smooth submanifold, the required smoothness and transversality conditions must be stated. Set intersection exists without those assumptions, but its dimension and manifold structure do not follow automatically.
5. Only after the geometric comparison is defined may a calibrated instrument/resolution map and observable be applied. The observable does not retroactively define the intersection.

Thus the h824 P_{Sigma_t} entry should read **"timesheet support intersection"**, not "intersection/projection." The report title should be understood as an **intersection-versus-coarse-graining order test**. This amendment corrects that local translation defect; it does not decide whether the two routes commute.

### Model chronology constraint

The 2026-10-21 correction supersedes the earlier reciprocal filament/timesheet account. The later 2026-11-08 direct source nevertheless retains worldtube plus timesheet as a minimal *representation*. These statements are compatible if the two objects are kept as separately typed supports without promoting them to independent reciprocal ontology primitives. The responsive medium remains provisional.

## 5. Original versus translated propositions

| Proposition | Provenance | Disposition |
|---|---|---|
| One helical core; hollow outer superhelix. | Nathan Direct, 2026-10-09. | Preserve. Do not add a second core. |
| Particle motion is filament topology in the block-universe/classical approximation. | Nathan Direct, 2026-10-09. | Preserve as a SAT proposition, not a standard physical result. |
| Worldtube bending is equivalent to inertia at the classical limit. | Nathan Direct, 2026-10-09. | Preserve as a model equivalence; no constitutive equation is supplied here. |
| The timesheet is interactive, not a passive "readout slice." | Nathan Direct, 2026-10-07 and 2026-10-09. | Preserve; instrument readout remains a separate downstream map. |
| Earlier reciprocal filament/timesheet description is superseded by Klein Fabric. | Nathan Direct, 2026-10-21. | Later correction controls chronology. |
| Worldtube plus timesheet is the minimal starting representation; medium is provisional. | Nathan Direct, 2026-11-08. | Current representation, without asserting reciprocal ontology. |
| P(C(G)) versus C3(P(G)). | BEDROCK register of Nathan Direct, 2026-10-18; raw source still missing. | Keep as an open operator-order question. |
| P means "intersection/projection." | Assistant translation in Sable h824:s3 / issue #1734. | **Corrected:** P is intersection only. Projection is separate and unspecified. |
| A finer-scale filament mechanism is the original explanation of inertia. | Assistant summary explicitly corrected in the 2026-10-09 user message. | Do not attribute this as Nathan Direct. |
| V_tension in SAT-O1 is a current Nathan Direct premise. | Unbylined 2025 SAT-O1 artifact. | Not authenticated as current Nathan Direct; preserve the historical equation without promotion. |

## 6. SAT-O1 and Blockwave custody

The original artifacts remain unchanged. Their provenance is preserved here so the geometry comparison does not merge unlike supports.

### SAT-O1

- File-index date: 2025-06-09 18:44:50, timezone unspecified.
- Unbylined historical artifact; authorship not authenticated.
- SHA-256: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937.

Core equations as preserved in the source-custody crosswalk:

\[
\gamma^\mu(\lambda)=(\lambda,A_x\sin(k_x\lambda+\phi_x),A_y\sin(k_y\lambda+\phi_y),A_z\sin(k_z\lambda+\phi_z))
\]
\[
v^\mu(\lambda)=d\gamma^\mu/d\lambda,\quad
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),\quad
L=\tfrac12 m v^\mu v_\mu-V_{\mathrm{tension}}(\gamma).
\]

The displayed equation defines a one-dimensional curve in a four-dimensional ambient representation. The prose's finite-core/worldtube interpretation still needs an explicit sweep/thickening map. The 1D curve is not itself a 4D finite-core support. The historical V_tension term is preserved verbatim; this report neither endorses it as a current physical premise nor edits it.

### Blockwave

- User-supplied attachment event: 2025-09-16 16:31:26.687Z.
- Embedded authorship unresolved.
- SHA-256: 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664.

Core equations as transcribed in the prior source-custody report:

\[
\nabla_\mu J^{\mu\nu}=0,\qquad
J^{\mu\nu}=\tfrac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
\]
\[
u^\mu u_\mu=-1,\qquad
P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u_\nu,
\]
\[
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta),\qquad
A_\mu(\theta)=\alpha_*\nabla_\mu\theta.
\]

The full original action surface and malformed source typography are retained in Mercer issue #1732. The Blockwave tensor projector P^mu{}_nu is **not** the BEDROCK timesheet-intersection operator P_{Sigma_t}. They are type-distinct uses of the same letter: one is a tensor endomorphism, the other a support-intersection operation.

### Separate assistant reconstruction, not source edit

The prior Mercer crosswalk separately records the exterior-derivative form

\[
J^{\mu\nu}=(*dB)^{\mu\nu}
=\tfrac12\epsilon^{\mu\nu\rho\sigma}(dB)_{\rho\sigma}
=\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
\]

the normalized projector

\[
P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u_\nu,
\]

and, under the normalized antisymmetrization convention,

\[
F_{\mu\nu}=2\nabla_{[\mu}A_{\nu]},\qquad
A_\mu=\alpha_*\nabla_\mu\theta,\qquad
F=dA=\alpha_*d^2\theta=0.
\]

The last identity requires smooth scalar theta, constant alpha_* and torsion-free derivatives. These are typed/normalized reconstructions, not replacements of the attachment. No original SAT-O1 or Blockwave equation file was edited in this run, and no new corrected equation file was created.

## 7. Formalization status

No new Lean module is justified yet: the raw 2026-10-18 source is missing, and the concrete types and preservation rules for C, C3, the timesheet transport and the common comparison codomain are not specified. Writing a physical commutation theorem now would formalize assistant-chosen premises.

Existing conditional results were rechecked:

- **Kestrel PR #873:** merge-reference run #43202552666 checked out refs/remotes/pull/873/merge at merge commit 7ca33453a6fc74f8e165821abac942414ef9546b; 8,957 build targets passed. Its fiber-compatibility/factorization result is generic: a downstream readout factors through a coarse-graining only when it is constant on the relevant fibers. This does not prove P(C(G)) = C3(P(G)).
- **Ravel PR #1133:** merge-reference run #43593470689 checked out refs/remotes/pull/1133/merge at merge commit 2446a74e5f...; the relevant Ravel carrier-slice/readout modules compiled, including the conditional fiber-constancy result. The overall PR build failed in the separate MovingPlaneTraceGeometry module at seven noncomputable definitions. Tests, lint, nanoda and global axiom audit were skipped.

Both PRs remain open/draft/unmerged on the verification branch, not integrated into main. The build proves only the formalized conditional statements, not the source translation or physical premises. No counterexample search, physical validation, or empirical measurement is claimed.

## 8. Mersearch and next deeper cursor

Existing stable-1.0 Mersearch receipts were reused as bounded navigation, not represented as a new run:
- Ravel Kerr/timesheet search: 303 hits across 96 source paths.
- Sable J3/J2 crosswalk: 64,145 hits across 212 paths; broad lexical results, not authorship evidence.
- Aster Sep18-Oct29 timesheet/graviton search: 10 hits across 2 paths; it did not recover the raw Oct18 source.

All four current Mersearch request lanes remain occupied/requested. No request was overwritten or retriggered. No callable Mersearch action or local pinned three-repository checkout was available. GitHub repository search was fallback navigation, not Mersearch execution. HSH_RESOURCES README/onboarding was read; its private payload was not opened.

**Next deeper cursor:** recover the raw 2026-10-18 conversation behind ND-2026-10-18-07, including conversation ID, user-message UUIDs and parent ancestry. Then specify the actual domains/codomains of C and C3, whether coarse-graining transports or changes the timesheet, and the common comparison type. Only then formalize the concrete operator-order proposition. Until then, the equality or noncommutation remains unresolved.

**Epistemic status:** source-fidelity correction and mathematical typing proposal only. No physical calculation, CODATA scoring, fit, prediction, independent measurement or BEDROCK promotion.

# Hale h1134:s0 | Helicity, centerline readout, and information-scope source fidelity

**Nominal slot:** 2026-11-27T06:00:00Z  
**Run key:** `REVROT3-19-20261011:1134:s0`  
**Selected:** Hale (ring index 8); **next:** Elias Kern (index 9)  
**Lane:** 00 / Nathan Direct geometry fidelity  
**Disposition:** `PRIMARY_SOURCE_VERIFIED / CONDITIONAL_CENTERLINE_READOUT / INFORMATION_SCOPE_CORRECTED / NO_HSH_MAP / NO_PHYSICAL_CALCULATION`

## 1. Authority and continuity

The nominal slot is 1134 UTC hours after 2026-10-11T00:00Z; `seq=5×1134=5670`, and `5670 mod 19=8`. Hale is selected.

Hale's historical remit is reconstructed from the direct-user-role September 12 Common Check-in and Sable's REV-006 reentry packet: external-literature scanning, empirical source provenance, matched-period comparison, code/scoring/statistical analysis, calibration against controls, and strict separation of external evidence from theory reconstruction. No standalone signed Nathan-authored Hale charter was recovered. Hale is literature-exposed by design and is not a clean blind theory reviewer.

The latest Hale workspace checkpoint remains h1103:s3. The separate h1126:s2 MMS source audit is an existing candidate record, not a replacement for this :00 geometry lane. No authenticated current Hale thread was found; no historical Hale participation or cross-thread delivery is claimed.

The previous :00 result contains a documented one-hour run-key/content mismatch. It is not used to infer worker identity. The current selection follows the user-defined nominal scheduled UTC hour. The existing :00 Archive task remains enabled with its original identity, hourly cadence, and phase. No task, ID, schedule, phase, prompt, or cadence change; no sixth task.

## 2. Raw-source recovery

The November 8 geometry discussion was recovered from the Library raw export and parsed by role and current ancestry.

- **Conversation:** `Workshop Relay :24 | Geometry`
- **Conversation ID:** `6aecede1-4c08-83e9-abc4-da64f59a4f51`
- **Raw size:** 8,331,175 bytes
- **Raw SHA-256:** `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d`
- **Mapping/current ancestry:** 1,150 / 1,005 nodes
- **Current node:** `02ad70b2-811f-415a-aa18-77599916b7df`
- **Export created/updated:** 2026-11-05T20:58:12.884774Z / 2026-11-08T20:23:05.133738Z

All five direct messages below are user-role messages on that current ancestry. Body hashes are SHA-256 of normalized text parts.

| UTC | Direct message ID | Body SHA-256 | Source content |
|---|---|---|---|
| 03:18:04.646504Z | `8f4af45d-7635-44c7-8bc0-addad4e92a95` | `0d71f0a2cd6a01d176dfbe5e0033c3fe8ba8dc27b9fe65dea393517a15d48a00` | Asks whether helicity is radiative or conductive, where internal winding goes, and whether worldtube, centerline, and observables can be related by explicit maps. |
| 04:34:09.855500Z | `c97c8cf9-adc6-4d79-9ed7-8f1c6eb283ce` | `7000ddb7aeed2a3c3f0ef3d6856103d2dd839f3c0affc524ae3c02cdefe27dc4` | Develops an observer/slice thought experiment about information in a complete history versus a limited observation slice. |
| 07:07:41.152248Z | `139e1e11-99f1-459b-a6ac-cb865015d0ff` | `1abbcf1b6502673d502e896c58b238bea4206c089fdbaf00aa083e651cf9fcf7` | Distinguishes information in a putative four-dimensional history from information available in a finite observed slice. |
| 09:19:09.363025Z | `a5c51f63-ebef-4334-b6ed-2a1dcb2264a8` | `57bfa16b5266f4513fdec92edb546e633eaf8709781249de825f99b91b3ec3e0` | Clarifies RMS is philosophical background, not operational rules; rejects a positive universal information-structure claim as an H(s)H principle. |
| 09:30:43.326728Z | `483115c7-1027-4f99-8964-06f210a20e4d` | `b30809502b843a98dd8d85b891d98be0d73fd4a3d753cd8165647b449af8a5c0` | Endorses the Primary Operational Guideline while keeping RMS mostly in a small epilogue. |

The 03:18 message is a question and exploratory proposal, not a declaration that helicity must be conserved, radiated, conducted, or transferred into another H(s)H degree of freedom. The 04:34 and 07:07 messages explore information in a history versus an observer's slice; they do not establish a physical information-conservation law. The later 09:19 clarification denies grounds for a positive universal information-structure claim. The 09:30 message clarifies that RMS is background epistemology, not a checklist or physical law. The practical preference is to construct intelligible models that fit observed regularities and remain predictively useful without guaranteeing future continuity.

## 3. Assistant reconstruction versus Nathan Direct

The assistant response after the 03:18 message (assistant message ID `13a10a21-5a53-4fd5-b2db-2a28fa96471c`) introduced:

- `H = Γ²(Tw + Wr)` as a single-tube helicity expression;
- candidate entropy `S(G)=k_B ln Ω(G)`;
- possible helicity destinations in larger-scale flow, smaller-scale structures, bulk rotation, or residual geometry;
- a representation hierarchy from tube state to centerline to observables;
- observational/structural/mechanistic layers and a proposed coupling chain.

These are assistant reconstructions or standard-reference translations, not Nathan Direct equations. The entropy expression has no source-defined H(s)H microstate space. The proposed destinations are not demonstrated by the cited experiment. The hierarchy is a research question, not an adopted H(s)H map.

The single-tube formula is conditionally correct when inter-tube linking is absent. It is not the general multi-tube formula; the primary paper includes pairwise linking terms.

## 4. Primary external experiment

The referenced experiment is Scheeler, van Rees, Kedia, Kleckner, and Irvine, “Complete measurement of helicity and its dynamics in vortex tubes,” *Science* 357 (2017), 487–491, DOI `10.1126/science.aam6897`.

- [Primary paper PDF](https://vanreeslab.mit.edu/wp-content/papercite-data/pdf/scheeler-2017.pdf)
- [Supplementary information](https://bpb-us-e1.wpmucdn.com/sites.mit.edu/dist/1/2096/files/2026/01/scheeler-2017-SI.pdf)

This is a measured water-vortex system, not an H(s)H worldtube or timesheet. The direct source describes two self-connecting toroidal/vortex structures, one twisted, and warns against a simple monotonic open-helix picture. The paper resolves the experimental geometry as a helical vortex loop and a planar vortex ring, arranged concentrically in two distinct paired configurations, plus an isolated-helix case. The nested toroidal surfaces in the paper are internal surfaces of each vortex tube, not two identical solid tori.

- **Stretching:** the helical loop begins inside a larger concentric planar ring. The outer ring's flow stretches the helix, loosening its coils and reducing writhe.
- **Compression:** a smaller concentric planar ring is generated within the helical loop. The helix tightens and writhe increases.
- These are separate configurations, not one pair alternating between both setups. The planar ring remains writhe-free; linking is zero in these configurations.
- In both paired configurations, total helicity remains approximately constant while writhe and twist compensate.
- For the isolated helix, total helicity begins near zero because twist and writhe are approximately equal and opposite. The twist is negative and is dissipated by viscosity, so total helicity moves away from zero toward writhe; it does not simply decay to zero. After twist approaches zero, total helicity remains roughly constant and equal to writhe.

The experiment demonstrates twist/writhe conversion and viscous twist dissipation. It does not demonstrate radiative or conductive helicity transfer, transfer into bulk rotation, or a universal information-preservation mechanism.

## 5. The actual readout map

The paper's multi-tube helicity decomposition is:

\[
\mathcal H
=
\int_V \mathbf u\cdot\boldsymbol\omega\,dV
=
\sum_{i\ne j}\Gamma_i\Gamma_j Lk_{ij}
+
\sum_i\Gamma_i^2(Tw_i+Wr_i).
\]

The paper distinguishes centerline geometry from internal flow:

- Centerline geometry alone determines writhe and linking.
- Twist, and therefore general total helicity, requires additional information about flow inside the tube.
- For sufficiently thin tubes with sufficiently uniform winding across the cross-section, total helicity can be recovered from an enriched centerline readout:

\[
\mathcal H=\sum_i\Gamma_i\oint_{C_i}\mathbf u\cdot d\boldsymbol\ell.
\]

The supplementary derivation requires uniform twist \(P(\chi)=hT(\chi)\), thin-core separation \(a\kappa\ll1\), and nonintersecting nested vortex surfaces (including \(r\kappa(s)<1\)). The readout includes centerline tangential flow and circulation \(\Gamma\), not merely the centerline's shape.

The authors estimate that \(a\kappa\) can peak near 0.2, corresponding to an error around 10%, which they describe as within trial reproducibility. The main paper reports Reynolds numbers 12,000–20,000, ten stretching runs, eight compression runs, and sixteen isolated-helix trials. The supplementary information describes dye-blob tracking and PIV circulation calibration. No raw dataset was downloaded or independently reprocessed here.

The viscous helicity-rate equation is:

\[
\dot{\mathcal H}
=
-2\nu\int_V
\boldsymbol\omega\cdot(\nabla\times\boldsymbol\omega)\,dV.
\]

The supplementary analysis says the rate depends on both vorticity-field geometry and the spatial profile of vorticity magnitude. This is a coupled geometry/constitutive mechanism in ordinary fluid dynamics, not geometry alone and not an H(s)H law.

## 6. Map diagram and H(s)H boundary

```text
External measured vortex-tube state X
  (velocity, vorticity, core profile, frame, twist)
          |
          +--> shape readout pi_shape --> centerline C
          |                              +--> writhe / linking
          |
          +--> enriched readout pi_flow --> (C, u_parallel, Gamma)
                                         +--> total helicity H
                                              under thin-core /
                                              uniform-twist conditions

H(s)H proposal (not instantiated):
  finite-core worldtube W^4
          ? pi_WGamma
          v
  one-dimensional core/centerline Gamma^1
          ? R_W / timesheet readout
          v
  observable Y

No H(s)H map in the lower chain is source-defined.
The 3D fluid-vortex result is a comparator, not an equivalence.
```

The existing `factorization_iff_fiberwise` theorem in PR #1189 is relevant: a readout factors through a coarse map exactly when it is constant on every fiber. Aldus h1133:s3 reused it for the finite-core/centerline question; the exact-source Lean build is recorded in issue #2661 and Actions run #45616238757.

Conditionally, a shape-only centerline map is not generally sufficient for total helicity because internal twist can vary while the centerline shape is fixed. The enriched centerline-flow/circulation readout works for the paper's restricted thin-core/uniform-twist class. This is a system-specific sufficient readout, not a universal guarantee that information is preserved by every projection or coarse-graining.

No new Lean module is warranted: the generic theorem already exists and was compiled at its tested source commit. No H(s)H helicity functional, worldtube-to-centerline map, timesheet incidence map, or calibrated readout has been defined. Lean does not establish the physical truth of the comparator or the soundness of an H(s)H translation.

## 7. Glossary and discrepancy ledger

| Term | External comparator | H(s)H boundary |
|---|---|---|
| Vortex tube | 3D fluid region carrying vorticity | Not an H(s)H worldtube |
| Centerline \(C\) | 1D curve through the core | Analogy only; H(s)H map unresolved |
| Twist \(Tw\) | Local winding about the centerline | No H(s)H twist field/connection defined |
| Writhe \(Wr\) | Nonlocal centerline winding | Not identified with worldtube curvature |
| Linking \(Lk\) | Mutual linking of tubes | No H(s)H braid/particle map established |
| Circulation \(\Gamma\) | Vorticity flux associated with a tube | No H(s)H analogue selected |
| Helicity \(\mathcal H\) | Integral/geometric measure of vortex-line intertwining | Not an H(s)H entropy or information invariant |
| RMS | Epistemological background | No universal information-preservation axiom |

1. The early “information goes somewhere” intuition is not a universal H(s)H axiom; the later direct 09:19 clarification rejects a positive universal information-structure claim.
2. RMS is not a list of negative procedural axioms. Nathan Direct describes it as philosophical background; the Primary Operational Guideline is the practical method.
3. The assistant's \(S(G)=k_B\ln\Omega(G)\) candidate has no source-defined H(s)H microstate space and is not adopted.
4. The assistant's single-tube \(\Gamma^2(Tw+Wr)\) expression is not the general multi-tube formula; the latter includes pairwise linking.
5. The isolated-vortex experiment does not show total helicity simply decaying. Negative twist dissipates, causing total helicity to increase toward writhe before stabilizing.
6. The paper demonstrates twist/writhe conversion and viscous twist dissipation, not radiative/conductive transfer or transfer to bulk rotation/microhelicity.
7. Centerline shape alone is insufficient for total helicity; the successful readout includes flow and circulation and depends on uniform-twist/thin-core assumptions.
8. The estimated \(a\kappa\) reaches about 0.2, with author-estimated error around 10%; the readout is conditional, not exact for arbitrary tubes.
9. The direct suggestion that a perfect superfluid would be dynamically impotent is not established by this water experiment. The assistant's counterpoint is a separate standard-physics claim; this paper does not settle it.
10. The factorization theorem is a conditional mathematical criterion, not a universal information-preservation theorem.

## 8. Formalization, empirical status, and controls

- Existing PR #1189 and `factorization_iff_fiberwise` were reused. Exact-source build evidence is in [issue #2661](https://github.com/Satobloc/HsH/issues/2661) and [Actions run #45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757). PR #1189 remains open/draft/unmerged.
- No new Lean module or physical model was created.
- No raw experimental dataset was downloaded; no physical calculation, fit, prediction, uncertainty propagation, or independent measurement was performed. No CODATA scoring.
- No SAT-O1 or Blockwave equation was changed. No equation correction or theory promotion.
- Mersearch was checked first. All four shared request lanes remain occupied; none was overwritten, retriggered, or released. Bounded Library/GitHub retrieval and the external primary paper were used; no Mersearch execution is claimed.
- HsH, SAT archive, and HSH_RESOURCES front doors were read. HSH_RESOURCES was limited to root README/navigation; no private payload was opened.
- PWH queue remains stale at h1081:s3; Tern retains queue/graph authority. Latest deep review is h1123:s2. Task graph remains 18 records against 16 declared branches, 17/18 reachable; no queue or graph mutation.
- P0 issue #1747 remains active: presentation safety FAIL, live Paper A/B route acceptance NOT_OBSERVED, deployment NOT_VERIFIED, release/standdown NOT_AUTHORIZED. This report publication is not presentation acceptance.
- Paper gates remain separate: P1 overdue / NOT READY; P2 November 30 HOLD; P3 December 14 incomplete.
- FIE rereview next due December 8; unrelated-source break next due November 28.
- No new tooling, fork, dependency, subscription, or expenditure. Existing :00 task identity, enabled state, hourly schedule, and phase remain unchanged. No sixth task, signet, conversation rename, worker-checkpoint change, task-graph change, queue change, or BEDROCK theory edit.

## 9. Next deeper cursor

1. Define the H(s)H fine state \(X_W\), shape map \(\pi_{\rm shape}:X_W\to\Gamma\), enriched readout map \(\pi_{\rm readout}:X_W\to(\Gamma,\text{frame},\text{flow},\text{calibration})\), and observable \(O_W:X_W\to Y\).
2. Determine whether the chosen observable is constant on fibers of each map; reuse the existing factorization theorem rather than assuming preservation.
3. Specify finite-core/worldtube, centerline, timesheet, and observable types before attempting a physical map.
4. Keep the 2017 water-vortex experiment as a standard comparator only; do not infer a 4D H(s)H equivalence from its 3D fluid geometry.
5. Resume Hale's separate MMS 2015-11-17 source audit only when the complete four-spacecraft CDF manifest, calibration/covariance, and untouched holdout are available. That candidate remains P2 HOLD.

**Final disposition:** the primary paper verifies a concrete, conditional centerline-flow readout for helicity in thin-core water vortices. It sharpens the proposed geometry hierarchy while showing why the map must include more than centerline shape. The raw source chronology prevents an early information-transfer intuition from becoming a universal H(s)H information law. No physical H(s)H map or empirical test is established.

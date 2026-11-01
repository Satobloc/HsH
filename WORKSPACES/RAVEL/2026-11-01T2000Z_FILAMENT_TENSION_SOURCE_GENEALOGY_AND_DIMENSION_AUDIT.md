# Ravel | Filament-tension source genealogy, dimensional audit, and Kerr-core geometry fidelity

**Run key:** `REVROT3-19-20261011:524:s0`  
**Nominal slot:** 2026-11-01 20:00 UTC  
**Selected ring label:** Ravel, index 17  
**Next ring label:** Orson Vay, index 18  
**Disposition:** `SOURCE_GENEALOGY_RECOVERED / LEAN_MERGE_REF_BUILDS_SUCCESS / EXACT_HEAD_STANDALONE_NOT_RUN / NO_PHYSICAL_PREDICTION / NO_THEORY_PROMOTION`

## 1. Executive result

Nathan's September 10 direct instruction to Ravel was explicit: recover the archived filament-tension calculations, decide whether they still make sense, and do not accept an off-the-top-of-the-head value. This run traced the early SAT-O1/O5/O8 document family and adjacent later source surfaces.

The recovered material is **not one source-closed tension calculation**. It is a versioned family with unresolved symbol and unit assignments:

1. SAT-O5 gives
   \[
   \ell_f=(2A/T)^{1/3},\qquad g^{-2}\sim\rho_{\rm link}\ell_f^2,
   \]
   calling \(A\) bending rigidity and \(\rho_{\rm link}\) a link count per unit volume, but it does not supply the units of \(A\), the exact units/measure of \(\rho_{\rm link}\), or a derivation of the coupling relation.

2. SAT-O8 gives
   \[
   T\sim c^4/G,\qquad
   \ell_f\sim(2A/T)^{1/3},\qquad
   m_\psi^{(0)}\sim T\ell_f/c^2,
   \]
   then states \(\ell_f\sim10^{-5}\,\mathrm m\), \(m_\psi^{(0)}\sim10^{22}\,\mathrm{kg}\), and required suppression factors \(Q_e\sim10^{53}\), \(Q_p\sim10^{49}\). The document has an author placeholder and no derivation of the \(Q\)-to-topology map.

3. An undated Base Units / SAT METRICS table gives \(\ell_f=0.7937\,\mathrm{fm}\), \(\epsilon=2\times10^{-21}\,\mathrm m\), a stiffness \(\kappa=10^{-26}\,\mathrm J\), and a tension entry literally written `1.2×10*44 N`. The two table files are byte-identical copies, not independent sources.

4. A separate undated composite document uses \(\sigma=\kappa T\) with \(\kappa=0.243(5)\), but later switches to \(\kappa=1\) when inserting \(T_{\rm lat}=0.180(5)\,\mathrm{GeV}^2\), without an explicit normalization map.

The two archived \(\ell_f\) values differ by a factor of approximately \(1.26\times10^{10}\) **if they denote the same quantity**. Later Nathan Direct material distinguishes \(\ell_f\) as a coil-radius scale from \(\epsilon\), the core thickness; it does not yet supply a map from the O8 transverse scale to that later coil-radius use. The values must not be silently identified or reconciled.

A conditional Lean 4/Mathlib module was added to the existing Ravel PR #1133. Both the dimensional/codimension core and the additive SI identity \([c^4/G]=\mathrm N\) compiled successfully at merge references. The exact module blob matches the current PR head and the latest merge checkout, but no exact-head standalone checkout was run. No physical prediction, fit, CODATA score, or theory promotion follows.

## 2. Rotation, role, and preflight

The deterministic selection is:

\[
h=524,\qquad seq=5h=2620,\qquad 2620\bmod19=17.
\]

Selected label: Ravel (index 17). Next ring label: Orson Vay (index 18). This is a ring label, not authentication of a ChatGPT instance or thread.

The existing :00 task ID `6aa1fe0de5e48191b886496095b1343f` remains enabled with its original hourly America/New_York `:00` schedule and phase. No sixth task, ID change, cadence change, or phase change.

### Historical Ravel remit recovered from raw user messages

The separate original charter document remains unrecovered, but the raw Ravel conversation does contain direct role assignments:

- `638d13ba-1541-483d-853f-3b6d04b9b1b2` (2026-09-07T22:30:51.036Z): Nathan names Ravel as “primary co-theorist.”
- `c5639160-5631-4373-90c2-68d7c4c022de` (2026-09-08T09:27:54.450Z): expands the remit to conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, methodological risk, specialization/tool workshops, data access, and coordination with Janus and other LLMs.
- `5590d70d-6525-42aa-9de8-5a7022b189f7` (2026-09-13T12:42:46.946Z): specifies an accuracy-first public record: do not try to convince; accurately state what version exists, when, what it means, and what evidence supports it so an independent reader can assess it.

### Controls read

At the opening main head `2da6974b3f1165959ca11b984232015ee8bbb920`:

| Control | Blob |
|---|---|
| `BEDROCK.md` | `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` |
| Steering Charter 2026-10-26 | `5f4263381afcb065e9062d5b5885593d0baa58db` |
| Three Paper Campaign 2026-10-26 | `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0` |
| New-instance onboarding | `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0` |
| Revival Rotation V3 | `90863a2a2b82b2d8e37ba1bd9f796389066f5409` |
| Revival Rotation V4 | `6761337dfcd0847226ee7baad84db0a9c496760a` |
| Thread-first rule | `e79707587914edb76afca1c32f9f4dad4d0324b7` |
| Navigation preflight | `ce8d8be6e07340eff1f0e06d66b762e8ae8da358` |
| Worker autonomy/handoff protocol | `7a21c87311d2c812209fa08fe50a4246c8b53761` |
| Shared-state write safety | `3a8695beb03ca8fe51ce3ee8fa52a9dec52ed1c5` |
| `STATE_OF_THE_THEORY.md` | `b5958a1056c2541f00ab4f3477d8acc32426cfe9` |
| Workflow Branching Map | `756c506780072591b2f48e22044f3368a57bfa7d` |
| Ravel README | `8830694ecaececece0c61ba8b0ae3b67a6ff3315` |
| Ravel STATE | `92a730d15a1f795526941fbb221f1adb74ac6835` |
| Ravel CONTINUITY | `89f35c3da5c3e418713353d875e3aad3b1c20ed4` |
| Ravel INBOX | `69eef9190f88cb677f615e47b40b2e4c6876e190` |

The current HsH main head was `2da6974b3f1165959ca11b984232015ee8bbb920`. The active Ravel draft PR #1133 was at head `30778c7fe7b1a45384d3bbceedd83d68a2be17c8` before this run's additive formalization.

The incoming Mercer :48 handoff `2026-11-01T1948Z_from_s4_to_s0_ravel.md` was read. Its report of a failed earlier PR #1133 merge-ref build was superseded by the later successful build recorded below. The handoff created no task or ownership transfer.

### Mersearch and fallback boundary

All four Mersearch request files were occupied, staged, or unreleased: lane 1 Morrow request, lane 2 optics request, lane 3 staged but not dispatched under the shared bridge, lane 4 Tern request. No request was opened, overwritten, or retried. No local Mersearch executable or three-root checkout was present in this runtime.

The fallback used the materialized raw Ravel Library export and read-only GitHub search/fetch across HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES. This is a bounded source recovery, not a completed Mersearch run or an exhaustive three-repository search. Math Hopper and the existing equation pipeline were inspected; Math Hopper remains extraction-oriented, and the existing Ravel Lean PR was extended. No new tooling, dependency, fork, or paid service was created.

## 3. Raw Ravel source cluster: geometry and force

Primary raw export:

- Conversation ID: `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`
- Title: `🎼 Ravel [H(s)H] Syncmathcek`
- Library export: 12,408,770 bytes
- SHA-256: `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`
- Git-blob SHA-1 of the materialized Library bytes: `17cfe3feb830f70009557d063482b35adba0834b`
- 2,394 mapping nodes; 2,044 nodes on the active parent chain; 145 active-branch user messages; 157 user-role nodes overall.
- HsH's archived mirror is a separate byte snapshot, blob `c49367b0faa424491e7b3520a034b9e44fe6897f`; the two snapshots are not byte-identical and are not merged here.

### Nathan Direct propositions

| Message | UTC | Direct proposition |
|---|---|---|
| `3d0ad680-51db-4c79-ad4a-9bbacada24ef` | 2026-09-07 07:46:38.573Z | Choose a spatial Kerr section and extend it along the filament; do not use the full 4D Kerr spacetime as the cross-section. The ER mouth opens to the current surface of simultaneity in the simplest proposed orientation; an inside-out possibility is noted. |
| `b9805319-9d77-4b43-874a-5af50c0b6ef7` | 2026-09-07 08:06:58.114Z | Corrects the assistant's f-boson-as-wave-on-an-object reading. Filament f-distortion and timesheet t-distortion are described as necessary mutual accommodation between two primitives as they exert force; “the force is the true primitive.” |
| `c0d7fc1c-dc72-4cc7-b2a0-1e2cb686be4e` | 2026-09-07 08:28:03.333Z | Tentatively maps Kerr core to Pauli exclusion, shell to a closed string, and shell deformation to string-vibration modes. The message is exploratory, not a derived equivalence. |
| `496a15ea-0263-459d-b815-908f52155b90` | 2026-09-07 10:06:12.842Z | Keeps three active representations distinct: a 3D Minkowski/block schematic with time, a full 4D bulk with dynamics at least in the intersectional surface/thickness, and an actual 4D view with a 3D slice. A 4D slinky and a tentative induction-current connection are proposed. |
| `62b85640-6a36-47b7-b064-94c97106f9b6` | 2026-09-10 14:43:07.491Z | Says not to presume which Kerr structure supports the proposed mode; asks for a 3D construction, its 4D translation, shell dynamics, and measurements. |
| `b5b86a1c-9e0a-4ff5-8fcd-6f16f67c8953` | 2026-09-10 15:05:29.300Z | Explicitly requests retrieval and critique of archived filament-tension calculations rather than an off-the-top-of-the-head value. |

Raw-export timestamp correction: the JSON `create_time` values are UTC. The September 10 request/measurement messages above are at 14:43Z and 15:05Z; an earlier report rendered these as 06:43Z and 07:05Z, an eight-hour conversion error. This report uses the raw export's UTC timestamps.

### Assistant translations and fidelity findings

- Assistant `8de36fe2-ae17-434e-8272-2bd893d268b1` (2026-09-07 07:47Z) collapses the Kerr core, ER neck, flaring surface, and current timesheet into one connected 4D geometry and writes a candidate product \(W_0\simeq\Sigma_{\rm Kerr}\times\mathbb R_\tau\). The product, constant fiber, and nested topology are assistant reconstruction, not direct equations.
- Assistant `a794da96-ed3e-4c3c-b301-5b80f38b1636` (2026-09-07 08:07Z) renders the force idea as \(F\mapsto(\delta_f,\delta_t)\), but adds “conservation” constraints and says unilateral change is incomplete. Nathan Direct supplies no conservation equation or response operator. Those additions must not be attributed to him.
- Assistant `9e36cf0e-6d48-4eca-93df-e6e99600b516` (2026-09-07 10:06Z) calls the three representations “gauges” and writes \(P(\tau)=W\cap\Sigma_\tau\) and \(W\cap\Delta\Sigma_\tau\). No gauge group or gauge-equivalence map is defined. The positive-thickness timeslab dimensional issue is already recorded in existing issue #1142; it is not reissued here.
- Assistant `b14f2c80-8eac-4280-b62a-dc2342ff0f83` responds to the later “do not presume” request by separating standard Kerr anatomy, possible response modes, and measurement. This is a useful methodological response, but it does not establish an HsH/Kerr equivalence.

The direct statement simultaneously calls filament and timesheet “two primitives” and force “the true primitive.” Whether force is an underlying relation, a third primitive, or a shorthand for coupled response remains unresolved. The assistant's one-geometry collapse and its \(F\mapsto(\delta_f,\delta_t)\) diagram are candidate translations, not source-defined mathematics.

## 4. Archived SAT-O source genealogy

### 4.1 SAT4D live draft and O1

`SATOBLOC/SAT4D_LIVE_DRAFT.txt`

- Git blob: `2a79fe25018cce7e99a2c33786d88b0551db6ae7`
- Document header: byline Nathan McKnight; date June 2025.
- Archive file index contains multiple copies with June 8 and June 9 timestamps. The file is a composite: a later appended collaboration section has a placeholder byline. Do not treat every appended section as one homogeneous authorship layer.

The early core describes a primarily static block with localized adjustments induced by the sweep of \(\Sigma_t\). Elsewhere, the O1 module introduces an action and a tension potential:
\[
S[\gamma]=\int d\lambda\,L(\gamma,\dot\gamma),\qquad
L=\tfrac12 m\dot\gamma^\mu\dot\gamma_\mu-V_{\rm tension}(\gamma).
\]
No constitutive form for \(V_{\rm tension}\) is supplied there. The static-block principle and the later internal-tension/vibration language are distinct version/mode claims that need reconciliation.

`SATOBLOC/SAT O1 4D.txt`

- Git blob: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`
- Archive index: a June 7, 2025 copy and a later June 9 copy.
- No byline in this text file.

It describes a 1D filament \(\gamma:\mathbb R\to\mathbb R^{3,1}\), then calls the “worldtube” the 4D volume swept out by the vibrating filament. The text supplies no 3D cross-section, family of filaments, normal-bundle map, or sweep map that turns the 1D image into a 4D region. This is a type gap, not a proof that a finite-core tube is impossible.

The later Nathan Direct spatial-Kerr-section instruction is a possible route to a 3D fiber over a 1D base, but the embedding and transport are not defined in the direct message.

### 4.2 SAT-O5

`_AUTO_EXTRACTED_TEXT/SAT_O5.txt`

- Git blob: `7ebff56fe6b9ce5f46ab8a2e6d7c1ed7dbe15ec3`
- Extraction manifest: `2026-09-10_root_pdf_extraction_pass_002.json`
- Recorded source PDF SHA-256: `0380aaaee6eaa8a46dca8418ad248219908e94edbf3d97e50a7936c41321010d`
- Extraction requested by Ravel/ChatGPT on 2026-09-10.
- The PDF binary was not decoded or page-image inspected in this run. The text is a derivative extraction, not a claim of direct PDF reading.
- The archive index lists multiple SAT_O5.pdf copies with different June 3 and June 9 timestamps; the exact binary variant associated with the extraction hash remains unresolved.

Verbatim extracted equations:

\[
\ell_f=(2A/T)^{1/3},
\qquad
g^{-2}\sim\rho_{\rm link}\ell_f^2.
\]

The text calls \(A\) bending rigidity and describes \(\rho_{\rm link}\) as number of links per unit volume. It does not define the dimensional measure of that density or supply units for \(A\).

### 4.3 SAT-O8

`SAT_O8.txt`

- Git blob: `b5147fe08da0a65cb40e73365c71717aaad149ff`
- Archive file index: 2025-06-06 13:40:48 (timezone not specified).
- In-document author field is the placeholder `[Author Name]`; this is not authenticated Nathan Direct.

The file states:

\[
T\sim c^4/G,\qquad
\ell_f\sim(2A/T)^{1/3},\qquad
m_\psi^{(0)}\sim T\ell_f/c^2,
\]
and then gives:
\[
\ell_f\sim10^{-5}\,\mathrm m,\qquad
m_\psi^{(0)}\sim10^{22}\,\mathrm{kg},
\]
\[
Q_e\sim10^{53},\qquad Q_p\sim10^{49},\qquad
m_{\rm eff}=m_\psi^{(0)}/Q.
\]

The document says the \(Q_e,Q_p\) values are what is required to reproduce known electron and proton masses. Without an explicit linking/winding-to-\(Q\) map, these are required suppression factors or fit quantities, not independently derived topological predictions.

The O8 file does not define \(A\)'s units and does not provide a reproducible calibration calculation for the stated \(\ell_f\) and mass scale.

### 4.4 Base Units / SAT METRICS table

`Base units .txt` and `SAT METRICS — Basic.txt`

- Both have Git blob `6b0a0f6a45008e69262e702e6f3a5ba1e3921518`.
- They are byte-identical, not independent sources.
- No byline or reliable creation date was recovered.

Literal entries include:

- filament thickness \(\epsilon=2\times10^{-21}\,\mathrm m\);
- filament stiffness \(\kappa=1\times10^{-26}\,\mathrm{kg\,m^2\,s^{-2}}=1\times10^{-26}\,\mathrm J\);
- tension \(T\approx1.2\times10*44\,\mathrm N\), preserving the literal ambiguous `10*44` notation;
- order-1 coil radius \(\ell_f=0.7937\,\mathrm{fm}\);
- projection constant \(B\approx0.2387\,\mathrm{rad}\).

The table's \(\kappa\) is energy-dimensional, not the dimensionless \(\kappa=0.243(5)\) in the separate string-tension compilation. Neither is automatically the O8 rigidity \(A\).

The ratio between the O8 length claim and the table length is:

\[
\frac{10^{-5}\,\mathrm m}{0.7937\times10^{-15}\,\mathrm m}
\approx1.2599\times10^{10}.
\]

This is only a comparison of two archived values. It is not a physical measurement or prediction. If the values denote different versions or different meanings of \(\ell_f\), the ratio does not imply a physical contradiction. The later direct distinction between coil-radius \(\ell_f\) and core-thickness \(\epsilon\) makes the missing version map especially important.

### 4.5 Separate string-tension compilation and O8 audit composite

`SAT_NOT_MYSTICISM.txt`

- Git blob: `32227920da7ec1d08ef04c8ab3ba8a9a790108fb`
- Undated composite; its Module 3 section is internally dated version 1.1, 2025-06-20.
- Authorship of the entire compilation is unresolved.

It contains:
\[
\sigma=\kappa T,\qquad \kappa=0.243(5),
\qquad V(r)=\tfrac32\sigma r,\qquad
\alpha'=(2\pi\sigma)^{-1}.
\]
A later Regge-slope passage inserts \(T_{\rm lat}=0.180(5)\,\mathrm{GeV}^2\) and says to choose the “natural normalisation” \(\kappa=1\), without explicitly mapping that convention to the earlier \(\kappa=0.243(5)\). This may be a convention change, but the conversion is absent. The 0.243 coefficient is not the 0.2387-radian projection constant \(B\).

`EARLY LOGGED/Module_O8_Audit_Combined.txt`

- Git blob: `02f61b23af689edf33a989dac57f3b69dac621e9`.
- Composite audit/test artifact, not the primary `SAT_O8.txt`.

It combines a “no intrinsic tension, mass, or charge assigned a priori” assumption with the \(T\sim c^4/G\) tension formula, and its testing-instructions section adds \(A\sim T\Lambda^{-3/4}\). That \(A\)-\(\Lambda\) relation is not in the primary `SAT_O8.txt`; it must not be attributed to that module. Its dimensions depend on whether \(\Lambda\) means a cosmological constant (\(L^{-2}\)) or a vacuum-energy density (\(L^{-4}\)); the composite does not define the distinction.

### 4.6 Normative SAT-O directive

`SAT O Core Modules/SAT.O Official Directives.txt`

- Git blob: `167136310cdf33ca8f986f33634692314c1a0946`
- Dated July 2025.

The directive requires SAT-native quantities, forbids unstated assumptions, and classifies material outside the clean core as tentative. The O5/O8 formulas above should be treated as archived candidate equations until their dimensional definitions, derivations, and source genealogy are completed.

## 5. Dimensional audit

Use SI base dimensions \((M,L,\mathsf T)\). These are symbolic unit checks, not physical calculations.

### 5.1 Cube-root filament scale

The source equation
\[
\ell_f^3=2A/T
\]
requires
\[
[A]=[T]L^3.
\]

- If \(T\) is a force in newtons, \([T]=ML\mathsf T^{-2}\), then \([A]=ML^4\mathsf T^{-2}=\mathrm{N\,m^3}\).
- If \(T\) is force per length, \([T]=M\mathsf T^{-2}\), then \([A]=ML^3\mathsf T^{-2}=\mathrm{N\,m^2}\).

Conventional beam/rod flexural rigidity \(EI\) has dimension \(\mathrm{N\,m^2}\). Therefore the cube-root equation matches that conventional rigidity dimension only under the \(T=\mathrm{N/m}\) assignment. But the O8 relation \(T\sim c^4/G\) has force dimension \(\mathrm N\), and the Base Units table labels \(T\) in newtons.

This does not prove the source is wrong: \(A\) could be a nonstandard higher-order rigidity with units \(\mathrm{N\,m^3}\). It does prove that the source must define \(A\) and \(T\) consistently rather than moving between force and force-per-length interpretations.

### 5.2 Mass scale

The O8 formula
\[
m_\psi^{(0)}\sim T\ell_f/c^2
\]
has mass dimension if \(T\) is a force in newtons. If \(T\) is force per length, the same expression has mass-per-length dimension. Thus the mass formula supports the force interpretation, while a conventional \(EI\) interpretation of \(A\) in the cube-root formula supports force-per-length. No single assignment satisfies both without a nonstandard definition of \(A\) or a distinction between two different \(T\)'s.

### 5.3 O5 link-density coupling

For
\[
g^{-2}\sim\rho_{\rm link}\ell_f^2
\]
to be dimensionless, \(\rho_{\rm link}\) must have areal-density dimension \(L^{-2}\).

- spatial volume density \(L^{-3}\) leaves \(L^{-1}\);
- spacetime volume density \(L^{-4}\) leaves \(L^{-2}\);
- areal density \(L^{-2}\) gives a dimensionless product.

The source says “per unit volume.” It does not specify a 2D measure or supply another length factor. The density measure or the equation therefore remains incomplete.

### 5.4 Symbol collisions

- \(\kappa_{\rm table}\): energy dimension, \(10^{-26}\,\mathrm J\).
- \(\kappa_{\rm string}\): dimensionless \(0.243(5)\), later normalized to 1 in a separate passage.
- \(\kappa_g,\kappa_m,\kappa_s\): distinct Big Paper coefficients already audited in the 2026-10-31 coupling-scale report.
- \(A\): rigidity in O5/O8, units not defined.
- \(T\): force in the O8 \(c^4/G\) relation and Base Units label; another assistant audit glossary's force-per-length usage is not primary.
- \(\ell_f\): O8 transverse scale, Base Units coil radius, and later direct coil-radius use; version mapping missing.
- \(\epsilon\): core thickness, not interchangeable with \(\ell_f\).

No symbol identity or conversion is assumed.

## 6. Centerline versus finite-core worldtube: correction to the prior report

The earlier 2026-11-01T1224Z report used the phrase “not a codimension-three normal thickening of a 1D centerline.” That phrase was too strong and is superseded here.

The compatible dimension statements are:

\[
\dim(\text{centerline})=1,\qquad
\operatorname{codim}_{M^4}(\text{centerline})=3,
\]
\[
\dim(\text{rank-3 fiber over a 1D base})=1+3=4,
\qquad
\operatorname{codim}_{M^4}(\text{total tube})=0.
\]

A 4D total tube can therefore be a rank-3 normal thickening of a 1D centerline. The total tube is full-dimensional in the 4D ambient; the centerline remains codimension three. Those facts are compatible.

What is still missing is the actual normal-bundle or fiber embedding, the Kerr-section fiber family, and the map that carries it into the ambient 4D geometry. The arithmetic does not prove that Nathan's intended worldtube is such a bundle.

For a transverse time-slice \(\Sigma_t^3\):
- a 1D centerline intersects in a 0D event;
- a 4D finite-core tube intersects in a 3D section.

This preserves the distinction between the centerline and its finite core. The positive-thickness timeslab issue remains in existing issue #1142 and was not reissued.

## 7. Stable glossary

| Term | Type | Source status |
|---|---|---|
| \(\gamma\) | 1D filament/centerline in \(M^4\) | SAT4D/O1 document; direct 2026 wording varies |
| \(K_\lambda^3\) | Candidate 3D spatial Kerr section over a filament parameter | Nathan Direct 2026-09-07 |
| \(W^4\) | 4D finite-core worldtube / total space | SAT4D/O1 document and later direct clarification; construction map missing |
| \(\Sigma_t^3\) | Exact 3D time surface | Direct SAT descriptions |
| \(\Delta\Sigma_t^4\) | Positive-thickness 4D timeslab | Assistant reconstruction; do not substitute for \(\Sigma_t^3\) |
| \(\epsilon\) | Filament core thickness | Later direct source/table |
| \(\ell_f\) | Coil/transverse scale, versioned | O5/O8 and later direct usage; mapping unresolved |
| \(A\) | Rigidity in O5/O8 scale equation | Archived module symbol; units unresolved |
| \(T\) | Tension parameter | O8 says \(c^4/G\); unit assignment must remain explicit |
| \(\rho_{\rm link}\) | Link density | O5 says per unit volume; measure unresolved |
| \(Q\) | Mass-suppression/topological number | O8 postulate; topology-to-\(Q\) map absent |
| \(\delta_f,\delta_t\) | Filament and timesheet deformations | Direct conceptual language; response operator absent |
| \(F\) | Force primitive / interaction relation | Nathan Direct 2026-09-07; no tensor, vector, or constitutive law specified |

## 8. Mapping diagram: what is and is not established

```text
1D filament/centerline γ
        |
        |  candidate spatial Kerr section K^3 over γ
        |  [direct instruction; no bundle map]
        v
4D finite-core total space W^4
        |
        |  exact transverse intersection with Σ_t^3
        |  [dimensionally 3D if W is 4D]
        v
3D core section W ∩ Σ_t^3

filament state δ_f  <---- coupled response? ---->  timesheet state δ_t
                           ^
                           |
                     force F primitive
              [direct conceptual statement;
               no response operator or conservation law]

A, T  ---->  ell_f via (2A/T)^(1/3)
             [archived equation; units unresolved]

rho_link, ell_f  ---->  g^-2 via rho_link ell_f^2
                        [archived equation; density measure unresolved]

topological structure  ---->  Q  ---->  m_eff = m0/Q
                              [Q-to-topology map absent;
                               displayed Q values are required ratios]
```

The assistant's \(W_0\simeq\Sigma_{\rm Kerr}\times\mathbb R_\tau\), \(F\mapsto(\delta_f,\delta_t)\), and “conservation” additions are candidate reconstructions, not recovered source equations. No commuting diagram between Kerr section, filament/timesheet response, current, and observable has yet been established.

## 9. Lean 4 / Mathlib verification

Added to existing PR #1133:

`FORMAL_VERIFICATION/HsHVerification/RavelFilamentScaleDimensionAudit.lean`

### First build: dimensional and codimension core

- PR head at that build: `287689f22ab25a4df716ee265840e0f9b0760715`
- Module blob: `722acb4c53f655f5406b14a200f81b6f57987991`
- PR-head aggregator blob: `59b478bfcac5399e6d5dfb461a09178dbfbe22ff`
- Merge-ref aggregator blob: `0414455e1d18f2afaf2cec86bdf1c221995b0a2b`
- Actions run #41348147460; job #124972309257
- Merge checkout: `561ee0c661da76d94753257df81d45462fcbb340`, merging PR head `287689f...` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`
- Lean 4.34.0; Lake 5.0.0; 8,950 build jobs
- Build: SUCCESS

The module blob matched the PR head and was compiled. The merge aggregator differs from the PR-head aggregator because the merge base contributes additional imports. This was not an exact-head standalone checkout.

`#eval` actually ran and printed:

- force assignment requires \(A\): \((M,L,\mathsf T)=(1,4,-2)\), i.e. N·m³;
- force-per-length assignment requires \(A\): \((1,3,-2)\), i.e. N·m²;
- spatial volume density times \(\ell_f^2\): \(L^{-1}\);
- spacetime volume density times \(\ell_f^2\): \(L^{-2}\);
- areal density times \(\ell_f^2\): dimensionless.

The concrete dimension theorems and the centerline/tube codimension compatibility theorem report no axioms. The generic `cube_root_scale_condition` theorem reports `[propext, Classical.choice, Quot.sound]`. This first-build log contains zero `sorryAx` and zero `admit`.

### Additive extension: SI dimension of \(c^4/G\)

A further theorem `c_four_over_G_has_force_dimension` was added to the same existing PR branch:

- Current PR head: `d8579403952ca658cf5dd0547e8c181701d18145`
- Current module blob: `0fb4cdb424f436227b5dfcf3de3bed5f403d6253`
- Second Actions run #41348936553; job #124974692430
- Merge checkout: `a1bc462a1bfd1b8f79610ffd81c02dca800b381f`
- Lean 4.34.0; Lake 5.0.0; 8,950 build jobs
- Build: SUCCESS

The module blob matches both the current PR head and the merge checkout. The merge aggregator blob is `0414455e1d18f2afaf2cec86bdf1c221995b0a2b`, different from the PR-head aggregator because the merge base contributes additional imports. This remains a merge-reference build, not an exact-head standalone checkout.

The second build's `#eval` printed the \(c^4/G\) dimension \((1,1,-2)\), i.e. force, followed by the cube-root and density dimensions listed above. The new `c_four_over_G_has_force_dimension` theorem reports no axioms. Across the new module, all 11 concrete theorems report no axioms; the generic `cube_root_scale_condition` reports `[propext, Classical.choice, Quot.sound]`. The second-build log contains zero `sorryAx` and zero `admit`.

Tests, lint, nanoda, and the separate automated axiom-audit action were skipped in the successful first build. Lean verifies only the formalized exponent arithmetic and rank arithmetic; it does not establish the source translation, the physical meaning of \(A,T,\rho_{\rm link},Q\), or any physical premise.

PR #1133 remains OPEN / DRAFT / UNMERGED. No new PR was created.

## 10. Publication, inbox, and operational disposition

Existing issue #1202 is the appropriate public source/holdout thread. This run adds an additive source-genealogy comment there; no duplicate issue is created. The comment's exact body hash and readback are recorded in `publisher_status.json` and the rotation receipt.

The incoming Mercer :48 handoff was consumed in the Ravel repository inbox. An optional Orson context packet is stored in the Common handoff area and Orson inbox; it creates no task, response obligation, ownership transfer, or P1 cognition reassignment. No ChatGPT cross-thread delivery or acknowledgment is claimed.

- Existing :00 task remains enabled and unchanged.
- No sixth task or scheduler change.
- No Mersearch request opened or overwritten.
- No BEDROCK or theory-branch modification.
- No physical calculation, fit, independent measurement, or CODATA scoring.
- No SAT-O/Blockwave equation correction or promotion.
- No paper gate advanced: November 9 P1, November 30 P2, and December 14 P3 remain separate.
- Orson's protected cognition remit remains untouched.
- FIE rereview is not due; last full review October 27.
- Unrelated reading advanced: `TheTANGLE.txt` lines 1241–1280; next 1281. The separate `fun break - lx.txt` cursor remains 181.
- No signet, chat rename, or new tooling.

## 11. Next deeper cursor

1. Recover the raw source conversation or author record for O5/O8 \(A,T,\ell_f,\rho_{\rm link}\) and the exact O5 PDF variant.
2. Define the units and constitutive meaning of \(A\) and \(T\); keep force and force-per-length cases separate.
3. Establish whether O8's \(10^{-5}\,\mathrm m\) \(\ell_f\) and the later \(0.7937\,\mathrm{fm}\) coil radius are different versioned quantities; provide a map if so.
4. Recover an explicit topological construction \(Q=\mathcal Q(\text{linking/winding data})\), or retain \(Q_e,Q_p\) as required fit factors rather than predictions.
5. Define the measure of \(\rho_{\rm link}\) and the missing scale in the O5 coupling formula.
6. Define the 1D centerline-to-3D Kerr-section fiber embedding and its slice-preserving map into \(W^4\).
7. Define the coupled force/filament/timesheet response operator without importing the assistant's conservation assumptions.
8. Keep the Kerr/Pauli/string analogy tentative; require explicit maps and independent observables before equivalence claims.
9. Reconcile the 2025 static-block description with the same draft's tension/vibration language and the 2026 mutual-accommodation statement.
10. Do not run a physical prediction or advance a paper gate until the source-defined geometry, units, and observable map are fixed.

**Final classification:** substantial archived source family recovered; dimensional gaps and version conflicts identified; conditional Lean core compiled; the added \(c^4/G\) dimension theorem remains pending verification; source-to-physical maps remain incomplete; no physical claim or theory promoted.

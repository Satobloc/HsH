# Ravel | Filament-tension source genealogy, dimensional audit, and Kerr-core geometry fidelity

**Run key:** `REVROT3-19-20261011:524:s0`  
**Nominal slot:** 2026-11-01 20:00 UTC  
**Selected ring label:** Ravel, index 17  
**Next ring label:** Orson Vay, index 18  
**Disposition:** `SOURCE_GENEALOGY_RECOVERED / LEAN_CORE_COMPILED / LATEST_C4_OVER_G_EXTENSION_PENDING / NO_PHYSICAL_PREDICTION / NO_THEORY_PROMOTION`

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

A conditional Lean 4/Mathlib module was added to the existing Ravel PR #1133. Its initial dimensional and centerline/tube theorems compiled successfully at a merge reference. A subsequent small extension adds the SI identity \([c^4/G]=\mathrm N\); that latest extension is committed to the same draft PR but its Actions run is still in progress at checkout, so that one theorem is **SUBMITTED_NOT_VERIFIED**. No physical prediction, fit, CODATA score, or theory promotion follows.

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

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

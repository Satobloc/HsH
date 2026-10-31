# Ariadne Review-MIND | Cross-Lane Addendum 01: Aharonov–Bohm Comparator
**2026-10-31 | Public-source QC | No theory promotion**

## Scope

A late :24 Loom result was independently reviewed because it contains a real measured-system comparator, a Lean theorem, and a proposed map between local current structure and global holonomy. This addendum is cross-lane QC, not an assignment to Loom or Aster.

## Experimental source and independence

The comparator is the 1986 electron-holography experiment using a toroidal ferromagnet shielded by superconducting and copper layers. The two cited APS papers by the same research group describe the same experimental program/apparatus; they are two publications, not two independent experimental replications.

The PRA abstract reports relative phase classes of 0 or π below the superconducting transition and flux quantization in units (h/(2e)). The accessible abstracts do not expose the raw phase series, leakage measurements, or a numerical uncertainty budget. No residual or significance calculation is justified from the available source.

Using exact SI defining constants:
[
Phi_0=rac{h}{2e}=2.06783384846192932308111541214749734017154565493432355224324	imes10^{-15} mathrm{Wb}.
]
For an electron, the standard AB phase is (Deltaphi=ePhi/hbar). At (n) superconducting flux quanta, (Deltaphi=npi) modulo (2pi). This reproduces the reported phase classes. It is a standard-QM comparator, not an H(s)H prediction.

## Blockwave source attribution

The original raw conversation was independently fetched. The user-role message immediately preceding the relevant action asks for the full action and definitions. The displayed equations are in the following assistant-role message, timestamped 2025-10-19T12:29:46.538Z:

[
A_mu=alpha_*
abla_mu	heta,qquad
F_{mu
u}=
abla_{[mu}A_{
u]}.
]

These equations are assistant-authored in that raw exchange, not Nathan Direct. The separately attached `🧱BLOCKWAVE.txt` artifact has an internal “Nathan McKnight” label, but its embedded turn/author provenance is unresolved. Its first extant HsH path commit is repository ingestion, not proof of original composition date.

## Geometry and missing map

For a sufficiently smooth globally real-valued phase and constant (alpha_*), the local exterior-calculus identity (d(alpha_*d	heta)=0) is standard. A circle-valued phase on a multiply connected exterior can have nonzero periods while its local curvature vanishes. The AB experiment demonstrates the standard physical possibility of local field exclusion with nontrivial global phase holonomy.

This does not derive the Blockwave action's local (F_{mu
u}J^{mu
u}) term into a global loop period. The timesheet trace and a meridian loop around a codimension-two core are distinct cycles until an explicit projection/relative-chain map is specified. The normalization of (alpha_*), exterior topology, current conservation, boundary conditions, and singular-product regularization remain open.

Loom's candidate (J_2:=iota_u J_3) is a proposal, not a recovered source equation. Its claimed closure would require conditions such as (dJ_3=0) and (mathcal L_uJ_3=0), plus an explicit domain/codomain and pullback/composition map. No physical equivalence is asserted.

## Lean and branch audit

The theorem `ab_phase_for_quantized_flux` is present in the current PR #759 head's `LoomSAT4DCurrentTypeGate.lean`, not in a separately named AB module. It formalizes only the algebraic identity (q(n,2pihbar/(2q))/hbar=npi).

Exact-head CI run #41194990361 succeeded on head `834396a18bcec0d12c788f57049a17be1d29b4ec`, merge commit `72b3e989c82883447ffd6199ead4bff8c0d12dd9`, Lean/Mathlib 4.34.0, 8,951 build jobs. The complete retrieved log contains no `sorryAx`; theorem-specific dependencies are `propext`, `Classical.choice`, and `Quot.sound`. Tests, lint, nanoda, and the separate automated axiom audit were skipped. The PR remains draft and unmerged.

Documentation mismatch: current PR #759 is titled for embedded NotebookLM authorship spans and its current branch is `research/loom-embedded-notebooklm-span-20261027t1512z`. The original issue #1146 body still carries an older AB-specific branch label/head. The theorem is present in the current PR head, but the issue's branch label is stale. No PR or issue was edited in this Ariadne run.

The new Loom public submission issue #1147 is distinct from the earlier exact-phase issue and its published file was independently read back with exact content equality to the internal report. No duplicate was created.

## Handoff timing

Loom's optional handoff was appended to Aster's inbox after the Aster :36 run had already started. Repository presence is verified; Aster's consumption is not established.

## Epistemic status

- **Measured:** 1986 electron-holography phase classes and superconducting flux quantization, as reported in the cited abstracts.
- **Calculated:** exact SI flux quantum and standard AB phase relation.
- **Formalized:** algebraic phase identity in Lean.
- **Proposed:** Blockwave-to-holonomy/current map.
- **Not established:** H(s)H derivation, physical equivalence, independent experimental replication, or an action-level bridge.

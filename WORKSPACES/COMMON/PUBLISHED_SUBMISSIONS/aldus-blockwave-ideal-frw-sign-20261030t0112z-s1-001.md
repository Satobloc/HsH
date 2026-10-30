# Aldus | Blockwave Ideal scalar sign and 2025 review provenance | 2026-10-30T01:12Z

**Status:** SOURCE-CRITICAL / EXACT SYMBOLIC AUDIT / FORMAL PROOF SUBMITTED, NOT PHYSICAL VALIDATION. Source-grounded current-assistant Aldus specialty, not authenticated original Aldus conversation. No data-free physical system or invented measurements.

## Original sources and distinct witnesses

1. HsH `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT--Blockwave Ideal Model.txt` (actual filename uses an em dash), Git blob `dd0631bc0b25c951dc5e1d6738280e08487b46b2`. Lines 96-104 display `+ f^2/2 * partial_mu(theta) partial^mu(theta)` in the minimal action. Lines 383-405 specify `ds^2=-dt^2+a(t)^2 dvec{x}^2`, but then print `pi_theta=+a^3 f^2 theta_dot` and `H_theta=+pi_theta^2/(2a^3 f^2)+a f^2 |grad theta|^2/2+a^3 V(theta)`. File was ingested into Git at `6e4415f62616b19ae5cb677984c85d1985834d9d` on 2026-10-08T02:42:49Z; this is NOT an original creation or first-public timestamp.
2. HsH `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/25.10.19...Full action definitions -- raw.json` (full native filename includes Unicode separators), Git blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`. Native-role user message `f77f769e-8e74-4def-b4c9-bced0edbb8bc` at 2025-10-19T14:49:49.631Z submits a positive-sign scalar kinetic action for review. Assistant response `68759291-9b8b-473f-81e4-08f563a15d0b` at 2025-10-19T14:50:59.140Z calls the **negative-sign** scalar kinetic term standard, silently changing the sign relative to the supplied equation. The same assistant response already notices the local exact-gradient `F=dA=0` issue and the cosine/half-angle potential identity. Do not claim these older observations as new. Raw export entered Git at `12bb502527e78a347e27e2b0eb5598f354ef2be1` on 2026-10-10T01:26:41Z.
3. Related historical action family: `BLOCKWAVE EXTENSION .txt` blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, line 32, and `BLOCKWAVE.txt` with the brick-symbol prefix, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, line 15, also print positive-sign scalar gradients. These are related historical textual witnesses, NOT independent physics confirmations.

The first 2025-10-19 native-role user request `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a` asked the assistant to supply the action; the assistant response `121d607d-53e7-4b5a-8a7a-75d7e09deb3d` synthesized it from retrieved files. Nathan's later user-role re-paste is a verified request for review, not proof of original authorship of each equation. The earliest original file creation/upload and first public feature-specific exposure T0 remain UNRESOLVED. Prior Aster, Calder, Loom, and Mira source audits established the family distinctions and 2025 retrieval chronology; this packet does not claim those discoveries.

## Exact source-to-equation consistency result

Use the document's own flat FRW metric with signature (-,+,+,+), spatial scale factor a>0, real f != 0, v=theta_dot, q=|grad theta|^2, and V=mu^4(1-cos theta). These are **symbols**, not fitted physical inputs.

```text
L_source = a^3 [ (f^2/2)(-v^2 + q/a^2) - V ]
         = -a^3 f^2 v^2/2 + a f^2 q/2 - a^3 V
pi_source = dL_source/dv = -a^3 f^2 v
H_source = pi_source*v - L_source
         = -pi_source^2/(2a^3 f^2) - a f^2 q/2 + a^3 V
```

The document instead prints `pi_printed=+a^3 f^2 v` and `H_printed=+pi^2/(2a^3 f^2)+a f^2 q/2+a^3 V`. Thus **the displayed Lagrangian and displayed canonical Hamiltonian do not follow from one another under the displayed metric**. A negative scalar-gradient Lagrangian would produce the printed positive canonical expressions, but that is a possible repair branch, NOT an authorized silent correction. The full coupled theory may add constraints/mixing; this isolated source-sign contradiction does not prove an instability of the complete physical theory.

**Both-direction check:** metric + displayed Lagrangian -> negative canonical terms; printed positive canonical terms -> opposite scalar kinetic-sign branch. Source-equation equivalence FAILS for nonzero modes without an explicit convention or correction.

## Executed checks and formal boundary

- 11/11 JavaScript source-content, role, timestamp, and blob assertions PASS against two original Git files.
- 4/4 SymPy 1.14 exact symbolic identities PASS; the Python script was actually executed, without arbitrary numerical fixtures. Script on draft branch: `WORKSPACES/ALDUS/CODE/ideal_scalar_sign_audit_20261030.py`.
- Draft Lean PR #1059 stacked on existing Aldus #982: `FORMAL_VERIFICATION/HsHVerification/AldusBlockwaveIdealSign.lean`. Four conditional theorems encode the momentum disagreement, time Legendre identity, kinetic-sign reversal, and strict negative isolated kinetic term for positive K and nonzero momentum. Compilation must be checked against actual exact-head CI; Lean does not validate source authenticity or physics.
- No new physical calculation, measured dataset, experimental fit, new mechanism, BEDROCK promotion, scheduler edit, or historical-chat delivery.

## Paper gates and next cursor

P3 Dec 14: list the historical scalar-sector kinetic convention as an explicit unresolved branch, with raw equation, metric, derived momentum and printed Hamiltonian side-by-side; do not silently flip signs. P2 Nov 30: do not use the historical canonical scalar energy as a validated positive-energy premise until a consistent current source, constraints, physical observable and real data are established. P1 Nov 9: Orson cognition remains protected; this is an archived source-transmission example, not an administered LLM trial.

Next: independently inspect Lean CI #1059 and axiom reports; seek any later source-authenticated correction explicitly selecting a kinetic-sign convention; compare subsequent canonical sectors without merging distinct historical action families; retain unresolved first-public T0 and creation date.

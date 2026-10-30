# Nadir Voss — Frame-Connection and Blockwave Extension Audit Addendum
**Observed:** 2026-10-30T17:53Z  
**Nominal slot:** 2026-10-30T17:12Z  
**Run key:** `REVROT3-19-20261011:473:s1`  
**Selection:** Nadir Voss (ring index 10); next scheduled identity: Enheduanna (index 11).  
**Disposition:** internal source/math audit only. No theory promotion, no physical prediction, no new branch/PR/issue, no Lean-proof claim.

This addendum supplements `WORKSPACES/NADIR_VOSS/2026-10-30T1712Z_WORLDLINE_TIMESHEET_READOUT_RECOVERY.md` (blob `bf1864c7cbf13fbde9834bba8ced829e3dcae336`). The original report remains intact.

## 1. Provenance boundary

The selected name is a rotation result, not evidence of access to an authenticated historical Nadir thread. The Nadir workspace README identifies the playground as assistant-authored and records that no original Nadir role-message UUID has been recovered. Treat this as a source-grounded continuation in the Nadir lane, not a claim that the historical Nadir instance participated.

The source hierarchy relevant to this addendum is:

- Nathan-direct geometry: the May 2025 raw conversation `Fundamental Physics Explanations`, blob `9bcd42a355d05ebbbe6b6edec9744d1409d0cfd9`, including user messages `2b40efe6-8d75-4c33-a4c0-cf24c0d80e93` and `b1c8c059-6882-473d-aad7-dad1e3d67a15`; the July 2026 raw conversation `Reasoning with SAT-HSH`, blob `b7868607d89f66bbc0e638398182fb2d6b2da2ce`, including user messages `f8e3ca00-4edc-4ad2-a1c7-6c1f4c37b2f4` and `898814a5-46c1-4e87-9e7c-f8d65d9e31b3`; and the direct 2026-10-29 clarification file, blob `933d09e802bb98f2fd4f932b2d342f412f5bf718`.
- Nathan-attributed historical draft: `SAT4D_LIVE_DRAFT.txt`, blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`, whose header names Nathan McKnight and June 2025 and marks it an internal draft. This is document-level attribution, not a raw user-role message.
- Unattributed or assistant-derived material: `🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, begins “Here’s a single, compact action…” and is an assistant-style synthesis; `SAT—Blockwave Ideal Model.txt`, blob `dd0631bc0b25c951dc5e1d6738280e08487b46b2`, has no author/date metadata; `BLOCKWAVE EXTENSION .txt`, blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, is a distinct 1+1D draft with no authenticated Nathan-direct authorship.
- `SATOBLOC/SATOBLOCK_inputs.txt`, blob `ee08d8a6f5f187847914442f5971c7e2ed8cecd7`, is a NotebookLM-style source guide, not primary evidence. Its calibration anchors and semi-empirical mass formula are not used as measured inputs or accepted predictions.

The July 2026 user statement is particularly important: the core remains a worldline/line with thickness and a spacetime surface; fields are not the core ontology, while field-like behavior enters the EM interaction through Kelvin vortices in a BEC-like medium. The 2026-10-29 direct clarification separately fixes the four-dimensional worldtube and three-dimensional timesheet, and says the optional normal 2-plane/circle support in the Nadir playground is not the whole 3D core.

## 2. Minimal typed architecture and readout

Use distinct typed objects rather than one overloaded “filament”:

- (M^4): ambient four-dimensional geometry. Keep the all-plus HsH candidate and the Lorentzian SAT4D/Blockwave drafts as separate signature branches until an explicit map is selected.
- (W^4\subset M^4): finite-core worldtube/support.
- (Sigma^3_\tau\subset M^4): a family of three-dimensional timesheets.
- (B^3_\tau=W^4\cap\Sigma^3_\tau): generic three-dimensional tube section.
- (gamma^1): optional centerline/worldline reduction; (gamma^1\cap\Sigma^3_\tau) is generically zero-dimensional.
- (S^2): optional spacetime surface/bridge or selected core substructure; (S^2\cap\Sigma^3_\tau) is generically one-dimensional.
- (U): optional responsive medium. A medium vortex worldsheet (V^2\subset U), if defined, has a one-dimensional trace (V^2\cap\Sigma^3_\tau).
- (O): the still-undefined observation/readout map from the geometric section and any medium response to measured observables.

The dimension check is decisive: (4+3-4=3), (2+3-4=1), and (1+3-4=0), assuming transverse intersections. Thus the assistant synthesis’s shorthand (gamma=W\cap\Sigma) cannot mean a loop if (W) is Nathan’s four-dimensional tube. A loop is the generic trace of a two-dimensional surface on a three-dimensional timesheet.

This also gives a type-compatible, but not yet source-proven, interpretation of the Blockwave two-form current: (J^{\mu\nu}) could represent a medium vortex worldsheet (V^2), rather than the four-dimensional core (W^4) or a one-dimensional worldline (gamma^1). That reading fits the direct statement that Kelvin vortices belong to the EM-responsive medium, not to the core ontology. Do not silently identify the Nadir optional 2-plane, a core surface (S^2), and a medium vortex sheet (V^2); they remain distinct until a source-defined map relates them.

For a known sheet family, define (R_\Sigma(W)(\tau)=W\cap\Sigma_\tau). Then
[
\bigcup_\tau R_\Sigma(W)(\tau)=W\cap\left(\bigcup_\tau\Sigma_\tau\right).
]
Full sheet coverage recovers the support (W) as a set. Incomplete coverage recovers only the covered part. Even full support recovery does not reconstruct the frame, core profile, internal surface, or medium. If the downstream observation map (O) is non-injective, its information loss cannot be repaired by a later inverse. Composition is (O\circ R_\Sigma), or (O\circ R_U\circ R_\Sigma) when an explicitly defined medium-response map (R_U) is added.

A smooth compact phase with (A=\alpha\,d\theta) gives (F=dA=0) away from defects. A vortex interpretation can make (F) distributional on a defect worldsheet, but that requires a defined singular/finite-core calculus and a normalization for the defect current. The product (F_{\mu\nu}J^{\mu\nu}) also needs a finite-core regularization if both factors are supported on the same defect. This is a plausible interface, not a derived Blockwave law.

## 3. Nadir SO(4) sandbox: a connection-type correction

Relevant assistant-authored sandbox sources:

- `WORKSPACES/NADIR_VOSS/PLAYGROUND_001_STACKED_HOLONOMY_REPAIR.md`, blob `a9e8798df8873e98574ce9271ec05c91892210f5`. It first notes that an arbitrary (A\in\Omega^1(M,\mathfrak{so}(3))) is not generated by the object (line 112), then defines (E=(e_1,e_2,n_1,n_2)), (Omega=E^T dE\in\mathfrak{so}(4)), (F=d\Omega+\Omega\wedge\Omega), and (H[C]=\mathcal P\exp\oint_C\Omega\in SO(4)) (lines 221–237).
- `WORKSPACES/NADIR_VOSS/PLAYGROUND_003_CARTAN_SIM4_BACKBONE.md`, blob `4d812ac3b7aa59071614717bfd884b65becc2ee0`, gives the candidate readout metric (g=\delta-2u^\flat\otimes u^\flat) (lines 178–190).

**Conditional proposition.** If (E:S\to SO(4)) is a globally single-valued orthonormal frame, then (Omega=E^{-1}dE=E^T dE) is pure gauge and obeys the Maurer–Cartan identity
[
d\Omega+\Omega\wedge\Omega=0.
]
Its full (SO(4)) holonomy around a closed loop is therefore the identity. Nontrivial induced geometry can still exist, but it belongs to the projected tangent and normal connections, not to the full pure-gauge frame connection. In a tangent/normal block decomposition,
[
\Omega=
\begin{pmatrix}
\omega_T & -B^T\\
B & \omega_N
\end{pmatrix},
]
the mixed block (B) is the second fundamental form. Flatness of the full ambient connection yields the Gauss–Codazzi–Ricci relations; in one common sign convention, (F_T=B^T\wedge B), (F_N=B\wedge B^T), and (D B=0). The projected tangent/normal holonomies can be nontrivial even though the full ambient frame holonomy is trivial.

Therefore the current (H[C]\in SO(4)) formula needs one of three explicit choices: (i) replace (Omega) by the projected tangent or normal connection; (ii) specify a nontrivial bundle with transition functions/monodromy and local frames; or (iii) use a genuinely independent connection, while acknowledging the extra primitive. The present text does not yet make that choice. If (E) is only locally defined, nontrivial global holonomy is possible, but the transition data must be written down.

The gauge-invariant object is the conjugacy class of a closed-loop holonomy in the chosen subbundle. For a frame gauge (G), (Omega\mapsto G^{-1}\Omega G+G^{-1}dG) and (H\mapsto G(p)^{-1}HG(p)). Comparing loops at different basepoints still requires a connector or a common frame. The geometry-to-equation direction is the embedding (X:S^2\to\mathbb R^4) yielding the induced metric, (B), (omega_T), and (omega_N). The inverse requires Gauss–Codazzi–Ricci compatibility and is unique only locally up to ambient Euclidean isometry and frame gauge; global topology can add obstructions.

### Symbolic check retained

This was a generic frame-map test, not a physical fixture or an embedded-universe model. With (E(\theta,\phi)=R_{12}(\theta)R_{23}(\phi)\in SO(4)), SymPy gave:
- full (F_\Omega=0);
- the first (2\times2) projected block (F_T=\begin{pmatrix}0&-\sin\phi\\\sin\phi&0\end{pmatrix}d\theta\wedge d\phi);
- the second (2\times2) projected block (F_N=0) for this chosen frame.

The computation supports the type distinction; it does not prove a physical mapping or compile a Lean theorem.

The Nadir signature bridge is also only a candidate. If (\delta(u,u)=1) and (g=\delta-2u^\flat_\delta\otimes u^\flat_\delta), then (g(u,u)=-1), (g\) is Lorentzian with eigenvalues ((-1,+1,+1,+1)), and
[
P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u^{(g)}_\nu
=\delta^\mu{}_\nu-u^\mu u^{(\delta)}_\nu.
]
Thus the Blockwave Lorentzian unit-flow projector can be represented as the Euclidean orthogonal projector onto (u^\perp), provided this derived metric and its connection are explicitly adopted. This is not a Wick rotation and is not yet a source-derived physical law.

## 4. Separate Blockwave Extension Legendre-sign refutation

This is an additional audit of the distinct 1+1D `BLOCKWAVE EXTENSION .txt` draft, not a repeat of Aldus’s already-published Ideal-Model FRW sign audit.

Under the file’s stated ((-+)) convention and its own (H=\pi\dot q-L), the displayed (psi)-sector is
[
L_\psi=\alpha(-\psi_t^2+\psi_x^2)
+\beta\sin^2\theta(\sinh\psi\,\psi_t+\cosh\psi\,\psi_x).
]
The canonical momentum and shifted momentum are
[
\pi_\psi=-2\alpha\psi_t+\beta\sin^2\theta\sinh\psi,
\qquad
\Pi_\psi=-2\alpha\psi_t.
]
The actual Legendre transform is
[
H_\psi=-\frac{\Pi_\psi^2}{4\alpha}
-\alpha\psi_x^2
-\beta\sin^2\theta\cosh\psi\,\psi_x.
]
The draft instead prints positive (+\Pi_\psi^2/(4\alpha)+\alpha\psi_x^2) terms. For (\alpha>0), the pure quadratic kinetic and gradient terms have the opposite sign from the claimed positive Hamiltonian.

The (	heta)-sector makes the same problem visible. With
[
A=-1+2\lambda\cosh^2\psi,\quad
B=2\lambda\sinh\psi\cosh\psi,\quad
C=1+2\lambda\sinh^2\psi,
]
one has (\pi_\theta=A\theta_t+B\theta_x) and
[
H_\theta=\frac{(\pi_\theta-B\theta_x)^2}{2A}
-\frac{C}{2}\theta_x^2+V(\theta).
]
For the draft’s stated (\lambda\ge0) and (A<0) “positivity” condition, (C>0), so both displayed quadratic contributions are non-positive, not positive. This refutes the printed positivity inference under the draft’s own sign convention; it does not by itself refute all Blockwave/SAT constructions.

This calculation is algebraically derived and symbolically checked, **not Lean-compiled**. Aldus’s separate Ideal-Model sign audit is already recorded at `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-blockwave-ideal-frw-sign-20261030t0112z-s1-001.md`; exact-head CI run `#40985335092` built successfully. Do not duplicate or conflate that result with this distinct Extension calculation. The Loom UV audit remains the controlling status: no FRG/fixed-point/all-loop UV-completion claim is established.

## 5. Lean boundary and existing compiled evidence

Existing, unrelated-but-relevant algebraic modules were actually built by GitHub Actions:

- `NadirCycleHolonomyTyping.lean`: exact-head run `#40990019212`, job `123849889813`, successful build (8,950 jobs).
- `BraidPermutationVsHolonomy.lean`: exact-head run `#40992150303`, job `123857058479`, successful build (8,944 jobs).
- Aldus’s Ideal-Model sign module: run `#40985335092`, job `123834914915`, successful build (8,955 jobs).

The Nadir modules establish algebraic representation/holonomy distinctions, not the worldtube readout or the pure-gauge proposition above. In all three runs the separate automated `nanoda`/axiom-audit step was skipped; do not claim an axiom-free project. No Lean compilation was performed for the new (E^{-1}dE) or Extension Legendre-transform propositions. Status: **ANALYTIC/SYMPY CHECKED; LEAN PENDING**. No new branch or PR was opened while the Code Grurple interlock remains active.

## 6. Unrelated-reading cursor correction

Source: `HSH_RESOURCES/HISTORICAL/BABBAGE—DECLINE OF SCIENCE.txt`, blob `fa52e41f` (same source path/version as the prior Nadir receipts).

Verified prior high-water sequence:
- 2026-10-29 22:12Z: lines 166–220, next 221;
- 2026-10-30 02:00Z: lines 221–270, next 271;
- 2026-10-30 05:48Z: lines 271–320, next 321;
- 2026-10-30 13:24Z: lines 321–430, next 431.

The 17:12Z report’s lines 141–180 / next 181 entry regressed behind this verified cursor and is not accepted as the high-water mark. This run continued from the verified cursor, read lines **431–480**, and sets the next cursor to **481**. This was unrelated historical reading, not a FIE revisit. The last FIE review remains 2026-10-27, so the 14-day threshold has not been reached.

## 7. Control and publication status

- The live task graph remains `ACTIVE_SEED`; Tern remains its comptroller. No graph edit was made.
- Code Grurple remains active; ordinary research publication stays on hold. No new branch, PR, issue, theory promotion, or automation was created.
- Orson Vay’s protected P1 cognition remit and the Nov 9 gate remain untouched. The Nov 30 and Dec 14 gates were not advanced.
- No physical system, measured data, fit, or prediction was used in this addendum. The calculations above are conditional geometry/algebra checks only.
- The completed Mersearch lane-4 request `alberr-sat-o-worldline-timesheet-interbraid-20261030-1212` remains the source-recovery receipt (15,592 files, 20,809,012 records, 3,276 hits, 444 source paths). All four shared lanes were occupied; no new Mersearch request was launched or overwritten.
- The new results remain **not submitted to the public issue-publisher**. Existing receipts and the original 17:12Z report remain unchanged.

# Ravel | Source-fidelity and helion-equation adjudication

**Review timestamp:** 2026-11-01 23:06 UTC  
**Mode:** MANUAL PRE-SLOT / OBSERVED-UTC-HOUR FALLBACK  
**Deterministic :48 selection:** h=527, seq=2639, 2639 mod 19 = 17 → Ravel; ring-next = Orson Vay.  
**Important:** the actual scheduled :48 nominal fire is 23:48 UTC. This note is a pre-slot continuation, not a claim that the scheduled occurrence has fired, completed, or generated a canonical V3 receipt.

## 1. Executive result

Two separate source-fidelity findings were reconciled:

1. Nathan's September 7 direct wording about an "induction current connection within the timesheet thickness" is a qualitative, explicitly tentative geometric/physical idea. It is not a defined current operator, conservation equation, constitutive law, or map from worldtube geometry to an electromagnetic observable.
2. The immediate assistant elaboration introduced explicit intersection/readout formulas and an "induced closure" construction. Those are assistant reconstructions, not Nathan Direct equations. The next direct user turn asks whether measurements can be put on components; it does not adopt the assistant's formulas.

Separately, Ravel's published helion report contains a source-convention error in the displayed A(Q²), B(Q²) equations. The accepted Camsonne et al. manuscript explicitly gives the equations already corrected by Mercer in the existing publisher issue #1202, comment #6563109997. The original published snapshot should remain immutable; this note records the internal correction. No new public issue is warranted.

No new physical calculation, fit, prediction, Lean module, PR, branch, or manuscript change was made.

## 2. Ravel historical-source provenance

### Raw conversation recovered

- Title: 🎼 Ravel [H(s)H] Syncmathcek
- Conversation ID: `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`
- Materialized Library export: `🎼 Ravel [H(s)H] Syncmathcek — raw (2).json`
- Materialized bytes: 12,408,770
- SHA-256: `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`
- Git-blob SHA-1 of those materialized bytes: `17cfe3feb830f70009557d063482b35adba0834b`
- Mapping entries: 2,394
- Active current-node ancestry: 2,044 nodes
- The September 7 target message is on the active parent chain.

The raw Library export and the older HsH raw mirror are not byte-identical; treat them as two snapshots, not independent conversations.

### Direct user messages relevant to the current readout question

| Message | UTC | Status and content |
|---|---|---|
| `3d0ad680-51db-4c79-ad4a-9bbacada24ef` | 2026-09-07 07:46:38.573 | Nathan says to choose a spatial Kerr section and extend it along the filament; not to use the full 4D Kerr spacetime as the cross-section of another 4D object. The ER-mouth interpretation is proposed with an explicit alternative. |
| `b9805319-9d77-4b43-874a-5af50c0b6ef7` | 2026-09-07 08:06:58.114 | Nathan directly corrects the assistant: filament f-distortion and timesheet t-distortion are necessary mutual accommodation as the two primitives exert force; "the force is the true primitive." No constitutive equation is supplied. |
| `c0d7fc1c-dc72-4cc7-b2a0-1e2cb686be4e` | 2026-09-07 08:28:03.333 | Kerr core / exclusion and shell / string-mode correspondences are explicitly exploratory (e.g. "I'm thinking", "~"). |
| `496a15ea-0263-459d-b815-908f52155b90` | 2026-09-07 10:06:12.842 | Nathan distinguishes three representations: reduced Minkowski/block schematic, full 4D bulk with dynamics at least in intersectional surface/thickness, and actual 4D with a 3D slice. He says the intersectional geometry is traced by "something like an induction current connection within the timesheet thickness", explicitly hedged by "I think", "whatever it might be", and "something like". |
| `b14ff47e-3eea-42b5-9e8d-750821a0dc21` | 2026-09-07 10:21:03.658 | The next direct user turn asks: "Can we put measurements on any of the components?" This continues the investigation but does not adopt an equation or typed current map. |

### What must not be attributed to Nathan Direct

The immediate assistant response (message `9e36cf0e-6d48-4eca-93df-e6e99600b516`) expands the qualitative idea into:

- (P(\tau)=\mathcal W\cap\Sigma_\tau);
- (P(\tau)=\mathcal W\cap\Delta\Sigma_\tau);
- an open/coiled 4D filament plus "timesheet-thickness induction closure";
- a closed induced/current circuit;
- (f\)-distortion ↔ (t\)-distortion as a representation table.

Those are assistant-generated mathematical/diagrammatic reconstructions. The raw user message contains no (P(\tau)) equation, no set-intersection operator, no normal-bundle construction, no current density, no gauge/connection definition, and no conservation law.

The later assistant code derives Kerr-scale and frequency values from CODATA constants after the user asks whether the components can be measured. Those calculations depend on additional assumptions (including a closed-shell mode propagating at (c)); they are not direct user measurements or a validated H(s)H readout.

### Faithful source boundary

A defensible restatement is:

> Nathan proposed, tentatively, that intersectional geometry might be traced by something like an induction-current connection inside a finite-thickness timesheet. The filament and timesheet distortions were elsewhere described as mutually accommodating under force. The exact carrier, domain/codomain, current definition, conservation conditions, and map to a measured electromagnetic observable remain unspecified.

This preserves the intuition without promoting the assistant's elaboration to source authority.

## 3. Existing geometric formalization: scope check

Existing Ravel PR #1133 remains OPEN / DRAFT / UNMERGED. Its scope is a conditional set-level carrier/slice/pullback model. It does not define the missing physical readout (R_t), a constitutive current, or an empirical response law.

The existing module's abstract pullback/intersection results do not prove that the qualitative "induction current" exists, is conserved, has a particular tensor degree, or produces measured charge/current.

Existing PR #993 remains OPEN / DRAFT / UNMERGED. Its `RavelHelionJLabE04018DataGate.lean` formalizes Table II magnitude data and finite arithmetic checks. It does **not** encode the source equations A(Q²) and B(Q²).

Therefore the successful merge-ref builds of #993/#1133 do not verify the equations printed in the Ravel helion report.

No exact-head compilation is newly claimed in this note; no Lean was run and no code changed.

## 4. Helion cross-section source-convention correction

Ravel's published report `WORKSPACES/RAVEL/2026-11-01T0836Z_WORLD_TUBE_TO_EM_READOUT_AND_HELION_HOLDOUT_MATRIX.md`, §4, currently prints:

[
A=F_C^2+\frac{2}{3}\tau F_M^2,
\qquad
B=\frac{4}{3}\tau(1+\tau)F_M^2.
]

Those do not match the accepted manuscript's stated spin-1/2 (^{3}\mathrm{He}) convention.

Camsonne et al., *JLab Measurements of the (^{3}\mathrm{He}) Form Factors at Large Momentum Transfers*, Phys. Rev. Lett. 119, 162501 (2017), DOI 10.1103/PhysRevLett.119.162501, accepted manuscript (dated September 5, 2017; published October 19, 2017), gives:

[
A(Q^2)=\frac{F_C^2(Q^2)+\mu^2\tau F_M^2(Q^2)}{1+\tau},
\qquad
B(Q^2)=2\tau\mu^2F_M^2(Q^2),
\qquad
\tau=\frac{Q^2}{4M^2}.
]

Primary source:
- https://link.aps.org/accepted/10.1103/PhysRevLett.119.162501

The accepted manuscript explicitly shows (B(Q^2)=2\tau\mu^2F_M^2(Q^2)) and (A(Q^2)=[F_C^2(Q^2)+\mu^2\tau F_M^2(Q^2)]/(1+\tau)). It also defines (	au) and presents the reduced-cross-section relation in terms of (mu^2\tau/\epsilon).

APS also lists an associated Publisher's Note / Erratum, PRL 119, 209901 (2017), published November 14, 2017. Its full PDF could not be retrieved in this review. This note therefore records the accepted-manuscript comparison and the already published Mercer correction; it does not independently adjudicate the complete text of the Publisher's Note.

### Existing public correction (do not duplicate)

Mercer already posted the source-convention correction to the existing publication issue:

- Issue #1202: https://github.com/Satobloc/HsH/issues/1202
- Comment #6563109997: https://github.com/Satobloc/HsH/issues/1202#issuecomment-6563109997
- Comment SHA-256 recorded by Mercer: `61fc57ab1fe7cc5da9029fd920e709ddb66cac0686ea1c47d415254276dd78cb`.

That comment correctly states:
- the Ravel report's printed A/B expressions do not match the accepted manuscript as written;
- an alternate normalization would require explicit definitions and a conversion map;
- PR #993's table gate does not encode A/B;
- no H(s)H response map, fit, prediction, or physical conclusion follows.

The original published issue artifact is immutable. This internal note is an additive cross-lane record only. No duplicate publisher issue/comment was created.

## 5. Empirical limits retained

The helion system remains an identifiable real experimental system: Jefferson Lab Hall A E04-018, Camsonne et al. 2017. The original Ravel report correctly notes that the published tables provide extracted form-factor magnitudes and marginal uncertainties, but the full covariance/normalization matrix was not recovered. Therefore a global covariance-aware fit or prediction score is not currently reconstructible from the report's tabulated marginal errors alone.

No recalculation, fit, target fitting, new prediction, or physical inference was performed here.

The geometry-to-current map (R_t) remains unresolved. The source hypothesis is not a physical law.

## 6. Controls and disposition

- Code Grurple remains ACTIVE; ordinary HAGALAZ theory work remains BACKSEAT/HOLD under the publication interlock.
- Orson retains P1 cognition ownership.
- P1 November 9, P2 November 30, and P3 December 14 remain separate.
- No BEDROCK promotion.
- No SAT-O or Blockwave equation modification.
- No new physical calculation, data fixture, fit, human-subject trial, model inference, manuscript change, Lean module, branch, PR, tool, Mersearch request, publisher issue, or scheduler task.
- Existing :48 task ID/schedule/phase remain unchanged.
- This is a pre-slot manual source/QC note. It is not a canonical scheduled :48 execution receipt and does not claim scheduler completion.

## 7. Next research boundary

Before any future (R_t) formalization, recover or obtain Nathan's explicit intended mathematical typing, or an original source equation with an exact SHA/date/provenance. The minimal questions are:

1. What is the carrier space/domain of the proposed current?
2. Is the "connection" a differential-geometric connection, an induced current, a circulation, a flux, or only a descriptive analogy?
3. What are its tensor degree, units, orientation and support?
4. What conservation or boundary condition is intended?
5. What is the actual map to the measured (^{3}\mathrm{He}) electromagnetic response, (F_C), (F_M), or raw cross sections?

Until those are answered from primary source or explicit authorization, keep (R_t) UNDEFINED / SOURCE-AND-TYPING-REQUIRED rather than filling it with an assistant reconstruction.

---
*Prepared as a bounded internal Review-MIND source/QC addendum. It does not promote any theory claim.*

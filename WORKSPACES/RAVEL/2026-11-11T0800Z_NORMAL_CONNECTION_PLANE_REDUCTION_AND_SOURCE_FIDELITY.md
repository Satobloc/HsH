# Ravel h752 | Normal-connection plane reduction and source fidelity

**Run key:** REVROT3-19-20261011:752:s0  
**Nominal slot:** 2026-11-11T08:00Z  
**Deterministic selection:** Ravel (ring index 17); next label Orson Vay (index 18).  
**Status:** New conditional geometry crosswalk established; component-level Lean formalization added to existing PR #1133; CI was in progress at report submission. No physical law, H(s)H prediction, or theory promotion is claimed.

## 1. Source authority and continuity

The Ravel label is a deterministic routing selection, not an authenticated current ChatGPT instance or thread. No current Ravel thread was authenticated. A manually authorized successor titled “Finite Tube Holonomy Result” is referenced in an archived Orson conversation with candidate conversation ID 6acb8e00-61b4-83e9-a128-ed07e9b22b7b, but its present usability was not verified. The connected browser did not provide an accessible originating context. The separate “Ravel Free Build” export was not treated as the successor.

No standalone Nathan-authored Ravel specialist charter was recovered. The historical remit is grounded in direct user messages 638d13ba-1541-483d-853f-3b6d04b9b1b2 and c5639160-5631-4373-90c2-68d7c4c022de in the Ravel conversation family. Those messages establish primary co-theorist support, conceptual cohesion, drift detection, epistemic hygiene, methodological-risk review, and measurement/observable triangulation. The current Lane 00 instruction is an execution-specific source-fidelity overlay.

The existing Ravel h744 report on local/global conversion was read and reused, not repeated. Morrow’s prior three-representation report and Tern’s open-carrier holonomy audit were also retained as existing work.

## 2. Primary-source geometry

The source cluster is the role-authenticated September 7, 2026 Ravel conversation family, conversation ID 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f.

Relevant direct user messages:

- 8471543a-6ed1-4743-9073-74735f019da4, 2026-09-07T07:39:29.865Z: describes a 4D extension of a worldtube with a Kerr cross-section.
- 3d0ad680-51db-4c79-ad4a-9bbacada24ef, 2026-09-07T07:46:38.573Z: clarifies that the construction should use a spatial Kerr section extended along the filament, not the full 4D Kerr spacetime as the cross-section of another 4D object.
- b9805319-9d77-4b43-874a-5af50c0b6ef7, 2026-09-07T08:06:58.114Z: identifies filament-side and timesheet-side distortions as mutually accommodating and calls force the primitive.
- 496a15ea-0263-459d-b815-908f52155b90, 2026-09-07T10:06:12.842Z: distinguishes a reduced 3D Minkowski/worldworm representation, a full 4D bulk representation, and an actual 4D view with a 3D slice. It tentatively describes an induction-current connection within timesheet thickness.

The direct source does not define the dimension, metric, embedding, or boundary conditions of the spatial Kerr section. It does not provide a fiber-transport equation, a force law, or a map identifying the 3D slice with the timesheet. The induction-current language is a proposed interpretation, not a recovered equation.

The public HsH archive contains distinct raw snapshots for this conversation family. The shorter SAT_CONVOS_13 snapshot has Git blob c49367b0faa424491e7b3520a034b9e44fe6897f. The later SAT_CONVOS_18 raw (2) snapshot has Git blob 17cfe3feb830f70009557d063482b35adba0834b. A separate larger Library raw export was also read and contains the same direct message UUIDs; it is not claimed byte-identical to either repository snapshot.

## 3. Existing assistant-generated apparatus geometry

The Ravel sandbox SANDBOX_2026-10-11_FINITE_TUBE_HOLONOMY_NOISE_GATE.md, blob 410642ba5765bfb4394205ec733fd0396dbbd03f, defines an independently specified apparatus centerline

[
\gamma_t:S^1\rightarrow\Sigma_t
]

on a resolving hypersurface. Its finite-radius tube is an apparatus control, not the SAT worldtube. The sandbox explicitly distinguishes this ring orbit from the generic intersection of a finite 4D particle tube with a resolving sheet.

It chooses an oriented two-frame in a two-plane of the centerline’s normal bundle and defines a scalar connection and loop readout:

[
\omega_s=e_1\cdot\nabla_s e_2,
\qquad
\varphi_g=\frac{1}{2\pi}\oint_{\gamma_t}\omega_s\,ds
\quad (\mathrm{mod}\ \mathbb Z).
]

The companion MATERIAL_FRAME_ACTION_AND_LEAKAGE.md, blob 27efcf287fd3e5e4b8dcf6a33cead996dba20e32, derives an SO(2) normal-plane coupling for a prepared transverse angular mode. Its representation weight remains unresolved. The oscillator bath and material deformation are apparatus constitutive assumptions, not a derivation of gravitational or timesheet backreaction.

A reported “rank-3 PSD connection covariance” in the sandbox code is the rank of a covariance matrix. It is not the rank of the normal bundle.

## 4. New type-level crosswalk

There are at least three distinct geometric objects:

| Object | Support | Normal/connection structure |
|---|---|---|
| Ravel apparatus centerline | Closed 1D curve in a 3D resolving hypersurface | Rank-2 in-sheet normal plane; SO(2) connection |
| Candidate filament centerline in 4D | 1D curve in a 4D ambient manifold | Rank-3 normal complement; full group depends on the normal metric signature |
| Finite-core 4D support | Full-dimensional support in M⁴, for example a conditional 1D-parameter × 3D-section construction | Zero ordinary normal-complement rank in M⁴; internal/fiber transport is a different object |

If a smooth non-null 3D hypersurface \(\Sigma^3\) is embedded in \(M^4\) and a 1D curve \(\gamma\) lies within it, then the normal bundle has the conditional local splitting

[
N_{\gamma/M}\cong N_{\gamma/\Sigma}\oplus L_\Sigma,
\qquad 3=2+1,
]

where \(L_\Sigma\) is the line normal to the hypersurface. This is a bundle-type statement conditional on the embedding, non-null hypersurface, and compatible metric.

In a chosen frame, the three-component normal connection contains one in-sheet plane-rotation component and two components mixing that plane with the third normal line. The Ravel apparatus scalar \(\omega_s\) retains only the in-sheet component.

The full group depends on the normal metric signature: it is SO(3) for a positive-definite normal space, and SO(1,2) for a normal space of signature (-++). The source does not fix the causal type of every candidate filament, so SO(3) must not be promoted as a universal label. The selected in-sheet two-plane is SO(2) when it is positive definite.

The scalar readout captures the full reduced connection only if the two mixing components vanish, equivalently if the connection preserves the selected third-normal line. Otherwise the full three-component transport is not recoverable from one scalar integral. In a Euclidean SO(3) basis, the corresponding rotation generators are noncommuting; the Lorentzian generator signs depend on signature and convention.

This is the new fidelity result: the sandbox’s SO(2) apparatus holonomy is internally valid for its selected two-plane, but it is not automatically the full normal transport of a 4D filament. A connection-preserving reduction or explicit projection/transport map is required.

The alternative Kerr construction must remain separately typed. If a 3D spatial Kerr section \(K^3\) is extended along a 1D filament parameter, the conditional total support \(I\times K^3\) is 4D. That is not the same object as a 1D curve in M⁴ with a rank-3 normal bundle, nor the same as the apparatus tube. The source has not supplied the map between these representations.

## 5. Mapping diagram

```text
M⁴
├── Σ³ ⊂ M⁴  (local, smooth, non-null hypersurface)
│   └── γ_app : S¹ → Σ³
│       ├── N(γ_app/Σ) rank 2
│       ├── SO(2) in-sheet connection ω12
│       └── apparatus tube with D² transverse fibers
│
├── candidate γ¹ → M⁴
│   └── N(γ/M) rank 3
│       ├── in-sheet normal plane rank 2
│       └── hypersurface-normal line rank 1
│           └── two mixing connection components
│               └── SO(2) reduction only if the line is preserved
│
└── possible W⁴ = I × K³ support
    └── full-dimensional in M⁴
        └── ordinary normal complement rank 0
            └── requires internal/fiber transport, not a normal-bundle alias
```

Required maps are: the hypersurface inclusion, the normal-bundle splitting, the projection to the in-sheet plane, the connection-intertwining condition, and, separately, any spine/fiber map from a full worldtube to a centerline. None should be inferred from the word “tube” or from a visual analogy.

## 6. Force and primitive bookkeeping

The September 7 direct statement supports a relational primitive: a force/accommodation relation producing filament-side and timesheet-side distortions. It does not provide a conservation equation or a First-Law derivation. The historical assistant’s addition of conservation/First-Law language is stronger than the direct source.

A candidate layered reading is two geometric primitives (worldtube and timesheet) plus a relational force/accommodation primitive. This can coexist provisionally with the November 8 methodology’s separate question about whether a responsive medium is an additional state-bearing primitive. This is a bookkeeping reconciliation, not a settled ontology.

## 7. Original versus translated propositions

| Nathan Direct | Assistant reconstruction | Assessment |
|---|---|---|
| Spatial Kerr section extended along filament | Product/fiber extension with a chosen section dimension | Plausible proposal; dimension and embedding remain unspecified |
| Two geometries mutually accommodate; force is primitive | Adds conservation and First-Law constraints | Unsupported strengthening |
| Three distinct representations | Assistant introduces explicit intersection/readout maps | Maps are useful proposals, not direct definitions |
| Timesheet-thickness induction current is tentative | A scalar holonomy readout | Not yet derived from the direct force relation |
| Apparatus centerline lies in a resolving hypersurface | SO(2) normal-plane holonomy | Valid apparatus model; not automatically the full 4D filament connection |

The prior Morrow three-representation audit and Tern open-carrier/closed-holonomy audit are reused. This report adds the signature-aware normal-connection reduction and the explicit apparatus SO(2) versus full 4D three-component comparison.

## 8. Formalization

A new module, RavelNormalConnectionReduction.lean, was added to existing PR #1133, branch research/ravel-carrier-slice-reconstruction-20261031t0212z. The root HsHVerification aggregator imports it.

The formalized propositions establish:

- a one-component in-sheet readout is not injective on arbitrary three-component normal-connection data;
- it is injective on the reduced subspace where both mixing components vanish.

The module intentionally does not choose SO(3) versus SO(1,2), prove the smooth bundle splitting, derive a physical connection, or establish the source-to-apparatus map.

At report submission, CI run #42986393293 was IN_PROGRESS. No successful compile or executable result is claimed in this report. The existing PR remains OPEN / DRAFT / UNMERGED. A later receipt/comment must record the final run result. The local runtime has no Lean, Lake, or Elan executable; the existing GitHub Actions Lean 4/Mathlib pipeline is the reuse route.

## 9. Limits and next cursor

1. Fix the causal type and metric signature of the candidate filament and timesheet before naming the full normal-connection group.
2. Specify the non-null hypersurface embedding and the normal-line field.
3. Determine whether the physical object is a 1D filament centerline, a finite-core worldtube, or a 1D parameter times a spatial Kerr section.
4. Derive or constrain the two mixing connection components from the actual geometry rather than setting them to zero by convenience.
5. If an SO(2) reduction is intended, derive the connection-preserving normal-line condition and the representation weight from the transported finite-core state.
6. Keep the apparatus oscillator bath and material deformation separate from the provisional H(s)H responsive-medium primitive.
7. Reuse PR #1133 and its existing carrier/sheet and fiber-transport modules; do not create a duplicate theorem or branch.
8. Do not calculate physical couplings or make a physical prediction without an identifiable measured system, dataset, provenance, units, uncertainties, and prediction-versus-fit separation.

No physical calculation, data-free physical fixture, CODATA scoring, parameter fit, observational validation, independent measurement, paper advancement, BEDROCK promotion, or theory integration was performed.

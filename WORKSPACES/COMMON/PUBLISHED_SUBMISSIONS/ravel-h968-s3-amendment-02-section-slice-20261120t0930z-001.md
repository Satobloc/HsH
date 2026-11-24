# Amendment 02 | Distinguish the selected Kerr spatial section from the third representation's 3D slice

**Parent report:** [Ravel h968:s3, issue #2176](https://github.com/Satobloc/HsH/issues/2176), `ravel-h968-s3-kerr-worldtube-rotation-typing-20261120t0836z-001`.

**Scope:** source fidelity and geometric-object typing only. This amendment does not change the parent report's distinctions among Euclidean R4 rotation, standard Kerr spin and internal twist; its Lean result; its physical status; or P2/BEDROCK status.

## 1. Primary-source readback

The relevant original messages were inspected in the Library-held raw export for conversation `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f` (12,408,770 bytes; SHA-256 `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`). Each exact message object has `author.role = user` and `author.name = null`.

- **Message `3d0ad680-51db-4c79-ad4a-9bbacada24ef`** (2026-09-07 07:46:38.573Z) says standard Kerr is a four-dimensional spacetime solution and that the construction must choose “a spatial Kerr section” and extend that section along the filament. In the same message, the ER-bridge mouth is tentatively described as opening into the “current surface of simultaneity.”
- **Message `496a15ea-0263-459d-b815-908f52155b90`** (2026-09-07 10:06:12.842Z) distinguishes three representations and describes the third as “the actual 4-dimensional view, and our 3D slice of it.” That message does **not** call the third representation's slice a simultaneity slice, identify it with the selected Kerr section, or specify its foliation/embedding map.
- **Message `b9805319-9d77-4b43-874a-5af50c0b6ef7`** (2026-09-07 08:06:58.114Z) preserves the mutual-accommodation/force-primitive correction. It does not supply the missing section identity map.

The HsH raw snapshot `c49367b0faa424491e7b3520a034b9e44fe6897f` and the Library export above are separately recorded snapshots. This amendment does not assume they are byte-identical. Mersearch was not callable and all four request lanes were occupied; this was a bounded read of an already available raw source, not a Mersearch search result.

## 2. Correction

The parent report's phrase **“a 4D construction with a 3D simultaneity section”** is too specific when presented as a summary of message `496a15ea...`. The source-faithful wording is:

> The third representation is an actual 4D view together with “our 3D slice of it”; the slice-selection rule, embedding/projection, observer dependence, and relation to the timesheet are not specified in that message.

The nearby “current surface of simultaneity” phrase in message `3d0ad680...` concerns the proposed ER-bridge mouth. It does not, by itself, identify the later message's “3D slice” with that surface. Treating them as the same object is an **assistant interpretive hypothesis**, not a recovered Nathan Direct definition.

## 3. Required separation in the shape hierarchy

Keep two 3D referents distinct as source-level roles, without asserting that they must be physically different:

1. **Selected Kerr spatial section:** a section chosen from the standard 4D Kerr spacetime for the proposed filament construction. Nathan Direct explicitly requests such a choice, but does not specify its coordinates, foliation, metric pullback, or boundary conditions.
2. **Third-representation slice:** the “3D slice” of the actual 4D view. Its slice-selection rule, embedding/projection, observer dependence, and relation to the timesheet remain unspecified.

Both are three-dimensional in the source descriptions. Equal dimension does not establish object identity. No source-defined map between the two, inverse, equivalence, or shared foliation has been recovered.

The two source-grounded branches therefore remain:

`Kerr 4D spacetime → selected spatial Kerr section → filament extension → proposed worldtube`

and separately:

`actual 4D view → 3D slice (selection and map unspecified)`

A composition or identification between these branches is a test hypothesis. It requires an explicit map with domain/codomain, selection parameter, embedding/projection, induced metric, boundary conditions, observer dependence, and a specified relation to filament extension and readout. No Cartesian-product or foliation assumption is introduced here.

## 4. Formalization triage and limits

Existing [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133) and its verified `RavelSkewRotationKinematics` build remain unchanged. The existing quotient/readout work supplies a conditional fiber-constancy criterion; it does not instantiate either source-level section or prove an identity between them.

No new Lean theorem is justified until the source-defined maps and their types are supplied. No new Lean build is claimed. The source correction is not a proof that the sections cannot be related; it records that the relationship is presently unspecified.

No raw strain or other physical data were acquired. No fit, prediction, falsification threshold, independent measurement, new symbol, equation change, P2 selection, or BEDROCK promotion follows.

**Corrected status:** `SECTION_IDENTITY_UNSPECIFIED / “SIMULTANEITY_SECTION” = ASSISTANT_INTERPRETATION_NOT_DIRECT_SOURCE / NO_PHYSICAL_EQUIVALENCE_CLAIM`.

# Aldus h898:s0 | Amendment 01: correct Universal Indicatrix method-paper source locator

**Supersedes:** Section 4D of [the h898:s0 report](https://github.com/Satobloc/HsH/issues/1894) only.  
**Purpose:** correct the raw-conversation locator and attachment attribution. The original report and published artifact remain byte-identical to their original submission; this is an additive source-custody erratum, not a replacement report.

## 1. Correct method-paper source

The direct user request to present the Universal Indicatrix as a consensus-science method for finding short transformation/derivation routes is in:

- Conversation: `69ac33a1-440c-832b-9c11-0ffb99d06ee7`
- Title: `Universal Indicatrix Framework`
- Raw export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_16/26.03.07•26.09.12•Universal Indicatrix Framework — raw (1).json`
- Raw blob SHA-1: `11ce8622e4dd70cb3172d0a48d332f9ba3199c64`
- Direct user message: `bddd8eab-5d70-44ac-a4e0-3dbc41b2ff9d`
- Timestamp: 2026-03-07T16:31:17.970Z.

The same conversation first contains a request for a high-level scientific abstract, then the correction "Scalar-Angular Theory", then the instruction to make the paper a consensus-science method with simple and complex transformation examples. The assistant draft immediately follows at 16:31:18.293Z.

The complex example is described as a gauge-symmetry-to-gravitational-metric mapping previously worked out. That derivation is not contained in this UI source cluster and must be recovered separately. It is not established to be the March 6 SU(2)-lattice procedure.

## 2. Correct attachment attribution

The September 12 attachment in the method-paper conversation is:
- `Pasted text(20260912-204614).txt`
- Raw attachment metadata size: 20,767 bytes.
- Raw user message: `7eacf0c0-7f45-4395-948b-3085e1081b80`.

The similarly named attachment in the separate March 5 `LaTeX Formatting for Paper` conversation is:
- `Pasted text(20260912-204655).txt`
- Raw attachment metadata size: 20,767 bytes.
- Raw user message: `a32efc50-5884-4fed-a9f1-25614c9761ab`.

Both attachments were materialized as extracted-text representations. The two extracted texts are byte-identical:
- Extracted-text size: 20,015 bytes each.
- SHA-256: `0066d36c6bf3391233df7b43234b5afb1019984437fd616e468baf6ca160ae78`.

They are the **PAST THEORIST / FORMER INSTANCE CHECK-IN v3** survey prompt, not the method-paper draft. The earlier report's association of this attachment with the method-paper request is incorrect.

## 3. Distinct conversations sharing the same title

The source genealogy must distinguish at least these separate raw conversations:

| Branch | Conversation ID | Relevant source |
|---|---|---|
| LaTeX formatting / supplied draft | `69a8fea1-0fa0-8328-a51e-daf69b7a14b9` | March 5 user-supplied draft and formatting request; Sep 12 attachment is the check-in survey |
| SU(2) lattice procedure evaluation | `69aa403c-5238-8331-b108-3362747fc4d7` | March 6 user-supplied procedure, evaluation request and assistant numerical demo |
| Fixed/movable 4D grid | `69ab6f13-b8f8-832e-8d71-528c15e11037` | March 7 direct geometric construction, already crosswalked in issue #1244 |
| Method-paper reframing | `69ac33a1-440c-832b-9c11-0ffb99d06ee7` | March 7 direct method-paper request, message `bddd8eab-5d70-44ac-a4e0-3dbc41b2ff9d` |

The shared conversation title "Universal Indicatrix Framework" does not make these one thread or one mathematical object.

## 4. Corrected classification

- **UI-LATTICE:** March 6 user-supplied SU(2) lattice procedure; deeper document authorship unresolved.
- **UI-METHOD:** March 7 direct user-requested transformation/derivation method paper.
- **UI-GRID:** March 7 fixed/movable 4D grid construction in a separate conversation.
- **UI-FRAME:** later SO(4) scale-rotation assistant/NotebookLM reconstruction.
- **UI-READOUT:** current H(s)H readout/translation role.

No source-authorized equivalence or composition map is established among these versions. The method-paper request is direct; its underlying transformation metric, allowed operation set, equivalence relation, shortest-path algorithm and complex example derivation remain undefined or unrecovered.

## 5. Disposition

This amendment corrects only source genealogy and attachment attribution. It does not change the geometry findings, the formalization boundary, the absence of physical measurements, or the no-CODATA/no-theory-promotion status.

**Corrected status:** `H898_S0_AMENDMENT_01 / METHOD_PAPER_DIRECT_SOURCE_RECOVERED / CHECKIN_ATTACHMENT_IDENTIFIED / RAW_THREAD_IDS_SEPARATED / NO_NEW_LEAN / NO_PHYSICAL_CALCULATION`.

# Blockwave source-chain provenance amendment 01

**Related record:** [Hale He-3 tripartite raw-source fidelity addendum](2026-11-13T0000Z_HE3_TRIPARTITE_RAW_SOURCE_PROVENANCE_ADDENDUM.md), run key `REVROT3-19-20261011:792:s0`.

This is a source-attribution correction only. It does not change the recovered Nathan Direct geometry, the SAT-O equations, or any physical claim.

## Exact Blockwave artifact located

`DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`, HsH blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; first extant Git commit `6e4415f62616b19ae5cb677984c85d1985834d9d`, dated **2026-10-08T02:42:49Z**. The file has no in-file date. It opens with “BLOCKWAVE CLEAN ACTION” and the assistant-voice sentence “I’ve written it”, so it is an assistant-generated compact action, not an identified Nathan-authored original.

Verbatim definitions from that artifact:

`J^{\mu\nu}` is called the conserved two-form “filament worldsheet” current, with `\nabla_\mu J^{\mu\nu}=0`.

`F_{\mu\nu}(\theta)\equiv \nabla_{[\mu}A_{\nu]}(\theta)`, with `A_\mu(\theta)\equiv \alpha_*\,\nabla_\mu\theta`.

Its implementation note gives `J^{\mu\nu}=\tfrac12\,\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma` as one conservation representation.

These are preserved as assistant-generated source text, not promoted as Nathan Direct or an independently derived Blockwave action. The action also introduces an unspecified response kernel `\mathcal{M}^{\mu\nu}{}_{\rho\sigma}(\theta,u)` and contains visible index/LaTeX defects; no correction is silently substituted.

## Related derivative-source chain

| File | Blob | First extant commit | Provenance |
|---|---|---|---|
| `SATOBLOC/SATOBLOCK_inputs.txt` | `ee08d8a6f5f187847914442f5971c7e2ed8cecd7` | 2025-10-27T00:40:28Z; commit `b543eb3fbf16e50500ceadad83dc9a7dc0759e5b` | NotebookLM source guide, not primary derivation |
| `SATOBLOC/SATOBLOCK-LIVE.txt` | `1642375cf78647b9f35f1681d0bccb90685b2a48` | 2025-10-28T00:04:17Z; commit `f5cbe9aba986b39ace86c55a7bea53feb854445f` | 49-source NotebookLM synthesis |
| `SATOBLOC/SATO-BLOCK-INT.txt` | `2cd00dec3a8464dc303fe96f14ae71d7fcf8f31e` | 2025-10-28T00:04:17Z; same commit | Mixed user/NotebookLM transcript; equations in NotebookLM replies are not thereby user-authored |

The guide's `A_\mu(\theta)=\alpha_*\nabla_\mu\theta`, `m^2=k(N+\beta Q^2-a)`, `m_{\mathrm{eff}}=m_0/Q`, and `Q=L_{\mathrm{wind}}+L_{\mathrm{link}}+W_{\mathrm{writhe}}` remain guide-level equation witnesses, not verified originals.

The guide notes earlier conceptual maps using a three-form `J^{\mu\nu\rho}`, whereas the compact assistant action uses a two-form `J^{\mu\nu}`. No Hodge-dual, projection, or composition map connecting those typed objects is supplied here. Treat this as an unresolved translation/type obligation, not an automatic equivalence or contradiction.

## Adjacent SAT-O 2.0 Module O1 source

`SATOBLOC/SAT O1 4D.txt`, SAT archive blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; first extant commit `b543eb3fbf16e50500ceadad83dc9a7dc0759e5b`, dated **2025-10-27T00:40:28Z**. The file itself has no in-file date or author attribution. It is titled “SAT_O 2.0 Module O1: 4D Hyperhelical Filament Dynamics”.

Verbatim geometry and action witnesses:

`\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)`

`v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}`

`S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)`

`L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)`

The module defines `\gamma : \mathbb{R} \to \mathbb{R}^{3,1}` as a smooth one-dimensional filament and describes the worldtube as the 4D volume swept out by the vibrating filament. The displayed one-parameter curve alone does not construct that 4D support: no internal-mode/support map, thickening map, or parameterized sweep is supplied. Keep the centerline and the finite-core/worldtube as distinct types until such a map is defined.

The same historical module asserts a stable Hopf link for two filaments, a stable Borromean link for three, and no stable topological interlocks for four or more filaments in 4D. The file supplies no proof for these claims; they remain historical assertions, not established topology theorems, Lean results, or independent measurements.

## Limit

No direct-user-authored Blockwave action was recovered in this bounded pass. All four Mersearch request lanes remain occupied and their request-scoped manifests/receipts are absent; this is not an exhaustive three-repository Mersearch result. The original SAT-O Module 8-H and O9 equations and their dates remain in the related report. No corrected action, physical calculation, CODATA score, theory promotion, or paper-gate change is issued.
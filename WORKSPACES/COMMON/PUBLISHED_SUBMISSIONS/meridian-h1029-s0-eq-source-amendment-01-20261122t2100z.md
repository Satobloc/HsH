# Equation-source transcription amendment 01

This amendment corrects the equation-custody section of [the Gendarme Graticule source-fidelity audit](https://github.com/Satobloc/HsH/issues/2373).

The earlier report labeled its equation blocks "Verbatim core" but used ASCII transliterations. Those blocks were not verbatim source notation. The original files were not changed. This amendment supplies exact source LaTeX snippets and preserves malformed source tokens rather than silently repairing them.

## 1. SAT-O1 4D

Source: [SAT O1 4D.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt)

- Git blob SHA-1: 7577aa1ee5a6c3850ce3b226c75377de6367aedc
- SHA-256: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937
- FileIndex creation: 2025-06-07; last write: 2025-06-09.
- Attribution: unbylined historical formalization.

Exact source equations:

~~~tex
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)

v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}

S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)

L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)

\phi_i - \phi_j = \frac{2\pi k}{n}
~~~

The source prose calls the worldtube the four-dimensional volume swept out by the vibrating filament. The displayed one-parameter curve does not by itself construct that four-dimensional volume. This is a separate historical formalization, not a Gendarme Graticule map.

## 2. Blockwave Clean Action

Source: [Blockwave Clean Action](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%F0%9F%A7%B1BLOCKWAVE.txt)

- Git blob SHA-1: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d
- Attachment event: 2025-09-16T16:31:26.687Z.
- First extant Git commit: 2026-10-08.
- Attribution: assistant-voiced historical attachment, not Nathan Direct.
- SHA-256 withheld because prior custody records conflict; no digest is asserted.

Exact source definitions and equations:

~~~tex
g_{\mu\nu}

u^\mu u_\mu=-1

\theta\sim\theta+2\pi

P^\mu{}^\nu\!\equiv \delta^\mu{}^\nu+u^\mu u_\nu

\nabla_\mu J^{\mu\nu}=0

F_{\mu\nu}(\theta)\equiv \nabla_{[\mu}A_{\nu]}(\theta)

A_\mu(\theta)\equiv \alpha_*\,\nabla_\mu\theta

\oint A\cdot d\ell\in 2\pi\mathbb{Z}

J^{\mu\nu}=\tfrac12\,\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma
~~~

The initial prose writes the projector as P^\mu{}^\nu, with both displayed indices contravariant while the added term carries a lower nu index. This is preserved exactly as typed. Other projector/index tokens in the action are malformed in the source attachment; they are not repaired or normalized here.

## 3. Corrections and epistemic status

No corrected SAT-O1 or Blockwave equation is issued. The exact source snippets above supersede only the earlier report's ASCII transliterations. The source files remain unchanged.

No map from either historical equation family to the Gendarme Graticule is established. No physical calculation, Lean proof, or theory promotion follows from this transcription amendment.

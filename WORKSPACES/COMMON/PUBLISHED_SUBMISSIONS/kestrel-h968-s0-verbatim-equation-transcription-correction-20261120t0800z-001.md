# Kestrel h968:s0 | Amendment 01 - verbatim equation transcription

**Purpose:** Correct a transcription defect in the h968 workspace report and publisher submission #2173. The report's LaTeX code blocks were double-escaped by the report writer. This amendment supplies the exact single-backslash equation excerpts from the fetched source files. It does not change, repair, or reinterpret any source equation.

**Scope:** Equation transcription only. The analysis and source-status distinctions in the main h968 report remain unchanged. The original SAT-O1 and Blockwave files remain untouched.

## 1. SAT-O1 original

Source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SAT O1 4D.txt`

- Git blob: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`
- SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`
- FileIndex row 47: Created 10/26/2025 7:12:34 PM; Last Write 6/9/2025 6:44:50 PM; timezone unspecified.
- FileIndex row 631 records a second saved copy, created 10/27/2025 8:11:33 PM; Last Write 6/9/2025 6:44:52 PM. These are filesystem timestamps, not composition dates.
- The file is unbylined.

Exact source excerpt:

```tex
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)

v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}

S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)

L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)

\phi_i - \phi_j = \frac{2\pi k}{n}
```

## 2. Blockwave original attachment

Source: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`

- Git blob: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`
- SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`
- User-supplied attachment event: 2025-09-16T16:31:26.687Z. This is not a demonstrated composition date.
- The embedded prose is assistant-voiced.

Exact source equation excerpts:

```tex
u^\mu u_\mu=-1

P^\mu{}_\nu\!\equiv \delta^\mu{}_\nu+u^\mu u_\nu

\nabla_\mu J^{\mu\nu}=0

J^{\mu\nu}=\tfrac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma

A_\mu(\theta)\equiv \alpha_*\,\nabla_\mu\theta

F_{\mu\nu}(\theta)\equiv \nabla_{[\mu}A_{\nu]}(\theta)
```

The source action begins with `S \;= \; \int d^4x\,\sqrt{-g}\;[...]`. The file contains malformed tokens elsewhere, including `\nabla\alpha u_\mu` and `u^\mu u\mu+1`. Those malformed tokens are retained in the original; this amendment does not silently repair them.

## 3. Relationship to publisher submission #2173

- Original publisher issue: [#2173](https://github.com/Satobloc/HsH/issues/2173).
- Original submission ID: `kestrel-h968-s0-4dhh-action-domain-signature-ontology-20261120t0800z-001`.
- Original report SHA-256: `17f2f5728a60909a348d68b22a0f91ded351435cb0ab56678c30b71204f55eb3`.
- The original issue payload was internally SHA-consistent, but its displayed equation strings contained doubled backslashes. This amendment is the authoritative verbatim transcription supplement.
- No mathematical correction is proposed. No corrected SAT-O1 or Blockwave equations are adopted.

**Disposition:** TRANSCRIPTION_CORRECTION_ONLY / ORIGINALS_UNCHANGED / NO_EQUATION_REPAIR / NO_THEORY_PROMOTION.

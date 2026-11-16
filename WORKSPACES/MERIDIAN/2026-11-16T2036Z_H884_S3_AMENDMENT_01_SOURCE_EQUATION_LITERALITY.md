# H884:S3 Amendment 01 | Source-equation literalness

This amendment clarifies the source-custody wording in the published h884:s3 matrix. It does not change the P2 matrix, any physical model, or any equation.

## SAT-O1 exact source text

The SAT-O1 blob was fetched from the public SAT archive in this run. The exact source text is:

```tex
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)
v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
```

Source custody:
- Path: `SATOBLOC/SAT O1 4D.txt`.
- Git blob: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`.
- Existing source-ledger SHA-256: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`.
- File-index creation: 2025-06-07.
- Indexed modification: 2025-06-09 18:44:50, timezone unspecified.
- First extant archive commit: 2025-10-27T00:40:28Z.

The code block in the published report normalized some LaTeX delimiters and spacing. The source above supersedes that display transcription for literal reproduction. No corrected equation is proposed.

## Blockwave source status

The existing source ledger records:
- User-supplied attachment event: 2025-09-16.
- Attachment ID: `file-LwaFTKkMemPPrLU4qCLpYB`.
- Raw conversation-export blob: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`.
- Existing source-ledger SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`.

The attachment bytes were not independently reopened in this run. The Blockwave equation transcription in the published report is therefore carried forward from the prior source ledger, not newly revalidated here. No corrected equation is issued. The original attachment remains unchanged; no private HSH_RESOURCES payload was opened.

## Publication status

The original public artifact at issue [#1855](https://github.com/Satobloc/HsH/issues/1855) remains unchanged and its publisher readback remains valid for that original content. This amendment is a source-custody clarification, not a duplicate publication or a theory revision.
